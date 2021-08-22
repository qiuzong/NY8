;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
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
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_main

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

.segment "uninit", 0x20000010
PSAVE:
	.res 1
SSAVE:
	.res 1
WSAVE:
	.res 1
STK06:
	.res 1
STK05:
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
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
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
; code
;--------------------------------------------------------
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _Init_sys
;   _CheckLowVoltage
;   _GetKeyValue
;   _Gear0
;   _Gear1
;   _Gear2
;   _Gear3
;   _Gear4
;   _Gear5
;   _Gear6
;   _Gear7
;   _Gear8
;   _Gear19
;   _Gear0
;   _Gear0
;   _Init_sys
;   _CheckLowVoltage
;   _GetKeyValue
;   _Gear0
;   _Gear1
;   _Gear2
;   _Gear3
;   _Gear4
;   _Gear5
;   _Gear6
;   _Gear7
;   _Gear8
;   _Gear19
;   _Gear0
;   _Gear0
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	47, "main.c"; 	Init_sys();
	MCALL	_Init_sys
_00119_DS_:
	.line	50, "main.c"; 	CLRWDT();                               	//清看门狗
	clrwdt
	.line	51, "main.c"; 	CheckLowVoltage();							//低压检测
	MCALL	_CheckLowVoltage
	.line	52, "main.c"; 	GetKeyValue();								//按键检测
	MCALL	_GetKeyValue
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0xB=11), size=1
	.line	53, "main.c"; 	switch(KeyValue)               	        //根据按键值KeyValue选择待执行的功能
	MOVIA	0x0b
	SUBAR	_KeyValue,W
	BTRSC	STATUS,0
	MGOTO	_00116_DS_
	MOVIA	((_00130_DS_ >> 8) & 0xff)
	MOVAR	PCHBUF
	MOVR	_KeyValue,W
	ADDIA	_00130_DS_
	BTRSC	STATUS,0
	INCR	PCHBUF,F
	MOVAR	PCL
_00130_DS_:
	MGOTO	_00105_DS_
	MGOTO	_00106_DS_
	MGOTO	_00107_DS_
	MGOTO	_00108_DS_
	MGOTO	_00109_DS_
	MGOTO	_00110_DS_
	MGOTO	_00111_DS_
	MGOTO	_00112_DS_
	MGOTO	_00113_DS_
	MGOTO	_00114_DS_
	MGOTO	_00115_DS_
_00105_DS_:
	.line	55, "main.c"; 	case 0:		Gear0();  	break; 		//第0档
	MCALL	_Gear0
	MGOTO	_00119_DS_
_00106_DS_:
	.line	56, "main.c"; 	case 1:		Gear1(); 	break;		//第1档
	MCALL	_Gear1
	MGOTO	_00119_DS_
_00107_DS_:
	.line	57, "main.c"; 	case 2:		Gear2();  	break;		//第2档
	MCALL	_Gear2
	MGOTO	_00119_DS_
_00108_DS_:
	.line	58, "main.c"; 	case 3:		Gear3();  	break;		//第3档
	MCALL	_Gear3
	MGOTO	_00119_DS_
_00109_DS_:
	.line	59, "main.c"; 	case 4:		Gear4();  	break;		//第4档
	MCALL	_Gear4
	MGOTO	_00119_DS_
_00110_DS_:
	.line	60, "main.c"; 	case 5:		Gear5();  	break;		//第5档
	MCALL	_Gear5
	MGOTO	_00119_DS_
_00111_DS_:
	.line	61, "main.c"; 	case 6:		Gear6();  	break;		//第6档
	MCALL	_Gear6
	MGOTO	_00119_DS_
_00112_DS_:
	.line	62, "main.c"; 	case 7:		Gear7();  	break;		//第7档
	MCALL	_Gear7
	MGOTO	_00119_DS_
_00113_DS_:
	.line	63, "main.c"; 	case 8:		Gear8();  	break;		//第8档
	MCALL	_Gear8
	MGOTO	_00119_DS_
_00114_DS_:
	.line	64, "main.c"; 	case 9:		Gear19();  	break; 		//第9档
	MCALL	_Gear19
	MGOTO	_00119_DS_
_00115_DS_:
	.line	65, "main.c"; 	case 10:		Gear0();	break; 		//第10档
	MCALL	_Gear0
	MGOTO	_00119_DS_
_00116_DS_:
	.line	66, "main.c"; 	default:		Gear0();  	break;
	MCALL	_Gear0
	.line	67, "main.c"; 	}
	MGOTO	_00119_DS_
	.line	69, "main.c"; 	}
	RETURN	
; exit point of _main


;	code size estimation:
;	   50+    0 =    50 instructions (  100 byte)

	end
