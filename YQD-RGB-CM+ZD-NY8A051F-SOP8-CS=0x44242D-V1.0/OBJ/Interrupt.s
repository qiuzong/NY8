;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"Interrupt.c"
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
	extern	___sdcc_saved_fsr
	extern	___sdcc_saved_stk00
	extern	___sdcc_saved_stk01

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
	extern	_isr
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

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
.segment "uninit"
_TimeCyc8bit:
	.res	1
	.debuginfo gvariable name=_TimeCyc8bit,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_TimeCyc8bit1:
	.res	1
	.debuginfo gvariable name=_TimeCyc8bit1,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_TimeUnitCnt0:
	.res	1
	.debuginfo gvariable name=_TimeUnitCnt0,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_TimeUnitCnt1:
	.res	1
	.debuginfo gvariable name=_TimeUnitCnt1,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_TimeUnitCnt2:
	.res	1
	.debuginfo gvariable name=_TimeUnitCnt2,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_TimeUnitCnt3:
	.res	1
	.debuginfo gvariable name=_TimeUnitCnt3,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_TimeUnitCnt4:
	.res	1
	.debuginfo gvariable name=_TimeUnitCnt4,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_Time2200mS:
	.res	1
	.debuginfo gvariable name=_Time2200mS,1byte,array=0,entsize=1,ext=1,enc=unsigned

.segment "uninit"
_Time11840mS:
	.res	2
	.debuginfo gvariable name=_Time11840mS,2byte,array=0,entsize=2,ext=1,enc=unsigned

.segment "uninit"
_Time55630mS:
	.res	2
	.debuginfo gvariable name=_Time55630mS,2byte,array=0,entsize=2,ext=1,enc=unsigned

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
;   _ClearKeyData
;   _Init_Timer0_Isr
;   _Frequency100Hz
;   _BreathingDisplay
;   _PWMOutPut
;   _ClearKeyData
;   _Init_Timer0_Isr
;   _Frequency100Hz
;   _BreathingDisplay
;   _PWMOutPut
;3 compiler assigned registers:
;   STK00
;   STK01
;   r0x100C
;; Starting pCode block
_isr:
; 0 exit points
	.line	12, "Interrupt.c"; 	void isr(void) __interrupt(0)
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
	.line	15, "Interrupt.c"; 	if(PBIF)
	BTRSS	_INTF,1
	MGOTO	_00116_DS_
	.line	17, "Interrupt.c"; 	PBIF 	= 	0;									//清中断
	MOVIA	0xfd
	MOVAR	_INTF
	.line	18, "Interrupt.c"; 	if(KEY1 == KEY_ON)								//震动开关
	BTRSC	_PORTB,4
	MGOTO	_00116_DS_
	.line	20, "Interrupt.c"; 	TimeUnitCnt4 = 0;
	CLRR	_TimeUnitCnt4
;;unsigned compare: left < lit (0xFF=255), size=1
	.line	21, "Interrupt.c"; 	if(( CntKey2On < 255 ) && (C_PB4_Wakeup == (BWUCON & C_PB4_Wakeup))) { CntKey2On++; }
	MOVIA	0xff
	SUBAR	_CntKey2On,W
	BTRSC	STATUS,0
	MGOTO	_00106_DS_
	MOVIA	0x10
	ANDAR	_BWUCON,W
;;1	MOVAR	r0x100C
	XORIA	0x10
	BTRSC	STATUS,2
	INCR	_CntKey2On,F
_00106_DS_:
	.line	22, "Interrupt.c"; 	if(CntKey2On == 1)		//触摸开启后震动才有效
	MOVR	_CntKey2On,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00116_DS_
;;unsigned compare: left < lit (0xA=10), size=1
	.line	24, "Interrupt.c"; 	if( KeyValue < DefGearMax )				//按键循环档位设置，KeyValue = 0 ~ 1
	MOVIA	0x0a
	SUBAR	_KeyValue,W
	BTRSC	STATUS,0
	MGOTO	_00109_DS_
	.line	26, "Interrupt.c"; 	KeyValue++;
	INCR	_KeyValue,F
	MGOTO	_00110_DS_
_00109_DS_:
	.line	30, "Interrupt.c"; 	KeyValue = 1;
	MOVIA	0x01
	MOVAR	_KeyValue
