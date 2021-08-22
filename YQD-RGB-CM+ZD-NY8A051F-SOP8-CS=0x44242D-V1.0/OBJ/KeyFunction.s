;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"KeyFunction.c"
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
	extern	_Key1Function
	extern	_LED1Output
	extern	_SteplessAdjusted
	extern	_Blink3Times
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
	extern	_Gear20
	extern	_Gear21
	extern	_Gear22
	extern	_Gear23
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
	extern	_BreathingDisplay
	extern	_Gear19
	extern	_Gear8
	extern	_Gear7
	extern	_Gear6
	extern	_Gear5
	extern	_Gear4
	extern	_Gear3
	extern	_Gear2
	extern	_Gear1
	extern	_Gear0
	extern	_PWMOutPut
	extern	_TempFlag
	extern	_KeyValueTemp

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
r0x100C:
	.res	1
.segment "uninit"
r0x100D:
	.res	1
.segment "uninit"
_BreathingDisplay_Count_65536_96:
	.res	2
	.debuginfo gvariable name=_BreathingDisplay_Count_65536_96,2byte,array=0,entsize=1,ext=0,enc=unsigned
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_TempFlag:
	dw	0x00
	.debuginfo gvariable name=_TempFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_KeyValueTemp:
	dw	0x00
	.debuginfo gvariable name=_KeyValueTemp,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
.segment "code"; module=KeyFunction, function=_BreathingDisplay
	.debuginfo subprogram _BreathingDisplay
;local variable name mapping:
	.debuginfo variable _Count=_BreathingDisplay_Count_65536_96,enc=unsigned
_BreathingDisplay:
; 2 exit points
	.line	129, "KeyFunction.c"; 	if(FlagBreathing)
	BTRSS	_TempFlag,7
	MGOTO	_00219_DS_
	.line	131, "KeyFunction.c"; 	Count++;
	INCR	_BreathingDisplay_Count_65536_96,F
	BTRSC	STATUS,2
	INCR	(_BreathingDisplay_Count_65536_96 + 1),F
;;unsigned compare: left < lit (0x1F4=500), size=2
	.line	132, "KeyFunction.c"; 	if(Count >= 500)				//
	MOVIA	0x01
	SUBAR	(_BreathingDisplay_Count_65536_96 + 1),W
	BTRSS	STATUS,2
	MGOTO	_00283_DS_
	MOVIA	0xf4
	SUBAR	_BreathingDisplay_Count_65536_96,W
