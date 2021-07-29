#include "cms.h"
#include "delay.h"
#include "rf297l.h"

#define delay_ms(ms) soft_delay_ms(ms)
const unsigned char TX_ADDRESS_DEF[3] = {0xCC,0xCC,0xCC};
const unsigned char RX_ADDRESS_DEF[3] = {0x2D,0xD7,0XB9};
static unsigned char ACK_Payload_length;

unsigned char RF_ReadReg(unsigned char reg_addr);
void RF_WriteReg(unsigned char reg_addr, unsigned char write_data);
void RF_Write_Buff(unsigned char reg_addr,unsigned char *pBuff,unsigned char length);
void RF_Read_Buff(unsigned char reg_addr, unsigned char *pBuff, unsigned char length);
void RF_Set_TxMode(void);
void RF_Set_RxMode(void);
unsigned char RF_GetStatus(void);
void RF_ClearStatus(void);
void RF_ClearFIFO(void);
void RF_SetChannel(unsigned char Channel);
void RF_TxData(unsigned char *payload_buff,unsigned char length);
unsigned char RF_Read_RxData(unsigned char *payload_buff,unsigned char length);
void RF_Init(void);
TX_RESULT_e RF_get_TX_result(void);

static unsigned char SPI_RW(unsigned char read_reg_addr);
static void SPI_init(void);


TX_RESULT_e RF_get_TX_result(void)
{
	unsigned char status = 0;
	status = RF_GetStatus();
	if(status == TX_DS_FLAG){
		return SENT_SUCCESS;
	}else if(status == RX_TX_FLAG){
		return ACK_PAYLOAD_SENT_SUCCESS;
	}else if(MAX_RT_FLAG){
		return SENT_FAILURE;
	}else{
		return UNKNOW_STATUS;
	}
}

