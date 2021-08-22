#include "KeyFunction.h"

unsigned char TempFlag = 0;

unsigned char	KeyValueTemp = 0;

void	PWMOutPut(void)
{
	if(Time100Hz < gPwmRDt)
	{
		RLED = LED_ON;
	}
	else
	{
		RLED = LED_OFF;
	}
	
	if(Time100Hz < gPwmGDt)
	{
		GLED = LED_ON;
	}
	else
	{
		GLED = LED_OFF;
	}
	
	if(Time100Hz < gPwmBDt)
	{
		BLED = LED_ON;
	}
	else
	{
		BLED = LED_OFF;
	}
}


//第0档，LED1 灭		
void	Gear0(void)
{	
	gPwmRDt = PwmPercent_0;
	gPwmGDt = PwmPercent_0;
	gPwmBDt = PwmPercent_0;
	if((TimeUnitCnt1 >= (DefTimeUnitCnt1 / 2)) && (KEY1 == KEY_OFF) && (CntKey2On == 0) && (CntKeyOn == 0))
	{
		SleepMode();
	}
}

//第一档：白光
void	Gear1(void)
{	
		gPwmRDt = PwmPercent_100;
		gPwmGDt = PwmPercent_100;
		gPwmBDt = PwmPercent_100;
}

//第2档：RLED 100%亮	
void	Gear2(void)
{	
		gPwmRDt = PwmPercent_100;
		gPwmGDt = PwmPercent_0;
		gPwmBDt = PwmPercent_0;
}

//第3档：GLED 100%亮	
void	Gear3(void)
{
		gPwmRDt = PwmPercent_0;
		gPwmGDt = PwmPercent_100;
		gPwmBDt = PwmPercent_0;
}

//第4档：BLED 100%亮	
void	Gear4(void)
{	
		gPwmRDt = PwmPercent_0;
		gPwmGDt = PwmPercent_0;
		gPwmBDt = PwmPercent_100;
}

//第5档：RLED、GLED 100%亮	
void	Gear5(void)
{	
		gPwmRDt = PwmPercent_100;
		gPwmGDt = PwmPercent_100;
		gPwmBDt = PwmPercent_0;
}

//第6档：RLED、BLED 100%亮	
void	Gear6(void)
{	
		gPwmRDt = PwmPercent_100;
		gPwmGDt = PwmPercent_0;
		gPwmBDt = PwmPercent_100;
}

//第7档：GLED、BLED 100%亮	
void	Gear7(void)
{	
		gPwmRDt = PwmPercent_0;
		gPwmGDt = PwmPercent_100;
		gPwmBDt = PwmPercent_100;
}

//第8档：	
void	Gear8(void)
{	
	gPwmRDt = PwmPercent_100;
	gPwmGDt = PwmPercent_70;
	gPwmBDt = PwmPercent_0;
}

//第19档：呼吸
void	Gear19(void)
{	
	if(FlagBreathing == 0)
	{
		gPwmRDt = PwmPercent_20;
		gPwmGDt = PwmPercent_0;
		gPwmBDt = PwmPercent_50;
	}
	FlagBreathing = 1;
}

void	BreathingDisplay(void)
{
	static unsigned short Count;
	if(FlagBreathing)
	{
		Count++;
		if(Count >= 500)				//
		{
			Count = 0;
			if((gPwmRDt == PwmPercent_100) && (gPwmGDt == PwmPercent_100) && (gPwmBDt == PwmPercent_100))
			{
				FlagRStart = 1;
				FlagGStart = 1;
				FlagBStart = 1;
			}
			if((FlagRStart) && (FlagGStart) && (FlagBStart))
			{
				if(gPwmRDt > PwmPercent_0)
				{
					gPwmRDt--;
					gPwmGDt--;
				}
				else
				{
					FlagRStart = 0;
					FlagGStart = 0;
					FlagBStart = 0;
				}
			}
			else
			{
				if(FlagRStart == 0)
				{
					if(gPwmRDt < PwmPercent_100)
					{
						gPwmRDt++;
					}
					if(gPwmRDt == PwmPercent_100)
					{
						FlagRStart = 1;
						FlagGStart = 0;
					}
					if(gPwmBDt > PwmPercent_0)
					{
						gPwmBDt--;
					}
				}
				else if(FlagGStart == 0)
				{
					if(gPwmRDt > PwmPercent_0)
					{
						gPwmRDt--;
					}
					if(gPwmGDt < PwmPercent_100)
					{
						gPwmGDt++;
					}
					if(gPwmGDt == PwmPercent_100)
					{
						FlagGStart = 1;
					}
				}
				else
				{
					if(gPwmGDt > PwmPercent_0)
					{
						gPwmGDt--;
					}
					if(gPwmBDt < PwmPercent_100)
					{
						gPwmBDt++;
					}
					if(gPwmBDt == PwmPercent_100)
					{
						FlagRStart = 0;
						FlagGStart = 0;
					}
				}
			}
		}
	}
	else
	{
		Count = 0;
	}
}

