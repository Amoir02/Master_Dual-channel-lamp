#include 	"24lc02.h"
#include "WDT.h"

#include "cms.h"
#include "system.h"
#include "cUART.h"
#include "I2C_Base.h"
#include "iic.h"


#define EEPROM_ADDs_Base    0x50 
#define EEPROM_BlockLen  	  8  //EEPROM内部块写最大缓存，24LC02为8字节


/******************测试方法如下**************************

for(k=0;k<256;k++) buf[k]=k;
if(EEPROM_SendString_Any(0,256,buf)){lcd_ShowAscii_much("SendString_Fail||",0,40); while(1);}

for(k=0;k<256;k++) buf[k]=0;
if(EEPROM_ReceString(0,256,buf)) { lcd_ShowAscii_much("ReceString_Fail||",0,60);while(1);}

for(k=0;k<256;k++)
{
if(buf[k]!=(uchar)(k&0x00ff)) {lcd_ShowAscii_much("CRC_Fail||",0,80);USART1_TxDat(k<<8);  USART1_TxDat(k); while(1);}
}

**********************************************/


//返回0则空闲，1正在写
uchar EEPROM_CheckBusy(void)
{
return(IIC_CheckBusy(EEPROM_ADDs_Base));
}


uchar EEPROM_SendByte(uchar REGadds,uchar Wdat)   //写器件数据
{
	uchar cnt=0;
	
	uchar i=IIC_SendByte(EEPROM_ADDs_Base|(REGadds>>8),REGadds,Wdat);
	if(i) return(i);
	
	while(EEPROM_CheckBusy())
	{
		if(cnt++>250){i=0xee; break;}
	}//等待空闲
	
	return(i);
}

uchar EEPROM_ReceByte(uchar REGadds,uchar *Rdat)   //读器件数据
{
return(IIC_ReceByte(1,EEPROM_ADDs_Base|(REGadds>>8),REGadds,Rdat));
}

/*
uchar EEPROM_ReceString(usint Reg_Adds,usint R_LEN,uchar *buf)
{
return(IIC_ReceString(EEPROM_ADDs_Base|(Reg_Adds>>8),Reg_Adds,R_LEN,buf));
}
*/



/*
返回0，设备OK
*/
uchar EEPROM_Init(uchar SPD_I2C)
{

IIC_Init(SPD_I2C); 
return(0);
}



//-----------------------------------------------------------------



#define EEPROOM_Adds_ADDCfg		4
#define EEPROOM_Adds_ONOFFStep	6  //通讯地址保存的起始地址 5个字节
#define EEPROOM_Adds_RFAdd		8  //通讯地址保存的起始地址 5个字节
#define EEPROOM_Adds_RFAdd1	  20	//通讯地址保存的起始地址 4个字节
#define EP_ADDCfgByte		0xE5

uchar EP_BP=0;

//返回1：已经配对过了，使用非公地址
uchar EP_IsADDCfg(void)
{
	EEPROM_ReceByte(EEPROOM_Adds_ADDCfg,&EP_BP);
	WDT_clear();
	
	if(EP_BP==EP_ADDCfgByte) return 1; else return 0;
}


//ID=0：清除已经有的配对标志字节
//ID=1：增加配对标志字节
uchar EP_SetADDCfg(uchar ID)
{
	if(ID) EP_BP=EP_ADDCfgByte; else EP_BP=0;

	WDT_clear();
	EEPROM_SendByte(EEPROOM_Adds_ADDCfg,EP_BP);	
	return 0;
}



//获取通信地址5字节到OutP
uchar EP_GetONOFFStep(void)
{
	EEPROM_ReceByte(EEPROOM_Adds_ONOFFStep,&EP_BP);
	WDT_clear();
	return EP_BP;
}

void EP_SetONOFFStep(uchar D)
{
		EEPROM_SendByte(EEPROOM_Adds_ONOFFStep,D);
		WDT_clear();
}



//获取通信地址5字节到OutP
void EP_GetRFAdd(uchar * OutP)
{
	uchar i=0;
	for(i=0;i<5;i++)
	{
		WDT_clear();
		EEPROM_ReceByte(EEPROOM_Adds_RFAdd+i,&OutP[i]);
		
	}
	WDT_clear();
}


//设置通信地址5字节到OutP
void EP_SetRFAdd(uchar * InP)
{
	uchar i=0;
	for(i=0;i<5;i++)
	{
		WDT_clear();
		EEPROM_SendByte(EEPROOM_Adds_RFAdd+i,InP[i]);
	}
	WDT_clear();
}

void AT24C02_Write_Byte1(unsigned char addr ,unsigned char data)
{
	IIC_START1();
	I2C_SendByte1(0XA0);	 
	IIC_Wait_ACK1(); 
	I2C_SendByte1(addr);
	IIC_Wait_ACK1(); 
	I2C_SendByte1(data);
	IIC_Wait_ACK1(); 
	IIC_STOP1();	
}

unsigned char AT24C02_Read_Byte1(unsigned char addr)
{
	unsigned char temp = 0;		  	    																 
   	IIC_START1();

	I2C_SendByte1(0XA0);	   		
	IIC_Wait_ACK1();
	I2C_SendByte1(addr);			    	 	   
	IIC_Wait_ACK1(); 
    
	IIC_START1(); 	 	   
	I2C_SendByte1(0XA1);           				   
	IIC_Wait_ACK1();	 
	temp = I2C_ReadByte1(1);		   
   	IIC_STOP1();								   
	
	return temp;
}


//设置APP通信地址4字节到OutP
void AT24C02_Write_Msg(unsigned char addr ,unsigned char *data,unsigned char len)
{
	unsigned char i=0;
	for(i=0;i<len;i++)
	{
		WDT_clear();
		AT24C02_Write_Byte1(addr,data[i]);
		addr++;
		WDT_clear();
		soft_delay_ms(5);
	}
	WDT_clear();
}

void AT24C02_Read_Msg(unsigned char addr,unsigned char *data,unsigned char len)
{
	unsigned char i=0;
	for(i=0;i<len;i++)
	{
		WDT_clear();
		data[i] = AT24C02_Read_Byte1(addr);
		addr++;
		WDT_clear();
		soft_delay_ms(1);
	}
	WDT_clear();
}






