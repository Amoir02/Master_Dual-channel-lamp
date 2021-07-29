#include "led.h"
#include "cms.h"
#include "system.h"
#include "WDT.h"
#include "rf297L.h"
#include "timer1.h"
#include "PORTB_interrupt.h"
#include "cUART.h"
#include "24lc02.h"
#include "timer1.h"
#include "Key.h"
#include "Buffer.H"
#include "PWM.h"
#include "recive.h"

/*
	2Khz
  T_NUMS =  ((8M/4) / PWM_DIV) / 2K  = 250
*/
#define T_NUMS  250

// DUTY_ATOM_NUM = T_NUMS * 4
#define DUTY_ATOM_NUM  1000

#define LEVEL_HIGH 1
#define LEVEL_LOW  0

#define TURN_ON_LEVEL   LEVEL_HIGH
#define TURN_OFF_LEVEL  LEVEL_LOW

//pwm1 pin5 rc2  warn
//pwm2 pin4 rc1  cold

#define MULTIPLE_RATE (10)

#define INDICATE_STABLE         0
#define INDICATE_BREATH_STEP_0  1
#define INDICATE_BREATH_STEP_1  2
#define INDICATE_BREATH_STEP_2  3
#define INDICATE_BREATH_STEP_3  4
#define INDICATE_BLINK_STEP_0   5
#define INDICATE_BLINK_STEP_1   6
#define INDICATE_BLINK_STEP_2   7
#define INDICATE_BLINK_STEP_3   8
#define INDICATE_GRADUAL        9

#define INDICATE_BREATH_MAX_VALUE        100
#define INDICATE_BREATH_MIN_VALUE        10

#define INDICATE_BLINK_MAX_VALUE         100
#define INDICATE_BLINK_MIN_VALUE         10


#define AUX_LED1_PIN RB1
#define AUX_LED2_PIN RB2

//auxiliary
//#define AUX_LED1_PIN RB4
//#define AUX_LED2_PIN RB5

#define setLedOn(status, index)              (status  |= (1 << index))
#define setLedOff(status, index)             (status  &= (~(1 << index)))
#define getLedStatus(status, index)          ((status >> index) & 0x01)
           
 uint8_t preset_brightness = BRIGHTNESS_DEFAULT;
 uint8_t preset_colour_tempr = COLOUR_TEMPR_DEFAULT;

//static uint8_t target_brightness = 0;
//static uint8_t target_colour_tempr = 0;

 uint8_t now_brightness = 0;
 uint8_t now_colour_tempr = COLOUR_TEMPR_DEFAULT;

static uint16_t gradual_start_brightness = 0;
static uint16_t gradual_start_colour_tempr = 0;

static int8_t delta_brightness = 0;
static int8_t delta_colour_tempr = 0;

static uint8_t led_status = 0;
static uint8_t indicate_mode = INDICATE_STABLE;
static uint16_t step_count = 0;
static uint8_t gradual_count = 0;


uint8_t  exe_flag = 0;
uint16_t exe_brightness = 0; 
uint16_t exe_colour_tempr = 0;

uint16_t warn = 0;
uint16_t cold = 0;
uint32_t tmp = 0;

static void setIndicateMode(uint8_t mode);
static void ledSetBrCt(uint8_t set_brightness, uint8_t set_colour_tempr, uint8_t is_gradual);

uint8_t ledGetBrightness(void)
{
    return preset_brightness;
}

uint8_t ledGetColourTempr(void)
{
    return  preset_colour_tempr;
}

void ledSetGradual(uint8_t set_brightness, uint8_t set_colour_tempr)
{
    ledSetBrCt(set_brightness, set_colour_tempr, 1);
}

static void ledSetBrCt(uint8_t set_brightness, uint8_t set_colour_tempr, uint8_t is_gradual)
{
    if (set_brightness == BRIGHTNESS_KEEP)
    {
        set_brightness = preset_brightness;
    }

    if (set_colour_tempr == COLOUR_TEMPR_KEEP)
    {
        set_colour_tempr = preset_colour_tempr;
    }

    gradual_start_brightness = (uint16_t)now_brightness * 500;    // * 500
    gradual_start_colour_tempr = (uint16_t)now_colour_tempr *500;  // * 500
        
    if (set_brightness <= BRIGHTNESS_MAX 
        && set_brightness >= BRIGHTNESS_MIN 
        && set_colour_tempr <= COLOUR_TEMPR_MAX
        && (TURN_ON == getLedStatus(led_status, LED_DIMMER)))
    {
        preset_brightness = set_brightness;
        preset_colour_tempr = set_colour_tempr;

        delta_brightness = set_brightness - now_brightness;
        delta_colour_tempr = set_colour_tempr - now_colour_tempr;

        //AT24C02_Write_Msg(ADDR_BRIGHT, &preset_brightness, BRIGHT_SIZE);
        //AT24C02_Write_Msg(ADDR_COLOUR, &preset_colour_tempr, COLOUR_SIZE);
        //setLedOn(led_status, LED_DIMMER);

        setIndicateMode(INDICATE_GRADUAL);

    }
    else if (set_brightness == BRIGHTNESS_OFF)
    {
        delta_brightness = 0 - now_brightness;
        delta_colour_tempr = 0;

        setIndicateMode(INDICATE_GRADUAL);
    }
}


