#include "cms.h"
#include "virtual_timer.h"
#include "timer1.h"
#include "key_scan.h"
#include "recive.h"


//static volatile unsigned int Timer1_set_time;
//extern unsigned int sleep_flag;

// Timer1_set_time = 0xffff - T_nums + Timer1_ISR_execution_total_time;
// Timer1_set_time = 0xffff - 10000 + 0;
#define TIME1_SET_TIME  55532

extern uint16_t flag_time_key0_add;
extern uint16_t flag_time_key1_add;
extern uint16_t flag_time_key2_add;
extern uint16_t flag_5s_add;
uint16_t flag_5min_add=0;

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
	TMR1L = (unsigned char)(TIME1_SET_TIME);
	TMR1H = (unsigned char)(TIME1_SET_TIME>>8);
	PIR1 &= ~(0x01);	// TMR1IF = 0;	
	T1CON |= 0x01;		// TMR1ON = 1;	Start Timer0
}


void Timer1_stop(void)
{
	PIE1 &= ~(0x01);		//TMR1IE = 0;	��TMR1�ж�
	T1CON &= ~(0x01);	//TMR1ON = 0;	�ض�ʱ��
	PIR1 &= ~(0x01);	// TMR1IF = 0;	
}

void TIMER1_ISR(void)
{
	static unsigned int flag_1s_add=0;
	static unsigned int flag_1min_add=0;
	T1CON &= ~(0x01);	//TMR1ON = 0;	�ض�ʱ��
	TMR1L = (unsigned char)(TIME1_SET_TIME);
	TMR1H = (unsigned char)(TIME1_SET_TIME>>8);
	//Do something
	flag_time_key0_add++;
	flag_time_key1_add++;
	flag_time_key2_add++;
	flag_5s_add++;
	flag_5min_add++;
	flag_1s_add++;
	///////////////////////////////////////////////////
	PIR1 &= ~(0x01);	// TMR1IF = 0;	
	T1CON |= 0x01;		//TMR1ON = 1;		��ʱ��
}
