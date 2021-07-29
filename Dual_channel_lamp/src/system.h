#ifndef _SYSTEM_H_
#define _SYSTEM_H_


#define int8_t   signed char
#define uint8_t  unsigned char
#define int16_t  signed int
#define uint16_t unsigned int
#define uint32_t unsigned long int

#define uchar  unsigned char
#define uint   unsigned int
#define usint  unsigned short int
#define sint   short int
#define ulong  unsigned long

typedef enum{
	CPU_FREQUENCY_EXTERNAL = 0x00,
	CPU_FREQUENCY_31K = 0x01,
	CPU_FREQUENCY_125K = 0x11,
	CPU_FREQUENCY_250K = 0x21,
	CPU_FREQUENCY_500K = 0x31,
	CPU_FREQUENCY_1M = 0x41,
	CPU_FREQUENCY_2M = 0x51,
	CPU_FREQUENCY_4M = 0x61,
	CPU_FREQUENCY_8M = 0x71
}CPU_FREQUENCY_e;

typedef enum{
	PORTB_CHANGE_ISR_ENABLE = 0x80,
	INT0_ISR_ENABLE = 0x10,
	TIMER0_ISR_ENABLE = 0x20,
	TIMER1_ISR_ENABLE = 0x01,
	TIMER2_ISR_ENABLE = 0x02,
	ADC_ISR_ENABLE = 0x40,
}INT_ENABLE_FLAG_e;

typedef enum{
	PORTB_CHANGE_ISR_TOUCH = 0x01,
	INT0_ISR_TOUCH = 0x02,
	TIMER0_ISR_TOUCH = 0x04,
	TIMER1_ISR_TOUCH = 0x01,
	TIMER2_ISR_TOUCH = 0x02,
	ADC_ISR_TOUCH = 0x40,
}INT_TOUCH_FLAG_e;

extern void Interrupt_init(void);//中断初始化要排到最前面
extern void soft_delay_ms(unsigned int ms);
extern void system_set_CPU_frequency(CPU_FREQUENCY_e CPU_Frequency);
extern void clear_interrupt_flag(void);
extern void system_to_sleep(void);
extern void Enable_Interrupt(void);
extern void Disable_Interrupt(void);


#endif
