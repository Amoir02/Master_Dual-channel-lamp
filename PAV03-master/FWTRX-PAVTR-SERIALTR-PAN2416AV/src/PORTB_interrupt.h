#ifndef _PORTB_INTERRUPT_H_
#define _PORTB_INTERRUPT_H_

/***********************************************************
* icob_value bit1-bit7,置1，使能相应口电平变化中断
************************************************************/
extern void PORTB_INT_Init(unsigned char icob_value);

/***********************************************************
* disable_port bit1-bit7,置1，失效相应口电平变化中断
************************************************************/
extern void PORTB_INT_Disable(unsigned char icob_value);


extern void PORTB_CHANGE_ISR(void);




#endif
