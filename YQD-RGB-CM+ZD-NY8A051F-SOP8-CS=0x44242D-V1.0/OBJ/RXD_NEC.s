;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"RXD_NEC.c"
	list	p=NY8A054E,c=on
	#include "ny8a054e.inc"
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
	extern	_CurveFunc
	extern	_CurveTotalTimeFUNC
	extern	_Key1Function
	extern	_LED1Output
	extern	_BreathingDisplay
	extern	_SteplessAdjusted
	extern	_Blink3Times
	extern	_OutPwmR
	extern	_OutPwmG
	extern	_OutPwmB
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
	extern	_BreathingDisplay23
	extern	_Gear30
	extern	_Gear31
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
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_ABPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
	extern	_AWUCONbits
	extern	_INTEDGbits
	extern	_RFCbits
	extern	_INTE2bits
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
	extern	_Key2ValueTemp
	extern	_JumpValue
	extern	_Jump1Value
	extern	_gPwmRDtTemp
	extern	_gPwmGDtTemp
	extern	_gPwmBDtTemp
	extern	_TempFlag
	extern	_DefMinimumPercentage
	extern	_DefMaximumPercentage
	extern	_CurveTotalTime
	extern	_CurveTime
	extern	_DefCurveTime
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
	extern	_PORTA
	extern	_PORTB
	extern	_PCON
	extern	_BWUCON
	extern	_PCHBUF
	extern	_ABPLCON
	extern	_BPHCON
	extern	_INTE
	extern	_INTF
	extern	_AWUCON
	extern	_INTEDG
	extern	_TMRH
	extern	_RFC
	extern	_TM34RH
	extern	_INTE2
	extern	_TMR1
	extern	_T1CR1
	extern	_T1CR2
	extern	_PWM1DUTY
	extern	_PS1CV
	extern	_BZ1CR
	extern	_IRCR
	extern	_TBHP
	extern	_TBHD
	extern	_P2CR1
	extern	_PWM2DUTY
	extern	_OSCCR
	extern	_TMR3
	extern	_T3CR1
	extern	_T3CR2
	extern	_PWM3DUTY
	extern	_PS3CV
	extern	_P4CR1
	extern	_PWM4DUTY
	extern	_P5CR1
	extern	_PWM5DUTY
	extern	_PWM5RH
	extern	_IOSTA
	extern	_IOSTB
	extern	_APHCON
	extern	_PS0CV
	extern	_BODCON
	extern	_CMPCR
	extern	_PCON1
	extern	_T0MD

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_IrSteplessAdjusted
	extern	_InfraredFunction
	extern	_DataDecode
	extern	_RxdData
	extern	_RXDTime
	extern	_IRFlag
	extern	_RxdIrData
	extern	_RXDTimerCount

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
_DataDecode_IrCount_65536_89:
	.res	1
	.debuginfo gvariable name=_DataDecode_IrCount_65536_89,1byte,array=0,entsize=1,ext=0,enc=unsigned
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_IRFlag:
	dw	0x00
	.debuginfo gvariable name=_IRFlag,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_RxdIrData:
	dw	0x00
	.debuginfo gvariable name=_RxdIrData,1byte,array=0,entsize=1,ext=1,enc=unsigned


.segment "idata"
_RXDTimerCount:
	dw	0x00
	.debuginfo gvariable name=_RXDTimerCount,1byte,array=0,entsize=1,ext=1,enc=unsigned

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
.segment "code"; module=RXD_NEC, function=_IrSteplessAdjusted
	.debuginfo subprogram _IrSteplessAdjusted
_IrSteplessAdjusted:
; 2 exit points
	.line	172, "RXD_NEC.c"; 	if(FlagPWMAdd)
	BANKSEL	_KeyFlag
	BTRSS	_KeyFlag,6
	MGOTO	_00324_DS_
	.line	174, "RXD_NEC.c"; 	FlagPWMAdd = 0;
	BCR	_KeyFlag,6
	.line	175, "RXD_NEC.c"; 	if(FlagAddEnd == 0)
	BTRSC	_KeyFlag,4
	MGOTO	_00306_DS_
	.line	177, "RXD_NEC.c"; 	if((gPwmRDt > PwmPercent_0) && (gPwmRDt < PwmPercent_50))
	BANKSEL	_gPwmRDt
	MOVR	_gPwmRDt,W
	IORAR	(_gPwmRDt + 1),W
	BTRSC	STATUS,2
	MGOTO	_00293_DS_
