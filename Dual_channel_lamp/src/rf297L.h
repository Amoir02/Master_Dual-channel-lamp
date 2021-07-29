#ifndef _RF297L_H_
#define _RF297L_H_
#include "rf297L_config.h"


#define CE			RA7 				//IO口寄存器定义
#define CSN			RE2	
#define SCK			RE1	
#define MOSI		RA5	
#define MISO     	RA4
#define IRQ			RA3

#define	SPI_CSN_IO	TRISE2          //IO口方向寄存器定义 
#define	SPI_SCK_IO	TRISE1
#define	SPI_MOSI_IO	TRISA5
#define	SPI_MISO_IO TRISA4
#define	SPI_IRQ_IO	TRISA3
#define	SPI_CE_IO	TRISA7

#define	CSN_HIGH	CSN=1
#define	CSN_LOW		CSN=0
#define	SCK_HIGH	SCK=1
#define	SCK_LOW		SCK=0
#define	MOSI_HIGH	MOSI=1
#define	MOSI_LOW	MOSI=0
#define	CE_HIGH		RA7=1
#define	CE_LOW		RA7=0
#define	MISO_STATUS	MISO


//#define 		IC_TYPE_MX5325	



#define	DEFAULT_CHANNEL	103				   //初始化时的频率： 2400+DEFAULT_CHANNEL MHz           
#define	PAYLOAD_WIDTH	8				   //Payload宽度：    			
#define	TRANSMIT_TYPE	TRANS_ENHANCE_MODE //TRANS_BURST_MODE    TRANS_ENHANCE_MODE
#define	DATA_RATE		DR_1M              //通信速率2Mbps     DR_250K       DR_2M    DR_1M
#define	RF_POWER		(RF5dBm |DATA_RATE)//发射功率 
#define	ACK_PAYLOAD_WIDTH	8																
														 
#if(TRANSMIT_TYPE == TRANS_ENHANCE_MODE)		//使能ACK
//#if(TRANSMIT_TYPE == TRANS_ENHANCE_MODE)		//单向模式
	#define	EN_DYNPLOAD			0	//使能动态Payload长度
	#define	EN_ACK_PAYLOAD		1	//使能ACK Payload
#endif

#ifdef	IC_TYPE_MX5325				//MX5325功率配置
	#define	RF13dBm		0x3f  	// 13dBm 
	#define	RF10dBm		0X17	// 10dBm 
	#define	RF8dBm		0x15	// 8dbm      
	#define	RF7dBm		0x07	// 7dbm   
	#define	RF5dBm		0x2c	// 5dbm   
	#define	RF4dBm		0x06	// 4dbm   
	#define	RF2dBm		0x05	// 2dbm  
	#define	RF0dBm		0X0B	// 0dBm  
	#define	RF_3dBm		0x04	// -3dBm     
	#define	RF_6dBm		0x0A	// -6dBm 
	#define	RF_10dBm	0x02	// -10dBm 
	#define	RF_18dBm	0x01	// -18dBm 
	#define	RF_30dBm	0x00	// -30dBm 
#else	//PAN2416功率配置
	#define	RF9dBm		0x37         
	#define	RF8dBm		0X2E                           
	#define	RF7dBm		0x1e 
	#define	RF6dBm		0x16                
	#define	RF5dBm		0x0e   
	#define	RF2dBm		0x06  
	#define	RF1dBm		0x0c  
	#define	RF0dBm		0x04    
	#define	RF_3dBm		0x0B                            // -3dBm     
	#define	RF_5dBm		0x03                            // -6dBm 
	#define	RF_10dBm	0x12                            // -10dBm 
	#define	RF_25dBm	0x29                            // -18dBm 
	#define	RF_35dBm	0x30
#endif


typedef enum{
	UNKNOW_STATUS,		//芯片异常
	SENT_SUCCESS,		//单向模式发送完成或ACK模式发送成功
	ACK_PAYLOAD_SENT_SUCCESS,	//ACK_PAYLOAD模式发送成功
	SENT_FAILURE,		//发送失败
}TX_RESULT_e;

extern unsigned char RF_ReadReg(unsigned char reg_addr);
extern void RF_WriteReg(unsigned char reg_addr, unsigned char write_data);
extern void RF_Write_Buff(unsigned char reg_addr,unsigned char *pBuff,unsigned char length);
extern void RF_Read_Buff(unsigned char reg_addr, unsigned char *pBuff, unsigned char length);
extern void RF_Set_RxMode(void);
extern unsigned char RF_GetStatus(void);
extern void RF_ClearStatus(void);
extern void RF_ClearFIFO(void);
extern void RF_SetChannel(unsigned char Channel);
extern void RF_TxData(unsigned char *payload_buff,unsigned char length);//增强模式接收
extern unsigned char  RF_ENHANCE_TxData(unsigned char *payload_buff,unsigned char length,unsigned char *postback_buff);//增强模式下发送
extern unsigned char RF_RxData(unsigned char *payload_buff,unsigned char length);//普通模式下接收
extern unsigned char RF_ENHANCE_RxData(unsigned char *payload_buff,unsigned char length,unsigned char *postback_buff);//增强模式接收

extern void RF_Init(void);
extern TX_RESULT_e RF_get_TX_result(void);
void RF_ADDSSet(unsigned char *Buf);

void RF_Init3(void);
void RF_Init4(void);
void RF_Set_RxMode1(void);

#endif







