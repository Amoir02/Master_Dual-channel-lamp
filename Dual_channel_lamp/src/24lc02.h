#ifndef _STM32_24C02_H_
#define _STM32_24C02_H_


#include "cms.h"
#include "system.h"


uchar EEPROM_Init(uchar SPD_I2C);
uchar EEPROM_SendByte(uchar REGadds,uchar Wdat); 
uchar EEPROM_ReceByte(uchar REGadds,uchar *Rdat);   //读器件数据

uchar EEPROM_CheckBusy(void); //返回0则空闲，1正在写
void EP_GetRFAdd(uchar * OutP);
void EP_SetRFAdd(uchar * InP);

uchar EP_GetONOFFStep(void);
void EP_SetONOFFStep(uchar D);
uchar EP_IsADDCfg(void);
uchar EP_SetADDCfg(uchar ID);
void AT24C02_Write_Msg(unsigned char addr ,unsigned char *data,unsigned char len);
void AT24C02_Read_Msg(unsigned char addr,unsigned char *data,unsigned char len);


#endif




