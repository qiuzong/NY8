;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"LedBlink.c"
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
	extern	_delay
	extern	_Init_sys
	extern	_SleepMode
	extern	_ClearRamData
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
	extern	_CheckLowVoltage
	extern	_SOSMode
	extern	_Frequency100Hz
	extern	_Frequency50Hz
	extern	_Frequency8Hz
	extern	_Frequency7Hz
	extern	_Frequency6Hz
	extern	_Frequency3Hz
	extern	_Frequency2Hz
	extern	_FlagTemp
	extern	_VddGradeLVD
	extern	_BlinkCount
	extern	_Time2Hz
	extern	_Time3Hz
	extern	_Time6Hz
	extern	_Time7Hz
	extern	_Time8Hz
	extern	_Time50Hz
	extern	_Time100Hz
	extern	_Time200Ms
	extern	_SOSTime
	extern	_SosStatus

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
r0x100E:
	.res	1
.segment "uninit"
_CheckLowVoltage_ReadVoltageTime_65536_91:
	.res	1
	.debuginfo gvariable name=_CheckLowVoltage_ReadVoltageTime_65536_91,1byte,array=0,entsize=1,ext=0,enc=unsigned
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_FlagTemp:
	dw	0x00
	.debuginfo gvariable name=_FlagTemp,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_VddGradeLVD:
	dw	0x00
	.debuginfo gvariable name=_VddGradeLVD,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_BlinkCount:
	dw	0x00
	.debuginfo gvariable name=_BlinkCount,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_Time2Hz:
	dw	0x00
	.debuginfo gvariable name=_Time2Hz,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_Time3Hz:
	dw	0x00
	.debuginfo gvariable name=_Time3Hz,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_Time6Hz:
	dw	0x00, 0x00
	.debuginfo gvariable name=_Time6Hz,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_Time7Hz:
	dw	0x00
	.debuginfo gvariable name=_Time7Hz,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_Time8Hz:
	dw	0x00, 0x00
	.debuginfo gvariable name=_Time8Hz,2byte,array=0,entsize=2,ext=1,enc=unsigned


.segment "idata"
_Time50Hz:
	dw	0x00
	.debuginfo gvariable name=_Time50Hz,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_Time100Hz:
	dw	0x00
	.debuginfo gvariable name=_Time100Hz,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_Time200Ms:
	dw	0x00
	.debuginfo gvariable name=_Time200Ms,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_SOSTime:
	dw	0x00
	.debuginfo gvariable name=_SOSTime,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "code"
_SosStatus:
	retia 0x01
	retia 0x00
	retia 0x01
	retia 0x00
	retia 0x01
	retia 0x00
	retia 0x01
	retia 0x01
	retia 0x01
	retia 0x00
	retia 0x01
	retia 0x01
	retia 0x01
	retia 0x00
	retia 0x01
	retia 0x01
	retia 0x01
	retia 0x00
	retia 0x01
	retia 0x00
	retia 0x01
	retia 0x00
	retia 0x01
	retia 0x00
	retia 0x00
	retia 0x00
	retia 0x00
	retia 0x00
	retia 0x00

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
;functions called:
;   _ClearKeyData
;   _ClearKeyData
;1 compiler assigned register :
;   r0x100E
;; Starting pCode block
.segment "code"; module=LedBlink, function=_CheckLowVoltage
	.debuginfo subprogram _CheckLowVoltage
;local variable name mapping:
	.debuginfo variable _ReadVoltageTime=_CheckLowVoltage_ReadVoltageTime_65536_91,enc=unsigned
_CheckLowVoltage:
; 2 exit points
	.line	244, "LedBlink.c"; 	if( TimeSampling128mS == 0 ) { FlagVoltageSampling =	0; }
	BTRSC	_TimeCyc8bit,7
	MGOTO	_00174_DS_
	BCR	_TempFlag,6
