#include "cms.h"
#include "key_scan.h"
#include "timer1.h"
#include "PORTB_interrupt.h"
#include "recive.h"
#include "delay.h"
#include "system.h"

unsigned char  KEY0_FLAG=0;
unsigned char  KEY1_FLAG=0;
unsigned char  KEY2_FLAG=0;

uint16_t flag_time_key0_add=0;
uint16_t flag_time_key1_add=0;
uint16_t flag_time_key2_add=0;

channel_flag_stu KEY0 = 0;
channel_flag_stu KEY1 = 0;
channel_flag_stu KEY2 = 0;

unsigned char key_long_flag=0;

extern unsigned char sys_stute ;
unsigned char match_channel_flag=0;
unsigned char key_long_flag_add=0;

void key_scan(void)/*KEY0,KEY1,KEY2按键按下初始化*/
{
	if(RB1==0)/*如果按键KEY0按下*/
		{
			soft_delay_ms(10);
			if(RB1==0)
			if((KEY0_FLAG&0x01)==0)
				{
					flag_time_key0_add=0;
					KEY0_FLAG|=0X01;
					if(key_long_flag_add==0)
						key_long_flag_add=1;
				}
		}
	else 
		{
			if(KEY0_FLAG&0x01)
				{
					KEY0_FLAG|=0X02;
					if(key_long_flag_add==1)key_long_flag_add=0;
				}
		}

	if(RB2==0)/*如果按键KEY1按下*/
		{
			soft_delay_ms(10);
			if(RB2==0)
			if((KEY1_FLAG&0x01)==0)
				{
					flag_time_key1_add=0;
					KEY1_FLAG|=0X01;
					if(key_long_flag_add==0)
						key_long_flag_add=2;
				}
		
		}
	else 
		{
			if(KEY1_FLAG&0x01)
				{
					KEY1_FLAG|=0X02;
					if(key_long_flag_add==2)key_long_flag_add=0;
				}
		}



	

	if(RB3==0)/*如果按键KEY2按下*/
		{
			soft_delay_ms(10);
			if(RB3==0)
			if((KEY2_FLAG&0x01)==0)
				{
					flag_time_key2_add=0;
					KEY2_FLAG|=0X01;
					if(key_long_flag_add==0)
						key_long_flag_add=4;
				}
		}
	else
		{
			if(KEY2_FLAG&0x01)
				{
					KEY2_FLAG|=0X02;
					if(key_long_flag_add==4)key_long_flag_add=0;
				}
		}


	switch(key_long_flag_add)
		{
			case 0:
				{
					
				}break;
			case 1:
				{
					flag_time_key1_add=0;
					flag_time_key2_add=0;
				}break;
			case 2:
				{
					flag_time_key0_add=0;
					flag_time_key2_add=0;
				}break;
			case 4:
				{
					flag_time_key0_add=0;
					flag_time_key1_add=0;
				}break;
		}
}




void key_value_read(void)/*按键配对和清码*/
{
	key_scan();/*KEY0,KEY1,KEY2按键按下初始化*/
	if(KEY0_FLAG==0x01)
		{
			 	
				if(flag_time_key0_add>=500)
						{
							if(key_long_flag==0x01)
								{
									key_long_flag=0x10;
									LED_ON;
									soft_delay_ms(100);
									LED_OFF;
									soft_delay_ms(100);
									LED_ON;
									soft_delay_ms(100);
									LED_OFF;
								}
						}
					else if(flag_time_key0_add>=300)
						{
							if(key_long_flag==0)
								{
									key_long_flag=0x01;
									LED_ON;
									soft_delay_ms(100);
									LED_OFF;
								}
						}
					

		}
	else if(KEY0_FLAG==0x03)
		{
			KEY0_FLAG=0;
			
			if((flag_time_key0_add<300))
				{
					KEY0.channel_status^=1;
				}

				else  if(flag_time_key0_add<500)
					{
						if(key_long_flag==0x01)
							{
								KEY0.key_flag_3s=1;
								key_long_flag=0x11;
								sys_stute=MATCH_MSG;
								flag_time_key1_add=0;
									flag_time_key2_add=0;
							}
					}
				else
					{
						if(key_long_flag==0x10)
							{
								KEY0.key_flag_5s=1;
								key_long_flag=0x11;
								sys_stute=CLEAN_MSG;
								flag_time_key1_add=0;
									flag_time_key2_add=0;
							}
					}
				
		}
	

	if(KEY1_FLAG==0x01)
		{
				
				if(flag_time_key1_add>=500)
					{
						if(key_long_flag==0x02)
							{
								key_long_flag=0x20;
								LED_ON;
								soft_delay_ms(100);
								LED_OFF;
								soft_delay_ms(100);
								LED_ON;
								soft_delay_ms(100);
								LED_OFF;
							}
					}
				else if(flag_time_key1_add>=300)
					{
						if(key_long_flag==0)
							{
								key_long_flag=0x02;
								LED_ON;
								soft_delay_ms(100);
								LED_OFF;
							}
					}
			
		}
	else if(KEY1_FLAG==0x03)
		{
			KEY1_FLAG=0;
			if((flag_time_key1_add<300))
				{
					KEY1.channel_status^=1;
				}
			
				else if(flag_time_key1_add<500)
					{
						if(key_long_flag==0x02)
							{
								KEY1.key_flag_3s=1;
								key_long_flag=0x21;
								sys_stute=MATCH_MSG;
								flag_time_key2_add=0;
									flag_time_key0_add=0;
							}
					}
				else
					{
						if(key_long_flag==0x20)
							{
								KEY1.key_flag_5s=1;
								key_long_flag=0x21;
								sys_stute=CLEAN_MSG;
								flag_time_key2_add=0;
									flag_time_key0_add=0;
							}
					}
				
			
		}


		if(KEY2_FLAG==0x01)
				{

					
							if(flag_time_key2_add>=500)
								{
									if(key_long_flag==0x04)
									{
										key_long_flag=0x40;
										LED_ON;
										soft_delay_ms(100);
										LED_OFF;
										soft_delay_ms(100);
										LED_ON;
										soft_delay_ms(100);
										LED_OFF;
										
									}
								}
							else if(flag_time_key2_add>=300)
								{
									if(key_long_flag==0)
									{
										key_long_flag=0x04;
										LED_ON;
										soft_delay_ms(100);
										LED_OFF;
									}
								}
						
				}
			else if(KEY2_FLAG==0x03)
				{
					KEY2_FLAG=0;
					if((flag_time_key2_add<300))
						{
							KEY2.channel_status^=1;
						}

						
						else if(flag_time_key2_add<500)
							{
								if(key_long_flag==0x04)
								{
									KEY2.key_flag_3s=1;
									key_long_flag=0x41;
									sys_stute=MATCH_MSG;
									flag_time_key1_add=0;
									flag_time_key0_add=0;
									
								}
							}
						else
							{
								if(key_long_flag==0x40)
								{
									KEY2.key_flag_5s=1;
									key_long_flag=0x41;
									sys_stute=CLEAN_MSG;
									flag_time_key1_add=0;
									flag_time_key0_add=0;
								}
							}
						
				}

}



/************************************************
*按键初始化
*PAN2416通常采用PORTB口做按键
*************************************************/
void key_Init(void)
{
	OPTION_REG &= ~0x80;
	TRISB|=0x0e;
	WPUB|=0x0e;
}
