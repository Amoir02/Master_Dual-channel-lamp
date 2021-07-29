#include "cms.h"
#include "system.h"
#include "WDT.h"
#include "rf297L.h"
#include "PORTB_interrupt.h"
#include "cUART.h"
#include "24lc02.h"
#include "timer1.h"
#include "Key.h"
#include "Buffer.H"
#include "PWM.h"
#include "userClock.h"

#define _LEDSetp 50 
#define _LEDSetp_Keep 20  

#define  _LEDSetp_LR  85 

static uchar colour_En=0; 

static uchar Chg_En=0; 
static uchar Chg_Type=0; 
static uchar Chg_Time=0; 

static uchar S7_En=0;  
static uchar S7_Cnt=0;

static uchar Chg_R=0;
static uchar Chg_G=0;
static uchar Chg_B=0;
static uchar Stp=0;




uchar LED_ON_Sat=1; 
uchar LED_Chg_Cnt=0; 

extern unsigned int Time1s_cot;
extern uchar LEDR1_Vol;
extern uchar LEDR2_Vol;

extern usint SysRunTimeCnt;
extern uchar SysDingShiEn;



extern void PWM_LED1(uchar PWM);
extern void PWM_LED2(uchar PWM);

void Pair_LED(void)
{
	uchar k;
	for(uchar i=0;i<4;i++)
	{
		CCP1_set_duty_cycle(LED_R_Max); CCP2_set_duty_cycle(LED_R_Max);//PWM2_H; PWM3_H; PWM4_H;
		for(k=0;k<120;k++){ soft_delay_ms(1); WDT_clear();};
		CCP1_set_duty_cycle(0); CCP2_set_duty_cycle(0);//PWM2_L; PWM3_L; PWM4_L;
		for(k=0;k<120;k++){ soft_delay_ms(1); WDT_clear();};
	}
}


void LEDCon_Chg(void)
{
	switch(LED_Chg_Cnt)
	{
		case 0: LEDR1_Vol=LED_R_Max; 	LEDR2_Vol=0; 			break;
		case 1: LEDR1_Vol=0;  			LEDR2_Vol=LED_R_Max; 	break;
		case 2: LEDR1_Vol=LED_R_Max;  	LEDR2_Vol=LED_R_Max; 	break;	
		case 3: LEDR1_Vol=LED_R_Min;  	LEDR2_Vol=LED_R_Min; 	break;
		
		case 4: LEDR1_Vol=LED_R_Min;    LEDR2_Vol=0; 	break;	
		case 5: LEDR1_Vol=0;  			LEDR2_Vol=LED_R_Min; 			break;
		
	}
	PWM_LED1(LEDR1_Vol); PWM_LED2(LEDR2_Vol);
	SetRunEn(0,1,LEDR1_Vol);
	SetRunEn(1,1,LEDR2_Vol);
}

static uchar CLRRF_AddCnt=0;
static uchar CLRRF_AddTimEn=0;
static usint CLRRF_AddTimeSV=0;



static uchar SysDingShiOne=0;
static uchar SysDingShiCnt=0;
static uchar SysDingShiSTEP=0;


void Key_HandRunning(void)
{
	static uchar  Cnt=0;
	static uchar  Cnt2=0;
	

	/*
	S7_Running();		//静彩模式
	if(Cnt++>25)
	{
		Cnt=0;
		Chg_Running();	//动彩模式
		
	}
	*/
	if(Cnt2++>4)
	{
		Cnt2=0;
		BufRuning();
		
		
		if(SysDingShiEn)  
		{
			if(SysDingShiOne==0)
			{
				
				if(SysDingShiEn==2)
				{
					if(++SysDingShiCnt>16)
					{
						SysDingShiCnt=0;
						
						switch(SysDingShiSTEP)
						{
							case 0:PWM_LED1(0); PWM_LED2(0); SysDingShiSTEP++; break;
							case 1:PWM_LED1(LEDR1_Vol); PWM_LED2(LEDR2_Vol); SysDingShiSTEP++;break;
							case 2:PWM_LED1(0); PWM_LED2(0); SysDingShiSTEP++; break;
							case 3:PWM_LED1(LEDR1_Vol); PWM_LED2(LEDR2_Vol); 
							SysDingShiOne=1;
							SysDingShiSTEP=0;
							break;
							
						}	
					}
				}
			}
		}
		
		
	}
	
	if(CLRRF_AddTimEn)
	{
		CLRRF_AddTimeSV++;
		if(CLRRF_AddTimeSV>0xfff0)  CLRRF_AddTimeSV=0xfff0;
		
	}
	
}


