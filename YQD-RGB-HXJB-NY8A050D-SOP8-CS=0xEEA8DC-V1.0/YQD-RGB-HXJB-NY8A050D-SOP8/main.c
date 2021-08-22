/* =========================================================================
	程序型号:	YQD-RGB-HXJB-NY8A050D-SOP8-CS=0xEEA8DC
	功能说明：	上电渐变

NY8A050D-SOP8
	电源					VDD			-1-	-8-		GND							地
	BLED（BLED，低有效）	PB5			-2-	-7-		PB0/INT/SDI					RLED（RLED，低有效）	
	BLED（BLED，低有效）	PB4			-3-	-6-		PB1/SDO						RLED（RLED，低有效）
	GLED（GLED，低有效）	PB3/RST/VPP	-4-	-5-		PB2/EX_CKI/SCK				GLED（GLED，低有效）	
 =========================================================================*/
#include <ny8.h>
#include "NY8_constant.h"

#define     RLED							PB0           	//RLED（RLED，低有效）
#define     RLED1							PB1           	//RLED（RLED，低有效）
#define     GLED							PB2           	//GLED（GLED，低有效）
#define     GLED1							PB3           	//GLED（GLED，低有效）
#define     BLED							PB4           	//BLED（BLED，低有效）
#define     BLED1							PB5           	//BLED（BLED，低有效）

#define		DefReladNum		(unsigned char)(256 - 42)	  	//计算公式为:[1/(时钟源/分频器)]*(DefReladNum)*4T=[1/(8M/4)]*(256-(256 - 42)+8)*4= 0.5us*50*4 = 100uS
#define		DefTimeUnitCnt0			(100)					//循环计时(DefTimeUnitCnt0 * 0.1mS = 10mS)
#define		DefTimeUnitCnt1			(100)					//循环计时(DefTimeUnitCnt1 * 10mS = 1S)
#define		DefTime100Hz			100						//100Hz		1000ms/100=10ms	10ms/0.1ms=100	0.1ms进一次


#define		LED_ON					0					  	//LED点亮
#define		LED_OFF					1

#define			PwmPercent_100			100				//1*100=100
#define			PwmPercent_96			96				//0.96*100=96
#define			PwmPercent_80			80				//0.80*100=80
#define			PwmPercent_77			77				//0.77*100=77
#define			PwmPercent_75			75				//0.75*100=75
#define			PwmPercent_70			70				//0.70*100=70
#define			PwmPercent_65			65				//0.65*100=65
#define			PwmPercent_60			60				//0.60*100=60
#define			PwmPercent_55			55				//0.55*100=55
#define			PwmPercent_50			50				//0.50*100=50
#define			PwmPercent_40			40				//0.40*100=40
#define			PwmPercent_33			33				//0.33*100=33
#define			PwmPercent_30			30				//0.30*100=30
#define			PwmPercent_25			25				//0.25*100=25
#define			PwmPercent_20			20				//0.20*100=20
#define			PwmPercent_15			15				//0.15*100=15
#define			PwmPercent_10			10				//0.10*100=10
#define			PwmPercent_6			6				//0.06*100=6
#define			PwmPercent_5			5				//0.05*100=5
#define			PwmPercent_4			4				//0.04*100=4
#define			PwmPercent_1			1				//0.05*100=1
#define			PwmPercent_0			0				//0.00*100=0

unsigned char 	TimeCyc8bit = 0;				
unsigned char 	TimeUnitCnt0 = 0, TimeUnitCnt1 = 0;
unsigned char 	gPwmRDt = 0, gPwmGDt = 0, gPwmBDt = 0;
unsigned char	Time100Hz = 0;

unsigned char 	TempFlag = 0;
__sbit 				FlagRStart					= TempFlag : 0;	
__sbit 				FlagGStart	 				= TempFlag : 1;	

void 	Init_sys(void);
void	BreathingDisplay(void);
void	OutPwmR(void);
void	OutPwmG(void);
void	OutPwmB(void);




