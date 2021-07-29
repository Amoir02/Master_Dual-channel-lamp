#include "I2C_Base.h"
#include "cms.h"
#include "system.h"
#include "cUART.h"



uchar Dtime=0;

/*
���ܣ�I2Cר����ʱ�����ΪIIC_Dtime
*/
IIC_delay(uchar DLAtime)
{
uchar j;
for(j=0;j<DLAtime;j++);
}


/*
IIC��ʼ������
��ڣ�freq,Ƶ�ʣ���λΪKHZ
���ڣ���
*/
void IIC_Init(uchar freq)
{
//-------������ʱ����-------
Dtime=freq;  //Ϊ��������ʱʱ�䣬��λ0.125US
IIC_SCL_outmode;

//IIC_SDA_outmode; 
IIC_SDA_inmode;//pan
IIC_SCL_output=1;
IIC_delay(10);
IIC_SDA_outmode;
IIC_SDA_output=1;
IIC_delay(10);
}


/*
���ܣ�������ʼ�źţ�
���أ�
0�������źŷ���OK
1�������źŷ���ʧ��.һ�����ɴӻ�������SDA�����
*/
uchar IIC_start(void)
{
uchar k=0;
//ulong j=0;


IIC_SCL_output=0; 

IIC_SDA_outmode; //pan�¼ӣ�����
IIC_SDA_output=1; IIC_delay(Dtime/2);

IIC_SCL_output=1; IIC_delay(Dtime/2);
//do{k=IIC_SCL_input;if(j++>200000) return(1);}while(k==0); //��ʼ�ź�ʧ�ܣ���ʱ��
IIC_delay(Dtime/2);
IIC_SDA_output=0; IIC_delay(Dtime);
return(0);
}
	 
/*
���ܣ����������źţ�
���أ�
0�������źŷ���OK
1�������źŷ���ʧ��.һ�����ɴӻ�������SDA�����
*/
uchar IIC_stop(void)
{
uchar k=0;
//ulong j=0;
IIC_SCL_output=0; IIC_delay(Dtime/2);

IIC_SDA_outmode; //pan�¼ӣ�����
IIC_SDA_output=0; IIC_delay(Dtime/2);
IIC_SCL_output=1; IIC_delay(Dtime/2);
//do{k=IIC_SCL_input;if(j++>200000) return(1);}while(k==0); //ֹͣ�ź�ʧ�ܣ���ʱ��
IIC_delay(Dtime);
IIC_SDA_output=1; IIC_delay(Dtime);
//do{k=IIC_SDA_input;if(j++>200000) return(1);}while(k==0); //ֹͣ�ź�ʧ�ܣ���ʱ��

IIC_SDA_inmode; //pan�¼ӣ��ͷţ�����
return(0);
}

/*
���ܣ���ACK�źţ����˲�
���أ�
0��ACK=0
1��ACK=1
0xff//��ACK�ź�ʧ�ܣ���ʱ��
*/
uchar IIC_RACK(void)
{
uchar buf[5];
uchar i=0,k=0;
//ulong j=0;



IIC_SCL_output=0; IIC_delay(Dtime);

IIC_SDA_inmode; //pan�¼ӣ��ͷţ�����
IIC_SDA_output=1; IIC_delay(Dtime/2); //�ͷ�����

IIC_SCL_output=1; IIC_delay(Dtime/3);
//do{k=IIC_SCL_input;if(j++>200000) return(0xff);}while(k==0); //��ACK�ź�ʧ�ܣ���ʱ��
IIC_delay(Dtime/3);

for(i=0;i<5;i++) buf[i]=IIC_SDA_input; 
k=0;
for(i=0;i<5;i++) {if(buf[i]!=0)k++; if(k>3) return(1);}

IIC_delay(Dtime/3);
return(0);
}