const uchar ChgLV_ZX[6]={    250,    100,    50,     16,     7,   2  }; 
const uchar ChgLV_FW[7]={254,   175,      75,     34,    13,     5,  0}; 

uchar GetChgLV(uchar vol)
{
	uchar i=0;
	for(i=0;i<5;i++)
	{
		if(vol>ChgLV_FW[1+i]) return i;
	}
	
	return 5;
}




extern uchar RF_ADDRESS[5];
extern uchar SysRunTime_3S;
extern unsigned char TX_ADDRESS_DEF[5];

static uint KeyVol=0;
static uint KeyVolSV=0xffff;




static uchar KEYKeepAddMark_1=0;
static uchar KEYKeepAddMark_2=0;

static uchar KEYKeepSunMark_1=0;
static uchar KEYKeepSunMark_2=0;



void LED_ALLOFF(void)
{
		LED_ON_Sat=0;
		colour_En=0;
		S7_En=0; 
		Chg_En=0; 
		S7_Cnt=0;
		Chg_Type=0;
		SetRunEn(0,0,0);
		SetRunEn(1,0,0);
			
		PWM_LED1(0);
		PWM_LED2(0);
		//PWM_CHSet(_b,0);
		//PWM_CHSet(_r,0);
		//PWM_CHSet(_g,0);
		//PWM_CHSet(_b,0);
}



