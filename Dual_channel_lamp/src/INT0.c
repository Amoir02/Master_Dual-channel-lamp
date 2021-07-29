#include "cms.h"
#include "INT0.h"
#include "delay.h"

/**************************************************
*与PORTB电平变化中断可能冲突
***************************************************/
void INT0_Init(INT_EDGE_e INT_EDGE);
void INT0_Disable(void);
void INT0_ISR(void);

/*******************************************************
*与RB1电平中断冲突
*INT_EDGE触发延类型
********************************************************/
void INT0_Init(INT_EDGE_e INT_EDGE)
{
	OPTION_REG &= ~(0x80|0x40);	//RBPU = 0,上拉由WPUB决定; INTEDG = 0,下降沿触发
	ANSELH &= ~0x02;			//RB1设置为数字脚 
	TRISB |= 0x02;				//RB1/INT0置为输入
	WPUB |= 0x02;				//RB1上拉
	IOCB &= ~0x02;				//禁止RB1电平变化中断
	OPTION_REG |= INT_EDGE;		//设置中断延
	INTCON &= ~0x03;			//INTF = 0;	清中断标志位
	INTCON |= 0x10;				//INTE = 1;	使能外部中断0
	
}

void INT0_ISR(void)
{
	INTCON &= ~0x10;			//INTE = 0;	关闭外部中断0
	//Do something
	


	//////////////////////////////////////////////////////
	INTCON &= ~0x02;		//INTF = 0;
	INTCON |= 0x10;			//INTE = 1;	打开外部中断0
}

void INT0_Disable(void)
{
	INTCON &= ~0x10;		//INTE = 0;	关闭外部中断0
	INTCON &= ~0x02;		//INTF = 0;
}