_00174_DS_:
	.line	245, "LedBlink.c"; 	if( ( TimeSampling128mS == 1 ) && ( FlagVoltageSampling == 0 ) )	//25.6mS运行一次
	BTRSS	_TimeCyc8bit,7
	MGOTO	_00185_DS_
	BTRSC	_TempFlag,6
	MGOTO	_00185_DS_
	.line	247, "LedBlink.c"; 	FlagVoltageSampling = 1;
	BSR	_TempFlag,6
	.line	248, "LedBlink.c"; 	if((PCON1 & 0x40) != 0x40)						//低于2.4V
	IOSTR	_PCON1
	MOVAR	r0x100E
	MOVIA	0x40
	ANDAR	r0x100E,F
	MOVR	r0x100E,W
	XORIA	0x40
	BTRSC	STATUS,2
	MGOTO	_00180_DS_
	.line	250, "LedBlink.c"; 	ReadVoltageTime++;
	INCR	_CheckLowVoltage_ReadVoltageTime_65536_91,F
	.line	251, "LedBlink.c"; 	if(ReadVoltageTime >= 50)					//25.6ms*50=1280ms
	MOVIA	0x32
	SUBAR	_CheckLowVoltage_ReadVoltageTime_65536_91,W
	BTRSS	STATUS,0
	MGOTO	_00185_DS_
	.line	253, "LedBlink.c"; 	ReadVoltageTime = 0;
	CLRR	_CheckLowVoltage_ReadVoltageTime_65536_91
	.line	254, "LedBlink.c"; 	if(KeyValue > 0)
	MOVR	_KeyValue,W
	BTRSC	STATUS,2
	MGOTO	_00176_DS_
	.line	256, "LedBlink.c"; 	KeyValueTemp = KeyValue;					// 保存档位
	MOVR	_KeyValue,W
	MOVAR	_KeyValueTemp
	.line	257, "LedBlink.c"; 	KeyValue = 0;
	CLRR	_KeyValue
_00176_DS_:
	.line	259, "LedBlink.c"; 	BWUCON = C_PB5_Wakeup;							// 允许唤醒，1启用：
	MOVIA	0x20
	MOVAR	_BWUCON
	.line	260, "LedBlink.c"; 	ClearKeyData();
	MCALL	_ClearKeyData
	.line	261, "LedBlink.c"; 	KeyValueTemp0 = 1;
	BSR	_KeyFlag,2
	MGOTO	_00185_DS_
_00180_DS_:
	.line	266, "LedBlink.c"; 	ReadVoltageTime = 0;
	CLRR	_CheckLowVoltage_ReadVoltageTime_65536_91
_00185_DS_:
	.line	269, "LedBlink.c"; 	}
	RETURN	
; exit point of _CheckLowVoltage

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=LedBlink, function=_SOSMode
	.debuginfo subprogram _SOSMode
_SOSMode:
; 0 exit points
	.line	86, "LedBlink.c"; 	Time200Ms++;
	INCR	_Time200Ms,F
;;unsigned compare: left < lit (0x14=20), size=1
	.line	87, "LedBlink.c"; 	if(Time200Ms >= DefTime200Ms)
	MOVIA	0x14
	SUBAR	_Time200Ms,W
	BTRSS	STATUS,0
	MGOTO	_00168_DS_
	.line	89, "LedBlink.c"; 	Time200Ms = 0;
	CLRR	_Time200Ms
	.line	90, "LedBlink.c"; 	SOSTime++;
	INCR	_SOSTime,F
;;unsigned compare: left < lit (0x1D=29), size=1
	.line	91, "LedBlink.c"; 	if(SOSTime >= DefSOSTime)
	MOVIA	0x1d
	SUBAR	_SOSTime,W
	BTRSC	STATUS,0
	.line	93, "LedBlink.c"; 	SOSTime = 0;
	CLRR	_SOSTime
_00168_DS_:
	.line	96, "LedBlink.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=LedBlink, function=_Frequency100Hz
	.debuginfo subprogram _Frequency100Hz
_Frequency100Hz:
; 0 exit points
	.line	75, "LedBlink.c"; 	Time100Hz++;
	INCR	_Time100Hz,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	76, "LedBlink.c"; 	if(Time100Hz >= DefTime100Hz)
	MOVIA	0x64
	SUBAR	_Time100Hz,W
	BTRSC	STATUS,0
	.line	78, "LedBlink.c"; 	Time100Hz = 0;
	CLRR	_Time100Hz
	.line	80, "LedBlink.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=LedBlink, function=_Frequency50Hz
	.debuginfo subprogram _Frequency50Hz
_Frequency50Hz:
; 0 exit points
	.line	65, "LedBlink.c"; 	Time50Hz++;
	INCR	_Time50Hz,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	66, "LedBlink.c"; 	if(Time50Hz >= DefTime50Hz)
	MOVIA	0xc8
	SUBAR	_Time50Hz,W
	BTRSC	STATUS,0
	.line	68, "LedBlink.c"; 	Time50Hz = 0;
	CLRR	_Time50Hz
	.line	70, "LedBlink.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=LedBlink, function=_Frequency8Hz
	.debuginfo subprogram _Frequency8Hz
