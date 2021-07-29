#include "cms.h"
#include "uart.h"
#include "delay.h"
#include "system.h"
void send(unsigned char uContent)
{
	unsigned char i=0;
	unsigned char uSendContent =0xff;/*定义一个发送数据的变量*/
	uSendContent=uContent;			 /*将要发送的值赋给该变量*/
	IO7_OUT;     					 /*发送脚位设为输出模式*/
	IO7_L;							 /*起始位，RB7作为发送端的引脚*/
	Delay_us(15);					 /*延迟114us 波特率设为9600*/
	for(i=0;i<8;i++)
	{
		IO7 =uSendContent&0x01;		 /*将所要发送的八位数据的最低位和0x01进行于运算，若最低位为1，相于后的结果为1，则RB7电平为高，否则为0*/
		Delay_us(15);				 /*延迟114us*/
		uSendContent=uSendContent>>1;/*将第二位数据位移到最低位，重复进行七次移动*/
	}
	IO7_H;							 /*停止位*/
	Delay_us(15);
}