void Key_Handle(uchar *buf)
{
	uchar i=0;
	usint k=0;
	uchar n=0;
	
	if(buf[0]!=0x8C) return;
	
	Time1s_cot = 1000;
	
	KeyVol=((usint)buf[1]<<8);
	KeyVol+=buf[2];

	if(KeyVolSV!=KeyVol)
	{
		KeyVolSV=KeyVol;
		
		if(SysRunTime_3S==0) 
		{

			//对码--------------------------------------------------------
			if((KeyVol==Key_ON)||(KeyVol==Key_ON2)) 
			{
				
				 EP_SetRFAdd(&buf[3]);
				 soft_delay_ms(10);
				 EP_GetRFAdd(RF_ADDRESS);
				 
				 for(i=0;i<5;i++)
				 {
					 if(RF_ADDRESS[i]!=buf[i+3]) break;
				 }
				if(i==5) 
				{
					soft_delay_ms(5);
					RF_ADDSSet(RF_ADDRESS);  
					soft_delay_ms(5);
					EP_SetADDCfg(1);
					
					Pair_LED();
					
					LED_ALLOFF();
					LEDR1_Vol=0; LEDR2_Vol=LED_R_Max;
					PWM_LED1(LEDR1_Vol); 
					PWM_LED2(LEDR2_Vol); 
					SysRunTime_3S=1;  
					
					//PWM_Init();
				}
				
				return;
			}
			
			

			if((KeyVol==Key_OFF)||(KeyVol==Key_OFF2))
			{
				EP_SetADDCfg(0);
				soft_delay_ms(5);
				RF_ADDSSet(TX_ADDRESS_DEF); 
				soft_delay_ms(5);
					
				LED_ALLOFF();
				LEDR1_Vol=0; LEDR2_Vol=LED_R_Max;
				PWM_LED1(LEDR1_Vol); 
				PWM_LED2(LEDR2_Vol); 
				SysRunTime_3S=1; 
				return;
			}
		}

		
		
		switch(KeyVol)
		{
			case Key_Dingshi30: 
			if(LED_ON_Sat)
			{
			SysDingShiEn=1;
			SysRunTimeCnt=18000;//10227;
			
			
			CCP1_set_duty_cycle(0);
			CCP2_set_duty_cycle(0);
			for(k=0;k<120;k++){ soft_delay_ms(1); WDT_clear();};
			PWM_LED1(LEDR1_Vol); PWM_LED2(LEDR2_Vol); 
			
			}
			
			break;
			
			
			case Key_Dingshi60:
			
			if(LED_ON_Sat)
			{
			SysDingShiEn=2;
			SysRunTimeCnt=36000;//20454;
			
			SysDingShiOne=0;
			SysDingShiCnt=100;
			SysDingShiSTEP=0;
				
			}
			
			break;
			

			case Key_U:
			if(LED_ON_Sat)
			{
				if(LEDR1_Vol!=0)
				{
					KEYKeepAddMark_1=0;
					SetRunEn(0,1,LEDR1_Vol);
					
			
					
					i=GetChgLV(LEDR1_Vol);
					
					n=1;  if(i==0||i==1) n=4;  if(i==2) n=3;  if(i==3) n=2;
					
					i = (i==0)?(ChgLV_ZX[i]):(ChgLV_ZX[i-1]);
					BufSetRun(0,i,1,n);
				}
				
				if(LEDR2_Vol!=0)
				{
					KEYKeepAddMark_2=0;
					SetRunEn(1,1,LEDR2_Vol);
					
					i=GetChgLV(LEDR2_Vol);
					n=1;  if(i==0||i==1) n=4;  if(i==2) n=3;  if(i==3) n=2;
					
					i = (i==0)?(ChgLV_ZX[i]):(ChgLV_ZX[i-1]);
					BufSetRun(1,i,1,n);
				}

			}
			SysDingShiEn=0;
			break;
			
			case Key_D:
			if(LED_ON_Sat)
			{

				if(LEDR1_Vol!=0)
				{
					KEYKeepSunMark_1=0;
					SetRunEn(0,1,LEDR1_Vol);
					
					i=GetChgLV(LEDR1_Vol);
					n=1;  if(i==0||i==1) n=4;  if(i==2) n=3;  if(i==3) n=2;
					i = (i==5)?(ChgLV_ZX[i]):(ChgLV_ZX[i+1]);
					
					BufSetRun(0,i,1,n);
				}
				
				if(LEDR2_Vol!=0)
				{
					KEYKeepSunMark_2=0;
					SetRunEn(1,1,LEDR2_Vol);
					i=GetChgLV(LEDR2_Vol);
					n=1;  if(i==0||i==1) n=4;  if(i==2) n=3;  if(i==3) n=2;
					i = (i==5)?(ChgLV_ZX[i]):(ChgLV_ZX[i+1]);
					BufSetRun(1,i,1,n);
				}

			}
			SysDingShiEn=0;
			break;
			
		
			case Key_L:
			if(LED_ON_Sat)
			{
	
				if((LEDR1_Vol)&&(LEDR2_Vol)) 
				{
					k=(usint)LEDR1_Vol+(usint)LEDR2_Vol;
					if(k>(usint)LED_R_Max) k=LED_R_Max;
					
					SetRunEn(0,1,LEDR1_Vol); BufSetRun(0,k,1,3);
					SetRunEn(1,1,LEDR2_Vol); BufSetRun(1,0,1,3);
				}
				
				if((LEDR1_Vol==0)&&(LEDR2_Vol))
				{
					i=LEDR2_Vol/2;
					
					SetRunEn(0,1,LEDR1_Vol); BufSetRun(0,i,1,3);
					SetRunEn(1,1,LEDR2_Vol); BufSetRun(1,i,1,3);
				}
			}
			break;
			
			
			case Key_R:
			if(LED_ON_Sat)
			{
				if((LEDR1_Vol)&&(LEDR2_Vol)) 
				{
					k=(usint)LEDR1_Vol+(usint)LEDR2_Vol;
					if(k>(usint)LED_R_Max) k=LED_R_Max;
					
					SetRunEn(0,1,LEDR1_Vol); BufSetRun(0,0,1,3);
					SetRunEn(1,1,LEDR2_Vol); BufSetRun(1,k,1,3);
				}
				
				if((LEDR1_Vol)&&(LEDR2_Vol==0))
				{

					i=LEDR1_Vol/2;
					SetRunEn(0,1,LEDR1_Vol); BufSetRun(0,i,1,3);
					SetRunEn(1,1,LEDR2_Vol); BufSetRun(1,i,1,3);
					
		
					
				}
			}
			break;
			
			
			
			case Key_ON:
			case Key_ON2:
			
			if(LED_ON_Sat==0)  
			{
				LED_ON_Sat=1;

				PWM_LED1(LEDR1_Vol); PWM_LED2(LEDR2_Vol); 
			}
			else 
			{
				LEDCon_Chg();
				if(++LED_Chg_Cnt>=6) LED_Chg_Cnt=0;
			}
			SysDingShiEn=0;
			break;
			
			
			case Key_OFF:
			case Key_OFF2:
		
			LED_ALLOFF();
			SysDingShiEn=0;
			break;
		}
	}
	else
	{
		switch(KeyVol)
		{
			case Key_U: 
			if(LED_ON_Sat)
			{
				if(LEDR1_Vol!=0)
				{
					if(KEYKeepAddMark_1==0) i=!GerBuff_RunSAT(0); else i=1;
					if(i)
					{
						KEYKeepAddMark_1=1;
						//SetRunEn(0,1,LEDR1_Vol);
						if((usint)LEDR1_Vol+(usint)_LEDSetp_Keep>=(usint)LED_R_Max) i=LED_R_Max; else  i=LEDR1_Vol+_LEDSetp_Keep;
						BufSetRun(0,i,1,1);
					}
				}

				if(LEDR2_Vol!=0)
				{
					if(KEYKeepAddMark_2==0) i=!GerBuff_RunSAT(1); else i=1;
					if(i)
					{
						KEYKeepAddMark_2=1;
						//SetRunEn(1,1,LEDR2_Vol);
						if((usint)LEDR2_Vol+(usint)_LEDSetp_Keep>=(usint)LED_R_Max) i=LED_R_Max; else  i=LEDR2_Vol+_LEDSetp_Keep;
						BufSetRun(1,i,1,1);
					}
				}
			}
			break;
			
			
	
			case Key_D: 
			if(LED_ON_Sat)
			{

				if(LEDR1_Vol!=0)
				{
					if(KEYKeepSunMark_1==0) i=!GerBuff_RunSAT(0); else i=1;
					if(i)
					{
						KEYKeepSunMark_1=1;
						//SetRunEn(0,1,LEDR1_Vol);
						if((usint)LEDR1_Vol>=((usint)LED_R_Min+(usint)_LEDSetp_Keep)) i=LEDR1_Vol-_LEDSetp_Keep; else  i=LED_R_Min;
						BufSetRun(0,i,1,1);
					}
				}
				
				if(LEDR2_Vol!=0)
				{	
					if(KEYKeepSunMark_2==0) i=!GerBuff_RunSAT(1); else i=1;
					if(i)
					{
						KEYKeepSunMark_2=1;
						//SetRunEn(1,1,LEDR2_Vol);
						if((usint)LEDR2_Vol>=(usint)LED_R_Min+(usint)_LEDSetp_Keep)  i=LEDR2_Vol-_LEDSetp_Keep; else  i=LED_R_Min;
						BufSetRun(1,i,1,1);
					}
				}

			}
			break;
			
		}
	}
}

	






 
 



	




void Buffer_VaryFun(uchar n,int dat)
{
	if(n==0)
	{
		LEDR1_Vol=dat;
		PWM_LED1(LEDR1_Vol); 
	}
	else
	{	
		LEDR2_Vol=dat;
		PWM_LED2(LEDR2_Vol); 
	}
}	






