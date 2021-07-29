#include "cms.h"
#include "system.h"
#include "WDT.h"
#include "rf297L.h"
#include "timer1.h"
#include "PORTB_interrupt.h"
#include "cUART.h"
#include "24lc02.h"
#include "timer1.h"
#include "Key.h"
#include "Buffer.H"
#include "PWM.h"
#include "recive.h"
#include "userClock.h"
#include "iic.h"

#define T_NUMS  250

usint Timecnt_3S=0;

usint SysRunTimeCnt=1;
uchar SysDingShiEn=0;

const char ack_buf[8]= {0};
extern uchar rf_buf[18];
uchar RF_ADDRESS[5]={0,0,0,0,0};
uchar RF_RxMark=0;

uchar DingShi=0;

extern unsigned char TX_ADDRESS_DEF[5];

uchar PWM_CH_LED1=0;
uchar PWM_CH_LED2=0;

 uchar LEDR1_Vol=0;
 uchar LEDR2_Vol=0;
 
 uchar SysRunTime_3S=0;
 
extern uchar addr_buf[16];
 
extern struct BriCoTem BriCoTem_Value; 
usint Timecnt_LEDTrun=0; 
uchar TimeEN_LEDTrun=0; 

extern unsigned int Time1s_cot;

void PWM_LED1(uchar PWM);
void PWM_LED2(uchar PWM);
void PWM_12SetVol(void);


	
void main()
{
	unsigned char i = 0;
	unsigned char j = 0;
	
	system_set_CPU_frequency(CPU_FREQUENCY_8M);
	soft_delay_ms(200);
	asm("nop");
	TRISC = 0x00;
	TRISB = 0x00;
	PORTC = 0x00;
	PORTB = 0x00;
	
	CCPX_Init(1,61); 
	CCP1_set_duty_cycle(0);
	CCP2_set_duty_cycle(0);

	soft_delay_ms(10);
	i=EEPROM_Init(10); 
	soft_delay_ms(10);

	
//----------------------------------------
	i=EP_GetONOFFStep();
	switch(i)
	{
		case 0: 	PWM_CH_LED1=LED_R_Max; PWM_CH_LED2=0; break;
		case 1: 	PWM_CH_LED1=0; PWM_CH_LED2=LED_R_Max;break;
		case 2: 	PWM_CH_LED1=LED_R_Max; PWM_CH_LED2=LED_R_Max;break;
		case 3: 	PWM_CH_LED1=LED_R_Min; PWM_CH_LED2=LED_R_Min; break;
	}
	LEDR1_Vol=PWM_CH_LED1;
	LEDR2_Vol=PWM_CH_LED2;
	PWM_12SetVol();
	if(++i>=4) i=0;
	//soft_delay_ms(20);
	EP_SetONOFFStep(i);
//----------------------------------------
	IIC_Init1();
	AT24C02_Read_Msg(30, addr_buf, 16);
	
	
	RF_Init();
	RF_Set_RxMode();
	soft_delay_ms(30);
	RF_ADDSSet(TX_ADDRESS_DEF);
	
	//soft_delay_ms(10);

	SetRunEn(0,1,LEDR1_Vol);
	SetRunEn(1,1,LEDR2_Vol);
	Enable_Interrupt();
	
	Timer1_Init(TIMER1_DIV_8);   /**<Timer is initialized and set to 8 frequency division*/
    Timer1_start(1000, 0);       /**< 5ms --> 5000, 25   2ms */ 
	Time1s_cot = 0;
	WDT_enable(7);

	BriCoTem_Value.Brightness =100;
	BriCoTem_Value.ColorTemp = 50;

	while(1)
	{
		//
		//
		//*****EEPROM测试引脚为RB4，RB5*******
		//*****原来的SCL和SDA为RB7和RB6*******
		if(TimeEN_LEDTrun==0 && FCLK_1MS) 
		{
			if(Timecnt_LEDTrun++>1700) 
			{
				TimeEN_LEDTrun=1;
				soft_delay_ms(1);
				EP_SetONOFFStep(0);
				WDT_clear();				
			}
		}

		if(SysRunTime_3S==0 && FCLK_1MS) 
		{
			if(Timecnt_3S++>3000)//1600)
			{
				SysRunTime_3S=1; 
				
				i=EP_IsADDCfg();
				if(i)
				{
					EP_GetRFAdd(RF_ADDRESS);

					soft_delay_ms(1);
					RF_ADDSSet(RF_ADDRESS);
					WDT_clear();
				}
			}  
		}
		
		if(FCLK_16MS && Time1s_cot==0)
		{
			if(j)
			{
				j = 0;
				RF_Init4();	//普通模式，单向
				RF_Set_RxMode1();				
			}
			else
			{
				j = 1;
				//RF_Init();
				RF_Init3();	//增强模式，双向
				RF_Set_RxMode();		
			}
		}

		if(j == 1)	
		{			
			if(RF_ENHANCE_RxData(rf_buf,PAYLOAD_WIDTH,ack_buf))
			{
	
				Key_Handle(rf_buf);
				 for(i=0;i<8;i++) rf_buf[i]=0; WDT_clear();
			}		
		}
		if(j == 0)
		{
			recive_task(); 	
		}
		PWM_12SetVol(); 
					
		
		getClock();
		if(FCLK_1MS)
		{
			Key_HandRunning();
			
			if(++DingShi > 99)
			{
				DingShi=0;
			
				if(SysDingShiEn) 
				{
					SysRunTimeCnt--;
					if(SysRunTimeCnt==0)
					{					
						SysDingShiEn=0;
						SysRunTimeCnt=0;
						LED_ALLOFF();
					}	
				}	
			}
		}

		WDT_clear();		
	}

}









//--------------------------------------------------------


void PWM_LED1(uchar PWM)
{
	PWM_CH_LED1=PWM;
}


void PWM_LED2(uchar PWM)
{
	PWM_CH_LED2=PWM;
}


void PWM_12SetVol(void)
{
	CCP1_set_duty_cycle(PWM_CH_LED2);
	CCP2_set_duty_cycle(PWM_CH_LED1);
}

//--------------------------------------------------------



