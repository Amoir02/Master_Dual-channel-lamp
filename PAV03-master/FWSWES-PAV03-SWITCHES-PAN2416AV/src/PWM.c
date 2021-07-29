#include "cms.h"
#include "PWM.h"

void CCPX_Init(PWM_DIV_e PWM_DIV,unsigned char T_nums);
void CCP1_set_duty_cycle(unsigned int duty_cycle);	//RC2 pin
void CCP2_set_duty_cycle(unsigned int duty_cycle);	//RC1 pin

/**********************************************************
*与定时器2功能冲突
*时钟源F = Fosc/4
*采用脉宽调制，T = (1/F)*PWM_DIV*T_nums
*分辨率 == T_nums*4
***********************************************************/
void CCPX_Init(PWM_DIV_e PWM_DIV,unsigned char T_nums)
{
	T2CON = 0x00;
	
	//Set CCP1 
	TRISC |= 0x04;		//TRISC2 = 1(PWM1引脚输入);
	CCP1CON &= ~0x3f;
	CCP1CON |= 0x0f;	//PWM模式
	CCP1CON &=~ 0x30;	
	CCPR1L = 0x00;		//初始化占空比0
	
	//Set CCP2
	TRISC |= 0x02;		//TRISC1 = 1(PWM2引脚输入);
	CCP2CON &= ~0x3f;
	CCP2CON |= 0x0f;	//PWM模式
	CCP2CON &=~ 0x30;	
	CCPR2L = 0x00;		//初始化占空比0
	
	//Set Timer2
	PR2 = T_nums;		//T 
	PIR1 &= ~0x02;		//TMR2IF = 0;
	T2CON &= ~0x7f;
	T2CON |= PWM_DIV;	//T2CKPS = B'00'  1分频，预分频  
	
//	INTCON |= 0x40;		//PEIE = 1;开外设中断
//	PIE1 |= 0x02;		//TMR2IE = 1; 开中断
	T2CON |= 0x04;		//TMR2ON = 1; 开定时器2
	
	TRISC &= ~0x02;		//TRISC1 = 0(PWM2引脚输出);
	TRISC &= ~0x04;		//TRISC2 = 0(PWM2引脚输出);
}

/****************************************************
*CCP1_set_duty_cycle
*占空比 = duty_cycle/(T_nums * 4)
*T_nums在初始化时设定
******************************************************/
void CCP1_set_duty_cycle(unsigned int duty_cycle)
{
	CCP1CON |= (duty_cycle<<4)&0x70;	//占空比低2位
	CCPR1L = duty_cycle>>2;				//占空比高8位
}

/****************************************************
*CCP2_set_duty_cycle
*占空比 = duty_cycle/(T_nums * 4)
*T_nums在初始化时设定
******************************************************/
void CCP2_set_duty_cycle(unsigned int duty_cycle)
{
	CCP2CON |= (duty_cycle<<4)&0x70;	//占空比低2位
	CCPR2L = duty_cycle>>2;				//占空比高8位
}
