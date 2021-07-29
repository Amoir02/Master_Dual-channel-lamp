#ifndef _TIMER1_H_
#define _TIMER1_H_

/*********************************************************************
*Timer1_Init(TIMER1_DIV_8);		
*Timer1_start(10000,0);		//定时10ms
**********************************************************************/

typedef enum{
	TIMER1_DIV_1 = 0x00,
	TIMER1_DIV_2 = 0x10,
	TIMER1_DIV_4 = 0x20,
	TIMER1_DIV_8 = 0x30,
}TIMER1_DIVIDER_e;

/**************************************************************************
*时钟源为F = Fosc
*最小定时时间 T = (1/F)*TIMER1_DIVIDER
**************************************************************************/
extern void Timer1_Init(TIMER1_DIVIDER_e TIMER_DIVIDER);

/*************************************************************************************
*实际时间与定时时间有偏差,可通过Timer1_ISR_execution_total_time修正，
*Timer1_ISR_execution_total_time == （Timer1中断产生进入中断函数到退出中断函数执行时间）/TIMER1_DIVIDER,
*定时时间 == T_nums * T
*T = (1/F)*TIMER1_DIVIDER
*************************************************************************************/
extern void Timer1_start(unsigned int T_nums, unsigned char Timer1_ISR_execution_total_time);

extern void Timer1_stop(void);
extern void TIMER1_ISR(void);


#endif
