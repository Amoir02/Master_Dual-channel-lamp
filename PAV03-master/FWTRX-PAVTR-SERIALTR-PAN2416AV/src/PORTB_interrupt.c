#include "cms.h"
#include "PORTB_interrupt.h"

static volatile unsigned char last_PORTB_value;
/***********************************************************
* icob_value bit1-bit7,��1��ʹ����Ӧ�ڵ�ƽ�仯�ж�
************************************************************/
void PORTB_INT_Init(unsigned char icob_value);

/***********************************************************
* disable_port bit1-bit7,��1��ʧЧ��Ӧ�ڵ�ƽ�仯�ж�
************************************************************/
void PORTB_INT_Disable(unsigned char icob_value);
void PORTB_CHANGE_ISR(void);


/***********************************************************
* icob_value bit1-bit7,��1��ʹ����Ӧ�ڵ�ƽ�仯�ж�
************************************************************/
void PORTB_INT_Init(unsigned char icob_value)
{
	OPTION_REG &= ~0x80;	//RBPU=0;����PORTB��������
	ANSELH &= ~icob_value;	//���ֽ�
	TRISB |= icob_value; 	//����
	WPUB |= icob_value;		//������
	IOCB |= icob_value;		//�ж�ʹ��
	last_PORTB_value = PORTB;
	INTCON |= 0x08;			//RBIE = 1;	��RB�ж�
}

/***********************************************************
* disable_port bit1-bit7,��1��ʧЧ��Ӧ�ڵ�ƽ�仯�ж�
************************************************************/
void PORTB_INT_Disable(unsigned char disable_port)
{
	IOCB &= ~(disable_port);
	INTCON &= ~0x08;			//RBIE = 0;	��RB�ж�
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

