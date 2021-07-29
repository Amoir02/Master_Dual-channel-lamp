#include "cms.h"
#include "key_scan.h"
#include "timer1.h"

volatile unsigned char key_change_flag;
volatile unsigned char key_value;

void key_Init(void);
void key_scan(void);

/********************************************************
*����ɨ�����ûִ֡��һ�Σ�֡ʱ����Timer1ȷ������Ҫ��Timer1�ж�
*�������¡�̧�𶼻���1֡ȥ��
*********************************************************/
void key_scan(void)
{
	static unsigned char key_unstable_flag;
	static unsigned char last_key_value_temp;
	unsigned char key_value_temp;
	unsigned char i;
	unsigned char port_value;
	
	port_value = PORTB|0xf0;		//��ȡ�˿�ֵ
	//MAP
	port_value = ~port_value;
	key_value_temp = port_value>>1;
	
	
	////////////////////////////////////////////////////////////////////////////
	key_unstable_flag = key_value_temp^last_key_value_temp;		//�ж϶˿�ֵ�Ƿ��ȶ�
	if(key_unstable_flag != 0){
		key_value = last_key_value_temp;
	}else{
		key_value = key_value_temp;
	}
	//////////////////////////////////////
	key_change_flag = last_key_value_temp^key_value_temp;
	last_key_value_temp = key_value_temp;
}

/************************************************
*������ʼ��
*PAN2416ͨ������PORTB��������
*************************************************/
void key_Init(void)
{
	OPTION_REG &= ~0x80;	//RBPU=0, ������WPUB�Ĵ�������
	ANSELH = 0x00;			//PORTB�����ó����ֿ�
	TRISB = 0xff;			//PORTB�����ó�����
	WPUB = 0xff;			//PORTB������ʹ�� 
	
	Timer1_Init(TIMER1_DIV_8);		
	Timer1_start(10000,0);		//��ʱ10ms
}