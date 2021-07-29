#ifndef _IIC_Base_
#define _IIC_Base_

#include "cms.h"
#include "system.h"





#define IIC_SCL_outmode   TRISB7=0
#define IIC_SCL_output    RB7
#define IIC_SCL_input     RB7


#define IIC_SDA_inmode  {WPUB6=1; TRISB6=1;}
#define IIC_SDA_outmode   TRISB6=0	
#define IIC_SDA_input     RB6
#define IIC_SDA_output    RB6

//---------------------------------
uchar IIC_start(void);
uchar IIC_stop(void);
uchar IIC_RACK(void);
uchar IIC_WACK(uchar ACK);
uchar IIC_Wbyte(uchar Wdat);
uchar IIC_Rbyte(void);
//----------------------------------

void  IIC_Init(uchar freq);
uchar IIC_SendByte(uchar Chip_Adds,uchar Reg_Adds,uchar Wdat);
uchar IIC_SendString(uchar Chip_Adds,uchar Reg_Adds,uchar R_LEN,uchar *buf);
uchar IIC_ReceByte(uchar ACK,uchar Chip_Adds,uchar Reg_Adds,uchar *Rdat);
uchar IIC_ReceString(uchar Chip_Adds,uchar Reg_Adds,usint R_LEN,uchar *buf);


uchar IIC_CheckBusy(uchar Chip_Adds); //返回0则空闲，1正在写

uchar IIC_SendString_full(uchar Chip_Adds,uchar Reg_Adds,uchar R_LEN,uchar iD);

#endif




