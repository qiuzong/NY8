#ifndef RXD_NEC_H
#define RXD_NEC_H

#include "Init_Sys.h"


//先取高位
#define			DefIrFristCode					0x00						//客户码1
#define			DefIrSecondCode					0xEF						//客户码2

#define			DefIrRxdKey0Code				0x00						//按键码
#define			DefIrRxdKey1Code				0x01						//按键码
#define			DefIrRxdKey2Code				0x02						//按键码
#define			DefIrRxdKey3Code				0x03						//按键码
#define			DefIrRxdKey4Code				0x04						//按键码
#define			DefIrRxdKey5Code				0x05						//按键码
#define			DefIrRxdKey6Code				0x06						//按键码
#define			DefIrRxdKey7Code				0x07						//按键码
#define			DefIrRxdKey8Code				0x08						//按键码
#define			DefIrRxdKey9Code				0x09						//按键码
#define			DefIrRxdKey10Code				0x0A						//按键码
#define			DefIrRxdKey11Code				0x0B						//按键码
#define			DefIrRxdKey12Code				0x0C						//按键码
#define			DefIrRxdKey13Code				0x0D						//按键码
#define			DefIrRxdKey14Code				0x0E						//按键码
#define			DefIrRxdKey15Code				0x0F						//按键码
#define			DefIrRxdKey16Code				0x10						//按键码
#define			DefIrRxdKey17Code				0x11						//按键码
#define			DefIrRxdKey18Code				0x12						//按键码
#define			DefIrRxdKey19Code				0x13						//按键码
#define			DefIrRxdKey20Code				0x14						//按键码
#define			DefIrRxdKey21Code				0x15						//按键码
#define			DefIrRxdKey22Code				0x16						//按键码
#define			DefIrRxdKey23Code				0x17						//按键码


extern unsigned char	RXDTimerCount;


void	RXDTime(void);					//接收计时	0.1ms进一次
void	RxdData(void);					//接收数据
void	DataDecode(void);				//数据处理
void	InfraredFunction(void);			//红外功能

void	IrSteplessAdjusted(void);		//无极调光


extern unsigned char	IRFlag;
__sbit 			IRFlag_Temp							= IRFlag : 0;	
__sbit 			IRFlag_Start						= IRFlag : 1;	
__sbit 			IRFlag_OK 							= IRFlag : 2;	
__sbit 			IRFlag_Data							= IRFlag : 3;	
__sbit 			IRFlag_DataOk						= IRFlag : 4;	
__sbit 			IRFlag_RxdData 						= IRFlag : 5;
__sbit 			IRFlag_switch						= IRFlag : 6;	
__sbit 			IRFlag_Adjust	 					= IRFlag : 7;		



/*
typedef struct __IR_Flag
{
    unsigned int Temp   	: 1;
    unsigned int Start		: 1;
    unsigned int OK    		: 1;
    unsigned int Data		: 1;
    unsigned int DataOk		: 1;
    unsigned int RxdData	: 1;
    unsigned int 			: 1;
    unsigned int 			: 1;
} __IR_Flag;

extern __at(0x0FF)volatile __IR_Flag IRFlag;
*/


#endif