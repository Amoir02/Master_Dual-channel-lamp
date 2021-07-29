#ifndef _VIRTUAL_TIMER_H_
#define _VIRTUAL_TIMER_H_
/******************************************************************
* �ṩ����8λ���ⶨʱ�� Timer3��Timer4��������Զ���0��ʼ��ʱ
* �ṩ����16λ���ⶨʱ��Timer5��Timer6��������Զ���0��ʼ��ʱ
* ���ⶨʱ����ҪTimer1֧�֣���С����ΪTimer1��ʱʱ��
* ʹ��ʱֱ�Ӷ�ȡ virtual_timer_group ��ֵ����

* ʹ��ʾ��
* virtual_timer_group.timer3 = 0;
* while(1){
*	if(virtual_timer_group.timer3>100){	//��ʱ = 100*��Timer1��ʱʱ�䣩
		//Do something
*	}
* }
*******************************************************************/

typedef struct{
	unsigned char timer3;
	unsigned char timer4;
	unsigned int timer5;
	unsigned int timer6;
}virtual_timer_group_s;


extern volatile virtual_timer_group_s virtual_timer_group;

/*********************************************************
* ���ⶨʱ�����������ɶ�ʱ�����ã�����Ϊ��ʱ��ʱ��
**********************************************************/
extern void virtual_timer_pro(void);

#endif




