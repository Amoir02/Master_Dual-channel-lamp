#ifndef _LED_H__
#define _LED_H__


#define HALF_POWER 0
#define FULL_POWER 1

#define POWER_SECELET  HALF_POWER

#define COLOUR_TEMPR_WARN   (100)
#define COLOUR_TEMPR_COLD   (0)
#define COLOUR_TEMPR_MIDDLE (50)

#define BRIGHTNESS_DEFAULT      (100)
#define COLOUR_TEMPR_DEFAULT    (50)

#if (POWER_SECELET == HALF_POWER)

#define BRIGHTNESS_NIGHT_LIGHT  (10)
#define BRIGHTNESS_MIN          (10)


#elif (POWER_SECELET == FULL_POWER)

#define BRIGHTNESS_NIGHT_LIGHT  (5)
#define BRIGHTNESS_MIN          (5)

#endif

#define BRIGHTNESS_OFF   (0)
#define BRIGHTNESS_MAX   (100)
#define COLOUR_TEMPR_MIN (0)
#define COLOUR_TEMPR_MAX (100)
#define BRIGHTNESS_KEEP   (0xFF)
#define COLOUR_TEMPR_KEEP (0xFF)

#define TURN_OFF 0
#define TURN_ON  1
#define TURN_SW  2

#define LED_DIMMER                  0
#define LED_AUXLED1                 1
#define LED_AUXLED2                 2
#define LED_AUXLED1_ADN_AUXLED2     3
#define LED_ALL                     0xFF

#define SET_STEP       10

void ledIndicateProcess(void);

#endif
