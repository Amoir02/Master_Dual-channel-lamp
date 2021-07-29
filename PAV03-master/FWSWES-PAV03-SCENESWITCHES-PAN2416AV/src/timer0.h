#ifndef _TIMER0_H_
#define _TIMER0_H_




extern void Timer0_Init(void);
extern void Timer0_start(unsigned char T, unsigned char Timer0_ISR_execution_total_time);
extern void Timer0_stop(void);
extern void TIMER0_ISR(void);




















#endif
