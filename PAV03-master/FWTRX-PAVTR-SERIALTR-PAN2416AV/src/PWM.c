#include "cms.h"
#include "PWM.h"

void CCPX_Init(PWM_DIV_e PWM_DIV,unsigned char T_nums);
void CCP1_set_duty_cycle(unsigned int duty_cycle);	//RC2 pin
void CCP2_set_duty_cycle(unsigned int duty_cycle);	//RC1 pin

/**********************************************************
*�붨ʱ��2���ܳ�ͻ
*ʱ��ԴF = Fosc/4
*����������ƣ�T = (1/F)*PWM_DIV*T_nums
*�ֱ��� == T_nums*4
***********************************************************/
void CCPX_Init(PWM_DIV_e PWM_DIV,unsigned char T_nums)
{
	T2CON = 0x00;
	
	//Set CCP1 
	TRISC |= 0x04;		//TRISC2 = 1(PWM1��������);
	CCP1CON &= ~0x3f;
	CCP1CON |= 0x0f;	//PWMģʽ
	CCP1CON &=~ 0x30;	
	CCPR1L = 0x00;		//��ʼ��ռ�ձ�0
	
	//Set CCP2
	TRISC |= 0x02;		//TRISC1 = 1(PWM2��������);
	CCP2CON &= ~0x3f;
	CCP2CON |= 0x0f;	//PWMģʽ
	CCP2CON &=~ 0x30;	
	CCPR2L = 0x00;		//��ʼ��ռ�ձ�0
	
	//Set Timer2
	PR2 = T_nums;		//T 
	PIR1 &= ~0x02;		//TMR2IF = 0;
	T2CON &= ~0x7f;
	T2CON |= PWM_DIV;	//T2CKPS = B'00'  1��Ƶ��Ԥ��Ƶ  
	
//	INTCON |= 0x40;		//PEIE = 1;�������ж�
//	PIE1 |= 0x02;		//TMR2IE = 1; ���ж�
	T2CON |= 0x04;		//TMR2ON = 1; ����ʱ��2
	
	TRISC &= ~0x02;		//TRISC1 = 0(PWM2�������);
	TRISC &= ~0x04;		//TRISC2 = 0(PWM2�������);
}

/****************************************************
*CCP1_set_duty_cycle
*ռ�ձ� = duty_cycle/(T_nums * 4)
*T_nums�ڳ�ʼ��ʱ�趨
******************************************************/
void CCP1_set_duty_cycle(unsigned int duty_cycle)
{
	CCP1CON |= (duty_cycle<<4)&0x70;	//ռ�ձȵ�2λ
	CCPR1L = duty_cycle>>2;				//ռ�ձȸ�8λ
}

/****************************************************
*CCP2_set_duty_cycle
*ռ�ձ� = duty_cycle/(T_nums * 4)
*T_nums�ڳ�ʼ��ʱ�趨
******************************************************/
void CCP2_set_duty_cycle(unsigned int duty_cycle)
{
	CCP2CON |= (duty_cycle<<4)&0x70;	//ռ�ձȵ�2λ
	CCPR2L = duty_cycle>>2;				//ռ�ձȸ�8λ
}