/*
���ܣ�дACK�ź�
��ڣ�
0��ACK=0
1��ACK=1
*/
uchar IIC_WACK(uchar ACK)
{
//uchar k=0;
//ulong j=0;
IIC_SCL_output=0;   IIC_delay(Dtime/2);

IIC_SDA_outmode; //pan�¼ӣ�����
if(ACK)
IIC_SDA_output=1;
else
IIC_SDA_output=0;	
	
IIC_delay(Dtime/2);
IIC_SCL_output=1;   IIC_delay(Dtime/2);
//do{k=IIC_SCL_input;if(j++>1000000) return(1);}while(k==0);
IIC_delay(Dtime);

//-----------------  
IIC_SCL_output=0;   IIC_delay(Dtime/4);

IIC_SDA_output=1; 
IIC_SDA_inmode; //pan�¼ӣ��ͷţ�����
return(0);
}

/*
���ܣ���I2C����д8λ���ݣ���λ�ȷ���SCL���ڼ�ı����ݣ� 
��ڣ�Ҫд���ֽ�
����
0�� дOK��������Ӧ��
1�� �ӻ�����SCL�ź���ϣ����ʱ������ʱ�ˣ�
*/
uchar IIC_Wbyte(uchar Wdat)
{
//ulong j=0;
uchar k=0;
uchar i=0;

	IIC_SDA_outmode; //pan�¼ӣ�����

	for(i=0;i<8;i++) 
	{
	IIC_SCL_output=0;
	IIC_delay(Dtime/2);
		
	if((Wdat&(1<<(7-i)))?(1):(0))
	IIC_SDA_output=1;
	else
	IIC_SDA_output=0;		

	
	IIC_delay(Dtime/2);
	IIC_SCL_output=1;  IIC_delay(Dtime/2);
	//��ʱ�ӻ�Ӧ�ͷ�ʱ�����ߡ������ͷ���ȴ����ͷ�
	//do{k=IIC_SCL_input;if(j++>1000000) return(1);}while(k==0);
	IIC_delay(Dtime/2);
	}
	return(0);
}
/*
���ܣ���I2C���߶�8λ���ݣ���λ�ȶ���SCL���ڼ�����ݣ� 
��ڣ���
���ڣ������������ݣ�
IIC_SDA_input
*/
uchar IIC_Rbyte(void)
{
uchar i;
uchar temp=0;
uchar k=0;
//ulong j=0;

	IIC_SDA_output=1;  //�ͷ�����
	IIC_SDA_inmode; //pan�¼ӣ��ͷţ�����

	for(i=0;i<8;i++)
	{
		IIC_SCL_output=0;  IIC_delay(Dtime);
		IIC_SCL_output=1;  IIC_delay(Dtime/2);
		//do{k=IIC_SCL_input;if(j++>1000000) return(0xee);}while(k==0);
		IIC_delay(Dtime/2);
		k=IIC_SDA_input;
		temp|=((k)?(1):(0))<<(7-i);
		IIC_delay(Dtime/2);
	}
return(temp);	
}


/*----------------------------------
���ܣ�
��һ���ֽڵ�*Rdat��ע�⣺ACK��ʱӦ��Ϊ0��
������Ϊ��
0��START�ź�
1��дChip��ַ+д�ź�
2��дҪ���Ĵ����ĵ�ַ
3���ظ�START�ź�
4��дChip��ַ+���ź�
5����������
6��STOP�ź�
----------------------------------
��ڣ�
ACK�����������ݺ��͵�Ӧ����ʱӦ��Ϊ0��
Chip_Adds��Ƭѡ��ַ
Reg_Adds��Ҫ���Ĵ����ĵ�ַ
*Rdat�� ���ݴ�ŵ�ָ��

���ڣ�
0�� OK
1��6:           Start�ź���Ч
2��4��7���ӻ�����SCL�ź�������ʱ������ʱ��
3��5��8���ӻ����͵�Ӧ����Ч��������0��
9:WACK;	ʧ��
10��             STOP������Ч��
----------------------------------*/
uchar IIC_ReceByte(uchar ACK,uchar Chip_Adds,uchar Reg_Adds,uchar *Rdat)
{
if(IIC_start())  					 return(1);
if(IIC_Wbyte(Chip_Adds<<1))          return(2); //�ӻ�����SCL�ź�������ʱ������ʱ��
if(IIC_RACK())				         return(3); //Ӧ����Ч
if(IIC_Wbyte(Reg_Adds))	 		     return(4); //�ӻ�����SCL�ź�������ʱ������ʱ��
if(IIC_RACK())		         	   	 return(5); //Ӧ����Ч

if(IIC_start())  					 return(6);							
if(IIC_Wbyte((Chip_Adds<<1)+1))      return(7); //�ӻ�����SCL�ź�������ʱ������ʱ��
if(IIC_RACK())				         return(8); //Ӧ����Ч
*Rdat=IIC_Rbyte();
if(IIC_WACK(ACK))					 return(9);
if(IIC_stop())				         return(10); //SOTP�źŷ�����Ч
return(0);
}



