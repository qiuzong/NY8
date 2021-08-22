/* =========================================================================
	程序型号:	YQD-RGB-CM+ZD-NY8A051F-SOP8-CS=0x44242D
	功能说明：	
				只有触摸或遥控才能开机，开机后才开启震动功能
				开启后触摸九功能循环或震动九功能循环，长按1秒关
					
 =========================================================================
 NY8A050D-SOT23-6	
	
	KEY1（按键，低有效）	PB0/INT/SDI		-1-	-6-			PB3/RST/VPP						KEY2（按键，低有效）					
	地						GND				-2-	-5-			VDD								电源	
	LED1（LED1，高有效）	PB1/SDO			-3-	-4-			PB2/EX_CKI/SCK					LED2（LED2，高有效）					
 =========================================================================
 NY8A051F-SOT23-6	
	
	KEY1（按键，低有效）	PB0/INT/SDI		-1-	-6-			PB3/RST/VPP						KEY2（按键，低有效）					
	地						GND				-2-	-5-			VDD								电源	
	LED1（LED1，高有效）	PB1/IR/SDO		-3-	-4-			PB2/PWM1/BZ1/EX_CKI/SCK			LED2（LED2，高有效）	
=========================================================================
NY8A050D-SOP8

	电源					VDD			-1-	-8-		GND							地
	NC						PB5			-2-	-7-		PB0/INT/SDI					NC	
	NC						PB4			-3-	-6-		PB1/SDO						NC
	NC						PB3/RST/VPP	-4-	-5-		PB2/EX_CKI/SCK				LED1（LED1，高有效）		
=========================================================================
NY8A051F-SOP8

	电源					VDD			-1-	-8-		GND							地
	KEY2(触摸开关，低有效)	PB5			-2-	-7-		PB0/INT/SDI					BLED（BLED，低有效）
	KEY1（震动开关，低有效）PB4			-3-	-6-		PB1/IR/SDO					RLED（RLED，低有效）
	NC						PB3/RST/VPP	-4-	-5-		PB2/PWM1/BZ1/EX_CKI/SCK		GLED（GLED，低有效）
 =========================================================================
 NY8A054E-SOP8	
 
 	电源					     VDD				- 4-   -11-     VSS					   地
	KEY2(触摸开关，低有效)		 PA7/Xout			- 5-   -10-     PA2/PWM4/INT1/SDI        BLED（BLED，低有效）
	KEY1（震动开关，低有效）	 PA6/Xin			- 6-   -9-      PA3/PWM3/SDO		     RLED（RLED，低有效）
	RXD(红外接收，低有效)		 PA5/PRSTb/Vpp	    - 7-   -8-      PA4/PWM1/EX_CKL0/SCK     GLED（GLED，低有效）
 =========================================================================*/
#include <ny8.h>
#include "NY8_constant.h"
#include "Init_Sys.h"

void main(void)
{	
	Init_sys();
    while(1)
    {
        CLRWDT();                               	//清看门狗
        CheckLowVoltage();							//低压检测
   		GetKeyValue();								//按键检测
        switch(KeyValue)               	        //根据按键值KeyValue选择待执行的功能
	    {
	       case 0:		Gear0();  	break; 		//第0档
	       case 1:		Gear1(); 	break;		//第1档
	       case 2:		Gear2();  	break;		//第2档
	       case 3:		Gear3();  	break;		//第3档
	       case 4:		Gear4();  	break;		//第4档
	       case 5:		Gear5();  	break;		//第5档
	       case 6:		Gear6();  	break;		//第6档
	       case 7:		Gear7();  	break;		//第7档
	       case 8:		Gear8();  	break;		//第8档
	       case 9:		Gear19();  	break; 		//第9档
	       case 10:		Gear0();	break; 		//第10档
	       default:		Gear0();  	break;
        }
    }
}
