#include "recive.h"
#include "rf297L.h"
#include "e2prom.h"
#include "delay.h"
#include "key_scan.h"
#include "system.h"
#include "string.h"
const unsigned char crc_2_4G_lib[21]={0xc7 ,0x8d ,0xd2 ,0x57 ,0xa1 ,0x3d ,0xa7 ,0x66 ,0xb0 ,0x75 ,0x31 ,0x11 ,0x48 ,0x96 ,0x77 ,0xf8 ,0xe3 ,0x46 ,0xe9,0xab ,0xd0 };
const unsigned char crc_lab[16]={0x41,0x92,0x53,0x2A,0xFC,0xAB,0xCE,0x26,0x0D,0x1E,0x99,0x78,0x00,0x22,0x99,0xDE};
const unsigned char ble_crc_38[42]={
		0xD6, 0xC5, 0x44, 0x20, 0x59,
		0xDE, 0xE1, 0x8F, 0x1B, 0xA5,
		0xAF, 0x42, 0x7B, 0x4E, 0xCD,
		0x60, 0xEB, 0x62, 0x22, 0x90,
		0x2C, 0xEF, 0xF0, 0xC7, 0x8D,
		0xD2, 0x57, 0xA1, 0x3D, 0xA7,
		0x66, 0xB0, 0x75, 0x31, 0x11,
		0x48, 0x96, 0x77 ,0xF8, 0xE3,
		0x46, 0xE9
	};
const unsigned char AdvData_3[3]={0xAA ,0x55 ,0x11};/*使 MCU 端能顺利接收到数据，在APP遥控器端固定为 0x02、0x01；0x12为 Type 到 Crc 总长度*/
unsigned char AdvData_23[20]={0};

uint8_t rf_buf[18] = {0};

unsigned char sys_stute = RX_MSG;
uint16_t flag_5s_add=0;
//extern uint8_t control_id[12][6];
extern uint8_t channel_flag[3];
extern unsigned char key_long_flag;
extern channel_flag_stu KEY0;
extern channel_flag_stu KEY1;
extern channel_flag_stu KEY2;
uint8_t channel_delay[3]={0,0,0};
extern uint16_t flag_5min_add;

extern unsigned char  KEY0_FLAG;
extern unsigned char  KEY1_FLAG;
extern unsigned char  KEY2_FLAG;
static uint8_t delay_flag=0;

static signed long frame_count = -1;

unsigned short UpdateCRC(unsigned char *CRC_input, unsigned int len)
{
    unsigned char i,k = 0; 
    unsigned short CRC_acc=0x5555;
    #define POLY_  0x1021
    while (len--)
    {
        CRC_acc = CRC_acc ^ (CRC_input[k++] << 8);
        
        for (i = 0; i < 8; i++)
        {
            if ((CRC_acc & 0x8000) == 0x8000)
            {
                CRC_acc = CRC_acc << 1;
                CRC_acc ^= POLY_;
            }
            else
            {
                CRC_acc = CRC_acc << 1;
            }
        }
    }
    return CRC_acc;
}



uint8_t rx_data(void)
{
    uint8_t rx_flag=0;
    uint8_t rand=0;
    uint8_t i=0;
    uint16_t crc18=0; 
    uint16_t crc16=0; 
    uint8_t diff_frame = 0;

    if (RF_RxData(rf_buf,18))
    {

#if 1
        /**2.4G瑙ｅ瘑**/
        for(i = 0;i < 18; i++)
        {
            rf_buf[i]=rf_buf[i]^crc_2_4G_lib[3+i]^ble_crc_38[21+i];
        }

        crc16 = rf_buf[16] + rf_buf[17] * 256;
    
        /**table瑙ｅ瘑**/ 
        for (i = 0; i < 16; i++)
        {
            rf_buf[i]=rf_buf[i]^crc_lab[i];
        }
 
        /**rand瑙ｅ瘑**/    
        rand = rf_buf[0];
        
        for (i = 1; i < 16; i++)
        {
            rf_buf[i] ^= rand;
        }

        if (crc16 != UpdateCRC(rf_buf, 16))
        {
            rx_flag = 0;
            return rx_flag;
        }

        if (frame_count != rf_buf[0])
        {
            frame_count = rf_buf[0];

            rx_flag = 1;

            memcpy(AdvData_23, AdvData_3, 3);
            memcpy(AdvData_23 + 3, &rf_buf[1], 15);
            
            crc18 = UpdateCRC(AdvData_23 + 2, 16);
            AdvData_23[18] = crc18 & 0xff;
            AdvData_23[19] = ((crc18 >> 8) & 0xff); //CRC18
            
            for (i=0; i < 20; i++)
            {
                send(AdvData_23[i]);
            }
        }
        else
        {
            rx_flag = 0;
        }
#else

    for (i=0; i < 18; i++)
    {
        send(rf_buf[i]);
    }

#endif

        
    }
    return rx_flag;
}



