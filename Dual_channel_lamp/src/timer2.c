#include "cms.h"
#include "timer2.h"

void Timer2_Init(TIMER2_PRE_DIVIDER_e TIMER2_PRE_DIVIDER,TIMER2_AFTER_DIVIDER_e TIMER2_AFTER_DIVIDER);
void Timer2_start(unsigned char T_nums);
void Timer2_stop(void);
void TIMER2_ISR(void);

/**************************************************************************
*与CCPX功能冲突
*时钟源为F = Fosc/4
*最小定时时间 T = (1/F)*TIMER2_PRE_DIVIDER*TIMER2_AFTER_DIVIDER
***************************************************************************/
void Timer2_Init(TIMER2_PRE_DIVIDER_e TIMER2_PRE_DIVIDER,TIMER2_AFTER_DIVIDER_e TIMER2_AFTER_DIVIDER)
{
	T2CON = 0x00;
	T2CON |= TIMER2_PRE_DIVIDER;	//设置预分频值
	T2CON |= TIMER2_AFTER_DIVIDER;	//设置后分频值
	INTCON |= 0x40;					//PEIE = 1;开外设中断
	PIE1 |= 0x02;					//TMR2IE = 1; 开中断
}

/*************************************************************************************
*实际时间与定时时间有偏差，偏差时间为Timer2中断产生进入中断函数到退出中断函数执行时间
*定时时间 == T_nums * T
*T = (1/(Fosc/4))*TIMER2_PRE_DIVIDER*TIMER2_AFTER_DIVIDER
**************************************************************************************/
void Timer2_start(unsigned char T_nums)
{
	PR2 = T_nums;
	T2CON |= 0x04; 					//TMR2ON = 1;Start Timer2
}

void Timer2_stop(void)
{
	PIE1 &= ~0x02;					//TMR2IE = 0; 关中断
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