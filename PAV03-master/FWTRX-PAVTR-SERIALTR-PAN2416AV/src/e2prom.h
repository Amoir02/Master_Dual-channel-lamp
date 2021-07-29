#ifndef _E2PROM_H
#define _E2PROM_H




void AT24C02_Write_Msg(unsigned char addr ,unsigned char *data,unsigned char len);
void AT24C02_Read_Msg(unsigned char addr,unsigned char *data,unsigned char len);
unsigned char AT24C02_Read_Byte(unsigned char addr);
void AT24C02_Write_Byte(unsigned char addr ,unsigned char data);

#endif