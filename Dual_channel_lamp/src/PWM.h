#ifndef _PWM_H_
#define _PWM_H_

/*******************************************************
*ʹ��ʾ��
*CCPX_Init(PWM_DIV_4,250);	//��ʼ��
*CCP1_set_duty_cycle(200);	//PWM1ռ�ձ� == 200/(250*4)
*CCP2_set_duty_cycle(400);	//PWM2ռ�ձ� == 400/(250*4)
********************************************************/
	
typedef enum{
	PWM_DIV_1 = 0x00,
	PWM_DIV_4 = 0x01,
	PWM_DIV_16 = 0x02,
}PWM_DIV_e;

/**********************************************************
*�붨ʱ��2���ܳ�ͻ
*ʱ��ԴF = Fosc/4
*����������ƣ�T = (1/F)*PWM_DIV*T_nums
*�ֱ��� == T_nums*4
***********************************************************/
extern void CCPX_Init(PWM_DIV_e PWM_DIV,unsigned char T_nums);


/****************************************************
*CCP1_set_duty_cycle
*ռ�ձ� = duty_cycle/(T_nums * 4)
*T_nums�ڳ�ʼ��ʱ�趨
******************************************************/
extern void CCP1_set_duty_cycle(unsigned int duty_cycle);	//RC2 pin


/****************************************************
*CCP2_set_duty_cycle
*ռ�ձ� = duty_cycle/(T_nums * 4)
*T_nums�ڳ�ʼ��ʱ�趨
******************************************************/
extern void CCP2_set_duty_cycle(unsigned int duty_cycle);	//RC1 pin

#endif
