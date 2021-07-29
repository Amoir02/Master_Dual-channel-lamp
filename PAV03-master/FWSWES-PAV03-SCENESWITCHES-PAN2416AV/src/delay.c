#include "cms.h"
#include "delay.h"

void soft_delay_ms(unsigned int ms);




void soft_delay_ms(unsigned int ms)
{
//	8MÖ÷Æµ
	volatile unsigned int i;
	volatile unsigned char j,k;
	for(i=0;i<ms;i++){
		for(j=0;j<10;j++){
			for(k=0;k<32;k++);
		}
	}
}