_00110_DS_:
	.line	32, "Interrupt.c"; 	KeyValueTemp = KeyValue;					// 保存档位
	MOVR	_KeyValue,W
	MOVAR	_KeyValueTemp
	.line	33, "Interrupt.c"; 	ClearKeyData();
	MCALL	_ClearKeyData
_00116_DS_:
	.line	38, "Interrupt.c"; 	if(T0IF)											//Timer0中断
	BTRSS	_INTF,0
	MGOTO	_00129_DS_
	.line	40, "Interrupt.c"; 	T0IF			=	0;							//清Timer0中断
	MOVIA	0xfe
	MOVAR	_INTF
	.line	41, "Interrupt.c"; 	Init_Timer0_Isr();
	MCALL	_Init_Timer0_Isr
	.line	43, "Interrupt.c"; 	TimeCyc8bit++;
	INCR	_TimeCyc8bit,F
	.line	44, "Interrupt.c"; 	Frequency100Hz();
	MCALL	_Frequency100Hz
	.line	45, "Interrupt.c"; 	BreathingDisplay();								//呼吸显示
	MCALL	_BreathingDisplay
	.line	46, "Interrupt.c"; 	PWMOutPut();
	MCALL	_PWMOutPut
	.line	48, "Interrupt.c"; 	TimeUnitCnt0++;									//每0.1mS累加一次
	INCR	_TimeUnitCnt0,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	49, "Interrupt.c"; 	if(TimeUnitCnt0 >= DefTimeUnitCnt0)				//10mS循环计时
	MOVIA	0x64
	SUBAR	_TimeUnitCnt0,W
	BTRSS	STATUS,0
	MGOTO	_00120_DS_
	.line	51, "Interrupt.c"; 	TimeUnitCnt0		= 	0;
	CLRR	_TimeUnitCnt0
	.line	52, "Interrupt.c"; 	TimeCyc8bit1++;
	INCR	_TimeCyc8bit1,F
	.line	54, "Interrupt.c"; 	TimeUnitCnt1++;								//每10mS累加一次
	INCR	_TimeUnitCnt1,F
;;unsigned compare: left < lit (0x64=100), size=1
	.line	55, "Interrupt.c"; 	if(TimeUnitCnt1 >= DefTimeUnitCnt1)			//1S循环计时	
	MOVIA	0x64
	SUBAR	_TimeUnitCnt1,W
	BTRSC	STATUS,0
	.line	57, "Interrupt.c"; 	TimeUnitCnt1	= 	0;					//计数清零
	CLRR	_TimeUnitCnt1
_00120_DS_:
	.line	61, "Interrupt.c"; 	TimeUnitCnt3++;
	INCR	_TimeUnitCnt3,F
	.line	62, "Interrupt.c"; 	if(TimeUnitCnt3 >= DefTimeUnitCnt3)				//0.5mS循环计时
	MOVIA	0x05
	SUBAR	_TimeUnitCnt3,W
	BTRSS	STATUS,0
	MGOTO	_00129_DS_
	.line	64, "Interrupt.c"; 	TimeUnitCnt3		= 	0;
	CLRR	_TimeUnitCnt3
	.line	65, "Interrupt.c"; 	if(KEY1 == KEY_OFF)
	BTRSS	_PORTB,4
	MGOTO	_00129_DS_
	.line	67, "Interrupt.c"; 	TimeUnitCnt4++;
	INCR	_TimeUnitCnt4,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	68, "Interrupt.c"; 	if(TimeUnitCnt4 >= DefTimeUnitCnt4)					//100ms/0.5ms=200
	MOVIA	0xc8
	SUBAR	_TimeUnitCnt4,W
	BTRSS	STATUS,0
	MGOTO	_00129_DS_
	.line	70, "Interrupt.c"; 	TimeUnitCnt4 = 0;
	CLRR	_TimeUnitCnt4
	.line	71, "Interrupt.c"; 	CntKey2On = 0;
	CLRR	_CntKey2On
_00129_DS_:
	.line	77, "Interrupt.c"; 	}
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

;	code size estimation:
;	   94+    0 =    94 instructions (  188 byte)

	end
