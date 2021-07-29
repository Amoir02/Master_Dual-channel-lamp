#ifndef BLE_H_
#define BLE_H_

#include "cms.h"
#include "user_ble.h"




void ble_data_init(void);
uint16_t UpdateCRC(unsigned char *CRC_input, unsigned int len);
void data_send(uint8_t *Para,uint8_t count);



#endif

