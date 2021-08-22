;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"Init_Timer.c"
	list	p=NY8A051F,c=on
	#include "ny8a051f.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
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
	extern	_delay
	extern	_Init_sys
	extern	_SleepMode
	extern	_ClearRamData
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
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_BPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
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
	extern	_Init_Timer0_Isr
	extern	_Init_Timer0
	extern	_gPwmRDt
	extern	_gPwmGDt
	extern	_gPwmBDt

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_gPwmRDt:
	dw	0x00, 0x00
	.debuginfo gvariable name=_gPwmRDt,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_gPwmGDt:
	dw	0x00, 0x00
	.debuginfo gvariable name=_gPwmGDt,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_gPwmBDt:
	dw	0x00, 0x00
	.debuginfo gvariable name=_gPwmBDt,2byte,array=0,entsize=2,ext=1,enc=unsigned

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
;; Starting pCode block
.segment "code"; module=Init_Timer, function=_Init_Timer0_Isr
	.debuginfo subprogram _Init_Timer0_Isr
_Init_Timer0_Isr:
; 2 exit points
	.line	19, "Init_Timer.c"; 	TMR0 = DefReladNum;								//装载定时器0初始值
	MOVIA	0xd6
	MOVAR	_TMR0
	.line	20, "Init_Timer.c"; 	}
	RETURN	
; exit point of _Init_Timer0_Isr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=Init_Timer, function=_Init_Timer0
	.debuginfo subprogram _Init_Timer0
_Init_Timer0:
; 2 exit points
	.line	12, "Init_Timer.c"; 	TMR0 			= 	DefReladNum;				// 装载定时器0初始值
	MOVIA	0xd6
	MOVAR	_TMR0
	.line	13, "Init_Timer.c"; 	T0MD 			= 	C_PS0_Div4;					// Timer0定时器预分频器设置不得低于4分频
	MOVIA	0x01
	T0MD	
	.line	14, "Init_Timer.c"; 	PCON1 			= 	C_TMR0_En;					// 开启Timer0
	IOST	_PCON1
	.line	15, "Init_Timer.c"; 	}
	RETURN	
; exit point of _Init_Timer0


;	code size estimation:
;	    9+    0 =     9 instructions (   18 byte)

	end
