#include "Init_Timer.h"
	
#define		DefReladNum		(unsigned char)(256 - 42)	//计算公式为:[1/(时钟源/分频器)]*(DefReladNum)*4T=[1/(8M/4)]*(256-(256 - 42)+8)*4= 0.5us*50*4 = 100uS
//#define		DefReladNum		(unsigned char)(256 - 121)	//计算公式为:[1/(时钟源/分频器)]*(DefReladNum)*4T=[1/(8M/8)]*(256-(256 - 121)+4)*4= 1.0us*125*4 = 500uS

//unsigned char gPwm1Dt = 45;
//unsigned short gPwm1Dt = 0, gPwm2Dt = 0, gPwm3Dt = 0, gPwm4Dt = 0;	//PWM赋值变量
unsigned short gPwmRDt = 0, gPwmGDt = 0, gPwmBDt = 0;	//PWM赋值变量

void 	Init_Timer0(void)
{
	TMR0 			= 	DefReladNum;				// 装载定时器0初始值
	T0MD 			= 	C_PS0_Div4;					// Timer0定时器预分频器设置不得低于4分频
	PCON1 			= 	C_TMR0_En;					// 开启Timer0
}

void 	Init_Timer0_Isr(void)
{
	TMR0 = DefReladNum;								//装载定时器0初始值
}

