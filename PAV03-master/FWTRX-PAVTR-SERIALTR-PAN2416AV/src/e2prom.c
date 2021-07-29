#include "cms.h"
#include "iic.h"
#include "e2prom.h"
#include "delay.h"



void AT24C02_Write_Byte(unsigned char addr ,unsigned char data)
{
	IIC_START();
	I2C_SendByte(0XA0);	 
	IIC_Wait_ACK(); 
	I2C_SendByte(addr);
	IIC_Wait_ACK(); 
	I2C_SendByte(data);
	IIC_Wait_ACK(); 
	IIC_STOP();	
}

unsigned char AT24C02_Read_Byte(unsigned char addr)
{
	unsigned char temp = 0;		  	    																 
   	IIC_START();

	I2C_SendByte(0XA0);	   		
	IIC_Wait_ACK();
	I2C_SendByte(addr);			    	 	   
	IIC_Wait_ACK(); 
//  I2C_SendByte(addr%256);   		
//	IIC_Wait_ACK();	    
	IIC_START(); 	 	   
	I2C_SendByte(0XA1);           				   
	IIC_Wait_ACK();	 
	temp = I2C_ReadByte(1);		   
   	IIC_STOP();								   
	
	return temp;
}

void AT24C02_Write_Msg(unsigned char addr ,unsigned char *data,unsigned char len)
{
	unsigned char i=0;
	for(i=0;i<len;i++)
	{
	AT24C02_Write_Byte(addr,data[i]);
	addr++;
	soft_delay_ms(5);
	}
}


void AT24C02_Read_Msg(unsigned char addr,unsigned char *data,unsigned char len)
{
	unsigned char i=0;
	for(i=0;i<len;i++)
	{
	data[i]=AT24C02_Read_Byte(addr);
	addr++;
	soft_delay_ms(1);
	}
}







