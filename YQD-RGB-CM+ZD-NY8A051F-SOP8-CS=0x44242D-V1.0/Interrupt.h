#ifndef INTERRUPT_H
#define INTERRUPT_H

#include "Init_Sys.h"

//============常量声明=================
#define				DefTimeUnitCnt0				(100)						//循环计时(DefTimeUnitCnt0 * 0.1mS = 10mS)
#define				DefTimeUnitCnt1				(100)						//循环计时(DefTimeUnitCnt1 * 10mS = 1S)
#define				DefTimeUnitCnt2				(40)						//循环计时(DefTimeUnitCnt2 * 10mS = 0.4S)
#define				DefTimeUnitCnt3				(5)							//循环计时(DefTimeUnitCnt3 * 0.1mS = 0.5mS)
#define				DefTimeUnitCnt4				(200)						//循环计时(DefTimeUnitCnt4 * 0.5mS = 0.1S)


extern unsigned char 		TimeCyc8bit, TimeCyc8bit1;				
extern unsigned char 		TimeUnitCnt0, TimeUnitCnt1, TimeUnitCnt2, TimeUnitCnt3, TimeUnitCnt4;
extern unsigned char		Time2200mS;
extern unsigned short		Time11840mS, Time55630mS;


//采样时间
__sbit 				TimeSampling128mS 			= TimeCyc8bit : 7;		//25.6
__sbit 				TimeSampling64mS 			= TimeCyc8bit : 6;		//12.8
__sbit 				TimeSampling32mS 			= TimeCyc8bit : 5;		//6.4	
__sbit 				TimeSampling16mS 			= TimeCyc8bit : 4;		//3.2
__sbit 				TimeSampling8mS 			= TimeCyc8bit : 3;		//1.6
__sbit 				TimeSampling4mS 			= TimeCyc8bit : 2;		//0.8
__sbit 				TimeSampling2mS 			= TimeCyc8bit : 1;		//0.4
__sbit 				TimeSampling1mS 			= TimeCyc8bit : 0;		//0.2

__sbit 				TimeSampling20mS 			= TimeCyc8bit1 : 0;		//20
__sbit 				TimeSampling40mS 			= TimeCyc8bit1 : 1;		//40
__sbit 				TimeSampling80mS 			= TimeCyc8bit1 : 2;		//80
__sbit 				TimeSampling160mS 			= TimeCyc8bit1 : 3;		//160

#define				KeySamplingTime				(TimeSampling32mS)		//按键采样时间

#endif
	