#ifndef _USERCLOCK_H
#define _USERCLOCK_H

#include "system.h"


extern uint8_t  clk_flag;

#if 0

#define  FCLK_25MS        (clk_flag & 0x01)
#define  FCLK_50MS        (clk_flag & 0x02)  
#define  FCLK_100MS       (clk_flag & 0x04)
#define  FCLK_200MS       (clk_flag & 0x08)  
#define  FCLK_400MS       (clk_flag & 0x10)  
#define  FCLK_800MS       (clk_flag & 0x20)  
#define  FCLK_1600MS      (clk_flag & 0x40)  
#define  FCLK_3200MS      (clk_flag & 0x80) 

#endif

#define  FCLK_1MS        (clk_flag & 0x01)
#define  FCLK_2MS        (clk_flag & 0x02)  
#define  FCLK_4MS        (clk_flag & 0x04)
#define  FCLK_8MS        (clk_flag & 0x08)  
#define  FCLK_16MS       (clk_flag & 0x10)  
#define  FCLK_32MS       (clk_flag & 0x20)  
#define  FCLK_64MS       (clk_flag & 0x40)  
#define  FCLK_128MS      (clk_flag & 0x80)  


void getClock(void);

#endif
