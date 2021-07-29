#include "cms.h"
#include "INT0.h"
#include "delay.h"

/**************************************************
*��PORTB��ƽ�仯�жϿ��ܳ�ͻ
***************************************************/
void INT0_Init(INT_EDGE_e INT_EDGE);
void INT0_Disable(void);
void INT0_ISR(void);

/*******************************************************
*��RB1��ƽ�жϳ�ͻ
*INT_EDGE����������
********************************************************/
void INT0_Init(INT_EDGE_e INT_EDGE)
{
	OPTION_REG &= ~(0x80|0x40);	//RBPU = 0,������WPUB����; INTEDG = 0,�½��ش���
	ANSELH &= ~0x02;			//RB1����Ϊ���ֽ� 
	TRISB |= 0x02;				//RB1/INT0��Ϊ����
	WPUB |= 0x02;				//RB1����
	IOCB &= ~0x02;				//��ֹRB1��ƽ�仯�ж�
	OPTION_REG |= INT_EDGE;		//�����ж���
	INTCON &= ~0x03;			//INTF = 0;	���жϱ�־λ
	INTCON |= 0x10;				//INTE = 1;	ʹ���ⲿ�ж�0
	
}

void INT0_ISR(void)
{
	INTCON &= ~0x10;			//INTE = 0;	�ر��ⲿ�ж�0
	//Do something
	


	//////////////////////////////////////////////////////
	INTCON &= ~0x02;		//INTF = 0;
	INTCON |= 0x10;			//INTE = 1;	���ⲿ�ж�0
}

void INT0_Disable(void)
{
	INTCON &= ~0x10;		//INTE = 0;	�ر��ⲿ�ж�0
	INTCON &= ~0x02;		//INTF = 0;
}