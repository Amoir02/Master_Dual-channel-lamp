#ifndef _UART_H_
#define _UART_H_

#if 0

#define IO7_OUT   TRISB7=0
#define IO7_H     RB7=1
#define IO7_L     RB7=0

#else

//#define IO7_OUT   TRISC1=0
//#define IO7_H     RC1=1
//#define IO7_L     RC1=0
//#define IO7       RC1

#define IO7_OUT   TRISB1=0
#define IO7_H     RB1=1
#define IO7_L     RB1=0
#define IO7       RB1

#endif

extern void send(unsigned char uContent);
#endif