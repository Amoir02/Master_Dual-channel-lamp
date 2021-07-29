#ifndef _IIC_H
#define _IIC_H


#include "cms.h"

#define SCL_H RC2=1
#define SCL_L RC2=0

#define SDA_H RC1=1
#define SDA_L RC1=0

#define SDA_IN   {TRISC1=1,WPUC1=1;}//;WPUB|=1<<7;}
#define SDA_OUT  TRISC1=0


#define IIC_SDA RC1

void IIC_Init(void);
void IIC_START(void);
void IIC_STOP(void);
unsigned char IIC_Wait_ACK(void);
void IIC_ACK(void);
void IIC_NACK(void);
void I2C_SendByte(unsigned char Data);
unsigned int I2C_ReadByte(unsigned char ack);



#endif



