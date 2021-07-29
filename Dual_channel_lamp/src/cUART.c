#include "cms.h"
#include "cUART.h"


#define UPin_Outmode	TRISB1=0
#define UPin_L			RB1=0
#define UPin_H			RB1=1

/*

void cUARTInit(void)
{
	UPin_Outmode;
	UPin_L;
}


void delay_UA(unsigned char DT)
{
	do{
	asm("nop");
	}while(DT--);
}



void UARTSend(unsigned char SD)
{
unsigned char i=0;

UPin_L;
delay_UA(20);


for(i=0;i<8;i++)
{
 if((SD>>i)&0x01)
 UPin_H;
 else
 UPin_L;
 delay_UA(15);
}
UPin_H;
delay_UA(18);
delay_UA(18);
}*/









