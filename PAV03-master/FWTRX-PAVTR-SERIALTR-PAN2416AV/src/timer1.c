#include "cms.h"
#include "virtual_timer.h"
#include "timer1.h"
#include "key_scan.h"
#include "recive.h"


static volatile unsigned int Timer1_set_time;
extern unsigned int sleep_flag;



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
	Timer1_set_time = 0xffff - T_nums + Timer1_ISR_execution_total_time;
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

void TIMER1_ISR(void)
{
	static unsigned int flag_1s_add=0;
	static unsigned int flag_1min_add=0;
	T1CON &= ~(0x01);	//TMR1ON = 0;	关定时器
	TMR1L = (unsigned char)(Timer1_set_time);
	TMR1H = (unsigned char)(Timer1_set_time>>8);
	//Do something
	flag_time_key0_add++;
	flag_time_key1_add++;
	flag_time_key2_add++;
	flag_5s_add++;
	flag_5min_add++;
	flag_1s_add++;
	///////////////////////////////////////////////////
	PIR1 &= ~(0x01);	// TMR1IF = 0;	
	T1CON |= 0x01;		//TMR1ON = 1;		打开时器
}
