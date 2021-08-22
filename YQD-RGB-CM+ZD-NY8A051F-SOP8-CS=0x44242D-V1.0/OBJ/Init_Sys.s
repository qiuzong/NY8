;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"Init_Sys.c"
	list	p=NY8A051F,c=on
	#include "ny8a051f.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_Init_Timer0_Isr
	extern	_Init_Timer0
	extern	_Init_Timer1
	extern	_Pwm1DataUp
	extern	_Pwm1Start
	extern	_Pwm1Stop
	extern	_Init_Timer2
	extern	_Pwm2DataUp
	extern	_Pwm2Start
	extern	_Pwm2Stop
	extern	_Init_Timer3
	extern	_Pwm3DataUp
	extern	_Pwm3Start
	extern	_Pwm3Stop
	extern	_Init_Timer4
	extern	_Pwm4DataUp
	extern	_Pwm4Start
	extern	_Pwm4Stop
	extern	_GetKeyValue
	extern	_ClearKeyData
	extern	_Key1Function
	extern	_LED1Output
	extern	_BreathingDisplay
	extern	_SteplessAdjusted
	extern	_Blink3Times
	extern	_PWMOutPut
	extern	_Gear0
	extern	_Gear1
	extern	_Gear2
	extern	_Gear3
	extern	_Gear4
	extern	_Gear5
	extern	_Gear6
	extern	_Gear7
	extern	_Gear8
	extern	_Gear9
	extern	_Gear10
	extern	_Gear11
	extern	_Gear12
	extern	_Gear13
	extern	_Gear14
	extern	_Gear15
	extern	_Gear16
	extern	_Gear17
	extern	_Gear18
	extern	_Gear19
	extern	_Gear20
	extern	_Gear21
	extern	_Gear22
	extern	_Gear23
	extern	_SOSMode
	extern	_Frequency2Hz
	extern	_Frequency3Hz
	extern	_Frequency6Hz
	extern	_Frequency7Hz
	extern	_Frequency8Hz
	extern	_Frequency50Hz
	extern	_Frequency100Hz
	extern	_CheckLowVoltage
	extern	_ReadVoltage
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_BPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
	extern	_gPwmRDt
	extern	_gPwmGDt
	extern	_gPwmBDt
	extern	_TimeCyc8bit
	extern	_TimeCyc8bit1
	extern	_TimeUnitCnt0
	extern	_TimeUnitCnt1
	extern	_TimeUnitCnt2
	extern	_TimeUnitCnt3
	extern	_TimeUnitCnt4
	extern	_Time2200mS
	extern	_Time11840mS
	extern	_Time55630mS
	extern	_KeyFlag
	extern	_CntKeyOn
	extern	_KeyValue
	extern	_CntKey2On
	extern	_Key2Value
	extern	_KeyValueTemp
	extern	_TempFlag
	extern	_Time2Hz
	extern	_Time3Hz
	extern	_Time6Hz
	extern	_Time7Hz
	extern	_Time8Hz
	extern	_Time50Hz
	extern	_Time100Hz
	extern	_Time200Ms
	extern	_SOSTime
	extern	_BlinkCount
	extern	_SosStatus
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTB
	extern	_PCON
	extern	_BWUCON
	extern	_PCHBUF
	extern	_BPLCON
	extern	_BPHCON
	extern	_INTE
	extern	_INTF
	extern	_TMR1
	extern	_T1CR1
	extern	_T1CR2
	extern	_PWM1DUTY
	extern	_PS1CV
	extern	_BZ1CR
	extern	_IRCR
	extern	_TBHP
	extern	_TBHD
	extern	_OSCCR
	extern	_IOSTB
	extern	_PS0CV
	extern	_BODCON
	extern	_PCON1
	extern	_T0MD

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK06
	extern STK05
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_delay
	extern	_ClearRamData
	extern	_SleepMode
	extern	_Init_sys

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x1003:
	.res	1
.segment "uninit"
r0x1004:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1003
;   r0x1004
;; Starting pCode block
.segment "code"; module=Init_Sys, function=_delay
	.debuginfo subprogram _delay
;local variable name mapping:
	.debuginfo variable _count=r0x1003,enc=unsigned
	.debuginfo variable _i=r0x1004,enc=unsigned
_delay:
; 2 exit points
	.line	61, "Init_Sys.c"; 	void delay(unsigned char count)
	MOVAR	r0x1003
	.line	64, "Init_Sys.c"; 	for(i=1;i<=count;i++)
	MOVIA	0x01
	MOVAR	r0x1004
_00119_DS_:
	MOVR	r0x1004,W
	SUBAR	r0x1003,W
	BTRSS	STATUS,0
	MGOTO	_00121_DS_
	INCR	r0x1004,F
	MGOTO	_00119_DS_
_00121_DS_:
	.line	66, "Init_Sys.c"; 	}
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ClearKeyData
;   _ClearKeyData
;; Starting pCode block
.segment "code"; module=Init_Sys, function=_ClearRamData
	.debuginfo subprogram _ClearRamData
_ClearRamData:
; 2 exit points
	.line	55, "Init_Sys.c"; 	CntKeyOn = 0;
	CLRR	_CntKeyOn
	.line	56, "Init_Sys.c"; 	CntKey2On = 0;
	CLRR	_CntKey2On
	.line	57, "Init_Sys.c"; 	KeyValue = 0;
	CLRR	_KeyValue
	.line	58, "Init_Sys.c"; 	ClearKeyData();
	MCALL	_ClearKeyData
	.line	59, "Init_Sys.c"; 	}
	RETURN	
