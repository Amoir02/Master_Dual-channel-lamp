#ifndef _INT0_H_
#define _INT0_H_


typedef enum{
	NEG = 0x00,
	POS = 0x40,
}INT_EDGE_e;

/*******************************************************
*与RB1电平中断冲突
*INT_EDGE触发延类型
********************************************************/
extern void INT0_Init(INT_EDGE_e INT_EDGE);

extern void INT0_Disable(void);
extern void INT0_ISR(void);




















#endif
