#ifndef _USER_BLE_H_
#define _USER_BLE_H_

#include "rf297L.h"

/* user_ble.h 地址、payload长度用户自定义区 */
#define CONF_DEFAULE_CNANNEL	2
#define CONF_PAYLOAD_WIDTH		1
#define CONF_DEFAULT_ADDR		{0xCC, 0xCC, 0xCC, 0xCC, 0xCC}
/* user_ble.h 地址、payload长度用户自定义区 END */

#define	xn297l_write_reg	RF_WriteReg
#define	xn297l_write_buf    RF_Write_Buff
#define xn297l_read_buf		RF_Read_Buff
#define	xn297l_read_reg		RF_ReadReg

#define xn297l_tx_data		RF_TxData
#define xn297l_rx_data		RF_Read_RxData
#define xn297l_set_channel	RF_SetChannel

#define uint8_t unsigned char
#define uint16_t unsigned int
#define uint32_t unsigned long int



#define BLE_TX_MODE_SET		0
#define BLE_RX_MODE_SET		1

void ble_craft_packet_noconn(uint8_t *data, uint8_t length, uint8_t channel_index);
uint8_t invert_8(uint8_t data);
uint32_t invert_32(uint32_t data);
uint32_t check_crc24(const uint8_t *data, uint8_t length);

void ble_rf_init(uint8_t whitening_enable);
void rf_tx_send_data(uint8_t *pBuff);
void rf_tx_rev_data(uint8_t *pBuff);

#endif