; exit point of _ClearRamData

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ClearRamData
;   _ClearRamData
;; Starting pCode block
.segment "code"; module=Init_Sys, function=_SleepMode
	.debuginfo subprogram _SleepMode
_SleepMode:
; 2 exit points
	.line	32, "Init_Sys.c"; 	DISI();										// 禁止所有中断
	DISI
	.line	34, "Init_Sys.c"; 	RLED = LED_OFF;
	BSR	_PORTB,1
	.line	35, "Init_Sys.c"; 	GLED = LED_OFF;
	BSR	_PORTB,2
	.line	36, "Init_Sys.c"; 	BLED = LED_OFF;
	BSR	_PORTB,0
	.line	38, "Init_Sys.c"; 	INTEbits.PBIE	=	1;						// 开启PortAB输入状态变化中断
	BSR	_INTEbits,1
	.line	39, "Init_Sys.c"; 	CLRWDT();									// 喂狗
	clrwdt
	.line	40, "Init_Sys.c"; 	PCONbits.WDTEN 	= 	0;						// 关看门狗中断
	BCR	_PCONbits,7
	.line	41, "Init_Sys.c"; 	PCON1 			= 	C_TMR0_Dis;				// 关闭Timer0
	CLRA	
	IOST	_PCON1
	.line	42, "Init_Sys.c"; 	ENI();
	ENI
	.line	43, "Init_Sys.c"; 	SLEEP();									// 进入睡眠模式
	sleep
	.line	44, "Init_Sys.c"; 	CLRWDT();									// 喂狗
	clrwdt
	.line	45, "Init_Sys.c"; 	PCONbits.WDTEN 	= 	1;						// 允许看门狗中断
	BSR	_PCONbits,7
	.line	46, "Init_Sys.c"; 	INTF 			= 	0x0;					// 清除所有中断标志位
	CLRR	_INTF
	.line	48, "Init_Sys.c"; 	PCON1 			= 	C_TMR0_En | C_LVD_2P4V;	// 开启Timer0 设置LVD电压为2.6V
	MOVIA	0x09
	IOST	_PCON1
	.line	50, "Init_Sys.c"; 	ClearRamData();
	MCALL	_ClearRamData
	.line	51, "Init_Sys.c"; 	}
	RETURN	
; exit point of _SleepMode

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Init_Timer0
;   _ClearRamData
;   _Init_Timer0
;   _ClearRamData
;; Starting pCode block
.segment "code"; module=Init_Sys, function=_Init_sys
	.debuginfo subprogram _Init_sys
_Init_sys:
; 2 exit points
	.line	6, "Init_Sys.c"; 	DISI();												// 禁止所有中断
	DISI
	.line	7, "Init_Sys.c"; 	INTF 			= 	0x00;							// 清除所有中断标志位
	CLRR	_INTF
	.line	12, "Init_Sys.c"; 	PORTB  			= 	C_PB0_Data | C_PB1_Data | C_PB2_Data | C_PB4_Data | C_PB5_Data;				// 上电为高电平
	MOVIA	0x37
	MOVAR	_PORTB
	.line	13, "Init_Sys.c"; 	IOSTB  			= 	C_PB3_Input | C_PB4_Input | C_PB5_Input;									// 设置为输入，1:输入, 0:输出（默认）
	MOVIA	0x38
	IOST	_IOSTB
	.line	14, "Init_Sys.c"; 	BPHCON 			= 	(unsigned char)~(C_PB3_PHB | C_PB4_PHB | C_PB5_PHB);						// 端口B上拉0启用，0：上拉，1：取消上拉（默认）
	MOVIA	0xc7
	MOVAR	_BPHCON
	.line	15, "Init_Sys.c"; 	BWUCON 			= 	C_PB5_Wakeup;																// 允许唤醒，1启用：
	MOVIA	0x20
	MOVAR	_BWUCON
	.line	17, "Init_Sys.c"; 	Init_Timer0();
	MCALL	_Init_Timer0
	.line	20, "Init_Sys.c"; 	PCON 			= 	C_LVR_En | C_WDT_En | C_LVD_En;				// 允许LVR复位，允许看门狗复位 允许LVD
	MOVIA	0xa8
	MOVAR	_PCON
	.line	21, "Init_Sys.c"; 	PCON1 			= 	C_TMR0_En | C_LVD_2P4V;						// 开启Timer0 设置LVD电压为2.6V
	MOVIA	0x09
	IOST	_PCON1
	.line	22, "Init_Sys.c"; 	INTE 			=  	C_INT_TMR0 | C_INT_PBKey;					// 允许Timer0中断  允许端口B输入状态变化中断 
	MOVIA	0x03
	MOVAR	_INTE
	.line	24, "Init_Sys.c"; 	ENI();															// 允许所有中断
	ENI
	.line	26, "Init_Sys.c"; 	ClearRamData();
	MCALL	_ClearRamData
	.line	28, "Init_Sys.c"; 	}
	RETURN	
; exit point of _Init_sys


;	code size estimation:
;	   46+    0 =    46 instructions (   92 byte)

	end
