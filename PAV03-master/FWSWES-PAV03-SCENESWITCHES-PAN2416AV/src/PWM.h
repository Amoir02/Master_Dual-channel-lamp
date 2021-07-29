#ifndef _PWM_H_
#define _PWM_H_

/*******************************************************
*使用示例
*CCPX_Init(PWM_DIV_4,250);	//初始化
*CCP1_set_duty_cycle(200);	//PWM1占空比 == 200/(250*4)
*CCP2_set_duty_cycle(400);	//PWM2占空比 == 400/(250*4)
********************************************************/
	
typedef enum{
	PWM_DIV_1 = 0x00,
	PWM_DIV_4 = 0x01,
	PWM_DIV_16 = 0x02,
}PWM_DIV_e;

/**********************************************************
*与定时器2功能冲突
*时钟源F = Fosc/4
*采用脉宽调制，T = (1/F)*PWM_DIV*T_nums
*分辨率 == T_nums*4
***********************************************************/
extern void CCPX_Init(PWM_DIV_e PWM_DIV,unsigned char T_nums);


/****************************************************
*CCP1_set_duty_cycle
*占空比 = duty_cycle/(T_nums * 4)
*T_nums在初始化时设定
******************************************************/
extern void CCP1_set_duty_cycle(unsigned int duty_cycle);	//RC2 pin


/****************************************************
*CCP2_set_duty_cycle
*占空比 = duty_cycle/(T_nums * 4)
*T_nums在初始化时设定
******************************************************/
extern void CCP2_set_duty_cycle(unsigned int duty_cycle);	//RC1 pin

#endif
