#ifndef _TIMER2_H_
#define _TIMER2_H_

/****************************************************************
*	使用示例
*	Timer2_Init(TIMER2_PRE_DIV_16,TIMER2_AFTER_DIV_16);
*	Timer2_start(100);
*	这段代码定时12.8ms(8M) + 中断执行时间
*	定时时间到，调用TIMER2_ISR中断函数
*****************************************************************/
typedef enum{
	TIMER2_PRE_DIV_1 = 0x00,
	TIMER2_PRE_DIV_4 = 0x01,
	TIMER2_PRE_DIV_16 = 0x02,
}TIMER2_PRE_DIVIDER_e;

typedef enum{
	TIMER2_AFTER_DIV_1 = 0x00<<3,
	TIMER2_AFTER_DIV_2 = 0x01<<3,
	TIMER2_AFTER_DIV_3 = 0x02<<3,
	TIMER2_AFTER_DIV_4 = 0x03<<3,
	TIMER2_AFTER_DIV_5 = 0x04<<3,
	TIMER2_AFTER_DIV_6 = 0x05<<3,
	TIMER2_AFTER_DIV_7 = 0x06<<3,
	TIMER2_AFTER_DIV_8 = 0x07<<3,
	TIMER2_AFTER_DIV_9 = 0x08<<3,
	TIMER2_AFTER_DIV_10 = 0x09<<3,
	TIMER2_AFTER_DIV_11 = 0x0a<<3,
	TIMER2_AFTER_DIV_12 = 0x0b<<3,
	TIMER2_AFTER_DIV_13 = 0x0c<<3,
	TIMER2_AFTER_DIV_14 = 0x0d<<3,
	TIMER2_AFTER_DIV_15 = 0x0e<<3,
	TIMER2_AFTER_DIV_16 = 0x0f<<3,
}TIMER2_AFTER_DIVIDER_e;

extern void Timer2_Init(TIMER2_PRE_DIVIDER_e TIMER2_PRE_DIVIDER,TIMER2_AFTER_DIVIDER_e TIMER2_AFTER_DIVIDER);
extern void Timer2_start(unsigned char T_nums);
extern void Timer2_stop(void);
extern void TIMER2_ISR(void);

#endif
