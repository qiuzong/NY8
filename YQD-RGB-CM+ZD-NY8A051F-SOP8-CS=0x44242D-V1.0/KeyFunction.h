#ifndef KEYFUNCTION_H
#define KEYFUNCTION_H

#include "Init_Sys.h"

extern unsigned char KeyValueTemp;

extern unsigned char TempFlag;
__sbit 				FlagRStart					= TempFlag : 0;	
__sbit 				FlagGStart	 				= TempFlag : 1;	//
__sbit 				FlagPwmStart 				= TempFlag : 2;	//
__sbit 				FlagBreathing23				= TempFlag : 3;	//
__sbit 				FlagBStart	 				= TempFlag : 4;	//
__sbit 				FlagBlink		 			= TempFlag : 5;	//
__sbit 				FlagVoltageSampling			= TempFlag : 6;	//
__sbit 				FlagBreathing				= TempFlag : 7;



void 	Key1Function(void);
void	LED1Output(void);
void	BreathingDisplay(void);					//呼吸显示
void	SteplessAdjusted(void);					//无极调光
void	Blink3Times(void);						//闪3次

void	PWMOutPut(void);

void	Gear0(void);
void	Gear1(void);
void	Gear2(void);
void	Gear3(void);
void	Gear4(void);
void	Gear5(void);
void	Gear6(void);
void	Gear7(void);
void	Gear8(void);
void	Gear9(void);
void	Gear10(void);
void	Gear11(void);
void	Gear12(void);
void	Gear13(void);
void	Gear14(void);
void	Gear15(void);
void	Gear16(void);
void	Gear17(void);
void	Gear18(void);
void	Gear19(void);
void	Gear20(void);
void	Gear21(void);
void	Gear22(void);
void	Gear23(void);


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

#endif
	