_00283_DS_:
	BTRSS	STATUS,0
	MGOTO	_00221_DS_
	.line	134, "KeyFunction.c"; 	Count = 0;
	CLRR	_BreathingDisplay_Count_65536_96
	CLRR	(_BreathingDisplay_Count_65536_96 + 1)
	.line	135, "KeyFunction.c"; 	if((gPwmRDt == PwmPercent_100) && (gPwmGDt == PwmPercent_100) && (gPwmBDt == PwmPercent_100))
	MOVR	_gPwmRDt,W
	XORIA	0x64
	BTRSS	STATUS,2
	MGOTO	_00181_DS_
	MOVR	(_gPwmRDt + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	MGOTO	_00181_DS_
	MOVR	_gPwmGDt,W
	XORIA	0x64
	BTRSS	STATUS,2
	MGOTO	_00181_DS_
	MOVR	(_gPwmGDt + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	MGOTO	_00181_DS_
	MOVR	_gPwmBDt,W
	XORIA	0x64
	BTRSS	STATUS,2
	MGOTO	_00181_DS_
	MOVR	(_gPwmBDt + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	MGOTO	_00181_DS_
	.line	137, "KeyFunction.c"; 	FlagRStart = 1;
	BSR	_TempFlag,0
	.line	138, "KeyFunction.c"; 	FlagGStart = 1;
	BSR	_TempFlag,1
	.line	139, "KeyFunction.c"; 	FlagBStart = 1;
	BSR	_TempFlag,4
_00181_DS_:
	.line	141, "KeyFunction.c"; 	if((FlagRStart) && (FlagGStart) && (FlagBStart))
	BTRSS	_TempFlag,0
	MGOTO	_00212_DS_
	BTRSS	_TempFlag,1
	MGOTO	_00212_DS_
	BTRSS	_TempFlag,4
	MGOTO	_00212_DS_
	.line	143, "KeyFunction.c"; 	if(gPwmRDt > PwmPercent_0)
	MOVR	_gPwmRDt,W
	IORAR	(_gPwmRDt + 1),W
	BTRSC	STATUS,2
	MGOTO	_00185_DS_
	.line	145, "KeyFunction.c"; 	gPwmRDt--;
	MOVIA	0xff
	ADDAR	_gPwmRDt,F
	BTRSS	STATUS,0
	DECR	(_gPwmRDt + 1),F
	.line	146, "KeyFunction.c"; 	gPwmGDt--;
	MOVIA	0xff
	ADDAR	_gPwmGDt,F
	BTRSS	STATUS,0
	DECR	(_gPwmGDt + 1),F
	MGOTO	_00221_DS_
_00185_DS_:
	.line	150, "KeyFunction.c"; 	FlagRStart = 0;
	BCR	_TempFlag,0
	.line	151, "KeyFunction.c"; 	FlagGStart = 0;
	BCR	_TempFlag,1
	.line	152, "KeyFunction.c"; 	FlagBStart = 0;
	BCR	_TempFlag,4
	MGOTO	_00221_DS_
_00212_DS_:
	.line	157, "KeyFunction.c"; 	if(FlagRStart == 0)
	BTRSC	_TempFlag,0
	MGOTO	_00209_DS_
;;unsigned compare: left < lit (0x64=100), size=2
	.line	159, "KeyFunction.c"; 	if(gPwmRDt < PwmPercent_100)
	MOVIA	0x00
	SUBAR	(_gPwmRDt + 1),W
	BTRSS	STATUS,2
	MGOTO	_00284_DS_
	MOVIA	0x64
	SUBAR	_gPwmRDt,W
_00284_DS_:
	BTRSC	STATUS,0
	MGOTO	_00188_DS_
	.line	161, "KeyFunction.c"; 	gPwmRDt++;
	INCR	_gPwmRDt,F
	BTRSC	STATUS,2
	INCR	(_gPwmRDt + 1),F
_00188_DS_:
	.line	163, "KeyFunction.c"; 	if(gPwmRDt == PwmPercent_100)
	MOVR	_gPwmRDt,W
	XORIA	0x64
	BTRSS	STATUS,2
	MGOTO	_00190_DS_
	MOVR	(_gPwmRDt + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	MGOTO	_00190_DS_
	.line	165, "KeyFunction.c"; 	FlagRStart = 1;
	BSR	_TempFlag,0
	.line	166, "KeyFunction.c"; 	FlagGStart = 0;
	BCR	_TempFlag,1
_00190_DS_:
	.line	168, "KeyFunction.c"; 	if(gPwmBDt > PwmPercent_0)
	MOVR	_gPwmBDt,W
	IORAR	(_gPwmBDt + 1),W
	BTRSC	STATUS,2
	MGOTO	_00221_DS_
	.line	170, "KeyFunction.c"; 	gPwmBDt--;
	MOVIA	0xff
	ADDAR	_gPwmBDt,F
	BTRSS	STATUS,0
	DECR	(_gPwmBDt + 1),F
	MGOTO	_00221_DS_
_00209_DS_:
	.line	173, "KeyFunction.c"; 	else if(FlagGStart == 0)
	BTRSC	_TempFlag,1
	MGOTO	_00206_DS_
	.line	175, "KeyFunction.c"; 	if(gPwmRDt > PwmPercent_0)
	MOVR	_gPwmRDt,W
	IORAR	(_gPwmRDt + 1),W
	BTRSC	STATUS,2
	MGOTO	_00194_DS_
	.line	177, "KeyFunction.c"; 	gPwmRDt--;
	MOVIA	0xff
	ADDAR	_gPwmRDt,F
	BTRSS	STATUS,0
	DECR	(_gPwmRDt + 1),F
;;unsigned compare: left < lit (0x64=100), size=2
_00194_DS_:
	.line	179, "KeyFunction.c"; 	if(gPwmGDt < PwmPercent_100)
	MOVIA	0x00
	SUBAR	(_gPwmGDt + 1),W
	BTRSS	STATUS,2
	MGOTO	_00285_DS_
	MOVIA	0x64
	SUBAR	_gPwmGDt,W
_00285_DS_:
	BTRSC	STATUS,0
	MGOTO	_00196_DS_
	.line	181, "KeyFunction.c"; 	gPwmGDt++;
	INCR	_gPwmGDt,F
	BTRSC	STATUS,2
	INCR	(_gPwmGDt + 1),F
_00196_DS_:
	.line	183, "KeyFunction.c"; 	if(gPwmGDt == PwmPercent_100)
	MOVR	_gPwmGDt,W
	XORIA	0x64
	BTRSS	STATUS,2
	MGOTO	_00221_DS_
	MOVR	(_gPwmGDt + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	MGOTO	_00221_DS_
	.line	185, "KeyFunction.c"; 	FlagGStart = 1;
	BSR	_TempFlag,1
	MGOTO	_00221_DS_
_00206_DS_:
	.line	190, "KeyFunction.c"; 	if(gPwmGDt > PwmPercent_0)
	MOVR	_gPwmGDt,W
	IORAR	(_gPwmGDt + 1),W
	BTRSC	STATUS,2
	MGOTO	_00200_DS_
	.line	192, "KeyFunction.c"; 	gPwmGDt--;
	MOVIA	0xff
	ADDAR	_gPwmGDt,F
	BTRSS	STATUS,0
	DECR	(_gPwmGDt + 1),F
;;unsigned compare: left < lit (0x64=100), size=2
_00200_DS_:
	.line	194, "KeyFunction.c"; 	if(gPwmBDt < PwmPercent_100)
	MOVIA	0x00
	SUBAR	(_gPwmBDt + 1),W
	BTRSS	STATUS,2
	MGOTO	_00286_DS_
	MOVIA	0x64
	SUBAR	_gPwmBDt,W
_00286_DS_:
	BTRSC	STATUS,0
	MGOTO	_00202_DS_
	.line	196, "KeyFunction.c"; 	gPwmBDt++;
	INCR	_gPwmBDt,F
	BTRSC	STATUS,2
	INCR	(_gPwmBDt + 1),F
_00202_DS_:
	.line	198, "KeyFunction.c"; 	if(gPwmBDt == PwmPercent_100)
	MOVR	_gPwmBDt,W
	XORIA	0x64
	BTRSS	STATUS,2
	MGOTO	_00221_DS_
	MOVR	(_gPwmBDt + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	MGOTO	_00221_DS_
	.line	200, "KeyFunction.c"; 	FlagRStart = 0;
	BCR	_TempFlag,0
	.line	201, "KeyFunction.c"; 	FlagGStart = 0;
	BCR	_TempFlag,1
	MGOTO	_00221_DS_
_00219_DS_:
	.line	209, "KeyFunction.c"; 	Count = 0;
	CLRR	_BreathingDisplay_Count_65536_96
	CLRR	(_BreathingDisplay_Count_65536_96 + 1)
_00221_DS_:
	.line	211, "KeyFunction.c"; 	}
	RETURN	
; exit point of _BreathingDisplay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=KeyFunction, function=_Gear19
	.debuginfo subprogram _Gear19
_Gear19:
; 2 exit points
	.line	117, "KeyFunction.c"; 	if(FlagBreathing == 0)
	BTRSC	_TempFlag,7
	MGOTO	_00175_DS_
	.line	119, "KeyFunction.c"; 	gPwmRDt = PwmPercent_20;
	MOVIA	0x14
	MOVAR	_gPwmRDt
	CLRR	(_gPwmRDt + 1)
	.line	120, "KeyFunction.c"; 	gPwmGDt = PwmPercent_0;
	CLRR	_gPwmGDt
	CLRR	(_gPwmGDt + 1)
	.line	121, "KeyFunction.c"; 	gPwmBDt = PwmPercent_50;
	MOVIA	0x32
	MOVAR	_gPwmBDt
	CLRR	(_gPwmBDt + 1)
_00175_DS_:
	.line	123, "KeyFunction.c"; 	FlagBreathing = 1;
	BSR	_TempFlag,7
	.line	124, "KeyFunction.c"; 	}
	RETURN	
; exit point of _Gear19

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=KeyFunction, function=_Gear8
	.debuginfo subprogram _Gear8
_Gear8:
; 2 exit points
	.line	109, "KeyFunction.c"; 	gPwmRDt = PwmPercent_100;
	MOVIA	0x64
	MOVAR	_gPwmRDt
	CLRR	(_gPwmRDt + 1)
	.line	110, "KeyFunction.c"; 	gPwmGDt = PwmPercent_70;
	MOVIA	0x46
	MOVAR	_gPwmGDt
	CLRR	(_gPwmGDt + 1)
	.line	111, "KeyFunction.c"; 	gPwmBDt = PwmPercent_0;
	CLRR	_gPwmBDt
	CLRR	(_gPwmBDt + 1)
	.line	112, "KeyFunction.c"; 	}
	RETURN	
; exit point of _Gear8

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=KeyFunction, function=_Gear7
	.debuginfo subprogram _Gear7
_Gear7:
; 2 exit points
	.line	101, "KeyFunction.c"; 	gPwmRDt = PwmPercent_0;
	CLRR	_gPwmRDt
	CLRR	(_gPwmRDt + 1)
	.line	102, "KeyFunction.c"; 	gPwmGDt = PwmPercent_100;
	MOVIA	0x64
	MOVAR	_gPwmGDt
	CLRR	(_gPwmGDt + 1)
	.line	103, "KeyFunction.c"; 	gPwmBDt = PwmPercent_100;
	MOVIA	0x64
	MOVAR	_gPwmBDt
	CLRR	(_gPwmBDt + 1)
	.line	104, "KeyFunction.c"; 	}
	RETURN	
; exit point of _Gear7

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=KeyFunction, function=_Gear6
	.debuginfo subprogram _Gear6
_Gear6:
; 2 exit points
	.line	93, "KeyFunction.c"; 	gPwmRDt = PwmPercent_100;
	MOVIA	0x64
	MOVAR	_gPwmRDt
	CLRR	(_gPwmRDt + 1)
	.line	94, "KeyFunction.c"; 	gPwmGDt = PwmPercent_0;
	CLRR	_gPwmGDt
	CLRR	(_gPwmGDt + 1)
	.line	95, "KeyFunction.c"; 	gPwmBDt = PwmPercent_100;
	MOVIA	0x64
	MOVAR	_gPwmBDt
	CLRR	(_gPwmBDt + 1)
	.line	96, "KeyFunction.c"; 	}
	RETURN	
; exit point of _Gear6

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=KeyFunction, function=_Gear5
	.debuginfo subprogram _Gear5
_Gear5:
; 2 exit points
	.line	85, "KeyFunction.c"; 	gPwmRDt = PwmPercent_100;
	MOVIA	0x64
	MOVAR	_gPwmRDt
	CLRR	(_gPwmRDt + 1)
	.line	86, "KeyFunction.c"; 	gPwmGDt = PwmPercent_100;
	MOVIA	0x64
	MOVAR	_gPwmGDt
	CLRR	(_gPwmGDt + 1)
	.line	87, "KeyFunction.c"; 	gPwmBDt = PwmPercent_0;
	CLRR	_gPwmBDt
	CLRR	(_gPwmBDt + 1)
	.line	88, "KeyFunction.c"; 	}
	RETURN	