void RF_Init(void)
{	
#ifdef	IC_TYPE_MX5325          	  //MX5325配置
	#if(DATA_RATE == DR_1M) 
		const unsigned char  BB_cal_data[]    = {0x0A,0x6D,0x67,0x9C,0x46}; 
		const unsigned char  RF_cal_data[]    = {0xF6,0x37,0x5D};                                      
		const unsigned char  RF_cal2_data[]   = {0x45,0x21,0xeF,0x2c,0x5a,0x40};
		const unsigned char  Dem_cal_data[]   = {0x01};  
		const unsigned char  Dem_cal2_data[]  = {0x0B,0xDF,0x02};   
	#elif(DATA_RATE == DR_250K) 
		const unsigned char   BB_cal_data[]    = {0x12,0xec,0x6f,0xa1,0x46}; 
		const unsigned char   RF_cal_data[]    = {0xf6,0x37,0x5d};
		const unsigned char   RF_cal2_data[]   = {0xd5,0x21,0xeb,0x2c,0x5a,0x40};
		const unsigned char   Dem_cal_data[]   = {0x1F};  
		const unsigned char   Dem_cal2_data[]  = {0x0B,0xDF,0x02};
	#endif
#else			//PAN2416配置			//对应POWER值不一样
	#if(DATA_RATE == DR_1M) 
		const unsigned char  BB_cal_data[]    = {0x0A,0x6D,0x67,0x9C,0x46}; 
		const unsigned char  RF_cal_data[]    = {0x16,0x33,0x27};                      
		const unsigned char  RF_cal2_data[]   = {0x45,0x21,0x3F,0x2D,0x5C,0x40};
		const unsigned char  Dem_cal_data[]   = {0x01};  
		const unsigned char  Dem_cal2_data[]  = {0x0B,0xDF,0x02};   
	#elif(DATA_RATE == DR_250K) 
		const unsigned char   BB_cal_data[]    = {0x12,0xEC,0x6f,0xA9,0x46}; 
		const unsigned char   RF_cal_data[]    = {0x06,0x33,0x00};
		const unsigned char   RF_cal2_data[]   = {0xD5,0x21,0x3B,0x2D,0x5C,0x40};
		const unsigned char   Dem_cal_data[]   = {0x03};  
		const unsigned char   Dem_cal2_data[]  = {0x0B,0xDF,0x02};
	#endif
#endif
    unsigned char feature = 0x00;
    SPI_init();
    RF_WriteReg(RST_FSPI, 0x5A);	//Software Reset    			
    RF_WriteReg(RST_FSPI, 0XA5);
    RF_WriteReg(FLUSH_TX, 0);			// CLEAR TXFIFO		    			 
    RF_WriteReg(FLUSH_RX, 0);			// CLEAR  RXFIFO
    RF_WriteReg(W_REGISTER + STATUS, 0x70);	// CLEAR  STATUS	
    RF_WriteReg(W_REGISTER + EN_RXADDR, 0x01);	// Enable Pipe0
    RF_WriteReg(W_REGISTER + SETUP_AW,  0x01);	// address witdth is 5 bytes
    RF_WriteReg(W_REGISTER + RF_CH, DEFAULT_CHANNEL); // 2478M HZ
    RF_WriteReg(W_REGISTER + RX_PW_P0, PAYLOAD_WIDTH);// PAYLOAD_WIDTH bytes
    RF_Write_Buff(W_REGISTER + TX_ADDR, TX_ADDRESS_DEF, sizeof(TX_ADDRESS_DEF));	// Writes TX_Address to PN006
    RF_Write_Buff(W_REGISTER + RX_ADDR_P0,RX_ADDRESS_DEF, sizeof(RX_ADDRESS_DEF));	// RX_Addr0 same as TX_Adr for Auto.Ack   
    RF_Write_Buff(W_REGISTER + BB_CAL,    BB_cal_data,  sizeof(BB_cal_data));
    RF_Write_Buff(W_REGISTER + RF_CAL2,   RF_cal2_data, sizeof(RF_cal2_data));
    RF_Write_Buff(W_REGISTER + DEM_CAL,   Dem_cal_data, sizeof(Dem_cal_data));
    RF_Write_Buff(W_REGISTER + RF_CAL,    RF_cal_data,  sizeof(RF_cal_data));
    RF_Write_Buff(W_REGISTER + DEM_CAL2,  Dem_cal2_data,sizeof(Dem_cal2_data));
    RF_WriteReg(W_REGISTER + DYNPD, 0x00);					                            
    RF_WriteReg(W_REGISTER + RF_SETUP, RF_POWER);						// 		
    RF_WriteReg(ACTIVATE, 0x73);
    
	#if(TRANSMIT_TYPE == TRANS_ENHANCE_MODE)      	//双向
		RF_WriteReg(W_REGISTER + SETUP_RETR,0x01);							//  1 retrans... 	
		RF_WriteReg(W_REGISTER + EN_AA,     0x01);							// Enable Auto.Ack:Pipe0  	
	#elif(TRANSMIT_TYPE == TRANS_BURST_MODE)        //单向                                                      
		RF_WriteReg(W_REGISTER + SETUP_RETR,0x00);							// Disable retrans... 	
		RF_WriteReg(W_REGISTER + EN_AA,     0x00);							// Disable AutoAck 
	#endif

	#if(EN_DYNPLOAD == 1)		//使能动态PAYLOAD长度
		feature |= 0x04;
		RF_WriteReg(W_REGISTER + DYNPD, 0x01);
	#endif

	#if(EN_ACK_PAYLOAD == 1)	//使能ACK_PAYLOAD
		feature |= 0x02;
	#endif
	if(PAYLOAD_WIDTH >32){
		feature |= 0x18;
	}
	//feature |= 0x20 ; //ce order by mcu not pin
	RF_WriteReg(W_REGISTER + FEATURE, feature);
}


/******************************************************************************/
//            RF_RxData普通模式下
//            读出接收到的数据：
//            参数：
//              1. payload_buff：存储读取到的数据的Buffer
//              2. length:    读取的数据长度
//              Return:
//              1. 0: 没有接收到数据
//              2. 1: 读取接收到的数据成功
//              note: Only use in Rx Mode
//              length 通常等于 PAYLOAD_WIDTH
/******************************************************************************/
unsigned char RF_RxData(unsigned char *payload_buff,unsigned char length)
{ 
    if(!(RF_GetStatus() & RX_DR_FLAG))
    {
      return 0;                                                                 		
    }
	RF_Read_Buff(R_RX_PAYLOAD, payload_buff, length);
	
	RF_ClearFIFO();
	RF_ClearStatus();
    return 1;
}

