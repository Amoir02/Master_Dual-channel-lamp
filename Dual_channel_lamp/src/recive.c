#include "recive.h"
#include "cms.h"
#include "system.h"
#include "WDT.h"
#include "rf297L.h"
#include "timer1.h"
#include "24lc02.h"
#include "timer1.h"
#include "Key.h"
#include "Buffer.H"
#include "PWM.h"

struct BriCoTem BriCoTem_Value;


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
uchar addr_buf[16];
uchar rf_buf[18]= {0};
uchar Count_Save = 0;
uchar Pairing_Num;
extern uchar SysDingShiEn=0;
extern uchar LED_ON_Sat=1; 
extern uchar LED_Chg_Cnt=0; 
extern uchar LEDR1_Vol=0;
extern uchar LEDR2_Vol=0;
extern uchar SysRunTime_3S = 0;
extern unsigned int Time1s_cot;

extern void ledSetGradual(uint8_t set_brightness, uint8_t set_colour_tempr);
extern void PWM_LED1(uchar PWM);
extern void PWM_LED2(uchar PWM);
extern void LEDCon_Chg(void);



void recive_task(void);
unsigned short UpdateCRC(unsigned char *CRC_input, unsigned int len);
uchar rx_data(void);

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



uchar rx_data(void)
{
	uchar rx_flag=0;
	uchar rand=0;
	uchar i=0;
	uint crc16=0; 

	if(RF_RxData(rf_buf,18))
	{
		for(i=0;i<18;i++)
			{
				rf_buf[i]=rf_buf[i]^crc_2_4G_lib[3+i]^ble_crc_38[21+i];
			}
		crc16 = rf_buf[16]+rf_buf[17]*256;
		for(i=0;i<16;i++)
			{
				rf_buf[i]=rf_buf[i]^crc_lab[i];
			}
		rand = rf_buf[15];
		for(i=7;i<15;i++)
			{
				rf_buf[i]^=rand;
			}
		if(crc16 ==UpdateCRC(rf_buf,16) )
			{
				if((rf_buf[3]==0)&&(rf_buf[4]==0)&&(rf_buf[5]==0)&&(rf_buf[6]==0))
					{
						rx_flag=0;
					}
				else if((rf_buf[3]==0xff)&&(rf_buf[4]==0xff)&&(rf_buf[5]==0xff)&&(rf_buf[6]==0xff))
					{
						rx_flag=0;
					}
				else
					rx_flag=1;
			}
		
	}
	return rx_flag;
}

void Write_Remote_Addr(void)
{
	uint8_t i;
	uint8_t j = 3;
	for(i = 15; i > 3; i--)
	{
		addr_buf[i] = addr_buf[i - 4];
	}
	for(i = 0; i < 4; i++)
	{
		addr_buf[i] = rf_buf[j];
		j++;
	}
	AT24C02_Write_Msg(30, addr_buf, 16);
	//AT24C02_Read_Msg(30, addr_buf, 16);
}

uint8_t Data_Check(void)
{
	uint8_t i;
	uint8_t j;
	uint8_t p = 0;
	uint8_t k = 3;
	uint8_t temp = 0;
	for(i = 0; i < 4; i++)
	{
		temp = 0;
		for(j = 0;j < 4; j++)
		{
			if(rf_buf[k + j] == addr_buf[p])
			{
				temp++;
			}
			p++;
		}
		if(temp == 4)
		{
			return i;
		}
		if(i == 3)
		{
			return 0xFF;
		}
	}
	
}

void Delete_One_RemoteAddr(void)
{
	uint8_t i;
	uint8_t j;
	uint8_t p;
	i = Data_Check();
	i = 4 * i;
	p = 16 - i;
	for(j = 0; j < p; j++)
	{
		addr_buf[i] = addr_buf[i + 4];
		i++;
	}
	AT24C02_Write_Msg(30, addr_buf, 16);
	//AT24C02_Read_Msg(30, addr_buf, 16);
}



uint8_t brightnessConvert(uint8_t src)
{
    return ((src * 10 + 100) / 11);
}
/******************************************************************************/
//          色温亮度转换                      
/******************************************************************************/

uint16_t Convert_Duty_Cycle1(uint8_t Brightness,uint8_t Color_Temp)
{
	uint16_t temp = 0;
	temp = Brightness * Color_Temp;
	temp /= 100;
	temp *= 255;
	temp /= 100;
	if(temp >= 250) 
	{
		temp = 250;
	}
	if(temp <= 2) 
	{
		temp = 2;
	}
	return temp;
}

uint16_t Convert_Duty_Cycle2(uint8_t Brightness,uint8_t Color_Temp)
{
	uint16_t temp = 0;
	temp = Brightness * (100 - Color_Temp);
	temp /= 100;
	temp *= 255;
	temp /= 100;
	if(temp >= 250) 
	{
		temp = 250;
	}
	if(temp <= 2) 
	{
		temp = 2;
	}
	return temp;
}