/*
void	Blink3Times(void)					//闪2次
{
	if(FlagBlink == 1)
	{
		if(TimeUnitCnt2 < (DefTimeUnitCnt2 / 2))
		{
			gPwm1Dt = gPwm1DtTemp;
			FlagTempTurn = 0;
		}
		else
		{
			if(gPwm1Dt > 1)
			{
				gPwm1DtTemp = gPwm1Dt;
			}
			gPwm1Dt = 0;
			if((TimeUnitCnt2 >= (DefTimeUnitCnt2 - 1)) && (FlagTempTurn == 0))
			{
				FlagTempTurn = 1;
				BlinkCount++;
				if(BlinkCount >= 2)								//闪2下
				{
					BlinkCount = 0;
					FlagBlink = 0;
					gPwm1Dt = gPwm1DtTemp;
				}
			}
		}
	}
}

void	SteplessAdjusted(void)				//无极调光
{
	if(FlagKeyLong == 1)	//无极调光
	{
		if(TimeSampling20mS == 0) { FlagTempBit = 0; }
		if((TimeSampling20mS == 1) && (FlagTempBit == 0))
		{
			FlagTempBit = 1;
			if(FlagTurn == 0)
			{
				if(FlagAddBit == 0)		//PWM++
				{
					if(gPwm1Dt < PwmPercent_100) { gPwm1Dt++; }
					else 
					{
						FlagBlink = 1;
						FlagAddBit = 1; 
						TimeUnitCnt2 = 0;
						gPwm1DtTemp = gPwm1Dt;
						FlagTurn = 1;
						FlagKeyLong = 0;
					}
				}
				else					//PWM--
				{
					if(gPwm1Dt > PwmPercent_6) { gPwm1Dt--; }
					else 
					{
						FlagBlink = 1;
						FlagAddBit = 0; 
						TimeUnitCnt2 = 0;
						gPwm1DtTemp = gPwm1Dt;
						FlagTurn = 1;
						FlagKeyLong = 0;
					}
				}
			}
		}
	}
}
*/


/*
unsigned char	DefMinimumPercentage, DefMaximumPercentage;		// 最小百分比,最大百分比
unsigned char	CurveTotalTime;									// 曲线总时间 计时4分钟 4*60=240s
unsigned short	CurveTime, DefCurveTime;						// 曲线计时


void 	CurveTotalTimeFUNC(void)								//曲线总时间
{
	if(FlagCurve == 1)
	{
		if(CurveTotalTime < DefCurveTotalTime)
		{
			CurveTotalTime++;									//+1秒
		}
	}
	else
	{
		CurveTotalTime = 0;
	}
}

void 	CurveFunc(void)											//曲线函数
{
	if(CurveTotalTime >= (DefCurveTotalTime / 4)) 				//前1分钟不变
	{
		CurveTime++;											//+0.5ms
		if(gPwm1Dt == DefMaximumPercentage)
		{
			gPwm1Dt--;										//启动输出，输出占空比为99%的PWM
		//	Pwm1Start();									//10Bit Timer1 PWM1	启动PWM1
		}
		if(CurveTime >= DefCurveTime)
		{
			CurveTime = 0;
			if(gPwm1Dt > DefMinimumPercentage)				// 限制曲线最低点，防止多减
			{	
				gPwm1Dt--;									//
			//	Pwm1DataUp();								//10Bit Timer1 PWM1	曲线赋值
			}
		}
	}*/
/*	else
	{
		CurveTime++;											//+0.5ms
		if(CurveTime >= DefCurveTime)
		{
			CurveTime = 0;
			if(gPwm1Dt < DefMaximumPercentage)				// 限制曲线最大值，防止多加
			{	
				gPwm1Dt++;									//
			//	Pwm1DataUp();								//10Bit Timer1 PWM1	曲线赋值
				if(gPwm1Dt == DefMaximumPercentage)
				{
					if(KeyValue == 1)
					{
						DefCurveTime = DefCurveTime1;
					}
					else if(KeyValue == 2)
					{
						DefCurveTime = DefCurveTime2;
					}
					else if(KeyValue == 3)
					{
						DefCurveTime = DefCurveTime3;
					}
				}
			}
		}
	}*/
//}
/*
void	LED1Output(void)
{
	if(Time100Hz < gPwm1Dt)
	{
		LED1 = LED_ON;
	}
	else
	{
		LED1 = LED_OFF;
	}
}
*/