/******************************************************************************/
//            RF_ENHANCE_RxData增强模式下
//            读出接收到的数据：
//            参数：
//              1. payload_buff：存储读取到的数据的Buffer
//              2. length:    读取的数据长度
//              3. postback_buff :发送回传数据给发送端
//              Return:
//              1. 0: 没有接收到数据
//              2. 1: 读取接收到的数据成功
//              note: Only use in Rx Mode
//              length 通常等于 PAYLOAD_WIDTH
/******************************************************************************/
unsigned char RF_ENHANCE_RxData(unsigned char *payload_buff,unsigned char length,unsigned char *postback_buff)
{ 
    if(!(RF_GetStatus() & RX_DR_FLAG))
    {
      return 0;                                                                 		
    }
	#if	(TRANSMIT_TYPE == TRANS_ENHANCE_MODE)			//ACK_PAYLOAD模式
	RF_Write_Buff(W_ACK_PAYLOAD, postback_buff, ACK_PAYLOAD_WIDTH);
	delay_ms(2);
	//读动态RX接收数据宽度 ，要使能动态功能1D 动态长度1C，要打开ACK   
	RF_Read_Buff(R_RX_PAYLOAD, payload_buff, length);  
	
	#else
	RF_Read_Buff(R_RX_PAYLOAD, payload_buff, length);
	#endif       //将接收到的数据读出到ucPayload，且清除rxfifo
	
	RF_ClearFIFO();
	RF_ClearStatus();
    return 1;
}
/******************************************************************************/
//           普通模式下 发送数据：
//            参数：
//              1. payload_buff：需要发送的数据首地址
//              2. length:  需要发送的数据长度
//              Return:
//              1. MAX_RT: TX Failure  (Enhance mode)
//              2. TX_DS:  TX Successful (Enhance mode)
//              note: Only use in Tx Mode
//              length 通常等于 PAYLOAD_WIDTH
//            发送结果
//            参数：只在增强模式下，使能ack带Payload有效
//                  1、ucAckPayload: AckPayload的首地址
//                  2、length：AckPayload的长度
/******************************************************************************/
void RF_TxData(unsigned char *payload_buff,unsigned char length)
{
	unsigned char ret;
    RF_Write_Buff(W_TX_PAYLOAD, payload_buff, length);                               		//write data to txfifo                                                                      		//rf entery tx mode start send data                                                                       		//rf entery stb3
    delay_ms(3);
	
	RF_ClearFIFO();
	RF_ClearStatus();
}

/******************************************************************************/
//            增强模式下发送数据：
//            参数：
//              1. payload_buff：需要发送的数据首地址
//              2. length:  需要发送的数据长度
//              3. postback_buff：接收由接收端回传的数据
//              Return:
//              1. MAX_RT: TX Failure  (Enhance mode)
//              2. TX_DS:  TX Successful (Enhance mode)
//              note: Only use in Tx Mode
//              length 通常等于 PAYLOAD_WIDTH
//            发送结果
//            参数：只在增强模式下，使能ack带Payload有效
//                  1、ucAckPayload: AckPayload的首地址
//                  2、length：AckPayload的长度
/******************************************************************************/
void RF_ENHANCE_TxData(unsigned char *payload_buff,unsigned char length,unsigned char *postback_buff)
{
	unsigned char ret;
    RF_Write_Buff(W_TX_PAYLOAD, payload_buff, length);                               		//write data to txfifo                                                                      		//rf entery tx mode start send data                                                                       		//rf entery stb3
    delay_ms(2);
	#if	(TRANSMIT_TYPE == TRANS_ENHANCE_MODE)			//ACK_PAYLOAD模式
	ret = RF_GetStatus();
	if(RF_GetStatus() == RX_TX_FLAG)
	{
		RF_Read_Buff(R_RX_PAYLOAD,postback_buff,ACK_PAYLOAD_WIDTH);//payload_buff把接收到数据再发送过去 feedback_buff 
	}
	#endif       //将接收到的数据读出到ucPayload，且清除rxfifo
	
	RF_ClearFIFO();
	RF_ClearStatus();
}

void RF_SetChannel(unsigned char Channel)
{    
    RF_WriteReg(W_REGISTER + RF_CH, Channel);
}

void RF_ClearFIFO(void)
{
    RF_WriteReg(FLUSH_TX, 0);			                                		//清除RF 的 TX FIFO		
    RF_WriteReg(FLUSH_RX, 0);                                                   		//清除RF 的 RX FIFO	
}

void RF_ClearStatus(void)
{
    RF_WriteReg(W_REGISTER + STATUS,0x70);							//清除RF的IRQ标志 
}

unsigned char RF_GetStatus(void)
{
    return RF_ReadReg(STATUS)&0x70;		//读取RF的状态 
}

void RF_Set_TxMode(void)
{
    RF_WriteReg(W_REGISTER + CONFIG,  0X8E);							// 将RF设置成TX模式
    delay_ms(10);   
    CE_HIGH;	
    delay_ms(10);
}

void RF_Set_RxMode(void)
{
    RF_WriteReg(W_REGISTER + CONFIG,  0X87);							// 将RF设置成TX模式
    delay_ms(10);   
    CE_HIGH;	
    delay_ms(10);
}

