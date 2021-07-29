#include "cms.h"
#include "PORTB_interrupt.h"

static volatile unsigned char last_PORTB_value;
/***********************************************************
* icob_value bit1-bit7,置1，使能相应口电平变化中断
************************************************************/
void PORTB_INT_Init(unsigned char icob_value);

/***********************************************************
* disable_port bit1-bit7,置1，失效相应口电平变化中断
************************************************************/
void PORTB_INT_Disable(unsigned char icob_value);
void PORTB_CHANGE_ISR(void);


/***********************************************************
* icob_value bit1-bit7,置1，使能相应口电平变化中断
************************************************************/
void PORTB_INT_Init(unsigned char icob_value)
{
	OPTION_REG &= ~0x80;	//RBPU=0;开启PORTB上拉功能
	ANSELH &= ~icob_value;	//数字脚
	TRISB |= icob_value; 	//输入
	WPUB |= icob_value;		//弱上拉
	IOCB |= icob_value;		//中断使能
	last_PORTB_value = PORTB;
	INTCON |= 0x08;			//RBIE = 1;	开RB中断
}

/***********************************************************
* disable_port bit1-bit7,置1，失效相应口电平变化中断
************************************************************/
void PORTB_INT_Disable(unsigned char disable_port)
{
	IOCB &= ~(disable_port);
	INTCON &= ~0x08;			//RBIE = 0;	关RB中断
	INTCON &= ~0x01;	//RBIF = 0;
}


void PORTB_CHANGE_ISR(void)
{
	 unsigned char port_tmep;
	 port_tmep = PORTB;
	 port_tmep ^= last_PORTB_value;		//get change bit
	 //do something

	 
	 
	 
	 

	////////////////////////////////////////////
	INTCON &= ~0x01;	//RBIF = 0;	
	last_PORTB_value = PORTB;
}