/************************NY8A051F******************************/
/*
void 	Init_Timer1(void)							//8Bit Timer1 PWM1
{
	//初始定时器1和PWM1控制寄存器(需要设置配置选项“PB2”为“PWM”)
	TMR1 = 0xFF;									// 定时器1频率是由TMR1[7:0]初始值所决定。
													//频率=时钟源/预分频/4T/(TMR1+1)=8M/2/4/(0XFF+1)=8M/8/4/(255+1)=976.5625Hz
	PWM1DUTY = 64;									// PWM1占空比= 64/256 = 25%	
//	T1CR1 = C_PWM1_En | C_TMR1_Reload | C_TMR1_En;	// PWM1输出在PB2上，PWM1输出是高电平，从TMR1重新加载，连续模式
	T1CR2 = C_TMR1_ClkSrc_Inst | C_PS1_Div8;		// 使能预分频器1, 分频器1分度率= 1:32,Timer1时钟源为指令时钟
}

void	Pwm1DataUp(void)						//8Bit Timer1 PWM	曲线赋值
{	
	PWM1DUTY = gPwm1Dt;														// PWM1占空比= gPwm1Dt/256 		
}
void	Pwm1Start(void)							//8Bit Timer1 PWM	启动PWM
{	
	PWM1DUTY = gPwm1Dt;														// PWM1占空比= gPwm1Dt/256 	
	T1CR1	 = C_PWM1_En | C_PWM1_Active_Hi | C_TMR1_Reload | C_TMR1_En;	// 启用PWM1, 高电平有效输出, 连续计数模式，启用Timer1	
//	T1CR1	 = C_PWM1_En | C_PWM1_Active_Lo | C_TMR1_Reload | C_TMR1_En;	// 启用PWM1, 低电平有效输出, 连续计数模式，启用Timer1		
}
void	Pwm1Stop(void)							//8Bit Timer1 PWM	停止PWM
{	
	T1CR1	 = 0x00;
}
*/
/**********************************NY8B062D****************************************************/
/*
void 	Init_Timer1(void)
{
	// 初始定时器1和PWM1控制寄存器
    TMRH  = C_TMR1_Data_b8 | C_TMR1_Data_b9 ;	// 定时器1频率是由TMRH[5:4] +TMR1[7:0]初始值所决定。
    TMR1  = 255;								// 频率 = 时钟源/预分频/4T/(TMR1[9:0]) = 8M/1/4/(0X3FF+1) = 8M/1/4T/(1023+1) = 1953.125Hz
    PWM1DUTY = 0;								// 占空比是由寄存器TMRH[1:0]和PWM1DUTY[7:0]决定。当PWM1DUTY[9:0]为 0，PWM1无法输出占空比。
    T1CR2	 = C_PS1_Dis | C_TMR1_ClkSrc_Inst;	// 使能分频器,分频1:1,Timer1时钟源为指令时钟
//	T1CR1	 = C_PWM1_En | C_PWM1_Active_Hi | C_TMR1_Reload | C_TMR1_En;	// 启用PWM1, 高电平有效输出, 连续计数模式，从TMR1重新加载[9:0]，启用Timer1
//	T1CR1	 = C_PWM1_En | C_PWM1_Active_Lo | C_TMR1_Reload | C_TMR1_En;	// 启用PWM1, 低电平有效输出, 连续计数模式，从TMR1重新加载[9:0]，启用Timer1
}

void	Pwm1DataUp(void)														//PWM1占空比赋值更新
{
	TMRH	 = TMRH & 0XFC;
	TMRH	 = TMRH | ((unsigned char)((gPwm1Dt & 0X0300) >> 8)) ;				//占空比是由寄存器TMRH[1:0]和PWM1DUTY[7:0]决定。当PWM1DUTY[9:0]为 0，PWM1无法输出占空比。
	PWM1DUTY = (unsigned char)gPwm1Dt;
}

void	Pwm1Start(void)															//启动PWM1输出
{
	Pwm1DataUp();
//	T1CR1 = (C_PWM1_En | C_PWM1_Active_Hi | C_TMR1_Reload | C_TMR1_En);			// 启用PWM1, 高电平有效输出, 连续计数模式，从TMR1重新加载[9:0]，启用Timer1
	T1CR1	 = C_PWM1_En | C_PWM1_Active_Lo | C_TMR1_Reload | C_TMR1_En;		// 启用PWM1, 低电平有效输出, 连续计数模式，从TMR1重新加载[9:0]，启用Timer1
}

void	Pwm1Stop(void)															//10Bit Timer1 PWM	停止PWM
{	
	T1CR1	 = 0x00;
}

void 	Init_Timer2(void)
{
	// 初始定时器2和PWM2控制寄存器
	TMRH  = TMRH | C_TMR2_Data_b9 | C_TMR2_Data_b8;				// 定时器1频率是由TMRH[7:6] +TMR2[7:0]初始值所决定。
    TMR2  = 255;								// 频率 = 时钟源/预分频/4T/(TMR2[9:0]) = 8M/1/4/(0X3FF+1) = 8M/1/4T/(1023+1) = 1953.125Hz
    PWM2DUTY = 0;								// 占空比是由寄存器TMRH[1:0]和PWM1DUTY[7:0]决定。当PWM2DUTY[9:0]为 0，PWM2无法输出占空比。
    T2CR2	 = C_PS2_Dis | C_TMR2_ClkSrc_Inst;	// 使能分频器,分频1:1,Timer2时钟源为指令时钟
//	T2CR1	 = C_PWM1_En | C_PWM2_Active_Hi | C_TMR1_Reload | C_TMR1_En;	// 启用PWM2, 高电平有效输出, 连续计数模式，从TMR2重新加载[9:0]，启用Timer1
//	T2CR1	 = C_PWM1_En | C_PWM2_Active_Lo | C_TMR1_Reload | C_TMR1_En;	// 启用PWM2, 低电平有效输出, 连续计数模式，从TMR2重新加载[9:0]，启用Timer1
}

void	Pwm2DataUp(void)														//PWM2占空比赋值更新
{
	TMRH	 = TMRH & 0XF3;		//1111 0011
	TMRH	 = TMRH | ((unsigned char)((gPwm2Dt & 0X0300) >> 6)) ;				//占空比是由寄存器TMRH[1:0]和PWM2DUTY[7:0]决定。当PWM2DUTY[9:0]为 0，PWM2无法输出占空比。
	PWM2DUTY = (unsigned char)gPwm2Dt;
}

void	Pwm2Start(void)															//启动PWM1输出
{
	Pwm2DataUp();
//	T2CR1 = (C_PWM2_En | C_PWM2_Active_Hi | C_TMR2_Reload | C_TMR2_En);			// 启用PWM2, 高电平有效输出, 连续计数模式，从TMR2重新加载[9:0]，启用Timer2
	T2CR1	 = C_PWM2_En | C_PWM2_Active_Lo | C_TMR2_Reload | C_TMR2_En;		// 启用PWM2, 低电平有效输出, 连续计数模式，从TMR2重新加载[9:0]，启用Timer2
}

void	Pwm2Stop(void)															//10Bit Timer2 PWM	停止PWM2
{	
	T2CR1	 = 0x00;
}

void 	Init_Timer3(void)
{
	// 初始定时器3和PWM3/4控制寄存器
//	TM34RH   = C_TMR3_Data_b9 | C_TMR3_Data_b8 | C_PWM3_Duty_b9 | C_PWM3_Duty_b8;	// SET TMR3_Data_b9 , TMR3_Data_b8 , PWM3_Duty_b9 & PWM3_Duty_b8 as 1 
	TM3RH	 = C_TMR3_Data_b8 | C_TMR3_Data_b9;	
    TMR3	 = 255;							// 频率 = 时钟源/预分频/4T/(TMR3[9:0]) = 8M/1/4/(1023+1) = 1953.125Hz
    PWM3DUTY = 0;							// 占空比是由寄存器TM34RH[1:0]和PWM3DUTY[7:0]决定。当PWM3DUTY[9:0]为 0，PWM3无法输出占空比。100/200=50%
    T3CR2	 = C_PS3_Dis | C_TMR3_ClkSrc_Inst;	// 使能分频器,分频1:4,Timer3时钟源为指令时钟
//  T3CR1	 = C_PWM3_En | C_PWM3_Active_Lo | C_TMR3_Reload | C_TMR3_En;	//启用PWM3, 低电平有效输出, 连续计数模式，从TMR1重新加载[9:0]，启用Timer3
}

void	Pwm3DataUp(void)														// PWM1占空比赋值更新
{
	TM3RH	 = TM3RH & 0XFC;
	TM3RH	 = TM3RH | ((unsigned char)((gPwm3Dt & 0X0300) >> 8)) ;			// 占空比是由寄存器TM3RH[1:0]和PWM3DUTY[7:0]决定。当PWM1DUTY[9:0]为 0，PWM1无法输出占空比。
	PWM3DUTY = (unsigned char)gPwm3Dt;
}

void	Pwm3Start(void)															// 启动PWM1输出
{
	Pwm3DataUp();
//	T3CR1 = (C_PWM3_En | C_PWM3_Active_Hi | C_TMR3_Reload | C_TMR3_En);			// 启用PWM3, 高电平有效输出, 连续计数模式，从TMR3重新加载[9:0]，启用Timer3
	T3CR1	 = C_PWM3_En | C_PWM3_Active_Lo | C_TMR3_Reload | C_TMR3_En;		// 启用PWM3, 低电平有效输出, 连续计数模式，从TMR3重新加载[9:0]，启用Timer3
}

void	Pwm3Stop(void)															// 10Bit Timer3 PWM	停止PWM
{	
	T3CR1	 = 0x00;
}
*/

