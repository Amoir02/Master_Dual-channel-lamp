#ifndef _WDT_H_
#define _WDT_H_

typedef enum{
	WDT_DIVIDE_RATIO_1 = 8+0,		//18*1ms
	WDT_DIVIDE_RATIO_2 = 8+1,
	WDT_DIVIDE_RATIO_4 = 8+2,
	WDT_DIVIDE_RATIO_8 = 8+3,
	WDT_DIVIDE_RATIO_16 = 8+4,
	WDT_DIVIDE_RATIO_32 = 8+5,
	WDT_DIVIDE_RATIO_64 = 8+6,
	WDT_DIVIDE_RATIO_128 = 8+7,
}WDT_DIVIDE_RATIO_e;


extern void WDT_enable(WDT_DIVIDE_RATIO_e WDT_DIVIDE_RATIO);
extern void WDT_clear(void);
extern void WDT_disable(void);

#endif
