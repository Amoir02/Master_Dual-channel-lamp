#ifndef _INT0_H_
#define _INT0_H_


typedef enum{
	NEG = 0x00,
	POS = 0x40,
}INT_EDGE_e;

/*******************************************************
*��RB1��ƽ�жϳ�ͻ
*INT_EDGE����������
********************************************************/
extern void INT0_Init(INT_EDGE_e INT_EDGE);

extern void INT0_Disable(void);
extern void INT0_ISR(void);




















#endif