/****************************************NY8A054E************************************************/
/*
void 	Init_Timer1(void)
{
	// 初始定时器1和PWM1控制寄存器
    TMRH  = C_TMR1_Data_b9 | C_TMR1_Data_b8 ;	// 定时器1频率是由TMRH[5:4] +TMR1[7:0]初始值所决定。
    TMR1  = 255;								// 频率 = 时钟源/预分频/4T/(TMR1[9:0]) = 8M/1/4T/(101+1) = 19607.8431Hz
    PWM1DUTY = 0;								// 占空比是由寄存器TMRH[1:0]和PWM1DUTY[7:0]决定。当PWM1DUTY[9:0]为 0，PWM1无法输出占空比。
    T1CR2	 = C_PS1_Dis | C_TMR1_ClkSrc_Inst;	// 使能分频器,分频1:1,Timer1时钟源为指令时钟
//	T1CR1	 = C_PWM1_En | C_PWM1_Active_Hi | C_TMR1_Reload | C_TMR1_En;	// 启用PWM1, 高电平有效输出, 连续计数模式，从TMR1重新加载[9:0]，启用Timer1
//	T1CR1	 = C_PWM1_En | C_PWM1_Active_Lo | C_TMR1_Reload | C_TMR1_En;	// 启用PWM1, 低电平有效输出, 连续计数模式，从TMR1重新加载[9:0]，启用Timer1
}

void	Pwm1DataUp(void)														//PWM1占空比赋值更新
{
	TMRH	 = TMRH & 0XFC;
	TMRH	 = TMRH | ((unsigned char)((gPwmGDt & 0X0300) >> 8)) ;				//占空比是由寄存器TMRH[1:0]和PWM1DUTY[7:0]决定。当PWM1DUTY[9:0]为 0，PWM1无法输出占空比。
	PWM1DUTY = (unsigned char)gPwmGDt;
}

void	Pwm1Start(void)															//启动PWM1输出
{
	Pwm1DataUp();
//	T1CR1 = (C_PWM1_En | C_PWM1_Active_Hi | C_TMR1_Reload | C_TMR1_En);			// 启用PWM1, 高电平有效输出, 连续计数模式，从TMR1重新加载[9:0]，启用Timer1
	T1CR1	 = C_PWM1_En | C_PWM1_Active_Lo | C_TMR1_Reload | C_TMR1_En;		// 启用PWM1, 低电平有效输出, 连续计数模式，从TMR1重新加载[9:0]，启用Timer1
}

void	Pwm1Stop(void)															//10Bit Timer1 PWM	停止PWM
{	
	T1CR1	 = 0x00;
}
*/
/*
void 	Init_Timer2(void)
{
	// 初始定时器2和PWM2控制寄存器
	TMRH  = 0;									// 定时器1频率是由TMRH[7:6] +TMR2[7:0]初始值所决定。
//	TMR1  = 255;								// 频率 = 时钟源/预分频/4T/(TMR2[9:0]) = 8M/1/4T/(1023+1) = 1953.125Hz
    PWM2DUTY = 0;								// 占空比是由寄存器TMRH[1:0]和PWM1DUTY[7:0]决定。当PWM2DUTY[9:0]为 0，PWM2无法输出占空比。
//	T2CR2	 = C_PS2_Dis | C_TMR2_ClkSrc_Inst;	// 使能分频器,分频1:1,Timer2时钟源为指令时钟
//	T2CR1	 = C_PWM1_En | C_PWM2_Active_Hi | C_TMR1_Reload | C_TMR1_En;	// 启用PWM2, 高电平有效输出, 连续计数模式，从TMR2重新加载[9:0]，启用Timer1
//	T2CR1	 = C_PWM1_En | C_PWM2_Active_Lo | C_TMR1_Reload | C_TMR1_En;	// 启用PWM2, 低电平有效输出, 连续计数模式，从TMR2重新加载[9:0]，启用Timer1
}

void	Pwm2DataUp(void)														//PWM2占空比赋值更新
{
//	TMRH	 = TMRH & 0XF3;		//1111 0011
//	TMRH	 = TMRH | ((unsigned char)((gPwm2Dt & 0X0300) >> 6)) ;				//占空比是由寄存器TMRH[1:0]和PWM2DUTY[7:0]决定。当PWM2DUTY[9:0]为 0，PWM2无法输出占空比。
	PWM2DUTY = (unsigned char)gPwm2Dt;
}

void	Pwm2Start(void)															//启动PWM1输出
{
	Pwm2DataUp();
	P2CR1 = (C_PWM2_En | C_PWM2_Active_Hi);			// 启用PWM2, 高电平有效输出
//	P2CR1	 = C_PWM2_En | C_PWM2_Active_Lo;		// 启用PWM2, 低电平有效输出
}

void	Pwm2Stop(void)															//10Bit Timer2 PWM	停止PWM2
{	
	P2CR1	 = 0x00;
}
*/
/*
void 	Init_Timer3(void)
{
	// 初始定时器3和PWM3/4控制寄存器
	TM34RH   = C_TMR3_Data_b9 | C_TMR3_Data_b8;	// 
    TMR3	 = 255;								// 频率 = 时钟源/预分频/4T/(TMR3[9:0]) = 8M/1/4/(101+1) = 19607.8431Hz
    PWM3DUTY = 0;								// 占空比是由寄存器TM34RH[1:0]和PWM3DUTY[7:0]决定。当PWM3DUTY[9:0]为 0，PWM3无法输出占空比。100/200=50%
    T3CR2	 = C_PS3_Dis | C_TMR3_ClkSrc_Inst;	// 使能分频器,分频1:1,Timer3时钟源为指令时钟
//  T3CR1	 = C_PWM3_En | C_PWM3_Active_Lo | C_TMR3_Reload | C_TMR3_En;	//启用PWM3, 低电平有效输出, 连续计数模式，从TMR1重新加载[9:0]，启用Timer3
}

void	Pwm3DataUp(void)														// PWM1占空比赋值更新
{
	TM34RH	 = TM34RH & 0XFC;
	TM34RH	 = TM34RH | ((unsigned char)((gPwmRDt & 0X0300) >> 8)) ;			// 占空比是由寄存器TM3RH[1:0]和PWM3DUTY[7:0]决定。当PWM1DUTY[9:0]为 0，PWM1无法输出占空比。
	PWM3DUTY = (unsigned char)gPwmRDt;
}

void	Pwm3Start(void)															// 启动PWM1输出
{
	Pwm3DataUp();
//	T3CR1 = (C_PWM3_En | C_PWM3_Active_Hi | C_TMR3_Reload | C_TMR3_En);			// 启用PWM3, 高电平有效输出, 连续计数模式，从TMR3重新加载[9:0]，启用Timer3 | C_TMR3_Reload
	T3CR1	 = C_PWM3_En | C_PWM3_Active_Lo | C_TMR3_Reload | C_TMR3_En;		// 启用PWM3, 低电平有效输出, 连续计数模式，从TMR3重新加载[9:0]，启用Timer3
}

void	Pwm3Stop(void)															// 10Bit Timer3 PWM	停止PWM
{	
	T3CR1	 = 0x00;
}

void 	Init_Timer4(void)
{
	// 初始定时器3和PWM3/4控制寄存器
//	TM34RH   = 0;	// 
//	TMR3	 = 255;								// 频率 = 时钟源/预分频/4T/(TMR3[9:0]) = 8M/1/4/(101+1) = 19607.8431Hz
    PWM4DUTY = 0;								// 占空比是由寄存器TM34RH[1:0]和PWM3DUTY[7:0]决定。当PWM3DUTY[9:0]为 0，PWM3无法输出占空比。100/200=50%
//	T3CR2	 = C_PS3_Dis | C_TMR3_ClkSrc_Inst;	// 使能分频器,分频1:1,Timer3时钟源为指令时钟
}

void	Pwm4DataUp(void)														// PWM1占空比赋值更新
{
	TM34RH	 = TM34RH & 0XF3;
	TM34RH	 = TM34RH | ((unsigned char)((gPwmBDt & 0X0300) >> 6)) ;			// 占空比是由寄存器TM3RH[1:0]和PWM3DUTY[7:0]决定。当PWM1DUTY[9:0]为 0，PWM1无法输出占空比。
	PWM4DUTY = (unsigned char)gPwmBDt;
}

void	Pwm4Start(void)															// 启动PWM1输出
{
	Pwm4DataUp();
//	P4CR1 = (C_PWM4_En | C_PWM4_Active_Hi | C_TMR3_Reload | C_TMR3_En);			// 启用PWM4, 高电平有效输出, 连续计数模式，从TMR4重新加载[9:0]，启用Timer3 | C_TMR3_Reload
	P4CR1	 = C_PWM4_En | C_PWM4_Active_Lo | C_TMR3_Reload | C_TMR3_En;		// 启用PWM4, 低电平有效输出, 连续计数模式，从TMR4重新加载[9:0]，启用Timer3
}

void	Pwm4Stop(void)															// 10Bit Timer3 PWM	停止PWM
{	
	P4CR1	 = 0x00;
}
*/