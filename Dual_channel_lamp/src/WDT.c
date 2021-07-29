#include "cms.h"
#include "WDT.h"

void WDT_enable(WDT_DIVIDE_RATIO_e WDT_DIVIDE_RATIO);
void WDT_clear(void);
void WDT_disable(void);



void WDT_enable(WDT_DIVIDE_RATIO_e WDT_DIVIDE_RATIO)
{
	OPTION_REG &= 0xf0;
	OPTION_REG |= WDT_DIVIDE_RATIO;
	WDTCON |= 0x01;			//Ê¹ÄÜWDT
	asm("CLRWDT");
}

void WDT_clear(void)
{
	asm("CLRWDT");
}

void WDT_disable()
{
	WDTCON &= ~0x01;			//¹Ø±ÕWDT
}


