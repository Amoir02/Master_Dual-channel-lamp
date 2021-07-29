
#include "userClock.h"

//-------------------------------------------------------------------------------------------------
uint8_t  clk_flag;
static uint8_t   dClkCnt0;
extern volatile uint8_t clk_count;

//-------------------------------------------------------------------------------------------------
#define SYS_CNT_1MS  1     

void getClock(void)
{
    uint8_t temp = 0;
    clk_flag = 0;
    
    if(clk_count >= SYS_CNT_1MS)
    {
        clk_count -= SYS_CNT_1MS;
        temp = dClkCnt0;
        clk_flag  = temp ^ (++dClkCnt0);
    }
}