;;unsigned compare: left < lit (0x200=512), size=2
	MOVIA	0x02
	SUBAR	(_gPwmRDt + 1),W
	BTRSS	STATUS,2
	MGOTO	_00385_DS_
	MOVIA	0x00
	SUBAR	_gPwmRDt,W
_00385_DS_:
	BTRSC	STATUS,0
	MGOTO	_00293_DS_
	.line	179, "RXD_NEC.c"; 	gPwmRDt <<= AddAndSubtractPwm;
	BCR	STATUS,0
	BANKSEL	_gPwmRDt
	RLR	_gPwmRDt,F
	RLR	(_gPwmRDt + 1),F
;;unsigned compare: left < lit (0x200=512), size=2
	.line	180, "RXD_NEC.c"; 	if(gPwmRDt >= PwmPercent_50)
	MOVIA	0x02
	SUBAR	(_gPwmRDt + 1),W
	BTRSS	STATUS,2
	MGOTO	_00386_DS_
	MOVIA	0x00
	SUBAR	_gPwmRDt,W
_00386_DS_:
	BTRSS	STATUS,0
	MGOTO	_00293_DS_
	.line	182, "RXD_NEC.c"; 	FlagAddEnd = 1;
	BANKSEL	_KeyFlag
	BSR	_KeyFlag,4
_00293_DS_:
	.line	186, "RXD_NEC.c"; 	if((gPwmGDt > PwmPercent_0) && (gPwmGDt < PwmPercent_50))
	BANKSEL	_gPwmGDt
	MOVR	_gPwmGDt,W
	IORAR	(_gPwmGDt + 1),W
	BTRSC	STATUS,2
	MGOTO	_00298_DS_
;;unsigned compare: left < lit (0x200=512), size=2
	MOVIA	0x02
	SUBAR	(_gPwmGDt + 1),W
	BTRSS	STATUS,2
	MGOTO	_00387_DS_
	MOVIA	0x00
	SUBAR	_gPwmGDt,W
_00387_DS_:
	BTRSC	STATUS,0
	MGOTO	_00298_DS_
	.line	188, "RXD_NEC.c"; 	gPwmGDt <<= AddAndSubtractPwm;
	BCR	STATUS,0
	BANKSEL	_gPwmGDt
	RLR	_gPwmGDt,F
	RLR	(_gPwmGDt + 1),F
;;unsigned compare: left < lit (0x200=512), size=2
	.line	189, "RXD_NEC.c"; 	if(gPwmGDt >= PwmPercent_50)
	MOVIA	0x02
	SUBAR	(_gPwmGDt + 1),W
	BTRSS	STATUS,2
	MGOTO	_00388_DS_
	MOVIA	0x00
	SUBAR	_gPwmGDt,W
_00388_DS_:
	BTRSS	STATUS,0
	MGOTO	_00298_DS_
	.line	191, "RXD_NEC.c"; 	FlagAddEnd = 1;
	BANKSEL	_KeyFlag
	BSR	_KeyFlag,4
_00298_DS_:
	.line	195, "RXD_NEC.c"; 	if((gPwmBDt > PwmPercent_0) && (gPwmBDt < PwmPercent_50))
	BANKSEL	_gPwmBDt
	MOVR	_gPwmBDt,W
	IORAR	(_gPwmBDt + 1),W
	BTRSC	STATUS,2
	MGOTO	_00306_DS_
;;unsigned compare: left < lit (0x200=512), size=2
	MOVIA	0x02
	SUBAR	(_gPwmBDt + 1),W
	BTRSS	STATUS,2
	MGOTO	_00389_DS_
	MOVIA	0x00
	SUBAR	_gPwmBDt,W
_00389_DS_:
	BTRSC	STATUS,0
	MGOTO	_00306_DS_
	.line	197, "RXD_NEC.c"; 	gPwmBDt <<= AddAndSubtractPwm;
	BCR	STATUS,0
	BANKSEL	_gPwmBDt
	RLR	_gPwmBDt,F
	RLR	(_gPwmBDt + 1),F
;;unsigned compare: left < lit (0x200=512), size=2
	.line	198, "RXD_NEC.c"; 	if(gPwmBDt >= PwmPercent_50)
	MOVIA	0x02
	SUBAR	(_gPwmBDt + 1),W
	BTRSS	STATUS,2
	MGOTO	_00390_DS_
	MOVIA	0x00
	SUBAR	_gPwmBDt,W
