#ifndef _ADC_H_
#define _ADC_H_

typedef enum{
	CHANNEL_RB1,
	CHANNEL_RB2,
	CHANNEL_RB3,
	CHANNEL_RB4,
	CHANNEL_RB5,
	CHANNEL_VREF,		//内部基准
}ADC_CHANNEL_e;


extern volatile unsigned int ADC_digital_value;


extern void ADC_Init(void);
extern void ADC_start(ADC_CHANNEL_e ADC_CHANNEL);
extern void ADC_ISR(void);


#endif