extern unsigned char match_channel_flag;
void recive_task(void)
{
    if (rx_data())
    {
        //soft_delay_ms(100);
    	RF_ClearFIFO();
    	RF_ClearStatus();
    }
}


void channel_set(uint8_t channel_num, uint8_t status)
{
	switch(channel_num)
		{
			case 0 :
					{
						if(status)
							{
								TRISB6=0;
								RB6=1;
							}
						else 
							{
								TRISB6=0;
								RB6=0;
							}
					}break;
			case 1:
					{
						if(status)
							{
							TRISB5=0;
							RB5=1;
							}
						else 
							{
							TRISB5=0;
							RB5=0;
							}
					}break;
			case 2: 
					{
						if(status)
							{
							TRISB4=0;
							RB4=1;
							}
						else 
							{
							TRISB4=0;
							RB4=0;
							}
					}break;
		}
}

void delay_task(void)
{

	if(channel_delay[0]!=0)
		{
			if(delay_flag==0)delay_flag=1;
			if(channel_delay[2]>0)
				{
					if(flag_5min_add>=30000)/*30000*/
						{
						flag_5min_add=0;
						channel_delay[2]--;
						}
				}
			else
				{
					switch(channel_delay[0])
						{
						case 1:
								{
									if(channel_delay[1]!=2)
										KEY0.channel_status=channel_delay[1];
									else 
										KEY0.channel_status^=1;

									
									}break;
						case 2:
								{
									if(channel_delay[1]!=2)
										KEY1.channel_status=channel_delay[1];
									else 
										KEY1.channel_status^=1;

									
									}break;
						case 4:
								{
									if(channel_delay[1]!=2)
										KEY2.channel_status=channel_delay[1];
									else 
										KEY2.channel_status^=1;

									}break;
						case 3:
								{
									if(channel_delay[1]!=2)
										{
										KEY0.channel_status=channel_delay[1];
										KEY1.channel_status=channel_delay[1];
										}
									else 
										{
										KEY0.channel_status^=1;
										KEY1.channel_status^=1;
										}
									}break;
						case 5:
								{
									if(channel_delay[1]!=2)
										{
										KEY0.channel_status=channel_delay[1];
										KEY2.channel_status=channel_delay[1];
										}
									else 
										{
										KEY0.channel_status^=1;
										KEY2.channel_status^=1;
										}
									}break;
						case 6:
								{
									if(channel_delay[1]!=2)
										{
										KEY1.channel_status=channel_delay[1];
										KEY2.channel_status=channel_delay[1];
										}
									else 
										{
										KEY1.channel_status^=1;
										KEY2.channel_status^=1;
										}
									}break;
						case 7:
								{
									if(channel_delay[1]!=2)
										{
										KEY0.channel_status=channel_delay[1];
										KEY1.channel_status=channel_delay[1];
										KEY2.channel_status=channel_delay[1];
										}
									else 
										{
										KEY0.channel_status^=1;
										KEY1.channel_status^=1;
										KEY2.channel_status^=1;
										}
									}break;
						}


					channel_delay[0]=0;
					channel_delay[1]=0;
					channel_delay[2]=0;
					delay_flag=0;
				}
		}
}
