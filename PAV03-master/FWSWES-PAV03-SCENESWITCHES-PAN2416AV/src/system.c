#include "cms.h"
#include "system.h"
#include "INT0.h"
#include "timer0.h"
#include "timer1.h"
#include "timer2.h"
#include "PWM.h"
#include "PORTB_interrupt.h"
#include "ADC.h"
#include "rf297L.h"

void system_set_CPU_frequency(CPU_FREQUENCY_e CPU_Frequency);
void clear_interrupt_flag(void);
void system_to_sleep(void);
void Enable_Interrupt(void);
void Disable_Interrupt(void);

void system_set_CPU_frequency(CPU_FREQUENCY_e CPU_Frequency)
{
	OSCCON = CPU_Frequency;
	OSCTUNE = 0X00;
}

void clear_interrupt_flag(void)
{
	PIR1&= ~0x4f;		//bit0==TMR1IF bit1==TMR2IF bit2==CCP1IF bit3==SSPIF bit6==ADIF
	PIR2&= ~0x19;		//bit0==CCP2IF bit3==BCLIF bit4==EEIF
	INTCON&= ~0x07;	//bit0==RBIF bit1==INTF bit2==T0IF
}

void system_to_sleep(void)
{
	asm("sleep");
	asm("nop");
}

void Enable_Interrupt(void)
{
	INTCON |= 0x80;
}

void Disable_Interrupt(void)
{
	INTCON &= ~(0x80);
}

void interrupt ISR(void)
{
	unsigned char inside_intterrupt_enable,peripheral_intterrupt_enable;
	unsigned char inside_intterrupt_touch,peripheral_intterrupt_touch;
	
	//读取中断标志	
	inside_intterrupt_enable = INTCON & 0x38;
	peripheral_intterrupt_enable = PIE1 & 0x43;
	inside_intterrupt_touch = INTCON & 0x07;
	peripheral_intterrupt_touch = PIR1 & 0x43;
	
	//跳转到中断函数	
//	if(inside_intterrupt_touch & PORTB_CHANGE_ISR_TOUCH) 	{		//RBIF
//			PORTB_CHANGE_ISR();
//	} 
		
//	if(inside_intterrupt_touch & INT0_ISR_TOUCH){							//INTF
//			INT0_ISR();
//	}
		
//	if(inside_intterrupt_touch & TIMER0_ISR_TOUCH) {						//T0IF	
//			TIMER0_ISR();			
//	}
	
	if(peripheral_intterrupt_touch & TIMER1_ISR_TOUCH) {				//TMR1IF
			TIMER1_ISR();
	}
		 
//	if(peripheral_intterrupt_touch & TIMER2_ISR_TOUCH) {				//TMR2IF
//			TIMER2_ISR();
//	}
	
//	if(peripheral_intterrupt_touch & ADC_ISR_TOUCH) {					//ADIF	
//			ADC_ISR();
//	}
}


void System_sleep_mode(void)
{
	RF_Sleep();
	asm("sleep");
	asm("nop");
}

