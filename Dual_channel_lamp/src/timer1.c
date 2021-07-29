#include "cms.h"
#include "virtual_timer.h"
#include "timer1.h"
#include "system.h"

#define Timer1_set_time (64556)

unsigned int Time1s_cot;


volatile uint8_t clk_count = 0;

void Timer1_Init(TIMER1_DIVIDER_e TIMER1_DIVIDER);
void Timer1_start(unsigned int T_nums, unsigned char Timer1_ISR_execution_total_time);
void Timer1_stop(void);
void TIMER1_ISR(void);

/**************************************************************************
*ʱ��ԴΪF = Fosc
*��С��ʱʱ�� T = (1/F)*TIMER1_DIVIDER
**************************************************************************/
void Timer1_Init(TIMER1_DIVIDER_e TIMER1_DIVIDER)
{
	T1CON = 0x00;	//TMR1GE = 0,Timer1��TMR1ON����	TMR1CS = 0;ѡ���ڲ�ʱ��FOSC
	T1CON |= TIMER1_DIVIDER;	//��Ƶ����	Bit5 Bit4 
	INTCON |= (0x40);	//PEIE = 1;		����δ�����ε��ⲿ�ж�
	PIE1 |= 0x01;		//TMR1IE = 1;	��TMR1�ж�
}

/*************************************************************************************
*ʵ��ʱ���붨ʱʱ����ƫ��,��ͨ��Timer1_ISR_execution_total_time������
*Timer1_ISR_execution_total_time == ��Timer1�жϲ��������жϺ������˳��жϺ���ִ��ʱ�䣩/TIMER1_DIVIDER,
*��ʱʱ�� == T_nums * T
*T = (1/F)*TIMER1_DIVIDER
*************************************************************************************/
void Timer1_start(unsigned int T_nums, unsigned char Timer1_ISR_execution_total_time)
{
	//Timer1_set_time = 0xffff - T_nums + Timer1_ISR_execution_total_time;
	TMR1L = (unsigned char)(Timer1_set_time);
	TMR1H = (unsigned char)(Timer1_set_time>>8);
	PIR1 &= ~(0x01);	// TMR1IF = 0;	
	T1CON |= 0x01;		// TMR1ON = 1;	Start Timer0
}


void Timer1_stop(void)
{
	PIE1 &= ~(0x01);		//TMR1IE = 0;	��TMR1�ж�
	T1CON &= ~(0x01);	//TMR1ON = 0;	�ض�ʱ��
	PIR1 &= ~(0x01);	// TMR1IF = 0;	
}




//�жϺ���
void TIMER1_ISR(void)
{
	T1CON &= ~(0x01);	//TMR1ON = 0;	�ض�ʱ��
	TMR1L = (unsigned char)(Timer1_set_time);
	TMR1H = (unsigned char)(Timer1_set_time>>8);
	
	//------------------------------------------------

	clk_count ++;
	
	if(Time1s_cot)
	{
		Time1s_cot--;
	}
	//------------------------------------------------
	PIR1 &= ~(0x01);	// TMR1IF = 0;	
	T1CON |= 0x01;		//TMR1ON = 1;		��ʱ��
}