; exit point of _Gear5

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=KeyFunction, function=_Gear4
	.debuginfo subprogram _Gear4
_Gear4:
; 2 exit points
	.line	77, "KeyFunction.c"; 	gPwmRDt = PwmPercent_0;
	CLRR	_gPwmRDt
	CLRR	(_gPwmRDt + 1)
	.line	78, "KeyFunction.c"; 	gPwmGDt = PwmPercent_0;
	CLRR	_gPwmGDt
	CLRR	(_gPwmGDt + 1)
	.line	79, "KeyFunction.c"; 	gPwmBDt = PwmPercent_100;
	MOVIA	0x64
	MOVAR	_gPwmBDt
	CLRR	(_gPwmBDt + 1)
	.line	80, "KeyFunction.c"; 	}
	RETURN	
; exit point of _Gear4

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=KeyFunction, function=_Gear3
	.debuginfo subprogram _Gear3
_Gear3:
; 2 exit points
	.line	69, "KeyFunction.c"; 	gPwmRDt = PwmPercent_0;
	CLRR	_gPwmRDt
	CLRR	(_gPwmRDt + 1)
	.line	70, "KeyFunction.c"; 	gPwmGDt = PwmPercent_100;
	MOVIA	0x64
	MOVAR	_gPwmGDt
	CLRR	(_gPwmGDt + 1)
	.line	71, "KeyFunction.c"; 	gPwmBDt = PwmPercent_0;
	CLRR	_gPwmBDt
	CLRR	(_gPwmBDt + 1)
	.line	72, "KeyFunction.c"; 	}
	RETURN	