void LED_Dimming(uint8_t Brightness,uint8_t Color_Temp)
{	
	LEDR1_Vol = Convert_Duty_Cycle1(Brightness,Color_Temp);
	LEDR2_Vol = Convert_Duty_Cycle2(Brightness,Color_Temp);
	
	//SetRunEn(0,1,cycle1);
	//SetRunEn(0,1,cycle2);
	BufSetRun(0,LEDR1_Vol,1,3);
	BufSetRun(1,LEDR2_Vol,1,3);
	//CCP1_set_duty_cycle(cycle1);
	//CCP2_set_duty_cycle(cycle2);
}

void Remote_Pairing(void)
{
	if(rf_buf[0] == 0x05)
	{
		Pairing_Num = Data_Check();
		if(Pairing_Num == 0xFF)
		{
			Write_Remote_Addr();
			Pair_LED();
		}
		Pairing_Num = 0xFF;
	}
	SysRunTime_3S = 1;		
}



void recive_task(void)
{
	uint8_t i = 0;
	uint8_t match_flag = 0;
	uint8_t flag = 0;
	uchar tmp_brightness = 0;
	
   	if(rx_data())					/**<Whether the data was received*/
    	{
    	Mark:   				
				if(SysRunTime_3S == 0)
				{
					Remote_Pairing();
				}
                if (rf_buf[COUNT_INDEX] != Count_Save)
                {             
					Count_Save = rf_buf[COUNT_INDEX];
					Pairing_Num = Data_Check();
					if(Pairing_Num == 0xFF)
					{
						 return;
					}   
					Time1s_cot = 1000;	   
					if (rf_buf[CMD_INDEX] == CMD_DIM)
                    {
                        
                        if (rf_buf[ADJUST_TYPE_INDEX] == ADJUST_BR_VALUE)                /**<调节亮度*/
                        {      
							BriCoTem_Value.Brightness = rf_buf[BRIGHTNESS_INDEX];                     
                            //tmp_brightness = brightnessConvert(rf_buf[BRIGHTNESS_INDEX]);
							LED_Dimming(rf_buf[BRIGHTNESS_INDEX],BriCoTem_Value.ColorTemp);
                            //ledSetGradual(tmp_brightness, COLOUR_TEMPR_KEEP);
                        }
                        else if (rf_buf[ADJUST_TYPE_INDEX] == ADJUST_TEMPR_VALUE)        /**<调节色温*/
                        {
							BriCoTem_Value.ColorTemp = rf_buf[COLOUR_TEMP_INDEX]; 
							LED_Dimming(BriCoTem_Value.Brightness,rf_buf[COLOUR_TEMP_INDEX]); 
                            //ledSetGradual(BRIGHTNESS_KEEP, rf_buf[COLOUR_TEMP_INDEX]);
                        }
                        else if (rf_buf[ADJUST_TYPE_INDEX] == ADJUST_TEMPR_BR_VALUE)     /**<调节亮度和色温*/
                        {
							BriCoTem_Value.Brightness = rf_buf[BRIGHTNESS_INDEX];
							BriCoTem_Value.ColorTemp = rf_buf[COLOUR_TEMP_INDEX];
							LED_Dimming(BriCoTem_Value.Brightness,BriCoTem_Value.ColorTemp);
							
                            //tmp_brightness = brightnessConvert(rf_buf[BRIGHTNESS_INDEX]);
                            //ledSetGradual(tmp_brightness, rf_buf[COLOUR_TEMP_INDEX]);
                        }               
					} 
					else if (rf_buf[CMD_INDEX] == CMD_SWITCH) 
					{
						if(rf_buf[ACTION_INDEX] == ACTION_OFF)
						{						
							LED_ALLOFF();
							SysDingShiEn=0;
						}
						else if(rf_buf[ACTION_INDEX] == ACTION_ON)
						{
						
							if(LED_ON_Sat==0)  
							{
								LED_ON_Sat=1;

								PWM_LED1(LEDR1_Vol); 
								PWM_LED2(LEDR2_Vol); 
								SetRunEn(0,1,LEDR1_Vol);
								SetRunEn(1,1,LEDR2_Vol);
							}
							else 
							{
								LEDCon_Chg();
								if(++LED_Chg_Cnt>=6) LED_Chg_Cnt=0;
							}
							SysDingShiEn=0;
						}
					
					} 
					else if(rf_buf[8] == CMD_CLR_ADDR)	
					{
						Delete_One_RemoteAddr();
					}               
                }
    			RF_ClearFIFO();
    			RF_ClearStatus();
    	}
}