#ifndef  _Key_h_
#define  _Key_h_

#include "cms.h"
#include "system.h"


#define LED_R_Min 2   //白平衡考虑，最小值2
#define LED_R_Max 250

#define _r 0
#define _g 2
#define _b 1

#define  Key_ON  0x0001
#define  Key_OFF 0x0010

#define  Key_U  0x0002
#define  Key_D  0x0020
#define  Key_L  0x2000
#define  Key_R  0x0200

/*
#define  Key_secai  	0x4000
#define  Key_dinshi  	0x0040


#define  Key_zuian  	0x0008
#define  Key_zuiliang  	0x0800 //正反修正过的

#define  Key_jingcai  	0x0004
#define  Key_dongcai  	0x0400

#define  Key_zuian  	0x0008
#define  Key_zuiliang  	0x0800 //正反修正过的

*/


#define  Key_secai  	0x0004
#define  Key_secaiOFF  	0x0400

#define  Key_jingcai  	0x0008
#define  Key_dongcai  	0x0800



//------------------------

#define  Key_ON2  	0x4000
#define  Key_OFF2  	0x0040

#define  Key_Dingshi30 0x8000
#define  Key_Dingshi60 0x0080



void Chg_Init(void);
void Chg_Running(void);
void Key_Handle(uchar *buf);
void Key_HandRunning(void);
void LED_ALLOFF(void);
void Pair_LED(void);

#endif









