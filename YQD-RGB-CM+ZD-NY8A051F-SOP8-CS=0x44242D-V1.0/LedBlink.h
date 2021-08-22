#ifndef LEDBLINK_H
#define LEDBLINK_H

#include "Init_Sys.h"

#define			DefTime2Hz				50				//1000ms/2=500ms	500ms/10ms=50			10ms进一次
#define			DefTime3Hz				33				//1000ms/3=333ms	333ms/10ms=33			10ms进一次
#define			DefTime6Hz				332				//1000ms/6=166ms	166ms/0.5ms=332			0.5ms进一次
#define			DefTime7Hz				140				//1000ms/7.14=140ms	140ms/1ms=140			1.0ms进一次
#define			DefTime8Hz				250				//1000ms/8=125ms	125ms/0.5ms=250			0.5ms进一次
#define			DefTime50Hz				200				//50Hz		1000ms/50=20ms	20ms/0.1ms=200	0.1ms进一次
#define			DefTime100Hz			100				//100Hz		1000ms/100=10ms	10ms/0.1ms=100	0.1ms进一次

#define			DefTime200Ms			20				//循环计时 20 * 10mS = 200ms
#define			DefSOSTime				(24 + 5)		//短：亮200ms灭200ms 长：亮600ms灭200ms 灭1000ms

#define			DefON					1
#define			DefOFF					0

extern unsigned char	Time2Hz;
extern unsigned char	Time3Hz;
extern unsigned short	Time6Hz;
extern unsigned char	Time7Hz;
extern unsigned short	Time8Hz;
extern unsigned char	Time50Hz;
extern unsigned char	Time100Hz;

extern unsigned char Time200Ms, SOSTime, BlinkCount;
extern const unsigned char SosStatus[ 29 ];

void	SOSMode(void);					//10ms进一次
void	Frequency2Hz(void);				//10ms进一次
void	Frequency3Hz(void);				//10ms进一次
void	Frequency6Hz(void);				//0.5ms进一次
void	Frequency7Hz(void);				//1.0ms进一次
void	Frequency8Hz(void);				//0.5ms进一次
void	Frequency50Hz(void);			//0.1ms进一次
void	Frequency100Hz(void);			//0.1ms进一次

void	CheckLowVoltage(void);			//低电压检测
void	ReadVoltage(void);				//读取电压

/*
extern unsigned char	FlagTemp, VddGradeLVD;
__sbit				FlagLowVoltage				= FlagTemp : 0;			//低电量标志位1：低电量；0：未低电量


__sbit				FlagVoltageSampling			= FlagTemp : 7;			//


__sbit				VDD_4P05V					= VddGradeLVD : 5;	
__sbit				VDD_3P90V					= VddGradeLVD : 4;
__sbit				VDD_3P60V					= VddGradeLVD : 3;
__sbit				VDD_3P30V					= VddGradeLVD : 2;
__sbit				VDD_3P00V					= VddGradeLVD : 1;
__sbit				VDD_2P80V					= VddGradeLVD : 0;

#define			DefVDD_4P05V					(0x3F)
#define			DefVDD_3P90V					(0x1F)
#define			DefVDD_3P60V					(0x0F)
#define			DefVDD_3P30V					(0x07)
#define			DefVDD_3P00V					(0x03)
#define			DefVDD_2P80V					(0x01)
*/

#endif