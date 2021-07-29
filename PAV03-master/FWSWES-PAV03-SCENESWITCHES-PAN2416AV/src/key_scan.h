#ifndef _KEY_SCAN_H_
#define _KEY_SCAN_H_

/*********************************************************************
*按键值存放在key_value变量中
**********************************************************************/

typedef struct
{	
	unsigned char channel_status;

	unsigned char key_flag_3s;

	unsigned char key_flag_5s;

}channel_flag_stu;



extern void key_Init(void);
extern void key_scan(void);
void key_value_read(void);

extern void setChannelStatus(unsigned char channel, unsigned char status);
void sledBlink(void);

#endif