_00390_DS_:
	BTRSS	STATUS,0
	MGOTO	_00306_DS_
	.line	200, "RXD_NEC.c"; 	FlagAddEnd = 1;
	BANKSEL	_KeyFlag
	BSR	_KeyFlag,4
_00306_DS_:
	.line	205, "RXD_NEC.c"; 	gPwmRDtTemp = gPwmRDt;			//保存关机前亮度
	BANKSEL	_gPwmRDt
	MOVR	_gPwmRDt,W
	BANKSEL	_gPwmRDtTemp
	MOVAR	_gPwmRDtTemp
	BANKSEL	_gPwmRDt
	MOVR	(_gPwmRDt + 1),W
	BANKSEL	_gPwmRDtTemp
	MOVAR	(_gPwmRDtTemp + 1)
	.line	206, "RXD_NEC.c"; 	gPwmGDtTemp = gPwmGDt;
	BANKSEL	_gPwmGDt
	MOVR	_gPwmGDt,W
	BANKSEL	_gPwmGDtTemp
	MOVAR	_gPwmGDtTemp
	BANKSEL	_gPwmGDt
	MOVR	(_gPwmGDt + 1),W
	BANKSEL	_gPwmGDtTemp
	MOVAR	(_gPwmGDtTemp + 1)
	.line	207, "RXD_NEC.c"; 	gPwmBDtTemp = gPwmBDt;
	BANKSEL	_gPwmBDt
	MOVR	_gPwmBDt,W
	BANKSEL	_gPwmBDtTemp
	MOVAR	_gPwmBDtTemp
	BANKSEL	_gPwmBDt
	MOVR	(_gPwmBDt + 1),W
	BANKSEL	_gPwmBDtTemp
	MOVAR	(_gPwmBDtTemp + 1)
	.line	208, "RXD_NEC.c"; 	FlagMinusEnd = 0;
	BANKSEL	_KeyFlag
	BCR	_KeyFlag,5
	MGOTO	_00326_DS_
_00324_DS_:
	.line	210, "RXD_NEC.c"; 	else if(FlagPWMMinus)
	BANKSEL	_KeyFlag
	BTRSS	_KeyFlag,7
	MGOTO	_00326_DS_
	.line	212, "RXD_NEC.c"; 	FlagPWMMinus = 0;
	BCR	_KeyFlag,7
	.line	213, "RXD_NEC.c"; 	FlagAddEnd = 0;
	BCR	_KeyFlag,4
	.line	214, "RXD_NEC.c"; 	if(FlagMinusEnd == 0)
	BTRSC	_KeyFlag,5
	MGOTO	_00320_DS_
	.line	216, "RXD_NEC.c"; 	if(gPwmRDt > PwmPercent_0)
	BANKSEL	_gPwmRDt
	MOVR	_gPwmRDt,W
	IORAR	(_gPwmRDt + 1),W
	BTRSC	STATUS,2
	MGOTO	_00310_DS_
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	.line	218, "RXD_NEC.c"; 	gPwmRDt >>= AddAndSubtractPwm;
	BCR	STATUS,0
	RRR	(_gPwmRDt + 1),F
	RRR	_gPwmRDt,F
;;unsigned compare: left < lit (0x67=103), size=2
	.line	219, "RXD_NEC.c"; 	if(gPwmRDt < PwmPercent_10)
	MOVIA	0x00
	SUBAR	(_gPwmRDt + 1),W
	BTRSS	STATUS,2
	MGOTO	_00391_DS_
	MOVIA	0x67
	SUBAR	_gPwmRDt,W
_00391_DS_:
	BTRSC	STATUS,0
	MGOTO	_00310_DS_
	.line	221, "RXD_NEC.c"; 	FlagMinusEnd = 1;
	BANKSEL	_KeyFlag
	BSR	_KeyFlag,5
_00310_DS_:
	.line	225, "RXD_NEC.c"; 	if(gPwmGDt > PwmPercent_0)
	BANKSEL	_gPwmGDt
	MOVR	_gPwmGDt,W
	IORAR	(_gPwmGDt + 1),W
	BTRSC	STATUS,2
	MGOTO	_00314_DS_
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	.line	227, "RXD_NEC.c"; 	gPwmGDt >>= AddAndSubtractPwm;
	BCR	STATUS,0
	RRR	(_gPwmGDt + 1),F
	RRR	_gPwmGDt,F
;;unsigned compare: left < lit (0x67=103), size=2
	.line	228, "RXD_NEC.c"; 	if(gPwmGDt < PwmPercent_10)
	MOVIA	0x00
	SUBAR	(_gPwmGDt + 1),W
	BTRSS	STATUS,2
	MGOTO	_00392_DS_
	MOVIA	0x67
	SUBAR	_gPwmGDt,W
