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
/**********************************************************/
//1����ʹ���жϹ����У���Ҫ��systerm.c��û�õ����жϼ����ж����������ε�
//2��RF�����շ���ʱ�ͻ�����ʱ���������޸Ŀ⣬��������RF���ȶ����
//3����оƬ����ѡ���У���Ҫ�ѿ��Ź��رգ�����Ҫʹ�ÿ��Ź�������п���ʹ�ÿ��Ź����ɡ�
//4��VPPOUTEN - ENABLE
/**********************************************************/




unsigned int sleep_flag=0;
unsigned char flag_rx=0;
extern uint8_t rf_buf[18];

// ID1 ID2 ID3 ID4  CHANNEL  COUNT

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
	unsigned char i;
	system_set_CPU_frequency(CPU_FREQUENCY_8M);
	soft_delay_ms(500);
	asm("nop");
	
	/**IO��ʼ��**/
	TRISC = 0x00;
	TRISB |= 0x70;

	RC0=1; //�ص�
	
	IIC_Init();
	key_Init();
	RF_Init();
	RF_Set_RxMode();

	Timer1_Init(TIMER1_DIV_8);
	Timer1_start(10000,0);


	for(i=0;i<12;i++)
	{
		AT24C02_Read_Msg(i*6,control_id[i],6);
	}
	
	AT24C02_Read_Msg(100,channel_flag,3);
	
	for(i=0;i<12;i++)
	{
		if(channel_flag[i]>=4)channel_flag[i]=0;
	}
	
	Enable_Interrupt();
	
	while(1)
	{	
		channel_set(0,KEY0.channel_status);
		channel_set(1,KEY1.channel_status);
		channel_set(2,KEY2.channel_status);

		recive_task();
		
		key_value_read();

		delay_task();
	}
}

