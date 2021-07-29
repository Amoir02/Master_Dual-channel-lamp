#include "cms.h"
#include "timer2.h"

void Timer2_Init(TIMER2_PRE_DIVIDER_e TIMER2_PRE_DIVIDER,TIMER2_AFTER_DIVIDER_e TIMER2_AFTER_DIVIDER);
void Timer2_start(unsigned char T_nums);
void Timer2_stop(void);
void TIMER2_ISR(void);

/**************************************************************************
*��CCPX���ܳ�ͻ
*ʱ��ԴΪF = Fosc/4
*��С��ʱʱ�� T = (1/F)*TIMER2_PRE_DIVIDER*TIMER2_AFTER_DIVIDER
***************************************************************************/
void Timer2_Init(TIMER2_PRE_DIVIDER_e TIMER2_PRE_DIVIDER,TIMER2_AFTER_DIVIDER_e TIMER2_AFTER_DIVIDER)
{
	T2CON = 0x00;
	T2CON |= TIMER2_PRE_DIVIDER;	//����Ԥ��Ƶֵ
	T2CON |= TIMER2_AFTER_DIVIDER;	//���ú��Ƶֵ
	INTCON |= 0x40;					//PEIE = 1;�������ж�
	PIE1 |= 0x02;					//TMR2IE = 1; ���ж�
}

/*************************************************************************************
*ʵ��ʱ���붨ʱʱ����ƫ�ƫ��ʱ��ΪTimer2�жϲ��������жϺ������˳��жϺ���ִ��ʱ��
*��ʱʱ�� == T_nums * T
*T = (1/(Fosc/4))*TIMER2_PRE_DIVIDER*TIMER2_AFTER_DIVIDER
**************************************************************************************/
void Timer2_start(unsigned char T_nums)
{
	PR2 = T_nums;
	T2CON |= 0x04; 					//TMR2ON = 1;Start Timer2
}

void Timer2_stop(void)
{
	PIE1 &= ~0x02;					//TMR2IE = 0; ���ж�
	T2CON &= ~0x04; 				//TMR2ON = 0;Stop Timer2
	PIR1 &= ~0x02;	//TMR2IF
}

void TIMER2_ISR(void)
{
	T2CON &= ~0x04;					//TMR2ON = 0;Stop Timer2
	//Do something
	
	
	//////////////////////////////////////////////////////
	PIR1 &= ~0x02;	//TMR2IF
	T2CON |= 0x04; 					//TMR2ON = 1;Start Timer2
}