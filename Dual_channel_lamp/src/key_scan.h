#ifndef _KEY_SCAN_H_
#define _KEY_SCAN_H_

/*********************************************************************
*����ֵ�����key_value������
*����ɨ����Ҫ��Timer1��Timer1�ж�
*��Ҫ��Timer1_ISR�����е���key_scan()����
*key_Init();
*Timer1_Init(TIMER1_DIV_8);		
*Timer1_start(10000,0);		//��ʱ10ms
**********************************************************************/

//����ֵ��
extern volatile unsigned char key_value;

//����ֵ�仯��־��ÿbit����һ������
extern volatile unsigned char key_change_flag;





extern void key_Init(void);
extern void key_scan(void);














#endif
