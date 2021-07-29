#ifndef _TIMER1_H_
#define _TIMER1_H_

/*********************************************************************
*Timer1_Init(TIMER1_DIV_8);		
*Timer1_start(10000,0);		//��ʱ10ms
**********************************************************************/

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


#endif
