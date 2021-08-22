#include "RXD_NEC.h"

unsigned char	IRFlag = 0, RxdIrData = 0;


unsigned char	RXDTimerCount = 0;
void	RXDTime(void)					//接收计时	0.1ms进一次
{
	if(IRFlag_Start)					//13.5ms/0.1ms=135
	{
		if(RXDTimerCount < 155) 		
		{ 
			RXDTimerCount++; 			//开始计时
		} 
		else 							//155*0.1ms=15.5ms	大于起始码计时清零
		{ 
			RXDTimerCount = 0; 			//计时清零
			IRFlag_Start = 0; 			//停止计时
			IRFlag_RxdData = 0;			//接收超时，不再接收数据
		}
	}
}

void	RxdData(void)					//接收数据
{
	if(RXD)
	{
		IRFlag_Temp = 1;				//
	}
	else
	{
		if(IRFlag_Temp)					//得到下降沿
		{
			IRFlag_Temp = 0;			//标志位清零
			IRFlag_Start = 0;			//暂停计时，防止处理数据时出错
			DataDecode();				//数据处理
			RXDTimerCount = 0;			//计时清零
			IRFlag_Start = 1;			//开始计时
		}
	}
}

void	DataDecode(void)				//数据处理
{
	static unsigned char IrCount = 0;
	if((RXDTimerCount > 100) && (RXDTimerCount < 150))		//码头13.5ms
	{
		IrCount = 0;
		IRFlag_RxdData = 1;									//起始码接收正确，可以开始接收数据了
	}
	if(IRFlag_RxdData)
	{
		if((RXDTimerCount > 5) && (RXDTimerCount < 15))		//数据0 1.12ms
		{
			IRFlag_OK = 1;									//接收成功
			IRFlag_Data = 0;
		}
		if((RXDTimerCount > 19) && (RXDTimerCount < 25))	//数据1 2.25ms
		{
			IRFlag_OK = 1;									//接收成功
			IRFlag_Data = 1;
		}
	}
	else													//超时或起始码接收失败
	{
		IrCount = 0;										//记步清零
		RxdIrData = 0;										//接收数据清零
	}
	
	if(IRFlag_OK)											//接收成功
	{
		IRFlag_OK = 0;
		
		if(IrCount < 24)
		{
			RxdIrData >>= 1;
			if(IRFlag_Data)
			{
				RxdIrData |= 0x80;
			}
		}
		
		if(IrCount == 7)							//接收到8Bit数据
		{	
			if(RxdIrData != DefIrFristCode)			//客户码不对
			{
				IrCount = 0;						//重新开始
			}
		}
		else if(IrCount == 15)						//接收到16Bit数据
		{
			if(RxdIrData != DefIrSecondCode) 		//客户码补码不对
			{
				IrCount 			= 	0;         	//重新开始
			}
		}
		else if(IrCount == 23)						//接收到24Bit数据
		{
			IRFlag_DataOk = 1;						//接收数据完成
		}
		
		InfraredFunction();							//接收数据完成，找对应码值功能
		
		if(IrCount < 255)
		{
			IrCount++;
		}
	}
}

void	InfraredFunction(void)						//红外功能
{
	if(IRFlag_DataOk)								//接收数据完成，找对应码值功能
	{
		IRFlag_DataOk = 0;
		if(RxdIrData == DefIrRxdKey2Code)			//关机
		{
			FlagStartFunction = 0;					//关闭遥控功能
			Gear30();
		}
		else if(RxdIrData == DefIrRxdKey3Code)		//开机
		{
			FlagStartFunction = 1;					//开启遥控功能
			Gear31();
		}
		
		if(FlagStartFunction)						//开启遥控功能
		{
			if(RxdIrData < 2)						//亮度调节
			{
				if((Key2Value != DefIrRxdKey11Code) && (Key2Value != DefIrRxdKey15Code) && (Key2Value != DefIrRxdKey19Code) && (Key2Value != DefIrRxdKey23Code))
				{
					if(RxdIrData == DefIrRxdKey0Code)
					{
						FlagPWMAdd = 1;
						FlagMinusEnd = 0;					//PWM-结束 清零
					}
					else if(RxdIrData == DefIrRxdKey1Code)
					{
						FlagPWMMinus = 1;
						FlagAddEnd = 0;						//PWM+结束 清零
					}
					IRFlag_Adjust = 1;						//进入调光状态
				}
			}
			else										//
			{
				if(RxdIrData > 3)						//记录开机之后的按键值，方便恢复
				{
					IRFlag_switch = 1;					//切换到遥控档位
					Key2Value = RxdIrData;				//读取档位值
					Key2ValueTemp = Key2Value;			//保存档位
					IRFlag_Adjust = 0;					//退出调光状态
					KeyValue = 0;						// 按键档位清零
					FlagAddEnd = 1;						//切档后要先减后才能加
					FlagMinusEnd = 0;					//PWM-结束 清零
				}
			}
			FlagPwmStart = 0;							//启动PWM标志清零
		}
		RxdIrData = 0;									//接收数据清零，方便下次解码
		FlagBreathing = 0;								//停止呼吸功能
		FlagBreathing23 = 0;							//停止呼吸功能
		FlagRStart = 0;									//呼吸清零
		FlagGStart = 0;									//呼吸清零
		FlagBStart = 0;									//呼吸清零
	}
}

void	IrSteplessAdjusted(void)					//无极调光
{
	if(FlagPWMAdd)
	{
		FlagPWMAdd = 0;
		if(FlagAddEnd == 0)
		{
			if((gPwmRDt > PwmPercent_0) && (gPwmRDt < PwmPercent_50))
			{
				gPwmRDt <<= AddAndSubtractPwm;
				if(gPwmRDt >= PwmPercent_50)
				{
					FlagAddEnd = 1;
				}
			}
			
			if((gPwmGDt > PwmPercent_0) && (gPwmGDt < PwmPercent_50))
			{
				gPwmGDt <<= AddAndSubtractPwm;
				if(gPwmGDt >= PwmPercent_50)
				{
					FlagAddEnd = 1;
				}
			}

			if((gPwmBDt > PwmPercent_0) && (gPwmBDt < PwmPercent_50))
			{
				gPwmBDt <<= AddAndSubtractPwm;
				if(gPwmBDt >= PwmPercent_50)
				{
					FlagAddEnd = 1;
				}
			}
		}
		
		gPwmRDtTemp = gPwmRDt;			//保存关机前亮度
		gPwmGDtTemp = gPwmGDt;
		gPwmBDtTemp = gPwmBDt;
		FlagMinusEnd = 0;
	}
	else if(FlagPWMMinus)
	{
		FlagPWMMinus = 0;
		FlagAddEnd = 0;
		if(FlagMinusEnd == 0)
		{
			if(gPwmRDt > PwmPercent_0)
			{
				gPwmRDt >>= AddAndSubtractPwm;
				if(gPwmRDt < PwmPercent_10)
				{
					FlagMinusEnd = 1;
				}
			}
			
			if(gPwmGDt > PwmPercent_0)
			{
				gPwmGDt >>= AddAndSubtractPwm;
				if(gPwmGDt < PwmPercent_10)
				{
					FlagMinusEnd = 1;
				}
			}

			if(gPwmBDt > PwmPercent_0)
			{
				gPwmBDt >>= AddAndSubtractPwm;
				if(gPwmBDt < PwmPercent_10)
				{
					FlagMinusEnd = 1;
				}
			}
		}
		gPwmRDtTemp = gPwmRDt;			//保存关机前亮度
		gPwmGDtTemp = gPwmGDt;
		gPwmBDtTemp = gPwmBDt;
	}
}