_00392_DS_:
	BTRSC	STATUS,0
	MGOTO	_00314_DS_
	.line	230, "RXD_NEC.c"; 	FlagMinusEnd = 1;
	BANKSEL	_KeyFlag
	BSR	_KeyFlag,5
_00314_DS_:
	.line	234, "RXD_NEC.c"; 	if(gPwmBDt > PwmPercent_0)
	BANKSEL	_gPwmBDt
	MOVR	_gPwmBDt,W
	IORAR	(_gPwmBDt + 1),W
	BTRSC	STATUS,2
	MGOTO	_00320_DS_
;;shiftRight_Left2ResultLit:5673: shCount=1, size=2, sign=0, same=1, offr=0
	.line	236, "RXD_NEC.c"; 	gPwmBDt >>= AddAndSubtractPwm;
	BCR	STATUS,0
	RRR	(_gPwmBDt + 1),F
	RRR	_gPwmBDt,F
;;unsigned compare: left < lit (0x67=103), size=2
	.line	237, "RXD_NEC.c"; 	if(gPwmBDt < PwmPercent_10)
	MOVIA	0x00
	SUBAR	(_gPwmBDt + 1),W
	BTRSS	STATUS,2
	MGOTO	_00393_DS_
	MOVIA	0x67
	SUBAR	_gPwmBDt,W
_00393_DS_:
	BTRSC	STATUS,0
	MGOTO	_00320_DS_
	.line	239, "RXD_NEC.c"; 	FlagMinusEnd = 1;
	BANKSEL	_KeyFlag
	BSR	_KeyFlag,5
_00320_DS_:
	.line	243, "RXD_NEC.c"; 	gPwmRDtTemp = gPwmRDt;			//保存关机前亮度
	BANKSEL	_gPwmRDt
	MOVR	_gPwmRDt,W
	BANKSEL	_gPwmRDtTemp
	MOVAR	_gPwmRDtTemp
	BANKSEL	_gPwmRDt
	MOVR	(_gPwmRDt + 1),W
	BANKSEL	_gPwmRDtTemp
	MOVAR	(_gPwmRDtTemp + 1)
	.line	244, "RXD_NEC.c"; 	gPwmGDtTemp = gPwmGDt;
	BANKSEL	_gPwmGDt
	MOVR	_gPwmGDt,W
	BANKSEL	_gPwmGDtTemp
	MOVAR	_gPwmGDtTemp
	BANKSEL	_gPwmGDt
	MOVR	(_gPwmGDt + 1),W
	BANKSEL	_gPwmGDtTemp
	MOVAR	(_gPwmGDtTemp + 1)
	.line	245, "RXD_NEC.c"; 	gPwmBDtTemp = gPwmBDt;
	BANKSEL	_gPwmBDt
	MOVR	_gPwmBDt,W
	BANKSEL	_gPwmBDtTemp
	MOVAR	_gPwmBDtTemp
	BANKSEL	_gPwmBDt
	MOVR	(_gPwmBDt + 1),W
	BANKSEL	_gPwmBDtTemp
	MOVAR	(_gPwmBDtTemp + 1)
_00326_DS_:
	.line	247, "RXD_NEC.c"; 	}
	RETURN	
; exit point of _IrSteplessAdjusted

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Gear30
;   _Gear31
;   _Gear30
;   _Gear31
;; Starting pCode block
.segment "code"; module=RXD_NEC, function=_InfraredFunction
	.debuginfo subprogram _InfraredFunction
_InfraredFunction:
; 2 exit points
	.line	113, "RXD_NEC.c"; 	if(IRFlag_DataOk)								//接收数据完成，找对应码值功能
	BANKSEL	_IRFlag
	BTRSS	_IRFlag,4
	MGOTO	_00243_DS_
	.line	115, "RXD_NEC.c"; 	IRFlag_DataOk = 0;
	BCR	_IRFlag,4
	.line	116, "RXD_NEC.c"; 	if(RxdIrData == DefIrRxdKey2Code)			//关机
	BANKSEL	_RxdIrData
	MOVR	_RxdIrData,W
	XORIA	0x02
	BTRSS	STATUS,2
	MGOTO	_00222_DS_
	.line	118, "RXD_NEC.c"; 	FlagStartFunction = 0;					//关闭遥控功能
	BANKSEL	_KeyFlag
	BCR	_KeyFlag,3
	.line	119, "RXD_NEC.c"; 	Gear30();
	MCALL	_Gear30
	MGOTO	_00223_DS_
