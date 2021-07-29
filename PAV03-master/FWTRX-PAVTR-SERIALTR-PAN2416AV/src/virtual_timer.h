#ifndef _VIRTUAL_TIMER_H_
#define _VIRTUAL_TIMER_H_
/******************************************************************
* 提供两个8位虚拟定时器 Timer3、Timer4，溢出后自动从0开始计时
* 提供两个16位虚拟定时器Timer5、Timer6，溢出后自动从0开始计时
* 虚拟定时器需要Timer1支持，最小精度为Timer1定时时间
* 使用时直接读取 virtual_timer_group 数值即可

* 使用示例
* virtual_timer_group.timer3 = 0;
* while(1){
*	if(virtual_timer_group.timer3>100){	//定时 = 100*（Timer1定时时间）
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
* 虚拟定时器处理函数，由定时器调用，精度为定时器时间
**********************************************************/
extern void virtual_timer_pro(void);

#endif