; exit point of _Gear3

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=KeyFunction, function=_Gear2
	.debuginfo subprogram _Gear2
_Gear2:
; 2 exit points
	.line	61, "KeyFunction.c"; 	gPwmRDt = PwmPercent_100;
	MOVIA	0x64
	MOVAR	_gPwmRDt
	CLRR	(_gPwmRDt + 1)
	.line	62, "KeyFunction.c"; 	gPwmGDt = PwmPercent_0;
	CLRR	_gPwmGDt
	CLRR	(_gPwmGDt + 1)
	.line	63, "KeyFunction.c"; 	gPwmBDt = PwmPercent_0;
	CLRR	_gPwmBDt
	CLRR	(_gPwmBDt + 1)
	.line	64, "KeyFunction.c"; 	}
	RETURN	
; exit point of _Gear2

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=KeyFunction, function=_Gear1
	.debuginfo subprogram _Gear1
_Gear1:
; 2 exit points
	.line	53, "KeyFunction.c"; 	gPwmRDt = PwmPercent_100;
	MOVIA	0x64
	MOVAR	_gPwmRDt
	CLRR	(_gPwmRDt + 1)
	.line	54, "KeyFunction.c"; 	gPwmGDt = PwmPercent_100;
	MOVIA	0x64
	MOVAR	_gPwmGDt
	CLRR	(_gPwmGDt + 1)
	.line	55, "KeyFunction.c"; 	gPwmBDt = PwmPercent_100;
	MOVIA	0x64
	MOVAR	_gPwmBDt
	CLRR	(_gPwmBDt + 1)
	.line	56, "KeyFunction.c"; 	}
	RETURN	
