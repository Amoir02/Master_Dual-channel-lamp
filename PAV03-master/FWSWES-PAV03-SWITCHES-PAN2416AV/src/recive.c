#include "recive.h"
#include "rf297L.h"
#include "e2prom.h"
#include "delay.h"
#include "key_scan.h"
#include "system.h"

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



uint8_t rf_buf[18];
unsigned char sys_stute = RX_MSG;
uint16_t flag_5s_add=0;
extern uint8_t control_id[12][6];
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
	uint16_t crc16=0; 

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


extern unsigned char match_channel_flag;
void recive_task(void)
{
	uint8_t i;
	uint8_t match_flag=0;
	uint8_t flag_led=0;
	unsigned char msg[6];
	
	switch(sys_stute)
		{
		case CLEAN_MSG:
				{
					LED_OFF;
					if(key_long_flag==0x11)
						{
							key_long_flag=0;
							KEY0.key_flag_5s=0;
							for(i=0;i<24;i++)
								{
									AT24C02_Write_Byte(i,0xff);
									soft_delay_ms(1);
								}
						}
					else if(key_long_flag==0x21)
						{
							key_long_flag=0;
							KEY1.key_flag_5s=0;
							for(i=0;i<24;i++)
								{
									AT24C02_Write_Byte(i+24,0xff);
									soft_delay_ms(1);
								}
						}
					else if(key_long_flag==0x41)
						{
							key_long_flag=0;
							KEY2.key_flag_5s=0;
							for(i=0;i<24;i++)
								{
									AT24C02_Write_Byte(i+48,0xff);
									soft_delay_ms(1);
								}
						}
					for(i=0;i<12;i++)
							{
								AT24C02_Read_Msg(i*6,control_id[i],6);
							}
					LED_ON;
					soft_delay_ms(100);
					LED_OFF;
					soft_delay_ms(100);
					LED_ON;
					soft_delay_ms(100);
					LED_OFF;
					sys_stute=RX_MSG;
				}break;
		
		case MATCH_MSG:
				{
					match_channel_flag|=0x01;
					if(key_long_flag==0x11)
						{
							KEY0.key_flag_3s=0;
							flag_5s_add=0;
							key_long_flag=0;
							match_channel_flag=0x10;
						}
					else if(key_long_flag==0x21)
						{
							KEY1.key_flag_3s=0;
							
							flag_5s_add=0;
							key_long_flag=0;
							match_channel_flag=0x20;
						}
					else if(key_long_flag==0x41)
						{
							KEY2.key_flag_3s=0;
							flag_5s_add=0;
							key_long_flag=0;
							match_channel_flag=0x40;
						}


		/*
		 0       1          2        3     4     5     6     7          8      9        10      11      12     13     14    15
		 type   version  count  ID1  ID2  ID3  ID4  GROUP cmd   para0  para1 para2
		
		*/
		
					if(rx_data())
						{
							msg[0]=rf_buf[3];
							msg[1]=rf_buf[4];
							msg[2]=rf_buf[5];
							msg[3]=rf_buf[6];
							msg[4]=rf_buf[10];
							msg[5]=rf_buf[2];
							if(msg[4]!=0xff)
								{
								if(match_channel_flag&0x10)
									{
										for(i=0;i<4;i++)
											{
												if((msg[0]==control_id[i][0])
												&&(msg[1]==control_id[i][1])
												&&(msg[2]==control_id[i][2])
												&&(msg[3]==control_id[i][3])
												&&(msg[4]==control_id[i][4])
													)
													{
														match_flag=1;
														break;
													}
												else
													{
														match_flag=0;
													}
											}
										if(match_flag==0)
											{
												AT24C02_Write_Msg(0+channel_flag[0]*6,msg,6);
												for(i=0;i<6;i++)
													{
														control_id[channel_flag[0]][i]=msg[i];
													}
												channel_flag[0]++;
												if(channel_flag[0]>=4)channel_flag[0]=0;
											}
										key_long_flag=0;
									}
								else if(match_channel_flag&0x20)
									{
											for(i=0;i<4;i++)
											{
												if((msg[0]==control_id[i+4][0])
												&&(msg[1]==control_id[i+4][1])
												&&(msg[2]==control_id[i+4][2])
												&&(msg[3]==control_id[i+4][3])
												&&(msg[4]==control_id[i+4][4])
													)
													{
													match_flag=1;
													break;
													}
												else
													{
													match_flag=0;
													}
											}
											if(match_flag==0)
												{
													AT24C02_Write_Msg(24+channel_flag[1]*6,msg,6);
													for(i=0;i<6;i++)
														{
															control_id[channel_flag[1]+4][i]=msg[i];
														}
													channel_flag[1]++;
													if(channel_flag[1]>=4)channel_flag[1]=0;
												}
										key_long_flag=0;
									}
								else if(match_channel_flag&0x40)
									{

											for(i=0;i<4;i++)
											{
												if((msg[0]==control_id[i+8][0])
												&&(msg[1]==control_id[i+8][1])
												&&(msg[2]==control_id[i+8][2])
												&&(msg[3]==control_id[i+8][3])
												&&(msg[4]==control_id[i+8][4])
													)
													{
													match_flag=1;
													break;
													}
												else
													{
													match_flag=0;
													}
											}
											if(match_flag==0)
												{
													AT24C02_Write_Msg(48+channel_flag[2]*6,msg,6);
													for(i=0;i<6;i++)
														{
															control_id[channel_flag[2]+8][i]=msg[i];
														}
													channel_flag[2]++;
													if(channel_flag[2]>=4)channel_flag[2]=0;
												}
										key_long_flag=0;
									}

								AT24C02_Write_Msg(100,channel_flag,3);
								AT24C02_Write_Msg(100,channel_flag,3);
								
								for(i=0;i<12;i++)
								{
									AT24C02_Read_Msg(i*6,control_id[i],6);
								}
								AT24C02_Read_Msg(100,channel_flag,3);
								
								sys_stute=RX_MSG;
								
								LED_ON;
								soft_delay_ms(100);
								LED_OFF;
								match_channel_flag=0;
								}
						}
					else
						{
							if(flag_5s_add>500)
								{
									sys_stute=RX_MSG;
									match_channel_flag=0;
								}
						}
				}break;
		case RX_MSG:
				{
					if(rx_data())
						{
							if(rf_buf[10]!=0xff)
								{
									for(i=0;i<12;i++)
									{
										if((rf_buf[3]==control_id[i][0])
										&&(rf_buf[4]==control_id[i][1])
										&&(rf_buf[5]==control_id[i][2])
										&&(rf_buf[6]==control_id[i][3]))
											{
												if(rf_buf[2]!=control_id[i][5])
													{
														control_id[i][5]=rf_buf[2];   //更新累加数												
														if(rf_buf[10]==control_id[i][4])
															{
																if(flag_led==0)
																{
																	flag_led=1;
																	LED_ON;
																	soft_delay_ms(100);
																	LED_OFF;
																}
																
																if(rf_buf[11]==0)
																	{
																		if(i<4)
																			{
																				if((KEY0_FLAG==0))
																					{
																						if(rf_buf[9]==2)
																							KEY0.channel_status^=1;
																						else
																							KEY0.channel_status=rf_buf[9];																					}
																			}
																		else if(i<8)
																			{
																				if((KEY1_FLAG==0))
																					{
																					if(rf_buf[9]==2)
																						KEY1.channel_status^=1;
																					else
																						KEY1.channel_status=rf_buf[9];

																					}
																			}
																		else
																			{
																				if((KEY2_FLAG==0))
																					{
																					if(rf_buf[9]==2)
																						KEY2.channel_status^=1;
																					else
																						KEY2.channel_status=rf_buf[9];
																					

																					}
																			}
																	}
																else   //延时操作
																	{
																		flag_5min_add=0;
																		if(delay_flag==1)
																			{
																				channel_delay[0]=0;
																				delay_flag=0;
																			}
																		if(i<4)
																			{
																			channel_delay[0]|=0x01;
																			}
																		else if(i<8)
																			{
																			channel_delay[0]|=0x02;
																			}
																		else
																			{
																			channel_delay[0]|=0x04;
																			}
																			channel_delay[1]=rf_buf[9];
																			channel_delay[2]=rf_buf[11];
																	}
															}
													}
											}
										
									}
								}
							else
								{
									
										{
											for(i=0;i<12;i++)
												{
													if((rf_buf[3]==control_id[i][0])
													&&(rf_buf[4]==control_id[i][1])
													&&(rf_buf[5]==control_id[i][2])
													&&(rf_buf[6]==control_id[i][3]))
														{
															if((rf_buf[2]!=control_id[i][5]))
															{
																control_id[i][5]=rf_buf[2];
																if(flag_led==0)
																	{
																		flag_led=1;
																		LED_ON;
																		soft_delay_ms(100);
																		LED_OFF;
																	}
																if((rf_buf[11]==0))
																	{
																
																		if(i<4)
																		{
																			if((KEY0_FLAG==0))
																				{
																					if(rf_buf[9]==2)
																						KEY0.channel_status^=1;
																					else
																						KEY0.channel_status=rf_buf[9];
																				}
																		}
																		else if(i<8)
																		{
																			if((KEY1_FLAG==0))
																				{
																				if(rf_buf[9]==2)
																					KEY1.channel_status^=1;
																				else
																					KEY1.channel_status=rf_buf[9];
																				}
																		}
																		else
																		{
																			if((KEY2_FLAG==0))
																				{
																				if(rf_buf[9]==2)
																					KEY2.channel_status^=1;
																				else
																					KEY2.channel_status=rf_buf[9];
																				}
																		}	
																	}
																else
																	{
																		flag_5min_add=0;
																		if(delay_flag==1)
																			{
																				channel_delay[0]=0;
																				delay_flag=0;
																			}
																		if(i<4)
																			{
																			channel_delay[0]|=0x01;
																			}
																		else if(i<8)
																			{
																			channel_delay[0]|=0x02;
																			}
																		else
																			{
																			channel_delay[0]|=0x04;
																			}
																			channel_delay[1]=rf_buf[9];
																			channel_delay[2]=rf_buf[11];
																	}
																
															}
														}
												}
										}
									
									
								}
							//防止同一帧数据重复响应
							soft_delay_ms(100);
							RF_ClearFIFO();
							RF_ClearStatus();

						}
				}break;
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
					if(flag_5min_add>=30000)// 30000
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
