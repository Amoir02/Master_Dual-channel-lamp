#ifndef _RF297L_CONFIG_H__
#define _RF297L_CONFIG_H__


/********************SPI  REGISTER  ********************/
#define	R_REGISTER			0x00	//SPI read RF data
#define	W_REGISTER			0x20	//SPI write RF data
#define	R_RX_PAYLOAD		0x61	//Read RX Payload
#define	W_TX_PAYLOAD		0xA0	//Write TX Payload
#define	FLUSH_TX			0xE1	//Flush RX FIFO
#define	FLUSH_RX			0xE2	//Flush TX FIFO
#define	REUSE_TX_PL			0xE3	//Reuse TX Payload
#define	ACTIVATE			0x50	//ACTIVATE
#define	DEACTIVATE			0x50	//DEACTIVATE
#define	R_RX_PL_WID			0x60	//Read width of RX data 
#define	W_ACK_PAYLOAD		0xA8	//Data with ACK
#define	W_TX_PAYLOAD_NOACK	0xB0	//TX Payload no ACK Request
#define	CE_FSPI_ON	        0xFD	// CE HIGH
#define	CE_FSPI_OFF	        0xFC	// CE LOW
#define	RST_FSPI	        0x53	// RESET
#define	NOP_N				0xFF
             
/******************CONTROL  REGISTER*******************/
#define		CONFIG              0x00            
#define		EN_AA				0x01
#define		EN_RXADDR			0x02
#define		SETUP_AW			0x03
#define		SETUP_RETR			0x04
#define		RF_CH				0x05
#define		RF_SETUP			0x06
#define		STATUS				0x07
#define		OBSERVE_TX			0x08
#define		RPD			        0x09
#define		RX_ADDR_P0			0x0A
#define		RX_ADDR_P1			0x0B
#define		RX_ADDR_P2			0x0C
#define		RX_ADDR_P3			0x0D
#define		RX_ADDR_P4			0x0E
#define		RX_ADDR_P5			0x0F
#define		TX_ADDR				0x10
#define		RX_PW_P0			0x11
#define		RX_PW_P1			0x12
#define		RX_PW_P2			0x13
#define		RX_PW_P3			0x14
#define		RX_PW_P4			0x15
#define		RX_PW_P5			0x16
#define		FIFO_STATUS			0x17
#define		DEM_CAL				0x19
#define     RF_CAL2				0x1A
#define     DEM_CAL2			0x1B
#define		DYNPD				0x1C
#define		FEATURE				0x1D	
#define		RF_CAL				0x1E
#define		BB_CAL				0x1F

/////////////////////////////////////////////////////////////////////////////////////
/*************************CONTROL CMD****************************************/
#define	RX_DR_FLAG	0X40	// 接收中断标志位
#define	TX_DS_FLAG	0X20	// 发送完成中断标志位
#define	RX_TX_FLAG	0X60	// 发送接收完成中断标志位，ack_payload 模式下使用
#define	MAX_RT_FLAG	0X10	// 发送重传超时中断标志位


#define	DR_1M	0X00	//通信速率 1Mbps
#define	DR_2M	0X40	//通信速率 2Mbps
#define	DR_250K	0XC0	//通信速率 2Mbps

#define	TRANS_ENHANCE_MODE    1	//传输类型增强型
#define	TRANS_BURST_MODE      2    

#endif
