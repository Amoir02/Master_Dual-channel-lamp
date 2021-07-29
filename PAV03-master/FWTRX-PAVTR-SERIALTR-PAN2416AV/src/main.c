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
//1����ʹ���жϹ����У���Ҫ��systerm.c��û�õ����жϼ����ж����������ε�
//2��RF�����շ���ʱ�ͻ�����ʱ���������޸Ŀ⣬��������RF���ȶ����
//3����оƬ����ѡ���У���Ҫ�ѿ��Ź��رգ�����Ҫʹ�ÿ��Ź�������п���ʹ�ÿ��Ź����ɡ�
//4��VPPOUTEN - ENABLE
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
	soft_delay_ms(100); /*�ӳ�500ms*/  
	asm("nop");			/*�ղ���ָ��*/
	
	/**IO��ʼ��**/
	TRISC = 0x00; 		/*PWM1��PWM2  IO�ڳ�ʼ��*/
	TRISB |= 0x00;		/*bit4,bit5,bit6����Ϊ��������AN11(RELAY2),AN13(RELAY1),ICSPCLK(RELAY0)*/
	
	RC0=1;       		/*�ص�*/
	RB1=1;       		/*�ص�*/
	
	IIC_Init();  		/*SDA��SCL�ߵ�ƽ,IIC��ʼ��*/
	key_Init();	  		/*KEY0��KET1��KEY2������ʼ������Ϊ����ţ�ʹ������*/
	RF_Init();			/*PAN2416���ã���ӦPOWERֵ��һ��*/
	RF_Set_RxMode();	/*��ǿ�ͽ���ģʽ*/ 

	Timer1_Init(TIMER1_DIV_8);/*1��8 Ԥ��Ƶ�� �ⲿ�ж�����*/
	Timer1_start(10000,0);	  /*��ʱ10ms*/

	Enable_Interrupt();  /*��������δ�����ε��ж�*/
	
	while(1)
	{	
        recive_task();	 /*���ն����ݴ���*/
	}
}

