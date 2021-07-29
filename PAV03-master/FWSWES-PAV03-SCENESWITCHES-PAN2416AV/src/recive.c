#include "recive.h"
#include "rf297L.h"
#include "e2prom.h"
#include "delay.h"
#include "key_scan.h"
#include "system.h"

#define CMD_SWITCH (0x10)
#define CMD_SWITCH_COMPAT (0x11)
#define CMD_SCENE_EXE (0x20)
#define CMD_SCENE_SET (0x21)
#define CMD_STARTUP_CONFIG (0x30)

#define SCENE_NUM (6)
#define SCENE_ACTION_OFF (0)
#define SCENE_ACTION_ON  (1)

#define FACTORY_ADDR0_VALUE      0x11
#define FACTORY_ADDR1_VALUE      0x56
#define FACTORY_ADDR2_VALUE      0x32
#define FACTORY_ADDR3_VALUE      0xF9

const unsigned char crc_2_4G_lib[21] = {0xc7 ,0x8d ,0xd2 ,0x57 ,0xa1 ,0x3d ,0xa7 ,0x66 ,0xb0 ,0x75 ,0x31 ,0x11 ,0x48 ,0x96 ,0x77 ,0xf8 ,0xe3 ,0x46 ,0xe9,0xab ,0xd0 };
const unsigned char crc_lab[16] = {0x41,0x92,0x53,0x2A,0xFC,0xAB,0xCE,0x26,0x0D,0x1E,0x99,0x78,0x00,0x22,0x99,0xDE};
const unsigned char ble_crc_38[42] = {
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
unsigned char sys_stute = RX_MSG;  /**<Default power on pairing*/
uint16_t flag_5s_add = 0;
extern uint8_t power_on_flag;

extern uint8_t control_id[12][6];
extern uint8_t channel_flag;
extern unsigned char key_long_flag;
extern channel_flag_stu KEY0;
extern channel_flag_stu KEY1;
extern channel_flag_stu KEY2;
uint8_t channel_delay[3] = {0,0,0};
extern uint16_t flag_5min_add;

extern unsigned char  KEY0_FLAG;
extern unsigned char  KEY1_FLAG;
extern unsigned char  KEY2_FLAG;
static uint8_t delay_flag = 0;

extern uint8_t channel_status;
extern uint8_t channel_startup;
uint8_t  is_factory_flag = 1;
extern uint8_t power_on_delay_flag;


unsigned short UpdateCRC(unsigned char *CRC_input, unsigned int len)
{
    unsigned char i,k = 0; 
    unsigned short CRC_acc = 0x5555;
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
	uint8_t rx_flag = 0;
	uint8_t rand = 0;
	uint8_t i = 0;
	uint16_t crc16 = 0; 

	if(RF_RxData(rf_buf,18))
	{
		for(i = 0; i < 18; i++)
			{
				rf_buf[i] = rf_buf[i] ^ crc_2_4G_lib[3+i] ^ ble_crc_38[21+i];
			}
		crc16 = rf_buf[16] + rf_buf[17] * 256;
		for(i = 0; i < 16; i++)
			{
				rf_buf[i] = rf_buf[i] ^ crc_lab[i];
			}
		rand = rf_buf[15];
		for(i = 7; i < 15; i++)
			{
				rf_buf[i] ^= rand;
			}
		if(crc16 == UpdateCRC(rf_buf,16) )
			{
				if((rf_buf[3] == 0) && (rf_buf[4] == 0) && (rf_buf[5] == 0) && (rf_buf[6] == 0))
					{
						rx_flag=0;
					}
				else if((rf_buf[3] == 0xff) && (rf_buf[4] == 0xff) && (rf_buf[5] == 0xff) && (rf_buf[6] == 0xff))
					{
						rx_flag = 0;
					}
				else
					rx_flag = 1;
			}
		
	}
	return rx_flag;
}

static uint8_t debug = 0;
extern unsigned char match_channel_flag;
void recive_task(void)
{
	uint8_t i = 0;
	//uint8_t cmd = 0;
	uint8_t match_flag = 0;
	uint8_t flag = 0;
	unsigned char msg[6];
	
	switch(sys_stute)
    {
    	case CLEAN_MSG:    /**<Clear pairs*/
    	{
    		LED_OFF;
    		if(key_long_flag == 0x11)
    		{
    			key_long_flag = 0;
    			KEY0.key_flag_5s = 0;					/**<Reset long press marker*/
    			for(i = 0; i < 18; i++)					/**<Each channel can bind 3 groups, each group can store 6 data, 3*6=18*/
				{
					AT24C02_Write_Byte(i + 0, 0xff);	/**<The channel 0 storage area writes 0xFF to override the original data*/
					soft_delay_ms(1);
				}
    		}
    		else if(key_long_flag == 0x21)
    		{
    			key_long_flag = 0;
    			KEY1.key_flag_5s = 0;						/**<Reset long press marker*/
    			for(i = 18; i < 36; i++)						/**<Each channel can bind 3 groups, each group can store 6 data, 3*6=18*/
    			{
    				AT24C02_Write_Byte(i, 0xff);	/**<The channel 1 storage area writes 0xFF to override the original data*/
    				soft_delay_ms(1);
    			}
    		}
    		else if(key_long_flag == 0x41)
    		{
    			key_long_flag = 0;
    			KEY2.key_flag_5s = 0;						/**<Reset long press marker*/
    			for(i = 36; i < 54; i++)						/**<Each channel can bind 3 groups, each group can store 6 data, 3*6=18*/
    			{
    				AT24C02_Write_Byte(i, 0xff);	/**<The channel 2 storage area writes 0xFF to override the original data*/
    				soft_delay_ms(1);
    			}
    		}

            for(i = 54; i < 72; i++)					/**<Each channel can bind 3 groups, each group can store 6 data, 3*6=18*/
			{
				AT24C02_Write_Byte(i, 0x00);	/**<The channel_scene storage area writes 0x00 to override the original data*/
				soft_delay_ms(1);
			}
    		
    		for(i = 0; i < 12; i++)
    		{
    			AT24C02_Read_Msg(i * 6, control_id[i], 6);	/**<Reads paired data stored at EEPROM*/
    		}
    		sledBlink();
    		soft_delay_ms(100);
    		sledBlink();
    		sys_stute=RX_MSG;
    	}break;
    	
    	case MATCH_MSG:
    	{
    		match_channel_flag |= 0x01;
    		if(key_long_flag == 0x11)
    		{
    			KEY0.key_flag_3s = 0;			/**<Reset long press marker*/
    			flag_5s_add = 0;
    			key_long_flag = 0;
    			match_channel_flag = 0x10;		/**<Channel 0 paired flag*/
    		}
    		else if(key_long_flag == 0x21)
    		{
    			KEY1.key_flag_3s = 0;			/**<Reset long press marker*/
    			flag_5s_add = 0;
    			key_long_flag = 0;
    			match_channel_flag = 0x20;		/**<Channel 1 paired flag*/
    		}
    		else if(key_long_flag == 0x41)
    		{
    			KEY2.key_flag_3s = 0;			/**<Reset long press marker*/
    			flag_5s_add = 0;
    			key_long_flag = 0;
    			match_channel_flag = 0x40;		/**<Channel 2 paired flag*/
    		}


    /*
    0       1          2        3     4     5     6     7          8      9        10      11      12     13     14    15
    type  version    count     ID1   ID2   ID3   ID4   GROUP      cmd    para0    para1   para2

    */

    		if(rx_data())			    /**<Whether the data was received*/
    		{
    			msg[0] = rf_buf[3];	/**<ID1*/
    			msg[1] = rf_buf[4];	/**<ID2*/
    			msg[2] = rf_buf[5];	/**<ID3*/
    			msg[3] = rf_buf[6];	/**<ID4*/
    			msg[4] = rf_buf[10];/**<para1,the channel number*/
    			msg[5] = rf_buf[2];	/**<count*/
    			//cmd    = rf_buf[8];	/**<cmd*/

    			if (rf_buf[8] == CMD_SCENE_EXE)
    			{
					for(i = 0; i < 3; i++)
					{
						if((msg[0] == control_id[i + 9][0]) /**<Determine if there has been a match*/
						 &&(msg[1] == control_id[i + 9][1])
						 &&(msg[2] == control_id[i + 9][2])
						 &&(msg[3] == control_id[i + 9][3])
						)
						{
							match_flag = 1;				/**<Have paired*/
							break;
						}
						else
						{
							match_flag = 0;				/**<Unpaired too*/
						}
					}
					
					if(match_flag == 0)
					{
					    flag = (channel_flag >> 6) & 0x03;
					    if(flag >= 3)
						{
							flag = 0;							 
						}
						AT24C02_Write_Msg(9 * 6 + flag * 6, msg, 4);         /**<Writes paired data to the EEPROM, starting at address 48*/ 
						AT24C02_Write_Msg(9 * 6 + flag * 6 + 5, msg + 5, 1); /**<Writes Count*/ 
						for(i = 0; i < 4; i++)
						{
							control_id[flag + 9][i] = msg[i];	/**<The pairing information is assigned to the Control_ID*/
						}

						control_id[flag + 9][5] = msg[5];
						flag ++;									/**<Channel 2 plus 1 for each pair*/
						if(flag >= 3)
						{
							flag = 0;							/**<Determines if the number of channel 2 bindings exceeds 4 groups*/ 
						}
						channel_flag &= (~(0x03 << 6));
						channel_flag |= (flag << 6);
					}
					else
					{
					    flag = i;
						AT24C02_Write_Msg(9 * 6 + flag * 6 + 5, msg + 5, 1); /**<Writes Count*/ 
						control_id[flag + 9][5] = msg[5];
					}

#if 1
                    //配对完成后，执行相应的动作
                    for(i = 9; i < 12; i++)
                    {
                        if ((control_id[i][4] & (0x01 << rf_buf[9])) != 0)
                        {
                            setChannelStatus(i - 9, CHANNEL_ON);
                        }
                        else
                        {
                            setChannelStatus(i - 9, CHANNEL_OFF);
                        }
                    }
               
#endif
					
					key_long_flag = 0;
    				
        			AT24C02_Write_Msg(ADDR_CHN_FLAG, &channel_flag,1);	   		/**<Writes the number of bindings per channel to the EEPROM*/
        			AT24C02_Write_Msg(ADDR_CHN_FLAG, &channel_flag,1);
        			
        			for(i = 0; i < 12; i++)
        			{
        				AT24C02_Read_Msg(i * 6, control_id[i], 6);  /**<Reads paired data stored at EEPROM*/
        			}
        			AT24C02_Read_Msg(ADDR_CHN_FLAG, &channel_flag, 1);	   		/**<Reads the number of bindings per channel*/

                    if (is_factory_flag)
                    {
                        AT24C02_Write_Byte(ADDR_NOT_FACTORY_FLAG, NOT_FACTORY_FLAG0);
    	                soft_delay_ms(5);
    	                AT24C02_Write_Byte(ADDR_NOT_FACTORY_FLAG + 1, NOT_FACTORY_FLAG1);
    	                soft_delay_ms(5);
    	                is_factory_flag = 0;
                    }

        			sys_stute = RX_MSG;						   
        			
        			sledBlink();
        			match_channel_flag = 0;
    			}
    			else if ((rf_buf[8] == CMD_SWITCH || rf_buf[8] == CMD_SWITCH_COMPAT)
    			        && msg[4] != 0xff)	/**<Determine if it is a full channel*/
    			{
    			    if(match_channel_flag & 0x10)						/**<Channel 0 enters the pairing*/
    				{
    					for(i = 0; i < 3; i++)
    					{
    						if((msg[0] == control_id[i][0])		/**<Determine if there has been a match*/
    						&&(msg[1] == control_id[i][1])
    						&&(msg[2] == control_id[i][2])
    						&&(msg[3] == control_id[i][3])
    						&&(msg[4] == control_id[i][4])
    						)
    						{
    							match_flag = 1;			/**<Have paired*/
    							break;
    						}
    						else
    						{
    							match_flag = 0;			/**<Unpaired too*/
    						}
    					}
    					
    					if(match_flag == 0)
    					{   
    					    flag = (channel_flag >> 0) & 0x03;
    					    
    					    if(flag >= 3)
    						{
    							flag = 0;
    						}
    						
    						AT24C02_Write_Msg(0 + flag * 6, msg, 6);	/**<Writes paired data to the EEPROM, starting at address 0*/
    						for(i = 0; i < 6; i++)
    						{
    							control_id[flag][i] = msg[i];	/**<The pairing information is assigned to the Control_ID*/
    						}
    						
    						flag ++;									/**<Channel 0 plus 1 for each pair*/
    						if(flag >= 3)
    						{
    							flag = 0;		/**<Determines if the number of channel 0 bindings exceeds 4 groups*/ 
    						}
    						
    						channel_flag &= (~(0x03 << 0));
    						channel_flag |= (flag << 0);
    					}
    					else
    					{   
    					    flag = i;
    						AT24C02_Write_Msg(0 + flag * 6 + 5, &msg[5], 1);	/**<Writes paired data to the EEPROM, starting at address 0*/
    					}

                        setChannelStatus(CHANNEL_0, rf_buf[9]);
    					
    					key_long_flag = 0;
    				}
    			    else if(match_channel_flag & 0x20)				/**<Channel 1 enters the pairing*/
    				{
    					for(i = 0; i < 3; i++)
    					{
    						if((msg[0] == control_id[i+3][0])	/**<Determine if there has been a match*/
    						&&(msg[1] == control_id[i+3][1])
    						&&(msg[2] == control_id[i+3][2])
    						&&(msg[3] == control_id[i+3][3])
    						&&(msg[4] == control_id[i+3][4])
    						)
    						{
    							match_flag = 1;				/**<Have paired*/
    							break;
    						}
    						else
    						{
    							match_flag = 0;				/**<Unpaired too*/
    						}
    					}
    					
    					if(match_flag == 0)
    					{
    					    flag = (channel_flag >> 2) & 0x03;
    					    
    					    if(flag >= 3)
    						{
    							flag = 0;
    						}
    						
    						AT24C02_Write_Msg(3 * 6 + flag * 6, msg, 6);		/**<Writes paired data to the EEPROM, starting at address 24*/
    						for(i = 0; i < 6; i++)
    						{
    							control_id[flag + 3][i] = msg[i];	/**<The pairing information is assigned to the Control_ID*/
    						}
    						
    						flag ++;									/**<Channel 1 plus 1 for each pair*/
    						if(flag >= 3)
    						{
    							flag = 0;	/**<Determines if the number of channel 1 bindings exceeds 4 groups*/ 
    						}
    						channel_flag &= (~(0x03 << 2));
    						channel_flag |= (flag << 2);

    					}
    					else
    					{
    					    flag = i;
    					    debug = flag;
    					    debug = flag;
    					    //control_id[flag + 3][5] = msg[5];
    						AT24C02_Write_Msg(3 * 6 + flag * 6 + 5, &msg[5], 1);	/**<Writes paired data to the EEPROM, starting at address 0*/
                            soft_delay_ms(2);
    					}

                        setChannelStatus(CHANNEL_1, rf_buf[9]);

    					key_long_flag = 0;
    				}
    			    else if(match_channel_flag&0x40)				/**<Channel 2 enters the pairing*/
    				{

    					for(i = 0; i < 3; i++)
    					{
    						if((msg[0] == control_id[i+6][0]) /**<Determine if there has been a match*/
    						&&(msg[1] == control_id[i+6][1])
    						&&(msg[2] == control_id[i+6][2])
    						&&(msg[3] == control_id[i+6][3])
    						&&(msg[4] == control_id[i+6][4])
    							)
    						{
    							match_flag = 1;				/**<Have paired*/
    							break;
    						}
    						else
    						{
    							match_flag = 0;				/**<Unpaired too*/
    						}
    					}
    					
    					if(match_flag == 0)
    					{
    					    flag = (channel_flag >> 4) & 0x03;
    					    
    					    if (flag >= 3)
    						{
    							flag = 0;
    						}
    						
    						AT24C02_Write_Msg(6 * 6 + flag * 6, msg, 6); /**<Writes paired data to the EEPROM, starting at address 48*/ 
    						for(i = 0; i < 6; i++)
    						{
    							control_id[flag + 6][i] = msg[i];	/**<The pairing information is assigned to the Control_ID*/
    						}
    						
    						flag ++;									/**<Channel 2 plus 1 for each pair*/
    						if(flag >= 3)
    						{
    							flag = 0;							/**<Determines if the number of channel 2 bindings exceeds 4 groups*/ 
    						}
    						
    						channel_flag &= (~(0x03 << 4));
    						channel_flag |= (flag << 4);

    					}
    					else
    					{   
    					    flag = i;
    						AT24C02_Write_Msg(6 * 6 + flag * 6 + 5, &msg[5], 1);	/**<Writes paired data to the EEPROM, starting at address 0*/
    					}

                        setChannelStatus(CHANNEL_2, rf_buf[9]);

    					key_long_flag = 0;
    				}

        			AT24C02_Write_Msg(ADDR_CHN_FLAG, &channel_flag,1);	   		/**<Writes the number of bindings per channel to the EEPROM*/
        			AT24C02_Write_Msg(ADDR_CHN_FLAG, &channel_flag,1);
        			
        			for(i = 0; i < 12; i++)
        			{
        				AT24C02_Read_Msg(i * 6, control_id[i], 6);  /**<Reads paired data stored at EEPROM*/
        			}
        			AT24C02_Read_Msg(ADDR_CHN_FLAG, &channel_flag, 1);	   		/**<Reads the number of bindings per channel*/

                    if (is_factory_flag)
                    {
                        AT24C02_Write_Byte(ADDR_NOT_FACTORY_FLAG, NOT_FACTORY_FLAG0);
    	                soft_delay_ms(5);
    	                AT24C02_Write_Byte(ADDR_NOT_FACTORY_FLAG + 1, NOT_FACTORY_FLAG1);
    	                soft_delay_ms(5);
    	                is_factory_flag = 0;
                    }
        			
        			sys_stute = RX_MSG;						   
        			
        			sledBlink();
        			match_channel_flag = 0;
    			}
    		}
    		else
    		{
    			if(flag_5s_add > 500)							   /**<After 5s, exit pairing and enter receiving state*/
    			{
    				sys_stute = RX_MSG;
    				match_channel_flag = 0;
    			}
    		}
    	}break;
    	case RX_MSG:
    	{
    		if(rx_data())					/**<Whether the data was received*/
    		{
                if (rf_buf[8] == CMD_SCENE_EXE)
    			{
        			if(rf_buf[10] != 0xff)	/**<Determine if it is a full channel*/
        			{
        				for (i = 9; i < 12; i++)
        				{
        					if((rf_buf[3] == control_id[i][0])	          			/**<Determine if there has been a match*/
        					&&(rf_buf[4] == control_id[i][1])
        					&&(rf_buf[5] == control_id[i][2])
        					&&(rf_buf[6] == control_id[i][3]))
        					{
        						if(rf_buf[2] != control_id[i][5])	      		/**<Determine if it is the same frame of data*/
        						{
        							control_id[i][5] = rf_buf[2];   		/**<Update counter*/											

        							if(rf_buf[9] < SCENE_NUM)		/**<Determine if the channels have been paired*/
        							{
        								sledBlink();

                                        //由于此循环执行完成后会退出外循环，故复用了外层循环的i，注意。
                                        for(i = 9; i < 12; i++)
        				                {
        				                    if ((control_id[i][4] & (0x01 << rf_buf[9])) != 0)
        				                    {
                                                setChannelStatus(i - 9, CHANNEL_ON);
        				                    }
        				                    else
        				                    {
        				                        setChannelStatus(i - 9, CHANNEL_OFF);
        				                    }
                                        }
        								
        							}
        							
        						}
        						break;
        					}
        					
        				}
        			}
    			
    			}
    			else if (rf_buf[8] == CMD_SCENE_SET)
    			{
    			    match_flag = 0;
                    for(i= 0; i< 12; i++)
                    {
                        if((rf_buf[3] == control_id[i][0])                      /**<Determine if there has been a match*/
                        &&(rf_buf[4] == control_id[i][1])
                        &&(rf_buf[5] == control_id[i][2])
                        &&(rf_buf[6] == control_id[i][3]))
                        {
                            if(rf_buf[2] != control_id[i][5])               /**<Determine if it is the same frame of data*/
                            {
                                control_id[i][5] = rf_buf[2];           /**<Update counter*/                                            
                                match_flag = 1;   
                            }
                            break;
                        }
                    }

                    if (match_flag && rf_buf[9] < SCENE_NUM && rf_buf[10] <= SCENE_ACTION_ON && rf_buf[11] < CHANNEL_NUM)
                    {
                        // off
                        if (rf_buf[10] == SCENE_ACTION_OFF)
                        {
                            control_id[9 + rf_buf[11]][4] &= (~ (0x01 << rf_buf[9]));
                        }
                        else  //on
                        {
                            control_id[9 + rf_buf[11]][4] |= ((0x01 << rf_buf[9]));
                        }

                        AT24C02_Write_Msg(9 * 6 + rf_buf[11] * 6 + 4, &control_id[9 + rf_buf[11]][4], 1); /** */ 
                        soft_delay_ms(1);
                        
                        //由于此循环执行完成后会退出外循环，故复用了外层循环的i，注意。
                        for(i = 0; i < 12; i++)
                        {
                            AT24C02_Read_Msg(i * 6, control_id[i], 6);  /**<Reads paired data stored at EEPROM*/
                        }
                        AT24C02_Read_Msg(ADDR_CHN_FLAG, &channel_flag, 1);         /**<Reads the number of bindings per channel*/                     


                        if (rf_buf[10] == SCENE_ACTION_ON)
                        {
                            setChannelStatus(rf_buf[11], CHANNEL_ON);
                        }
                        else if (rf_buf[10] == SCENE_ACTION_OFF)
                        {
                            setChannelStatus(rf_buf[11], CHANNEL_OFF);
                        }
                        
                        sledBlink();
                    } 
                   
    			}
    			else if (rf_buf[8] == CMD_SWITCH || rf_buf[8] == CMD_SWITCH_COMPAT)
    			{
                    if(rf_buf[10] != 0xff)  /**<Determine if it is a full channel*/
                    {
                        for(i=0; i<9; i++)
                        {
                            if ((is_factory_flag == 1)
                            &&((rf_buf[3] == FACTORY_ADDR0_VALUE)                      /**<Determine if there has been a match*/
                            &&(rf_buf[4] == FACTORY_ADDR1_VALUE)
                            &&(rf_buf[5] == FACTORY_ADDR2_VALUE)
                            &&(rf_buf[6] == FACTORY_ADDR3_VALUE))
                            ||
                            ((rf_buf[3] == control_id[i][0])                      /**<Determine if there has been a match*/
                            &&(rf_buf[4] == control_id[i][1])
                            &&(rf_buf[5] == control_id[i][2])
                            &&(rf_buf[6] == control_id[i][3]))
                            )
                            {
                                if(rf_buf[2] != control_id[i][5])               /**<Determine if it is the same frame of data*/
                                {
                                    control_id[i][5] = rf_buf[2];           /**<Update counter*/                                            
                                    if(rf_buf[10] == control_id[i][4])      /**<Determine if the channels have been paired*/
                                    {
                                        if(flag == 0)   
                                        {
                                            flag = 1;               /**<Prompt for remote control of paired device received*/
                                            sledBlink();
                                        }
                                        
                                        if(rf_buf[11] == 0)             /**<Determine if it is a delay instruction*/
                                        {
                                            if(i < 3)               /**<Change the state of channel 0 according to the instruction*/
                                            {
                                                if((KEY0_FLAG == 0))
                                                    {
                                                        if(rf_buf[9] == 2)
                                                            setChannelStatus(CHANNEL_0, CHANNEL_SW);
                                                        else
                                                            setChannelStatus(CHANNEL_0, rf_buf[9]);
                                                    }
                                            }
                                            else if(i < 6)          /**<Change the state of channel 1 according to the instruction*/
                                            {
                                                if((KEY1_FLAG == 0))
                                                {
                                                if(rf_buf[9] == 2)
                                                    setChannelStatus(CHANNEL_1, CHANNEL_SW);
                                                else
                                                    setChannelStatus(CHANNEL_1, rf_buf[9]);
                    
                                                }
                                            }
                                            else
                                            {
                                                if((KEY2_FLAG == 0))    /**<Change the state of channel 0 according to the instruction*/
                                                {
                                                if(rf_buf[9] == 2)
                                                    setChannelStatus(CHANNEL_2, CHANNEL_SW);
                                                else
                                                    setChannelStatus(CHANNEL_2, rf_buf[9]);
                                                }
                                            }
                                        }
                                        else                                    /**<Delay operation*/
                                        {
                                            flag_5min_add = 0;
                                            if(delay_flag == 1)
                                            {
                                                channel_delay[0] = 0;           /**<Reset delay channel*/
                                                delay_flag = 0;                 /**<Set it to 1 in delay_task(void)*/
                                            }
                                            if(i < 3)
                                            {
                                                channel_delay[0] |= 0x01;       /**<channel 0*/
                                            }
                                            else if(i < 6)
                                            {
                                                channel_delay[0] |= 0x02;       /**<channel 1*/
                                            }
                                            else
                                            {
                                                channel_delay[0] |= 0x04;       /**<channel 2*/
                                            }
                                            channel_delay[1] = rf_buf[9];       /**<Motion commands*/
                                            channel_delay[2] = rf_buf[11];      /**<Delay time*/
                                        }
                                    }
                                }
                            }
                            
                        }
                    }
                    else
                    {
						for(i=0; i<9; i++)
                        {
                            if ((is_factory_flag == 1)
                            &&((rf_buf[3] == FACTORY_ADDR0_VALUE)                      /**<Determine if there has been a match*/
                            &&(rf_buf[4] == FACTORY_ADDR1_VALUE)
                            &&(rf_buf[5] == FACTORY_ADDR2_VALUE)
                            &&(rf_buf[6] == FACTORY_ADDR3_VALUE))
                            ||
                            ((rf_buf[3] == control_id[i][0])                      /**<Determine if there has been a match*/
                            &&(rf_buf[4] == control_id[i][1])
                            &&(rf_buf[5] == control_id[i][2])
                            &&(rf_buf[6] == control_id[i][3]))
                            )
                            {
                                if((rf_buf[2] != control_id[i][5]))     /**<Determine if it is the same frame of data*/
                                {
                                    control_id[i][5] = rf_buf[2];       /**<Update counter*/
                                   
                                    sledBlink();
                                   
                                    if((rf_buf[11] == 0))               /**<Determine if it is a delay instruction*/
                                    {
                                        
                                        if((KEY0_FLAG == 0))
                                        {
                                            if(rf_buf[9] == 2)
                                                setChannelStatus(CHANNEL_0, CHANNEL_SW);
                                            else
                                                setChannelStatus(CHANNEL_0, rf_buf[9]);
                                        }
                                
                                        if((KEY1_FLAG == 0))
                                        {
                                            if(rf_buf[9] == 2)
                                                setChannelStatus(CHANNEL_1, CHANNEL_SW);
                                            else
                                                setChannelStatus(CHANNEL_1, rf_buf[9]);
                                        }
                               
                                        if((KEY2_FLAG == 0)) /**<Change the state of channel 2 according to the instruction*/
                                        {
                                            if(rf_buf[9] == 2)
                                                setChannelStatus(CHANNEL_2, CHANNEL_SW);
                                            else
                                                setChannelStatus(CHANNEL_2, rf_buf[9]);
                                        }
                                        
                                    }
                                    else                                        /**<Delay operation*/
                                    {
                                        flag_5min_add = 0;
                                        if(delay_flag == 1)
                                        {
                                            channel_delay[0] = 0;       /**<Reset delay channel*/
                                            delay_flag = 0;             /**<Set it to 1 in delay_task(void)*/
                                        }
                                        
                                        channel_delay[0] |= 0x01;       /**<channel 0*/
                                        channel_delay[0] |= 0x02;       /**<channel 1*/
                                        channel_delay[0] |= 0x04;       /**<channel 2*/
                                    
                                        channel_delay[1] = rf_buf[9];       /**<Motion commands*/
                                        channel_delay[2] = rf_buf[11];      /**<Delay time*/
                                    }
                                    
                                }
                            }
                    	}
					}
    			}
    			else if (rf_buf[8] == CMD_STARTUP_CONFIG)
    			{

#define CMD_STARTUP_ACTION_INDEX 9
#define CMD_STARTUP_OUTLET_INDEX 10

                    if(rf_buf[2] != control_id[i][5])               /**<Determine if it is the same frame of data*/
                    {
                        control_id[i][5] = rf_buf[2];           /**<Update counter*/                                            
     
                        match_flag = 0;
                        for(i= 0; i< 9; i++)
                        {
                            if((rf_buf[3] == control_id[i][0])                      /**<Determine if there has been a match*/
                            &&(rf_buf[4] == control_id[i][1])
                            &&(rf_buf[5] == control_id[i][2])
                            &&(rf_buf[6] == control_id[i][3]))
                            {
                                if (rf_buf[CMD_STARTUP_OUTLET_INDEX] == 0xFF)
                                {
                                    match_flag |= 0x07;
                                    break;
                                }
                                else if (rf_buf[CMD_STARTUP_OUTLET_INDEX] == control_id[i][4])
                                {
                                    match_flag |= (1 << (i / 3));
                                }
                            }
                        }
                    }

                    if (match_flag
                        && rf_buf[CMD_STARTUP_ACTION_INDEX] <= PROTOCOL_STARTUP_STAY)
                    {

                        for(i = 0; i < CHANNEL_NUM; i++)
                        {
                            if (match_flag & (1 << i))
                            {
                                if (rf_buf[CMD_STARTUP_ACTION_INDEX] == PROTOCOL_STARTUP_OFF)
                                {
                                    setChnStartupOff(channel_startup, i);
                                    setChannelStatus(i, CHANNEL_OFF);
                                }
                                else if (rf_buf[CMD_STARTUP_ACTION_INDEX] == PROTOCOL_STARTUP_ON)
                                {
                                    setChnStartupOn(channel_startup, i);
                                    setChannelStatus(i, CHANNEL_ON);
                                }
                                else if (rf_buf[CMD_STARTUP_ACTION_INDEX] == PROTOCOL_STARTUP_STAY)
                                {
                                    setChnStartupStay(channel_startup, i);
                                    
                                    if (i == CHANNEL_0)
                                    {
                                        setChannelStatus(CHANNEL_0, KEY0.channel_status);
                                    }
                                    else if (i == CHANNEL_1)
                                    {
                                        setChannelStatus(CHANNEL_1, KEY1.channel_status);
                                    }
                                    else if (i == CHANNEL_2)
                                    {
                                        setChannelStatus(CHANNEL_2, KEY2.channel_status);
                                    }
                                }
                            }
                        }

                        AT24C02_Write_Msg(ADDR_CHN_STARTUP, &channel_startup, CHN_STARTUP_SIZE);
                        
                        sledBlink();
                    } 
                   
    			}
    			
    			//��ֹͬһ֡�����ظ���Ӧ
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
								TRISB6 = 0;
								RB6 = 1;		/**<Channel 0 outputs high level*/
							}
						else 
							{
								TRISB6 = 0;
								RB6 = 0;		/**<Channel 0 outputs low level*/
							}
					}break;
			case 1:
					{
						if(status)
							{
								TRISB5 = 0;
								RB5 = 1;			/**<Channel 1 outputs high level*/
							}
						else 
							{
								TRISB5 = 0;
								RB5 = 0;			/**<Channel 1 outputs low level*/
							}
					}break;
			case 2: 
					{
						if(status)
							{
								TRISB4 = 0;
								RB4 = 1;			/**<Channel 2 outputs high level*/
							}
						else 
							{
								TRISB4 = 0;
								RB4 = 0;			/**<Channel 2 outputs low level*/
							}
					}break;
		}
}

void delay_task(void)
{
	if(power_on_delay_flag == 1)
	{
		if(flag_5s_add > 200)
		{
			power_on_delay_flag = 0;
			power_on_flag = 0;
			AT24C02_Write_Msg(POWER_ON_NUM, &power_on_flag, POWER_ON_NUM_SIZE);
		}
	}
    
	if(channel_delay[0] != 0)						/**<Determine if there are delayed tasks*/
		{
			if(delay_flag == 0)delay_flag = 1;		/**<There is already a delayed task*/
			if(channel_delay[2] > 0)				/**<Whether the delay is over*/
				{
					if(flag_5min_add >= 30000)		/**<Five minutes a step,A 10ms timer,5min = (10*30000)ms*/
						{
							flag_5min_add = 0;
							channel_delay[2]--;		/**<Delay minus 1*/
						}
				}
			else
				{


#if 0
				
					switch(channel_delay[0])		/**<Arrival delay time,Change channel state based on the contents of channel_delay[0]*/
						{
						case 1:
								{
									if(channel_delay[1] != 2)
										setChannelStatus(CHANNEL_0, channel_delay[1]);
									else 
										setChannelStatus(CHANNEL_0, CHANNEL_SW);									
									}break;
						case 2:
								{
									if(channel_delay[1] != 2)
										setChannelStatus(CHANNEL_1, channel_delay[1]);
									else 
										setChannelStatus(CHANNEL_1, CHANNEL_SW);									
									}break;
						case 4:
								{
									if(channel_delay[1] != 2)
										setChannelStatus(CHANNEL_2, channel_delay[1]);
									else 
										setChannelStatus(CHANNEL_2, CHANNEL_SW);
									}break;
						case 3:
								{
									if(channel_delay[1] != 2)
										{
											setChannelStatus(CHANNEL_0, channel_delay[1]);
											setChannelStatus(CHANNEL_1, channel_delay[1]);
										}
									else 
										{
											setChannelStatus(CHANNEL_0, CHANNEL_SW);
											setChannelStatus(CHANNEL_1, CHANNEL_SW);
										}
									}break;
						case 5:
								{
									if(channel_delay[1] != 2)
										{
											setChannelStatus(CHANNEL_0, channel_delay[1]);
											setChannelStatus(CHANNEL_2, channel_delay[1]);
										}
									else 
										{
											setChannelStatus(CHANNEL_0, CHANNEL_SW);
											setChannelStatus(CHANNEL_2, CHANNEL_SW);
										}
									}break;
						case 6:
								{
									if(channel_delay[1] != 2)
										{
											setChannelStatus(CHANNEL_1, channel_delay[1]);
											setChannelStatus(CHANNEL_2, channel_delay[1]);
										}
									else 
										{
											setChannelStatus(CHANNEL_1, CHANNEL_SW);
											setChannelStatus(CHANNEL_2, CHANNEL_SW);
										}
									}break;
						case 7:
								{
									if(channel_delay[1] != 2)
										{
											setChannelStatus(CHANNEL_0, channel_delay[1]);
											setChannelStatus(CHANNEL_1, channel_delay[1]);
											setChannelStatus(CHANNEL_2, channel_delay[1]);
										}
									else 
										{
											setChannelStatus(CHANNEL_0, CHANNEL_SW);
											setChannelStatus(CHANNEL_1, CHANNEL_SW);
											setChannelStatus(CHANNEL_2, CHANNEL_SW);
										}
									}break;
						}


#else


                                    if (channel_delay[1] <= CHANNEL_SW)
                                    {
                                        if (channel_delay[0] & 0x01)
                                        {
                                            setChannelStatus(CHANNEL_0, channel_delay[1]);
                                        }

                                        if (channel_delay[0] & 0x02)
                                        {
                                            setChannelStatus(CHANNEL_1, channel_delay[1]);
                                        }

                                        if (channel_delay[0] & 0x04)
                                        {
                                            setChannelStatus(CHANNEL_2, channel_delay[1]);
                                        }
                                    }
									

#endif

					channel_delay[0] = 0;
					channel_delay[1] = 0;
					channel_delay[2] = 0;
					delay_flag=0;
				}
		}
}