_00222_DS_:
	.line	121, "RXD_NEC.c"; 	else if(RxdIrData == DefIrRxdKey3Code)		//开机
	BANKSEL	_RxdIrData
	MOVR	_RxdIrData,W
	XORIA	0x03
	BTRSS	STATUS,2
	MGOTO	_00223_DS_
	.line	123, "RXD_NEC.c"; 	FlagStartFunction = 1;					//开启遥控功能
	BANKSEL	_KeyFlag
	BSR	_KeyFlag,3
	.line	124, "RXD_NEC.c"; 	Gear31();
	MCALL	_Gear31
_00223_DS_:
	.line	127, "RXD_NEC.c"; 	if(FlagStartFunction)						//开启遥控功能
	BANKSEL	_KeyFlag
	BTRSS	_KeyFlag,3
	MGOTO	_00240_DS_
;;unsigned compare: left < lit (0x2=2), size=1
	.line	129, "RXD_NEC.c"; 	if(RxdIrData < 2)						//亮度调节
	MOVIA	0x02
	BANKSEL	_RxdIrData
	SUBAR	_RxdIrData,W
	BTRSC	STATUS,0
	MGOTO	_00237_DS_
	.line	131, "RXD_NEC.c"; 	if((Key2Value != DefIrRxdKey11Code) && (Key2Value != DefIrRxdKey15Code) && (Key2Value != DefIrRxdKey19Code) && (Key2Value != DefIrRxdKey23Code))
	BANKSEL	_Key2Value
	MOVR	_Key2Value,W
	XORIA	0x0b
	BTRSC	STATUS,2
	MGOTO	_00238_DS_
	MOVR	_Key2Value,W
	XORIA	0x0f
	BTRSC	STATUS,2
	MGOTO	_00238_DS_
	MOVR	_Key2Value,W
	XORIA	0x13
	BTRSC	STATUS,2
	MGOTO	_00238_DS_
	MOVR	_Key2Value,W
	XORIA	0x17
	BTRSC	STATUS,2
	MGOTO	_00238_DS_
	.line	133, "RXD_NEC.c"; 	if(RxdIrData == DefIrRxdKey0Code)
	BANKSEL	_RxdIrData
	MOVR	_RxdIrData,W
	BTRSS	STATUS,2
	MGOTO	_00227_DS_
	.line	135, "RXD_NEC.c"; 	FlagPWMAdd = 1;
	BANKSEL	_KeyFlag
	BSR	_KeyFlag,6
	.line	136, "RXD_NEC.c"; 	FlagMinusEnd = 0;					//PWM-结束 清零
	BCR	_KeyFlag,5
	MGOTO	_00228_DS_
_00227_DS_:
	.line	138, "RXD_NEC.c"; 	else if(RxdIrData == DefIrRxdKey1Code)
	BANKSEL	_RxdIrData
	MOVR	_RxdIrData,W
	XORIA	0x01
	BTRSS	STATUS,2
	MGOTO	_00228_DS_
	.line	140, "RXD_NEC.c"; 	FlagPWMMinus = 1;
	BANKSEL	_KeyFlag
	BSR	_KeyFlag,7
	.line	141, "RXD_NEC.c"; 	FlagAddEnd = 0;						//PWM+结束 清零
	BCR	_KeyFlag,4
_00228_DS_:
	.line	143, "RXD_NEC.c"; 	IRFlag_Adjust = 1;						//进入调光状态
	BANKSEL	_IRFlag
	BSR	_IRFlag,7
	MGOTO	_00238_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x4=4), size=1
