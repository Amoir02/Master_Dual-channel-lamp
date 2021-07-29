#ifndef _TIMER1_H_
#define _TIMER1_H_

/*********************************************************************
*Timer1_Init(TIMER1_DIV_8);		
*Timer1_start(10000,0);		//��ʱ10ms
**********************************************************************/


#define PWM2_Outmode	TRISB3=0
#define PWM2_L			RB3=0
#define PWM2_H			RB3=1

#define PWM3_Outmode	TRISB4=0
#define PWM3_L			RB4=0
#define PWM3_H			RB4=1

#define PWM4_Outmode	TRISB5=0
#define PWM4_L			RB5=0
#define PWM4_H			RB5=1






typedef enum{
	TIMER1_DIV_1 = 0x00,
	TIMER1_DIV_2 = 0x10,
	TIMER1_DIV_4 = 0x20,
	TIMER1_DIV_8 = 0x30,
}TIMER1_DIVIDER_e;

/**************************************************************************
*ʱ��ԴΪF = Fosc
*��С��ʱʱ�� T = (1/F)*TIMER1_DIVIDER
**************************************************************************/
extern void Timer1_Init(TIMER1_DIVIDER_e TIMER_DIVIDER);

/*************************************************************************************
*ʵ��ʱ���붨ʱʱ����ƫ��,��ͨ��Timer1_ISR_execution_total_time������
*Timer1_ISR_execution_total_time == ��Timer1�жϲ��������жϺ������˳��жϺ���ִ��ʱ�䣩/TIMER1_DIVIDER,
*��ʱʱ�� == T_nums * T
*T = (1/F)*TIMER1_DIVIDER
*************************************************************************************/
extern void Timer1_start(unsigned int T_nums, unsigned char Timer1_ISR_execution_total_time);

extern void Timer1_stop(void);
extern void TIMER1_ISR(void);

//void PWM_Init(void);
//void PWM_CHSet(unsigned char CH,unsigned char Val);
//void PWM_PinitInit(void);

#endif