void RF_Read_Buff(unsigned char reg_addr, unsigned char *pBuff, unsigned char length)
{
    unsigned char byte_ctr;
    CSN_LOW;                    		                               			
    SPI_RW(reg_addr);       		                                                		
    for(byte_ctr=0;byte_ctr<length;byte_ctr++){
    	pBuff[byte_ctr] = SPI_RW(0);         
	}                                        		
    CSN_HIGH;                                                                   		
}

void RF_Write_Buff(unsigned char reg_addr,unsigned char *pBuff,unsigned char length)
{
    unsigned char i;
    CSN_LOW;
    SPI_RW(reg_addr);
    for(i=0;i<length;i++)
    {
        SPI_RW(pBuff[i]);
    }
    CSN_HIGH;
}

void RF_WriteReg(unsigned char reg_addr, unsigned char write_data)
{
    CSN_LOW;
    SPI_RW(reg_addr);
    SPI_RW(write_data);
    CSN_HIGH;
}

unsigned char RF_ReadReg(unsigned char reg_addr)
{
	unsigned char tmp;
    CSN_LOW;
    SPI_RW(reg_addr);
    tmp = SPI_RW(0);
    CSN_HIGH;
    return tmp;
}

static void SPI_init(void)
{
	
	SPI_CSN_IO =0;	
	SPI_SCK_IO=0;	
	SPI_MOSI_IO=0;	
	SPI_CE_IO = 0;

	SPI_IRQ_IO = 1;
	SPI_MISO_IO=1;
}

/******************************************************************************
* SPI写入一个BYTE的同时，读出一个BYTE返回
******************************************************************************/
static unsigned char SPI_RW(unsigned char read_reg_addr)
{
    unsigned char i;
    for(i = 0; i < 8; i++)
    {
        SCK_LOW;
        if(read_reg_addr & 0x80)
        {
            MOSI_HIGH;
        }
        else
        {
            MOSI_LOW;
        }
        read_reg_addr = read_reg_addr << 1;
        SCK_HIGH;
        if( MISO )
        {
          read_reg_addr = read_reg_addr | 0x01;
        }
    }
    SCK_LOW;
    return read_reg_addr;
}

/******************************************************************************/
//            		进入RF休眠模式
/******************************************************************************/
void RF_Sleep()
{
	unsigned char reg_config;
	reg_config = RF_ReadReg(CONFIG);
	RF_WriteReg(W_REGISTER + CONFIG, reg_config & (~(0x02))); 
	CE_LOW;
}


/******************************************************************************/
//            		从RF休眠模式中唤醒
/******************************************************************************/
void RF_awaken()
{
	unsigned char reg_config;
	reg_config = RF_ReadReg(CONFIG);
	RF_WriteReg(W_REGISTER + CONFIG, reg_config | 0x02); 
	CE_HIGH;
	delay_ms(7);
}

/******************************************************************************/
//            		进入载波模式
/******************************************************************************/
void RF_Carrier(unsigned char Channel)
{
    const unsigned char  BB_cal_data[]    = {0x0A,0x6D,0x67,0x9C,0x46};
    const unsigned char  RF_cal_data[]    = {0x16,0x33,0x27};                                       
    const unsigned char  RF_cal2_data[]   = {0x45,0x21,0x3F,0x2D,0x5C,0x40};
    const unsigned char  Dem_cal_data[]   = {0xE1};
    const unsigned char  Dem_cal2_data[]  = {0x0B,0xDF,0x02};
    CE_LOW;
    delay_ms(1);				 						                    //delay 500us
    RF_WriteReg(W_REGISTER + CONFIG, 0X8e);        					         	//tx mode 
    RF_WriteReg(W_REGISTER + RF_CH, Channel);						        //单载波频点	   
    RF_WriteReg(W_REGISTER + RF_SETUP, RF_POWER);      					     	//dbm
    RF_Write_Buff(W_REGISTER + BB_CAL,    BB_cal_data,  sizeof(BB_cal_data));
    RF_Write_Buff(W_REGISTER + RF_CAL2,   RF_cal2_data, sizeof(RF_cal2_data));
    RF_Write_Buff(W_REGISTER + DEM_CAL,   Dem_cal_data, sizeof(Dem_cal_data));
    RF_Write_Buff(W_REGISTER + RF_CAL,    RF_cal_data,  sizeof(RF_cal_data));
    RF_Write_Buff(W_REGISTER + DEM_CAL2,  Dem_cal2_data,sizeof(Dem_cal2_data));
    delay_ms(1);
}


