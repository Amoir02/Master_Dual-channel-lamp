#include "cms.h"
#include "ADC.h"

volatile unsigned int ADC_digital_value;
void ADC_Init(void);
void ADC_start(ADC_CHANNEL_e ADC_CHANNEL);
void ADC_ISR(void);

void ADC_Init(void)
{
	//����ʱ��Դ
	 ADCON0 &= ~0xC0;
	 ADCON0 |= 0x00;	//ADCS<1:0> = 00, Fosc/8
//	 ADCON0 |= 0x40;	//ADCS<1:0> = 01, Fosc/16
//	 ADCON0 |= 0x80;	//ADCS<1:0> = 10, Fosc/32
//	 ADCON0 |= 0xC0;	//ADCS<1:0> = 11, Frc
	 
	 //�������ݸ�ʽ
	 ADCON1 &= ~0x80;	// ADFM = 0;����룬12bit
//	 ADCON1 |= 0x80;	// ADFM = 1;�Ҷ��룬10bit

	 //ADC�ж�����
	 PIE1 |= 0x40;		// ADIE = 1; ʹ��ADC�ж�
	 INTCON |= 0x40;	//PEIE = 1; ʹ�������ж�
	 ADCON0 |= 0x01;	//ADCON = 1;ʹ��ADCģ��
}

void ADC_start(ADC_CHANNEL_e ADC_CHANNEL)
{
	//ѡ��˿�,������������
	 ADCON0	&= ~0x3C;

	 if(ADC_CHANNEL == CHANNEL_RB1){
	 	ADCON0 |= 0x28;	//			1010=AN10	RB1
	 	ANSELH &= ~0x04;	//			bit2	���ֽ�
	 }else if(ADC_CHANNEL == CHANNEL_RB2){
	 	ADCON0 |= 0x20;	//CHS<3:0>	1000=AN8	RB2
		//ANSELH &= ~0x01;				//�˽�δ���� RB0
	 }else if(ADC_CHANNEL == CHANNEL_RB3){
	 	ADCON0 |= 0x24;	//			1001=AN9	RB3
	 	ANSELH &= ~0x02;	//			BIT1
	 }else if(ADC_CHANNEL == CHANNEL_RB4){
	 	ADCON0 |= 0x2C;	//			1010=AN11	RB4
	 	ANSELH &= ~0x08;	//			bit3
	 }else if(ADC_CHANNEL == CHANNEL_RB5){
	 	ADCON0 |= 0x34;	//			1101=AN13	RB5
	 	ANSELH &= ~0x20;	//			bit5
	 }else{
	 	ADCON0 |= 0x3C;	//			1111=�ڲ���ѹ�� �̶�1.2V
	 }
	ADCON0 |= 0x02;		//  GO/DONE = 1;����ת�� 0=ת�����
}

void ADC_ISR_Disable(void)
{
	ADCON0 &= ~0x01;	//ADCON = 1;�ر�ADCģ��
	PIE1 &= ~0x40;		// ADIE = 1; �ر�ADC�ж�
	INTCON &= ~0x40;	//PEIE = 1; �ر������ж�
	PIR1 &= ~0x40;	//ADIF = 0;
}

void ADC_ISR(void)
{
	unsigned int temp = 0;
	if(ADFM == 1){	//�Ҷ���
		ADRESH &= 0x03;		//��6λ��Ч��������
		temp = ADRESH<<8;
		temp |= ADRESL;
	}else{			//�����
		temp = ADRESH<<8; 
		temp |= ADRESL;
		temp >>= 4;
	}
	ADC_digital_value = temp;
	PIR1 &= ~0x40;	//ADIF = 0;
}	
