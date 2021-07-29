#include "cms.h"
#include "timer0.h"

static volatile unsigned char Timer0_set_time;
void Timer0_Init(void);
void Timer0_start(unsigned char T, unsigned char Timer0_ISR_execution_total_time);
void Timer0_stop(void);
void TIMER0_ISR(void);

// Timerģʽ��ʱ��ԴΪOSC/4
// PS2��PS0 �̶������WDT��Timer0����ʹ��
void Timer0_Init(void)
{
	OPTION_REG &= ~(0x30);	//bit4 bit5 ���� T0CS T0SE Fosc/4
	OPTION_REG |= 0x10;		//��ʱ��
}


//start_Timer0 T��ʱʱ�� ���255T ,Timer0_ISR_execution_total_time=�жϺ���ִ�е���ʱ��
void Timer0_start(unsigned char T, unsigned char Timer0_ISR_execution_total_time)
{
	Timer0_set_time = 0xff - T + Timer0_ISR_execution_total_time;
	TMR0 = Timer0_set_time;
	INTCON &= ~(0x04);		// T0IF 
	INTCON |= 0x20;			// Set T0IE
}

void Timer0_stop(void)
{
	INTCON &= ~(0x20);			//Clear T0IE
	INTCON &= ~(0x04);		//T0IF = 0;		Clear T0IF 
}

void TIMER0_ISR(void)
{
	//do something

	 
	 
	 
	 

	////////////////////////////////////////////
	INTCON &= ~(0x04);		//T0IF = 0;		Clear T0IF 
	TMR0 = Timer0_set_time;
}