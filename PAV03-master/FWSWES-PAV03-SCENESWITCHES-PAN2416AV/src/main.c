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
//3����оƬ����ѡ���У���Ҫ�ѿ��Ź��رգ�����Ҫʹ�ÿ��Ź��������п���ʹ�ÿ��Ź����ɡ�
//4��VPPOUTEN - ENABLE
/**********************************************************/




//unsigned int sleep_flag = 0;
unsigned char flag_rx = 0;
extern uint8_t rf_buf[18];
extern uint8_t  is_factory_flag;

// ID1 ID2 ID3 ID4  CHANNEL  COUNT
uint8_t control_id[12][6]=
{
	{0,0,0,0,0,0},    //0   channel 0
	{0,0,0,0,0,0},    //1   channel 0
	{0,0,0,0,0,0},    //2   channel 0
	{0,0,0,0,0,0},    //3   channel 1
	{0,0,0,0,0,0},    //4   channel 1
	{0,0,0,0,0,0},    //5   channel 1
	{0,0,0,0,0,0},    //6   channel 2
	{0,0,0,0,0,0},    //7   channel 2
	{0,0,0,0,0,0},    //8   channel 2
	{0,0,0,0,0,0},    //9   channel scene
	{0,0,0,0,0,0},    //10  channel scene
	{0,0,0,0,0,0}     //11  channel scene
};
    
    
// 各通道使用的资源位索引
// bit7~bit6 for channel_scene;
// bit5~bit4 for channel_2;
// bit3~bit2 for channel_1;
// bit1~bit0 for channel_0;
uint8_t channel_flag    = 0;

// 各通道开关状态 0-关；1-开
// bit7~bit3 reverse;
// bit2 for channel_2;
// bit1 for channel_1;
// bit0 for channel_0;
uint8_t channel_status  = 0;

// 各通道上电动作配置 0-上电关；1-上电开；2-上电保持
// bit7~bit6 reverse;
// bit5~bit4 for channel_2;
// bit3~bit2 for channel_1;
// bit1~bit0 for channel_0;
uint8_t channel_startup = 0;

extern channel_flag_stu KEY0;
extern channel_flag_stu KEY1;
extern channel_flag_stu KEY2;
extern unsigned char sys_stute;
uint8_t power_on_flag = 0;
uint8_t power_on_delay_flag = 0;

static void loadPowerOnEeprom(void)
{
	power_on_delay_flag = 1;
	AT24C02_Read_Msg(POWER_ON_NUM, &power_on_flag, POWER_ON_NUM_SIZE);
	if(power_on_flag > 3)
	{
		power_on_flag = 0;
	}
	power_on_flag++;
	AT24C02_Write_Msg(POWER_ON_NUM, &power_on_flag, POWER_ON_NUM_SIZE);
	if(power_on_flag == 3)
	{
		power_on_flag = 0;
		AT24C02_Write_Msg(POWER_ON_NUM, &power_on_flag, POWER_ON_NUM_SIZE);
		sys_stute = MATCH_MSG;
		soft_delay_ms(200);
		sledBlink();
	}

}

static loadParamsFromEeprom(void)
{
    unsigned char i;
    unsigned char startup;
    uint8_t factory_flag[2] = {0, 0};
    
	for(i=0; i<12; i++)
	{
		AT24C02_Read_Msg(i*6, control_id[i], 6);    /**<Reads paired data stored at EEPROM*/
	}
	
	AT24C02_Read_Msg(ADDR_CHN_FLAG, &channel_flag, 1);         /**<Reads the number of bindings per channel*/
    AT24C02_Read_Msg(ADDR_CHN_STATUS, &channel_status, 1);
    AT24C02_Read_Msg(ADDR_CHN_STARTUP, &channel_startup, 1);
	AT24C02_Read_Msg(ADDR_NOT_FACTORY_FLAG, factory_flag, NOT_FACTORY_FLAG_SIZE);

    if (NOT_FACTORY_FLAG0 == factory_flag[0] && NOT_FACTORY_FLAG1 == factory_flag[1])
    {
        is_factory_flag = 0;
    }
    else
    {
        is_factory_flag = 1;
    }
	//for( i=0; i<12; i++ )
	//{
	//	if(channel_flag[i] >= 4)
	//	{
	//		channel_flag[i] = 0;  /**<Determines if the number of bindings per channel exceeds 4 groups*/
	//	}
	//}

	for(i = 0; i < CHANNEL_NUM; i++)
	{
	    startup = getChnStartupConfig(channel_startup, i);
		if (STARTUP_OFF == startup)
		{
		    setChannelStatus(i, CHANNEL_OFF);
		}
		else if (STARTUP_STAY == startup)
		{
		    if (CHANNEL_OFF == getChannelStatus(channel_status, i))
		    {
		        setChannelStatus(i, CHANNEL_OFF);
		    }
		    else
		    {
		        setChannelStatus(i, CHANNEL_ON);
		    }
		}
		else if (STARTUP_ON == startup)
		{
		    setChannelStatus(i, CHANNEL_ON);
		}

#if (FACTORY_STARTUP == FACTORY_STARTUP_ON)
        
        else
        {
            setChannelStatus(i, CHANNEL_ON);
        }
#else
        else
        {
            setChannelStatus(i, CHANNEL_OFF);
        }
#endif
		
	}
}


void main()
{
	system_set_CPU_frequency(CPU_FREQUENCY_8M);
	/**IO initialization**/
	TRISC = 0x00;
	TRISB |= 0x70;

	RC0 = 1;            /**<Turn off the lights*/
	loadPowerOnEeprom();

	soft_delay_ms(500);
	asm("nop");
	
	
	IIC_Init();       /**<IIC initialization*/
	key_Init();       /**<Key initialization*/
	RF_Init();        /**<RF initialization*/
	RF_Set_RxMode();  /**<Set to receive mode*/

	Timer1_Init(TIMER1_DIV_8);   /**<Timer is initialized and set to 8 frequency division*/
	Timer1_start(10000, 0);       /**< 10ms*/

	loadParamsFromEeprom();
	Enable_Interrupt();                           /**<The interrupt enable*/
	// sledBlink();
	

	while(1)
	{	
		channel_set(0, KEY0.channel_status);	  /**<Channel 0 output state Settings*/
		channel_set(1, KEY1.channel_status);	  /**<Channel 1 output state Settings*/
		channel_set(2, KEY2.channel_status);	  /**<Channel 2 output state Settings*/

		recive_task();		/**<2.4g receive tasks*/

		key_value_read();	/**<Key reading task*/

		delay_task();       /**<Delayed task execution*/
	}
}

