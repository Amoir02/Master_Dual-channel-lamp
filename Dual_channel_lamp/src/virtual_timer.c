#include "cms.h"
#include "virtual_timer.h"

volatile virtual_timer_group_s virtual_timer_group;

void virtual_timer_pro(void);

void virtual_timer_pro(void)
{
	virtual_timer_group.timer3++;
	virtual_timer_group.timer4++;
	virtual_timer_group.timer5++;
	virtual_timer_group.timer6++;
}


