/*----------------------------------
���ܣ�
�����������ݵ�*BUF����ַ��Χ��ע�ⷢ��ACK�ı仯�����һ���ֽڵ�ACK������1!

������Ϊ��
0��START�ź�
1��дChip��ַ+д�ź�
2��дҪ���Ĵ����ĵ�ַ
3���ظ�START�ź�
4��дChip��ַ+���ź�
5����������+ADC=0;  ѭ��R_LEN-1��
6����������+ADC=1; ���һ���ֽ���Ӧ"NO ACK"
7��STOP�ź�
----------------------------------
��ڣ�
Chip_Adds :Ƭѡ��ַ
Reg_Adds:  Ҫ���Ĵ����ĵ�ַ
R_LEN��     ������
*buf��        ���ݴ�ŵ�ָ��

���ڣ�
0�� OK
1��6:           Start�ź���Ч
2��4��7���ӻ�����SCL�ź�������ʱ������ʱ��
3��5��8���ӻ����͵�Ӧ����Ч��������0��
9: WACKʧ��
10��             STOP������Ч��
----------------------------------*/

uchar IIC_ReceString(uchar Chip_Adds,uchar Reg_Adds,usint R_LEN,uchar *buf)
{
usint i=0;

if(IIC_start())  					  return(1); //Start�ź���
if(IIC_Wbyte(Chip_Adds<<1))     return(2); //�ӻ�����SCL�ź�������ʱ������ʱ��
if(IIC_RACK())				          return(3); //Ӧ����Ч
if(IIC_Wbyte(Reg_Adds)) 	      return(4); //�ӻ�����SCL�ź�������ʱ������ʱ��
if(IIC_RACK()!=0) 				  return(5); //Ӧ����Ч
if(IIC_start())  					  return(6);	 //Start�ź���					
if(IIC_Wbyte((Chip_Adds<<1)+1))return(7); //�ӻ�����SCL�ź�������ʱ������ʱ��
if(IIC_RACK())				          return(8); //Ӧ����Ч
R_LEN=R_LEN-1;
for(i=0;i<R_LEN;i++)
{*(buf+i)=IIC_Rbyte();if(IIC_WACK(0)) return(9);}

*(buf+R_LEN)=IIC_Rbyte();
if(IIC_WACK(1)) return(9);

if(IIC_stop())	return(10); //SOTP�źŷ�����Ч
return(0);
}


/*
���ܣ�����Wdat��I2C
д����Ϊ��
0��START�ź�
1��дChip��ַ+д�ź�
2��дҪд�Ĵ����ĵ�ַ
3��дҪд�Ĵ���������
4��STOP�ź�
----------------------------------
��ڣ�
Chip_Adds :Ƭѡ��ַ
Reg_Adds:  Ҫд�Ĵ����ĵ�ַ
Wdat��      Ҫд�Ĵ���������

���ڣ�
0�� OK
1:          Start�ź���Ч
2��4��6���ӻ�����SCL�ź�������ʱ������ʱ��
3��5��7���ӻ����͵�Ӧ����Ч��������0��
8��         STOP������Ч��
----------------------------------*/
uchar IIC_SendByte(uchar Chip_Adds,uchar Reg_Adds,uchar Wdat)
{
if(IIC_start())				 return(1);  //Start�ź���
if(IIC_Wbyte(Chip_Adds<<1))  return(2); //�ӻ�����SCL�ź�������ʱ������ʱ��
if(IIC_RACK()!=0)		 	 return(3); //Ӧ����Ч
if(IIC_Wbyte(Reg_Adds))	   	 return(4); //�ӻ�����SCL�ź�������ʱ������ʱ��
if(IIC_RACK()!=0)		     return(5); //Ӧ����Ч
if(IIC_Wbyte(Wdat))		  	 return(6); //�ӻ�����SCL�ź�������ʱ������ʱ��
if(IIC_RACK()!=0) 		  	 return(7); //Ӧ����Ч
if(IIC_stop())				 return(8); //Stop�ź���
return(0);
}


