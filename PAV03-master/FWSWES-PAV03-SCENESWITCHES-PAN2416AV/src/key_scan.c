#include "cms.h"
#include "key_scan.h"
#include "timer1.h"
#include "PORTB_interrupt.h"
#include "recive.h"
#include "delay.h"
#include "system.h"
#include "e2prom.h"

unsigned char  KEY0_FLAG = 0;
unsigned char  KEY1_FLAG = 0;
unsigned char  KEY2_FLAG = 0;

uint16_t flag_time_key0_add = 0;
uint16_t flag_time_key1_add = 0;
uint16_t flag_time_key2_add = 0;

channel_flag_stu KEY0 = 0;
channel_flag_stu KEY1 = 0;
channel_flag_stu KEY2 = 0;

unsigned char key_long_flag = 0;

extern unsigned char sys_stute ;
unsigned char match_channel_flag = 0x10;  /**< Channel 0 pairing*/
unsigned char key_long_flag_add = 0;

extern uint8_t channel_status;
extern uint8_t channel_startup;

void sledBlink(void)
{
    LED_ON;                                      
    soft_delay_ms(100);
    LED_OFF;
}

void setChannelStatus(unsigned char  channel, unsigned char  status)
{
    if (channel == CHANNEL_0)
    {
        if (status == CHANNEL_OFF)
        {
            KEY0.channel_status = 0;
        }
        else if (status == CHANNEL_ON)
        {
            KEY0.channel_status = 1;
        }
        else if (status == CHANNEL_SW)
        {
            KEY0.channel_status ^= 1;
        }

        if (STARTUP_STAY == getChnStartupConfig(channel_startup, CHANNEL_0))
        {
            if (KEY0.channel_status == CHANNEL_OFF)
            {
                setChannelOff(channel_status, CHANNEL_0);
            }
            else
            {
                setChannelOn(channel_status, CHANNEL_0);
            }
            AT24C02_Write_Msg(ADDR_CHN_STATUS, &channel_status, CHN_STATUS_SIZE);
        }
    }
    else if (channel == CHANNEL_1)
    {
        if (status == CHANNEL_OFF)
        {
            KEY1.channel_status = 0;
        }
        else if (status == CHANNEL_ON)
        {
            KEY1.channel_status = 1;
        }
        else if (status == CHANNEL_SW)
        {
            KEY1.channel_status ^= 1;
        }

        if (STARTUP_STAY == getChnStartupConfig(channel_startup, CHANNEL_1))
        {
            if (KEY1.channel_status == CHANNEL_OFF)
            {
                setChannelOff(channel_status, CHANNEL_1);
            }
            else
            {
                setChannelOn(channel_status, CHANNEL_1);
            }
            AT24C02_Write_Msg(ADDR_CHN_STATUS, &channel_status, CHN_STATUS_SIZE);
        }
    }
    else if (channel == CHANNEL_2)
    {
        if (status == CHANNEL_OFF)
        {
            KEY2.channel_status = 0;
        }
        else if (status == CHANNEL_ON)
        {
            KEY2.channel_status = 1;
        }
        else if (status == CHANNEL_SW)
        {
            KEY2.channel_status ^= 1;
        }

        if (STARTUP_STAY == getChnStartupConfig(channel_startup, CHANNEL_2))
        {
            if (KEY2.channel_status == CHANNEL_OFF)
            {
                setChannelOff(channel_status, CHANNEL_2);
            }
            else
            {
                setChannelOn(channel_status, CHANNEL_2);
            }
            AT24C02_Write_Msg(ADDR_CHN_STATUS, &channel_status, CHN_STATUS_SIZE);
        }
    }
}


void key_scan(void)
{
	if(RB1 == 0)
		{
			soft_delay_ms(10);
			if(RB1 == 0)
			if((KEY0_FLAG&0x01) == 0)
			{
				flag_time_key0_add = 0;		/**<Long press to clear zero*/
				KEY0_FLAG|=0X01;
				if(key_long_flag_add == 0)
				{
					key_long_flag_add = 1;	/**<The button is long pressed*/
				}
			}
		}
	else 
		{
			if(KEY0_FLAG&0x01)
			{
				KEY0_FLAG |= 0X02;
				if(key_long_flag_add == 1)
				{
					key_long_flag_add = 0;	/**<The long press of the key has been released*/
				}
			}
		}

	if(RB2 == 0)
		{
			soft_delay_ms(10);
			if(RB2 == 0)
			if((KEY1_FLAG&0x01) == 0)
			{
				flag_time_key1_add = 0;
				KEY1_FLAG |= 0X01;
				if(key_long_flag_add == 0)
				{
					key_long_flag_add = 2;
				}			
			}
		
		}
	else 
		{
			if(KEY1_FLAG & 0x01)
			{
				KEY1_FLAG |= 0X02;
				if(key_long_flag_add == 2)
				{
					key_long_flag_add = 0;
				}
			}
		}



	

	if(RB3 == 0)
		{
			soft_delay_ms(10);
			if(RB3 == 0)
			if((KEY2_FLAG&0x01) == 0)
			{
				flag_time_key2_add = 0;
				KEY2_FLAG|=0X01;
				if(key_long_flag_add == 0)
				{
					key_long_flag_add = 4;
				}
			}
		}
	else
		{
			if(KEY2_FLAG & 0x01)
			{
				KEY2_FLAG |= 0X02;
				if(key_long_flag_add == 4)
				{
					key_long_flag_add = 0;
				}
			}
		}


	switch(key_long_flag_add)
		{
			case 0:
				{
					
				}break;
			case 1:
				{
					flag_time_key1_add = 0;	/**<Long press to clear zero*/
					flag_time_key2_add = 0;
				}break;
			case 2:
				{
					flag_time_key0_add = 0;
					flag_time_key2_add = 0;
				}break;
			case 4:
				{
					flag_time_key0_add = 0;
					flag_time_key1_add = 0;
				}break;
		}
}