_Frequency8Hz:
; 2 exit points
	.line	55, "LedBlink.c"; 	Time8Hz++;
	INCR	_Time8Hz,F
	BTRSC	STATUS,2
	INCR	(_Time8Hz + 1),F
;;unsigned compare: left < lit (0xFA=250), size=2
	.line	56, "LedBlink.c"; 	if(Time8Hz >= DefTime8Hz)
	MOVIA	0x00
	SUBAR	(_Time8Hz + 1),W
	BTRSS	STATUS,2
	MGOTO	_00145_DS_
	MOVIA	0xfa
	SUBAR	_Time8Hz,W
_00145_DS_:
	BTRSS	STATUS,0
	MGOTO	_00140_DS_
	.line	58, "LedBlink.c"; 	Time8Hz = 0;
	CLRR	_Time8Hz
	CLRR	(_Time8Hz + 1)
_00140_DS_:
	.line	60, "LedBlink.c"; 	}
	RETURN	
; exit point of _Frequency8Hz

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=LedBlink, function=_Frequency7Hz
	.debuginfo subprogram _Frequency7Hz
_Frequency7Hz:
; 0 exit points
	.line	45, "LedBlink.c"; 	Time7Hz++;
	INCR	_Time7Hz,F
;;unsigned compare: left < lit (0x8C=140), size=1
	.line	46, "LedBlink.c"; 	if(Time7Hz >= DefTime7Hz)
	MOVIA	0x8c
	SUBAR	_Time7Hz,W
	BTRSC	STATUS,0
	.line	48, "LedBlink.c"; 	Time7Hz = 0;
	CLRR	_Time7Hz
	.line	50, "LedBlink.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=LedBlink, function=_Frequency6Hz
	.debuginfo subprogram _Frequency6Hz
_Frequency6Hz:
; 2 exit points
	.line	35, "LedBlink.c"; 	Time6Hz++;
	INCR	_Time6Hz,F
	BTRSC	STATUS,2
	INCR	(_Time6Hz + 1),F
;;unsigned compare: left < lit (0x14C=332), size=2
	.line	36, "LedBlink.c"; 	if(Time6Hz >= DefTime6Hz)
	MOVIA	0x01
	SUBAR	(_Time6Hz + 1),W
	BTRSS	STATUS,2
	MGOTO	_00126_DS_
	MOVIA	0x4c
	SUBAR	_Time6Hz,W
_00126_DS_:
	BTRSS	STATUS,0
	MGOTO	_00121_DS_
	.line	38, "LedBlink.c"; 	Time6Hz = 0;
	CLRR	_Time6Hz
	CLRR	(_Time6Hz + 1)
_00121_DS_:
	.line	40, "LedBlink.c"; 	}
	RETURN	
; exit point of _Frequency6Hz

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=LedBlink, function=_Frequency3Hz
	.debuginfo subprogram _Frequency3Hz
_Frequency3Hz:
; 0 exit points
	.line	25, "LedBlink.c"; 	Time3Hz++;
	INCR	_Time3Hz,F
;;unsigned compare: left < lit (0x21=33), size=1
	.line	26, "LedBlink.c"; 	if(Time3Hz >= DefTime3Hz)
	MOVIA	0x21
	SUBAR	_Time3Hz,W
	BTRSC	STATUS,0
	.line	28, "LedBlink.c"; 	Time3Hz = 0;
	CLRR	_Time3Hz
	.line	30, "LedBlink.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=LedBlink, function=_Frequency2Hz
	.debuginfo subprogram _Frequency2Hz
_Frequency2Hz:
; 0 exit points
	.line	15, "LedBlink.c"; 	Time2Hz++;
	INCR	_Time2Hz,F
;;unsigned compare: left < lit (0x32=50), size=1
	.line	16, "LedBlink.c"; 	if(Time2Hz >= DefTime2Hz)
	MOVIA	0x32
	SUBAR	_Time2Hz,W
	BTRSC	STATUS,0
	.line	18, "LedBlink.c"; 	Time2Hz = 0;
	CLRR	_Time2Hz
	.line	20, "LedBlink.c"; 	}
	RETURN	


;	code size estimation:
;	  105+    0 =   105 instructions (  210 byte)

	end