; exit point of _Gear1

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _SleepMode
;   _SleepMode
;; Starting pCode block
.segment "code"; module=KeyFunction, function=_Gear0
	.debuginfo subprogram _Gear0
_Gear0:
; 0 exit points
	.line	41, "KeyFunction.c"; 	gPwmRDt = PwmPercent_0;
	CLRR	_gPwmRDt
	CLRR	(_gPwmRDt + 1)
	.line	42, "KeyFunction.c"; 	gPwmGDt = PwmPercent_0;
	CLRR	_gPwmGDt
	CLRR	(_gPwmGDt + 1)
	.line	43, "KeyFunction.c"; 	gPwmBDt = PwmPercent_0;
	CLRR	_gPwmBDt
	CLRR	(_gPwmBDt + 1)
;;unsigned compare: left < lit (0x32=50), size=1
	.line	44, "KeyFunction.c"; 	if((TimeUnitCnt1 >= (DefTimeUnitCnt1 / 2)) && (KEY1 == KEY_OFF) && (CntKey2On == 0) && (CntKeyOn == 0))
	MOVIA	0x32
	SUBAR	_TimeUnitCnt1,W
	BTRSS	STATUS,0
	MGOTO	_00137_DS_
	BTRSS	_PORTB,4
	MGOTO	_00137_DS_
	MOVR	_CntKey2On,W
	BTRSS	STATUS,2
	MGOTO	_00137_DS_
	MOVR	_CntKeyOn,W
	BTRSC	STATUS,2
	.line	46, "KeyFunction.c"; 	SleepMode();
	MCALL	_SleepMode
