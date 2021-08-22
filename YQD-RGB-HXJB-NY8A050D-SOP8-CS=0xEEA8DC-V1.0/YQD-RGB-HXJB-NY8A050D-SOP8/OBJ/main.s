;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A050D,c=on
	#include "ny8a050d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_BPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
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
	extern	_TBHP
	extern	_TBHD
	extern	_OSCCR
	extern	_IOSTB
	extern	_PS0CV
	extern	_BODCON
	extern	_PCON1
	extern	_T0MD
	extern	___sdcc_saved_fsr
	extern	___sdcc_saved_stk00
	extern	___sdcc_saved_stk01
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_BreathingDisplay
	extern	_OutPwmB
	extern	_OutPwmG
	extern	_OutPwmR
	extern	_Init_sys
	extern	_main
	extern	_isr
	extern	_TimeCyc8bit
	extern	_TimeUnitCnt0
	extern	_TimeUnitCnt1
	extern	_gPwmRDt
	extern	_gPwmGDt
	extern	_gPwmBDt
	extern	_Time100Hz
	extern	_TempFlag

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00

.segment "uninit", 0x20000010
PSAVE:
	.res 1
SSAVE:
	.res 1
WSAVE:
	.res 1
STK04:
	.res 1
STK03:
	.res 1
STK02:
	.res 1
STK01:
	.res 1
STK00:
	.res 1

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
_BreathingDisplay_Count_65536_31:
	.res	1
	.debuginfo gvariable name=_BreathingDisplay_Count_65536_31,1byte,array=0,entsize=1,ext=0,enc=unsigned
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_TimeCyc8bit:
	dw	0x00
	.debuginfo gvariable name=_TimeCyc8bit,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_TimeUnitCnt0:
	dw	0x00
	.debuginfo gvariable name=_TimeUnitCnt0,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_TimeUnitCnt1:
	dw	0x00
	.debuginfo gvariable name=_TimeUnitCnt1,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_gPwmRDt:
	dw	0x00
	.debuginfo gvariable name=_gPwmRDt,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_gPwmGDt:
	dw	0x00
	.debuginfo gvariable name=_gPwmGDt,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_gPwmBDt:
	dw	0x00
	.debuginfo gvariable name=_gPwmBDt,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_Time100Hz:
	dw	0x00
	.debuginfo gvariable name=_Time100Hz,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_TempFlag:
	dw	0x00
	.debuginfo gvariable name=_TempFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
ORG	0x0000
	LGOTO	__nyc_ny8_startup
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
ORG 0x0008
	MGOTO	__sdcc_interrupt

.segment "code"
__sdcc_interrupt:
;***
;  pBlock Stats: dbName = I
;***
;functions called:
;   _OutPwmR
;   _OutPwmG
;   _OutPwmB
;   _BreathingDisplay
;   _OutPwmR
;   _OutPwmG
;   _OutPwmB
;   _BreathingDisplay
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr:
; 0 exit points
	.line	146, "main.c"; 	void isr(void) __interrupt(0)
	MOVAR	WSAVE
	SWAPR	STATUS,W
	CLRR	STATUS
	MOVAR	SSAVE
	MOVR	PCHBUF,W
	CLRR	PCHBUF
	MOVAR	PSAVE
	MOVR	FSR,W
	MOVAR	___sdcc_saved_fsr
	MOVR	STK00,W
	MOVAR	___sdcc_saved_stk00
	MOVR	STK01,W
	MOVAR	___sdcc_saved_stk01
	.line	149, "main.c"; 	if(PBIF)
	BTRSS	_INTF,1
	MGOTO	_00140_DS_
	.line	151, "main.c"; 	PBIF 	= 	0;									//清中断
	MOVIA	0xfd
	MOVAR	_INTF
