;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"Key.c"
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
	extern	_ClearKeyData
	extern	_GetKeyValue
	extern	_KeyFlag
	extern	_CntKeyOn
	extern	_KeyValue
	extern	_CntKey2On
	extern	_Key2Value

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_KeyFlag:
	.res	1
	.debuginfo gvariable name=_KeyFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_CntKeyOn:
	.res	1
	.debuginfo gvariable name=_CntKeyOn,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_KeyValue:
	.res	1
	.debuginfo gvariable name=_KeyValue,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_CntKey2On:
	.res	1
	.debuginfo gvariable name=_CntKey2On,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_Key2Value:
	.res	1
	.debuginfo gvariable name=_Key2Value,1byte,array=0,entsize=1,ext=1,enc=unsigned

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
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
;; Starting pCode block
.segment "code"; module=Key, function=_ClearKeyData
	.debuginfo subprogram _ClearKeyData
_ClearKeyData:
; 2 exit points
	.line	59, "Key.c"; 	TimeUnitCnt0	=	0;			//计数0.1ms清零
	CLRR	_TimeUnitCnt0
	.line	60, "Key.c"; 	TimeUnitCnt1	=	0;			//计数10ms清零
	CLRR	_TimeUnitCnt1
	.line	62, "Key.c"; 	FlagBreathing  	=	0;
	BCR	_TempFlag,7
	.line	63, "Key.c"; 	}
	RETURN	
; exit point of _ClearKeyData

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ClearKeyData
;   _ClearKeyData
;   _ClearKeyData
;   _ClearKeyData
;; Starting pCode block
.segment "code"; module=Key, function=_GetKeyValue
	.debuginfo subprogram _GetKeyValue
_GetKeyValue:
; 2 exit points
	.line	11, "Key.c"; 	if( KeySamplingTime == 0 ) { FlagKeySampling =	0; }
	BTRSC	_TimeCyc8bit,5
	MGOTO	_00106_DS_
	BCR	_KeyFlag,0
_00106_DS_:
	.line	12, "Key.c"; 	if( ( KeySamplingTime == 1 ) && ( FlagKeySampling == 0 ) )	//8mS运行一次
	BTRSS	_TimeCyc8bit,5
	MGOTO	_00128_DS_
	BTRSC	_KeyFlag,0
	MGOTO	_00128_DS_
	.line	14, "Key.c"; 	FlagKeySampling			=	1;
	BSR	_KeyFlag,0
	.line	16, "Key.c"; 	if(KEY2 == KEY_ON)										// 每次有效按键最少需要保持40mS
	BTRSC	_PORTB,5
	MGOTO	_00123_DS_
;;unsigned compare: left < lit (0xFF=255), size=1
	.line	18, "Key.c"; 	if(CntKeyOn < DefCntKeyOnMax)	 { CntKeyOn++; }
	MOVIA	0xff
	SUBAR	_CntKeyOn,W
	BTRSS	STATUS,0
	INCR	_CntKeyOn,F
	.line	19, "Key.c"; 	if(CntKeyOn == DefKeyLongPressTime)					// 长按1秒关
	MOVR	_CntKeyOn,W
	XORIA	0x9c
	BTRSS	STATUS,2
	MGOTO	_00128_DS_
	.line	21, "Key.c"; 	if(KeyValue > 0)
	MOVR	_KeyValue,W
	BTRSC	STATUS,2
	MGOTO	_00110_DS_
	.line	23, "Key.c"; 	KeyValueTemp = KeyValue;					// 保存档位
	MOVR	_KeyValue,W
	MOVAR	_KeyValueTemp
	.line	24, "Key.c"; 	KeyValue = 0;
	CLRR	_KeyValue
_00110_DS_:
	.line	26, "Key.c"; 	BWUCON = C_PB5_Wakeup;							// 允许唤醒，1启用：
	MOVIA	0x20
	MOVAR	_BWUCON
	.line	27, "Key.c"; 	ClearKeyData();
	MCALL	_ClearKeyData
	.line	28, "Key.c"; 	KeyValueTemp0 = 1;
	BSR	_KeyFlag,2
	MGOTO	_00128_DS_
;;unsigned compare: left < lit (0xA=10), size=1
_00123_DS_:
	.line	33, "Key.c"; 	if((CntKeyOn >= DefKeyOnTime) && (CntKeyOn < DefKeyLongPressTime))					//40mS
	MOVIA	0x0a
	SUBAR	_CntKeyOn,W
	BTRSS	STATUS,0
	MGOTO	_00120_DS_
;;unsigned compare: left < lit (0x9C=156), size=1
	MOVIA	0x9c
	SUBAR	_CntKeyOn,W
	BTRSC	STATUS,0
	MGOTO	_00120_DS_
	.line	35, "Key.c"; 	if(KeyValueTemp0)
	BTRSS	_KeyFlag,2
	MGOTO	_00117_DS_
	.line	37, "Key.c"; 	KeyValue = KeyValueTemp;					//恢复按键档位
	MOVR	_KeyValueTemp,W
	MOVAR	_KeyValue
	.line	38, "Key.c"; 	KeyValueTemp0 = 0;
	BCR	_KeyFlag,2
	MGOTO	_00118_DS_
;;unsigned compare: left < lit (0xA=10), size=1
_00117_DS_:
	.line	40, "Key.c"; 	else if( KeyValue < DefGearMax )				//按键循环档位设置，KeyValue = 0 ~ 1
	MOVIA	0x0a
	SUBAR	_KeyValue,W
	BTRSC	STATUS,0
	MGOTO	_00114_DS_
	.line	42, "Key.c"; 	KeyValue++;
	INCR	_KeyValue,F
	MGOTO	_00118_DS_
_00114_DS_:
	.line	46, "Key.c"; 	KeyValue = 1;
	MOVIA	0x01
	MOVAR	_KeyValue
_00118_DS_:
	.line	48, "Key.c"; 	KeyValueTemp = KeyValue;					// 保存档位
	MOVR	_KeyValue,W
	MOVAR	_KeyValueTemp
	.line	49, "Key.c"; 	BWUCON = C_PB4_Wakeup | C_PB5_Wakeup;						// 允许唤醒，1启用：
	MOVIA	0x30
	MOVAR	_BWUCON
	.line	50, "Key.c"; 	ClearKeyData();
	MCALL	_ClearKeyData
_00120_DS_:
	.line	52, "Key.c"; 	CntKeyOn = 0;
	CLRR	_CntKeyOn
_00128_DS_:
	.line	55, "Key.c"; 	}
	RETURN	
; exit point of _GetKeyValue


;	code size estimation:
;	   62+    0 =    62 instructions (  124 byte)

	end
