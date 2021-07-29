#include "iic.h"
#include "cms.h"


void iic_delay_us(unsigned char delay)
{
	while(delay--);
}

void IIC_Init(void)
{
	OPTION_REG &= ~0x80;
//	TRISC&=~(3<<1);
	SDA_H;
	SCL_H;
}


void IIC_START(void)
{
    SDA_OUT;
    SDA_H;
    SCL_H;
    iic_delay_us(1);
    SDA_L; //START:when CLK is high,SDA change from hig to low
    iic_delay_us(1);
    SCL_L; //Ready Transmit or Receive
}


void IIC_STOP(void)
{
    SDA_OUT;
    SDA_L;
    SCL_H; 
    iic_delay_us(1);
    SDA_H; //STOP:when CLK is low,SDA change from low to high
}


unsigned char IIC_Wait_ACK(void)
{
    unsigned char RE = 0;
	SDA_OUT;
	SDA_H;
	SDA_IN;
	
	SCL_L;  
    iic_delay_us(1);
	SCL_H;
	iic_delay_us(1);   
    
   if(IIC_SDA)
   	{
   		RE=1;
   	}
   else
   	{
		RE=0;
   	}
    SCL_L; //Ê±ÖÓÊä³ö0
    return RE;

}

void IIC_ACK(void)
{
    SDA_OUT;
    SDA_L;
    iic_delay_us(1);
    SCL_H;
    iic_delay_us(1);
    SCL_L;
    SDA_H;
}

void IIC_NACK(void)
{
	SDA_H;	/* CPU?y?¡¥SDA = 1 */
	iic_delay_us(1);
	SCL_H;	/* CPU2¨²¨¦¨²1??¨º¡À?¨® */
	iic_delay_us(1);
	SCL_L;
	iic_delay_us(1);	
}




void I2C_SendByte(unsigned char Data)
{
  unsigned char cnt;
  SDA_OUT;
  for(cnt=0; cnt<8; cnt++)
  {

 
    if(Data & 0x80)
    {
      SDA_H;                         
    }
    else
    {
      SDA_L;                         
    }
    Data <<= 1;
    SCL_H;                              
    iic_delay_us(1);
    SCL_L;                              
    iic_delay_us(1);
//    if(cnt==7)SDA_H; 
  }
}


unsigned int I2C_ReadByte(unsigned char ack)
{
  unsigned char cnt;
  unsigned int data;
  SDA_IN;	
	
  for(cnt=0; cnt<8; cnt++)
  {
    SCL_L;                                
    iic_delay_us(1);
		
    SCL_H;                             
    data <<= 1;
    if(IIC_SDA)
    {
      data |= 0x01;                              
    }
     iic_delay_us(1);
  }
  if(ack == 0)
  {
     IIC_NACK();
  }
  else
  {
     IIC_ACK();
  }
  return data;                                  
}