_00140_DS_:
	.line	154, "main.c"; 	if(INTFbits.T0IF)									//Timer0中断
	BTRSS	_INTFbits,0
	MGOTO	_00149_DS_
	.line	156, "main.c"; 	INTFbits.T0IF			=	0;					//清Timer0中断
	MOVIA	0xfe
	MOVAR	(_INTFbits + 0)
	.line	157, "main.c"; 	TMR0 = DefReladNum;								//装载定时器0初始值
	MOVIA	0xd6
	MOVAR	_TMR0
	.line	159, "main.c"; 	TimeCyc8bit++;
	INCR	_TimeCyc8bit,F
	.line	161, "main.c"; 	Time100Hz++;
	INCR	_Time100Hz,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	162, "main.c"; 	if(Time100Hz >= DefTime100Hz)
	MOVIA	0x64
	SUBAR	_Time100Hz,W
	BTRSC	STATUS,0
	.line	164, "main.c"; 	Time100Hz = 0;
	CLRR	_Time100Hz
	.line	166, "main.c"; 	OutPwmR();
	MCALL	_OutPwmR
	.line	167, "main.c"; 	OutPwmG();
	MCALL	_OutPwmG
	.line	168, "main.c"; 	OutPwmB();
	MCALL	_OutPwmB
	.line	169, "main.c"; 	TimeUnitCnt0++;									//每0.1mS累加一次
	INCR	_TimeUnitCnt0,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	170, "main.c"; 	if(TimeUnitCnt0 >= DefTimeUnitCnt0)				//10mS循环计时
	MOVIA	0x64
	SUBAR	_TimeUnitCnt0,W
	BTRSS	STATUS,0
	MGOTO	_00149_DS_
	.line	172, "main.c"; 	TimeUnitCnt0		= 	0;
	CLRR	_TimeUnitCnt0
	.line	173, "main.c"; 	TimeUnitCnt1++;								//每10mS累加一次
	INCR	_TimeUnitCnt1,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	174, "main.c"; 	if(TimeUnitCnt1 >= DefTimeUnitCnt1)			//1S循环计时	
	MOVIA	0x64
	SUBAR	_TimeUnitCnt1,W
	BTRSC	STATUS,0
	.line	176, "main.c"; 	TimeUnitCnt1	= 	0;					//计数清零
	CLRR	_TimeUnitCnt1
	.line	178, "main.c"; 	BreathingDisplay();
	MCALL	_BreathingDisplay
_00149_DS_:
	.line	182, "main.c"; 	}
	MOVR	___sdcc_saved_stk01,W
	MOVAR	STK01
	MOVR	___sdcc_saved_stk00,W
	MOVAR	STK00
	MOVR	___sdcc_saved_fsr,W
	MOVAR	FSR
	MOVR	PSAVE,W
	MOVAR	PCHBUF
	CLRR	STATUS
	SWAPR	SSAVE,W
	MOVAR	STATUS
	SWAPR	WSAVE,F
	SWAPR	WSAVE,W
END_OF_INTERRUPT:
	RETIE	

;--------------------------------------------------------
; code
;--------------------------------------------------------
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _Init_sys
;   _Init_sys
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	95, "main.c"; 	Init_sys();
	MCALL	_Init_sys
_00110_DS_:
	.line	99, "main.c"; 	CLRWDT();                               	//清看门狗
	clrwdt
	MGOTO	_00110_DS_
	.line	101, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_BreathingDisplay
	.debuginfo subprogram _BreathingDisplay
;local variable name mapping:
	.debuginfo variable _Count=_BreathingDisplay_Count_65536_31,enc=unsigned
_BreathingDisplay:
; 2 exit points
	.line	187, "main.c"; 	Count++;
	INCR	_BreathingDisplay_Count_65536_31,F
;;unsigned compare: left < lit (0xA=10), size=1
	.line	188, "main.c"; 	if(Count >= 10)				//10*10MS=100MS
	MOVIA	0x0a
	SUBAR	_BreathingDisplay_Count_65536_31,W
	BTRSS	STATUS,0
	MGOTO	_00180_DS_
	.line	190, "main.c"; 	Count = 0;
	CLRR	_BreathingDisplay_Count_65536_31
	.line	191, "main.c"; 	if(FlagRStart == 0)
	BTRSC	_TempFlag,0
	MGOTO	_00176_DS_
