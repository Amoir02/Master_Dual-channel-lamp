#include "user_ble.h"

#include <string.h>


const static uint8_t whitening_map[3][42] = 
{
	// 37
	{
		0x8D, 0xD2, 0x57, 0xA1, 0x3D,
		0xA7, 0x66, 0xB0, 0x75, 0x31,
		0x11, 0x48,	0x96, 0x77, 0xF8,
		0xE3, 0x46, 0xE9, 0xAB, 0xD0,
		0x9E, 0x53, 0x33, 0xD8,	0xBA,
		0x98, 0x08, 0x24, 0xCB, 0x3B,
		0xFC, 0x71, 0xA3, 0xF4, 0x55,
		0x68, 0xCF, 0xA9, 0x19, 0x6C,
		0x5D, 0x4C
	},
	
	//38
	{
		0xD6, 0xC5, 0x44, 0x20, 0x59,
		0xDE, 0xE1, 0x8F, 0x1B, 0xA5,
		0xAF, 0x42, 0x7B, 0x4E, 0xCD,
		0x60, 0xEB, 0x62, 0x22, 0x90,
		0x2C, 0xEF, 0xF0, 0xC7, 0x8D,
		0xD2, 0x57, 0xA1, 0x3D, 0xA7,
		0x66, 0xB0, 0x75, 0x31, 0x11,
		0x48, 0x96, 0x77 ,0xF8, 0xE3,
		0x46, 0xE9
	},
	
	//39
	{
		0x1F, 0x37, 0x4A, 0x5F, 0x85,
		0xF6, 0x9C, 0x9A, 0xC1, 0xD6,
		0xC5, 0x44, 0x20, 0x59, 0xDE,
		0xE1, 0x8F, 0x1B, 0xA5, 0xAF,
		0x42, 0x7B, 0x4E, 0xCD, 0x60,
		0xEB, 0x62, 0x22, 0x90, 0x2C,
		0xEF, 0xF0, 0xC7, 0x8D, 0xD2,
		0x57, 0xA1, 0x3D, 0xA7, 0x66,
		0xB0, 0x75
	}
};
/* 用户自定义MAC地址区域 */
const static uint8_t ble_nonconn_buffer[20] = 
{
	0xAA, 0xD6, 0xBE, 0x89, 0x8E,												//	LE_PKT
	0x42, 0xFF, 0x66, 0x55, 0x44, 0x33, 0x22, 0x11,								//	PDU Header
	0x02, 0x01, 0x1A,															//	AD Structure 1
	0xFF, 0xFF, 0xF0, 0xFF														//	AD Structure 2 Header 
};

uint8_t invert_8(uint8_t data);
uint32_t invert_32(uint32_t data);
uint32_t check_crc24(const uint8_t *data, uint8_t length);

uint8_t rf_tx_buffer[20];



void ble_craft_packet_noconn(uint8_t *data, uint8_t length, uint8_t channel_index)
{
//	uint8_t rf_tx_buffer[47];
	memcpy(rf_tx_buffer, ble_nonconn_buffer, 20);
	memcpy(rf_tx_buffer + 20, data, length);
	
	//rf_tx_buffer[6] = 6 + (2 + 1) + (3 + length + 1);
	rf_tx_buffer[6] = 13 + length;
	rf_tx_buffer[16] = 3 + length;
	
	uint32_t calc_crc = check_crc24(rf_tx_buffer + 5, 15 + length);
	
	rf_tx_buffer[20 + length + 0] = calc_crc;
	rf_tx_buffer[20 + length + 1] = calc_crc >> 8;
	rf_tx_buffer[20 + length + 2] = calc_crc >> 16;
	
	for (uint8_t i = 0; i < 18 + length; i++)
	{
		rf_tx_buffer[5 + i] ^= whitening_map[channel_index - 37][i];
	}
	
//	memcpy(ble_buffer, rf_tx_buffer, 23 + length);
}