_00237_DS_:
	.line	148, "RXD_NEC.c"; 	if(RxdIrData > 3)						//记录开机之后的按键值，方便恢复
	MOVIA	0x04
	BANKSEL	_RxdIrData
	SUBAR	_RxdIrData,W
	BTRSS	STATUS,0
	MGOTO	_00238_DS_
	.line	150, "RXD_NEC.c"; 	IRFlag_switch = 1;					//切换到遥控档位
	BANKSEL	_IRFlag
	BSR	_IRFlag,6
	.line	151, "RXD_NEC.c"; 	Key2Value = RxdIrData;				//读取档位值
	BANKSEL	_RxdIrData
	MOVR	_RxdIrData,W
	BANKSEL	_Key2Value
	MOVAR	_Key2Value
	.line	152, "RXD_NEC.c"; 	Key2ValueTemp = Key2Value;			//保存档位
	BANKSEL	_Key2ValueTemp
	MOVAR	_Key2ValueTemp
	.line	153, "RXD_NEC.c"; 	IRFlag_Adjust = 0;					//退出调光状态
	BANKSEL	_IRFlag
	BCR	_IRFlag,7
	.line	154, "RXD_NEC.c"; 	KeyValue = 0;						// 按键档位清零
	BANKSEL	_KeyValue
	CLRR	_KeyValue
	.line	155, "RXD_NEC.c"; 	FlagAddEnd = 1;						//切档后要先减后才能加
	BANKSEL	_KeyFlag
	BSR	_KeyFlag,4
	.line	156, "RXD_NEC.c"; 	FlagMinusEnd = 0;					//PWM-结束 清零
	BCR	_KeyFlag,5
_00238_DS_:
	.line	159, "RXD_NEC.c"; 	FlagPwmStart = 0;							//启动PWM标志清零
	BANKSEL	_TempFlag
	BCR	_TempFlag,2
_00240_DS_:
	.line	161, "RXD_NEC.c"; 	RxdIrData = 0;									//接收数据清零，方便下次解码
	BANKSEL	_RxdIrData
	CLRR	_RxdIrData
	.line	162, "RXD_NEC.c"; 	FlagBreathing = 0;								//停止呼吸功能
	BANKSEL	_TempFlag
	BCR	_TempFlag,7
	.line	163, "RXD_NEC.c"; 	FlagBreathing23 = 0;							//停止呼吸功能
	BCR	_TempFlag,3
	.line	164, "RXD_NEC.c"; 	FlagRStart = 0;									//呼吸清零
	BCR	_TempFlag,0
	.line	165, "RXD_NEC.c"; 	FlagGStart = 0;									//呼吸清零
	BCR	_TempFlag,1
	.line	166, "RXD_NEC.c"; 	FlagBStart = 0;									//呼吸清零
	BCR	_TempFlag,4
_00243_DS_:
	.line	168, "RXD_NEC.c"; 	}
	RETURN	
; exit point of _InfraredFunction

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _InfraredFunction
;   _InfraredFunction
;; Starting pCode block
.segment "code"; module=RXD_NEC, function=_DataDecode
	.debuginfo subprogram _DataDecode
;local variable name mapping:
	.debuginfo variable _IrCount=_DataDecode_IrCount_65536_89,enc=unsigned
_DataDecode:
; 0 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=1
	.line	46, "RXD_NEC.c"; 	if((RXDTimerCount > 100) && (RXDTimerCount < 150))		//码头13.5ms
	MOVIA	0x65
	BANKSEL	_RXDTimerCount
	SUBAR	_RXDTimerCount,W
	BTRSS	STATUS,0
	MGOTO	_00126_DS_
;;unsigned compare: left < lit (0x96=150), size=1
	MOVIA	0x96
	SUBAR	_RXDTimerCount,W
	BTRSC	STATUS,0
	MGOTO	_00126_DS_
	.line	48, "RXD_NEC.c"; 	IrCount = 0;
	BANKSEL	_DataDecode_IrCount_65536_89
	CLRR	_DataDecode_IrCount_65536_89
	.line	49, "RXD_NEC.c"; 	IRFlag_RxdData = 1;									//起始码接收正确，可以开始接收数据了
	BANKSEL	_IRFlag
	BSR	_IRFlag,5
_00126_DS_:
	.line	51, "RXD_NEC.c"; 	if(IRFlag_RxdData)
	BANKSEL	_IRFlag
	BTRSS	_IRFlag,5
	MGOTO	_00135_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x6=6), size=1
	.line	53, "RXD_NEC.c"; 	if((RXDTimerCount > 5) && (RXDTimerCount < 15))		//数据0 1.12ms
	MOVIA	0x06
	BANKSEL	_RXDTimerCount
	SUBAR	_RXDTimerCount,W
	BTRSS	STATUS,0
	MGOTO	_00129_DS_
;;unsigned compare: left < lit (0xF=15), size=1
	MOVIA	0x0f
	SUBAR	_RXDTimerCount,W
	BTRSC	STATUS,0
	MGOTO	_00129_DS_
	.line	55, "RXD_NEC.c"; 	IRFlag_OK = 1;									//接收成功
	BANKSEL	_IRFlag
	BSR	_IRFlag,2
	.line	56, "RXD_NEC.c"; 	IRFlag_Data = 0;
	BCR	_IRFlag,3
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x14=20), size=1
_00129_DS_:
	.line	58, "RXD_NEC.c"; 	if((RXDTimerCount > 19) && (RXDTimerCount < 25))	//数据1 2.25ms
	MOVIA	0x14
	BANKSEL	_RXDTimerCount
	SUBAR	_RXDTimerCount,W
	BTRSS	STATUS,0
	MGOTO	_00136_DS_
