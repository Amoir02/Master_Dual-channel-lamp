#ifndef RECIVE_H_
#define RECIVE_H_

#include "cms.h"

#define uint8_t unsigned char
#define uint16_t unsigned int 
#define uint32_t unsigned long

#define RX_MSG 1
#define MATCH_MSG 2
#define CLEAN_MSG 3

#define CHANNEL_OFF  0
#define CHANNEL_ON   1
#define CHANNEL_SW   2

    
#define CHANNEL_0    0
#define CHANNEL_1    1
#define CHANNEL_2    2
#define CHANNEL_NUM  (3)
#define CHANNEL_ALL  (0xFF)
    
#define PROTOCOL_STARTUP_OFF   0
#define PROTOCOL_STARTUP_ON    1
#define PROTOCOL_STARTUP_STAY  2

#define FACTORY_STARTUP_ON   1
#define FACTORY_STARTUP_OFF  0

#define FACTORY_STARTUP FACTORY_STARTUP_ON

#if (FACTORY_STARTUP == FACTORY_STARTUP_ON)

//  FWSWES-PAV03PON-SWITCHES-PAN2416AV

#define STARTUP_OFF   1
#define STARTUP_ON    0
#define STARTUP_STAY  2

#define setChnStartupOff(startup, index)  { \
    startup  |= (1 << ((index << 1) + 0)); \
    startup  &= (~(1 << ((index << 1) + 1))); \
}

#define setChnStartupOn(startup, index) { \
    startup  &= (~(1 << ((index << 1) + 0))); \
    startup  &= (~(1 << ((index << 1) + 1))); \
}
    
#define setChnStartupStay(startup, index) { \
    startup  |= (1 << ((index << 1) + 1)); \
    startup  &= (~(1 << ((index << 1) + 0))); \
}

#else

//  FWSWES-PAV03-SCENESWITCHES-PAN2416AV

#define STARTUP_OFF   0
#define STARTUP_ON    1
#define STARTUP_STAY  2

#define setChnStartupOn(startup, index)  { \
    startup  |= (1 << ((index << 1) + 0)); \
    startup  &= (~(1 << ((index << 1) + 1))); \
}

#define setChnStartupOff(startup, index) { \
    startup  &= (~(1 << ((index << 1) + 0))); \
    startup  &= (~(1 << ((index << 1) + 1))); \
}
    
#define setChnStartupStay(startup, index) { \
    startup  |= (1 << ((index << 1) + 1)); \
    startup  &= (~(1 << ((index << 1) + 0))); \
}

#endif

#define setChannelOn(status, index)              (status  |= (1 << index))
#define setChannelOff(status, index)             (status  &= (~(1 << index)))
#define getChannelStatus(status, index)          ((status >> index) & 0x01)
           


#define getChnStartupConfig(startup, index)  ((startup >> (index << 1)) & 0x03)

unsigned short UpdateCRC(unsigned char *CRC_input, unsigned int len);
uint8_t rx_data(void);
void channel_set(uint8_t channel_num, uint8_t status);
void recive_task(void);
void delay_task(void);

#endif