_00137_DS_:
	.line	48, "KeyFunction.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x100C
;   r0x100D
;; Starting pCode block
.segment "code"; module=KeyFunction, function=_PWMOutPut
	.debuginfo subprogram _PWMOutPut
_PWMOutPut:
; 2 exit points
	.line	9, "KeyFunction.c"; 	if(Time100Hz < gPwmRDt)
	MOVR	_Time100Hz,W
	MOVAR	r0x100C
	CLRR	r0x100D
	MOVR	(_gPwmRDt + 1),W
	SUBAR	r0x100D,W
	BTRSS	STATUS,2
	MGOTO	_00125_DS_
	MOVR	_gPwmRDt,W
	SUBAR	r0x100C,W
_00125_DS_:
	BTRSC	STATUS,0
	MGOTO	_00106_DS_
	.line	11, "KeyFunction.c"; 	RLED = LED_ON;
	BCR	_PORTB,1
	MGOTO	_00107_DS_
_00106_DS_:
	.line	15, "KeyFunction.c"; 	RLED = LED_OFF;
	BSR	_PORTB,1
_00107_DS_:
	.line	18, "KeyFunction.c"; 	if(Time100Hz < gPwmGDt)
	MOVR	(_gPwmGDt + 1),W
	SUBAR	r0x100D,W
	BTRSS	STATUS,2
	MGOTO	_00126_DS_
	MOVR	_gPwmGDt,W
	SUBAR	r0x100C,W
_00126_DS_:
	BTRSC	STATUS,0
	MGOTO	_00109_DS_
	.line	20, "KeyFunction.c"; 	GLED = LED_ON;
	BCR	_PORTB,2
	MGOTO	_00110_DS_
_00109_DS_:
	.line	24, "KeyFunction.c"; 	GLED = LED_OFF;
	BSR	_PORTB,2
_00110_DS_:
	.line	27, "KeyFunction.c"; 	if(Time100Hz < gPwmBDt)
	MOVR	(_gPwmBDt + 1),W
	SUBAR	r0x100D,W
	BTRSS	STATUS,2
	MGOTO	_00127_DS_
	MOVR	_gPwmBDt,W
	SUBAR	r0x100C,W
_00127_DS_:
	BTRSC	STATUS,0
	MGOTO	_00112_DS_
	.line	29, "KeyFunction.c"; 	BLED = LED_ON;
	BCR	_PORTB,0
	MGOTO	_00114_DS_
_00112_DS_:
	.line	33, "KeyFunction.c"; 	BLED = LED_OFF;
	BSR	_PORTB,0
_00114_DS_:
	.line	35, "KeyFunction.c"; 	}
	RETURN	
; exit point of _PWMOutPut


;	code size estimation:
;	  299+    0 =   299 instructions (  598 byte)

	end
