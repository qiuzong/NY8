#ifndef KEY_H
#define KEY_H

#include "Init_Sys.h"

//============��������=================
#define				DefGearMax					10							//����ѭ����λ����һ��12����KeyValue = 0 ~ 8
//#define				DefKeyOnTime				5							//����������������������8mS��8mS*5=40mS
#define				DefKeyOnTime				10							//����������������������6.4mS��6.4mS*10=64mS
#define				DefKeyLongPressTime			156							//����������������������6.4mS��1000mS/6.4=156.25
#define				DefCntKeyOnMax				255							//��������������

#define				KEY_ON						0							//KEY������
#define				KEY_OFF						1

extern unsigned char KeyFlag;
__sbit 				FlagKeySampling					= KeyFlag : 0;	
__sbit 				FlagKeyLong						= KeyFlag : 1;	
__sbit 				KeyValueTemp0 					= KeyFlag : 2;	

__sbit 				FlagStartFunction				= KeyFlag : 3;			//����ң�ع���
__sbit 				FlagAddEnd						= KeyFlag : 4;			//PWM+����
__sbit 				FlagMinusEnd					= KeyFlag : 5;			//PWM-����
__sbit 				FlagPWMAdd 						= KeyFlag : 6;			//PWM+
__sbit 				FlagPWMMinus 					= KeyFlag : 7;			//PWM-	

extern unsigned char CntKeyOn, KeyValue;
extern unsigned char CntKey2On, Key2Value;


void 	GetKeyValue(void);
void 	ClearKeyData(void);

#endif
