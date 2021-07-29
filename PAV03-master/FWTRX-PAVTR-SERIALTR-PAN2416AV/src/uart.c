#include "cms.h"
#include "uart.h"
#include "delay.h"
#include "system.h"
void send(unsigned char uContent)
{
	unsigned char i=0;
	unsigned char uSendContent =0xff;/*����һ���������ݵı���*/
	uSendContent=uContent;			 /*��Ҫ���͵�ֵ�����ñ���*/
	IO7_OUT;     					 /*���ͽ�λ��Ϊ���ģʽ*/
	IO7_L;							 /*��ʼλ��RB7��Ϊ���Ͷ˵�����*/
	Delay_us(15);					 /*�ӳ�114us ��������Ϊ9600*/
	for(i=0;i<8;i++)
	{
		IO7 =uSendContent&0x01;		 /*����Ҫ���͵İ�λ���ݵ����λ��0x01���������㣬�����λΪ1�����ں�Ľ��Ϊ1����RB7��ƽΪ�ߣ�����Ϊ0*/
		Delay_us(15);				 /*�ӳ�114us*/
		uSendContent=uSendContent>>1;/*���ڶ�λ����λ�Ƶ����λ���ظ������ߴ��ƶ�*/
	}
	IO7_H;							 /*ֹͣλ*/
	Delay_us(15);
}
