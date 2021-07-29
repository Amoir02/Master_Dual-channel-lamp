#ifndef _IIC_H
#define _IIC_H


#include "cms.h"

#if 0

#define SCL_H RC2=1
#define SCL_L RC2=0

#define SDA_H RC1=1
#define SDA_L RC1=0

#define SDA_IN   {TRISC1=1,WPUC1=1;}//;WPUB|=1<<7;}
#define SDA_OUT  TRISC1=0


#define IIC_SDA RC1

#else

#define SCL_H RB7=1//RB4=1//{TRISB4=0,RB4=1;}
#define SCL_L RB7=0//RB4=0//{TRISB4=0,RB4=0;}

#define SDA_H RB6=1//RB2=1
#define SDA_L RB6=0//RB2=0

#define SDA_IN   {TRISB6=1,WPUB6=1;}//;WPUB|=1<<7;}
#define SDA_OUT  TRISB6=0


#define IIC_SDA RB6

#endif


void IIC_Init1(void);
void IIC_START1(void);
void IIC_STOP1(void);
unsigned char IIC_Wait_ACK1(void);
void IIC_ACK1(void);
void IIC_NACK1(void);
void I2C_SendByte1(unsigned char Data);
unsigned int I2C_ReadByte1(unsigned char ack);



#endif