void convertPwmExe(void)
{
    uint8_t tmp_value = 0;

    if (1 == exe_flag)
    {
        exe_flag = 0;
    }
    else
    {
        return;
    }
    
    now_brightness = exe_brightness / 10;
    now_colour_tempr = exe_colour_tempr / 10;

      
    //warn = (set_brightness * 10 + set_brightness_decimal) * set_colour_tempr / 100;
    tmp = exe_brightness;
    tmp = tmp * exe_colour_tempr;
    warn = tmp / 1000;
    //cold = (set_brightness * 10 + set_brightness_decimal) * (100 - set_colour_tempr) / 100;
    tmp = (1000 - exe_colour_tempr);
    tmp = tmp* exe_brightness;
    cold = tmp / 1000;

    if (warn)
    {
        if (warn == DUTY_ATOM_NUM)
        {
            warn += 4;
        }

        tmp_value = CCP1CON;
        tmp_value &= 0xCF;
        tmp_value |= (warn << 4) & 0x30;

        tmp_value |= 0x0F;

        CCP1CON = tmp_value;	//占空比低2位
        CCPR1L = warn >> 2;				//占空比高8位
    }
    else
    {
        CCP1CON &= 0xF0;
        TRISC2 = 0;
        RC2 = 0;
    }

    if (cold)
    {
        if (cold == DUTY_ATOM_NUM) 
        {
            cold += 4;
        }

        tmp_value = CCP2CON;
        tmp_value &= 0xCF;
        tmp_value |= (cold << 4) & 0x30;

        tmp_value |= 0x0F;

        CCP2CON = tmp_value;	//占空比低2位
        CCPR2L = cold >> 2;				//占空比高8位
    }
    else
    {
        CCP2CON &= 0xF0;
        TRISC1 = 0;
        RC1 = 0;
    }

}





static void setIndicateMode(uint8_t mode)
{
    indicate_mode = mode;
    step_count = 0;
}

void ledIndicateProcess(void)
{
    uint8_t tmp_brightness = 0;
    uint8_t tmp_colour_tempr = 0;

    int16_t tmp_value = 0; // uint8_t tmp_colour_tempr = 0;
    int8_t tmp_brightness_decimal = 0;
    
 //   if (FCLK_1MS)
  //  {
        switch (indicate_mode)
        {

            case INDICATE_GRADUAL:
            {
                if (step_count >= 496)  //512~ 508      12
                {
                    if (++ gradual_count >= 20)  //28  25
                    {
                        gradual_count = 0;
                    }
                    else
                    {
                        return;
                    }
                }
                else if (step_count >= 488)  //507 500      12
                {
                    if (++ gradual_count >= 16)  //24  20
                    {
                        gradual_count = 0;
                    }
                    else
                    {
                        return;
                    }
                }
                else if (step_count >= 468)  //500 ~ 480  
                {
                    if (++ gradual_count >= 6) //16 14
                    {
                        gradual_count = 0;
                    }
                    else
                    {
                        return;
                    }
                }
                else if (step_count >= 428)  //500 ~ 440  
                {
                    if (++ gradual_count >= 4) //8 8
                    {
                        gradual_count = 0;
                    }
                    else
                    {
                        return;
                    }
                }
                else if (step_count >= 368)  //500 ~ 440  
                {
                    if (++ gradual_count >= 2) //8 8
                    {
                        gradual_count = 0;
                    }
                    else
                    {
                        return;
                    }
                }
                step_count ++;
            
                gradual_start_brightness += delta_brightness;
                gradual_start_colour_tempr += delta_colour_tempr;
                
                if (step_count >= 500)
                {
                    setIndicateMode(INDICATE_STABLE);
                }
                
                exe_brightness = gradual_start_brightness / 50;
                exe_colour_tempr = gradual_start_colour_tempr / 50;
                exe_flag = 1;
            }
            break;
        }
}



void ledInit(void)
{
    CCPX_Init(PWM_DIV_4, T_NUMS);

    //AT24C02_Read_Msg(ADDR_BRIGHT, &preset_brightness, BRIGHT_SIZE);
    //AT24C02_Read_Msg(ADDR_COLOUR, &preset_colour_tempr, COLOUR_SIZE);
    //AT24C02_Read_Msg(ADDR_LEDS_STATUS, &led_status, LEDS_STATUS_SIZE);

   // if (preset_brightness > BRIGHTNESS_MAX
   //     || preset_brightness < BRIGHTNESS_MIN 
   //     || preset_colour_tempr > COLOUR_TEMPR_MAX)
   // {
   //     preset_brightness = BRIGHTNESS_DEFAULT;
   //     preset_colour_tempr = COLOUR_TEMPR_DEFAULT;
   // }

   // now_colour_tempr = preset_colour_tempr;

//    if (led_status == 0 || led_status == 0xFF)
 //   {
 //       led_status = 0;
    //    ledSetOnOffGradual(LED_AUXLED1, TURN_OFF);
//ledSetOnOffGradual(LED_AUXLED2, TURN_OFF);
 //   }

 //   ledSetOnOffGradual(LED_DIMMER, TURN_ON);
    
}


