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
*时钟源为F = Fosc
*最小定时时间 T = (1/F)*TIMER1_DIVIDER
**************************************************************************/
void Timer1_Init(TIMER1_DIVIDER_e TIMER1_DIVIDER)
{
	T1CON = 0x00;	//TMR1GE = 0,Timer1由TMR1ON控制	TMR1CS = 0;选择内部时钟FOSC
	T1CON |= TIMER1_DIVIDER;	//分频设置	Bit5 Bit4 
	INTCON |= (0x40);	//PEIE = 1;		允许未被屏蔽的外部中断
	PIE1 |= 0x01;		//TMR1IE = 1;	开TMR1中断
}

/*************************************************************************************
*实际时间与定时时间有偏差,可通过Timer1_ISR_execution_total_time修正，
*Timer1_ISR_execution_total_time == （Timer1中断产生进入中断函数到退出中断函数执行时间）/TIMER1_DIVIDER,
*定时时间 == T_nums * T
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
	PIE1 &= ~(0x01);		//TMR1IE = 0;	关TMR1中断
	T1CON &= ~(0x01);	//TMR1ON = 0;	关定时器
	PIR1 &= ~(0x01);	// TMR1IF = 0;	
}




//中断函数
void TIMER1_ISR(void)
{
	T1CON &= ~(0x01);	//TMR1ON = 0;	关定时器
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
	T1CON |= 0x01;		//TMR1ON = 1;		打开时器
}






