
#include "Init_Sys.h"

void 	Init_sys(void)
{
	DISI();												// 禁止所有中断
    INTF 			= 	0x00;							// 清除所有中断标志位
	//========================================================
	//初始化IO
	//========================================================

	PORTB  			= 	C_PB0_Data | C_PB1_Data | C_PB2_Data | C_PB4_Data | C_PB5_Data;				// 上电为高电平
    IOSTB  			= 	C_PB3_Input | C_PB4_Input | C_PB5_Input;									// 设置为输入，1:输入, 0:输出（默认）
    BPHCON 			= 	(unsigned char)~(C_PB3_PHB | C_PB4_PHB | C_PB5_PHB);						// 端口B上拉0启用，0：上拉，1：取消上拉（默认）
	BWUCON 			= 	C_PB5_Wakeup;																// 允许唤醒，1启用：

	Init_Timer0();

//	CMPCR			=	0x0A;										// Bandgap(only for LVD)
	PCON 			= 	C_LVR_En | C_WDT_En | C_LVD_En;				// 允许LVR复位，允许看门狗复位 允许LVD
	PCON1 			= 	C_TMR0_En | C_LVD_2P4V;						// 开启Timer0 设置LVD电压为2.6V
	INTE 			=  	C_INT_TMR0 | C_INT_PBKey;					// 允许Timer0中断  允许端口B输入状态变化中断 

	ENI();															// 允许所有中断
    
	ClearRamData();

}

void SleepMode(void)
{
	DISI();										// 禁止所有中断

	RLED = LED_OFF;
	GLED = LED_OFF;
	BLED = LED_OFF;

	INTEbits.PBIE	=	1;						// 开启PortAB输入状态变化中断
	CLRWDT();									// 喂狗
	PCONbits.WDTEN 	= 	0;						// 关看门狗中断
	PCON1 			= 	C_TMR0_Dis;				// 关闭Timer0
	ENI();
    SLEEP();									// 进入睡眠模式
	CLRWDT();									// 喂狗
	PCONbits.WDTEN 	= 	1;						// 允许看门狗中断
    INTF 			= 	0x0;					// 清除所有中断标志位
//	PCON1 			= 	C_TMR0_En;				// 开启Timer0
	PCON1 			= 	C_TMR0_En | C_LVD_2P4V;	// 开启Timer0 设置LVD电压为2.6V
//	ENI();
	ClearRamData();
}

void ClearRamData(void)
{
	CntKeyOn = 0;
	CntKey2On = 0;
	KeyValue = 0;
	ClearKeyData();
}

void delay(unsigned char count)
{
	unsigned char i;
	for(i=1;i<=count;i++)
	;
}
