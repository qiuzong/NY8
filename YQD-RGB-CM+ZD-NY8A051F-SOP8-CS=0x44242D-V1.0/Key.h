#ifndef KEY_H
#define KEY_H

#include "Init_Sys.h"

//============常量声明=================
#define				DefGearMax					10							//按键循环档位设置一共12档，KeyValue = 0 ~ 8
//#define				DefKeyOnTime				5							//按键采样次数，采样周期8mS，8mS*5=40mS
#define				DefKeyOnTime				10							//按键采样次数，采样周期6.4mS，6.4mS*10=64mS
#define				DefKeyLongPressTime			156							//按键采样次数，采样周期6.4mS，1000mS/6.4=156.25
#define				DefCntKeyOnMax				255							//按键最大采样次数

#define				KEY_ON						0							//KEY被按下
#define				KEY_OFF						1

extern unsigned char KeyFlag;
__sbit 				FlagKeySampling					= KeyFlag : 0;	
__sbit 				FlagKeyLong						= KeyFlag : 1;	
__sbit 				KeyValueTemp0 					= KeyFlag : 2;	

__sbit 				FlagStartFunction				= KeyFlag : 3;			//开启遥控功能
__sbit 				FlagAddEnd						= KeyFlag : 4;			//PWM+结束
__sbit 				FlagMinusEnd					= KeyFlag : 5;			//PWM-结束
__sbit 				FlagPWMAdd 						= KeyFlag : 6;			//PWM+
__sbit 				FlagPWMMinus 					= KeyFlag : 7;			//PWM-	

extern unsigned char CntKeyOn, KeyValue;
extern unsigned char CntKey2On, Key2Value;


void 	GetKeyValue(void);
void 	ClearKeyData(void);

#endif
