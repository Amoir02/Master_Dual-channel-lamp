#include "ble.h"
#include "cms.h"
#include <string.h>
#include "user_ble.h"



const uint8_t ble_access_addr[4]={0xD6,0xBe,0x89,0x8E};
const uint8_t ble_adv_addr[6]={0x11,0x22,0x33,0x44,0x55,0x66};
const uint8_t adv_data_type[3]={0x02,0x01,0x02};
const uint8_t Fixed[6]={0xEE,0x1B,0xC8,0x78,0xF6,0x4A};
const uint8_t Version=0x02;
const uint8_t test_id[4]={0x11,0x22,0x33,0x44};

const unsigned char crc_lab[16]={0x41,0x92,0x53,0x2A,0xFC,0xAB,0xCE,0x26,0x0D,0x1E,0x99,0x78,0x00,0x22,0x99,0xDE};
const unsigned char crc_2_4G_lib[21]={0xc7 ,0x8d ,0xd2 ,0x57 ,0xa1 ,0x3d ,0xa7 ,0x66 ,0xb0 ,0x75 ,0x31 ,0x11 ,0x48 ,0x96 ,0x77 ,0xf8 ,0xe3 ,0x46 ,0xe9,0xab ,0xd0 };
const unsigned char crc_ble_38[42]={
		0xD6, 0xC5, 0x44, 0x20, 0x59,
		0xDE, 0xE1, 0x8F, 0x1B, 0xA5,
		0xAF, 0x42, 0x7B, 0x4E, 0xCD,
		0x60, 0xEB, 0x62, 0x22, 0x90,
		0x2C, 0xEF, 0xF0, 0xC7, 0x8D,
		0xD2, 0x57, 0xA1, 0x3D, 0xA7,
		0x66, 0xB0, 0x75, 0x31, 0x11,
		0x48, 0x96, 0x77 ,0xF8, 0xE3,
		0x46, 0xE9
};

uint8_t BLE_Data[47];


void ble_data_init(void)
{

	BLE_Data[0]= 0xAA;  //Preamble
	
	BLE_Data[1]= ble_access_addr[0]; 
	BLE_Data[2]= ble_access_addr[1]; 
	BLE_Data[3]= ble_access_addr[2]; 
	BLE_Data[4]= ble_access_addr[3]; //Access Address

	BLE_Data[5]=0x42;
	BLE_Data[6]=37; //Header
	
	BLE_Data[7]=ble_adv_addr[0];
	BLE_Data[8]=ble_adv_addr[1];
	BLE_Data[9]=ble_adv_addr[2];
	BLE_Data[10]=ble_adv_addr[3];
	BLE_Data[11]=ble_adv_addr[4];
	BLE_Data[12]=ble_adv_addr[5];
	
	BLE_Data[13]=0x02;
	BLE_Data[14]=0X01;
	BLE_Data[15]=0X02; //AD Structure 1
	
	BLE_Data[16]=0X1B; //LEN
	BLE_Data[17]=0X05;//AD_TYPE
	
	BLE_Data[18]=0XFF;
	BLE_Data[19]=0XFF;//COMP ID
	
	BLE_Data[20]=0xEE;
	BLE_Data[21]=0X1B;
	BLE_Data[22]=0XC8;
	BLE_Data[23]=0X78;
	BLE_Data[24]=0XF6;
	BLE_Data[25]=0X4A; //FIXED
	
	BLE_Data[26]=0X05 ;//TYPE
	BLE_Data[27]=Version;//Version
	BLE_Data[28]=0;//count
	
	BLE_Data[29]=test_id[0];
	BLE_Data[30]=test_id[1];
	BLE_Data[31]=test_id[2];
	BLE_Data[32]=test_id[3]; // 2_4G addr

	BLE_Data[33]=0x01;//Group

	BLE_Data[34]=0x10;//CMD

	BLE_Data[35]=0;
	BLE_Data[36]=0;
	BLE_Data[37]=0; //Para
	
	BLE_Data[38]=0;
	BLE_Data[39]=0;
	BLE_Data[40]=0;//RFU
	
	BLE_Data[41]=0;//Rand

	BLE_Data[42]=0;
	BLE_Data[43]=0; //CRC16
	
	
	BLE_Data[44]=0;
	BLE_Data[45]=0;
	BLE_Data[46]=0; //BLE CRC24

}





uint16_t UpdateCRC(unsigned char *CRC_input, unsigned int len)
{
    unsigned char i,k = 0; 
    unsigned short CRC_acc=0x5555;
    #define POLY_  0x1021
    while (len--)
    {
        CRC_acc = CRC_acc ^ (CRC_input[k++] << 8);
        
        for (i = 0; i < 8; i++)
        {
            if ((CRC_acc & 0x8000) == 0x8000)
            {
                CRC_acc = CRC_acc << 1;
                CRC_acc ^= POLY_;
            }
            else
            {
                CRC_acc = CRC_acc << 1;
            }
        }
    }
    return CRC_acc;
}







void data_send(uint8_t *Para,uint8_t count)
{
	uint16_t crc16=0;
	uint32_t crc24=0;
	uint8_t i=0;
	ble_data_init();
	BLE_Data[41]=rand();
	
	BLE_Data[35]=Para[0];
	BLE_Data[36]=Para[1];
	BLE_Data[37]=Para[2]; //Para
	
	BLE_Data[28] = count;


	crc16=UpdateCRC(&BLE_Data[26],16);
	BLE_Data[42]=crc16&0xff;
	BLE_Data[43]=((crc16>>8)&0xff); //CRC16

	for(i=0;i<8;i++)
		{
			BLE_Data[33+i]^=BLE_Data[41];
		}
	

	for(i=0;i<16;i++)
		{
			BLE_Data[26+i]^= crc_lab[i];
		}
	

	crc24=check_crc24(&BLE_Data[5],39);
	BLE_Data[44] = crc24;
	BLE_Data[45] = crc24 >> 8;
	BLE_Data[46] = crc24 >> 16;
	
	for ( i = 0; i < 42; i++)
	{
		BLE_Data[5 + i] ^= crc_ble_38[i];
	}

	for(i=0;i<10;i++)
	{
		RF_TxData(BLE_Data,47);
	}
	
}