uint32_t check_crc24(const uint8_t *data, uint8_t length)
{
	uint32_t crc = 0x55555500;
	uint32_t poly = 0x000065B00;
	uint32_t input_byte = 0;
	
	for (uint8_t i = 0; i < length; i++)
	{
		input_byte = invert_8(data[i]);
		
		crc ^= (input_byte << 24);
		
		for (uint8_t j = 0; j < 8; j++)
		{
			if (crc & 0x80000000)
			{
				crc = (crc << 1) ^ poly;
			}
			else
			{
				crc = (crc << 1);
			}
		}
	}
	
	crc = invert_32(crc);
	return crc;
}

uint8_t invert_8(uint8_t data)
{
	uint8_t temp = 0;
	
	for (uint8_t i = 0; i < 8; i++)
	{
		if (data & (1 << i))
		{
			temp |= 1 << (7 - i);
		}
	}
	
	return temp;
}

uint32_t invert_32(uint32_t data)
{
	register uint32_t temp = 0;

	for (uint8_t i = 0; i < 32; i++)
	{
		if (data & (1UL << i))
		{
			temp |= 1UL << (31 - i);
		}
		else
		{
			temp = temp;
		}
	}
	
	return temp;
}

const unsigned char tx_rx_address[] = CONF_DEFAULT_ADDR;
void ble_rf_init(uint8_t whitening_enable)
{
	uint8_t Dem_cal_data_ble[] = {0x01};
	if (whitening_enable == 1)
	{
		Dem_cal_data_ble[0] = 0x01;
	}
	else
	{
		Dem_cal_data_ble[0] = 0x00;
	}
//	xn297l_write_reg(W_REGISTER + RF_CH, CONF_DEFAULE_CNANNEL);							// 设置接收信道
	xn297l_write_reg(W_REGISTER + RX_PW_P0, CONF_PAYLOAD_WIDTH);							// 设置接收数据宽度，即Payload宽度
	xn297l_write_buf(W_REGISTER + TX_ADDR, tx_rx_address, sizeof(tx_rx_address));	// 设置发送地址
	xn297l_write_buf(W_REGISTER + RX_ADDR_P0, tx_rx_address, sizeof(tx_rx_address));// 设置接收地址
	xn297l_write_buf(W_REGISTER + DEM_CAL,Dem_cal_data_ble, sizeof(Dem_cal_data_ble));
}

typedef struct
{
	uint8_t tx_data;
	uint8_t tx_cnt;
	uint8_t tx_enable;
} tx_param_t;


// 固定发送8bytes长度数据测试
void rf_tx_send_data(uint8_t *pBuff)
{

    // Valid Length = 23 + data length
    // Max Length = 47
    //uint8_t rf_tx_buffer[47];
    
    uint8_t temp_data[24];
    uint8_t temp_length =CONF_PAYLOAD_WIDTH;  //发射数据长度设置
    

    
    // ble hannel index = 37
    // freq = 2402MHz
    ble_craft_packet_noconn(pBuff, temp_length, 37);
    xn297l_set_channel(02);
    xn297l_tx_data(rf_tx_buffer, 23 + temp_length);
	RF_ClearFIFO();
	RF_ClearStatus();

    // ble hannel index = 38
    // freq = 2426MHz		
    ble_craft_packet_noconn(pBuff, temp_length, 38);
    xn297l_set_channel(26);
    xn297l_tx_data(rf_tx_buffer, 23 + temp_length);
	RF_ClearFIFO();
	RF_ClearStatus();
    
    // ble hannel index = 39
    // freq = 2480MHz
    ble_craft_packet_noconn(pBuff, temp_length, 39);
    xn297l_set_channel(80);
    xn297l_tx_data(rf_tx_buffer, 23 + temp_length);
	RF_ClearFIFO();
	RF_ClearStatus();
       
       
}

// 固定接收8bytes长度数据测试
void rf_tx_rev_data(uint8_t *pBuff)
{
    if (xn297l_rx_data(pBuff, CONF_PAYLOAD_WIDTH))
    {
         //rx_count = (rx_count + 1) % 100;
         //led_change_font(rx_count, 22); 
		 RF_ClearFIFO();
		 RF_ClearStatus();    
    }
}
