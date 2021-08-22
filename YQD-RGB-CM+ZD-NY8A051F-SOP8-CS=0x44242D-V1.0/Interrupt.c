
#include "Interrupt.h"



unsigned char 	TimeCyc8bit, TimeCyc8bit1;				
unsigned char 	TimeUnitCnt0, TimeUnitCnt1, TimeUnitCnt2, TimeUnitCnt3, TimeUnitCnt4;
unsigned char	Time2200mS;
unsigned short	Time11840mS, Time55630mS;

//中断函数
void isr(void) __interrupt(0)
{

	if(PBIF)
	{
		PBIF 	= 	0;									//清中断
		if(KEY1 == KEY_ON)								//震动开关
		{
			TimeUnitCnt4 = 0;
			if(( CntKey2On < 255 ) && (C_PB4_Wakeup == (BWUCON & C_PB4_Wakeup))) { CntKey2On++; }
			if(CntKey2On == 1)		//触摸开启后震动才有效
			{
				if( KeyValue < DefGearMax )				//按键循环档位设置，KeyValue = 0 ~ 1
				{
					KeyValue++;
				}
				else
				{				
					KeyValue = 1;
				}
				KeyValueTemp = KeyValue;					// 保存档位
				ClearKeyData();
			}
		}
	}
	
	if(T0IF)											//Timer0中断
	{ 
		T0IF			=	0;							//清Timer0中断
		Init_Timer0_Isr();
		
		TimeCyc8bit++;
		Frequency100Hz();
		BreathingDisplay();								//呼吸显示
		PWMOutPut();

		TimeUnitCnt0++;									//每0.1mS累加一次
		if(TimeUnitCnt0 >= DefTimeUnitCnt0)				//10mS循环计时
		{
			TimeUnitCnt0		= 	0;
			TimeCyc8bit1++;

			TimeUnitCnt1++;								//每10mS累加一次
			if(TimeUnitCnt1 >= DefTimeUnitCnt1)			//1S循环计时	
			{
				TimeUnitCnt1	= 	0;					//计数清零
			}
		}
		
		TimeUnitCnt3++;
		if(TimeUnitCnt3 >= DefTimeUnitCnt3)				//0.5mS循环计时
		{
			TimeUnitCnt3		= 	0;
			if(KEY1 == KEY_OFF)
			{
				TimeUnitCnt4++;
				if(TimeUnitCnt4 >= DefTimeUnitCnt4)					//100ms/0.5ms=200
				{
					TimeUnitCnt4 = 0;
					CntKey2On = 0;
				}
			}
		}
	}
	
}