void key_value_read(void)
{
	key_scan();
	if(KEY0_FLAG == 0x01)									/**<Is it in the pressed state*/
		{
			 	
				if(flag_time_key0_add >= 500)				/**<Determine if the long press time is greater than 5s*/
				{
					if(key_long_flag == 0x01)		/**<More than 3s*/
						{
							key_long_flag = 0x10; /**<sys_stute=CLEAN_MSG*/
							sledBlink();
							soft_delay_ms(100);
							sledBlink();
						}
				}
				else if(flag_time_key0_add >= 300)	/**<Determine if the long press time is greater than 3s*/
				{
					if(key_long_flag == 0)
						{
							key_long_flag = 0x01;	/**<sys_stute=MATCH_MSG*/
							sledBlink();
						}
				}
					

		}
	else if(KEY0_FLAG == 0x03)							/**<Key released*/
		{
			KEY0_FLAG = 0;
			
			if((flag_time_key0_add < 300))
			{
				setChannelStatus(CHANNEL_0, CHANNEL_SW);				/**<Less than 3s state flip*/
			}
			else  if(flag_time_key0_add < 500)		/**<Less than 5s enter MATCH_MSG*/
			{
				if(key_long_flag == 0x01)
				{
					KEY0.key_flag_3s = 1;
					key_long_flag = 0x11;
					sys_stute = MATCH_MSG;
					flag_time_key1_add = 0;
					flag_time_key2_add = 0;
				}
			}
			else
			{
				if(key_long_flag == 0x10)			/**<Greater than 5s enter CLEAN_MSG*/
				{
					KEY0.key_flag_5s = 1;
					key_long_flag = 0x11;
					sys_stute = CLEAN_MSG;
					flag_time_key1_add = 0;
					flag_time_key2_add = 0;
				}
			}
				
		}
	

	if(KEY1_FLAG == 0x01)
		{	
			if(flag_time_key1_add >= 500)
			{
				if(key_long_flag == 0x02)
				{
					key_long_flag = 0x20;
					sledBlink();
					soft_delay_ms(100);
					sledBlink();
				}
			}
			else if(flag_time_key1_add >= 300)
			{
				if(key_long_flag == 0)
				{
					key_long_flag = 0x02;
					sledBlink();
				}
			}
			
		}
	else if(KEY1_FLAG == 0x03)
		{
			KEY1_FLAG = 0;
			if((flag_time_key1_add < 300))
			{
				setChannelStatus(CHANNEL_1, CHANNEL_SW);
			}
			else if(flag_time_key1_add < 500)
			{
				if(key_long_flag == 0x02)
				{
					KEY1.key_flag_3s = 1;
					key_long_flag = 0x21;
					sys_stute = MATCH_MSG;
					flag_time_key2_add = 0;
						flag_time_key0_add = 0;
				}
			}
			else
			{
				if(key_long_flag == 0x20)
				{
					KEY1.key_flag_5s = 1;
					key_long_flag = 0x21;
					sys_stute = CLEAN_MSG;
					flag_time_key2_add = 0;
					flag_time_key0_add = 0;
				}
			}
		}


		if(KEY2_FLAG == 0x01)
		{
			if(flag_time_key2_add >= 500)
			{
				if(key_long_flag == 0x04)
				{
					key_long_flag = 0x40;
					sledBlink();
					soft_delay_ms(100);
					sledBlink();
				}
			}
			else if(flag_time_key2_add >= 300)
			{
				if(key_long_flag == 0)
				{
					key_long_flag = 0x04;
					sledBlink();
				}
			}
		}
		else if(KEY2_FLAG == 0x03)
		{
			KEY2_FLAG = 0;
			if((flag_time_key2_add < 300))
			{
				setChannelStatus(CHANNEL_2, CHANNEL_SW);
			}
			else if(flag_time_key2_add < 500)
			{
				if(key_long_flag == 0x04)
				{
					KEY2.key_flag_3s = 1;
					key_long_flag = 0x41;
					sys_stute = MATCH_MSG;
					flag_time_key1_add = 0;
					flag_time_key0_add = 0;
					
				}
			}
			else
			{
				if(key_long_flag == 0x40)
				{
					KEY2.key_flag_5s = 1;
					key_long_flag = 0x41;
					sys_stute = CLEAN_MSG;
					flag_time_key1_add = 0;
					flag_time_key0_add = 0;
				}
			}
		}

}



/************************************************
*������ʼ��
*PAN2416ͨ������PORTB��������
*************************************************/
void key_Init(void)
{
	OPTION_REG &= ~0x80;
	TRISB |= 0x0e;
	WPUB |= 0x0e;
}
