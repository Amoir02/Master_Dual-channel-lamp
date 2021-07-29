#ifndef RECIVE_H_
#define RECIVE_H_

#define CMD_SWITCH_COMPAT   (0x10)
#define CMD_SWITCH          (0x11)
#define CMD_DIM             (0x12)
#define CMD_DIM_WITH_ON     (CMD_DIM | 0x80)
#define CMD_LEARN           (0x13)
#define CMD_CLR_ADDR		(0x13)
#define CMD_SCENE_EXE       (0x20)
#define CMD_SCENE_SET       (0x22)
#define CMD_SCENE_DEL       (0x24)
#define CMD_STARTUP_CONFIG  (0x30)

#define ACTION_ON           0x01
#define ACTION_OFF          0x00
#define ACTION_SW           0x02

#define DIMMER              0x00
#define AUX_LED1            0x01
#define AUX_LED2            0x02
#define ALL_LED             0xFF

#define ADJUST_BR_VALUE             0x00
#define ADJUST_TEMPR_VALUE          0x01
#define ADJUST_TEMPR_BR_VALUE       0x02
#define ADJUST_BR_ADD               0x05
#define ADJUST_BR_MINUS             0x06
#define ADJUST_TEMPR_ADD            0x07
#define ADJUST_TEMPR_MINUS          0x08

#define SCENE_ACTION_OFF                   0x0
#define SCENE_ACTION_ON                    0x1
#define SCENE_ACTION_TEMPR_BR_VALUE        0x2
#define SCENE_ACTION_BR_VALUE              0x4
#define SCENE_ACTION_TEMPR_VALUE           0x5

#define LEARN_ABORT                  0x00
#define LEARN_LANUCH                 0x01
#define LEARN_CLEAN                  0x02
#define REMOTE_NUM_MAX (9)

#define TYPE_INDEX       0
#define VERSION_INDEX    1
#define COUNT_INDEX      2
#define ADDR0_INDEX      3
#define ADDR1_INDEX      4
#define ADDR2_INDEX      5
#define ADDR3_INDEX      6
#define GROUP_INDEX      7
#define CMD_INDEX        8
#define PARAM0_INDEX     9
#define PARAM1_INDEX     10
#define PARAM2_INDEX     11
#define PARAM3_INDEX     12
#define PARAM4_INDEX     13
#define PARAM5_INDEX     14
#define RAND_INDEX       15
#define CRC_H_INDEX      16
#define CRC_L_INDEX      17

#define ACTION_INDEX            PARAM0_INDEX
#define LED_TYPE_INDEX          PARAM1_INDEX
#define DELAY_TIME_INDEX        PARAM2_INDEX
#define DELAY_SEC_INDEX         PARAM3_INDEX

#define ADJUST_TYPE_INDEX       PARAM0_INDEX
#define BRIGHTNESS_INDEX        PARAM1_INDEX
#define COLOUR_TEMP_INDEX       PARAM2_INDEX

#define SCENE_ID_INDEX          PARAM0_INDEX

#define LEARN_TYPE_INDEX        PARAM0_INDEX

#define BRIGHTNESS_OFF   (0)
#define BRIGHTNESS_MAX   (100)
#define COLOUR_TEMPR_MIN (0)
#define COLOUR_TEMPR_MAX (100)
#define BRIGHTNESS_KEEP   (0xFF)
#define COLOUR_TEMPR_KEEP (0xFF)

struct BriCoTem
{
unsigned char Brightness;
unsigned char ColorTemp;
};


void recive_task(void);

#endif