;;unsigned compare: left < lit (0x19=25), size=1
	MOVIA	0x19
	SUBAR	_RXDTimerCount,W
	BTRSC	STATUS,0
	MGOTO	_00136_DS_
	.line	60, "RXD_NEC.c"; 	IRFlag_OK = 1;									//接收成功
	BANKSEL	_IRFlag
	BSR	_IRFlag,2
	.line	61, "RXD_NEC.c"; 	IRFlag_Data = 1;
	BSR	_IRFlag,3
	MGOTO	_00136_DS_
_00135_DS_:
	.line	66, "RXD_NEC.c"; 	IrCount = 0;										//记步清零
	BANKSEL	_DataDecode_IrCount_65536_89
	CLRR	_DataDecode_IrCount_65536_89
	.line	67, "RXD_NEC.c"; 	RxdIrData = 0;										//接收数据清零
	BANKSEL	_RxdIrData
	CLRR	_RxdIrData
_00136_DS_:
	.line	70, "RXD_NEC.c"; 	if(IRFlag_OK)											//接收成功
	BANKSEL	_IRFlag
	BTRSS	_IRFlag,2
	MGOTO	_00157_DS_
	.line	72, "RXD_NEC.c"; 	IRFlag_OK = 0;
	BCR	_IRFlag,2
;;unsigned compare: left < lit (0x18=24), size=1
	.line	74, "RXD_NEC.c"; 	if(IrCount < 24)
	MOVIA	0x18
	BANKSEL	_DataDecode_IrCount_65536_89
	SUBAR	_DataDecode_IrCount_65536_89,W
	BTRSC	STATUS,0
	MGOTO	_00001_DS_
;;shiftRight_Left2ResultLit:5673: shCount=1, size=1, sign=0, same=1, offr=0
	.line	76, "RXD_NEC.c"; 	RxdIrData >>= 1;
	BCR	STATUS,0
	BANKSEL	_RxdIrData
	RRR	_RxdIrData,F
	.line	77, "RXD_NEC.c"; 	if(IRFlag_Data)
	BANKSEL	_IRFlag
	BTRSS	_IRFlag,3
	MGOTO	_00001_DS_
	.line	79, "RXD_NEC.c"; 	RxdIrData |= 0x80;
	BANKSEL	_RxdIrData
	BSR	_RxdIrData,7
_00001_DS_:
	.line	83, "RXD_NEC.c"; 	if(IrCount == 7)							//接收到8Bit数据
	BANKSEL	_DataDecode_IrCount_65536_89
	MOVR	_DataDecode_IrCount_65536_89,W
	XORIA	0x07
	BTRSS	STATUS,2
	MGOTO	_00151_DS_
	.line	85, "RXD_NEC.c"; 	if(RxdIrData != DefIrFristCode)			//客户码不对
	BANKSEL	_RxdIrData
	MOVR	_RxdIrData,W
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	.line	87, "RXD_NEC.c"; 	IrCount = 0;						//重新开始
	BANKSEL	_DataDecode_IrCount_65536_89
	CLRR	_DataDecode_IrCount_65536_89
	MGOTO	_00002_DS_
_00151_DS_:
	.line	90, "RXD_NEC.c"; 	else if(IrCount == 15)						//接收到16Bit数据
	BANKSEL	_DataDecode_IrCount_65536_89
	MOVR	_DataDecode_IrCount_65536_89,W
	XORIA	0x0f
	BTRSS	STATUS,2
	MGOTO	_00148_DS_
	.line	92, "RXD_NEC.c"; 	if(RxdIrData != DefIrSecondCode) 		//客户码补码不对
	BANKSEL	_RxdIrData
	MOVR	_RxdIrData,W
	XORIA	0xef
	BTRSC	STATUS,2
	MGOTO	_00002_DS_
	.line	94, "RXD_NEC.c"; 	IrCount 			= 	0;         	//重新开始
	BANKSEL	_DataDecode_IrCount_65536_89
	CLRR	_DataDecode_IrCount_65536_89
	MGOTO	_00002_DS_
