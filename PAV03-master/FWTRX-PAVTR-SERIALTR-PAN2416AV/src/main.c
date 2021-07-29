#include "cms.h"
#include "system.h"
#include "WDT.h"
#include "rf297L.h"
#include "timer1.h"
#include "timer2.h"
#include "PWM.h"
#include "key_scan.h"
#include "INT0.h"
#include "ADC.h"
#include "PORTB_interrupt.h"
#include "recive.h"
#include "iic.h"
#include "e2prom.h"
#include "uart.h"
#include "string.h"
/**********************************************************/
//1、在使用中断过程中，需要把systerm.c中没用到的中断及其判断条件都屏蔽掉
//2、RF部分收发延时和唤醒延时，不建议修改库，否则会出现RF不稳定情况
//3、在芯片配置选项中，需要把看门狗关闭；若需要使用看门狗，软件中开启使用看门狗即可。
//4、VPPOUTEN - ENABLE
/**********************************************************/




unsigned int sleep_flag=0;
unsigned char flag_rx=0;
extern uint8_t rf_buf[20];

/** ID1 ID2 ID3 ID4  CHANNEL  COUNT**/

uint8_t control_id[12][6]=
{
	{0,0,0,0,0,0},
	{0,0,0,0,0,0},
	{0,0,0,0,0,0},
	{0,0,0,0,0,0},
	{0,0,0,0,0,0},
	{0,0,0,0,0,0},
	{0,0,0,0,0,0},
	{0,0,0,0,0,0},
	{0,0,0,0,0,0},
	{0,0,0,0,0,0},
	{0,0,0,0,0,0},
	{0,0,0,0,0,0}		
};

uint8_t channel_flag[3]={0,0,0};
extern channel_flag_stu KEY0;
extern channel_flag_stu KEY1;
extern channel_flag_stu KEY2;

void main()
{
	unsigned char i=0;
	system_set_CPU_frequency(CPU_FREQUENCY_8M);
	soft_delay_ms(100); /*延迟500ms*/  
	asm("nop");			/*空操作指令*/
	
	/**IO初始化**/
	TRISC = 0x00; 		/*PWM1和PWM2  IO口初始化*/
	TRISB |= 0x00;		/*bit4,bit5,bit6设置为输入引脚AN11(RELAY2),AN13(RELAY1),ICSPCLK(RELAY0)*/
	
	RC0=1;       		/*关灯*/
	RB1=1;       		/*关灯*/
	
	IIC_Init();  		/*SDA、SCL高电平,IIC初始化*/
	key_Init();	  		/*KEY0、KET1、KEY2按键初始化定义为输入脚，使能上拉*/
	RF_Init();			/*PAN2416配置，对应POWER值不一样*/
	RF_Set_RxMode();	/*增强型接收模式*/ 

	Timer1_Init(TIMER1_DIV_8);/*1：8 预分频比 外部中断允许*/
	Timer1_start(10000,0);	  /*定时10ms*/

	Enable_Interrupt();  /*允许所有未被屏蔽的中断*/
	
	while(1)
	{	
        recive_task();	 /*接收端数据处理*/
	}
}

