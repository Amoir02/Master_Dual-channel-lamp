#ifndef _E2PROM_H
#define _E2PROM_H

//channel_flag存储地址
#define ADDR_CHN_FLAG         110
#define CHN_FLAG_SIZE         1

//通道状态存储地址
#define ADDR_CHN_STATUS       111
#define CHN_STATUS_SIZE       1

//上电动作配置存储地址
#define ADDR_CHN_STARTUP      112
#define CHN_STARTUP_SIZE      1

//非出厂标志存储地址
#define ADDR_NOT_FACTORY_FLAG     113
#define NOT_FACTORY_FLAG_SIZE     2

#define POWER_ON_NUM     115
#define POWER_ON_NUM_SIZE     1

#define NOT_FACTORY_FLAG0         0x5E
#define NOT_FACTORY_FLAG1         0xF6

/*
 /  channel_flag  / channels_status / startup_config /
 /     1byte      /     1byte       /     1byte      /
 /  ADDR_CHN_FLAG / ADDR_CHN_FLAG   / ADDR_CHN_FLAG  /
*/

void AT24C02_Write_Msg(unsigned char addr ,unsigned char *data,unsigned char len);
void AT24C02_Read_Msg(unsigned char addr,unsigned char *data,unsigned char len);
unsigned char AT24C02_Read_Byte(unsigned char addr);
void AT24C02_Write_Byte(unsigned char addr ,unsigned char data);

#endif