_00148_DS_:
	.line	97, "RXD_NEC.c"; 	else if(IrCount == 23)						//接收到24Bit数据
	BANKSEL	_DataDecode_IrCount_65536_89
	MOVR	_DataDecode_IrCount_65536_89,W
	XORIA	0x17
	BTRSS	STATUS,2
	MGOTO	_00002_DS_
	.line	99, "RXD_NEC.c"; 	IRFlag_DataOk = 1;						//接收数据完成
	BANKSEL	_IRFlag
	BSR	_IRFlag,4
_00002_DS_:
	.line	102, "RXD_NEC.c"; 	InfraredFunction();							//接收数据完成，找对应码值功能
	MCALL	_InfraredFunction
	.line	104, "RXD_NEC.c"; 	if(IrCount < 255)
	MOVIA	0xff
	BANKSEL	_DataDecode_IrCount_65536_89
	SUBAR	_DataDecode_IrCount_65536_89,W
	BTRSS	STATUS,0
	.line	106, "RXD_NEC.c"; 	IrCount++;
	INCR	_DataDecode_IrCount_65536_89,F
_00157_DS_:
	.line	109, "RXD_NEC.c"; 	}
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _DataDecode
;   _DataDecode
;; Starting pCode block
.segment "code"; module=RXD_NEC, function=_RxdData
	.debuginfo subprogram _RxdData
_RxdData:
; 2 exit points
	.line	26, "RXD_NEC.c"; 	if(RXD)
	BANKSEL	_PORTA
	BTRSS	_PORTA,5
	MGOTO	_00118_DS_
	.line	28, "RXD_NEC.c"; 	IRFlag_Temp = 1;				//
	BANKSEL	_IRFlag
	BSR	_IRFlag,0
	MGOTO	_00120_DS_
_00118_DS_:
	.line	32, "RXD_NEC.c"; 	if(IRFlag_Temp)					//得到下降沿
	BANKSEL	_IRFlag
	BTRSS	_IRFlag,0
	MGOTO	_00120_DS_
	.line	34, "RXD_NEC.c"; 	IRFlag_Temp = 0;			//标志位清零
	BCR	_IRFlag,0
	.line	35, "RXD_NEC.c"; 	IRFlag_Start = 0;			//暂停计时，防止处理数据时出错
	BCR	_IRFlag,1
	.line	36, "RXD_NEC.c"; 	DataDecode();				//数据处理
	MCALL	_DataDecode
	.line	37, "RXD_NEC.c"; 	RXDTimerCount = 0;			//计时清零
	BANKSEL	_RXDTimerCount
	CLRR	_RXDTimerCount
	.line	38, "RXD_NEC.c"; 	IRFlag_Start = 1;			//开始计时
	BANKSEL	_IRFlag
	BSR	_IRFlag,1
_00120_DS_:
	.line	41, "RXD_NEC.c"; 	}
	RETURN	
; exit point of _RxdData

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=RXD_NEC, function=_RXDTime
	.debuginfo subprogram _RXDTime
_RXDTime:
; 2 exit points
	.line	9, "RXD_NEC.c"; 	if(IRFlag_Start)					//13.5ms/0.1ms=135
	BANKSEL	_IRFlag
	BTRSS	_IRFlag,1
	MGOTO	_00110_DS_
;;unsigned compare: left < lit (0x9B=155), size=1
	.line	11, "RXD_NEC.c"; 	if(RXDTimerCount < 155) 		
	MOVIA	0x9b
	BANKSEL	_RXDTimerCount
	SUBAR	_RXDTimerCount,W
	BTRSC	STATUS,0
	MGOTO	_00106_DS_
	.line	13, "RXD_NEC.c"; 	RXDTimerCount++; 			//开始计时
	INCR	_RXDTimerCount,F
	MGOTO	_00110_DS_
_00106_DS_:
	.line	17, "RXD_NEC.c"; 	RXDTimerCount = 0; 			//计时清零
	BANKSEL	_RXDTimerCount
	CLRR	_RXDTimerCount
	.line	18, "RXD_NEC.c"; 	IRFlag_Start = 0; 			//停止计时
	BANKSEL	_IRFlag
	BCR	_IRFlag,1
	.line	19, "RXD_NEC.c"; 	IRFlag_RxdData = 0;			//接收超时，不再接收数据
	BCR	_IRFlag,5
_00110_DS_:
	.line	22, "RXD_NEC.c"; 	}
	RETURN	
; exit point of _RXDTime


;	code size estimation:
;	  331+   99 =   430 instructions ( 1058 byte)

	end
