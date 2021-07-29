#ifndef _KEY_SCAN_H_
#define _KEY_SCAN_H_

/*********************************************************************
*按键值存放在key_value变量中
*按键扫描需要打开Timer1和Timer1中断
*需要在Timer1_ISR函数中调用key_scan()函数
*key_Init();
*Timer1_Init(TIMER1_DIV_8);		
*Timer1_start(10000,0);		//定时10ms
**********************************************************************/

//按键值，
extern volatile unsigned char key_value;

//按键值变化标志，每bit代表一个按键
extern volatile unsigned char key_change_flag;





extern void key_Init(void);
extern void key_scan(void);














#endif
