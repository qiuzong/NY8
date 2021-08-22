#ifndef INIT_TIMER_H
#define INIT_TIMER_H

#include "Init_Sys.h"


//extern unsigned char gPwm1Dt;						//PWM赋值变量
//extern unsigned short gPwm1Dt, gPwm2Dt, gPwm3Dt, gPwm4Dt;	//PWM赋值变量
extern unsigned short gPwmRDt, gPwmGDt, gPwmBDt;	//PWM赋值变量

void 	Init_Timer0_Isr(void);
void 	Init_Timer0(void);
void 	Init_Timer1(void);
void	Pwm1DataUp(void);							//10Bit Timer1 PWM1	曲线赋值
void	Pwm1Start(void);							//10Bit Timer1 PWM1	启动PWM1
void	Pwm1Stop(void);								//10Bit Timer1 PWM1	停止PWM1
void 	Init_Timer2(void);
void	Pwm2DataUp(void);							//10Bit Timer2 PWM2	曲线赋值
void	Pwm2Start(void);							//10Bit Timer2 PWM2	启动PWM2
void	Pwm2Stop(void);								//10Bit Timer2 PWM2	停止PWM2
void 	Init_Timer3(void);
void	Pwm3DataUp(void);							//10Bit Timer3 PWM3	曲线赋值
void	Pwm3Start(void);							//10Bit Timer3 PWM3	启动PWM3
void	Pwm3Stop(void);								//10Bit Timer3 PWM3	停止PWM3
void 	Init_Timer4(void);
void	Pwm4DataUp(void);							//10Bit Timer3 PWM4	曲线赋值
void	Pwm4Start(void);							//10Bit Timer3 PWM4	启动PWM4
void	Pwm4Stop(void);								//10Bit Timer3 PWM4	停止PWM4

#endif