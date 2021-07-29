#ifndef RECIVE_H_
#define RECIVE_H_

#include "cms.h"

#define uint8_t unsigned char
#define uint16_t unsigned int 
#define uint32_t unsigned long

#define RX_MSG 1
#define MATCH_MSG 2
#define CLEAN_MSG 3


unsigned short UpdateCRC(unsigned char *CRC_input, unsigned int len);
uint8_t rx_data(void);
void channel_set(uint8_t channel_num, uint8_t status);
void recive_task(void);
void delay_task(void);

#endif


