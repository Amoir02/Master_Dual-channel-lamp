#include "cms.h"
#include "delay.h"

void soft_delay_ms(unsigned int ms);
void Delay_us(unsigned int us);



void soft_delay_ms(unsigned int ms)
{
//	8M主频
	volatile unsigned int i;
	volatile unsigned char j,k;
	for(i=0;i<ms;i++){
		for(j=0;j<10;j++){
			for(k=0;k<32;k++);
		}
	}
}

/**填15us进去，实际延迟114us根据示波器调试，适用波特率9600**/
void Delay_us(unsigned int us)
{
   unsigned int i=0;
  i = us/2;
  i--;
  asm("nop"); 
    for(;i!=0;i--)      
    {
          asm("nop");     asm("nop");     asm("nop"); 
		  asm("nop");     asm("nop");     asm("nop");
    }
   
}
