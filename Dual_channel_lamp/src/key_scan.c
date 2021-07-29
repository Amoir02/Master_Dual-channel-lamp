#include "cms.h"
#include "key_scan.h"
#include "timer1.h"

volatile unsigned char key_change_flag;
volatile unsigned char key_value;

void key_Init(void);
void key_scan(void);

/********************************************************
*按键扫描程序，没帧执行一次，帧时间右Timer1确定，需要打开Timer1中断
*按键按下、抬起都会有1帧去抖
*********************************************************/
void key_scan(void)
{
	static unsigned char key_unstable_flag;
	static unsigned char last_key_value_temp;
	unsigned char key_value_temp;
	unsigned char i;
	unsigned char port_value;
	
	port_value = PORTB|0xf0;		//读取端口值
	//MAP
	port_value = ~port_value;
	key_value_temp = port_value>>1;
	
	
	////////////////////////////////////////////////////////////////////////////
	key_unstable_flag = key_value_temp^last_key_value_temp;		//判断端口值是否稳定
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
*按键初始化
*PAN2416通常采用PORTB口做按键
*************************************************/
void key_Init(void)
{
	OPTION_REG &= ~0x80;	//RBPU=0, 上拉由WPUB寄存器控制
	ANSELH = 0x00;			//PORTB口设置成数字口
	TRISB = 0xff;			//PORTB口设置成输入
	WPUB = 0xff;			//PORTB口上拉使能 
	
	Timer1_Init(TIMER1_DIV_8);		
	Timer1_start(10000,0);		//定时10ms
}