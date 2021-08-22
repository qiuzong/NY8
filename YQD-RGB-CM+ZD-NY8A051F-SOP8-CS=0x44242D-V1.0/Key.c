#include "Key.h"

unsigned char KeyFlag;

unsigned char		CntKeyOn, KeyValue;
unsigned char		CntKey2On, Key2Value;

	
void 	GetKeyValue(void)
{	//读取按键值、去毛刺
	if( KeySamplingTime == 0 ) { FlagKeySampling =	0; }
	if( ( KeySamplingTime == 1 ) && ( FlagKeySampling == 0 ) )	//8mS运行一次
	{
		FlagKeySampling			=	1;
		//---------------------------------------触摸开关-----------------------------------------------------------
		if(KEY2 == KEY_ON)										// 每次有效按键最少需要保持40mS
		{
			if(CntKeyOn < DefCntKeyOnMax)	 { CntKeyOn++; }
			if(CntKeyOn == DefKeyLongPressTime)					// 长按1秒关
			{
				if(KeyValue > 0)
				{
					KeyValueTemp = KeyValue;					// 保存档位
					KeyValue = 0;
				}
				BWUCON = C_PB5_Wakeup;							// 允许唤醒，1启用：
				ClearKeyData();
				KeyValueTemp0 = 1;
			}
		}
		else//if(KEY == KEY_OFF)								//松开按键或者按键抖动清零
		{
			if((CntKeyOn >= DefKeyOnTime) && (CntKeyOn < DefKeyLongPressTime))					//40mS
			{
				if(KeyValueTemp0)
				{
					KeyValue = KeyValueTemp;					//恢复按键档位
					KeyValueTemp0 = 0;
				}
				else if( KeyValue < DefGearMax )				//按键循环档位设置，KeyValue = 0 ~ 1
				{
					KeyValue++;
				}
				else
				{				
					KeyValue = 1;
				}
				KeyValueTemp = KeyValue;					// 保存档位
				BWUCON = C_PB4_Wakeup | C_PB5_Wakeup;						// 允许唤醒，1启用：
				ClearKeyData();
			}
			CntKeyOn = 0;
		}
	}
}

void ClearKeyData(void)
{
	TimeUnitCnt0	=	0;			//计数0.1ms清零
	TimeUnitCnt1	=	0;			//计数10ms清零
		
	FlagBreathing  	=	0;
}