;;unsigned compare: left < lit (0x64=100), size=1
	.line	193, "main.c"; 	if(gPwmRDt < PwmPercent_100)
	MOVIA	0x64
	SUBAR	_gPwmRDt,W
	BTRSS	STATUS,0
	.line	195, "main.c"; 	gPwmRDt++;
	INCR	_gPwmRDt,F
	.line	197, "main.c"; 	if(gPwmRDt == PwmPercent_100)
	MOVR	_gPwmRDt,W
	XORIA	0x64
	BTRSS	STATUS,2
	MGOTO	_00157_DS_
	.line	199, "main.c"; 	FlagRStart = 1;
	BSR	_TempFlag,0
	.line	200, "main.c"; 	FlagGStart = 0;
	BCR	_TempFlag,1
_00157_DS_:
	.line	202, "main.c"; 	if(gPwmBDt > PwmPercent_0)
	MOVR	_gPwmBDt,W
	BTRSC	STATUS,2
	MGOTO	_00180_DS_
	.line	204, "main.c"; 	gPwmBDt--;
	DECR	_gPwmBDt,F
	MGOTO	_00180_DS_
_00176_DS_:
	.line	207, "main.c"; 	else if(FlagGStart == 0)
	BTRSC	_TempFlag,1
	MGOTO	_00173_DS_
	.line	209, "main.c"; 	if(gPwmRDt > PwmPercent_0)
	MOVR	_gPwmRDt,W
	BTRSS	STATUS,2
	.line	211, "main.c"; 	gPwmRDt--;
	DECR	_gPwmRDt,F
	.line	213, "main.c"; 	if(gPwmGDt < PwmPercent_100)
	MOVIA	0x64
	SUBAR	_gPwmGDt,W
	BTRSS	STATUS,0
	.line	215, "main.c"; 	gPwmGDt++;
	INCR	_gPwmGDt,F
	.line	217, "main.c"; 	if(gPwmGDt == PwmPercent_100)
	MOVR	_gPwmGDt,W
	XORIA	0x64
	BTRSS	STATUS,2
	MGOTO	_00180_DS_
	.line	219, "main.c"; 	FlagGStart = 1;
	BSR	_TempFlag,1
	MGOTO	_00180_DS_
_00173_DS_:
	.line	224, "main.c"; 	if(gPwmGDt > PwmPercent_0)
	MOVR	_gPwmGDt,W
	BTRSS	STATUS,2
	.line	226, "main.c"; 	gPwmGDt--;
	DECR	_gPwmGDt,F
	.line	228, "main.c"; 	if(gPwmBDt < PwmPercent_100)
	MOVIA	0x64
	SUBAR	_gPwmBDt,W
	BTRSS	STATUS,0
	.line	230, "main.c"; 	gPwmBDt++;
	INCR	_gPwmBDt,F
	.line	232, "main.c"; 	if(gPwmBDt == PwmPercent_100)
	MOVR	_gPwmBDt,W
	XORIA	0x64
	BTRSS	STATUS,2
	MGOTO	_00180_DS_
	.line	234, "main.c"; 	FlagRStart = 0;
	BCR	_TempFlag,0
	.line	235, "main.c"; 	FlagGStart = 0;
	BCR	_TempFlag,1
_00180_DS_:
	.line	239, "main.c"; 	}
	RETURN	
; exit point of _BreathingDisplay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_OutPwmB
	.debuginfo subprogram _OutPwmB
_OutPwmB:
; 2 exit points
	.line	134, "main.c"; 	if(Time100Hz < gPwmBDt)
	MOVR	_gPwmBDt,W
	SUBAR	_Time100Hz,W
	BTRSC	STATUS,0
	MGOTO	_00132_DS_
	.line	136, "main.c"; 	BLED = LED_ON;
	BCR	_PORTB,4
	.line	137, "main.c"; 	BLED1 = LED_ON;
	BCR	_PORTB,5
	MGOTO	_00134_DS_
_00132_DS_:
	.line	141, "main.c"; 	BLED = LED_OFF;
	BSR	_PORTB,4
	.line	142, "main.c"; 	BLED1 = LED_OFF;
	BSR	_PORTB,5
_00134_DS_:
	.line	144, "main.c"; 	}
	RETURN	
