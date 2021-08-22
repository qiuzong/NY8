
#ifndef INIT_SYS_H
#define INIT_SYS_H

#include <ny8.h>
#include "NY8_constant.h"
#include "Init_Timer.h"
#include "Interrupt.h"
#include "Key.h"
#include "KeyFunction.h"
#include "LedBlink.h"

#define UPDATE_REG(x)	__asm__("MOVR _" #x ",F")

enum { BIT_PB0, BIT_PB1, BIT_PB2, BIT_PB3, BIT_PB4, BIT_PB5, BIT_PB6, BIT_PB7 } ;
#define SetInPut_BIT( x, bit)	(x |= (1 << bit))					//设置第bit位为输入（置一第bit位）
#define SetOutPut_BIT( x, bit)	(x &= ~(1 << bit))					//设置第bit位为输出（清零第bit位）


//============IO口定义==============
#define     RLED							PB1           //RLED（RLED，低有效）
#define     GLED							PB2           //GLED（GLED，低有效）
#define     BLED							PB0           //BLED（BLED，低有效）
#define     KEY2							PB5           //KEY2(触摸开关，低有效)
#define     KEY1							PB4           //KEY1(震动开关，低有效)
#define     RXD								PB3           //RXD(红外接收，低有效)
//============常量声明=================

#define		LED_ON					0			//LED点亮
#define		LED_OFF					1

void 	delay(unsigned char count);
void 	Init_sys(void);							//系统初始化
void 	SleepMode(void);
void 	ClearRamData(void);

#endif