void 	Init_sys(void)
{
	DISI();												// 禁止所有中断
    INTF 			= 	0x00;							// 清除所有中断标志位
	//========================================================
	//初始化IO
	//========================================================

	PORTB  			= 	0;																			// 上电为高电平
    IOSTB  			= 	C_PB_Output;																// 设置为输入，1:输入, 0:输出（默认）
    BPHCON 			= 	0xFF;//(unsigned char)~(C_PB3_PHB | C_PB4_PHB);								// 端口B上拉0启用，0：上拉，1：取消上拉（默认）
    BWUCON 			= 	0;//C_PB3_Wakeup | C_PB4_Wakeup;											// 允许唤醒，1启用：

	TMR0 			= 	DefReladNum;				// 装载定时器0初始值
	T0MD 			= 	C_PS0_Div4;					// Timer0定时器预分频器设置不得低于4分频
	PCON1 			= 	C_TMR0_En;					// 开启Timer0

	INTE 			=  	C_INT_TMR0 | C_INT_PBKey;					// 允许Timer0中断  允许端口B输入状态变化中断 
	PCON 			= 	C_LVR_En | C_WDT_En;						// 允许LVR复位，允许看门狗复位
	ENI();															// 允许所有中断
}

void main(void)
{	
	Init_sys();

    while(1)
    {
        CLRWDT();                               	//清看门狗
    }
}


void	OutPwmR(void)
{
	if(Time100Hz < gPwmRDt)
	{
		RLED = LED_ON;
		RLED1 = LED_ON;
	}
	else
	{
		RLED = LED_OFF;
		RLED1 = LED_OFF;
	}
}

void	OutPwmG(void)
{
	if(Time100Hz < gPwmGDt)
	{
		GLED = LED_ON;
		GLED1 = LED_ON;
	}
	else
	{
		GLED = LED_OFF;
		GLED1 = LED_OFF;
	}
}

void	OutPwmB(void)
{
	if(Time100Hz < gPwmBDt)
	{
		BLED = LED_ON;
		BLED1 = LED_ON;
	}
	else
	{
		BLED = LED_OFF;
		BLED1 = LED_OFF;
	}
}
//中断函数
void isr(void) __interrupt(0)
{

	if(PBIF)
	{
		PBIF 	= 	0;									//清中断
	}
	
	if(INTFbits.T0IF)									//Timer0中断
	{ 
		INTFbits.T0IF			=	0;					//清Timer0中断
		TMR0 = DefReladNum;								//装载定时器0初始值
		
		TimeCyc8bit++;
		
		Time100Hz++;
		if(Time100Hz >= DefTime100Hz)
		{
			Time100Hz = 0;
		}
		OutPwmR();
		OutPwmG();
		OutPwmB();
		TimeUnitCnt0++;									//每0.1mS累加一次
		if(TimeUnitCnt0 >= DefTimeUnitCnt0)				//10mS循环计时
		{
			TimeUnitCnt0		= 	0;
			TimeUnitCnt1++;								//每10mS累加一次
			if(TimeUnitCnt1 >= DefTimeUnitCnt1)			//1S循环计时	
			{
				TimeUnitCnt1	= 	0;					//计数清零
			}
			BreathingDisplay();
		}
	}
	
}

void	BreathingDisplay(void)
{
	static unsigned char Count;
	Count++;
	if(Count >= 10)				//10*10MS=100MS
	{
		Count = 0;
		if(FlagRStart == 0)
		{
			if(gPwmRDt < PwmPercent_100)
			{
				gPwmRDt++;
			}
			if(gPwmRDt == PwmPercent_100)
			{
				FlagRStart = 1;
				FlagGStart = 0;
			}
			if(gPwmBDt > PwmPercent_0)
			{
				gPwmBDt--;
			}
		}
		else if(FlagGStart == 0)
		{
			if(gPwmRDt > PwmPercent_0)
			{
				gPwmRDt--;
			}
			if(gPwmGDt < PwmPercent_100)
			{
				gPwmGDt++;
			}
			if(gPwmGDt == PwmPercent_100)
			{
				FlagGStart = 1;
			}
		}
		else
		{
			if(gPwmGDt > PwmPercent_0)
			{
				gPwmGDt--;
			}
			if(gPwmBDt < PwmPercent_100)
			{
				gPwmBDt++;
			}
			if(gPwmBDt == PwmPercent_100)
			{
				FlagRStart = 0;
				FlagGStart = 0;
			}
		}
	}
}