/*--------------------------------
���ܣ�����Wdat��I2C
д����Ϊ��
0��START�ź�
1��дChip��ַ+д�ź�
2��дҪд�Ĵ����ĵ�ַ
3��дҪд�Ĵ���������
4��STOP�ź�
----------------------------------
��ڣ�
Chip_Adds :Ƭѡ��ַ
Reg_Adds:  Ҫд�Ĵ����ĵ�ַ
Wdat��      Ҫд�Ĵ���������
���ڣ�
0�� OK
1:        Start�ź���Ч
2��4��6���ӻ�����SCL�ź�������ʱ������ʱ��
3��5��   �ӻ����͵�Ӧ����Ч��������0��
7,8��    STOP������Ч��
----------------------------------*/

uchar IIC_SendString(uchar Chip_Adds,uchar Reg_Adds,uchar R_LEN,uchar *buf)
{
uchar i=0;
if(IIC_start())				 return(1);  //Start�ź���
if(IIC_Wbyte(Chip_Adds<<1))  return(2); //�ӻ�����SCL�ź�������ʱ������ʱ��
if(IIC_RACK()!=0)		 	 return(3); //Ӧ����Ч
if(IIC_Wbyte(Reg_Adds))	   	 return(4); //�ӻ�����SCL�ź�������ʱ������ʱ��
if(IIC_RACK()!=0)		     return(5); //Ӧ����Ч

for(i=0;i<R_LEN;i++)
{
	if(IIC_Wbyte(buf[i]))      return(6); //�ӻ�����SCL�ź�������ʱ������ʱ��
	if(IIC_RACK()!=0)		
	{if(IIC_stop()) return(7); return(0);}   //Stop�ź���							
}

if(IIC_stop())				 return(8); //Stop�ź���
return(0);
}

/*

uchar IIC_SendString_full(uchar Chip_Adds,uchar Reg_Adds,uchar R_LEN,uchar iD)
{
uchar i=0;
if(IIC_start())				 return(1);  //Start�ź���
if(IIC_Wbyte(Chip_Adds<<1))  return(2); //�ӻ�����SCL�ź�������ʱ������ʱ��
if(IIC_RACK()!=0)		 	 return(3); //Ӧ����Ч
if(IIC_Wbyte(Reg_Adds))	   	 return(4); //�ӻ�����SCL�ź�������ʱ������ʱ��
if(IIC_RACK()!=0)		     return(5); //Ӧ����Ч

for(i=0;i<R_LEN;i++)
{
	if(IIC_Wbyte(iD))      return(6); //�ӻ�����SCL�ź�������ʱ������ʱ��
	if(IIC_RACK()!=0)		
	{if(IIC_stop()) return(7); return(0);}   //Stop�ź���							
}

if(IIC_stop())				 return(8); //Stop�ź���
return(0);
}
*/
uchar IIC_CheckBusy(uchar Chip_Adds) //����0����У�1����д
{
if(IIC_start())				 return(1);  //Start�ź���
if(IIC_Wbyte(Chip_Adds<<1))  return(2); //�ӻ�����SCL�ź�������ʱ������ʱ��
if(IIC_RACK()!=0)		 	 return(3); //Ӧ����Ч
return(0);
}