; exit point of _OutPwmB

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_OutPwmG
	.debuginfo subprogram _OutPwmG
_OutPwmG:
; 2 exit points
	.line	120, "main.c"; 	if(Time100Hz < gPwmGDt)
	MOVR	_gPwmGDt,W
	SUBAR	_Time100Hz,W
	BTRSC	STATUS,0
	MGOTO	_00124_DS_
	.line	122, "main.c"; 	GLED = LED_ON;
	BCR	_PORTB,2
	.line	123, "main.c"; 	GLED1 = LED_ON;
	BCR	_PORTB,3
	MGOTO	_00126_DS_
_00124_DS_:
	.line	127, "main.c"; 	GLED = LED_OFF;
	BSR	_PORTB,2
	.line	128, "main.c"; 	GLED1 = LED_OFF;
	BSR	_PORTB,3
_00126_DS_:
	.line	130, "main.c"; 	}
	RETURN	
; exit point of _OutPwmG

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_OutPwmR
	.debuginfo subprogram _OutPwmR
_OutPwmR:
; 2 exit points
	.line	106, "main.c"; 	if(Time100Hz < gPwmRDt)
	MOVR	_gPwmRDt,W
	SUBAR	_Time100Hz,W
	BTRSC	STATUS,0
	MGOTO	_00116_DS_
	.line	108, "main.c"; 	RLED = LED_ON;
	BCR	_PORTB,0
	.line	109, "main.c"; 	RLED1 = LED_ON;
	BCR	_PORTB,1
	MGOTO	_00118_DS_
_00116_DS_:
	.line	113, "main.c"; 	RLED = LED_OFF;
	BSR	_PORTB,0
	.line	114, "main.c"; 	RLED1 = LED_OFF;
	BSR	_PORTB,1
_00118_DS_:
	.line	116, "main.c"; 	}
	RETURN	
; exit point of _OutPwmR

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_Init_sys
	.debuginfo subprogram _Init_sys
_Init_sys:
; 2 exit points
	.line	73, "main.c"; 	DISI();												// 禁止所有中断
	DISI
	.line	74, "main.c"; 	INTF 			= 	0x00;							// 清除所有中断标志位
	CLRR	_INTF
	.line	79, "main.c"; 	PORTB  			= 	0;																			// 上电为高电平
	CLRR	_PORTB
	.line	80, "main.c"; 	IOSTB  			= 	C_PB_Output;																// 设置为输入，1:输入, 0:输出（默认）
	CLRA	
	IOST	_IOSTB
	.line	81, "main.c"; 	BPHCON 			= 	0xFF;//(unsigned char)~(C_PB3_PHB | C_PB4_PHB);								// 端口B上拉0启用，0：上拉，1：取消上拉（默认）
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	82, "main.c"; 	BWUCON 			= 	0;//C_PB3_Wakeup | C_PB4_Wakeup;											// 允许唤醒，1启用：
	CLRR	_BWUCON
	.line	84, "main.c"; 	TMR0 			= 	DefReladNum;				// 装载定时器0初始值
	MOVIA	0xd6
	MOVAR	_TMR0
	.line	85, "main.c"; 	T0MD 			= 	C_PS0_Div4;					// Timer0定时器预分频器设置不得低于4分频
	MOVIA	0x01
	T0MD	
	.line	86, "main.c"; 	PCON1 			= 	C_TMR0_En;					// 开启Timer0
	IOST	_PCON1
	.line	88, "main.c"; 	INTE 			=  	C_INT_TMR0 | C_INT_PBKey;					// 允许Timer0中断  允许端口B输入状态变化中断 
	MOVIA	0x03
	MOVAR	_INTE
	.line	89, "main.c"; 	PCON 			= 	C_LVR_En | C_WDT_En;						// 允许LVR复位，允许看门狗复位
	MOVIA	0x88
	MOVAR	_PCON
	.line	90, "main.c"; 	ENI();															// 允许所有中断
	ENI
	.line	91, "main.c"; 	}
	RETURN	
; exit point of _Init_sys


;	code size estimation:
;	  160+    0 =   160 instructions (  320 byte)

	end
