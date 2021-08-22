#include "LedBlink.h"

const unsigned char SosStatus[ 29 ] = 	{
											DefON,DefOFF,DefON,DefOFF,DefON,DefOFF,					//3短		
											DefON,DefON,DefON,DefOFF,DefON,DefON,DefON,DefOFF,DefON,DefON,DefON,DefOFF,		//3长
											DefON,DefOFF,DefON,DefOFF,DefON,DefOFF,					//3短
											DefOFF,DefOFF,DefOFF,DefOFF,DefOFF						//灭1s
										};

unsigned char	FlagTemp = 0, VddGradeLVD = 0, BlinkCount = 0;

unsigned char	Time2Hz = 0;
void	Frequency2Hz(void)
{
	Time2Hz++;
	if(Time2Hz >= DefTime2Hz)
	{
		Time2Hz = 0;
	}
}

unsigned char	Time3Hz = 0;
void	Frequency3Hz(void)
{
	Time3Hz++;
	if(Time3Hz >= DefTime3Hz)
	{
		Time3Hz = 0;
	}
}

unsigned short	Time6Hz = 0;
void	Frequency6Hz(void)
{
	Time6Hz++;
	if(Time6Hz >= DefTime6Hz)
	{
		Time6Hz = 0;
	}
}

unsigned char	Time7Hz = 0;
void	Frequency7Hz(void)
{
	Time7Hz++;
	if(Time7Hz >= DefTime7Hz)
	{
		Time7Hz = 0;
	}
}

unsigned short	Time8Hz = 0;
void	Frequency8Hz(void)
{
	Time8Hz++;
	if(Time8Hz >= DefTime8Hz)
	{
		Time8Hz = 0;
	}
}

unsigned char	Time50Hz = 0;
void	Frequency50Hz(void)
{
	Time50Hz++;
	if(Time50Hz >= DefTime50Hz)
	{
		Time50Hz = 0;
	}
}

unsigned char	Time100Hz = 0;
void	Frequency100Hz(void)
{
	Time100Hz++;
	if(Time100Hz >= DefTime100Hz)
	{
		Time100Hz = 0;
	}
}


unsigned char	Time200Ms = 0, SOSTime = 0;
void	SOSMode(void)
{
	Time200Ms++;
	if(Time200Ms >= DefTime200Ms)
	{
		Time200Ms = 0;
		SOSTime++;
		if(SOSTime >= DefSOSTime)
		{
			SOSTime = 0;
		}
	}
}
/*
void	ReadVoltage(void)											//读取电压
{
	static unsigned char ReadVoltageTime = 0;
	if( TimeSampling1mS == 0 )
	{
		FlagVoltageSampling			=	0;
	}

	if( ( TimeSampling1mS == 1 ) && ( FlagVoltageSampling == 0 ) )	//1mS运行一次
	{
		FlagVoltageSampling = 1;
		
		ReadVoltageTime++;
		if(ReadVoltageTime == 1)
		{
			PCON1 = C_TMR0_En | C_LVD_4P05V;						// 开启Timer0 设置LVD电压为4.05V
		}
		else if(ReadVoltageTime == 2)
		{
			if((PCON1 & 0x40) != 0x40)						//低于4.05V
			{
				VDD_4P05V = 0;
			}
			else
			{
				VDD_4P05V = 1;
			}
			PCON1 = C_TMR0_En | C_LVD_3P9V;							// 开启Timer0 设置LVD电压为3.9V
		}
		else if(ReadVoltageTime == 3)
		{
			if((PCON1 & 0x40) != 0x40)						//低于3.9V
			{
				VDD_3P90V = 0;
			}
			else
			{
				VDD_3P90V = 1;
			}
			PCON1 = C_TMR0_En | C_LVD_3P6V;							// 开启Timer0 设置LVD电压为3.6V
		}
		else if(ReadVoltageTime == 4)
		{
			if((PCON1 & 0x40) != 0x40)						//低于3.6V
			{
				VDD_3P60V = 0;
			}
			else
			{
				VDD_3P60V = 1;
			}
			PCON1 = C_TMR0_En | C_LVD_3P3V;							// 开启Timer0 设置LVD电压为3.3V
		}
		else if(ReadVoltageTime == 5)
		{
			if((PCON1 & 0x40) != 0x40)						//低于3.3V
			{
				VDD_3P30V = 0;
			}
			else
			{
				VDD_3P30V = 1;
			}
			PCON1 = C_TMR0_En | C_LVD_3P0V;							// 开启Timer0 设置LVD电压为3.0V
		}
		else if(ReadVoltageTime == 6)
		{
			if((PCON1 & 0x40) != 0x40)						//低于3.0V
			{
				VDD_3P00V = 0;
			}
			else
			{
				VDD_3P00V = 1;
			}
			PCON1 = C_TMR0_En | C_LVD_2P8V;							// 开启Timer0 设置LVD电压为2.8V
		}
		else //if(ReadVoltageTime == 7)
		{
			if((PCON1 & 0x40) != 0x40)						//低于2.8V
			{
				VDD_2P80V = 0;
			}
			else
			{
				VDD_2P80V = 1;
			}
			PCON1 = C_TMR0_En | C_LVD_4P05V;							// 开启Timer0 设置LVD电压为4.05V
			ReadVoltageTime = 1;
			CheckLowVoltage();
		}
		
	}
}


void	CheckLowVoltage(void)
{
	static unsigned char	CheckVoltageTime = 0, nLowVoltageTime = 0;
	
	if(FlagStatusUSB == 0)
	{
		if((KeyValue > 0) || (FlagDischarge == 1))					//工作或者放电
		{
			if(VddGrade > VddGradeLVD)								//只降不升
			{
				CheckVoltageTime++;
				if(CheckVoltageTime >= 50)							//50*7mS=350mS
				{
					CheckVoltageTime = 0;
					VddGrade = VddGradeLVD;
				}
			}
			else
			{
				CheckVoltageTime = 0;
			}
		}
		else
		{
			VddGrade = VddGradeLVD;
		}
	}
	else														//充电
	{
		if(VddGrade < VddGradeLVD)								//只升不降
		{
			nLowVoltageTime++;
			if(nLowVoltageTime >= 50)
			{
				nLowVoltageTime = 0;
				VddGrade = VddGradeLVD;
			}
		}
		else
		{
			nLowVoltageTime = 0;
		}
	}
}

*/

void	CheckLowVoltage(void)
{
	static unsigned char ReadVoltageTime = 0;
	if( TimeSampling128mS == 0 ) { FlagVoltageSampling =	0; }
	if( ( TimeSampling128mS == 1 ) && ( FlagVoltageSampling == 0 ) )	//25.6mS运行一次
	{
		FlagVoltageSampling = 1;
		if((PCON1 & 0x40) != 0x40)						//低于2.4V
		{
			ReadVoltageTime++;
			if(ReadVoltageTime >= 50)					//25.6ms*50=1280ms
			{
				ReadVoltageTime = 0;
				if(KeyValue > 0)
				{
					KeyValueTemp = KeyValue;					// 保存档位
					KeyValue = 0;
				}
				BWUCON = C_PB5_Wakeup;							// 允许唤醒，1启用：
				ClearKeyData();
				KeyValueTemp0 = 1;
			}
		}
		else
		{
			ReadVoltageTime = 0;
		}
	}
}
	