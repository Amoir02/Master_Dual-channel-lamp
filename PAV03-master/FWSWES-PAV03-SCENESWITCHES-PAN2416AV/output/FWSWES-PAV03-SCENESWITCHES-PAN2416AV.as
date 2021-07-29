opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	PAN2416AV
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_system_set_CPU_frequency
	FNCALL	_main,_loadPowerOnEeprom
	FNCALL	_main,_soft_delay_ms
	FNCALL	_main,_IIC_Init
	FNCALL	_main,_key_Init
	FNCALL	_main,_RF_Init
	FNCALL	_main,_RF_Set_RxMode
	FNCALL	_main,_Timer1_Init
	FNCALL	_main,_Timer1_start
	FNCALL	_main,_loadParamsFromEeprom
	FNCALL	_main,_Enable_Interrupt
	FNCALL	_main,_channel_set
	FNCALL	_main,_recive_task
	FNCALL	_main,_key_value_read
	FNCALL	_main,_delay_task
	FNCALL	_delay_task,_AT24C02_Write_Msg
	FNCALL	_delay_task,_setChannelStatus
	FNCALL	_key_value_read,_key_scan
	FNCALL	_key_value_read,_sledBlink
	FNCALL	_key_value_read,_soft_delay_ms
	FNCALL	_key_value_read,_setChannelStatus
	FNCALL	_recive_task,_AT24C02_Write_Byte
	FNCALL	_recive_task,_soft_delay_ms
	FNCALL	_recive_task,___bmul
	FNCALL	_recive_task,_AT24C02_Read_Msg
	FNCALL	_recive_task,_sledBlink
	FNCALL	_recive_task,_rx_data
	FNCALL	_recive_task,_AT24C02_Write_Msg
	FNCALL	_recive_task,_setChannelStatus
	FNCALL	_recive_task,___lbdiv
	FNCALL	_recive_task,_RF_ClearFIFO
	FNCALL	_recive_task,_RF_ClearStatus
	FNCALL	_loadParamsFromEeprom,___bmul
	FNCALL	_loadParamsFromEeprom,_AT24C02_Read_Msg
	FNCALL	_loadParamsFromEeprom,_setChannelStatus
	FNCALL	_loadPowerOnEeprom,_AT24C02_Read_Msg
	FNCALL	_loadPowerOnEeprom,_AT24C02_Write_Msg
	FNCALL	_loadPowerOnEeprom,_soft_delay_ms
	FNCALL	_loadPowerOnEeprom,_sledBlink
	FNCALL	_rx_data,_RF_RxData
	FNCALL	_rx_data,_UpdateCRC
	FNCALL	_setChannelStatus,_AT24C02_Write_Msg
	FNCALL	_AT24C02_Read_Msg,_AT24C02_Read_Byte
	FNCALL	_AT24C02_Read_Msg,_soft_delay_ms
	FNCALL	_AT24C02_Read_Byte,_IIC_START
	FNCALL	_AT24C02_Read_Byte,_I2C_SendByte
	FNCALL	_AT24C02_Read_Byte,_IIC_Wait_ACK
	FNCALL	_AT24C02_Read_Byte,_I2C_ReadByte
	FNCALL	_AT24C02_Read_Byte,_IIC_STOP
	FNCALL	_RF_RxData,_RF_GetStatus
	FNCALL	_RF_RxData,_RF_Read_Buff
	FNCALL	_RF_RxData,_RF_ClearFIFO
	FNCALL	_RF_RxData,_RF_ClearStatus
	FNCALL	_AT24C02_Write_Msg,_AT24C02_Write_Byte
	FNCALL	_AT24C02_Write_Msg,_soft_delay_ms
	FNCALL	_I2C_ReadByte,_iic_delay_us
	FNCALL	_I2C_ReadByte,_IIC_NACK
	FNCALL	_I2C_ReadByte,_IIC_ACK
	FNCALL	_AT24C02_Write_Byte,_IIC_START
	FNCALL	_AT24C02_Write_Byte,_I2C_SendByte
	FNCALL	_AT24C02_Write_Byte,_IIC_Wait_ACK
	FNCALL	_AT24C02_Write_Byte,_IIC_STOP
	FNCALL	_RF_ClearStatus,_RF_WriteReg
	FNCALL	_RF_ClearFIFO,_RF_WriteReg
	FNCALL	_RF_GetStatus,_RF_ReadReg
	FNCALL	_RF_Set_RxMode,_RF_WriteReg
	FNCALL	_RF_Set_RxMode,_soft_delay_ms
	FNCALL	_RF_Init,_SPI_init
	FNCALL	_RF_Init,_RF_WriteReg
	FNCALL	_RF_Init,_RF_Write_Buff
	FNCALL	_I2C_SendByte,_iic_delay_us
	FNCALL	_IIC_NACK,_iic_delay_us
	FNCALL	_IIC_ACK,_iic_delay_us
	FNCALL	_IIC_Wait_ACK,_iic_delay_us
	FNCALL	_IIC_STOP,_iic_delay_us
	FNCALL	_IIC_START,_iic_delay_us
	FNCALL	_key_scan,_soft_delay_ms
	FNCALL	_RF_ReadReg,_SPI_RW
	FNCALL	_RF_Read_Buff,_SPI_RW
	FNCALL	_RF_Write_Buff,_SPI_RW
	FNCALL	_RF_WriteReg,_SPI_RW
	FNCALL	_sledBlink,_soft_delay_ms
	FNROOT	_main
	FNCALL	_ISR,_TIMER1_ISR
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_is_factory_flag
	global	_match_channel_flag
	global	_sys_stute
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\recive.c"
	line	60

;initializer for _is_factory_flag
	retlw	01h
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\key_scan.c"
	line	25

;initializer for _match_channel_flag
	retlw	010h
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\recive.c"
	line	40

;initializer for _sys_stute
	retlw	01h
	global	_ble_crc_38
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\recive.c"
	line	25
_ble_crc_38:
	retlw	0D6h
	retlw	0C5h
	retlw	044h
	retlw	020h
	retlw	059h
	retlw	0DEh
	retlw	0E1h
	retlw	08Fh
	retlw	01Bh
	retlw	0A5h
	retlw	0AFh
	retlw	042h
	retlw	07Bh
	retlw	04Eh
	retlw	0CDh
	retlw	060h
	retlw	0EBh
	retlw	062h
	retlw	022h
	retlw	090h
	retlw	02Ch
	retlw	0EFh
	retlw	0F0h
	retlw	0C7h
	retlw	08Dh
	retlw	0D2h
	retlw	057h
	retlw	0A1h
	retlw	03Dh
	retlw	0A7h
	retlw	066h
	retlw	0B0h
	retlw	075h
	retlw	031h
	retlw	011h
	retlw	048h
	retlw	096h
	retlw	077h
	retlw	0F8h
	retlw	0E3h
	retlw	046h
	retlw	0E9h
	global	_crc_2_4G_lib
psect	strings
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\recive.c"
	line	23
_crc_2_4G_lib:
	retlw	0C7h
	retlw	08Dh
	retlw	0D2h
	retlw	057h
	retlw	0A1h
	retlw	03Dh
	retlw	0A7h
	retlw	066h
	retlw	0B0h
	retlw	075h
	retlw	031h
	retlw	011h
	retlw	048h
	retlw	096h
	retlw	077h
	retlw	0F8h
	retlw	0E3h
	retlw	046h
	retlw	0E9h
	retlw	0ABh
	retlw	0D0h
	global	_crc_lab
psect	strings
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\recive.c"
	line	24
_crc_lab:
	retlw	041h
	retlw	092h
	retlw	053h
	retlw	02Ah
	retlw	0FCh
	retlw	0ABh
	retlw	0CEh
	retlw	026h
	retlw	0Dh
	retlw	01Eh
	retlw	099h
	retlw	078h
	retlw	0
	retlw	022h
	retlw	099h
	retlw	0DEh
	global	RF_Carrier@RF_cal2_data
psect	strings
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	386
RF_Carrier@RF_cal2_data:
	retlw	045h
	retlw	021h
	retlw	03Fh
	retlw	02Dh
	retlw	05Ch
	retlw	040h
	global	RF_Init@RF_cal2_data
psect	strings
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	64
RF_Init@RF_cal2_data:
	retlw	045h
	retlw	021h
	retlw	03Fh
	retlw	02Dh
	retlw	05Ch
	retlw	040h
	global	RF_Carrier@BB_cal_data
psect	strings
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	384
RF_Carrier@BB_cal_data:
	retlw	0Ah
	retlw	06Dh
	retlw	067h
	retlw	09Ch
	retlw	046h
	global	RF_Init@BB_cal_data
psect	strings
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	62
RF_Init@BB_cal_data:
	retlw	0Ah
	retlw	06Dh
	retlw	067h
	retlw	09Ch
	retlw	046h
	global	RF_Carrier@Dem_cal2_data
psect	strings
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	388
RF_Carrier@Dem_cal2_data:
	retlw	0Bh
	retlw	0DFh
	retlw	02h
	global	RF_Carrier@RF_cal_data
psect	strings
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	385
RF_Carrier@RF_cal_data:
	retlw	016h
	retlw	033h
	retlw	027h
	global	RF_Init@Dem_cal2_data
psect	strings
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	66
RF_Init@Dem_cal2_data:
	retlw	0Bh
	retlw	0DFh
	retlw	02h
	global	RF_Init@RF_cal_data
psect	strings
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	63
RF_Init@RF_cal_data:
	retlw	016h
	retlw	033h
	retlw	027h
	global	_RX_ADDRESS_DEF
psect	strings
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	7
_RX_ADDRESS_DEF:
	retlw	02Dh
	retlw	0D7h
	retlw	0B9h
	global	_TX_ADDRESS_DEF
psect	strings
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	6
_TX_ADDRESS_DEF:
	retlw	0CCh
	retlw	0CCh
	retlw	0CCh
	global	RF_Carrier@Dem_cal_data
psect	strings
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	387
RF_Carrier@Dem_cal_data:
	retlw	0E1h
	global	RF_Init@Dem_cal_data
psect	strings
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	65
RF_Init@Dem_cal_data:
	retlw	01h
	global	_ble_crc_38
	global	_crc_2_4G_lib
	global	_crc_lab
	global	RF_Carrier@RF_cal2_data
	global	RF_Init@RF_cal2_data
	global	RF_Carrier@BB_cal_data
	global	RF_Init@BB_cal_data
	global	RF_Carrier@Dem_cal2_data
	global	RF_Carrier@RF_cal_data
	global	RF_Init@Dem_cal2_data
	global	RF_Init@RF_cal_data
	global	_RX_ADDRESS_DEF
	global	_TX_ADDRESS_DEF
	global	RF_Carrier@Dem_cal_data
	global	RF_Init@Dem_cal_data
	global	_KEY0
	global	_KEY1
	global	_KEY2
	global	_channel_delay
	global	_flag_5min_add
	global	_flag_5s_add
	global	_flag_time_key0_add
	global	_flag_time_key1_add
	global	_flag_time_key2_add
	global	_delay_flag
	global	_key_long_flag
	global	_last_PORTB_value
	global	_KEY0_FLAG
	global	_KEY1_FLAG
	global	_KEY2_FLAG
	global	_Timer0_set_time
	global	_key_long_flag_add
	global	_virtual_timer_group
	global	_ADC_digital_value
	global	_rf_buf
	global	_channel_flag
	global	_channel_startup
	global	_channel_status
	global	_power_on_flag
	global	_control_id
	global	_power_on_delay_flag
psect	nvBANK0,class=BANK0,space=1
global __pnvBANK0
__pnvBANK0:
_power_on_delay_flag:
       ds      1

	global	_INTCON
_INTCON	set	11
	global	_PIR1
_PIR1	set	12
	global	_T1CON
_T1CON	set	16
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_RA4
_RA4	set	44
	global	_RA5
_RA5	set	45
	global	_RA7
_RA7	set	47
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB3
_RB3	set	51
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_RB6
_RB6	set	54
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RE1
_RE1	set	73
	global	_RE2
_RE2	set	74
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_OSCTUNE
_OSCTUNE	set	144
	global	_PIE1
_PIE1	set	140
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_WPUB
_WPUB	set	149
	global	_TRISA3
_TRISA3	set	1067
	global	_TRISA4
_TRISA4	set	1068
	global	_TRISA5
_TRISA5	set	1069
	global	_TRISA7
_TRISA7	set	1071
	global	_TRISB4
_TRISB4	set	1076
	global	_TRISB5
_TRISB5	set	1077
	global	_TRISB6
_TRISB6	set	1078
	global	_TRISC0
_TRISC0	set	1080
	global	_TRISC1
_TRISC1	set	1081
	global	_TRISE1
_TRISE1	set	1097
	global	_TRISE2
_TRISE2	set	1098
	global	_WPUC1
_WPUC1	set	3193
	file	"FWSWES-PAV03-SCENESWITCHES-PAN2416AV.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_KEY0_FLAG:
       ds      1

_KEY1_FLAG:
       ds      1

_KEY2_FLAG:
       ds      1

_Timer0_set_time:
       ds      1

_key_long_flag_add:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_KEY0:
       ds      3

_KEY1:
       ds      3

_KEY2:
       ds      3

_channel_delay:
       ds      3

_flag_5min_add:
       ds      2

_flag_5s_add:
       ds      2

_flag_time_key0_add:
       ds      2

_flag_time_key1_add:
       ds      2

_flag_time_key2_add:
       ds      2

_delay_flag:
       ds      1

_key_long_flag:
       ds      1

_last_PORTB_value:
       ds      1

_rf_buf:
       ds      18

_channel_flag:
       ds      1

_channel_startup:
       ds      1

_channel_status:
       ds      1

_power_on_flag:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\recive.c"
	line	60
_is_factory_flag:
       ds      1

psect	dataBANK0
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\key_scan.c"
	line	25
_match_channel_flag:
       ds      1

psect	dataBANK0
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\recive.c"
	line	40
_sys_stute:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_virtual_timer_group:
       ds      6

_ADC_digital_value:
       ds      2

_control_id:
       ds      72

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+02Fh)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+050h)
	fcall	clear_ram
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_sledBlink
?_sledBlink:	; 0 bytes @ 0x0
	global	?_system_set_CPU_frequency
?_system_set_CPU_frequency:	; 0 bytes @ 0x0
	global	?_IIC_Init
?_IIC_Init:	; 0 bytes @ 0x0
	global	?_key_Init
?_key_Init:	; 0 bytes @ 0x0
	global	?_RF_Init
?_RF_Init:	; 0 bytes @ 0x0
	global	?_RF_Set_RxMode
?_RF_Set_RxMode:	; 0 bytes @ 0x0
	global	?_Timer1_Init
?_Timer1_Init:	; 0 bytes @ 0x0
	global	?_Enable_Interrupt
?_Enable_Interrupt:	; 0 bytes @ 0x0
	global	?_recive_task
?_recive_task:	; 0 bytes @ 0x0
	global	?_key_value_read
?_key_value_read:	; 0 bytes @ 0x0
	global	?_delay_task
?_delay_task:	; 0 bytes @ 0x0
	global	?_TIMER1_ISR
?_TIMER1_ISR:	; 0 bytes @ 0x0
	global	??_TIMER1_ISR
??_TIMER1_ISR:	; 0 bytes @ 0x0
	global	?_SPI_init
?_SPI_init:	; 0 bytes @ 0x0
	global	?_RF_ClearFIFO
?_RF_ClearFIFO:	; 0 bytes @ 0x0
	global	?_RF_ClearStatus
?_RF_ClearStatus:	; 0 bytes @ 0x0
	global	?_loadPowerOnEeprom
?_loadPowerOnEeprom:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_key_scan
?_key_scan:	; 0 bytes @ 0x0
	global	?_iic_delay_us
?_iic_delay_us:	; 0 bytes @ 0x0
	global	?_IIC_START
?_IIC_START:	; 0 bytes @ 0x0
	global	?_IIC_STOP
?_IIC_STOP:	; 0 bytes @ 0x0
	global	?_IIC_ACK
?_IIC_ACK:	; 0 bytes @ 0x0
	global	?_IIC_NACK
?_IIC_NACK:	; 0 bytes @ 0x0
	global	?_I2C_SendByte
?_I2C_SendByte:	; 0 bytes @ 0x0
	global	?_RF_GetStatus
?_RF_GetStatus:	; 1 bytes @ 0x0
	global	?_RF_ReadReg
?_RF_ReadReg:	; 1 bytes @ 0x0
	global	?_SPI_RW
?_SPI_RW:	; 1 bytes @ 0x0
	global	?_rx_data
?_rx_data:	; 1 bytes @ 0x0
	global	?_IIC_Wait_ACK
?_IIC_Wait_ACK:	; 1 bytes @ 0x0
	global	?_AT24C02_Read_Byte
?_AT24C02_Read_Byte:	; 1 bytes @ 0x0
	global	?_loadParamsFromEeprom
?_loadParamsFromEeprom:	; 2 bytes @ 0x0
	ds	2
	global	ISR@peripheral_intterrupt_touch
ISR@peripheral_intterrupt_touch:	; 1 bytes @ 0x2
	ds	1
	global	?_soft_delay_ms
?_soft_delay_ms:	; 0 bytes @ 0x3
	global	??_system_set_CPU_frequency
??_system_set_CPU_frequency:	; 0 bytes @ 0x3
	global	??_IIC_Init
??_IIC_Init:	; 0 bytes @ 0x3
	global	??_key_Init
??_key_Init:	; 0 bytes @ 0x3
	global	??_Timer1_Init
??_Timer1_Init:	; 0 bytes @ 0x3
	global	?_Timer1_start
?_Timer1_start:	; 0 bytes @ 0x3
	global	??_Enable_Interrupt
??_Enable_Interrupt:	; 0 bytes @ 0x3
	global	?_channel_set
?_channel_set:	; 0 bytes @ 0x3
	global	??_SPI_init
??_SPI_init:	; 0 bytes @ 0x3
	global	??_SPI_RW
??_SPI_RW:	; 0 bytes @ 0x3
	global	??_iic_delay_us
??_iic_delay_us:	; 0 bytes @ 0x3
	global	?___bmul
?___bmul:	; 1 bytes @ 0x3
	global	?___lbdiv
?___lbdiv:	; 1 bytes @ 0x3
	global	?_UpdateCRC
?_UpdateCRC:	; 2 bytes @ 0x3
	global	system_set_CPU_frequency@CPU_Frequency
system_set_CPU_frequency@CPU_Frequency:	; 1 bytes @ 0x3
	global	Timer1_Init@TIMER1_DIVIDER
Timer1_Init@TIMER1_DIVIDER:	; 1 bytes @ 0x3
	global	SPI_RW@read_reg_addr
SPI_RW@read_reg_addr:	; 1 bytes @ 0x3
	global	channel_set@status
channel_set@status:	; 1 bytes @ 0x3
	global	iic_delay_us@delay
iic_delay_us@delay:	; 1 bytes @ 0x3
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x3
	global	___lbdiv@divisor
___lbdiv@divisor:	; 1 bytes @ 0x3
	global	Timer1_start@T_nums
Timer1_start@T_nums:	; 2 bytes @ 0x3
	global	soft_delay_ms@ms
soft_delay_ms@ms:	; 2 bytes @ 0x3
	global	UpdateCRC@len
UpdateCRC@len:	; 2 bytes @ 0x3
	ds	1
	global	??_channel_set
??_channel_set:	; 0 bytes @ 0x4
	global	??_IIC_START
??_IIC_START:	; 0 bytes @ 0x4
	global	??_IIC_STOP
??_IIC_STOP:	; 0 bytes @ 0x4
	global	??_IIC_Wait_ACK
??_IIC_Wait_ACK:	; 0 bytes @ 0x4
	global	??_IIC_ACK
??_IIC_ACK:	; 0 bytes @ 0x4
	global	??_IIC_NACK
??_IIC_NACK:	; 0 bytes @ 0x4
	global	??_I2C_SendByte
??_I2C_SendByte:	; 0 bytes @ 0x4
	global	??___bmul
??___bmul:	; 0 bytes @ 0x4
	global	??___lbdiv
??___lbdiv:	; 0 bytes @ 0x4
	global	?_I2C_ReadByte
?_I2C_ReadByte:	; 2 bytes @ 0x4
	global	SPI_RW@i
SPI_RW@i:	; 1 bytes @ 0x4
	global	channel_set@channel_num
channel_set@channel_num:	; 1 bytes @ 0x4
	global	I2C_SendByte@Data
I2C_SendByte@Data:	; 1 bytes @ 0x4
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x4
	ds	1
	global	??_soft_delay_ms
??_soft_delay_ms:	; 0 bytes @ 0x5
	global	??_sledBlink
??_sledBlink:	; 0 bytes @ 0x5
	global	??_RF_GetStatus
??_RF_GetStatus:	; 0 bytes @ 0x5
	global	?_RF_WriteReg
?_RF_WriteReg:	; 0 bytes @ 0x5
	global	??_RF_Write_Buff
??_RF_Write_Buff:	; 0 bytes @ 0x5
	global	??_RF_Read_Buff
??_RF_Read_Buff:	; 0 bytes @ 0x5
	global	??_RF_ReadReg
??_RF_ReadReg:	; 0 bytes @ 0x5
	global	??_key_scan
??_key_scan:	; 0 bytes @ 0x5
	global	Timer1_start@Timer1_ISR_execution_total_time
Timer1_start@Timer1_ISR_execution_total_time:	; 1 bytes @ 0x5
	global	RF_WriteReg@write_data
RF_WriteReg@write_data:	; 1 bytes @ 0x5
	global	I2C_SendByte@cnt
I2C_SendByte@cnt:	; 1 bytes @ 0x5
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x5
	ds	1
	global	??_RF_Init
??_RF_Init:	; 0 bytes @ 0x6
	global	??_RF_Set_RxMode
??_RF_Set_RxMode:	; 0 bytes @ 0x6
	global	??_Timer1_start
??_Timer1_start:	; 0 bytes @ 0x6
	global	??_key_value_read
??_key_value_read:	; 0 bytes @ 0x6
	global	??_delay_task
??_delay_task:	; 0 bytes @ 0x6
	global	??_RF_WriteReg
??_RF_WriteReg:	; 0 bytes @ 0x6
	global	??_RF_ClearFIFO
??_RF_ClearFIFO:	; 0 bytes @ 0x6
	global	??_RF_ClearStatus
??_RF_ClearStatus:	; 0 bytes @ 0x6
	global	??_AT24C02_Write_Byte
??_AT24C02_Write_Byte:	; 0 bytes @ 0x6
	global	??_loadPowerOnEeprom
??_loadPowerOnEeprom:	; 0 bytes @ 0x6
	global	??_main
??_main:	; 0 bytes @ 0x6
	global	??_I2C_ReadByte
??_I2C_ReadByte:	; 0 bytes @ 0x6
	global	??_AT24C02_Read_Byte
??_AT24C02_Read_Byte:	; 0 bytes @ 0x6
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_RF_Write_Buff
?_RF_Write_Buff:	; 0 bytes @ 0x0
	global	?_RF_Read_Buff
?_RF_Read_Buff:	; 0 bytes @ 0x0
	global	?_AT24C02_Write_Byte
?_AT24C02_Write_Byte:	; 0 bytes @ 0x0
	global	??_UpdateCRC
??_UpdateCRC:	; 0 bytes @ 0x0
	global	RF_Read_Buff@pBuff
RF_Read_Buff@pBuff:	; 1 bytes @ 0x0
	global	RF_Write_Buff@pBuff
RF_Write_Buff@pBuff:	; 1 bytes @ 0x0
	global	RF_WriteReg@reg_addr
RF_WriteReg@reg_addr:	; 1 bytes @ 0x0
	global	RF_ReadReg@reg_addr
RF_ReadReg@reg_addr:	; 1 bytes @ 0x0
	global	I2C_ReadByte@ack
I2C_ReadByte@ack:	; 1 bytes @ 0x0
	global	AT24C02_Write_Byte@data
AT24C02_Write_Byte@data:	; 1 bytes @ 0x0
	global	___lbdiv@dividend
___lbdiv@dividend:	; 1 bytes @ 0x0
	global	soft_delay_ms@i
soft_delay_ms@i:	; 2 bytes @ 0x0
	ds	1
	global	RF_Read_Buff@length
RF_Read_Buff@length:	; 1 bytes @ 0x1
	global	RF_Write_Buff@length
RF_Write_Buff@length:	; 1 bytes @ 0x1
	global	RF_ReadReg@tmp
RF_ReadReg@tmp:	; 1 bytes @ 0x1
	global	AT24C02_Write_Byte@addr
AT24C02_Write_Byte@addr:	; 1 bytes @ 0x1
	global	___lbdiv@counter
___lbdiv@counter:	; 1 bytes @ 0x1
	global	I2C_ReadByte@data
I2C_ReadByte@data:	; 2 bytes @ 0x1
	ds	1
	global	RF_Read_Buff@reg_addr
RF_Read_Buff@reg_addr:	; 1 bytes @ 0x2
	global	RF_Write_Buff@reg_addr
RF_Write_Buff@reg_addr:	; 1 bytes @ 0x2
	global	soft_delay_ms@j
soft_delay_ms@j:	; 1 bytes @ 0x2
	global	___lbdiv@quotient
___lbdiv@quotient:	; 1 bytes @ 0x2
	ds	1
	global	RF_Read_Buff@byte_ctr
RF_Read_Buff@byte_ctr:	; 1 bytes @ 0x3
	global	RF_Write_Buff@i
RF_Write_Buff@i:	; 1 bytes @ 0x3
	global	soft_delay_ms@k
soft_delay_ms@k:	; 1 bytes @ 0x3
	global	UpdateCRC@CRC_input
UpdateCRC@CRC_input:	; 1 bytes @ 0x3
	global	I2C_ReadByte@cnt
I2C_ReadByte@cnt:	; 1 bytes @ 0x3
	ds	1
	global	?_AT24C02_Write_Msg
?_AT24C02_Write_Msg:	; 0 bytes @ 0x4
	global	?_RF_RxData
?_RF_RxData:	; 1 bytes @ 0x4
	global	RF_RxData@length
RF_RxData@length:	; 1 bytes @ 0x4
	global	UpdateCRC@k
UpdateCRC@k:	; 1 bytes @ 0x4
	global	AT24C02_Read_Byte@addr
AT24C02_Read_Byte@addr:	; 1 bytes @ 0x4
	global	AT24C02_Write_Msg@data
AT24C02_Write_Msg@data:	; 1 bytes @ 0x4
	ds	1
	global	??_RF_RxData
??_RF_RxData:	; 0 bytes @ 0x5
	global	UpdateCRC@i
UpdateCRC@i:	; 1 bytes @ 0x5
	global	AT24C02_Read_Byte@temp
AT24C02_Read_Byte@temp:	; 1 bytes @ 0x5
	global	AT24C02_Write_Msg@len
AT24C02_Write_Msg@len:	; 1 bytes @ 0x5
	ds	1
	global	?_AT24C02_Read_Msg
?_AT24C02_Read_Msg:	; 0 bytes @ 0x6
	global	??_AT24C02_Write_Msg
??_AT24C02_Write_Msg:	; 0 bytes @ 0x6
	global	RF_RxData@payload_buff
RF_RxData@payload_buff:	; 1 bytes @ 0x6
	global	AT24C02_Read_Msg@data
AT24C02_Read_Msg@data:	; 1 bytes @ 0x6
	global	UpdateCRC@CRC_acc
UpdateCRC@CRC_acc:	; 2 bytes @ 0x6
	ds	1
	global	AT24C02_Write_Msg@addr
AT24C02_Write_Msg@addr:	; 1 bytes @ 0x7
	global	AT24C02_Read_Msg@len
AT24C02_Read_Msg@len:	; 1 bytes @ 0x7
	ds	1
	global	??_AT24C02_Read_Msg
??_AT24C02_Read_Msg:	; 0 bytes @ 0x8
	global	??_rx_data
??_rx_data:	; 0 bytes @ 0x8
	global	AT24C02_Write_Msg@i
AT24C02_Write_Msg@i:	; 1 bytes @ 0x8
	ds	1
	global	?_setChannelStatus
?_setChannelStatus:	; 0 bytes @ 0x9
	global	setChannelStatus@status
setChannelStatus@status:	; 1 bytes @ 0x9
	global	AT24C02_Read_Msg@addr
AT24C02_Read_Msg@addr:	; 1 bytes @ 0x9
	ds	1
	global	??_setChannelStatus
??_setChannelStatus:	; 0 bytes @ 0xA
	global	AT24C02_Read_Msg@i
AT24C02_Read_Msg@i:	; 1 bytes @ 0xA
	ds	1
	global	setChannelStatus@channel
setChannelStatus@channel:	; 1 bytes @ 0xB
	global	rx_data@crc16
rx_data@crc16:	; 2 bytes @ 0xB
	ds	1
	global	??_loadParamsFromEeprom
??_loadParamsFromEeprom:	; 0 bytes @ 0xC
	ds	1
	global	rx_data@rand
rx_data@rand:	; 1 bytes @ 0xD
	ds	1
	global	rx_data@rx_flag
rx_data@rx_flag:	; 1 bytes @ 0xE
	global	loadParamsFromEeprom@factory_flag
loadParamsFromEeprom@factory_flag:	; 2 bytes @ 0xE
	ds	1
	global	rx_data@i
rx_data@i:	; 1 bytes @ 0xF
	ds	1
	global	??_recive_task
??_recive_task:	; 0 bytes @ 0x10
	global	loadParamsFromEeprom@startup
loadParamsFromEeprom@startup:	; 1 bytes @ 0x10
	ds	1
	global	loadParamsFromEeprom@i
loadParamsFromEeprom@i:	; 1 bytes @ 0x11
	ds	3
	global	recive_task@msg
recive_task@msg:	; 6 bytes @ 0x14
	ds	6
	global	recive_task@match_flag
recive_task@match_flag:	; 1 bytes @ 0x1A
	ds	1
	global	recive_task@flag
recive_task@flag:	; 1 bytes @ 0x1B
	ds	1
	global	recive_task@i
recive_task@i:	; 1 bytes @ 0x1C
	ds	1
;;Data sizes: Strings 0, constant 121, data 3, bss 132, persistent 1 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6      11
;; BANK0           80     29      80
;; BANK1           80      0      80

;;
;; Pointer list with targets:

;; ?_I2C_ReadByte	unsigned int  size(1) Largest target is 0
;;
;; ?_UpdateCRC	unsigned short  size(1) Largest target is 0
;;
;; AT24C02_Read_Msg@data	PTR unsigned char  size(1) Largest target is 72
;;		 -> channel_startup(BANK0[1]), channel_status(BANK0[1]), channel_flag(BANK0[1]), control_id(BANK1[72]), 
;;		 -> loadParamsFromEeprom@factory_flag(BANK0[2]), power_on_flag(BANK0[1]), 
;;
;; AT24C02_Write_Msg@data	PTR unsigned char  size(1) Largest target is 72
;;		 -> recive_task@msg(BANK0[6]), channel_startup(BANK0[1]), channel_status(BANK0[1]), channel_flag(BANK0[1]), 
;;		 -> control_id(BANK1[72]), power_on_flag(BANK0[1]), 
;;
;; UpdateCRC@CRC_input	PTR unsigned char  size(1) Largest target is 18
;;		 -> rf_buf(BANK0[18]), 
;;
;; RF_Write_Buff@pBuff	PTR unsigned char  size(1) Largest target is 6
;;		 -> RF_Carrier@Dem_cal2_data(CODE[3]), RF_Carrier@RF_cal_data(CODE[3]), RF_Carrier@Dem_cal_data(CODE[1]), RF_Carrier@RF_cal2_data(CODE[6]), 
;;		 -> RF_Carrier@BB_cal_data(CODE[5]), RF_Init@Dem_cal2_data(CODE[3]), RF_Init@RF_cal_data(CODE[3]), RF_Init@Dem_cal_data(CODE[1]), 
;;		 -> RF_Init@RF_cal2_data(CODE[6]), RF_Init@BB_cal_data(CODE[5]), RX_ADDRESS_DEF(CODE[3]), TX_ADDRESS_DEF(CODE[3]), 
;;
;; RF_Read_Buff@pBuff	PTR unsigned char  size(1) Largest target is 18
;;		 -> rf_buf(BANK0[18]), 
;;
;; RF_RxData@payload_buff	PTR unsigned char  size(1) Largest target is 18
;;		 -> rf_buf(BANK0[18]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_Timer1_start
;;   _recive_task->___bmul
;;   _loadParamsFromEeprom->___bmul
;;   _AT24C02_Read_Msg->___bmul
;;   _AT24C02_Read_Byte->_I2C_SendByte
;;   _AT24C02_Read_Byte->_I2C_ReadByte
;;   _RF_RxData->_RF_Read_Buff
;;   _AT24C02_Write_Msg->___bmul
;;   _I2C_ReadByte->_iic_delay_us
;;   _AT24C02_Write_Byte->_I2C_SendByte
;;   _RF_ClearStatus->_RF_WriteReg
;;   _RF_ClearFIFO->_RF_WriteReg
;;   _RF_Set_RxMode->_RF_WriteReg
;;   _RF_Init->_RF_WriteReg
;;   _I2C_SendByte->_iic_delay_us
;;   _IIC_NACK->_iic_delay_us
;;   _IIC_ACK->_iic_delay_us
;;   _IIC_Wait_ACK->_iic_delay_us
;;   _IIC_STOP->_iic_delay_us
;;   _IIC_START->_iic_delay_us
;;   _key_scan->_soft_delay_ms
;;   _RF_ReadReg->_SPI_RW
;;   _RF_Read_Buff->_SPI_RW
;;   _RF_Write_Buff->_SPI_RW
;;   _RF_WriteReg->_SPI_RW
;;   _sledBlink->_soft_delay_ms
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_recive_task
;;   _delay_task->_setChannelStatus
;;   _key_value_read->_setChannelStatus
;;   _recive_task->_rx_data
;;   _loadParamsFromEeprom->_setChannelStatus
;;   _loadPowerOnEeprom->_AT24C02_Read_Msg
;;   _rx_data->_UpdateCRC
;;   _setChannelStatus->_AT24C02_Write_Msg
;;   _AT24C02_Read_Msg->_AT24C02_Read_Byte
;;   _AT24C02_Read_Byte->_I2C_ReadByte
;;   _RF_RxData->_RF_Read_Buff
;;   _AT24C02_Write_Msg->_soft_delay_ms
;;   _RF_ClearStatus->_RF_WriteReg
;;   _RF_ClearFIFO->_RF_WriteReg
;;   _RF_GetStatus->_RF_ReadReg
;;   _RF_Set_RxMode->_soft_delay_ms
;;   _RF_Init->_RF_Write_Buff
;;   _key_scan->_soft_delay_ms
;;   _sledBlink->_soft_delay_ms
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0   19959
;;           _system_set_CPU_frequency
;;                  _loadPowerOnEeprom
;;                      _soft_delay_ms
;;                           _IIC_Init
;;                           _key_Init
;;                            _RF_Init
;;                      _RF_Set_RxMode
;;                        _Timer1_Init
;;                       _Timer1_start
;;               _loadParamsFromEeprom
;;                   _Enable_Interrupt
;;                        _channel_set
;;                        _recive_task
;;                     _key_value_read
;;                         _delay_task
;; ---------------------------------------------------------------------------------
;; (1) _delay_task                                           0     0      0    1438
;;                  _AT24C02_Write_Msg
;;                   _setChannelStatus
;; ---------------------------------------------------------------------------------
;; (1) _key_value_read                                       0     0      0    1319
;;                           _key_scan
;;                          _sledBlink
;;                      _soft_delay_ms
;;                   _setChannelStatus
;; ---------------------------------------------------------------------------------
;; (1) _recive_task                                         13    13      0   12289
;;                                             16 BANK0     13    13      0
;;                 _AT24C02_Write_Byte
;;                      _soft_delay_ms
;;                             ___bmul
;;                   _AT24C02_Read_Msg
;;                          _sledBlink
;;                            _rx_data
;;                  _AT24C02_Write_Msg
;;                   _setChannelStatus
;;                            ___lbdiv
;;                       _RF_ClearFIFO
;;                     _RF_ClearStatus
;; ---------------------------------------------------------------------------------
;; (1) _loadParamsFromEeprom                                 6     6      0    2291
;;                                             12 BANK0      6     6      0
;;                             ___bmul
;;                   _AT24C02_Read_Msg
;;                   _setChannelStatus
;; ---------------------------------------------------------------------------------
;; (1) _loadPowerOnEeprom                                    0     0      0    1484
;;                   _AT24C02_Read_Msg
;;                  _AT24C02_Write_Msg
;;                      _soft_delay_ms
;;                          _sledBlink
;; ---------------------------------------------------------------------------------
;; (2) _rx_data                                              8     8      0    1697
;;                                              8 BANK0      8     8      0
;;                          _RF_RxData
;;                          _UpdateCRC
;; ---------------------------------------------------------------------------------
;; (2) _setChannelStatus                                     3     2      1     905
;;                                              9 BANK0      3     2      1
;;                  _AT24C02_Write_Msg
;; ---------------------------------------------------------------------------------
;; (2) _AT24C02_Read_Msg                                     5     3      2     675
;;                                              6 BANK0      5     3      2
;;                  _AT24C02_Read_Byte
;;                      _soft_delay_ms
;;                             ___bmul (ARG)
;; ---------------------------------------------------------------------------------
;; (3) _AT24C02_Read_Byte                                    2     2      0     370
;;                                              4 BANK0      2     2      0
;;                          _IIC_START
;;                       _I2C_SendByte
;;                       _IIC_Wait_ACK
;;                       _I2C_ReadByte
;;                           _IIC_STOP
;; ---------------------------------------------------------------------------------
;; (3) _RF_RxData                                            3     2      1     956
;;                                              4 BANK0      3     2      1
;;                       _RF_GetStatus
;;                       _RF_Read_Buff
;;                       _RF_ClearFIFO
;;                     _RF_ClearStatus
;; ---------------------------------------------------------------------------------
;; (3) _AT24C02_Write_Msg                                    5     3      2     533
;;                                              4 BANK0      5     3      2
;;                 _AT24C02_Write_Byte
;;                      _soft_delay_ms
;;                             ___bmul (ARG)
;; ---------------------------------------------------------------------------------
;; (4) _I2C_ReadByte                                         6     4      2     158
;;                                              4 COMMON     2     0      2
;;                                              0 BANK0      4     4      0
;;                       _iic_delay_us
;;                           _IIC_NACK
;;                            _IIC_ACK
;; ---------------------------------------------------------------------------------
;; (4) _AT24C02_Write_Byte                                   2     1      1     228
;;                                              0 BANK0      2     1      1
;;                          _IIC_START
;;                       _I2C_SendByte
;;                       _IIC_Wait_ACK
;;                           _IIC_STOP
;; ---------------------------------------------------------------------------------
;; (2) _RF_ClearStatus                                       0     0      0     198
;;                        _RF_WriteReg
;; ---------------------------------------------------------------------------------
;; (2) _RF_ClearFIFO                                         0     0      0     198
;;                        _RF_WriteReg
;; ---------------------------------------------------------------------------------
;; (4) _RF_GetStatus                                         0     0      0     201
;;                         _RF_ReadReg
;; ---------------------------------------------------------------------------------
;; (1) _RF_Set_RxMode                                        0     0      0     336
;;                        _RF_WriteReg
;;                      _soft_delay_ms
;; ---------------------------------------------------------------------------------
;; (1) _RF_Init                                              1     1      0     532
;;                                              4 BANK0      1     1      0
;;                           _SPI_init
;;                        _RF_WriteReg
;;                      _RF_Write_Buff
;; ---------------------------------------------------------------------------------
;; (5) _I2C_SendByte                                         2     2      0      91
;;                                              4 COMMON     2     2      0
;;                       _iic_delay_us
;; ---------------------------------------------------------------------------------
;; (5) _IIC_NACK                                             0     0      0      22
;;                       _iic_delay_us
;; ---------------------------------------------------------------------------------
;; (5) _IIC_ACK                                              0     0      0      22
;;                       _iic_delay_us
;; ---------------------------------------------------------------------------------
;; (5) _IIC_Wait_ACK                                         1     1      0      31
;;                                              4 COMMON     1     1      0
;;                       _iic_delay_us
;; ---------------------------------------------------------------------------------
;; (5) _IIC_STOP                                             0     0      0      22
;;                       _iic_delay_us
;; ---------------------------------------------------------------------------------
;; (5) _IIC_START                                            0     0      0      22
;;                       _iic_delay_us
;; ---------------------------------------------------------------------------------
;; (2) _key_scan                                             0     0      0     138
;;                      _soft_delay_ms
;; ---------------------------------------------------------------------------------
;; (5) _RF_ReadReg                                           2     2      0     201
;;                                              0 BANK0      2     2      0
;;                             _SPI_RW
;; ---------------------------------------------------------------------------------
;; (4) _RF_Read_Buff                                         5     3      2     297
;;                                              5 COMMON     1     1      0
;;                                              0 BANK0      4     2      2
;;                             _SPI_RW
;; ---------------------------------------------------------------------------------
;; (2) _RF_Write_Buff                                        4     2      2     297
;;                                              0 BANK0      4     2      2
;;                             _SPI_RW
;; ---------------------------------------------------------------------------------
;; (3) _RF_WriteReg                                          2     1      1     198
;;                                              5 COMMON     1     0      1
;;                                              0 BANK0      1     1      0
;;                             _SPI_RW
;; ---------------------------------------------------------------------------------
;; (2) _sledBlink                                            0     0      0     138
;;                      _soft_delay_ms
;; ---------------------------------------------------------------------------------
;; (2) ___lbdiv                                              4     3      1     241
;;                                              3 COMMON     1     0      1
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (2) ___bmul                                               3     2      1      92
;;                                              3 COMMON     3     2      1
;; ---------------------------------------------------------------------------------
;; (6) _iic_delay_us                                         1     1      0      22
;;                                              3 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (3) _UpdateCRC                                           10     8      2     169
;;                                              3 COMMON     2     0      2
;;                                              0 BANK0      8     8      0
;; ---------------------------------------------------------------------------------
;; (4) _SPI_RW                                               2     2      0     136
;;                                              3 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _SPI_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _channel_set                                          2     1      1      88
;;                                              3 COMMON     2     1      1
;; ---------------------------------------------------------------------------------
;; (1) _Enable_Interrupt                                     0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _Timer1_start                                         3     0      3       0
;;                                              3 COMMON     3     0      3
;; ---------------------------------------------------------------------------------
;; (1) _Timer1_Init                                          1     1      0      22
;;                                              3 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _key_Init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _IIC_Init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _system_set_CPU_frequency                             1     1      0      22
;;                                              3 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (4) _soft_delay_ms                                        6     4      2     138
;;                                              3 COMMON     2     0      2
;;                                              0 BANK0      4     4      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 6
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (7) _ISR                                                  6     6      0      24
;;                                              0 COMMON     3     3      0
;;                         _TIMER1_ISR
;; ---------------------------------------------------------------------------------
;; (8) _TIMER1_ISR                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 8
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _system_set_CPU_frequency
;;   _loadPowerOnEeprom
;;     _AT24C02_Read_Msg
;;       _AT24C02_Read_Byte
;;         _IIC_START
;;           _iic_delay_us
;;         _I2C_SendByte
;;           _iic_delay_us
;;         _IIC_Wait_ACK
;;           _iic_delay_us
;;         _I2C_ReadByte
;;           _iic_delay_us
;;           _IIC_NACK
;;             _iic_delay_us
;;           _IIC_ACK
;;             _iic_delay_us
;;         _IIC_STOP
;;           _iic_delay_us
;;       _soft_delay_ms
;;       ___bmul (ARG)
;;     _AT24C02_Write_Msg
;;       _AT24C02_Write_Byte
;;         _IIC_START
;;           _iic_delay_us
;;         _I2C_SendByte
;;           _iic_delay_us
;;         _IIC_Wait_ACK
;;           _iic_delay_us
;;         _IIC_STOP
;;           _iic_delay_us
;;       _soft_delay_ms
;;       ___bmul (ARG)
;;     _soft_delay_ms
;;     _sledBlink
;;       _soft_delay_ms
;;   _soft_delay_ms
;;   _IIC_Init
;;   _key_Init
;;   _RF_Init
;;     _SPI_init
;;     _RF_WriteReg
;;       _SPI_RW
;;     _RF_Write_Buff
;;       _SPI_RW
;;   _RF_Set_RxMode
;;     _RF_WriteReg
;;       _SPI_RW
;;     _soft_delay_ms
;;   _Timer1_Init
;;   _Timer1_start
;;   _loadParamsFromEeprom
;;     ___bmul
;;     _AT24C02_Read_Msg
;;       _AT24C02_Read_Byte
;;         _IIC_START
;;           _iic_delay_us
;;         _I2C_SendByte
;;           _iic_delay_us
;;         _IIC_Wait_ACK
;;           _iic_delay_us
;;         _I2C_ReadByte
;;           _iic_delay_us
;;           _IIC_NACK
;;             _iic_delay_us
;;           _IIC_ACK
;;             _iic_delay_us
;;         _IIC_STOP
;;           _iic_delay_us
;;       _soft_delay_ms
;;       ___bmul (ARG)
;;     _setChannelStatus
;;       _AT24C02_Write_Msg
;;         _AT24C02_Write_Byte
;;           _IIC_START
;;             _iic_delay_us
;;           _I2C_SendByte
;;             _iic_delay_us
;;           _IIC_Wait_ACK
;;             _iic_delay_us
;;           _IIC_STOP
;;             _iic_delay_us
;;         _soft_delay_ms
;;         ___bmul (ARG)
;;   _Enable_Interrupt
;;   _channel_set
;;   _recive_task
;;     _AT24C02_Write_Byte
;;       _IIC_START
;;         _iic_delay_us
;;       _I2C_SendByte
;;         _iic_delay_us
;;       _IIC_Wait_ACK
;;         _iic_delay_us
;;       _IIC_STOP
;;         _iic_delay_us
;;     _soft_delay_ms
;;     ___bmul
;;     _AT24C02_Read_Msg
;;       _AT24C02_Read_Byte
;;         _IIC_START
;;           _iic_delay_us
;;         _I2C_SendByte
;;           _iic_delay_us
;;         _IIC_Wait_ACK
;;           _iic_delay_us
;;         _I2C_ReadByte
;;           _iic_delay_us
;;           _IIC_NACK
;;             _iic_delay_us
;;           _IIC_ACK
;;             _iic_delay_us
;;         _IIC_STOP
;;           _iic_delay_us
;;       _soft_delay_ms
;;       ___bmul (ARG)
;;     _sledBlink
;;       _soft_delay_ms
;;     _rx_data
;;       _RF_RxData
;;         _RF_GetStatus
;;           _RF_ReadReg
;;             _SPI_RW
;;         _RF_Read_Buff
;;           _SPI_RW
;;         _RF_ClearFIFO
;;           _RF_WriteReg
;;             _SPI_RW
;;         _RF_ClearStatus
;;           _RF_WriteReg
;;             _SPI_RW
;;       _UpdateCRC
;;     _AT24C02_Write_Msg
;;       _AT24C02_Write_Byte
;;         _IIC_START
;;           _iic_delay_us
;;         _I2C_SendByte
;;           _iic_delay_us
;;         _IIC_Wait_ACK
;;           _iic_delay_us
;;         _IIC_STOP
;;           _iic_delay_us
;;       _soft_delay_ms
;;       ___bmul (ARG)
;;     _setChannelStatus
;;       _AT24C02_Write_Msg
;;         _AT24C02_Write_Byte
;;           _IIC_START
;;             _iic_delay_us
;;           _I2C_SendByte
;;             _iic_delay_us
;;           _IIC_Wait_ACK
;;             _iic_delay_us
;;           _IIC_STOP
;;             _iic_delay_us
;;         _soft_delay_ms
;;         ___bmul (ARG)
;;     ___lbdiv
;;     _RF_ClearFIFO
;;       _RF_WriteReg
;;         _SPI_RW
;;     _RF_ClearStatus
;;       _RF_WriteReg
;;         _SPI_RW
;;   _key_value_read
;;     _key_scan
;;       _soft_delay_ms
;;     _sledBlink
;;       _soft_delay_ms
;;     _soft_delay_ms
;;     _setChannelStatus
;;       _AT24C02_Write_Msg
;;         _AT24C02_Write_Byte
;;           _IIC_START
;;             _iic_delay_us
;;           _I2C_SendByte
;;             _iic_delay_us
;;           _IIC_Wait_ACK
;;             _iic_delay_us
;;           _IIC_STOP
;;             _iic_delay_us
;;         _soft_delay_ms
;;         ___bmul (ARG)
;;   _delay_task
;;     _AT24C02_Write_Msg
;;       _AT24C02_Write_Byte
;;         _IIC_START
;;           _iic_delay_us
;;         _I2C_SendByte
;;           _iic_delay_us
;;         _IIC_Wait_ACK
;;           _iic_delay_us
;;         _IIC_STOP
;;           _iic_delay_us
;;       _soft_delay_ms
;;       ___bmul (ARG)
;;     _setChannelStatus
;;       _AT24C02_Write_Msg
;;         _AT24C02_Write_Byte
;;           _IIC_START
;;             _iic_delay_us
;;           _I2C_SendByte
;;             _iic_delay_us
;;           _IIC_Wait_ACK
;;             _iic_delay_us
;;           _IIC_STOP
;;             _iic_delay_us
;;         _soft_delay_ms
;;         ___bmul (ARG)
;;
;; _ISR (ROOT)
;;   _TIMER1_ISR
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0      50       7      100.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      B5       8        0.0%
;;ABS                  0      0      AB       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       A       2        0.0%
;;BANK0               50     1D      50       5      100.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      6       B       1       78.6%
;;BITCOMMON            E      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 170 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_system_set_CPU_frequency
;;		_loadPowerOnEeprom
;;		_soft_delay_ms
;;		_IIC_Init
;;		_key_Init
;;		_RF_Init
;;		_RF_Set_RxMode
;;		_Timer1_Init
;;		_Timer1_start
;;		_loadParamsFromEeprom
;;		_Enable_Interrupt
;;		_channel_set
;;		_recive_task
;;		_key_value_read
;;		_delay_task
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\main.c"
	line	170
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	171
	
l18340:	
;main.c: 171: system_set_CPU_frequency(CPU_FREQUENCY_8M);
	movlw	(071h)
	fcall	_system_set_CPU_frequency
	line	173
	
l18342:	
;main.c: 173: TRISC = 0x00;
	clrf	(135)^080h	;volatile
	line	174
	
l18344:	
;main.c: 174: TRISB |= 0x70;
	movlw	(070h)
	iorwf	(134)^080h,f	;volatile
	line	176
	
l18346:	
;main.c: 176: RC0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	177
	
l18348:	
;main.c: 177: loadPowerOnEeprom();
	fcall	_loadPowerOnEeprom
	line	179
	
l18350:	
;main.c: 179: soft_delay_ms(500);
	movlw	low(01F4h)
	movwf	(?_soft_delay_ms)
	movlw	high(01F4h)
	movwf	((?_soft_delay_ms))+1
	fcall	_soft_delay_ms
	line	180
	
l18352:	
# 180 "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\main.c"
nop ;#
psect	maintext
	line	183
	
l18354:	
;main.c: 183: IIC_Init();
	fcall	_IIC_Init
	line	184
	
l18356:	
;main.c: 184: key_Init();
	fcall	_key_Init
	line	185
	
l18358:	
;main.c: 185: RF_Init();
	fcall	_RF_Init
	line	186
	
l18360:	
;main.c: 186: RF_Set_RxMode();
	fcall	_RF_Set_RxMode
	line	188
	
l18362:	
;main.c: 188: Timer1_Init(TIMER1_DIV_8);
	movlw	(030h)
	fcall	_Timer1_Init
	line	189
	
l18364:	
;main.c: 189: Timer1_start(10000, 0);
	movlw	low(02710h)
	movwf	(?_Timer1_start)
	movlw	high(02710h)
	movwf	((?_Timer1_start))+1
	clrf	0+(?_Timer1_start)+02h
	fcall	_Timer1_start
	line	191
	
l18366:	
;main.c: 191: loadParamsFromEeprom();
	fcall	_loadParamsFromEeprom
	line	192
	
l18368:	
;main.c: 192: Enable_Interrupt();
	fcall	_Enable_Interrupt
	line	198
	
l18370:	
;main.c: 197: {
;main.c: 198: channel_set(0, KEY0.channel_status);
	movf	(_KEY0),w
	movwf	(?_channel_set)
	movlw	(0)
	fcall	_channel_set
	line	199
	
l18372:	
;main.c: 199: channel_set(1, KEY1.channel_status);
	movf	(_KEY1),w
	movwf	(?_channel_set)
	movlw	(01h)
	fcall	_channel_set
	line	200
	
l18374:	
;main.c: 200: channel_set(2, KEY2.channel_status);
	movf	(_KEY2),w
	movwf	(?_channel_set)
	movlw	(02h)
	fcall	_channel_set
	line	202
	
l18376:	
;main.c: 202: recive_task();
	fcall	_recive_task
	line	204
	
l18378:	
;main.c: 204: key_value_read();
	fcall	_key_value_read
	line	206
	
l18380:	
;main.c: 206: delay_task();
	fcall	_delay_task
	goto	l18370
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	208
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_delay_task
psect	text1240,local,class=CODE,delta=2
global __ptext1240
__ptext1240:

;; *************** function _delay_task *****************
;; Defined at:
;;		line 931 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\recive.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_AT24C02_Write_Msg
;;		_setChannelStatus
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1240
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\recive.c"
	line	931
	global	__size_of_delay_task
	__size_of_delay_task	equ	__end_of_delay_task-_delay_task
	
_delay_task:	
	opt	stack 0
; Regs used in _delay_task: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	932
	
l18296:	
;recive.c: 932: if(power_on_delay_flag == 1)
	decf	(_power_on_delay_flag),w
	skipz
	goto	u8771
	goto	u8770
u8771:
	goto	l18304
u8770:
	line	934
	
l18298:	
;recive.c: 933: {
;recive.c: 934: if(flag_5s_add > 200)
	movlw	high(0C9h)
	subwf	(_flag_5s_add+1),w
	movlw	low(0C9h)
	skipnz
	subwf	(_flag_5s_add),w
	skipc
	goto	u8781
	goto	u8780
u8781:
	goto	l18304
u8780:
	line	936
	
l18300:	
;recive.c: 935: {
;recive.c: 936: power_on_delay_flag = 0;
	clrf	(_power_on_delay_flag)
	line	937
;recive.c: 937: power_on_flag = 0;
	clrf	(_power_on_flag)
	line	938
	
l18302:	
;recive.c: 938: AT24C02_Write_Msg(115, &power_on_flag, 1);
	movlw	(_power_on_flag)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(073h)
	fcall	_AT24C02_Write_Msg
	line	942
	
l18304:	
;recive.c: 939: }
;recive.c: 940: }
;recive.c: 942: if(channel_delay[0] != 0)
	movf	(_channel_delay),w
	skipz
	goto	u8790
	goto	l10138
u8790:
	line	944
	
l18306:	
;recive.c: 943: {
;recive.c: 944: if(delay_flag == 0)delay_flag = 1;
	movf	(_delay_flag),f
	skipz
	goto	u8801
	goto	u8800
u8801:
	goto	l18310
u8800:
	
l18308:	
	clrf	(_delay_flag)
	incf	(_delay_flag),f
	line	945
	
l18310:	
;recive.c: 945: if(channel_delay[2] > 0)
	movf	0+(_channel_delay)+02h,w
	skipz
	goto	u8810
	goto	l18318
u8810:
	line	947
	
l18312:	
;recive.c: 946: {
;recive.c: 947: if(flag_5min_add >= 30000)
	movlw	high(07530h)
	subwf	(_flag_5min_add+1),w
	movlw	low(07530h)
	skipnz
	subwf	(_flag_5min_add),w
	skipc
	goto	u8821
	goto	u8820
u8821:
	goto	l10138
u8820:
	line	949
	
l18314:	
;recive.c: 948: {
;recive.c: 949: flag_5min_add = 0;
	clrf	(_flag_5min_add)
	clrf	(_flag_5min_add+1)
	line	950
	
l18316:	
;recive.c: 950: channel_delay[2]--;
	decf	0+(_channel_delay)+02h,f
	goto	l10138
	line	1042
	
l18318:	
;recive.c: 953: else
;recive.c: 954: {
;recive.c: 1042: if (channel_delay[1] <= 2)
	movlw	(03h)
	subwf	0+(_channel_delay)+01h,w
	skipnc
	goto	u8831
	goto	u8830
u8831:
	goto	l18332
u8830:
	line	1044
	
l18320:	
;recive.c: 1043: {
;recive.c: 1044: if (channel_delay[0] & 0x01)
	btfss	(_channel_delay),(0)&7
	goto	u8841
	goto	u8840
u8841:
	goto	l18324
u8840:
	line	1046
	
l18322:	
;recive.c: 1045: {
;recive.c: 1046: setChannelStatus(0, channel_delay[1]);
	movf	0+(_channel_delay)+01h,w
	movwf	(?_setChannelStatus)
	movlw	(0)
	fcall	_setChannelStatus
	line	1049
	
l18324:	
;recive.c: 1047: }
;recive.c: 1049: if (channel_delay[0] & 0x02)
	btfss	(_channel_delay),(1)&7
	goto	u8851
	goto	u8850
u8851:
	goto	l18328
u8850:
	line	1051
	
l18326:	
;recive.c: 1050: {
;recive.c: 1051: setChannelStatus(1, channel_delay[1]);
	movf	0+(_channel_delay)+01h,w
	movwf	(?_setChannelStatus)
	movlw	(01h)
	fcall	_setChannelStatus
	line	1054
	
l18328:	
;recive.c: 1052: }
;recive.c: 1054: if (channel_delay[0] & 0x04)
	btfss	(_channel_delay),(2)&7
	goto	u8861
	goto	u8860
u8861:
	goto	l18332
u8860:
	line	1056
	
l18330:	
;recive.c: 1055: {
;recive.c: 1056: setChannelStatus(2, channel_delay[1]);
	movf	0+(_channel_delay)+01h,w
	movwf	(?_setChannelStatus)
	movlw	(02h)
	fcall	_setChannelStatus
	line	1063
	
l18332:	
;recive.c: 1057: }
;recive.c: 1058: }
;recive.c: 1063: channel_delay[0] = 0;
	clrf	(_channel_delay)
	line	1064
	
l18334:	
;recive.c: 1064: channel_delay[1] = 0;
	clrf	0+(_channel_delay)+01h
	line	1065
	
l18336:	
;recive.c: 1065: channel_delay[2] = 0;
	clrf	0+(_channel_delay)+02h
	line	1066
	
l18338:	
;recive.c: 1066: delay_flag=0;
	clrf	(_delay_flag)
	line	1069
	
l10138:	
	return
	opt stack 0
GLOBAL	__end_of_delay_task
	__end_of_delay_task:
;; =============== function _delay_task ends ============

	signat	_delay_task,88
	global	_key_value_read
psect	text1241,local,class=CODE,delta=2
global __ptext1241
__ptext1241:

;; *************** function _key_value_read *****************
;; Defined at:
;;		line 241 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\key_scan.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_key_scan
;;		_sledBlink
;;		_soft_delay_ms
;;		_setChannelStatus
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1241
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\key_scan.c"
	line	241
	global	__size_of_key_value_read
	__size_of_key_value_read	equ	__end_of_key_value_read-_key_value_read
	
_key_value_read:	
	opt	stack 0
; Regs used in _key_value_read: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	242
	
l18142:	
;key_scan.c: 242: key_scan();
	fcall	_key_scan
	line	243
	
l18144:	
;key_scan.c: 243: if(KEY0_FLAG == 0x01)
	decf	(_KEY0_FLAG),w
	skipz
	goto	u8471
	goto	u8470
u8471:
	goto	l18166
u8470:
	line	246
	
l18146:	
;key_scan.c: 244: {
;key_scan.c: 246: if(flag_time_key0_add >= 500)
	movlw	high(01F4h)
	subwf	(_flag_time_key0_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key0_add),w
	skipc
	goto	u8481
	goto	u8480
u8481:
	goto	l18158
u8480:
	line	248
	
l18148:	
;key_scan.c: 247: {
;key_scan.c: 248: if(key_long_flag == 0x01)
	decf	(_key_long_flag),w
	skipz
	goto	u8491
	goto	u8490
u8491:
	goto	l7258
u8490:
	line	250
	
l18150:	
;key_scan.c: 249: {
;key_scan.c: 250: key_long_flag = 0x10;
	movlw	(010h)
	movwf	(_key_long_flag)
	line	251
	
l18152:	
;key_scan.c: 251: sledBlink();
	fcall	_sledBlink
	line	252
	
l18154:	
;key_scan.c: 252: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	253
	
l18156:	
;key_scan.c: 253: sledBlink();
	fcall	_sledBlink
	goto	l7258
	line	254
	
l7254:	
	line	255
;key_scan.c: 254: }
;key_scan.c: 255: }
	goto	l7258
	line	256
	
l18158:	
;key_scan.c: 256: else if(flag_time_key0_add >= 300)
	movlw	high(012Ch)
	subwf	(_flag_time_key0_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key0_add),w
	skipc
	goto	u8501
	goto	u8500
u8501:
	goto	l7258
u8500:
	line	258
	
l18160:	
;key_scan.c: 257: {
;key_scan.c: 258: if(key_long_flag == 0)
	movf	(_key_long_flag),f
	skipz
	goto	u8511
	goto	u8510
u8511:
	goto	l7258
u8510:
	line	260
	
l18162:	
;key_scan.c: 259: {
;key_scan.c: 260: key_long_flag = 0x01;
	clrf	(_key_long_flag)
	incf	(_key_long_flag),f
	goto	l18156
	line	267
	
l18166:	
;key_scan.c: 267: else if(KEY0_FLAG == 0x03)
	movf	(_KEY0_FLAG),w
	xorlw	03h
	skipz
	goto	u8521
	goto	u8520
u8521:
	goto	l7258
u8520:
	line	269
	
l18168:	
;key_scan.c: 268: {
;key_scan.c: 269: KEY0_FLAG = 0;
	clrf	(_KEY0_FLAG)
	line	271
	
l18170:	
;key_scan.c: 271: if((flag_time_key0_add < 300))
	movlw	high(012Ch)
	subwf	(_flag_time_key0_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key0_add),w
	skipnc
	goto	u8531
	goto	u8530
u8531:
	goto	l18174
u8530:
	line	273
	
l18172:	
;key_scan.c: 272: {
;key_scan.c: 273: setChannelStatus(0, 2);
	movlw	(02h)
	movwf	(?_setChannelStatus)
	movlw	(0)
	fcall	_setChannelStatus
	line	274
;key_scan.c: 274: }
	goto	l7258
	line	275
	
l18174:	
;key_scan.c: 275: else if(flag_time_key0_add < 500)
	movlw	high(01F4h)
	subwf	(_flag_time_key0_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key0_add),w
	skipnc
	goto	u8541
	goto	u8540
u8541:
	goto	l18186
u8540:
	line	277
	
l18176:	
;key_scan.c: 276: {
;key_scan.c: 277: if(key_long_flag == 0x01)
	decf	(_key_long_flag),w
	skipz
	goto	u8551
	goto	u8550
u8551:
	goto	l7254
u8550:
	line	279
	
l18178:	
;key_scan.c: 278: {
;key_scan.c: 279: KEY0.key_flag_3s = 1;
	clrf	0+(_KEY0)+01h
	incf	0+(_KEY0)+01h,f
	line	280
	
l18180:	
;key_scan.c: 280: key_long_flag = 0x11;
	movlw	(011h)
	movwf	(_key_long_flag)
	line	281
;key_scan.c: 281: sys_stute = 2;
	movlw	(02h)
	movwf	(_sys_stute)
	line	282
	
l18182:	
;key_scan.c: 282: flag_time_key1_add = 0;
	clrf	(_flag_time_key1_add)
	clrf	(_flag_time_key1_add+1)
	line	283
	
l18184:	
;key_scan.c: 283: flag_time_key2_add = 0;
	clrf	(_flag_time_key2_add)
	clrf	(_flag_time_key2_add+1)
	goto	l7258
	line	288
	
l18186:	
;key_scan.c: 286: else
;key_scan.c: 287: {
;key_scan.c: 288: if(key_long_flag == 0x10)
	movf	(_key_long_flag),w
	xorlw	010h
	skipz
	goto	u8561
	goto	u8560
u8561:
	goto	l7254
u8560:
	line	290
	
l18188:	
;key_scan.c: 289: {
;key_scan.c: 290: KEY0.key_flag_5s = 1;
	clrf	0+(_KEY0)+02h
	incf	0+(_KEY0)+02h,f
	line	291
	
l18190:	
;key_scan.c: 291: key_long_flag = 0x11;
	movlw	(011h)
	movwf	(_key_long_flag)
	line	292
;key_scan.c: 292: sys_stute = 3;
	movlw	(03h)
	movwf	(_sys_stute)
	goto	l18182
	line	301
	
l7258:	
;key_scan.c: 295: }
;key_scan.c: 296: }
;key_scan.c: 298: }
;key_scan.c: 301: if(KEY1_FLAG == 0x01)
	decf	(_KEY1_FLAG),w
	skipz
	goto	u8571
	goto	u8570
u8571:
	goto	l18216
u8570:
	line	303
	
l18196:	
;key_scan.c: 302: {
;key_scan.c: 303: if(flag_time_key1_add >= 500)
	movlw	high(01F4h)
	subwf	(_flag_time_key1_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key1_add),w
	skipc
	goto	u8581
	goto	u8580
u8581:
	goto	l18208
u8580:
	line	305
	
l18198:	
;key_scan.c: 304: {
;key_scan.c: 305: if(key_long_flag == 0x02)
	movf	(_key_long_flag),w
	xorlw	02h
	skipz
	goto	u8591
	goto	u8590
u8591:
	goto	l7272
u8590:
	line	307
	
l18200:	
;key_scan.c: 306: {
;key_scan.c: 307: key_long_flag = 0x20;
	movlw	(020h)
	movwf	(_key_long_flag)
	line	308
	
l18202:	
;key_scan.c: 308: sledBlink();
	fcall	_sledBlink
	line	309
	
l18204:	
;key_scan.c: 309: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	310
	
l18206:	
;key_scan.c: 310: sledBlink();
	fcall	_sledBlink
	goto	l7272
	line	311
	
l7268:	
	line	312
;key_scan.c: 311: }
;key_scan.c: 312: }
	goto	l7272
	line	313
	
l18208:	
;key_scan.c: 313: else if(flag_time_key1_add >= 300)
	movlw	high(012Ch)
	subwf	(_flag_time_key1_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key1_add),w
	skipc
	goto	u8601
	goto	u8600
u8601:
	goto	l7272
u8600:
	line	315
	
l18210:	
;key_scan.c: 314: {
;key_scan.c: 315: if(key_long_flag == 0)
	movf	(_key_long_flag),f
	skipz
	goto	u8611
	goto	u8610
u8611:
	goto	l7272
u8610:
	line	317
	
l18212:	
;key_scan.c: 316: {
;key_scan.c: 317: key_long_flag = 0x02;
	movlw	(02h)
	movwf	(_key_long_flag)
	goto	l18206
	line	323
	
l18216:	
;key_scan.c: 323: else if(KEY1_FLAG == 0x03)
	movf	(_KEY1_FLAG),w
	xorlw	03h
	skipz
	goto	u8621
	goto	u8620
u8621:
	goto	l7272
u8620:
	line	325
	
l18218:	
;key_scan.c: 324: {
;key_scan.c: 325: KEY1_FLAG = 0;
	clrf	(_KEY1_FLAG)
	line	326
	
l18220:	
;key_scan.c: 326: if((flag_time_key1_add < 300))
	movlw	high(012Ch)
	subwf	(_flag_time_key1_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key1_add),w
	skipnc
	goto	u8631
	goto	u8630
u8631:
	goto	l18224
u8630:
	line	328
	
l18222:	
;key_scan.c: 327: {
;key_scan.c: 328: setChannelStatus(1, 2);
	movlw	(02h)
	movwf	(?_setChannelStatus)
	movlw	(01h)
	fcall	_setChannelStatus
	line	329
;key_scan.c: 329: }
	goto	l7272
	line	330
	
l18224:	
;key_scan.c: 330: else if(flag_time_key1_add < 500)
	movlw	high(01F4h)
	subwf	(_flag_time_key1_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key1_add),w
	skipnc
	goto	u8641
	goto	u8640
u8641:
	goto	l18236
u8640:
	line	332
	
l18226:	
;key_scan.c: 331: {
;key_scan.c: 332: if(key_long_flag == 0x02)
	movf	(_key_long_flag),w
	xorlw	02h
	skipz
	goto	u8651
	goto	u8650
u8651:
	goto	l7268
u8650:
	line	334
	
l18228:	
;key_scan.c: 333: {
;key_scan.c: 334: KEY1.key_flag_3s = 1;
	clrf	0+(_KEY1)+01h
	incf	0+(_KEY1)+01h,f
	line	335
	
l18230:	
;key_scan.c: 335: key_long_flag = 0x21;
	movlw	(021h)
	movwf	(_key_long_flag)
	line	336
;key_scan.c: 336: sys_stute = 2;
	movlw	(02h)
	movwf	(_sys_stute)
	line	337
	
l18232:	
;key_scan.c: 337: flag_time_key2_add = 0;
	clrf	(_flag_time_key2_add)
	clrf	(_flag_time_key2_add+1)
	line	338
	
l18234:	
;key_scan.c: 338: flag_time_key0_add = 0;
	clrf	(_flag_time_key0_add)
	clrf	(_flag_time_key0_add+1)
	goto	l7272
	line	343
	
l18236:	
;key_scan.c: 341: else
;key_scan.c: 342: {
;key_scan.c: 343: if(key_long_flag == 0x20)
	movf	(_key_long_flag),w
	xorlw	020h
	skipz
	goto	u8661
	goto	u8660
u8661:
	goto	l7268
u8660:
	line	345
	
l18238:	
;key_scan.c: 344: {
;key_scan.c: 345: KEY1.key_flag_5s = 1;
	clrf	0+(_KEY1)+02h
	incf	0+(_KEY1)+02h,f
	line	346
	
l18240:	
;key_scan.c: 346: key_long_flag = 0x21;
	movlw	(021h)
	movwf	(_key_long_flag)
	line	347
;key_scan.c: 347: sys_stute = 3;
	movlw	(03h)
	movwf	(_sys_stute)
	goto	l18232
	line	355
	
l7272:	
;key_scan.c: 350: }
;key_scan.c: 351: }
;key_scan.c: 352: }
;key_scan.c: 355: if(KEY2_FLAG == 0x01)
	decf	(_KEY2_FLAG),w
	skipz
	goto	u8671
	goto	u8670
u8671:
	goto	l18266
u8670:
	line	357
	
l18246:	
;key_scan.c: 356: {
;key_scan.c: 357: if(flag_time_key2_add >= 500)
	movlw	high(01F4h)
	subwf	(_flag_time_key2_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key2_add),w
	skipc
	goto	u8681
	goto	u8680
u8681:
	goto	l18258
u8680:
	line	359
	
l18248:	
;key_scan.c: 358: {
;key_scan.c: 359: if(key_long_flag == 0x04)
	movf	(_key_long_flag),w
	xorlw	04h
	skipz
	goto	u8691
	goto	u8690
u8691:
	goto	l7294
u8690:
	line	361
	
l18250:	
;key_scan.c: 360: {
;key_scan.c: 361: key_long_flag = 0x40;
	movlw	(040h)
	movwf	(_key_long_flag)
	line	362
	
l18252:	
;key_scan.c: 362: sledBlink();
	fcall	_sledBlink
	line	363
	
l18254:	
;key_scan.c: 363: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	364
	
l18256:	
;key_scan.c: 364: sledBlink();
	fcall	_sledBlink
	goto	l7294
	line	367
	
l18258:	
;key_scan.c: 367: else if(flag_time_key2_add >= 300)
	movlw	high(012Ch)
	subwf	(_flag_time_key2_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key2_add),w
	skipc
	goto	u8701
	goto	u8700
u8701:
	goto	l7294
u8700:
	line	369
	
l18260:	
;key_scan.c: 368: {
;key_scan.c: 369: if(key_long_flag == 0)
	movf	(_key_long_flag),f
	skipz
	goto	u8711
	goto	u8710
u8711:
	goto	l7283
u8710:
	line	371
	
l18262:	
;key_scan.c: 370: {
;key_scan.c: 371: key_long_flag = 0x04;
	movlw	(04h)
	movwf	(_key_long_flag)
	goto	l18256
	line	375
	
l7283:	
;key_scan.c: 373: }
;key_scan.c: 374: }
;key_scan.c: 375: }
	goto	l7294
	line	376
	
l18266:	
;key_scan.c: 376: else if(KEY2_FLAG == 0x03)
	movf	(_KEY2_FLAG),w
	xorlw	03h
	skipz
	goto	u8721
	goto	u8720
u8721:
	goto	l7294
u8720:
	line	378
	
l18268:	
;key_scan.c: 377: {
;key_scan.c: 378: KEY2_FLAG = 0;
	clrf	(_KEY2_FLAG)
	line	379
	
l18270:	
;key_scan.c: 379: if((flag_time_key2_add < 300))
	movlw	high(012Ch)
	subwf	(_flag_time_key2_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key2_add),w
	skipnc
	goto	u8731
	goto	u8730
u8731:
	goto	l18274
u8730:
	line	381
	
l18272:	
;key_scan.c: 380: {
;key_scan.c: 381: setChannelStatus(2, 2);
	movlw	(02h)
	movwf	(?_setChannelStatus)
	movlw	(02h)
	fcall	_setChannelStatus
	line	382
;key_scan.c: 382: }
	goto	l7294
	line	383
	
l18274:	
;key_scan.c: 383: else if(flag_time_key2_add < 500)
	movlw	high(01F4h)
	subwf	(_flag_time_key2_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key2_add),w
	skipnc
	goto	u8741
	goto	u8740
u8741:
	goto	l18286
u8740:
	line	385
	
l18276:	
;key_scan.c: 384: {
;key_scan.c: 385: if(key_long_flag == 0x04)
	movf	(_key_long_flag),w
	xorlw	04h
	skipz
	goto	u8751
	goto	u8750
u8751:
	goto	l7283
u8750:
	line	387
	
l18278:	
;key_scan.c: 386: {
;key_scan.c: 387: KEY2.key_flag_3s = 1;
	clrf	0+(_KEY2)+01h
	incf	0+(_KEY2)+01h,f
	line	388
	
l18280:	
;key_scan.c: 388: key_long_flag = 0x41;
	movlw	(041h)
	movwf	(_key_long_flag)
	line	389
;key_scan.c: 389: sys_stute = 2;
	movlw	(02h)
	movwf	(_sys_stute)
	line	390
	
l18282:	
;key_scan.c: 390: flag_time_key1_add = 0;
	clrf	(_flag_time_key1_add)
	clrf	(_flag_time_key1_add+1)
	line	391
	
l18284:	
;key_scan.c: 391: flag_time_key0_add = 0;
	clrf	(_flag_time_key0_add)
	clrf	(_flag_time_key0_add+1)
	goto	l7294
	line	397
	
l18286:	
;key_scan.c: 395: else
;key_scan.c: 396: {
;key_scan.c: 397: if(key_long_flag == 0x40)
	movf	(_key_long_flag),w
	xorlw	040h
	skipz
	goto	u8761
	goto	u8760
u8761:
	goto	l7283
u8760:
	line	399
	
l18288:	
;key_scan.c: 398: {
;key_scan.c: 399: KEY2.key_flag_5s = 1;
	clrf	0+(_KEY2)+02h
	incf	0+(_KEY2)+02h,f
	line	400
	
l18290:	
;key_scan.c: 400: key_long_flag = 0x41;
	movlw	(041h)
	movwf	(_key_long_flag)
	line	401
;key_scan.c: 401: sys_stute = 3;
	movlw	(03h)
	movwf	(_sys_stute)
	goto	l18282
	line	408
	
l7294:	
	return
	opt stack 0
GLOBAL	__end_of_key_value_read
	__end_of_key_value_read:
;; =============== function _key_value_read ends ============

	signat	_key_value_read,88
	global	_recive_task
psect	text1242,local,class=CODE,delta=2
global __ptext1242
__ptext1242:

;; *************** function _recive_task *****************
;; Defined at:
;;		line 135 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\recive.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  msg             6   20[BANK0 ] unsigned char [6]
;;  i               1   28[BANK0 ] unsigned char 
;;  flag            1   27[BANK0 ] unsigned char 
;;  match_flag      1   26[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       9       0
;;      Temps:          0       4       0
;;      Totals:         0      13       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_AT24C02_Write_Byte
;;		_soft_delay_ms
;;		___bmul
;;		_AT24C02_Read_Msg
;;		_sledBlink
;;		_rx_data
;;		_AT24C02_Write_Msg
;;		_setChannelStatus
;;		___lbdiv
;;		_RF_ClearFIFO
;;		_RF_ClearStatus
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1242
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\recive.c"
	line	135
	global	__size_of_recive_task
	__size_of_recive_task	equ	__end_of_recive_task-_recive_task
	
_recive_task:	
	opt	stack 0
; Regs used in _recive_task: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	136
	
l17328:	
;recive.c: 136: unsigned char i = 0;
	clrf	(recive_task@i)
	line	138
;recive.c: 138: unsigned char match_flag = 0;
	clrf	(recive_task@match_flag)
	line	139
;recive.c: 139: unsigned char flag = 0;
	clrf	(recive_task@flag)
	line	142
;recive.c: 140: unsigned char msg[6];
;recive.c: 142: switch(sys_stute)
	goto	l18140
	line	144
;recive.c: 143: {
;recive.c: 144: case 3:
	
l9914:	
	line	146
;recive.c: 145: {
;recive.c: 146: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	147
	
l17330:	
;recive.c: 147: if(key_long_flag == 0x11)
	movf	(_key_long_flag),w
	xorlw	011h
	skipz
	goto	u6721
	goto	u6720
u6721:
	goto	l17344
u6720:
	line	149
	
l17332:	
;recive.c: 148: {
;recive.c: 149: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	150
;recive.c: 150: KEY0.key_flag_5s = 0;
	clrf	0+(_KEY0)+02h
	line	151
;recive.c: 151: for(i = 0; i < 18; i++)
	clrf	(recive_task@i)
	
l17334:	
	movlw	(012h)
	subwf	(recive_task@i),w
	skipc
	goto	u6731
	goto	u6730
u6731:
	goto	l17338
u6730:
	goto	l17376
	line	153
	
l17338:	
;recive.c: 152: {
;recive.c: 153: AT24C02_Write_Byte(i + 0, 0xff);
	movlw	(0FFh)
	movwf	(?_AT24C02_Write_Byte)
	movf	(recive_task@i),w
	fcall	_AT24C02_Write_Byte
	line	154
;recive.c: 154: soft_delay_ms(1);
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	151
	
l17340:	
	incf	(recive_task@i),f
	goto	l17334
	line	157
	
l17344:	
;recive.c: 157: else if(key_long_flag == 0x21)
	movf	(_key_long_flag),w
	xorlw	021h
	skipz
	goto	u6741
	goto	u6740
u6741:
	goto	l17360
u6740:
	line	159
	
l17346:	
;recive.c: 158: {
;recive.c: 159: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	160
;recive.c: 160: KEY1.key_flag_5s = 0;
	clrf	0+(_KEY1)+02h
	line	161
	
l17348:	
;recive.c: 161: for(i = 18; i < 36; i++)
	movlw	(012h)
	movwf	(recive_task@i)
	
l17350:	
	movlw	(024h)
	subwf	(recive_task@i),w
	skipc
	goto	u6751
	goto	u6750
u6751:
	goto	l17354
u6750:
	goto	l17376
	line	163
	
l17354:	
;recive.c: 162: {
;recive.c: 163: AT24C02_Write_Byte(i, 0xff);
	movlw	(0FFh)
	movwf	(?_AT24C02_Write_Byte)
	movf	(recive_task@i),w
	fcall	_AT24C02_Write_Byte
	line	164
;recive.c: 164: soft_delay_ms(1);
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	161
	
l17356:	
	incf	(recive_task@i),f
	goto	l17350
	line	167
	
l17360:	
;recive.c: 167: else if(key_long_flag == 0x41)
	movf	(_key_long_flag),w
	xorlw	041h
	skipz
	goto	u6761
	goto	u6760
u6761:
	goto	l17376
u6760:
	line	169
	
l17362:	
;recive.c: 168: {
;recive.c: 169: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	170
;recive.c: 170: KEY2.key_flag_5s = 0;
	clrf	0+(_KEY2)+02h
	line	171
	
l17364:	
;recive.c: 171: for(i = 36; i < 54; i++)
	movlw	(024h)
	movwf	(recive_task@i)
	
l17366:	
	movlw	(036h)
	subwf	(recive_task@i),w
	skipc
	goto	u6771
	goto	u6770
u6771:
	goto	l17370
u6770:
	goto	l17376
	line	173
	
l17370:	
;recive.c: 172: {
;recive.c: 173: AT24C02_Write_Byte(i, 0xff);
	movlw	(0FFh)
	movwf	(?_AT24C02_Write_Byte)
	movf	(recive_task@i),w
	fcall	_AT24C02_Write_Byte
	line	174
;recive.c: 174: soft_delay_ms(1);
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	171
	
l17372:	
	incf	(recive_task@i),f
	goto	l17366
	line	178
	
l17376:	
;recive.c: 175: }
;recive.c: 176: }
;recive.c: 178: for(i = 54; i < 72; i++)
	movlw	(036h)
	movwf	(recive_task@i)
	movlw	(048h)
	subwf	(recive_task@i),w
	skipc
	goto	u6781
	goto	u6780
u6781:
	goto	l17380
u6780:
	goto	l17386
	line	180
	
l17380:	
;recive.c: 179: {
;recive.c: 180: AT24C02_Write_Byte(i, 0x00);
	clrf	(?_AT24C02_Write_Byte)
	movf	(recive_task@i),w
	fcall	_AT24C02_Write_Byte
	line	181
;recive.c: 181: soft_delay_ms(1);
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	178
	
l17382:	
	incf	(recive_task@i),f
	
l17384:	
	movlw	(048h)
	subwf	(recive_task@i),w
	skipc
	goto	u6791
	goto	u6790
u6791:
	goto	l17380
u6790:
	line	184
	
l17386:	
;recive.c: 182: }
;recive.c: 184: for(i = 0; i < 12; i++)
	clrf	(recive_task@i)
	
l17388:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u6801
	goto	u6800
u6801:
	goto	l17392
u6800:
	goto	l17398
	line	186
	
l17392:	
;recive.c: 185: {
;recive.c: 186: AT24C02_Read_Msg(i * 6, control_id[i], 6);
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id&0ffh
	movwf	(?_AT24C02_Read_Msg)
	movlw	(06h)
	movwf	0+(?_AT24C02_Read_Msg)+01h
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	fcall	_AT24C02_Read_Msg
	line	184
	
l17394:	
	incf	(recive_task@i),f
	goto	l17388
	line	188
	
l17398:	
;recive.c: 187: }
;recive.c: 188: sledBlink();
	fcall	_sledBlink
	line	189
;recive.c: 189: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	190
;recive.c: 190: sledBlink();
	fcall	_sledBlink
	line	191
	
l17400:	
;recive.c: 191: sys_stute=1;
	clrf	(_sys_stute)
	incf	(_sys_stute),f
	line	192
;recive.c: 192: }break;
	goto	l10110
	line	194
;recive.c: 194: case 2:
	
l9931:	
	line	196
;recive.c: 195: {
;recive.c: 196: match_channel_flag |= 0x01;
	bsf	(_match_channel_flag)+(0/8),(0)&7
	line	197
	
l17402:	
;recive.c: 197: if(key_long_flag == 0x11)
	movf	(_key_long_flag),w
	xorlw	011h
	skipz
	goto	u6811
	goto	u6810
u6811:
	goto	l17408
u6810:
	line	199
	
l17404:	
;recive.c: 198: {
;recive.c: 199: KEY0.key_flag_3s = 0;
	clrf	0+(_KEY0)+01h
	line	200
;recive.c: 200: flag_5s_add = 0;
	clrf	(_flag_5s_add)
	clrf	(_flag_5s_add+1)
	line	201
;recive.c: 201: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	202
	
l17406:	
;recive.c: 202: match_channel_flag = 0x10;
	movlw	(010h)
	movwf	(_match_channel_flag)
	line	203
;recive.c: 203: }
	goto	l17420
	line	204
	
l17408:	
;recive.c: 204: else if(key_long_flag == 0x21)
	movf	(_key_long_flag),w
	xorlw	021h
	skipz
	goto	u6821
	goto	u6820
u6821:
	goto	l17414
u6820:
	line	206
	
l17410:	
;recive.c: 205: {
;recive.c: 206: KEY1.key_flag_3s = 0;
	clrf	0+(_KEY1)+01h
	line	207
;recive.c: 207: flag_5s_add = 0;
	clrf	(_flag_5s_add)
	clrf	(_flag_5s_add+1)
	line	208
;recive.c: 208: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	209
	
l17412:	
;recive.c: 209: match_channel_flag = 0x20;
	movlw	(020h)
	movwf	(_match_channel_flag)
	line	210
;recive.c: 210: }
	goto	l17420
	line	211
	
l17414:	
;recive.c: 211: else if(key_long_flag == 0x41)
	movf	(_key_long_flag),w
	xorlw	041h
	skipz
	goto	u6831
	goto	u6830
u6831:
	goto	l17420
u6830:
	line	213
	
l17416:	
;recive.c: 212: {
;recive.c: 213: KEY2.key_flag_3s = 0;
	clrf	0+(_KEY2)+01h
	line	214
;recive.c: 214: flag_5s_add = 0;
	clrf	(_flag_5s_add)
	clrf	(_flag_5s_add+1)
	line	215
;recive.c: 215: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	216
	
l17418:	
;recive.c: 216: match_channel_flag = 0x40;
	movlw	(040h)
	movwf	(_match_channel_flag)
	line	226
	
l17420:	
;recive.c: 217: }
;recive.c: 226: if(rx_data())
	fcall	_rx_data
	xorlw	0
	skipnz
	goto	u6841
	goto	u6840
u6841:
	goto	l17764
u6840:
	line	228
	
l17422:	
;recive.c: 227: {
;recive.c: 228: msg[0] = rf_buf[3];
	movf	0+(_rf_buf)+03h,w
	movwf	(recive_task@msg)
	line	229
;recive.c: 229: msg[1] = rf_buf[4];
	movf	0+(_rf_buf)+04h,w
	movwf	0+(recive_task@msg)+01h
	line	230
;recive.c: 230: msg[2] = rf_buf[5];
	movf	0+(_rf_buf)+05h,w
	movwf	0+(recive_task@msg)+02h
	line	231
;recive.c: 231: msg[3] = rf_buf[6];
	movf	0+(_rf_buf)+06h,w
	movwf	0+(recive_task@msg)+03h
	line	232
;recive.c: 232: msg[4] = rf_buf[10];
	movf	0+(_rf_buf)+0Ah,w
	movwf	0+(recive_task@msg)+04h
	line	233
;recive.c: 233: msg[5] = rf_buf[2];
	movf	0+(_rf_buf)+02h,w
	movwf	0+(recive_task@msg)+05h
	line	236
;recive.c: 236: if (rf_buf[8] == (0x20))
	movf	0+(_rf_buf)+08h,w
	xorlw	020h
	skipz
	goto	u6851
	goto	u6850
u6851:
	goto	l17528
u6850:
	line	238
	
l17424:	
;recive.c: 237: {
;recive.c: 238: for(i = 0; i < 3; i++)
	clrf	(recive_task@i)
	
l17426:	
	movlw	(03h)
	subwf	(recive_task@i),w
	skipc
	goto	u6861
	goto	u6860
u6861:
	goto	l17430
u6860:
	goto	l17448
	line	244
	
l17430:	
;recive.c: 239: {
;recive.c: 240: if((msg[0] == control_id[i + 9][0])
;recive.c: 241: &&(msg[1] == control_id[i + 9][1])
;recive.c: 242: &&(msg[2] == control_id[i + 9][2])
;recive.c: 243: &&(msg[3] == control_id[i + 9][3])
;recive.c: 244: )
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+036h&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	xorwf	(recive_task@msg),w
	skipz
	goto	u6871
	goto	u6870
u6871:
	goto	l17442
u6870:
	
l17432:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+037h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+01h,w
	xorwf	indf,w
	skipz
	goto	u6881
	goto	u6880
u6881:
	goto	l17442
u6880:
	
l17434:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+038h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+02h,w
	xorwf	indf,w
	skipz
	goto	u6891
	goto	u6890
u6891:
	goto	l17442
u6890:
	
l17436:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+039h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+03h,w
	xorwf	indf,w
	skipz
	goto	u6901
	goto	u6900
u6901:
	goto	l17442
u6900:
	line	246
	
l17438:	
;recive.c: 245: {
;recive.c: 246: match_flag = 1;
	clrf	(recive_task@match_flag)
	incf	(recive_task@match_flag),f
	line	247
;recive.c: 247: break;
	goto	l17448
	line	251
	
l17442:	
;recive.c: 249: else
;recive.c: 250: {
;recive.c: 251: match_flag = 0;
	clrf	(recive_task@match_flag)
	line	238
	
l17444:	
	incf	(recive_task@i),f
	goto	l17426
	line	255
	
l17448:	
;recive.c: 252: }
;recive.c: 253: }
;recive.c: 255: if(match_flag == 0)
	movf	(recive_task@match_flag),f
	skipz
	goto	u6911
	goto	u6910
u6911:
	goto	l17482
u6910:
	line	257
	
l17450:	
;recive.c: 256: {
;recive.c: 257: flag = (channel_flag >> 6) & 0x03;
	movf	(_channel_flag),w
	movwf	(??_recive_task+0)+0
	movlw	06h
u6925:
	clrc
	rrf	(??_recive_task+0)+0,f
	addlw	-1
	skipz
	goto	u6925
	movf	0+(??_recive_task+0)+0,w
	movwf	(recive_task@flag)
	movlw	(03h)
	andwf	(recive_task@flag),f
	line	258
	
l17452:	
;recive.c: 258: if(flag >= 3)
	movlw	(03h)
	subwf	(recive_task@flag),w
	skipc
	goto	u6931
	goto	u6930
u6931:
	goto	l17456
u6930:
	line	260
	
l17454:	
;recive.c: 259: {
;recive.c: 260: flag = 0;
	clrf	(recive_task@flag)
	line	262
	
l17456:	
;recive.c: 261: }
;recive.c: 262: AT24C02_Write_Msg(9 * 6 + flag * 6, msg, 4);
	movlw	(recive_task@msg)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	movlw	(04h)
	movwf	0+(?_AT24C02_Write_Msg)+01h
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@flag),w
	fcall	___bmul
	addlw	036h
	fcall	_AT24C02_Write_Msg
	line	263
	
l17458:	
;recive.c: 263: AT24C02_Write_Msg(9 * 6 + flag * 6 + 5, msg + 5, 1);
	movlw	(recive_task@msg+05h)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@flag),w
	fcall	___bmul
	addlw	03Bh
	fcall	_AT24C02_Write_Msg
	line	264
;recive.c: 264: for(i = 0; i < 4; i++)
	clrf	(recive_task@i)
	
l17460:	
	movlw	(04h)
	subwf	(recive_task@i),w
	skipc
	goto	u6941
	goto	u6940
u6941:
	goto	l17464
u6940:
	goto	l17470
	line	266
	
l17464:	
;recive.c: 265: {
;recive.c: 266: control_id[flag + 9][i] = msg[i];
	movf	(recive_task@i),w
	addlw	recive_task@msg&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_recive_task+0)+0
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@flag),w
	fcall	___bmul
	movwf	(??_recive_task+1)+0
	movlw	(_control_id+036h)&0ffh
	addwf	0+(??_recive_task+1)+0,w
	movwf	(??_recive_task+2)+0
	movf	(recive_task@i),w
	addwf	0+(??_recive_task+2)+0,w
	movwf	(??_recive_task+3)+0
	movf	0+(??_recive_task+3)+0,w
	movwf	fsr0
	movf	(??_recive_task+0)+0,w
	movwf	indf
	line	264
	
l17466:	
	incf	(recive_task@i),f
	goto	l17460
	line	269
	
l17470:	
;recive.c: 267: }
;recive.c: 269: control_id[flag + 9][5] = msg[5];
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@flag),w
	fcall	___bmul
	addlw	_control_id+03Bh&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+05h,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	line	270
	
l17472:	
;recive.c: 270: flag ++;
	incf	(recive_task@flag),f
	line	271
	
l17474:	
;recive.c: 271: if(flag >= 3)
	movlw	(03h)
	subwf	(recive_task@flag),w
	skipc
	goto	u6951
	goto	u6950
u6951:
	goto	l17478
u6950:
	line	273
	
l17476:	
;recive.c: 272: {
;recive.c: 273: flag = 0;
	clrf	(recive_task@flag)
	line	275
	
l17478:	
;recive.c: 274: }
;recive.c: 275: channel_flag &= (~(0x03 << 6));
	movlw	(03Fh)
	andwf	(_channel_flag),f
	line	276
	
l17480:	
;recive.c: 276: channel_flag |= (flag << 6);
	movf	(recive_task@flag),w
	movwf	(??_recive_task+0)+0
	rrf	(??_recive_task+0)+0,f
	rrf	(??_recive_task+0)+0,f
	rrf	(??_recive_task+0)+0,w
	andlw	0c0h
	iorwf	(_channel_flag),f
	line	277
;recive.c: 277: }
	goto	l9948
	line	280
	
l17482:	
;recive.c: 278: else
;recive.c: 279: {
;recive.c: 280: flag = i;
	movf	(recive_task@i),w
	movwf	(recive_task@flag)
	line	281
	
l17484:	
;recive.c: 281: AT24C02_Write_Msg(9 * 6 + flag * 6 + 5, msg + 5, 1);
	movlw	(recive_task@msg+05h)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@flag),w
	fcall	___bmul
	addlw	03Bh
	fcall	_AT24C02_Write_Msg
	line	282
	
l17486:	
;recive.c: 282: control_id[flag + 9][5] = msg[5];
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@flag),w
	fcall	___bmul
	addlw	_control_id+03Bh&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+05h,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	line	283
	
l9948:	
	line	287
;recive.c: 283: }
;recive.c: 287: for(i = 9; i < 12; i++)
	movlw	(09h)
	movwf	(recive_task@i)
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u6961
	goto	u6960
u6961:
	goto	l17490
u6960:
	goto	l17500
	line	289
	
l17490:	
;recive.c: 288: {
;recive.c: 289: if ((control_id[i][4] & (0x01 << rf_buf[9])) != 0)
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+04h&0ffh
	movwf	fsr0
	movlw	(01h)
	movwf	(??_recive_task+0)+0
	incf	0+(_rf_buf)+09h,w
	goto	u6974
u6975:
	clrc
	rlf	(??_recive_task+0)+0,f
u6974:
	addlw	-1
	skipz
	goto	u6975
	movf	0+(??_recive_task+0)+0,w
	bcf	status, 7	;select IRP bank1
	andwf	indf,w
	btfsc	status,2
	goto	u6981
	goto	u6980
u6981:
	goto	l17494
u6980:
	line	291
	
l17492:	
;recive.c: 290: {
;recive.c: 291: setChannelStatus(i - 9, 1);
	clrf	(?_setChannelStatus)
	incf	(?_setChannelStatus),f
	movf	(recive_task@i),w
	addlw	0F7h
	fcall	_setChannelStatus
	line	292
;recive.c: 292: }
	goto	l17496
	line	295
	
l17494:	
;recive.c: 293: else
;recive.c: 294: {
;recive.c: 295: setChannelStatus(i - 9, 0);
	clrf	(?_setChannelStatus)
	movf	(recive_task@i),w
	addlw	0F7h
	fcall	_setChannelStatus
	line	287
	
l17496:	
	incf	(recive_task@i),f
	
l17498:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u6991
	goto	u6990
u6991:
	goto	l17490
u6990:
	line	301
	
l17500:	
;recive.c: 296: }
;recive.c: 297: }
;recive.c: 301: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	303
	
l17502:	
;recive.c: 303: AT24C02_Write_Msg(110, &channel_flag,1);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(06Eh)
	fcall	_AT24C02_Write_Msg
	line	304
	
l17504:	
;recive.c: 304: AT24C02_Write_Msg(110, &channel_flag,1);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(06Eh)
	fcall	_AT24C02_Write_Msg
	line	306
;recive.c: 306: for(i = 0; i < 12; i++)
	clrf	(recive_task@i)
	
l17506:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u7001
	goto	u7000
u7001:
	goto	l17510
u7000:
	goto	l17516
	line	308
	
l17510:	
;recive.c: 307: {
;recive.c: 308: AT24C02_Read_Msg(i * 6, control_id[i], 6);
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id&0ffh
	movwf	(?_AT24C02_Read_Msg)
	movlw	(06h)
	movwf	0+(?_AT24C02_Read_Msg)+01h
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	fcall	_AT24C02_Read_Msg
	line	306
	
l17512:	
	incf	(recive_task@i),f
	goto	l17506
	line	310
	
l17516:	
;recive.c: 309: }
;recive.c: 310: AT24C02_Read_Msg(110, &channel_flag, 1);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Read_Msg)
	clrf	0+(?_AT24C02_Read_Msg)+01h
	incf	0+(?_AT24C02_Read_Msg)+01h,f
	movlw	(06Eh)
	fcall	_AT24C02_Read_Msg
	line	312
	
l17518:	
;recive.c: 312: if (is_factory_flag)
	movf	(_is_factory_flag),w
	skipz
	goto	u7010
	goto	l17524
u7010:
	line	314
	
l17520:	
;recive.c: 313: {
;recive.c: 314: AT24C02_Write_Byte(113, 0x5E);
	movlw	(05Eh)
	movwf	(?_AT24C02_Write_Byte)
	movlw	(071h)
	fcall	_AT24C02_Write_Byte
	line	315
;recive.c: 315: soft_delay_ms(5);
	movlw	05h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	316
;recive.c: 316: AT24C02_Write_Byte(113 + 1, 0xF6);
	movlw	(0F6h)
	movwf	(?_AT24C02_Write_Byte)
	movlw	(072h)
	fcall	_AT24C02_Write_Byte
	line	317
;recive.c: 317: soft_delay_ms(5);
	movlw	05h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	318
	
l17522:	
;recive.c: 318: is_factory_flag = 0;
	clrf	(_is_factory_flag)
	line	321
	
l17524:	
;recive.c: 319: }
;recive.c: 321: sys_stute = 1;
	clrf	(_sys_stute)
	incf	(_sys_stute),f
	line	323
	
l17526:	
;recive.c: 323: sledBlink();
	fcall	_sledBlink
	line	324
;recive.c: 324: match_channel_flag = 0;
	clrf	(_match_channel_flag)
	line	325
;recive.c: 325: }
	goto	l10110
	line	327
	
l17528:	
;recive.c: 326: else if ((rf_buf[8] == (0x10) || rf_buf[8] == (0x11))
;recive.c: 327: && msg[4] != 0xff)
	movf	0+(_rf_buf)+08h,w
	xorlw	010h
	skipnz
	goto	u7021
	goto	u7020
u7021:
	goto	l17532
u7020:
	
l17530:	
	movf	0+(_rf_buf)+08h,w
	xorlw	011h
	skipz
	goto	u7031
	goto	u7030
u7031:
	goto	l9998
u7030:
	
l17532:	
	movf	0+(recive_task@msg)+04h,w
	xorlw	0FFh
	skipnz
	goto	u7041
	goto	u7040
u7041:
	goto	l9998
u7040:
	line	329
	
l17534:	
;recive.c: 328: {
;recive.c: 329: if(match_channel_flag & 0x10)
	btfss	(_match_channel_flag),(4)&7
	goto	u7051
	goto	u7050
u7051:
	goto	l9960
u7050:
	line	331
	
l17536:	
;recive.c: 330: {
;recive.c: 331: for(i = 0; i < 3; i++)
	clrf	(recive_task@i)
	
l17538:	
	movlw	(03h)
	subwf	(recive_task@i),w
	skipc
	goto	u7061
	goto	u7060
u7061:
	goto	l17542
u7060:
	goto	l17562
	line	338
	
l17542:	
;recive.c: 332: {
;recive.c: 333: if((msg[0] == control_id[i][0])
;recive.c: 334: &&(msg[1] == control_id[i][1])
;recive.c: 335: &&(msg[2] == control_id[i][2])
;recive.c: 336: &&(msg[3] == control_id[i][3])
;recive.c: 337: &&(msg[4] == control_id[i][4])
;recive.c: 338: )
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	xorwf	(recive_task@msg),w
	skipz
	goto	u7071
	goto	u7070
u7071:
	goto	l17556
u7070:
	
l17544:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+01h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+01h,w
	xorwf	indf,w
	skipz
	goto	u7081
	goto	u7080
u7081:
	goto	l17556
u7080:
	
l17546:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+02h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+02h,w
	xorwf	indf,w
	skipz
	goto	u7091
	goto	u7090
u7091:
	goto	l17556
u7090:
	
l17548:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+03h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+03h,w
	xorwf	indf,w
	skipz
	goto	u7101
	goto	u7100
u7101:
	goto	l17556
u7100:
	
l17550:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+04h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+04h,w
	xorwf	indf,w
	skipz
	goto	u7111
	goto	u7110
u7111:
	goto	l17556
u7110:
	line	340
	
l17552:	
;recive.c: 339: {
;recive.c: 340: match_flag = 1;
	clrf	(recive_task@match_flag)
	incf	(recive_task@match_flag),f
	line	341
;recive.c: 341: break;
	goto	l17562
	line	345
	
l17556:	
;recive.c: 343: else
;recive.c: 344: {
;recive.c: 345: match_flag = 0;
	clrf	(recive_task@match_flag)
	line	331
	
l17558:	
	incf	(recive_task@i),f
	goto	l17538
	line	349
	
l17562:	
;recive.c: 346: }
;recive.c: 347: }
;recive.c: 349: if(match_flag == 0)
	movf	(recive_task@match_flag),f
	skipz
	goto	u7121
	goto	u7120
u7121:
	goto	l17596
u7120:
	line	351
	
l17564:	
;recive.c: 350: {
;recive.c: 351: flag = (channel_flag >> 0) & 0x03;
	movf	(_channel_flag),w
	movwf	(recive_task@flag)
	
l17566:	
	movlw	(03h)
	andwf	(recive_task@flag),f
	line	353
	
l17568:	
;recive.c: 353: if(flag >= 3)
	movlw	(03h)
	subwf	(recive_task@flag),w
	skipc
	goto	u7131
	goto	u7130
u7131:
	goto	l17572
u7130:
	line	355
	
l17570:	
;recive.c: 354: {
;recive.c: 355: flag = 0;
	clrf	(recive_task@flag)
	line	358
	
l17572:	
;recive.c: 356: }
;recive.c: 358: AT24C02_Write_Msg(0 + flag * 6, msg, 6);
	movlw	(recive_task@msg)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	movlw	(06h)
	movwf	0+(?_AT24C02_Write_Msg)+01h
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@flag),w
	fcall	___bmul
	fcall	_AT24C02_Write_Msg
	line	359
	
l17574:	
;recive.c: 359: for(i = 0; i < 6; i++)
	clrf	(recive_task@i)
	
l17576:	
	movlw	(06h)
	subwf	(recive_task@i),w
	skipc
	goto	u7141
	goto	u7140
u7141:
	goto	l17580
u7140:
	goto	l17586
	line	361
	
l17580:	
;recive.c: 360: {
;recive.c: 361: control_id[flag][i] = msg[i];
	movf	(recive_task@i),w
	addlw	recive_task@msg&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_recive_task+0)+0
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@flag),w
	fcall	___bmul
	movwf	(??_recive_task+1)+0
	movlw	(_control_id)&0ffh
	addwf	0+(??_recive_task+1)+0,w
	movwf	(??_recive_task+2)+0
	movf	(recive_task@i),w
	addwf	0+(??_recive_task+2)+0,w
	movwf	(??_recive_task+3)+0
	movf	0+(??_recive_task+3)+0,w
	movwf	fsr0
	movf	(??_recive_task+0)+0,w
	movwf	indf
	line	359
	
l17582:	
	incf	(recive_task@i),f
	goto	l17576
	line	364
	
l17586:	
;recive.c: 362: }
;recive.c: 364: flag ++;
	incf	(recive_task@flag),f
	line	365
	
l17588:	
;recive.c: 365: if(flag >= 3)
	movlw	(03h)
	subwf	(recive_task@flag),w
	skipc
	goto	u7151
	goto	u7150
u7151:
	goto	l17592
u7150:
	line	367
	
l17590:	
;recive.c: 366: {
;recive.c: 367: flag = 0;
	clrf	(recive_task@flag)
	line	370
	
l17592:	
;recive.c: 368: }
;recive.c: 370: channel_flag &= (~(0x03 << 0));
	movlw	(0FCh)
	andwf	(_channel_flag),f
	line	371
	
l17594:	
;recive.c: 371: channel_flag |= (flag << 0);
	movf	(recive_task@flag),w
	iorwf	(_channel_flag),f
	line	372
;recive.c: 372: }
	goto	l17600
	line	375
	
l17596:	
;recive.c: 373: else
;recive.c: 374: {
;recive.c: 375: flag = i;
	movf	(recive_task@i),w
	movwf	(recive_task@flag)
	line	376
	
l17598:	
;recive.c: 376: AT24C02_Write_Msg(0 + flag * 6 + 5, &msg[5], 1);
	movlw	(recive_task@msg+05h)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@flag),w
	fcall	___bmul
	addlw	05h
	fcall	_AT24C02_Write_Msg
	line	379
	
l17600:	
;recive.c: 377: }
;recive.c: 379: setChannelStatus(0, rf_buf[9]);
	movf	0+(_rf_buf)+09h,w
	movwf	(?_setChannelStatus)
	movlw	(0)
	fcall	_setChannelStatus
	line	381
	
l17602:	
;recive.c: 381: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	382
;recive.c: 382: }
	goto	l17738
	line	383
	
l9960:	
;recive.c: 383: else if(match_channel_flag & 0x20)
	btfss	(_match_channel_flag),(5)&7
	goto	u7161
	goto	u7160
u7161:
	goto	l9972
u7160:
	line	385
	
l17604:	
;recive.c: 384: {
;recive.c: 385: for(i = 0; i < 3; i++)
	clrf	(recive_task@i)
	
l17606:	
	movlw	(03h)
	subwf	(recive_task@i),w
	skipc
	goto	u7171
	goto	u7170
u7171:
	goto	l17610
u7170:
	goto	l17630
	line	392
	
l17610:	
;recive.c: 386: {
;recive.c: 387: if((msg[0] == control_id[i+3][0])
;recive.c: 388: &&(msg[1] == control_id[i+3][1])
;recive.c: 389: &&(msg[2] == control_id[i+3][2])
;recive.c: 390: &&(msg[3] == control_id[i+3][3])
;recive.c: 391: &&(msg[4] == control_id[i+3][4])
;recive.c: 392: )
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+012h&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	xorwf	(recive_task@msg),w
	skipz
	goto	u7181
	goto	u7180
u7181:
	goto	l17624
u7180:
	
l17612:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+013h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+01h,w
	xorwf	indf,w
	skipz
	goto	u7191
	goto	u7190
u7191:
	goto	l17624
u7190:
	
l17614:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+014h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+02h,w
	xorwf	indf,w
	skipz
	goto	u7201
	goto	u7200
u7201:
	goto	l17624
u7200:
	
l17616:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+015h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+03h,w
	xorwf	indf,w
	skipz
	goto	u7211
	goto	u7210
u7211:
	goto	l17624
u7210:
	
l17618:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+016h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+04h,w
	xorwf	indf,w
	skipz
	goto	u7221
	goto	u7220
u7221:
	goto	l17624
u7220:
	line	394
	
l17620:	
;recive.c: 393: {
;recive.c: 394: match_flag = 1;
	clrf	(recive_task@match_flag)
	incf	(recive_task@match_flag),f
	line	395
;recive.c: 395: break;
	goto	l17630
	line	399
	
l17624:	
;recive.c: 397: else
;recive.c: 398: {
;recive.c: 399: match_flag = 0;
	clrf	(recive_task@match_flag)
	line	385
	
l17626:	
	incf	(recive_task@i),f
	goto	l17606
	line	403
	
l17630:	
;recive.c: 400: }
;recive.c: 401: }
;recive.c: 403: if(match_flag == 0)
	movf	(recive_task@match_flag),f
	skipz
	goto	u7231
	goto	u7230
u7231:
	goto	l17662
u7230:
	line	405
	
l17632:	
;recive.c: 404: {
;recive.c: 405: flag = (channel_flag >> 2) & 0x03;
	movf	(_channel_flag),w
	movwf	(??_recive_task+0)+0
	clrc
	rrf	(??_recive_task+0)+0,f
	clrc
	rrf	(??_recive_task+0)+0,f
	movf	0+(??_recive_task+0)+0,w
	movwf	(recive_task@flag)
	movlw	(03h)
	andwf	(recive_task@flag),f
	line	407
	
l17634:	
;recive.c: 407: if(flag >= 3)
	movlw	(03h)
	subwf	(recive_task@flag),w
	skipc
	goto	u7241
	goto	u7240
u7241:
	goto	l17638
u7240:
	line	409
	
l17636:	
;recive.c: 408: {
;recive.c: 409: flag = 0;
	clrf	(recive_task@flag)
	line	412
	
l17638:	
;recive.c: 410: }
;recive.c: 412: AT24C02_Write_Msg(3 * 6 + flag * 6, msg, 6);
	movlw	(recive_task@msg)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	movlw	(06h)
	movwf	0+(?_AT24C02_Write_Msg)+01h
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@flag),w
	fcall	___bmul
	addlw	012h
	fcall	_AT24C02_Write_Msg
	line	413
	
l17640:	
;recive.c: 413: for(i = 0; i < 6; i++)
	clrf	(recive_task@i)
	
l17642:	
	movlw	(06h)
	subwf	(recive_task@i),w
	skipc
	goto	u7251
	goto	u7250
u7251:
	goto	l17646
u7250:
	goto	l17652
	line	415
	
l17646:	
;recive.c: 414: {
;recive.c: 415: control_id[flag + 3][i] = msg[i];
	movf	(recive_task@i),w
	addlw	recive_task@msg&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_recive_task+0)+0
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@flag),w
	fcall	___bmul
	movwf	(??_recive_task+1)+0
	movlw	(_control_id+012h)&0ffh
	addwf	0+(??_recive_task+1)+0,w
	movwf	(??_recive_task+2)+0
	movf	(recive_task@i),w
	addwf	0+(??_recive_task+2)+0,w
	movwf	(??_recive_task+3)+0
	movf	0+(??_recive_task+3)+0,w
	movwf	fsr0
	movf	(??_recive_task+0)+0,w
	movwf	indf
	line	413
	
l17648:	
	incf	(recive_task@i),f
	goto	l17642
	line	418
	
l17652:	
;recive.c: 416: }
;recive.c: 418: flag ++;
	incf	(recive_task@flag),f
	line	419
	
l17654:	
;recive.c: 419: if(flag >= 3)
	movlw	(03h)
	subwf	(recive_task@flag),w
	skipc
	goto	u7261
	goto	u7260
u7261:
	goto	l17658
u7260:
	line	421
	
l17656:	
;recive.c: 420: {
;recive.c: 421: flag = 0;
	clrf	(recive_task@flag)
	line	423
	
l17658:	
;recive.c: 422: }
;recive.c: 423: channel_flag &= (~(0x03 << 2));
	movlw	(0F3h)
	andwf	(_channel_flag),f
	line	424
	
l17660:	
;recive.c: 424: channel_flag |= (flag << 2);
	movf	(recive_task@flag),w
	movwf	(??_recive_task+0)+0
	clrc
	rlf	(??_recive_task+0)+0,f
	clrc
	rlf	(??_recive_task+0)+0,w
	iorwf	(_channel_flag),f
	line	426
;recive.c: 426: }
	goto	l17668
	line	429
	
l17662:	
;recive.c: 431: debug = flag;
	movf	(recive_task@i),w
	movwf	(recive_task@flag)
	line	433
	
l17664:	
;recive.c: 433: AT24C02_Write_Msg(3 * 6 + flag * 6 + 5, &msg[5], 1);
	movlw	(recive_task@msg+05h)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@flag),w
	fcall	___bmul
	addlw	017h
	fcall	_AT24C02_Write_Msg
	line	434
	
l17666:	
;recive.c: 434: soft_delay_ms(2);
	movlw	02h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	437
	
l17668:	
;recive.c: 435: }
;recive.c: 437: setChannelStatus(1, rf_buf[9]);
	movf	0+(_rf_buf)+09h,w
	movwf	(?_setChannelStatus)
	movlw	(01h)
	fcall	_setChannelStatus
	goto	l17602
	line	441
	
l9972:	
;recive.c: 441: else if(match_channel_flag&0x40)
	btfss	(_match_channel_flag),(6)&7
	goto	u7271
	goto	u7270
u7271:
	goto	l17738
u7270:
	line	444
	
l17672:	
;recive.c: 442: {
;recive.c: 444: for(i = 0; i < 3; i++)
	clrf	(recive_task@i)
	
l17674:	
	movlw	(03h)
	subwf	(recive_task@i),w
	skipc
	goto	u7281
	goto	u7280
u7281:
	goto	l17678
u7280:
	goto	l17698
	line	451
	
l17678:	
;recive.c: 445: {
;recive.c: 446: if((msg[0] == control_id[i+6][0])
;recive.c: 447: &&(msg[1] == control_id[i+6][1])
;recive.c: 448: &&(msg[2] == control_id[i+6][2])
;recive.c: 449: &&(msg[3] == control_id[i+6][3])
;recive.c: 450: &&(msg[4] == control_id[i+6][4])
;recive.c: 451: )
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+024h&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	xorwf	(recive_task@msg),w
	skipz
	goto	u7291
	goto	u7290
u7291:
	goto	l17692
u7290:
	
l17680:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+025h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+01h,w
	xorwf	indf,w
	skipz
	goto	u7301
	goto	u7300
u7301:
	goto	l17692
u7300:
	
l17682:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+026h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+02h,w
	xorwf	indf,w
	skipz
	goto	u7311
	goto	u7310
u7311:
	goto	l17692
u7310:
	
l17684:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+027h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+03h,w
	xorwf	indf,w
	skipz
	goto	u7321
	goto	u7320
u7321:
	goto	l17692
u7320:
	
l17686:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+028h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+04h,w
	xorwf	indf,w
	skipz
	goto	u7331
	goto	u7330
u7331:
	goto	l17692
u7330:
	line	453
	
l17688:	
;recive.c: 452: {
;recive.c: 453: match_flag = 1;
	clrf	(recive_task@match_flag)
	incf	(recive_task@match_flag),f
	line	454
;recive.c: 454: break;
	goto	l17698
	line	458
	
l17692:	
;recive.c: 456: else
;recive.c: 457: {
;recive.c: 458: match_flag = 0;
	clrf	(recive_task@match_flag)
	line	444
	
l17694:	
	incf	(recive_task@i),f
	goto	l17674
	line	462
	
l17698:	
;recive.c: 459: }
;recive.c: 460: }
;recive.c: 462: if(match_flag == 0)
	movf	(recive_task@match_flag),f
	skipz
	goto	u7341
	goto	u7340
u7341:
	goto	l17730
u7340:
	line	464
	
l17700:	
;recive.c: 463: {
;recive.c: 464: flag = (channel_flag >> 4) & 0x03;
	swapf	(_channel_flag),w
	andlw	(0ffh shr 4) & 0ffh
	movwf	(recive_task@flag)
	movlw	(03h)
	andwf	(recive_task@flag),f
	line	466
	
l17702:	
;recive.c: 466: if (flag >= 3)
	movlw	(03h)
	subwf	(recive_task@flag),w
	skipc
	goto	u7351
	goto	u7350
u7351:
	goto	l17706
u7350:
	line	468
	
l17704:	
;recive.c: 467: {
;recive.c: 468: flag = 0;
	clrf	(recive_task@flag)
	line	471
	
l17706:	
;recive.c: 469: }
;recive.c: 471: AT24C02_Write_Msg(6 * 6 + flag * 6, msg, 6);
	movlw	(recive_task@msg)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	movlw	(06h)
	movwf	0+(?_AT24C02_Write_Msg)+01h
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@flag),w
	fcall	___bmul
	addlw	024h
	fcall	_AT24C02_Write_Msg
	line	472
	
l17708:	
;recive.c: 472: for(i = 0; i < 6; i++)
	clrf	(recive_task@i)
	
l17710:	
	movlw	(06h)
	subwf	(recive_task@i),w
	skipc
	goto	u7361
	goto	u7360
u7361:
	goto	l17714
u7360:
	goto	l17720
	line	474
	
l17714:	
;recive.c: 473: {
;recive.c: 474: control_id[flag + 6][i] = msg[i];
	movf	(recive_task@i),w
	addlw	recive_task@msg&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_recive_task+0)+0
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@flag),w
	fcall	___bmul
	movwf	(??_recive_task+1)+0
	movlw	(_control_id+024h)&0ffh
	addwf	0+(??_recive_task+1)+0,w
	movwf	(??_recive_task+2)+0
	movf	(recive_task@i),w
	addwf	0+(??_recive_task+2)+0,w
	movwf	(??_recive_task+3)+0
	movf	0+(??_recive_task+3)+0,w
	movwf	fsr0
	movf	(??_recive_task+0)+0,w
	movwf	indf
	line	472
	
l17716:	
	incf	(recive_task@i),f
	goto	l17710
	line	477
	
l17720:	
;recive.c: 475: }
;recive.c: 477: flag ++;
	incf	(recive_task@flag),f
	line	478
	
l17722:	
;recive.c: 478: if(flag >= 3)
	movlw	(03h)
	subwf	(recive_task@flag),w
	skipc
	goto	u7371
	goto	u7370
u7371:
	goto	l17726
u7370:
	line	480
	
l17724:	
;recive.c: 479: {
;recive.c: 480: flag = 0;
	clrf	(recive_task@flag)
	line	483
	
l17726:	
;recive.c: 481: }
;recive.c: 483: channel_flag &= (~(0x03 << 4));
	movlw	(0CFh)
	andwf	(_channel_flag),f
	line	484
	
l17728:	
;recive.c: 484: channel_flag |= (flag << 4);
	swapf	(recive_task@flag),w
	andlw	(0ffh shl 4) & 0ffh
	iorwf	(_channel_flag),f
	line	486
;recive.c: 486: }
	goto	l17734
	line	489
	
l17730:	
;recive.c: 487: else
;recive.c: 488: {
;recive.c: 489: flag = i;
	movf	(recive_task@i),w
	movwf	(recive_task@flag)
	line	490
	
l17732:	
;recive.c: 490: AT24C02_Write_Msg(6 * 6 + flag * 6 + 5, &msg[5], 1);
	movlw	(recive_task@msg+05h)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@flag),w
	fcall	___bmul
	addlw	029h
	fcall	_AT24C02_Write_Msg
	line	493
	
l17734:	
;recive.c: 491: }
;recive.c: 493: setChannelStatus(2, rf_buf[9]);
	movf	0+(_rf_buf)+09h,w
	movwf	(?_setChannelStatus)
	movlw	(02h)
	fcall	_setChannelStatus
	goto	l17602
	line	498
	
l17738:	
;recive.c: 496: }
;recive.c: 498: AT24C02_Write_Msg(110, &channel_flag,1);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(06Eh)
	fcall	_AT24C02_Write_Msg
	line	499
	
l17740:	
;recive.c: 499: AT24C02_Write_Msg(110, &channel_flag,1);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(06Eh)
	fcall	_AT24C02_Write_Msg
	line	501
	
l17742:	
;recive.c: 501: for(i = 0; i < 12; i++)
	clrf	(recive_task@i)
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u7381
	goto	u7380
u7381:
	goto	l17746
u7380:
	goto	l17752
	line	503
	
l17746:	
;recive.c: 502: {
;recive.c: 503: AT24C02_Read_Msg(i * 6, control_id[i], 6);
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id&0ffh
	movwf	(?_AT24C02_Read_Msg)
	movlw	(06h)
	movwf	0+(?_AT24C02_Read_Msg)+01h
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	fcall	_AT24C02_Read_Msg
	line	501
	
l17748:	
	incf	(recive_task@i),f
	
l17750:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u7391
	goto	u7390
u7391:
	goto	l17746
u7390:
	line	505
	
l17752:	
;recive.c: 504: }
;recive.c: 505: AT24C02_Read_Msg(110, &channel_flag, 1);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Read_Msg)
	clrf	0+(?_AT24C02_Read_Msg)+01h
	incf	0+(?_AT24C02_Read_Msg)+01h,f
	movlw	(06Eh)
	fcall	_AT24C02_Read_Msg
	line	507
	
l17754:	
;recive.c: 507: if (is_factory_flag)
	movf	(_is_factory_flag),w
	skipz
	goto	u7400
	goto	l17524
u7400:
	line	509
	
l17756:	
;recive.c: 508: {
;recive.c: 509: AT24C02_Write_Byte(113, 0x5E);
	movlw	(05Eh)
	movwf	(?_AT24C02_Write_Byte)
	movlw	(071h)
	fcall	_AT24C02_Write_Byte
	line	510
;recive.c: 510: soft_delay_ms(5);
	movlw	05h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	511
;recive.c: 511: AT24C02_Write_Byte(113 + 1, 0xF6);
	movlw	(0F6h)
	movwf	(?_AT24C02_Write_Byte)
	movlw	(072h)
	fcall	_AT24C02_Write_Byte
	line	512
;recive.c: 512: soft_delay_ms(5);
	movlw	05h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	goto	l17522
	line	524
	
l17764:	
;recive.c: 522: else
;recive.c: 523: {
;recive.c: 524: if(flag_5s_add > 500)
	movlw	high(01F5h)
	subwf	(_flag_5s_add+1),w
	movlw	low(01F5h)
	skipnz
	subwf	(_flag_5s_add),w
	skipc
	goto	u7411
	goto	u7410
u7411:
	goto	l10110
u7410:
	line	526
	
l17766:	
;recive.c: 525: {
;recive.c: 526: sys_stute = 1;
	clrf	(_sys_stute)
	incf	(_sys_stute),f
	line	527
	
l17768:	
;recive.c: 527: match_channel_flag = 0;
	clrf	(_match_channel_flag)
	goto	l10110
	line	529
	
l9998:	
	line	530
;recive.c: 528: }
;recive.c: 529: }
;recive.c: 530: }break;
	goto	l10110
	line	533
	
l17770:	
;recive.c: 532: {
;recive.c: 533: if(rx_data())
	fcall	_rx_data
	xorlw	0
	skipnz
	goto	u7421
	goto	u7420
u7421:
	goto	l10110
u7420:
	line	535
	
l17772:	
;recive.c: 534: {
;recive.c: 535: if (rf_buf[8] == (0x20))
	movf	0+(_rf_buf)+08h,w
	xorlw	020h
	skipz
	goto	u7431
	goto	u7430
u7431:
	goto	l17816
u7430:
	line	537
	
l17774:	
;recive.c: 536: {
;recive.c: 537: if(rf_buf[10] != 0xff)
	movf	0+(_rf_buf)+0Ah,w
	xorlw	0FFh
	skipnz
	goto	u7441
	goto	u7440
u7441:
	goto	l18132
u7440:
	line	539
	
l17776:	
;recive.c: 538: {
;recive.c: 539: for (i = 9; i < 12; i++)
	movlw	(09h)
	movwf	(recive_task@i)
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u7451
	goto	u7450
u7451:
	goto	l17780
u7450:
	goto	l18132
	line	544
	
l17780:	
;recive.c: 540: {
;recive.c: 541: if((rf_buf[3] == control_id[i][0])
;recive.c: 542: &&(rf_buf[4] == control_id[i][1])
;recive.c: 543: &&(rf_buf[5] == control_id[i][2])
;recive.c: 544: &&(rf_buf[6] == control_id[i][3]))
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+03h,w
	bcf	status, 7	;select IRP bank1
	xorwf	indf,w
	skipz
	goto	u7461
	goto	u7460
u7461:
	goto	l17812
u7460:
	
l17782:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+01h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+04h,w
	xorwf	indf,w
	skipz
	goto	u7471
	goto	u7470
u7471:
	goto	l17812
u7470:
	
l17784:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+02h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+05h,w
	xorwf	indf,w
	skipz
	goto	u7481
	goto	u7480
u7481:
	goto	l17812
u7480:
	
l17786:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+03h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+06h,w
	xorwf	indf,w
	skipz
	goto	u7491
	goto	u7490
u7491:
	goto	l17812
u7490:
	line	546
	
l17788:	
;recive.c: 545: {
;recive.c: 546: if(rf_buf[2] != control_id[i][5])
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	xorwf	indf,w
	skipnz
	goto	u7501
	goto	u7500
u7501:
	goto	l10003
u7500:
	line	548
	
l17790:	
;recive.c: 547: {
;recive.c: 548: control_id[i][5] = rf_buf[2];
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	movwf	indf
	line	550
	
l17792:	
;recive.c: 550: if(rf_buf[9] < (6))
	movlw	(06h)
	subwf	0+(_rf_buf)+09h,w
	skipnc
	goto	u7511
	goto	u7510
u7511:
	goto	l18132
u7510:
	line	552
	
l17794:	
;recive.c: 551: {
;recive.c: 552: sledBlink();
	fcall	_sledBlink
	line	555
	
l17796:	
;recive.c: 555: for(i = 9; i < 12; i++)
	movlw	(09h)
	movwf	(recive_task@i)
	
l17798:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u7521
	goto	u7520
u7521:
	goto	l17802
u7520:
	goto	l18132
	line	557
	
l17802:	
;recive.c: 556: {
;recive.c: 557: if ((control_id[i][4] & (0x01 << rf_buf[9])) != 0)
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+04h&0ffh
	movwf	fsr0
	movlw	(01h)
	movwf	(??_recive_task+0)+0
	incf	0+(_rf_buf)+09h,w
	goto	u7534
u7535:
	clrc
	rlf	(??_recive_task+0)+0,f
u7534:
	addlw	-1
	skipz
	goto	u7535
	movf	0+(??_recive_task+0)+0,w
	bcf	status, 7	;select IRP bank1
	andwf	indf,w
	btfsc	status,2
	goto	u7541
	goto	u7540
u7541:
	goto	l17806
u7540:
	line	559
	
l17804:	
;recive.c: 558: {
;recive.c: 559: setChannelStatus(i - 9, 1);
	clrf	(?_setChannelStatus)
	incf	(?_setChannelStatus),f
	movf	(recive_task@i),w
	addlw	0F7h
	fcall	_setChannelStatus
	line	560
;recive.c: 560: }
	goto	l17808
	line	563
	
l17806:	
;recive.c: 561: else
;recive.c: 562: {
;recive.c: 563: setChannelStatus(i - 9, 0);
	clrf	(?_setChannelStatus)
	movf	(recive_task@i),w
	addlw	0F7h
	fcall	_setChannelStatus
	line	555
	
l17808:	
	incf	(recive_task@i),f
	goto	l17798
	line	539
	
l17812:	
	incf	(recive_task@i),f
	
l17814:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u7551
	goto	u7550
u7551:
	goto	l17780
u7550:
	goto	l18132
	line	574
	
l10003:	
	line	576
;recive.c: 571: }
;recive.c: 573: }
;recive.c: 574: }
;recive.c: 576: }
	goto	l18132
	line	577
	
l17816:	
;recive.c: 577: else if (rf_buf[8] == (0x21))
	movf	0+(_rf_buf)+08h,w
	xorlw	021h
	skipz
	goto	u7561
	goto	u7560
u7561:
	goto	l17882
u7560:
	line	579
	
l17818:	
;recive.c: 578: {
;recive.c: 579: match_flag = 0;
	clrf	(recive_task@match_flag)
	line	580
;recive.c: 580: for(i= 0; i< 12; i++)
	clrf	(recive_task@i)
	
l17820:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u7571
	goto	u7570
u7571:
	goto	l17824
u7570:
	goto	l17842
	line	585
	
l17824:	
;recive.c: 581: {
;recive.c: 582: if((rf_buf[3] == control_id[i][0])
;recive.c: 583: &&(rf_buf[4] == control_id[i][1])
;recive.c: 584: &&(rf_buf[5] == control_id[i][2])
;recive.c: 585: &&(rf_buf[6] == control_id[i][3]))
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+03h,w
	bcf	status, 7	;select IRP bank1
	xorwf	indf,w
	skipz
	goto	u7581
	goto	u7580
u7581:
	goto	l17838
u7580:
	
l17826:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+01h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+04h,w
	xorwf	indf,w
	skipz
	goto	u7591
	goto	u7590
u7591:
	goto	l17838
u7590:
	
l17828:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+02h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+05h,w
	xorwf	indf,w
	skipz
	goto	u7601
	goto	u7600
u7601:
	goto	l17838
u7600:
	
l17830:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+03h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+06h,w
	xorwf	indf,w
	skipz
	goto	u7611
	goto	u7610
u7611:
	goto	l17838
u7610:
	line	587
	
l17832:	
;recive.c: 586: {
;recive.c: 587: if(rf_buf[2] != control_id[i][5])
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	xorwf	indf,w
	skipnz
	goto	u7621
	goto	u7620
u7621:
	goto	l17842
u7620:
	line	589
	
l17834:	
;recive.c: 588: {
;recive.c: 589: control_id[i][5] = rf_buf[2];
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	movwf	indf
	line	590
	
l17836:	
;recive.c: 590: match_flag = 1;
	clrf	(recive_task@match_flag)
	incf	(recive_task@match_flag),f
	goto	l17842
	line	580
	
l17838:	
	incf	(recive_task@i),f
	goto	l17820
	line	596
	
l17842:	
;recive.c: 593: }
;recive.c: 594: }
;recive.c: 596: if (match_flag && rf_buf[9] < (6) && rf_buf[10] <= (1) && rf_buf[11] < (3))
	movf	(recive_task@match_flag),w
	skipz
	goto	u7630
	goto	l18132
u7630:
	
l17844:	
	movlw	(06h)
	subwf	0+(_rf_buf)+09h,w
	skipnc
	goto	u7641
	goto	u7640
u7641:
	goto	l18132
u7640:
	
l17846:	
	movlw	(02h)
	subwf	0+(_rf_buf)+0Ah,w
	skipnc
	goto	u7651
	goto	u7650
u7651:
	goto	l18132
u7650:
	
l17848:	
	movlw	(03h)
	subwf	0+(_rf_buf)+0Bh,w
	skipnc
	goto	u7661
	goto	u7660
u7661:
	goto	l18132
u7660:
	line	599
	
l17850:	
;recive.c: 597: {
;recive.c: 599: if (rf_buf[10] == (0))
	movf	0+(_rf_buf)+0Ah,f
	skipz
	goto	u7671
	goto	u7670
u7671:
	goto	l17854
u7670:
	line	601
	
l17852:	
;recive.c: 600: {
;recive.c: 601: control_id[9 + rf_buf[11]][4] &= (~ (0x01 << rf_buf[9]));
	movlw	(06h)
	movwf	(?___bmul)
	movf	0+(_rf_buf)+0Bh,w
	fcall	___bmul
	addlw	_control_id+03Ah&0ffh
	movwf	fsr0
	movlw	(01h)
	movwf	(??_recive_task+0)+0
	incf	0+(_rf_buf)+09h,w
	goto	u7684
u7685:
	clrc
	rlf	(??_recive_task+0)+0,f
u7684:
	addlw	-1
	skipz
	goto	u7685
	movf	0+(??_recive_task+0)+0,w
	xorlw	0ffh
	bcf	status, 7	;select IRP bank1
	andwf	indf,f
	line	602
;recive.c: 602: }
	goto	l10021
	line	605
	
l17854:	
;recive.c: 603: else
;recive.c: 604: {
;recive.c: 605: control_id[9 + rf_buf[11]][4] |= ((0x01 << rf_buf[9]));
	movlw	(06h)
	movwf	(?___bmul)
	movf	0+(_rf_buf)+0Bh,w
	fcall	___bmul
	addlw	_control_id+03Ah&0ffh
	movwf	fsr0
	movlw	(01h)
	movwf	(??_recive_task+0)+0
	incf	0+(_rf_buf)+09h,w
	goto	u7694
u7695:
	clrc
	rlf	(??_recive_task+0)+0,f
u7694:
	addlw	-1
	skipz
	goto	u7695
	movf	0+(??_recive_task+0)+0,w
	bcf	status, 7	;select IRP bank1
	iorwf	indf,f
	line	606
	
l10021:	
	line	608
;recive.c: 606: }
;recive.c: 608: AT24C02_Write_Msg(9 * 6 + rf_buf[11] * 6 + 4, &control_id[9 + rf_buf[11]][4], 1);
	movlw	(06h)
	movwf	(?___bmul)
	movf	0+(_rf_buf)+0Bh,w
	fcall	___bmul
	addlw	_control_id+03Ah&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(06h)
	movwf	(?___bmul)
	movf	0+(_rf_buf)+0Bh,w
	fcall	___bmul
	addlw	03Ah
	fcall	_AT24C02_Write_Msg
	line	609
	
l17856:	
;recive.c: 609: soft_delay_ms(1);
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	612
	
l17858:	
;recive.c: 612: for(i = 0; i < 12; i++)
	clrf	(recive_task@i)
	
l17860:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u7701
	goto	u7700
u7701:
	goto	l17864
u7700:
	goto	l17870
	line	614
	
l17864:	
;recive.c: 613: {
;recive.c: 614: AT24C02_Read_Msg(i * 6, control_id[i], 6);
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id&0ffh
	movwf	(?_AT24C02_Read_Msg)
	movlw	(06h)
	movwf	0+(?_AT24C02_Read_Msg)+01h
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	fcall	_AT24C02_Read_Msg
	line	612
	
l17866:	
	incf	(recive_task@i),f
	goto	l17860
	line	616
	
l17870:	
;recive.c: 615: }
;recive.c: 616: AT24C02_Read_Msg(110, &channel_flag, 1);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Read_Msg)
	clrf	0+(?_AT24C02_Read_Msg)+01h
	incf	0+(?_AT24C02_Read_Msg)+01h,f
	movlw	(06Eh)
	fcall	_AT24C02_Read_Msg
	line	619
	
l17872:	
;recive.c: 619: if (rf_buf[10] == (1))
	decf	0+(_rf_buf)+0Ah,w
	skipz
	goto	u7711
	goto	u7710
u7711:
	goto	l17876
u7710:
	line	621
	
l17874:	
;recive.c: 620: {
;recive.c: 621: setChannelStatus(rf_buf[11], 1);
	clrf	(?_setChannelStatus)
	incf	(?_setChannelStatus),f
	movf	0+(_rf_buf)+0Bh,w
	fcall	_setChannelStatus
	line	622
;recive.c: 622: }
	goto	l17880
	line	623
	
l17876:	
;recive.c: 623: else if (rf_buf[10] == (0))
	movf	0+(_rf_buf)+0Ah,f
	skipz
	goto	u7721
	goto	u7720
u7721:
	goto	l17880
u7720:
	line	625
	
l17878:	
;recive.c: 624: {
;recive.c: 625: setChannelStatus(rf_buf[11], 0);
	clrf	(?_setChannelStatus)
	movf	0+(_rf_buf)+0Bh,w
	fcall	_setChannelStatus
	line	628
	
l17880:	
;recive.c: 626: }
;recive.c: 628: sledBlink();
	fcall	_sledBlink
	goto	l18132
	line	632
	
l17882:	
;recive.c: 632: else if (rf_buf[8] == (0x10) || rf_buf[8] == (0x11))
	movf	0+(_rf_buf)+08h,w
	xorlw	010h
	skipnz
	goto	u7731
	goto	u7730
u7731:
	goto	l17886
u7730:
	
l17884:	
	movf	0+(_rf_buf)+08h,w
	xorlw	011h
	skipz
	goto	u7741
	goto	u7740
u7741:
	goto	l18048
u7740:
	line	634
	
l17886:	
;recive.c: 633: {
;recive.c: 634: if(rf_buf[10] != 0xff)
	movf	0+(_rf_buf)+0Ah,w
	xorlw	0FFh
	skipnz
	goto	u7751
	goto	u7750
u7751:
	goto	l17972
u7750:
	line	636
	
l17888:	
;recive.c: 635: {
;recive.c: 636: for(i=0; i<9; i++)
	clrf	(recive_task@i)
	
l17890:	
	movlw	(09h)
	subwf	(recive_task@i),w
	skipc
	goto	u7761
	goto	u7760
u7761:
	goto	l17894
u7760:
	goto	l18132
	line	648
	
l17894:	
;recive.c: 637: {
;recive.c: 638: if ((is_factory_flag == 1)
;recive.c: 639: &&((rf_buf[3] == 0x11)
;recive.c: 640: &&(rf_buf[4] == 0x56)
;recive.c: 641: &&(rf_buf[5] == 0x32)
;recive.c: 642: &&(rf_buf[6] == 0xF9))
;recive.c: 643: ||
;recive.c: 644: ((rf_buf[3] == control_id[i][0])
;recive.c: 645: &&(rf_buf[4] == control_id[i][1])
;recive.c: 646: &&(rf_buf[5] == control_id[i][2])
;recive.c: 647: &&(rf_buf[6] == control_id[i][3]))
;recive.c: 648: )
	decf	(_is_factory_flag),w
	skipz
	goto	u7771
	goto	u7770
u7771:
	goto	l17904
u7770:
	
l17896:	
	movf	0+(_rf_buf)+03h,w
	xorlw	011h
	skipz
	goto	u7781
	goto	u7780
u7781:
	goto	l17904
u7780:
	
l17898:	
	movf	0+(_rf_buf)+04h,w
	xorlw	056h
	skipz
	goto	u7791
	goto	u7790
u7791:
	goto	l17904
u7790:
	
l17900:	
	movf	0+(_rf_buf)+05h,w
	xorlw	032h
	skipz
	goto	u7801
	goto	u7800
u7801:
	goto	l17904
u7800:
	
l17902:	
	movf	0+(_rf_buf)+06h,w
	xorlw	0F9h
	skipnz
	goto	u7811
	goto	u7810
u7811:
	goto	l17912
u7810:
	
l17904:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+03h,w
	bcf	status, 7	;select IRP bank1
	xorwf	indf,w
	skipz
	goto	u7821
	goto	u7820
u7821:
	goto	l17968
u7820:
	
l17906:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+01h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+04h,w
	xorwf	indf,w
	skipz
	goto	u7831
	goto	u7830
u7831:
	goto	l17968
u7830:
	
l17908:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+02h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+05h,w
	xorwf	indf,w
	skipz
	goto	u7841
	goto	u7840
u7841:
	goto	l17968
u7840:
	
l17910:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+03h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+06h,w
	xorwf	indf,w
	skipz
	goto	u7851
	goto	u7850
u7851:
	goto	l17968
u7850:
	line	650
	
l17912:	
;recive.c: 649: {
;recive.c: 650: if(rf_buf[2] != control_id[i][5])
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	bcf	status, 7	;select IRP bank1
	xorwf	indf,w
	skipnz
	goto	u7861
	goto	u7860
u7861:
	goto	l17968
u7860:
	line	652
	
l17914:	
;recive.c: 651: {
;recive.c: 652: control_id[i][5] = rf_buf[2];
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	movwf	indf
	line	653
;recive.c: 653: if(rf_buf[10] == control_id[i][4])
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+04h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+0Ah,w
	xorwf	indf,w
	skipz
	goto	u7871
	goto	u7870
u7871:
	goto	l17968
u7870:
	line	655
	
l17916:	
;recive.c: 654: {
;recive.c: 655: if(flag == 0)
	movf	(recive_task@flag),f
	skipz
	goto	u7881
	goto	u7880
u7881:
	goto	l17922
u7880:
	line	657
	
l17918:	
;recive.c: 656: {
;recive.c: 657: flag = 1;
	clrf	(recive_task@flag)
	incf	(recive_task@flag),f
	line	658
	
l17920:	
;recive.c: 658: sledBlink();
	fcall	_sledBlink
	line	661
	
l17922:	
;recive.c: 659: }
;recive.c: 661: if(rf_buf[11] == 0)
	movf	0+(_rf_buf)+0Bh,f
	skipz
	goto	u7891
	goto	u7890
u7891:
	goto	l17952
u7890:
	line	663
	
l17924:	
;recive.c: 662: {
;recive.c: 663: if(i < 3)
	movlw	(03h)
	subwf	(recive_task@i),w
	skipnc
	goto	u7901
	goto	u7900
u7901:
	goto	l17934
u7900:
	line	665
	
l17926:	
;recive.c: 664: {
;recive.c: 665: if((KEY0_FLAG == 0))
	movf	(_KEY0_FLAG),f
	skipz
	goto	u7911
	goto	u7910
u7911:
	goto	l17968
u7910:
	line	667
	
l17928:	
;recive.c: 666: {
;recive.c: 667: if(rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u7921
	goto	u7920
u7921:
	goto	l17932
u7920:
	line	668
	
l17930:	
;recive.c: 668: setChannelStatus(0, 2);
	movlw	(02h)
	movwf	(?_setChannelStatus)
	movlw	(0)
	fcall	_setChannelStatus
	goto	l17968
	line	670
	
l17932:	
;recive.c: 669: else
;recive.c: 670: setChannelStatus(0, rf_buf[9]);
	movf	0+(_rf_buf)+09h,w
	movwf	(?_setChannelStatus)
	movlw	(0)
	fcall	_setChannelStatus
	goto	l17968
	line	673
	
l17934:	
;recive.c: 673: else if(i < 6)
	movlw	(06h)
	subwf	(recive_task@i),w
	skipnc
	goto	u7931
	goto	u7930
u7931:
	goto	l17944
u7930:
	line	675
	
l17936:	
;recive.c: 674: {
;recive.c: 675: if((KEY1_FLAG == 0))
	movf	(_KEY1_FLAG),f
	skipz
	goto	u7941
	goto	u7940
u7941:
	goto	l17968
u7940:
	line	677
	
l17938:	
;recive.c: 676: {
;recive.c: 677: if(rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u7951
	goto	u7950
u7951:
	goto	l17942
u7950:
	line	678
	
l17940:	
;recive.c: 678: setChannelStatus(1, 2);
	movlw	(02h)
	movwf	(?_setChannelStatus)
	movlw	(01h)
	fcall	_setChannelStatus
	goto	l17968
	line	680
	
l17942:	
;recive.c: 679: else
;recive.c: 680: setChannelStatus(1, rf_buf[9]);
	movf	0+(_rf_buf)+09h,w
	movwf	(?_setChannelStatus)
	movlw	(01h)
	fcall	_setChannelStatus
	goto	l17968
	line	686
	
l17944:	
;recive.c: 684: else
;recive.c: 685: {
;recive.c: 686: if((KEY2_FLAG == 0))
	movf	(_KEY2_FLAG),f
	skipz
	goto	u7961
	goto	u7960
u7961:
	goto	l10058
u7960:
	line	688
	
l17946:	
;recive.c: 687: {
;recive.c: 688: if(rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u7971
	goto	u7970
u7971:
	goto	l17950
u7970:
	line	689
	
l17948:	
;recive.c: 689: setChannelStatus(2, 2);
	movlw	(02h)
	movwf	(?_setChannelStatus)
	movlw	(02h)
	fcall	_setChannelStatus
	goto	l17968
	line	691
	
l17950:	
;recive.c: 690: else
;recive.c: 691: setChannelStatus(2, rf_buf[9]);
	movf	0+(_rf_buf)+09h,w
	movwf	(?_setChannelStatus)
	movlw	(02h)
	fcall	_setChannelStatus
	goto	l17968
	line	697
	
l17952:	
;recive.c: 695: else
;recive.c: 696: {
;recive.c: 697: flag_5min_add = 0;
	clrf	(_flag_5min_add)
	clrf	(_flag_5min_add+1)
	line	698
	
l17954:	
;recive.c: 698: if(delay_flag == 1)
	decf	(_delay_flag),w
	skipz
	goto	u7981
	goto	u7980
u7981:
	goto	l17958
u7980:
	line	700
	
l17956:	
;recive.c: 699: {
;recive.c: 700: channel_delay[0] = 0;
	clrf	(_channel_delay)
	line	701
;recive.c: 701: delay_flag = 0;
	clrf	(_delay_flag)
	line	703
	
l17958:	
;recive.c: 702: }
;recive.c: 703: if(i < 3)
	movlw	(03h)
	subwf	(recive_task@i),w
	skipnc
	goto	u7991
	goto	u7990
u7991:
	goto	l17962
u7990:
	line	705
	
l17960:	
;recive.c: 704: {
;recive.c: 705: channel_delay[0] |= 0x01;
	bsf	(_channel_delay)+(0/8),(0)&7
	line	706
;recive.c: 706: }
	goto	l17966
	line	707
	
l17962:	
;recive.c: 707: else if(i < 6)
	movlw	(06h)
	subwf	(recive_task@i),w
	skipnc
	goto	u8001
	goto	u8000
u8001:
	goto	l10062
u8000:
	line	709
	
l17964:	
;recive.c: 708: {
;recive.c: 709: channel_delay[0] |= 0x02;
	bsf	(_channel_delay)+(1/8),(1)&7
	line	710
;recive.c: 710: }
	goto	l17966
	line	711
	
l10062:	
	line	713
;recive.c: 711: else
;recive.c: 712: {
;recive.c: 713: channel_delay[0] |= 0x04;
	bsf	(_channel_delay)+(2/8),(2)&7
	line	715
	
l17966:	
;recive.c: 714: }
;recive.c: 715: channel_delay[1] = rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	0+(_channel_delay)+01h
	line	716
;recive.c: 716: channel_delay[2] = rf_buf[11];
	movf	0+(_rf_buf)+0Bh,w
	movwf	0+(_channel_delay)+02h
	goto	l17968
	line	717
	
l10058:	
	line	636
	
l17968:	
	incf	(recive_task@i),f
	goto	l17890
	line	726
	
l17972:	
;recive.c: 724: else
;recive.c: 725: {
;recive.c: 726: for(i=0; i<9; i++)
	clrf	(recive_task@i)
	
l17974:	
	movlw	(09h)
	subwf	(recive_task@i),w
	skipc
	goto	u8011
	goto	u8010
u8011:
	goto	l17978
u8010:
	goto	l18132
	line	738
	
l17978:	
;recive.c: 727: {
;recive.c: 728: if ((is_factory_flag == 1)
;recive.c: 729: &&((rf_buf[3] == 0x11)
;recive.c: 730: &&(rf_buf[4] == 0x56)
;recive.c: 731: &&(rf_buf[5] == 0x32)
;recive.c: 732: &&(rf_buf[6] == 0xF9))
;recive.c: 733: ||
;recive.c: 734: ((rf_buf[3] == control_id[i][0])
;recive.c: 735: &&(rf_buf[4] == control_id[i][1])
;recive.c: 736: &&(rf_buf[5] == control_id[i][2])
;recive.c: 737: &&(rf_buf[6] == control_id[i][3]))
;recive.c: 738: )
	decf	(_is_factory_flag),w
	skipz
	goto	u8021
	goto	u8020
u8021:
	goto	l17988
u8020:
	
l17980:	
	movf	0+(_rf_buf)+03h,w
	xorlw	011h
	skipz
	goto	u8031
	goto	u8030
u8031:
	goto	l17988
u8030:
	
l17982:	
	movf	0+(_rf_buf)+04h,w
	xorlw	056h
	skipz
	goto	u8041
	goto	u8040
u8041:
	goto	l17988
u8040:
	
l17984:	
	movf	0+(_rf_buf)+05h,w
	xorlw	032h
	skipz
	goto	u8051
	goto	u8050
u8051:
	goto	l17988
u8050:
	
l17986:	
	movf	0+(_rf_buf)+06h,w
	xorlw	0F9h
	skipnz
	goto	u8061
	goto	u8060
u8061:
	goto	l17996
u8060:
	
l17988:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+03h,w
	bcf	status, 7	;select IRP bank1
	xorwf	indf,w
	skipz
	goto	u8071
	goto	u8070
u8071:
	goto	l18044
u8070:
	
l17990:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+01h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+04h,w
	xorwf	indf,w
	skipz
	goto	u8081
	goto	u8080
u8081:
	goto	l18044
u8080:
	
l17992:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+02h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+05h,w
	xorwf	indf,w
	skipz
	goto	u8091
	goto	u8090
u8091:
	goto	l18044
u8090:
	
l17994:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+03h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+06h,w
	xorwf	indf,w
	skipz
	goto	u8101
	goto	u8100
u8101:
	goto	l18044
u8100:
	line	740
	
l17996:	
;recive.c: 739: {
;recive.c: 740: if((rf_buf[2] != control_id[i][5]))
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	bcf	status, 7	;select IRP bank1
	xorwf	indf,w
	skipnz
	goto	u8111
	goto	u8110
u8111:
	goto	l18044
u8110:
	line	742
	
l17998:	
;recive.c: 741: {
;recive.c: 742: control_id[i][5] = rf_buf[2];
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	movwf	indf
	line	744
	
l18000:	
;recive.c: 744: sledBlink();
	fcall	_sledBlink
	line	746
	
l18002:	
;recive.c: 746: if((rf_buf[11] == 0))
	movf	0+(_rf_buf)+0Bh,f
	skipz
	goto	u8121
	goto	u8120
u8121:
	goto	l18028
u8120:
	line	749
	
l18004:	
;recive.c: 747: {
;recive.c: 749: if((KEY0_FLAG == 0))
	movf	(_KEY0_FLAG),f
	skipz
	goto	u8131
	goto	u8130
u8131:
	goto	l18012
u8130:
	line	751
	
l18006:	
;recive.c: 750: {
;recive.c: 751: if(rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u8141
	goto	u8140
u8141:
	goto	l18010
u8140:
	line	752
	
l18008:	
;recive.c: 752: setChannelStatus(0, 2);
	movlw	(02h)
	movwf	(?_setChannelStatus)
	movlw	(0)
	fcall	_setChannelStatus
	goto	l18012
	line	754
	
l18010:	
;recive.c: 753: else
;recive.c: 754: setChannelStatus(0, rf_buf[9]);
	movf	0+(_rf_buf)+09h,w
	movwf	(?_setChannelStatus)
	movlw	(0)
	fcall	_setChannelStatus
	line	757
	
l18012:	
;recive.c: 755: }
;recive.c: 757: if((KEY1_FLAG == 0))
	movf	(_KEY1_FLAG),f
	skipz
	goto	u8151
	goto	u8150
u8151:
	goto	l18020
u8150:
	line	759
	
l18014:	
;recive.c: 758: {
;recive.c: 759: if(rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u8161
	goto	u8160
u8161:
	goto	l18018
u8160:
	line	760
	
l18016:	
;recive.c: 760: setChannelStatus(1, 2);
	movlw	(02h)
	movwf	(?_setChannelStatus)
	movlw	(01h)
	fcall	_setChannelStatus
	goto	l18020
	line	762
	
l18018:	
;recive.c: 761: else
;recive.c: 762: setChannelStatus(1, rf_buf[9]);
	movf	0+(_rf_buf)+09h,w
	movwf	(?_setChannelStatus)
	movlw	(01h)
	fcall	_setChannelStatus
	line	765
	
l18020:	
;recive.c: 763: }
;recive.c: 765: if((KEY2_FLAG == 0))
	movf	(_KEY2_FLAG),f
	skipz
	goto	u8171
	goto	u8170
u8171:
	goto	l18044
u8170:
	line	767
	
l18022:	
;recive.c: 766: {
;recive.c: 767: if(rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u8181
	goto	u8180
u8181:
	goto	l18026
u8180:
	line	768
	
l18024:	
;recive.c: 768: setChannelStatus(2, 2);
	movlw	(02h)
	movwf	(?_setChannelStatus)
	movlw	(02h)
	fcall	_setChannelStatus
	goto	l18044
	line	770
	
l18026:	
;recive.c: 769: else
;recive.c: 770: setChannelStatus(2, rf_buf[9]);
	movf	0+(_rf_buf)+09h,w
	movwf	(?_setChannelStatus)
	movlw	(02h)
	fcall	_setChannelStatus
	goto	l18044
	line	776
	
l18028:	
;recive.c: 774: else
;recive.c: 775: {
;recive.c: 776: flag_5min_add = 0;
	clrf	(_flag_5min_add)
	clrf	(_flag_5min_add+1)
	line	777
	
l18030:	
;recive.c: 777: if(delay_flag == 1)
	decf	(_delay_flag),w
	skipz
	goto	u8191
	goto	u8190
u8191:
	goto	l18034
u8190:
	line	779
	
l18032:	
;recive.c: 778: {
;recive.c: 779: channel_delay[0] = 0;
	clrf	(_channel_delay)
	line	780
;recive.c: 780: delay_flag = 0;
	clrf	(_delay_flag)
	line	783
	
l18034:	
;recive.c: 781: }
;recive.c: 783: channel_delay[0] |= 0x01;
	bsf	(_channel_delay)+(0/8),(0)&7
	line	784
	
l18036:	
;recive.c: 784: channel_delay[0] |= 0x02;
	bsf	(_channel_delay)+(1/8),(1)&7
	line	785
	
l18038:	
;recive.c: 785: channel_delay[0] |= 0x04;
	bsf	(_channel_delay)+(2/8),(2)&7
	line	787
	
l18040:	
;recive.c: 787: channel_delay[1] = rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	0+(_channel_delay)+01h
	line	788
	
l18042:	
;recive.c: 788: channel_delay[2] = rf_buf[11];
	movf	0+(_rf_buf)+0Bh,w
	movwf	0+(_channel_delay)+02h
	line	726
	
l18044:	
	incf	(recive_task@i),f
	goto	l17974
	line	796
	
l18048:	
;recive.c: 796: else if (rf_buf[8] == (0x30))
	movf	0+(_rf_buf)+08h,w
	xorlw	030h
	skipz
	goto	u8201
	goto	u8200
u8201:
	goto	l18132
u8200:
	line	802
	
l18050:	
;recive.c: 797: {
;recive.c: 802: if(rf_buf[2] != control_id[i][5])
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	bcf	status, 7	;select IRP bank1
	xorwf	indf,w
	skipnz
	goto	u8211
	goto	u8210
u8211:
	goto	l18084
u8210:
	line	804
	
l18052:	
;recive.c: 803: {
;recive.c: 804: control_id[i][5] = rf_buf[2];
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	movwf	indf
	line	806
	
l18054:	
;recive.c: 806: match_flag = 0;
	clrf	(recive_task@match_flag)
	line	807
	
l18056:	
;recive.c: 807: for(i= 0; i< 9; i++)
	clrf	(recive_task@i)
	
l18058:	
	movlw	(09h)
	subwf	(recive_task@i),w
	skipc
	goto	u8221
	goto	u8220
u8221:
	goto	l18062
u8220:
	goto	l18084
	line	812
	
l18062:	
;recive.c: 808: {
;recive.c: 809: if((rf_buf[3] == control_id[i][0])
;recive.c: 810: &&(rf_buf[4] == control_id[i][1])
;recive.c: 811: &&(rf_buf[5] == control_id[i][2])
;recive.c: 812: &&(rf_buf[6] == control_id[i][3]))
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+03h,w
	xorwf	indf,w
	skipz
	goto	u8231
	goto	u8230
u8231:
	goto	l18080
u8230:
	
l18064:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+01h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+04h,w
	xorwf	indf,w
	skipz
	goto	u8241
	goto	u8240
u8241:
	goto	l18080
u8240:
	
l18066:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+02h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+05h,w
	xorwf	indf,w
	skipz
	goto	u8251
	goto	u8250
u8251:
	goto	l18080
u8250:
	
l18068:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+03h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+06h,w
	xorwf	indf,w
	skipz
	goto	u8261
	goto	u8260
u8261:
	goto	l18080
u8260:
	line	814
	
l18070:	
;recive.c: 813: {
;recive.c: 814: if (rf_buf[10] == 0xFF)
	movf	0+(_rf_buf)+0Ah,w
	xorlw	0FFh
	skipz
	goto	u8271
	goto	u8270
u8271:
	goto	l18076
u8270:
	line	816
	
l18072:	
;recive.c: 815: {
;recive.c: 816: match_flag |= 0x07;
	movlw	(07h)
	iorwf	(recive_task@match_flag),f
	line	817
;recive.c: 817: break;
	goto	l18084
	line	819
	
l18076:	
;recive.c: 819: else if (rf_buf[10] == control_id[i][4])
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+04h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+0Ah,w
	xorwf	indf,w
	skipz
	goto	u8281
	goto	u8280
u8281:
	goto	l18080
u8280:
	line	821
	
l18078:	
;recive.c: 820: {
;recive.c: 821: match_flag |= (1 << (i / 3));
	movlw	(01h)
	movwf	(??_recive_task+0)+0
	movlw	(03h)
	movwf	(?___lbdiv)
	movf	(recive_task@i),w
	fcall	___lbdiv
	addlw	1
	goto	u8294
u8295:
	clrc
	rlf	(??_recive_task+0)+0,f
u8294:
	addlw	-1
	skipz
	goto	u8295
	movf	0+(??_recive_task+0)+0,w
	iorwf	(recive_task@match_flag),f
	line	807
	
l18080:	
	incf	(recive_task@i),f
	goto	l18058
	line	828
	
l18084:	
;recive.c: 822: }
;recive.c: 823: }
;recive.c: 824: }
;recive.c: 825: }
;recive.c: 827: if (match_flag
;recive.c: 828: && rf_buf[9] <= 2)
	movf	(recive_task@match_flag),w
	skipz
	goto	u8300
	goto	l18132
u8300:
	
l18086:	
	movlw	(03h)
	subwf	0+(_rf_buf)+09h,w
	skipnc
	goto	u8311
	goto	u8310
u8311:
	goto	l18132
u8310:
	line	831
	
l18088:	
;recive.c: 829: {
;recive.c: 831: for(i = 0; i < (3); i++)
	clrf	(recive_task@i)
	
l18090:	
	movlw	(03h)
	subwf	(recive_task@i),w
	skipc
	goto	u8321
	goto	u8320
u8321:
	goto	l18094
u8320:
	goto	l18128
	line	833
	
l18094:	
;recive.c: 832: {
;recive.c: 833: if (match_flag & (1 << i))
	movlw	(01h)
	movwf	(??_recive_task+0)+0
	incf	(recive_task@i),w
	goto	u8334
u8335:
	clrc
	rlf	(??_recive_task+0)+0,f
u8334:
	addlw	-1
	skipz
	goto	u8335
	movf	0+(??_recive_task+0)+0,w
	andwf	(recive_task@match_flag),w
	btfsc	status,2
	goto	u8341
	goto	u8340
u8341:
	goto	l18124
u8340:
	line	835
	
l18096:	
;recive.c: 834: {
;recive.c: 835: if (rf_buf[9] == 0)
	movf	0+(_rf_buf)+09h,f
	skipz
	goto	u8351
	goto	u8350
u8351:
	goto	l18102
u8350:
	line	837
	
l18098:	
;recive.c: 836: {
;recive.c: 837: { channel_startup |= (1 << ((i << 1) + 0)); channel_startup &= (~(1 << ((i << 1) + 1))); };
	movlw	(01h)
	movwf	(??_recive_task+0)+0
	movf	(recive_task@i),w
	movwf	(??_recive_task+1)+0
	addwf	(??_recive_task+1)+0,w
	addlw	1
	goto	u8364
u8365:
	clrc
	rlf	(??_recive_task+0)+0,f
u8364:
	addlw	-1
	skipz
	goto	u8365
	movf	0+(??_recive_task+0)+0,w
	iorwf	(_channel_startup),f
	movlw	(01h)
	movwf	(??_recive_task+0)+0
	setc
	rlf	(recive_task@i),w
	addlw	1
	goto	u8374
u8375:
	clrc
	rlf	(??_recive_task+0)+0,f
u8374:
	addlw	-1
	skipz
	goto	u8375
	movf	0+(??_recive_task+0)+0,w
	xorlw	0ffh
	andwf	(_channel_startup),f
	line	838
	
l18100:	
;recive.c: 838: setChannelStatus(i, 0);
	clrf	(?_setChannelStatus)
	movf	(recive_task@i),w
	fcall	_setChannelStatus
	line	839
;recive.c: 839: }
	goto	l18124
	line	840
	
l18102:	
;recive.c: 840: else if (rf_buf[9] == 1)
	decf	0+(_rf_buf)+09h,w
	skipz
	goto	u8381
	goto	u8380
u8381:
	goto	l18108
u8380:
	line	842
	
l18104:	
;recive.c: 841: {
;recive.c: 842: { channel_startup &= (~(1 << ((i << 1) + 0))); channel_startup &= (~(1 << ((i << 1) + 1))); };
	movlw	(01h)
	movwf	(??_recive_task+0)+0
	movf	(recive_task@i),w
	movwf	(??_recive_task+1)+0
	addwf	(??_recive_task+1)+0,w
	addlw	1
	goto	u8394
u8395:
	clrc
	rlf	(??_recive_task+0)+0,f
u8394:
	addlw	-1
	skipz
	goto	u8395
	movf	0+(??_recive_task+0)+0,w
	xorlw	0ffh
	andwf	(_channel_startup),f
	movlw	(01h)
	movwf	(??_recive_task+0)+0
	setc
	rlf	(recive_task@i),w
	addlw	1
	goto	u8404
u8405:
	clrc
	rlf	(??_recive_task+0)+0,f
u8404:
	addlw	-1
	skipz
	goto	u8405
	movf	0+(??_recive_task+0)+0,w
	xorlw	0ffh
	andwf	(_channel_startup),f
	line	843
	
l18106:	
;recive.c: 843: setChannelStatus(i, 1);
	clrf	(?_setChannelStatus)
	incf	(?_setChannelStatus),f
	movf	(recive_task@i),w
	fcall	_setChannelStatus
	line	844
;recive.c: 844: }
	goto	l18124
	line	845
	
l18108:	
;recive.c: 845: else if (rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u8411
	goto	u8410
u8411:
	goto	l18124
u8410:
	line	847
	
l18110:	
;recive.c: 846: {
;recive.c: 847: { channel_startup |= (1 << ((i << 1) + 1)); channel_startup &= (~(1 << ((i << 1) + 0))); };
	movlw	(01h)
	movwf	(??_recive_task+0)+0
	setc
	rlf	(recive_task@i),w
	addlw	1
	goto	u8424
u8425:
	clrc
	rlf	(??_recive_task+0)+0,f
u8424:
	addlw	-1
	skipz
	goto	u8425
	movf	0+(??_recive_task+0)+0,w
	iorwf	(_channel_startup),f
	movlw	(01h)
	movwf	(??_recive_task+0)+0
	movf	(recive_task@i),w
	movwf	(??_recive_task+1)+0
	addwf	(??_recive_task+1)+0,w
	addlw	1
	goto	u8434
u8435:
	clrc
	rlf	(??_recive_task+0)+0,f
u8434:
	addlw	-1
	skipz
	goto	u8435
	movf	0+(??_recive_task+0)+0,w
	xorlw	0ffh
	andwf	(_channel_startup),f
	line	849
	
l18112:	
;recive.c: 849: if (i == 0)
	movf	(recive_task@i),f
	skipz
	goto	u8441
	goto	u8440
u8441:
	goto	l18116
u8440:
	line	851
	
l18114:	
;recive.c: 850: {
;recive.c: 851: setChannelStatus(0, KEY0.channel_status);
	movf	(_KEY0),w
	movwf	(?_setChannelStatus)
	movlw	(0)
	fcall	_setChannelStatus
	line	852
;recive.c: 852: }
	goto	l18124
	line	853
	
l18116:	
;recive.c: 853: else if (i == 1)
	decf	(recive_task@i),w
	skipz
	goto	u8451
	goto	u8450
u8451:
	goto	l18120
u8450:
	line	855
	
l18118:	
;recive.c: 854: {
;recive.c: 855: setChannelStatus(1, KEY1.channel_status);
	movf	(_KEY1),w
	movwf	(?_setChannelStatus)
	movlw	(01h)
	fcall	_setChannelStatus
	line	856
;recive.c: 856: }
	goto	l18124
	line	857
	
l18120:	
;recive.c: 857: else if (i == 2)
	movf	(recive_task@i),w
	xorlw	02h
	skipz
	goto	u8461
	goto	u8460
u8461:
	goto	l10104
u8460:
	line	859
	
l18122:	
;recive.c: 858: {
;recive.c: 859: setChannelStatus(2, KEY2.channel_status);
	movf	(_KEY2),w
	movwf	(?_setChannelStatus)
	movlw	(02h)
	fcall	_setChannelStatus
	goto	l18124
	line	861
	
l10104:	
	line	831
	
l18124:	
	incf	(recive_task@i),f
	goto	l18090
	line	865
	
l18128:	
;recive.c: 860: }
;recive.c: 861: }
;recive.c: 862: }
;recive.c: 863: }
;recive.c: 865: AT24C02_Write_Msg(112, &channel_startup, 1);
	movlw	(_channel_startup)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(070h)
	fcall	_AT24C02_Write_Msg
	goto	l17880
	line	873
	
l18132:	
;recive.c: 868: }
;recive.c: 870: }
;recive.c: 873: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	874
	
l18134:	
;recive.c: 874: RF_ClearFIFO();
	fcall	_RF_ClearFIFO
	line	875
	
l18136:	
;recive.c: 875: RF_ClearStatus();
	fcall	_RF_ClearStatus
	goto	l10110
	line	142
	
l18140:	
	movf	(_sys_stute),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 1 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           16    10 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l17770
	xorlw	2^1	; case 2
	skipnz
	goto	l9931
	xorlw	3^2	; case 3
	skipnz
	goto	l9914
	goto	l10110
	opt asmopt_on

	line	881
	
l10110:	
	return
	opt stack 0
GLOBAL	__end_of_recive_task
	__end_of_recive_task:
;; =============== function _recive_task ends ============

	signat	_recive_task,88
	global	_loadParamsFromEeprom
psect	text1243,local,class=CODE,delta=2
global __ptext1243
__ptext1243:

;; *************** function _loadParamsFromEeprom *****************
;; Defined at:
;;		line 98 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  factory_flag    2   14[BANK0 ] unsigned char [2]
;;  i               1   17[BANK0 ] unsigned char 
;;  startup         1   16[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  685[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       4       0
;;      Temps:          0       2       0
;;      Totals:         0       6       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		___bmul
;;		_AT24C02_Read_Msg
;;		_setChannelStatus
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1243
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\main.c"
	line	98
	global	__size_of_loadParamsFromEeprom
	__size_of_loadParamsFromEeprom	equ	__end_of_loadParamsFromEeprom-_loadParamsFromEeprom
	
_loadParamsFromEeprom:	
	opt	stack 0
; Regs used in _loadParamsFromEeprom: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	101
	
l17278:	
;main.c: 99: unsigned char i;
;main.c: 100: unsigned char startup;
;main.c: 101: unsigned char factory_flag[2] = {0, 0};
	clrf	(loadParamsFromEeprom@factory_flag)
	clrf	(loadParamsFromEeprom@factory_flag+1)
	line	103
;main.c: 103: for(i=0; i<12; i++)
	clrf	(loadParamsFromEeprom@i)
	
l17280:	
	movlw	(0Ch)
	subwf	(loadParamsFromEeprom@i),w
	skipc
	goto	u6621
	goto	u6620
u6621:
	goto	l17284
u6620:
	goto	l17290
	line	105
	
l17284:	
;main.c: 104: {
;main.c: 105: AT24C02_Read_Msg(i*6, control_id[i], 6);
	movlw	(06h)
	movwf	(?___bmul)
	movf	(loadParamsFromEeprom@i),w
	fcall	___bmul
	addlw	_control_id&0ffh
	movwf	(?_AT24C02_Read_Msg)
	movlw	(06h)
	movwf	0+(?_AT24C02_Read_Msg)+01h
	movlw	(06h)
	movwf	(?___bmul)
	movf	(loadParamsFromEeprom@i),w
	fcall	___bmul
	fcall	_AT24C02_Read_Msg
	line	103
	
l17286:	
	incf	(loadParamsFromEeprom@i),f
	goto	l17280
	line	108
	
l17290:	
;main.c: 106: }
;main.c: 108: AT24C02_Read_Msg(110, &channel_flag, 1);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Read_Msg)
	clrf	0+(?_AT24C02_Read_Msg)+01h
	incf	0+(?_AT24C02_Read_Msg)+01h,f
	movlw	(06Eh)
	fcall	_AT24C02_Read_Msg
	line	109
;main.c: 109: AT24C02_Read_Msg(111, &channel_status, 1);
	movlw	(_channel_status)&0ffh
	movwf	(?_AT24C02_Read_Msg)
	clrf	0+(?_AT24C02_Read_Msg)+01h
	incf	0+(?_AT24C02_Read_Msg)+01h,f
	movlw	(06Fh)
	fcall	_AT24C02_Read_Msg
	line	110
;main.c: 110: AT24C02_Read_Msg(112, &channel_startup, 1);
	movlw	(_channel_startup)&0ffh
	movwf	(?_AT24C02_Read_Msg)
	clrf	0+(?_AT24C02_Read_Msg)+01h
	incf	0+(?_AT24C02_Read_Msg)+01h,f
	movlw	(070h)
	fcall	_AT24C02_Read_Msg
	line	111
;main.c: 111: AT24C02_Read_Msg(113, factory_flag, 2);
	movlw	(loadParamsFromEeprom@factory_flag)&0ffh
	movwf	(?_AT24C02_Read_Msg)
	movlw	(02h)
	movwf	0+(?_AT24C02_Read_Msg)+01h
	movlw	(071h)
	fcall	_AT24C02_Read_Msg
	line	113
	
l17292:	
;main.c: 113: if (0x5E == factory_flag[0] && 0xF6 == factory_flag[1])
	movf	(loadParamsFromEeprom@factory_flag),w
	xorlw	05Eh
	skipz
	goto	u6631
	goto	u6630
u6631:
	goto	l690
u6630:
	
l17294:	
	movf	0+(loadParamsFromEeprom@factory_flag)+01h,w
	xorlw	0F6h
	skipz
	goto	u6641
	goto	u6640
u6641:
	goto	l690
u6640:
	line	115
	
l17296:	
;main.c: 114: {
;main.c: 115: is_factory_flag = 0;
	clrf	(_is_factory_flag)
	line	116
;main.c: 116: }
	goto	l17298
	line	117
	
l690:	
	line	119
;main.c: 117: else
;main.c: 118: {
;main.c: 119: is_factory_flag = 1;
	clrf	(_is_factory_flag)
	incf	(_is_factory_flag),f
	line	129
	
l17298:	
;main.c: 120: }
;main.c: 129: for(i = 0; i < (3); i++)
	clrf	(loadParamsFromEeprom@i)
	
l17300:	
	movlw	(03h)
	subwf	(loadParamsFromEeprom@i),w
	skipc
	goto	u6651
	goto	u6650
u6651:
	goto	l17304
u6650:
	goto	l702
	line	131
	
l17304:	
;main.c: 130: {
;main.c: 131: startup = ((channel_startup >> (i << 1)) & 0x03);
	movf	(_channel_startup),w
	movwf	(??_loadParamsFromEeprom+0)+0
	movf	(loadParamsFromEeprom@i),w
	movwf	(??_loadParamsFromEeprom+1)+0
	addwf	(??_loadParamsFromEeprom+1)+0,w
	addlw	1
	goto	u6664
u6665:
	clrc
	rrf	(??_loadParamsFromEeprom+0)+0,f
u6664:
	addlw	-1
	skipz
	goto	u6665
	movf	0+(??_loadParamsFromEeprom+0)+0,w
	movwf	(loadParamsFromEeprom@startup)
	movlw	(03h)
	andwf	(loadParamsFromEeprom@startup),f
	line	132
	
l17306:	
;main.c: 132: if (1 == startup)
	decf	(loadParamsFromEeprom@startup),w
	skipz
	goto	u6671
	goto	u6670
u6671:
	goto	l17310
u6670:
	line	134
	
l17308:	
;main.c: 133: {
;main.c: 134: setChannelStatus(i, 0);
	clrf	(?_setChannelStatus)
	movf	(loadParamsFromEeprom@i),w
	fcall	_setChannelStatus
	line	135
;main.c: 135: }
	goto	l17324
	line	136
	
l17310:	
;main.c: 136: else if (2 == startup)
	movf	(loadParamsFromEeprom@startup),w
	xorlw	02h
	skipz
	goto	u6681
	goto	u6680
u6681:
	goto	l17318
u6680:
	line	138
	
l17312:	
;main.c: 137: {
;main.c: 138: if (0 == ((channel_status >> i) & 0x01))
	movf	(_channel_status),w
	movwf	(??_loadParamsFromEeprom+0)+0
	incf	(loadParamsFromEeprom@i),w
	goto	u6694
u6695:
	clrc
	rrf	(??_loadParamsFromEeprom+0)+0,f
u6694:
	addlw	-1
	skipz
	goto	u6695
	btfsc	0+(??_loadParamsFromEeprom+0)+0,(0)&7
	goto	u6701
	goto	u6700
u6701:
	goto	l17316
u6700:
	line	140
	
l17314:	
;main.c: 139: {
;main.c: 140: setChannelStatus(i, 0);
	clrf	(?_setChannelStatus)
	movf	(loadParamsFromEeprom@i),w
	fcall	_setChannelStatus
	line	141
;main.c: 141: }
	goto	l17324
	line	144
	
l17316:	
;main.c: 142: else
;main.c: 143: {
;main.c: 144: setChannelStatus(i, 1);
	clrf	(?_setChannelStatus)
	incf	(?_setChannelStatus),f
	movf	(loadParamsFromEeprom@i),w
	fcall	_setChannelStatus
	goto	l17324
	line	147
	
l17318:	
;main.c: 147: else if (0 == startup)
	movf	(loadParamsFromEeprom@startup),f
	skipz
	goto	u6711
	goto	u6710
u6711:
	goto	l17322
u6710:
	line	149
	
l17320:	
;main.c: 148: {
;main.c: 149: setChannelStatus(i, 1);
	clrf	(?_setChannelStatus)
	incf	(?_setChannelStatus),f
	movf	(loadParamsFromEeprom@i),w
	fcall	_setChannelStatus
	line	150
;main.c: 150: }
	goto	l17324
	line	156
	
l17322:	
;main.c: 154: else
;main.c: 155: {
;main.c: 156: setChannelStatus(i, 1);
	clrf	(?_setChannelStatus)
	incf	(?_setChannelStatus),f
	movf	(loadParamsFromEeprom@i),w
	fcall	_setChannelStatus
	line	129
	
l17324:	
	incf	(loadParamsFromEeprom@i),f
	goto	l17300
	line	166
	
l702:	
	return
	opt stack 0
GLOBAL	__end_of_loadParamsFromEeprom
	__end_of_loadParamsFromEeprom:
;; =============== function _loadParamsFromEeprom ends ============

	signat	_loadParamsFromEeprom,90
	global	_loadPowerOnEeprom
psect	text1244,local,class=CODE,delta=2
global __ptext1244
__ptext1244:

;; *************** function _loadPowerOnEeprom *****************
;; Defined at:
;;		line 77 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 7F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_AT24C02_Read_Msg
;;		_AT24C02_Write_Msg
;;		_soft_delay_ms
;;		_sledBlink
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1244
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\main.c"
	line	77
	global	__size_of_loadPowerOnEeprom
	__size_of_loadPowerOnEeprom	equ	__end_of_loadPowerOnEeprom-_loadPowerOnEeprom
	
_loadPowerOnEeprom:	
	opt	stack 0
; Regs used in _loadPowerOnEeprom: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	78
	
l17254:	
;main.c: 78: power_on_delay_flag = 1;
	clrf	(_power_on_delay_flag)
	incf	(_power_on_delay_flag),f
	line	79
	
l17256:	
;main.c: 79: AT24C02_Read_Msg(115, &power_on_flag, 1);
	movlw	(_power_on_flag)&0ffh
	movwf	(?_AT24C02_Read_Msg)
	clrf	0+(?_AT24C02_Read_Msg)+01h
	incf	0+(?_AT24C02_Read_Msg)+01h,f
	movlw	(073h)
	fcall	_AT24C02_Read_Msg
	line	80
	
l17258:	
;main.c: 80: if(power_on_flag > 3)
	movlw	(04h)
	subwf	(_power_on_flag),w
	skipc
	goto	u6601
	goto	u6600
u6601:
	goto	l17262
u6600:
	line	82
	
l17260:	
;main.c: 81: {
;main.c: 82: power_on_flag = 0;
	clrf	(_power_on_flag)
	line	84
	
l17262:	
;main.c: 83: }
;main.c: 84: power_on_flag++;
	incf	(_power_on_flag),f
	line	85
	
l17264:	
;main.c: 85: AT24C02_Write_Msg(115, &power_on_flag, 1);
	movlw	(_power_on_flag)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(073h)
	fcall	_AT24C02_Write_Msg
	line	86
	
l17266:	
;main.c: 86: if(power_on_flag == 3)
	movf	(_power_on_flag),w
	xorlw	03h
	skipz
	goto	u6611
	goto	u6610
u6611:
	goto	l683
u6610:
	line	88
	
l17268:	
;main.c: 87: {
;main.c: 88: power_on_flag = 0;
	clrf	(_power_on_flag)
	line	89
	
l17270:	
;main.c: 89: AT24C02_Write_Msg(115, &power_on_flag, 1);
	movlw	(_power_on_flag)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(073h)
	fcall	_AT24C02_Write_Msg
	line	90
	
l17272:	
;main.c: 90: sys_stute = 2;
	movlw	(02h)
	movwf	(_sys_stute)
	line	91
	
l17274:	
;main.c: 91: soft_delay_ms(200);
	movlw	0C8h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	92
	
l17276:	
;main.c: 92: sledBlink();
	fcall	_sledBlink
	line	95
	
l683:	
	return
	opt stack 0
GLOBAL	__end_of_loadPowerOnEeprom
	__end_of_loadPowerOnEeprom:
;; =============== function _loadPowerOnEeprom ends ============

	signat	_loadPowerOnEeprom,88
	global	_rx_data
psect	text1245,local,class=CODE,delta=2
global __ptext1245
__ptext1245:

;; *************** function _rx_data *****************
;; Defined at:
;;		line 92 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\recive.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  crc16           2   11[BANK0 ] unsigned int 
;;  i               1   15[BANK0 ] unsigned char 
;;  rx_flag         1   14[BANK0 ] unsigned char 
;;  rand            1   13[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       5       0
;;      Temps:          0       3       0
;;      Totals:         0       8       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_RF_RxData
;;		_UpdateCRC
;; This function is called by:
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1245
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\recive.c"
	line	92
	global	__size_of_rx_data
	__size_of_rx_data	equ	__end_of_rx_data-_rx_data
	
_rx_data:	
;; using string table level
	opt	stack 1
; Regs used in _rx_data: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	93
	
l17188:	
;recive.c: 93: unsigned char rx_flag = 0;
	clrf	(rx_data@rx_flag)
	line	95
;recive.c: 95: unsigned char i = 0;
	clrf	(rx_data@i)
	line	96
;recive.c: 96: unsigned int crc16 = 0;
	clrf	(rx_data@crc16)
	clrf	(rx_data@crc16+1)
	line	98
	
l17190:	
;recive.c: 98: if(RF_RxData(rf_buf,18))
	movlw	(012h)
	movwf	(?_RF_RxData)
	movlw	(_rf_buf)&0ffh
	fcall	_RF_RxData
	xorlw	0
	skipnz
	goto	u6471
	goto	u6470
u6471:
	goto	l17250
u6470:
	line	100
	
l17192:	
;recive.c: 99: {
;recive.c: 100: for(i = 0; i < 18; i++)
	clrf	(rx_data@i)
	line	102
	
l17198:	
;recive.c: 101: {
;recive.c: 102: rf_buf[i] = rf_buf[i] ^ crc_2_4G_lib[3+i] ^ ble_crc_38[21+i];
	movf	(rx_data@i),w
	addlw	low((_ble_crc_38-__stringbase)+015h)
	movwf	fsr0
	fcall	stringdir
	movwf	(??_rx_data+0)+0
	movf	(rx_data@i),w
	addlw	low((_crc_2_4G_lib-__stringbase)+03h)
	movwf	fsr0
	fcall	stringdir
	movwf	(??_rx_data+1)+0
	movf	(rx_data@i),w
	addlw	_rf_buf&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorwf	(??_rx_data+1)+0,w
	xorwf	(??_rx_data+0)+0,w
	movwf	(??_rx_data+2)+0
	movf	(rx_data@i),w
	addlw	_rf_buf&0ffh
	movwf	fsr0
	movf	(??_rx_data+2)+0,w
	movwf	indf
	line	100
	
l17200:	
	incf	(rx_data@i),f
	
l17202:	
	movlw	(012h)
	subwf	(rx_data@i),w
	skipc
	goto	u6481
	goto	u6480
u6481:
	goto	l17198
u6480:
	line	104
	
l17204:	
;recive.c: 103: }
;recive.c: 104: crc16 = rf_buf[16] + rf_buf[17] * 256;
	movf	0+(_rf_buf)+011h,w
	movwf	(??_rx_data+0)+0
	clrf	(??_rx_data+0)+0+1
	movf	(??_rx_data+0)+0,w
	movwf	(??_rx_data+0)+1
	clrf	(??_rx_data+0)+0
	movf	0+(_rf_buf)+010h,w
	addwf	0+(??_rx_data+0)+0,w
	movwf	(rx_data@crc16)
	movf	1+(??_rx_data+0)+0,w
	skipnc
	incf	1+(??_rx_data+0)+0,w
	movwf	((rx_data@crc16))+1
	line	105
	
l17206:	
;recive.c: 105: for(i = 0; i < 16; i++)
	clrf	(rx_data@i)
	line	107
	
l17212:	
;recive.c: 106: {
;recive.c: 107: rf_buf[i] = rf_buf[i] ^ crc_lab[i];
	movf	(rx_data@i),w
	addlw	low((_crc_lab-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_rx_data+0)+0
	movf	(rx_data@i),w
	addlw	_rf_buf&0ffh
	movwf	fsr0
	movf	indf,w
	xorwf	(??_rx_data+0)+0,w
	movwf	(??_rx_data+1)+0
	movf	(rx_data@i),w
	addlw	_rf_buf&0ffh
	movwf	fsr0
	movf	(??_rx_data+1)+0,w
	movwf	indf
	line	105
	
l17214:	
	incf	(rx_data@i),f
	
l17216:	
	movlw	(010h)
	subwf	(rx_data@i),w
	skipc
	goto	u6491
	goto	u6490
u6491:
	goto	l17212
u6490:
	line	109
	
l17218:	
;recive.c: 108: }
;recive.c: 109: rand = rf_buf[15];
	movf	0+(_rf_buf)+0Fh,w
	movwf	(rx_data@rand)
	line	110
;recive.c: 110: for(i = 7; i < 15; i++)
	movlw	(07h)
	movwf	(rx_data@i)
	line	112
	
l17222:	
;recive.c: 111: {
;recive.c: 112: rf_buf[i] ^= rand;
	movf	(rx_data@i),w
	addlw	_rf_buf&0ffh
	movwf	fsr0
	movf	(rx_data@rand),w
	xorwf	indf,f
	line	110
	
l17224:	
	incf	(rx_data@i),f
	
l17226:	
	movlw	(0Fh)
	subwf	(rx_data@i),w
	skipc
	goto	u6501
	goto	u6500
u6501:
	goto	l17222
u6500:
	line	114
	
l17228:	
;recive.c: 113: }
;recive.c: 114: if(crc16 == UpdateCRC(rf_buf,16) )
	movlw	010h
	movwf	(?_UpdateCRC)
	clrf	(?_UpdateCRC+1)
	movlw	(_rf_buf)&0ffh
	fcall	_UpdateCRC
	movf	(rx_data@crc16+1),w
	xorwf	(1+(?_UpdateCRC)),w
	skipz
	goto	u6515
	movf	(rx_data@crc16),w
	xorwf	(0+(?_UpdateCRC)),w
u6515:

	skipz
	goto	u6511
	goto	u6510
u6511:
	goto	l17250
u6510:
	line	116
	
l17230:	
;recive.c: 115: {
;recive.c: 116: if((rf_buf[3] == 0) && (rf_buf[4] == 0) && (rf_buf[5] == 0) && (rf_buf[6] == 0))
	movf	0+(_rf_buf)+03h,f
	skipz
	goto	u6521
	goto	u6520
u6521:
	goto	l17240
u6520:
	
l17232:	
	movf	0+(_rf_buf)+04h,f
	skipz
	goto	u6531
	goto	u6530
u6531:
	goto	l17240
u6530:
	
l17234:	
	movf	0+(_rf_buf)+05h,f
	skipz
	goto	u6541
	goto	u6540
u6541:
	goto	l17240
u6540:
	
l17236:	
	movf	0+(_rf_buf)+06h,f
	skipz
	goto	u6551
	goto	u6550
u6551:
	goto	l17240
u6550:
	line	118
	
l17238:	
;recive.c: 117: {
;recive.c: 118: rx_flag=0;
	clrf	(rx_data@rx_flag)
	line	119
;recive.c: 119: }
	goto	l17250
	line	120
	
l17240:	
;recive.c: 120: else if((rf_buf[3] == 0xff) && (rf_buf[4] == 0xff) && (rf_buf[5] == 0xff) && (rf_buf[6] == 0xff))
	movf	0+(_rf_buf)+03h,w
	xorlw	0FFh
	skipz
	goto	u6561
	goto	u6560
u6561:
	goto	l9908
u6560:
	
l17242:	
	movf	0+(_rf_buf)+04h,w
	xorlw	0FFh
	skipz
	goto	u6571
	goto	u6570
u6571:
	goto	l9908
u6570:
	
l17244:	
	movf	0+(_rf_buf)+05h,w
	xorlw	0FFh
	skipz
	goto	u6581
	goto	u6580
u6581:
	goto	l9908
u6580:
	
l17246:	
	movf	0+(_rf_buf)+06h,w
	xorlw	0FFh
	skipz
	goto	u6591
	goto	u6590
u6591:
	goto	l9908
u6590:
	goto	l17238
	line	124
	
l9908:	
	line	125
;recive.c: 124: else
;recive.c: 125: rx_flag = 1;
	clrf	(rx_data@rx_flag)
	incf	(rx_data@rx_flag),f
	line	129
	
l17250:	
;recive.c: 126: }
;recive.c: 128: }
;recive.c: 129: return rx_flag;
	movf	(rx_data@rx_flag),w
	line	130
	
l9910:	
	return
	opt stack 0
GLOBAL	__end_of_rx_data
	__end_of_rx_data:
;; =============== function _rx_data ends ============

	signat	_rx_data,89
	global	_setChannelStatus
psect	text1246,local,class=CODE,delta=2
global __ptext1246
__ptext1246:

;; *************** function _setChannelStatus *****************
;; Defined at:
;;		line 39 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\key_scan.c"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;;  status          1    9[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1   11[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       1       0
;;      Locals:         0       1       0
;;      Temps:          0       1       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_AT24C02_Write_Msg
;; This function is called by:
;;		_loadParamsFromEeprom
;;		_key_value_read
;;		_recive_task
;;		_delay_task
;; This function uses a non-reentrant model
;;
psect	text1246
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\key_scan.c"
	line	39
	global	__size_of_setChannelStatus
	__size_of_setChannelStatus	equ	__end_of_setChannelStatus-_setChannelStatus
	
_setChannelStatus:	
	opt	stack 0
; Regs used in _setChannelStatus: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;setChannelStatus@channel stored from wreg
	movwf	(setChannelStatus@channel)
	line	40
	
l17126:	
;key_scan.c: 40: if (channel == 0)
	movf	(setChannelStatus@channel),f
	skipz
	goto	u6291
	goto	u6290
u6291:
	goto	l17148
u6290:
	line	42
	
l17128:	
;key_scan.c: 41: {
;key_scan.c: 42: if (status == 0)
	movf	(setChannelStatus@status),f
	skipz
	goto	u6301
	goto	u6300
u6301:
	goto	l17132
u6300:
	line	44
	
l17130:	
;key_scan.c: 43: {
;key_scan.c: 44: KEY0.channel_status = 0;
	clrf	(_KEY0)
	line	45
;key_scan.c: 45: }
	goto	l17140
	line	46
	
l17132:	
;key_scan.c: 46: else if (status == 1)
	decf	(setChannelStatus@status),w
	skipz
	goto	u6311
	goto	u6310
u6311:
	goto	l17136
u6310:
	line	48
	
l17134:	
;key_scan.c: 47: {
;key_scan.c: 48: KEY0.channel_status = 1;
	clrf	(_KEY0)
	incf	(_KEY0),f
	line	49
;key_scan.c: 49: }
	goto	l17140
	line	50
	
l17136:	
;key_scan.c: 50: else if (status == 2)
	movf	(setChannelStatus@status),w
	xorlw	02h
	skipz
	goto	u6321
	goto	u6320
u6321:
	goto	l17140
u6320:
	line	52
	
l17138:	
;key_scan.c: 51: {
;key_scan.c: 52: KEY0.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY0),f
	line	55
	
l17140:	
;key_scan.c: 53: }
;key_scan.c: 55: if (2 == ((channel_startup >> (0 << 1)) & 0x03))
	movf	(_channel_startup),w
	andlw	03h
	xorlw	02h
	skipz
	goto	u6331
	goto	u6330
u6331:
	goto	l7219
u6330:
	line	57
	
l17142:	
;key_scan.c: 56: {
;key_scan.c: 57: if (KEY0.channel_status == 0)
	movf	(_KEY0),f
	skipz
	goto	u6341
	goto	u6340
u6341:
	goto	l7197
u6340:
	line	59
	
l17144:	
;key_scan.c: 58: {
;key_scan.c: 59: (channel_status &= (~(1 << 0)));
	bcf	(_channel_status)+(0/8),(0)&7
	line	60
;key_scan.c: 60: }
	goto	l17146
	line	61
	
l7197:	
	line	63
;key_scan.c: 61: else
;key_scan.c: 62: {
;key_scan.c: 63: (channel_status |= (1 << 0));
	bsf	(_channel_status)+(0/8),(0)&7
	line	65
	
l17146:	
;key_scan.c: 64: }
;key_scan.c: 65: AT24C02_Write_Msg(111, &channel_status, 1);
	movlw	(_channel_status)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(06Fh)
	fcall	_AT24C02_Write_Msg
	goto	l7219
	line	68
	
l17148:	
;key_scan.c: 68: else if (channel == 1)
	decf	(setChannelStatus@channel),w
	skipz
	goto	u6351
	goto	u6350
u6351:
	goto	l17168
u6350:
	line	70
	
l17150:	
;key_scan.c: 69: {
;key_scan.c: 70: if (status == 0)
	movf	(setChannelStatus@status),f
	skipz
	goto	u6361
	goto	u6360
u6361:
	goto	l17154
u6360:
	line	72
	
l17152:	
;key_scan.c: 71: {
;key_scan.c: 72: KEY1.channel_status = 0;
	clrf	(_KEY1)
	line	73
;key_scan.c: 73: }
	goto	l7202
	line	74
	
l17154:	
;key_scan.c: 74: else if (status == 1)
	decf	(setChannelStatus@status),w
	skipz
	goto	u6371
	goto	u6370
u6371:
	goto	l17158
u6370:
	line	76
	
l17156:	
;key_scan.c: 75: {
;key_scan.c: 76: KEY1.channel_status = 1;
	clrf	(_KEY1)
	incf	(_KEY1),f
	line	77
;key_scan.c: 77: }
	goto	l7202
	line	78
	
l17158:	
;key_scan.c: 78: else if (status == 2)
	movf	(setChannelStatus@status),w
	xorlw	02h
	skipz
	goto	u6381
	goto	u6380
u6381:
	goto	l7202
u6380:
	line	80
	
l17160:	
;key_scan.c: 79: {
;key_scan.c: 80: KEY1.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY1),f
	line	83
	
l7202:	
;key_scan.c: 81: }
;key_scan.c: 83: if (2 == ((channel_startup >> (1 << 1)) & 0x03))
	movf	(_channel_startup),w
	movwf	(??_setChannelStatus+0)+0
	clrc
	rrf	(??_setChannelStatus+0)+0,f
	clrc
	rrf	(??_setChannelStatus+0)+0,f
	movf	0+(??_setChannelStatus+0)+0,w
	andlw	03h
	xorlw	02h
	skipz
	goto	u6391
	goto	u6390
u6391:
	goto	l7219
u6390:
	line	85
	
l17162:	
;key_scan.c: 84: {
;key_scan.c: 85: if (KEY1.channel_status == 0)
	movf	(_KEY1),f
	skipz
	goto	u6401
	goto	u6400
u6401:
	goto	l7207
u6400:
	line	87
	
l17164:	
;key_scan.c: 86: {
;key_scan.c: 87: (channel_status &= (~(1 << 1)));
	bcf	(_channel_status)+(1/8),(1)&7
	line	88
;key_scan.c: 88: }
	goto	l17166
	line	89
	
l7207:	
	line	91
;key_scan.c: 89: else
;key_scan.c: 90: {
;key_scan.c: 91: (channel_status |= (1 << 1));
	bsf	(_channel_status)+(1/8),(1)&7
	line	93
	
l17166:	
;key_scan.c: 92: }
;key_scan.c: 93: AT24C02_Write_Msg(111, &channel_status, 1);
	movlw	(_channel_status)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(06Fh)
	fcall	_AT24C02_Write_Msg
	goto	l7219
	line	96
	
l17168:	
;key_scan.c: 96: else if (channel == 2)
	movf	(setChannelStatus@channel),w
	xorlw	02h
	skipz
	goto	u6411
	goto	u6410
u6411:
	goto	l7219
u6410:
	line	98
	
l17170:	
;key_scan.c: 97: {
;key_scan.c: 98: if (status == 0)
	movf	(setChannelStatus@status),f
	skipz
	goto	u6421
	goto	u6420
u6421:
	goto	l17174
u6420:
	line	100
	
l17172:	
;key_scan.c: 99: {
;key_scan.c: 100: KEY2.channel_status = 0;
	clrf	(_KEY2)
	line	101
;key_scan.c: 101: }
	goto	l7212
	line	102
	
l17174:	
;key_scan.c: 102: else if (status == 1)
	decf	(setChannelStatus@status),w
	skipz
	goto	u6431
	goto	u6430
u6431:
	goto	l17178
u6430:
	line	104
	
l17176:	
;key_scan.c: 103: {
;key_scan.c: 104: KEY2.channel_status = 1;
	clrf	(_KEY2)
	incf	(_KEY2),f
	line	105
;key_scan.c: 105: }
	goto	l7212
	line	106
	
l17178:	
;key_scan.c: 106: else if (status == 2)
	movf	(setChannelStatus@status),w
	xorlw	02h
	skipz
	goto	u6441
	goto	u6440
u6441:
	goto	l7212
u6440:
	line	108
	
l17180:	
;key_scan.c: 107: {
;key_scan.c: 108: KEY2.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY2),f
	line	111
	
l7212:	
;key_scan.c: 109: }
;key_scan.c: 111: if (2 == ((channel_startup >> (2 << 1)) & 0x03))
	swapf	(_channel_startup),w
	andlw	(0ffh shr 4) & 0ffh
	andlw	03h
	xorlw	02h
	skipz
	goto	u6451
	goto	u6450
u6451:
	goto	l7219
u6450:
	line	113
	
l17182:	
;key_scan.c: 112: {
;key_scan.c: 113: if (KEY2.channel_status == 0)
	movf	(_KEY2),f
	skipz
	goto	u6461
	goto	u6460
u6461:
	goto	l7217
u6460:
	line	115
	
l17184:	
;key_scan.c: 114: {
;key_scan.c: 115: (channel_status &= (~(1 << 2)));
	bcf	(_channel_status)+(2/8),(2)&7
	line	116
;key_scan.c: 116: }
	goto	l17186
	line	117
	
l7217:	
	line	119
;key_scan.c: 117: else
;key_scan.c: 118: {
;key_scan.c: 119: (channel_status |= (1 << 2));
	bsf	(_channel_status)+(2/8),(2)&7
	line	121
	
l17186:	
;key_scan.c: 120: }
;key_scan.c: 121: AT24C02_Write_Msg(111, &channel_status, 1);
	movlw	(_channel_status)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(06Fh)
	fcall	_AT24C02_Write_Msg
	line	124
	
l7219:	
	return
	opt stack 0
GLOBAL	__end_of_setChannelStatus
	__end_of_setChannelStatus:
;; =============== function _setChannelStatus ends ============

	signat	_setChannelStatus,8312
	global	_AT24C02_Read_Msg
psect	text1247,local,class=CODE,delta=2
global __ptext1247
__ptext1247:

;; *************** function _AT24C02_Read_Msg *****************
;; Defined at:
;;		line 53 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\e2prom.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;;  data            1    6[BANK0 ] PTR unsigned char 
;;		 -> channel_startup(1), channel_status(1), channel_flag(1), control_id(72), 
;;		 -> loadParamsFromEeprom@factory_flag(2), power_on_flag(1), 
;;  len             1    7[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1    9[BANK0 ] unsigned char 
;;  i               1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       2       0
;;      Temps:          0       1       0
;;      Totals:         0       5       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_AT24C02_Read_Byte
;;		_soft_delay_ms
;; This function is called by:
;;		_loadPowerOnEeprom
;;		_loadParamsFromEeprom
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1247
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\e2prom.c"
	line	53
	global	__size_of_AT24C02_Read_Msg
	__size_of_AT24C02_Read_Msg	equ	__end_of_AT24C02_Read_Msg-_AT24C02_Read_Msg
	
_AT24C02_Read_Msg:	
	opt	stack 0
; Regs used in _AT24C02_Read_Msg: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;AT24C02_Read_Msg@addr stored from wreg
	movwf	(AT24C02_Read_Msg@addr)
	line	54
	
l17114:	
;e2prom.c: 54: unsigned char i=0;
	clrf	(AT24C02_Read_Msg@i)
	line	55
;e2prom.c: 55: for(i=0;i<len;i++)
	clrf	(AT24C02_Read_Msg@i)
	goto	l17124
	line	57
	
l17116:	
;e2prom.c: 56: {
;e2prom.c: 57: data[i]=AT24C02_Read_Byte(addr);
	movf	(AT24C02_Read_Msg@i),w
	addwf	(AT24C02_Read_Msg@data),w
	movwf	(??_AT24C02_Read_Msg+0)+0
	movf	0+(??_AT24C02_Read_Msg+0)+0,w
	movwf	fsr0
	movf	(AT24C02_Read_Msg@addr),w
	fcall	_AT24C02_Read_Byte
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	58
	
l17118:	
;e2prom.c: 58: addr++;
	incf	(AT24C02_Read_Msg@addr),f
	line	59
	
l17120:	
;e2prom.c: 59: soft_delay_ms(1);
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	55
	
l17122:	
	incf	(AT24C02_Read_Msg@i),f
	
l17124:	
	movf	(AT24C02_Read_Msg@len),w
	subwf	(AT24C02_Read_Msg@i),w
	skipc
	goto	u6281
	goto	u6280
u6281:
	goto	l17116
u6280:
	line	61
	
l11449:	
	return
	opt stack 0
GLOBAL	__end_of_AT24C02_Read_Msg
	__end_of_AT24C02_Read_Msg:
;; =============== function _AT24C02_Read_Msg ends ============

	signat	_AT24C02_Read_Msg,12408
	global	_AT24C02_Read_Byte
psect	text1248,local,class=CODE,delta=2
global __ptext1248
__ptext1248:

;; *************** function _AT24C02_Read_Byte *****************
;; Defined at:
;;		line 21 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\e2prom.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1    4[BANK0 ] unsigned char 
;;  temp            1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_IIC_START
;;		_I2C_SendByte
;;		_IIC_Wait_ACK
;;		_I2C_ReadByte
;;		_IIC_STOP
;; This function is called by:
;;		_AT24C02_Read_Msg
;; This function uses a non-reentrant model
;;
psect	text1248
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\e2prom.c"
	line	21
	global	__size_of_AT24C02_Read_Byte
	__size_of_AT24C02_Read_Byte	equ	__end_of_AT24C02_Read_Byte-_AT24C02_Read_Byte
	
_AT24C02_Read_Byte:	
	opt	stack 0
; Regs used in _AT24C02_Read_Byte: [wreg+status,2+status,0+pclath+cstack]
;AT24C02_Read_Byte@addr stored from wreg
	movwf	(AT24C02_Read_Byte@addr)
	line	22
	
l15480:	
	line	23
	
l15482:	
;e2prom.c: 23: IIC_START();
	fcall	_IIC_START
	line	25
	
l15484:	
;e2prom.c: 25: I2C_SendByte(0XA0);
	movlw	(0A0h)
	fcall	_I2C_SendByte
	line	26
	
l15486:	
;e2prom.c: 26: IIC_Wait_ACK();
	fcall	_IIC_Wait_ACK
	line	27
	
l15488:	
;e2prom.c: 27: I2C_SendByte(addr);
	movf	(AT24C02_Read_Byte@addr),w
	fcall	_I2C_SendByte
	line	28
	
l15490:	
;e2prom.c: 28: IIC_Wait_ACK();
	fcall	_IIC_Wait_ACK
	line	31
	
l15492:	
;e2prom.c: 31: IIC_START();
	fcall	_IIC_START
	line	32
	
l15494:	
;e2prom.c: 32: I2C_SendByte(0XA1);
	movlw	(0A1h)
	fcall	_I2C_SendByte
	line	33
	
l15496:	
;e2prom.c: 33: IIC_Wait_ACK();
	fcall	_IIC_Wait_ACK
	line	34
	
l15498:	
;e2prom.c: 34: temp = I2C_ReadByte(1);
	movlw	(01h)
	fcall	_I2C_ReadByte
	movf	(0+(?_I2C_ReadByte)),w
	movwf	(AT24C02_Read_Byte@temp)
	line	35
	
l15500:	
;e2prom.c: 35: IIC_STOP();
	fcall	_IIC_STOP
	line	37
	
l15502:	
;e2prom.c: 37: return temp;
	movf	(AT24C02_Read_Byte@temp),w
	line	38
	
l11437:	
	return
	opt stack 0
GLOBAL	__end_of_AT24C02_Read_Byte
	__end_of_AT24C02_Read_Byte:
;; =============== function _AT24C02_Read_Byte ends ============

	signat	_AT24C02_Read_Byte,4217
	global	_RF_RxData
psect	text1249,local,class=CODE,delta=2
global __ptext1249
__ptext1249:

;; *************** function _RF_RxData *****************
;; Defined at:
;;		line 134 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;  payload_buff    1    wreg     PTR unsigned char 
;;		 -> rf_buf(18), 
;;  length          1    4[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  payload_buff    1    6[BANK0 ] PTR unsigned char 
;;		 -> rf_buf(18), 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       1       0
;;      Locals:         0       1       0
;;      Temps:          0       1       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_RF_GetStatus
;;		_RF_Read_Buff
;;		_RF_ClearFIFO
;;		_RF_ClearStatus
;; This function is called by:
;;		_rx_data
;; This function uses a non-reentrant model
;;
psect	text1249
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	134
	global	__size_of_RF_RxData
	__size_of_RF_RxData	equ	__end_of_RF_RxData-_RF_RxData
	
_RF_RxData:	
	opt	stack 0
; Regs used in _RF_RxData: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_RxData@payload_buff stored from wreg
	movwf	(RF_RxData@payload_buff)
	line	135
	
l17098:	
;rf297L.c: 135: if(!(RF_GetStatus() & 0X40))
	fcall	_RF_GetStatus
	movwf	(??_RF_RxData+0)+0
	btfsc	0+(??_RF_RxData+0)+0,(6)&7
	goto	u6271
	goto	u6270
u6271:
	goto	l17104
u6270:
	line	137
	
l17100:	
;rf297L.c: 136: {
;rf297L.c: 137: return 0;
	movlw	(0)
	goto	l5195
	line	139
	
l17104:	
;rf297L.c: 138: }
;rf297L.c: 139: RF_Read_Buff(0x61, payload_buff, length);
	movf	(RF_RxData@payload_buff),w
	movwf	(?_RF_Read_Buff)
	movf	(RF_RxData@length),w
	movwf	0+(?_RF_Read_Buff)+01h
	movlw	(061h)
	fcall	_RF_Read_Buff
	line	141
	
l17106:	
;rf297L.c: 141: RF_ClearFIFO();
	fcall	_RF_ClearFIFO
	line	142
	
l17108:	
;rf297L.c: 142: RF_ClearStatus();
	fcall	_RF_ClearStatus
	line	143
	
l17110:	
;rf297L.c: 143: return 1;
	movlw	(01h)
	line	144
	
l5195:	
	return
	opt stack 0
GLOBAL	__end_of_RF_RxData
	__end_of_RF_RxData:
;; =============== function _RF_RxData ends ============

	signat	_RF_RxData,8313
	global	_AT24C02_Write_Msg
psect	text1250,local,class=CODE,delta=2
global __ptext1250
__ptext1250:

;; *************** function _AT24C02_Write_Msg *****************
;; Defined at:
;;		line 41 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\e2prom.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;;  data            1    4[BANK0 ] PTR unsigned char 
;;		 -> recive_task@msg(6), channel_startup(1), channel_status(1), channel_flag(1), 
;;		 -> control_id(72), power_on_flag(1), 
;;  len             1    5[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1    7[BANK0 ] unsigned char 
;;  i               1    8[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       2       0
;;      Temps:          0       1       0
;;      Totals:         0       5       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_AT24C02_Write_Byte
;;		_soft_delay_ms
;; This function is called by:
;;		_loadPowerOnEeprom
;;		_setChannelStatus
;;		_recive_task
;;		_delay_task
;; This function uses a non-reentrant model
;;
psect	text1250
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\e2prom.c"
	line	41
	global	__size_of_AT24C02_Write_Msg
	__size_of_AT24C02_Write_Msg	equ	__end_of_AT24C02_Write_Msg-_AT24C02_Write_Msg
	
_AT24C02_Write_Msg:	
	opt	stack 0
; Regs used in _AT24C02_Write_Msg: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;AT24C02_Write_Msg@addr stored from wreg
	movwf	(AT24C02_Write_Msg@addr)
	line	42
	
l17086:	
;e2prom.c: 42: unsigned char i=0;
	clrf	(AT24C02_Write_Msg@i)
	line	43
;e2prom.c: 43: for(i=0;i<len;i++)
	clrf	(AT24C02_Write_Msg@i)
	goto	l17096
	line	45
	
l17088:	
;e2prom.c: 44: {
;e2prom.c: 45: AT24C02_Write_Byte(addr,data[i]);
	movf	(AT24C02_Write_Msg@i),w
	addwf	(AT24C02_Write_Msg@data),w
	movwf	(??_AT24C02_Write_Msg+0)+0
	movf	0+(??_AT24C02_Write_Msg+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(?_AT24C02_Write_Byte)
	movf	(AT24C02_Write_Msg@addr),w
	fcall	_AT24C02_Write_Byte
	line	46
	
l17090:	
;e2prom.c: 46: addr++;
	incf	(AT24C02_Write_Msg@addr),f
	line	47
	
l17092:	
;e2prom.c: 47: soft_delay_ms(5);
	movlw	05h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	43
	
l17094:	
	incf	(AT24C02_Write_Msg@i),f
	
l17096:	
	movf	(AT24C02_Write_Msg@len),w
	subwf	(AT24C02_Write_Msg@i),w
	skipc
	goto	u6261
	goto	u6260
u6261:
	goto	l17088
u6260:
	line	49
	
l11443:	
	return
	opt stack 0
GLOBAL	__end_of_AT24C02_Write_Msg
	__end_of_AT24C02_Write_Msg:
;; =============== function _AT24C02_Write_Msg ends ============

	signat	_AT24C02_Write_Msg,12408
	global	_I2C_ReadByte
psect	text1251,local,class=CODE,delta=2
global __ptext1251
__ptext1251:

;; *************** function _I2C_ReadByte *****************
;; Defined at:
;;		line 117 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\iic.c"
;; Parameters:    Size  Location     Type
;;  ack             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ack             1    0[BANK0 ] unsigned char 
;;  data            2    1[BANK0 ] unsigned int 
;;  cnt             1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    4[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         0       4       0
;;      Temps:          0       0       0
;;      Totals:         2       4       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_iic_delay_us
;;		_IIC_NACK
;;		_IIC_ACK
;; This function is called by:
;;		_AT24C02_Read_Byte
;; This function uses a non-reentrant model
;;
psect	text1251
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\iic.c"
	line	117
	global	__size_of_I2C_ReadByte
	__size_of_I2C_ReadByte	equ	__end_of_I2C_ReadByte-_I2C_ReadByte
	
_I2C_ReadByte:	
	opt	stack 0
; Regs used in _I2C_ReadByte: [wreg+status,2+status,0+pclath+cstack]
;I2C_ReadByte@ack stored from wreg
	line	120
	movwf	(I2C_ReadByte@ack)
	
l15418:	
;iic.c: 118: unsigned char cnt;
;iic.c: 119: unsigned int data;
;iic.c: 120: {TRISC1=1,WPUC1=1;};
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1081/8)^080h,(1081)&7
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3193/8)^0180h,(3193)&7
	line	122
	
l15420:	
;iic.c: 122: for(cnt=0; cnt<8; cnt++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(I2C_ReadByte@cnt)
	line	123
	
l10794:	
	line	124
;iic.c: 123: {
;iic.c: 124: RC2=0;
	bcf	(58/8),(58)&7
	line	125
	
l15426:	
;iic.c: 125: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	127
	
l15428:	
;iic.c: 127: RC2=1;
	bsf	(58/8),(58)&7
	line	128
	
l15430:	
;iic.c: 128: data <<= 1;
	clrc
	rlf	(I2C_ReadByte@data),f
	rlf	(I2C_ReadByte@data+1),f
	line	129
	
l15432:	
;iic.c: 129: if(RC1)
	btfss	(57/8),(57)&7
	goto	u3531
	goto	u3530
u3531:
	goto	l15436
u3530:
	line	131
	
l15434:	
;iic.c: 130: {
;iic.c: 131: data |= 0x01;
	bsf	(I2C_ReadByte@data)+(0/8),(0)&7
	line	133
	
l15436:	
;iic.c: 132: }
;iic.c: 133: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	122
	
l15438:	
	incf	(I2C_ReadByte@cnt),f
	
l15440:	
	movlw	(08h)
	subwf	(I2C_ReadByte@cnt),w
	skipc
	goto	u3541
	goto	u3540
u3541:
	goto	l10794
u3540:
	line	135
	
l15442:	
;iic.c: 134: }
;iic.c: 135: if(ack == 0)
	movf	(I2C_ReadByte@ack),f
	skipz
	goto	u3551
	goto	u3550
u3551:
	goto	l15446
u3550:
	line	137
	
l15444:	
;iic.c: 136: {
;iic.c: 137: IIC_NACK();
	fcall	_IIC_NACK
	line	138
;iic.c: 138: }
	goto	l15448
	line	141
	
l15446:	
;iic.c: 139: else
;iic.c: 140: {
;iic.c: 141: IIC_ACK();
	fcall	_IIC_ACK
	line	143
	
l15448:	
;iic.c: 142: }
;iic.c: 143: return data;
	movf	(I2C_ReadByte@data+1),w
	movwf	(?_I2C_ReadByte+1)
	movf	(I2C_ReadByte@data),w
	movwf	(?_I2C_ReadByte)
	line	144
	
l10799:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_ReadByte
	__end_of_I2C_ReadByte:
;; =============== function _I2C_ReadByte ends ============

	signat	_I2C_ReadByte,4218
	global	_AT24C02_Write_Byte
psect	text1252,local,class=CODE,delta=2
global __ptext1252
__ptext1252:

;; *************** function _AT24C02_Write_Byte *****************
;; Defined at:
;;		line 9 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\e2prom.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;;  data            1    0[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       1       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_IIC_START
;;		_I2C_SendByte
;;		_IIC_Wait_ACK
;;		_IIC_STOP
;; This function is called by:
;;		_recive_task
;;		_AT24C02_Write_Msg
;; This function uses a non-reentrant model
;;
psect	text1252
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\e2prom.c"
	line	9
	global	__size_of_AT24C02_Write_Byte
	__size_of_AT24C02_Write_Byte	equ	__end_of_AT24C02_Write_Byte-_AT24C02_Write_Byte
	
_AT24C02_Write_Byte:	
	opt	stack 0
; Regs used in _AT24C02_Write_Byte: [wreg+status,2+status,0+pclath+cstack]
;AT24C02_Write_Byte@addr stored from wreg
	movwf	(AT24C02_Write_Byte@addr)
	line	10
	
l17084:	
;e2prom.c: 10: IIC_START();
	fcall	_IIC_START
	line	11
;e2prom.c: 11: I2C_SendByte(0XA0);
	movlw	(0A0h)
	fcall	_I2C_SendByte
	line	12
;e2prom.c: 12: IIC_Wait_ACK();
	fcall	_IIC_Wait_ACK
	line	13
;e2prom.c: 13: I2C_SendByte(addr);
	movf	(AT24C02_Write_Byte@addr),w
	fcall	_I2C_SendByte
	line	14
;e2prom.c: 14: IIC_Wait_ACK();
	fcall	_IIC_Wait_ACK
	line	15
;e2prom.c: 15: I2C_SendByte(data);
	movf	(AT24C02_Write_Byte@data),w
	fcall	_I2C_SendByte
	line	16
;e2prom.c: 16: IIC_Wait_ACK();
	fcall	_IIC_Wait_ACK
	line	17
;e2prom.c: 17: IIC_STOP();
	fcall	_IIC_STOP
	line	18
	
l11434:	
	return
	opt stack 0
GLOBAL	__end_of_AT24C02_Write_Byte
	__end_of_AT24C02_Write_Byte:
;; =============== function _AT24C02_Write_Byte ends ============

	signat	_AT24C02_Write_Byte,8312
	global	_RF_ClearStatus
psect	text1253,local,class=CODE,delta=2
global __ptext1253
__ptext1253:

;; *************** function _RF_ClearStatus *****************
;; Defined at:
;;		line 249 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_RF_WriteReg
;; This function is called by:
;;		_RF_RxData
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1253
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	249
	global	__size_of_RF_ClearStatus
	__size_of_RF_ClearStatus	equ	__end_of_RF_ClearStatus-_RF_ClearStatus
	
_RF_ClearStatus:	
	opt	stack 2
; Regs used in _RF_ClearStatus: [wreg+status,2+status,0+pclath+cstack]
	line	250
	
l17082:	
;rf297L.c: 250: RF_WriteReg(0x20 + 0x07,0x70);
	movlw	(070h)
	movwf	(?_RF_WriteReg)
	movlw	(027h)
	fcall	_RF_WriteReg
	line	251
	
l5214:	
	return
	opt stack 0
GLOBAL	__end_of_RF_ClearStatus
	__end_of_RF_ClearStatus:
;; =============== function _RF_ClearStatus ends ============

	signat	_RF_ClearStatus,88
	global	_RF_ClearFIFO
psect	text1254,local,class=CODE,delta=2
global __ptext1254
__ptext1254:

;; *************** function _RF_ClearFIFO *****************
;; Defined at:
;;		line 243 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_RF_WriteReg
;; This function is called by:
;;		_RF_RxData
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1254
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	243
	global	__size_of_RF_ClearFIFO
	__size_of_RF_ClearFIFO	equ	__end_of_RF_ClearFIFO-_RF_ClearFIFO
	
_RF_ClearFIFO:	
	opt	stack 2
; Regs used in _RF_ClearFIFO: [wreg+status,2+status,0+pclath+cstack]
	line	244
	
l17080:	
;rf297L.c: 244: RF_WriteReg(0xE1, 0);
	clrf	(?_RF_WriteReg)
	movlw	(0E1h)
	fcall	_RF_WriteReg
	line	245
;rf297L.c: 245: RF_WriteReg(0xE2, 0);
	clrf	(?_RF_WriteReg)
	movlw	(0E2h)
	fcall	_RF_WriteReg
	line	246
	
l5211:	
	return
	opt stack 0
GLOBAL	__end_of_RF_ClearFIFO
	__end_of_RF_ClearFIFO:
;; =============== function _RF_ClearFIFO ends ============

	signat	_RF_ClearFIFO,88
	global	_RF_GetStatus
psect	text1255,local,class=CODE,delta=2
global __ptext1255
__ptext1255:

;; *************** function _RF_GetStatus *****************
;; Defined at:
;;		line 254 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_RF_ReadReg
;; This function is called by:
;;		_RF_RxData
;; This function uses a non-reentrant model
;;
psect	text1255
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	254
	global	__size_of_RF_GetStatus
	__size_of_RF_GetStatus	equ	__end_of_RF_GetStatus-_RF_GetStatus
	
_RF_GetStatus:	
	opt	stack 0
; Regs used in _RF_GetStatus: [wreg+status,2+status,0+pclath+cstack]
	line	255
	
l17076:	
;rf297L.c: 255: return RF_ReadReg(0x07)&0x70;
	movlw	(07h)
	fcall	_RF_ReadReg
	andlw	070h
	line	256
	
l5217:	
	return
	opt stack 0
GLOBAL	__end_of_RF_GetStatus
	__end_of_RF_GetStatus:
;; =============== function _RF_GetStatus ends ============

	signat	_RF_GetStatus,89
	global	_RF_Set_RxMode
psect	text1256,local,class=CODE,delta=2
global __ptext1256
__ptext1256:

;; *************** function _RF_Set_RxMode *****************
;; Defined at:
;;		line 267 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_RF_WriteReg
;;		_soft_delay_ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1256
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	267
	global	__size_of_RF_Set_RxMode
	__size_of_RF_Set_RxMode	equ	__end_of_RF_Set_RxMode-_RF_Set_RxMode
	
_RF_Set_RxMode:	
	opt	stack 3
; Regs used in _RF_Set_RxMode: [wreg+status,2+status,0+pclath+cstack]
	line	268
	
l17072:	
;rf297L.c: 268: RF_WriteReg(0x20 + 0x00, 0X87);
	movlw	(087h)
	movwf	(?_RF_WriteReg)
	movlw	(020h)
	fcall	_RF_WriteReg
	line	269
;rf297L.c: 269: soft_delay_ms(10);
	movlw	0Ah
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	270
	
l17074:	
;rf297L.c: 270: RA7=1;
	bsf	(47/8),(47)&7
	line	271
;rf297L.c: 271: soft_delay_ms(10);
	movlw	0Ah
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	272
	
l5223:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Set_RxMode
	__end_of_RF_Set_RxMode:
;; =============== function _RF_Set_RxMode ends ============

	signat	_RF_Set_RxMode,88
	global	_RF_Init
psect	text1257,local,class=CODE,delta=2
global __ptext1257
__ptext1257:

;; *************** function _RF_Init *****************
;; Defined at:
;;		line 45 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  feature         1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_SPI_init
;;		_RF_WriteReg
;;		_RF_Write_Buff
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1257
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	45
	global	__size_of_RF_Init
	__size_of_RF_Init	equ	__end_of_RF_Init-_RF_Init
	
_RF_Init:	
	opt	stack 3
; Regs used in _RF_Init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	75
	
l17022:	
	line	76
	
l17024:	
;rf297L.c: 76: SPI_init();
	fcall	_SPI_init
	line	77
	
l17026:	
;rf297L.c: 77: RF_WriteReg(0x53, 0x5A);
	movlw	(05Ah)
	movwf	(?_RF_WriteReg)
	movlw	(053h)
	fcall	_RF_WriteReg
	line	78
	
l17028:	
;rf297L.c: 78: RF_WriteReg(0x53, 0XA5);
	movlw	(0A5h)
	movwf	(?_RF_WriteReg)
	movlw	(053h)
	fcall	_RF_WriteReg
	line	79
	
l17030:	
;rf297L.c: 79: RF_WriteReg(0xE1, 0);
	clrf	(?_RF_WriteReg)
	movlw	(0E1h)
	fcall	_RF_WriteReg
	line	80
	
l17032:	
;rf297L.c: 80: RF_WriteReg(0xE2, 0);
	clrf	(?_RF_WriteReg)
	movlw	(0E2h)
	fcall	_RF_WriteReg
	line	81
	
l17034:	
;rf297L.c: 81: RF_WriteReg(0x20 + 0x07, 0x70);
	movlw	(070h)
	movwf	(?_RF_WriteReg)
	movlw	(027h)
	fcall	_RF_WriteReg
	line	82
	
l17036:	
;rf297L.c: 82: RF_WriteReg(0x20 + 0x02, 0x01);
	clrf	(?_RF_WriteReg)
	incf	(?_RF_WriteReg),f
	movlw	(022h)
	fcall	_RF_WriteReg
	line	83
	
l17038:	
;rf297L.c: 83: RF_WriteReg(0x20 + 0x03, 0x01);
	clrf	(?_RF_WriteReg)
	incf	(?_RF_WriteReg),f
	movlw	(023h)
	fcall	_RF_WriteReg
	line	84
	
l17040:	
;rf297L.c: 84: RF_WriteReg(0x20 + 0x05, 26);
	movlw	(01Ah)
	movwf	(?_RF_WriteReg)
	movlw	(025h)
	fcall	_RF_WriteReg
	line	85
	
l17042:	
;rf297L.c: 85: RF_WriteReg(0x20 + 0x11, 18);
	movlw	(012h)
	movwf	(?_RF_WriteReg)
	movlw	(031h)
	fcall	_RF_WriteReg
	line	86
	
l17044:	
;rf297L.c: 86: RF_Write_Buff(0x20 + 0x10, TX_ADDRESS_DEF, sizeof(TX_ADDRESS_DEF));
	movlw	((_TX_ADDRESS_DEF-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(030h)
	fcall	_RF_Write_Buff
	line	87
	
l17046:	
;rf297L.c: 87: RF_Write_Buff(0x20 + 0x0A,RX_ADDRESS_DEF, sizeof(RX_ADDRESS_DEF));
	movlw	((_RX_ADDRESS_DEF-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(02Ah)
	fcall	_RF_Write_Buff
	line	88
	
l17048:	
;rf297L.c: 88: RF_Write_Buff(0x20 + 0x1F, BB_cal_data, sizeof(BB_cal_data));
	movlw	((RF_Init@BB_cal_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(05h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(03Fh)
	fcall	_RF_Write_Buff
	line	89
	
l17050:	
;rf297L.c: 89: RF_Write_Buff(0x20 + 0x1A, RF_cal2_data, sizeof(RF_cal2_data));
	movlw	((RF_Init@RF_cal2_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(06h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(03Ah)
	fcall	_RF_Write_Buff
	line	90
	
l17052:	
;rf297L.c: 90: RF_Write_Buff(0x20 + 0x19, Dem_cal_data, sizeof(Dem_cal_data));
	movlw	((RF_Init@Dem_cal_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	clrf	0+(?_RF_Write_Buff)+01h
	incf	0+(?_RF_Write_Buff)+01h,f
	movlw	(039h)
	fcall	_RF_Write_Buff
	line	91
	
l17054:	
;rf297L.c: 91: RF_Write_Buff(0x20 + 0x1E, RF_cal_data, sizeof(RF_cal_data));
	movlw	((RF_Init@RF_cal_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(03Eh)
	fcall	_RF_Write_Buff
	line	92
	
l17056:	
;rf297L.c: 92: RF_Write_Buff(0x20 + 0x1B, Dem_cal2_data,sizeof(Dem_cal2_data));
	movlw	((RF_Init@Dem_cal2_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(03Bh)
	fcall	_RF_Write_Buff
	line	93
	
l17058:	
;rf297L.c: 93: RF_WriteReg(0x20 + 0x1C, 0x00);
	clrf	(?_RF_WriteReg)
	movlw	(03Ch)
	fcall	_RF_WriteReg
	line	94
	
l17060:	
;rf297L.c: 94: RF_WriteReg(0x20 + 0x06, (0x0e |0X00));
	movlw	(0Eh)
	movwf	(?_RF_WriteReg)
	movlw	(026h)
	fcall	_RF_WriteReg
	line	95
	
l17062:	
;rf297L.c: 95: RF_WriteReg(0x50, 0x73);
	movlw	(073h)
	movwf	(?_RF_WriteReg)
	movlw	(050h)
	fcall	_RF_WriteReg
	line	101
	
l17064:	
;rf297L.c: 101: RF_WriteReg(0x20 + 0x04,0x00);
	clrf	(?_RF_WriteReg)
	movlw	(024h)
	fcall	_RF_WriteReg
	line	102
	
l17066:	
;rf297L.c: 102: RF_WriteReg(0x20 + 0x01, 0x00);
	clrf	(?_RF_WriteReg)
	movlw	(021h)
	fcall	_RF_WriteReg
	line	117
;rf297L.c: 113: if(18 >32){
	
l17070:	
;rf297L.c: 115: }
;rf297L.c: 117: RF_WriteReg(0x20 + 0x1D, feature);
	clrf	(?_RF_WriteReg)
	movlw	(03Dh)
	fcall	_RF_WriteReg
	line	118
	
l5191:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Init
	__end_of_RF_Init:
;; =============== function _RF_Init ends ============

	signat	_RF_Init,88
	global	_I2C_SendByte
psect	text1258,local,class=CODE,delta=2
global __ptext1258
__ptext1258:

;; *************** function _I2C_SendByte *****************
;; Defined at:
;;		line 91 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\iic.c"
;; Parameters:    Size  Location     Type
;;  Data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Data            1    4[COMMON] unsigned char 
;;  cnt             1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_iic_delay_us
;; This function is called by:
;;		_AT24C02_Write_Byte
;;		_AT24C02_Read_Byte
;; This function uses a non-reentrant model
;;
psect	text1258
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\iic.c"
	line	91
	global	__size_of_I2C_SendByte
	__size_of_I2C_SendByte	equ	__end_of_I2C_SendByte-_I2C_SendByte
	
_I2C_SendByte:	
	opt	stack 0
; Regs used in _I2C_SendByte: [wreg+status,2+status,0+pclath+cstack]
;I2C_SendByte@Data stored from wreg
	line	93
	movwf	(I2C_SendByte@Data)
	
l15336:	
;iic.c: 92: unsigned char cnt;
;iic.c: 93: TRISC1=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	94
	
l15338:	
;iic.c: 94: for(cnt=0; cnt<8; cnt++)
	clrf	(I2C_SendByte@cnt)
	line	95
	
l10787:	
	line	98
;iic.c: 95: {
;iic.c: 98: if(Data & 0x80)
	btfss	(I2C_SendByte@Data),(7)&7
	goto	u3511
	goto	u3510
u3511:
	goto	l10789
u3510:
	line	100
	
l15344:	
;iic.c: 99: {
;iic.c: 100: RC1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(57/8),(57)&7
	line	101
;iic.c: 101: }
	goto	l10790
	line	102
	
l10789:	
	line	104
;iic.c: 102: else
;iic.c: 103: {
;iic.c: 104: RC1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(57/8),(57)&7
	line	105
	
l10790:	
	line	106
;iic.c: 105: }
;iic.c: 106: Data <<= 1;
	clrc
	rlf	(I2C_SendByte@Data),f
	line	107
;iic.c: 107: RC2=1;
	bsf	(58/8),(58)&7
	line	108
	
l15346:	
;iic.c: 108: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	109
	
l15348:	
;iic.c: 109: RC2=0;
	bcf	(58/8),(58)&7
	line	110
;iic.c: 110: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	94
	
l15350:	
	incf	(I2C_SendByte@cnt),f
	
l15352:	
	movlw	(08h)
	subwf	(I2C_SendByte@cnt),w
	skipc
	goto	u3521
	goto	u3520
u3521:
	goto	l10787
u3520:
	line	113
	
l10791:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_SendByte
	__end_of_I2C_SendByte:
;; =============== function _I2C_SendByte ends ============

	signat	_I2C_SendByte,4216
	global	_IIC_NACK
psect	text1259,local,class=CODE,delta=2
global __ptext1259
__ptext1259:

;; *************** function _IIC_NACK *****************
;; Defined at:
;;		line 78 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\iic.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_iic_delay_us
;; This function is called by:
;;		_I2C_ReadByte
;; This function uses a non-reentrant model
;;
psect	text1259
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\iic.c"
	line	78
	global	__size_of_IIC_NACK
	__size_of_IIC_NACK	equ	__end_of_IIC_NACK-_IIC_NACK
	
_IIC_NACK:	
	opt	stack 0
; Regs used in _IIC_NACK: [wreg+status,2+status,0+pclath+cstack]
	line	79
	
l15328:	
;iic.c: 79: RC1=1;
	bsf	(57/8),(57)&7
	line	80
	
l15330:	
;iic.c: 80: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	81
	
l15332:	
;iic.c: 81: RC2=1;
	bsf	(58/8),(58)&7
	line	82
;iic.c: 82: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	83
	
l15334:	
;iic.c: 83: RC2=0;
	bcf	(58/8),(58)&7
	line	84
;iic.c: 84: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	85
	
l10784:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_NACK
	__end_of_IIC_NACK:
;; =============== function _IIC_NACK ends ============

	signat	_IIC_NACK,88
	global	_IIC_ACK
psect	text1260,local,class=CODE,delta=2
global __ptext1260
__ptext1260:

;; *************** function _IIC_ACK *****************
;; Defined at:
;;		line 67 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\iic.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_iic_delay_us
;; This function is called by:
;;		_I2C_ReadByte
;; This function uses a non-reentrant model
;;
psect	text1260
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\iic.c"
	line	67
	global	__size_of_IIC_ACK
	__size_of_IIC_ACK	equ	__end_of_IIC_ACK-_IIC_ACK
	
_IIC_ACK:	
	opt	stack 0
; Regs used in _IIC_ACK: [wreg+status,2+status,0+pclath+cstack]
	line	68
	
l15318:	
;iic.c: 68: TRISC1=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	69
;iic.c: 69: RC1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(57/8),(57)&7
	line	70
	
l15320:	
;iic.c: 70: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	71
	
l15322:	
;iic.c: 71: RC2=1;
	bsf	(58/8),(58)&7
	line	72
;iic.c: 72: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	73
	
l15324:	
;iic.c: 73: RC2=0;
	bcf	(58/8),(58)&7
	line	74
	
l15326:	
;iic.c: 74: RC1=1;
	bsf	(57/8),(57)&7
	line	75
	
l10781:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_ACK
	__end_of_IIC_ACK:
;; =============== function _IIC_ACK ends ============

	signat	_IIC_ACK,88
	global	_IIC_Wait_ACK
psect	text1261,local,class=CODE,delta=2
global __ptext1261
__ptext1261:

;; *************** function _IIC_Wait_ACK *****************
;; Defined at:
;;		line 42 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\iic.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  RE              1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_iic_delay_us
;; This function is called by:
;;		_AT24C02_Write_Byte
;;		_AT24C02_Read_Byte
;; This function uses a non-reentrant model
;;
psect	text1261
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\iic.c"
	line	42
	global	__size_of_IIC_Wait_ACK
	__size_of_IIC_Wait_ACK	equ	__end_of_IIC_Wait_ACK-_IIC_Wait_ACK
	
_IIC_Wait_ACK:	
	opt	stack 0
; Regs used in _IIC_Wait_ACK: [wreg+status,2+status,0+pclath+cstack]
	line	43
	
l15290:	
	line	44
	
l15292:	
;iic.c: 44: TRISC1=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	45
	
l15294:	
;iic.c: 45: RC1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(57/8),(57)&7
	line	46
	
l15296:	
;iic.c: 46: {TRISC1=1,WPUC1=1;};
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1081/8)^080h,(1081)&7
	
l15298:	
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3193/8)^0180h,(3193)&7
	line	48
	
l15300:	
;iic.c: 48: RC2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	49
	
l15302:	
;iic.c: 49: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	50
	
l15304:	
;iic.c: 50: RC2=1;
	bsf	(58/8),(58)&7
	line	51
	
l15306:	
;iic.c: 51: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	53
	
l15308:	
;iic.c: 53: if(RC1)
	btfss	(57/8),(57)&7
	goto	u3501
	goto	u3500
u3501:
	goto	l15312
u3500:
	line	55
	
l15310:	
	line	56
;iic.c: 56: }
	goto	l15314
	line	59
	
l15312:	
	line	61
	
l15314:	
;iic.c: 60: }
;iic.c: 61: RC2=0;
	bcf	(58/8),(58)&7
	line	64
	
l10778:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_Wait_ACK
	__end_of_IIC_Wait_ACK:
;; =============== function _IIC_Wait_ACK ends ============

	signat	_IIC_Wait_ACK,89
	global	_IIC_STOP
psect	text1262,local,class=CODE,delta=2
global __ptext1262
__ptext1262:

;; *************** function _IIC_STOP *****************
;; Defined at:
;;		line 32 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\iic.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_iic_delay_us
;; This function is called by:
;;		_AT24C02_Write_Byte
;;		_AT24C02_Read_Byte
;; This function uses a non-reentrant model
;;
psect	text1262
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\iic.c"
	line	32
	global	__size_of_IIC_STOP
	__size_of_IIC_STOP	equ	__end_of_IIC_STOP-_IIC_STOP
	
_IIC_STOP:	
	opt	stack 0
; Regs used in _IIC_STOP: [wreg+status,2+status,0+pclath+cstack]
	line	33
	
l15284:	
;iic.c: 33: TRISC1=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	34
;iic.c: 34: RC1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(57/8),(57)&7
	line	35
;iic.c: 35: RC2=1;
	bsf	(58/8),(58)&7
	line	36
	
l15286:	
;iic.c: 36: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	37
	
l15288:	
;iic.c: 37: RC1=1;
	bsf	(57/8),(57)&7
	line	38
	
l10773:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_STOP
	__end_of_IIC_STOP:
;; =============== function _IIC_STOP ends ============

	signat	_IIC_STOP,88
	global	_IIC_START
psect	text1263,local,class=CODE,delta=2
global __ptext1263
__ptext1263:

;; *************** function _IIC_START *****************
;; Defined at:
;;		line 20 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\iic.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_iic_delay_us
;; This function is called by:
;;		_AT24C02_Write_Byte
;;		_AT24C02_Read_Byte
;; This function uses a non-reentrant model
;;
psect	text1263
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\iic.c"
	line	20
	global	__size_of_IIC_START
	__size_of_IIC_START	equ	__end_of_IIC_START-_IIC_START
	
_IIC_START:	
	opt	stack 0
; Regs used in _IIC_START: [wreg+status,2+status,0+pclath+cstack]
	line	21
	
l15276:	
;iic.c: 21: TRISC1=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	22
;iic.c: 22: RC1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(57/8),(57)&7
	line	23
;iic.c: 23: RC2=1;
	bsf	(58/8),(58)&7
	line	24
	
l15278:	
;iic.c: 24: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	25
	
l15280:	
;iic.c: 25: RC1=0;
	bcf	(57/8),(57)&7
	line	26
;iic.c: 26: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	27
	
l15282:	
;iic.c: 27: RC2=0;
	bcf	(58/8),(58)&7
	line	28
	
l10770:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_START
	__end_of_IIC_START:
;; =============== function _IIC_START ends ============

	signat	_IIC_START,88
	global	_key_scan
psect	text1264,local,class=CODE,delta=2
global __ptext1264
__ptext1264:

;; *************** function _key_scan *****************
;; Defined at:
;;		line 128 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\key_scan.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_soft_delay_ms
;; This function is called by:
;;		_key_value_read
;; This function uses a non-reentrant model
;;
psect	text1264
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\key_scan.c"
	line	128
	global	__size_of_key_scan
	__size_of_key_scan	equ	__end_of_key_scan-_key_scan
	
_key_scan:	
	opt	stack 3
; Regs used in _key_scan: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	129
	
l15200:	
;key_scan.c: 129: if(RB1 == 0)
	btfsc	(49/8),(49)&7
	goto	u3321
	goto	u3320
u3321:
	goto	l7222
u3320:
	line	131
	
l15202:	
;key_scan.c: 130: {
;key_scan.c: 131: soft_delay_ms(10);
	movlw	0Ah
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	132
	
l15204:	
;key_scan.c: 132: if(RB1 == 0)
	btfsc	(49/8),(49)&7
	goto	u3331
	goto	u3330
u3331:
	goto	l15222
u3330:
	line	133
	
l15206:	
;key_scan.c: 133: if((KEY0_FLAG&0x01) == 0)
	btfsc	(_KEY0_FLAG),(0)&7
	goto	u3341
	goto	u3340
u3341:
	goto	l15222
u3340:
	line	135
	
l15208:	
;key_scan.c: 134: {
;key_scan.c: 135: flag_time_key0_add = 0;
	clrf	(_flag_time_key0_add)
	clrf	(_flag_time_key0_add+1)
	line	136
	
l15210:	
;key_scan.c: 136: KEY0_FLAG|=0X01;
	bsf	(_KEY0_FLAG)+(0/8),(0)&7
	line	137
	
l15212:	
;key_scan.c: 137: if(key_long_flag_add == 0)
	movf	(_key_long_flag_add),f
	skipz
	goto	u3351
	goto	u3350
u3351:
	goto	l7223
u3350:
	line	139
	
l15214:	
;key_scan.c: 138: {
;key_scan.c: 139: key_long_flag_add = 1;
	clrf	(_key_long_flag_add)
	incf	(_key_long_flag_add),f
	goto	l15222
	line	142
	
l7223:	
;key_scan.c: 140: }
;key_scan.c: 141: }
;key_scan.c: 142: }
	goto	l15222
	line	143
	
l7222:	
	line	145
;key_scan.c: 143: else
;key_scan.c: 144: {
;key_scan.c: 145: if(KEY0_FLAG&0x01)
	btfss	(_KEY0_FLAG),(0)&7
	goto	u3361
	goto	u3360
u3361:
	goto	l15222
u3360:
	line	147
	
l15216:	
;key_scan.c: 146: {
;key_scan.c: 147: KEY0_FLAG |= 0X02;
	bsf	(_KEY0_FLAG)+(1/8),(1)&7
	line	148
	
l15218:	
;key_scan.c: 148: if(key_long_flag_add == 1)
	decf	(_key_long_flag_add),w
	skipz
	goto	u3371
	goto	u3370
u3371:
	goto	l15222
u3370:
	line	150
	
l15220:	
;key_scan.c: 149: {
;key_scan.c: 150: key_long_flag_add = 0;
	clrf	(_key_long_flag_add)
	line	155
	
l15222:	
;key_scan.c: 151: }
;key_scan.c: 152: }
;key_scan.c: 153: }
;key_scan.c: 155: if(RB2 == 0)
	btfsc	(50/8),(50)&7
	goto	u3381
	goto	u3380
u3381:
	goto	l7229
u3380:
	line	157
	
l15224:	
;key_scan.c: 156: {
;key_scan.c: 157: soft_delay_ms(10);
	movlw	0Ah
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	158
	
l15226:	
;key_scan.c: 158: if(RB2 == 0)
	btfsc	(50/8),(50)&7
	goto	u3391
	goto	u3390
u3391:
	goto	l15244
u3390:
	line	159
	
l15228:	
;key_scan.c: 159: if((KEY1_FLAG&0x01) == 0)
	btfsc	(_KEY1_FLAG),(0)&7
	goto	u3401
	goto	u3400
u3401:
	goto	l15244
u3400:
	line	161
	
l15230:	
;key_scan.c: 160: {
;key_scan.c: 161: flag_time_key1_add = 0;
	clrf	(_flag_time_key1_add)
	clrf	(_flag_time_key1_add+1)
	line	162
	
l15232:	
;key_scan.c: 162: KEY1_FLAG |= 0X01;
	bsf	(_KEY1_FLAG)+(0/8),(0)&7
	line	163
	
l15234:	
;key_scan.c: 163: if(key_long_flag_add == 0)
	movf	(_key_long_flag_add),f
	skipz
	goto	u3411
	goto	u3410
u3411:
	goto	l7230
u3410:
	line	165
	
l15236:	
;key_scan.c: 164: {
;key_scan.c: 165: key_long_flag_add = 2;
	movlw	(02h)
	movwf	(_key_long_flag_add)
	goto	l15244
	line	169
	
l7230:	
;key_scan.c: 166: }
;key_scan.c: 167: }
;key_scan.c: 169: }
	goto	l15244
	line	170
	
l7229:	
	line	172
;key_scan.c: 170: else
;key_scan.c: 171: {
;key_scan.c: 172: if(KEY1_FLAG & 0x01)
	btfss	(_KEY1_FLAG),(0)&7
	goto	u3421
	goto	u3420
u3421:
	goto	l15244
u3420:
	line	174
	
l15238:	
;key_scan.c: 173: {
;key_scan.c: 174: KEY1_FLAG |= 0X02;
	bsf	(_KEY1_FLAG)+(1/8),(1)&7
	line	175
	
l15240:	
;key_scan.c: 175: if(key_long_flag_add == 2)
	movf	(_key_long_flag_add),w
	xorlw	02h
	skipz
	goto	u3431
	goto	u3430
u3431:
	goto	l15244
u3430:
	line	177
	
l15242:	
;key_scan.c: 176: {
;key_scan.c: 177: key_long_flag_add = 0;
	clrf	(_key_long_flag_add)
	line	186
	
l15244:	
;key_scan.c: 178: }
;key_scan.c: 179: }
;key_scan.c: 180: }
;key_scan.c: 186: if(RB3 == 0)
	btfsc	(51/8),(51)&7
	goto	u3441
	goto	u3440
u3441:
	goto	l7236
u3440:
	line	188
	
l15246:	
;key_scan.c: 187: {
;key_scan.c: 188: soft_delay_ms(10);
	movlw	0Ah
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	189
	
l15248:	
;key_scan.c: 189: if(RB3 == 0)
	btfsc	(51/8),(51)&7
	goto	u3451
	goto	u3450
u3451:
	goto	l15274
u3450:
	line	190
	
l15250:	
;key_scan.c: 190: if((KEY2_FLAG&0x01) == 0)
	btfsc	(_KEY2_FLAG),(0)&7
	goto	u3461
	goto	u3460
u3461:
	goto	l15274
u3460:
	line	192
	
l15252:	
;key_scan.c: 191: {
;key_scan.c: 192: flag_time_key2_add = 0;
	clrf	(_flag_time_key2_add)
	clrf	(_flag_time_key2_add+1)
	line	193
	
l15254:	
;key_scan.c: 193: KEY2_FLAG|=0X01;
	bsf	(_KEY2_FLAG)+(0/8),(0)&7
	line	194
	
l15256:	
;key_scan.c: 194: if(key_long_flag_add == 0)
	movf	(_key_long_flag_add),f
	skipz
	goto	u3471
	goto	u3470
u3471:
	goto	l7240
u3470:
	line	196
	
l15258:	
;key_scan.c: 195: {
;key_scan.c: 196: key_long_flag_add = 4;
	movlw	(04h)
	movwf	(_key_long_flag_add)
	goto	l15274
	line	200
	
l7236:	
	line	202
;key_scan.c: 200: else
;key_scan.c: 201: {
;key_scan.c: 202: if(KEY2_FLAG & 0x01)
	btfss	(_KEY2_FLAG),(0)&7
	goto	u3481
	goto	u3480
u3481:
	goto	l15274
u3480:
	line	204
	
l15260:	
;key_scan.c: 203: {
;key_scan.c: 204: KEY2_FLAG |= 0X02;
	bsf	(_KEY2_FLAG)+(1/8),(1)&7
	line	205
	
l15262:	
;key_scan.c: 205: if(key_long_flag_add == 4)
	movf	(_key_long_flag_add),w
	xorlw	04h
	skipz
	goto	u3491
	goto	u3490
u3491:
	goto	l7240
u3490:
	line	207
	
l15264:	
;key_scan.c: 206: {
;key_scan.c: 207: key_long_flag_add = 0;
	clrf	(_key_long_flag_add)
	goto	l15274
	line	210
	
l7240:	
	line	213
;key_scan.c: 208: }
;key_scan.c: 209: }
;key_scan.c: 210: }
;key_scan.c: 213: switch(key_long_flag_add)
	goto	l15274
	line	221
	
l15266:	
;key_scan.c: 220: {
;key_scan.c: 221: flag_time_key1_add = 0;
	clrf	(_flag_time_key1_add)
	clrf	(_flag_time_key1_add+1)
	line	222
;key_scan.c: 222: flag_time_key2_add = 0;
	clrf	(_flag_time_key2_add)
	clrf	(_flag_time_key2_add+1)
	line	223
;key_scan.c: 223: }break;
	goto	l7249
	line	226
	
l15268:	
;key_scan.c: 225: {
;key_scan.c: 226: flag_time_key0_add = 0;
	clrf	(_flag_time_key0_add)
	clrf	(_flag_time_key0_add+1)
	line	227
;key_scan.c: 227: flag_time_key2_add = 0;
	clrf	(_flag_time_key2_add)
	clrf	(_flag_time_key2_add+1)
	line	228
;key_scan.c: 228: }break;
	goto	l7249
	line	231
	
l15270:	
;key_scan.c: 230: {
;key_scan.c: 231: flag_time_key0_add = 0;
	clrf	(_flag_time_key0_add)
	clrf	(_flag_time_key0_add+1)
	line	232
;key_scan.c: 232: flag_time_key1_add = 0;
	clrf	(_flag_time_key1_add)
	clrf	(_flag_time_key1_add+1)
	line	233
;key_scan.c: 233: }break;
	goto	l7249
	line	213
	
l15274:	
	movf	(_key_long_flag_add),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           17     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             9     6 (fixed)
; spacedrange           16     9 (fixed)
; locatedrange           5     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l7249
	xorlw	1^0	; case 1
	skipnz
	goto	l15266
	xorlw	2^1	; case 2
	skipnz
	goto	l15268
	xorlw	4^2	; case 4
	skipnz
	goto	l15270
	goto	l7249
	opt asmopt_on

	line	235
	
l7249:	
	return
	opt stack 0
GLOBAL	__end_of_key_scan
	__end_of_key_scan:
;; =============== function _key_scan ends ============

	signat	_key_scan,88
	global	_RF_ReadReg
psect	text1265,local,class=CODE,delta=2
global __ptext1265
__ptext1265:

;; *************** function _RF_ReadReg *****************
;; Defined at:
;;		line 306 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;  reg_addr        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg_addr        1    0[BANK0 ] unsigned char 
;;  tmp             1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_SPI_RW
;; This function is called by:
;;		_RF_GetStatus
;; This function uses a non-reentrant model
;;
psect	text1265
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	306
	global	__size_of_RF_ReadReg
	__size_of_RF_ReadReg	equ	__end_of_RF_ReadReg-_RF_ReadReg
	
_RF_ReadReg:	
	opt	stack 0
; Regs used in _RF_ReadReg: [wreg+status,2+status,0+pclath+cstack]
;RF_ReadReg@reg_addr stored from wreg
	line	308
	movwf	(RF_ReadReg@reg_addr)
	
l17012:	
;rf297L.c: 307: unsigned char tmp;
;rf297L.c: 308: RE2=0;
	bcf	(74/8),(74)&7
	line	309
	
l17014:	
;rf297L.c: 309: SPI_RW(reg_addr);
	movf	(RF_ReadReg@reg_addr),w
	fcall	_SPI_RW
	line	310
;rf297L.c: 310: tmp = SPI_RW(0);
	movlw	(0)
	fcall	_SPI_RW
	movwf	(RF_ReadReg@tmp)
	line	311
	
l17016:	
;rf297L.c: 311: RE2=1;
	bsf	(74/8),(74)&7
	line	312
	
l17018:	
;rf297L.c: 312: return tmp;
	movf	(RF_ReadReg@tmp),w
	line	313
	
l5241:	
	return
	opt stack 0
GLOBAL	__end_of_RF_ReadReg
	__end_of_RF_ReadReg:
;; =============== function _RF_ReadReg ends ============

	signat	_RF_ReadReg,4217
	global	_RF_Read_Buff
psect	text1266,local,class=CODE,delta=2
global __ptext1266
__ptext1266:

;; *************** function _RF_Read_Buff *****************
;; Defined at:
;;		line 275 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;  reg_addr        1    wreg     unsigned char 
;;  pBuff           1    0[BANK0 ] PTR unsigned char 
;;		 -> rf_buf(18), 
;;  length          1    1[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg_addr        1    2[BANK0 ] unsigned char 
;;  byte_ctr        1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       2       0
;;      Temps:          1       0       0
;;      Totals:         1       4       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_SPI_RW
;; This function is called by:
;;		_RF_RxData
;; This function uses a non-reentrant model
;;
psect	text1266
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	275
	global	__size_of_RF_Read_Buff
	__size_of_RF_Read_Buff	equ	__end_of_RF_Read_Buff-_RF_Read_Buff
	
_RF_Read_Buff:	
	opt	stack 1
; Regs used in _RF_Read_Buff: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_Read_Buff@reg_addr stored from wreg
	line	277
	movwf	(RF_Read_Buff@reg_addr)
	
l17000:	
;rf297L.c: 276: unsigned char byte_ctr;
;rf297L.c: 277: RE2=0;
	bcf	(74/8),(74)&7
	line	278
	
l17002:	
;rf297L.c: 278: SPI_RW(reg_addr);
	movf	(RF_Read_Buff@reg_addr),w
	fcall	_SPI_RW
	line	279
	
l17004:	
;rf297L.c: 279: for(byte_ctr=0;byte_ctr<length;byte_ctr++){
	clrf	(RF_Read_Buff@byte_ctr)
	goto	l17010
	line	280
	
l17006:	
;rf297L.c: 280: pBuff[byte_ctr] = SPI_RW(0);
	movf	(RF_Read_Buff@byte_ctr),w
	addwf	(RF_Read_Buff@pBuff),w
	movwf	(??_RF_Read_Buff+0)+0
	movf	0+(??_RF_Read_Buff+0)+0,w
	movwf	fsr0
	movlw	(0)
	fcall	_SPI_RW
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	279
	
l17008:	
	incf	(RF_Read_Buff@byte_ctr),f
	
l17010:	
	movf	(RF_Read_Buff@length),w
	subwf	(RF_Read_Buff@byte_ctr),w
	skipc
	goto	u6251
	goto	u6250
u6251:
	goto	l17006
u6250:
	
l5228:	
	line	282
;rf297L.c: 281: }
;rf297L.c: 282: RE2=1;
	bsf	(74/8),(74)&7
	line	283
	
l5229:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Read_Buff
	__end_of_RF_Read_Buff:
;; =============== function _RF_Read_Buff ends ============

	signat	_RF_Read_Buff,12408
	global	_RF_Write_Buff
psect	text1267,local,class=CODE,delta=2
global __ptext1267
__ptext1267:

;; *************** function _RF_Write_Buff *****************
;; Defined at:
;;		line 286 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;  reg_addr        1    wreg     unsigned char 
;;  pBuff           1    0[BANK0 ] PTR unsigned char 
;;		 -> RF_Carrier@Dem_cal2_data(3), RF_Carrier@RF_cal_data(3), RF_Carrier@Dem_cal_data(1), RF_Carrier@RF_cal2_data(6), 
;;		 -> RF_Carrier@BB_cal_data(5), RF_Init@Dem_cal2_data(3), RF_Init@RF_cal_data(3), RF_Init@Dem_cal_data(1), 
;;		 -> RF_Init@RF_cal2_data(6), RF_Init@BB_cal_data(5), RX_ADDRESS_DEF(3), TX_ADDRESS_DEF(3), 
;;  length          1    1[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg_addr        1    2[BANK0 ] unsigned char 
;;  i               1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_SPI_RW
;; This function is called by:
;;		_RF_Init
;; This function uses a non-reentrant model
;;
psect	text1267
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	286
	global	__size_of_RF_Write_Buff
	__size_of_RF_Write_Buff	equ	__end_of_RF_Write_Buff-_RF_Write_Buff
	
_RF_Write_Buff:	
	opt	stack 3
; Regs used in _RF_Write_Buff: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_Write_Buff@reg_addr stored from wreg
	line	288
	movwf	(RF_Write_Buff@reg_addr)
	
l16988:	
;rf297L.c: 287: unsigned char i;
;rf297L.c: 288: RE2=0;
	bcf	(74/8),(74)&7
	line	289
	
l16990:	
;rf297L.c: 289: SPI_RW(reg_addr);
	movf	(RF_Write_Buff@reg_addr),w
	fcall	_SPI_RW
	line	290
	
l16992:	
;rf297L.c: 290: for(i=0;i<length;i++)
	clrf	(RF_Write_Buff@i)
	goto	l16998
	line	292
	
l16994:	
;rf297L.c: 291: {
;rf297L.c: 292: SPI_RW(pBuff[i]);
	movf	(RF_Write_Buff@i),w
	addwf	(RF_Write_Buff@pBuff),w
	movwf	fsr0
	fcall	stringdir
	fcall	_SPI_RW
	line	290
	
l16996:	
	incf	(RF_Write_Buff@i),f
	
l16998:	
	movf	(RF_Write_Buff@length),w
	subwf	(RF_Write_Buff@i),w
	skipc
	goto	u6241
	goto	u6240
u6241:
	goto	l16994
u6240:
	
l5234:	
	line	294
;rf297L.c: 293: }
;rf297L.c: 294: RE2=1;
	bsf	(74/8),(74)&7
	line	295
	
l5235:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Write_Buff
	__end_of_RF_Write_Buff:
;; =============== function _RF_Write_Buff ends ============

	signat	_RF_Write_Buff,12408
	global	_RF_WriteReg
psect	text1268,local,class=CODE,delta=2
global __ptext1268
__ptext1268:

;; *************** function _RF_WriteReg *****************
;; Defined at:
;;		line 298 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;  reg_addr        1    wreg     unsigned char 
;;  write_data      1    5[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg_addr        1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         1       1       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_SPI_RW
;; This function is called by:
;;		_RF_Init
;;		_RF_ClearFIFO
;;		_RF_ClearStatus
;;		_RF_Set_RxMode
;; This function uses a non-reentrant model
;;
psect	text1268
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	298
	global	__size_of_RF_WriteReg
	__size_of_RF_WriteReg	equ	__end_of_RF_WriteReg-_RF_WriteReg
	
_RF_WriteReg:	
	opt	stack 2
; Regs used in _RF_WriteReg: [wreg+status,2+status,0+pclath+cstack]
;RF_WriteReg@reg_addr stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(RF_WriteReg@reg_addr)
	line	299
	
l16982:	
;rf297L.c: 299: RE2=0;
	bcf	(74/8),(74)&7
	line	300
	
l16984:	
;rf297L.c: 300: SPI_RW(reg_addr);
	movf	(RF_WriteReg@reg_addr),w
	fcall	_SPI_RW
	line	301
;rf297L.c: 301: SPI_RW(write_data);
	movf	(RF_WriteReg@write_data),w
	fcall	_SPI_RW
	line	302
	
l16986:	
;rf297L.c: 302: RE2=1;
	bsf	(74/8),(74)&7
	line	303
	
l5238:	
	return
	opt stack 0
GLOBAL	__end_of_RF_WriteReg
	__end_of_RF_WriteReg:
;; =============== function _RF_WriteReg ends ============

	signat	_RF_WriteReg,8312
	global	_sledBlink
psect	text1269,local,class=CODE,delta=2
global __ptext1269
__ptext1269:

;; *************** function _sledBlink *****************
;; Defined at:
;;		line 32 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\key_scan.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_soft_delay_ms
;; This function is called by:
;;		_loadPowerOnEeprom
;;		_key_value_read
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1269
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\key_scan.c"
	line	32
	global	__size_of_sledBlink
	__size_of_sledBlink	equ	__end_of_sledBlink-_sledBlink
	
_sledBlink:	
	opt	stack 3
; Regs used in _sledBlink: [wreg+status,2+status,0+pclath+cstack]
	line	33
	
l15152:	
;key_scan.c: 33: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	34
	
l15154:	
;key_scan.c: 34: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	35
	
l15156:	
;key_scan.c: 35: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15158:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	36
	
l7187:	
	return
	opt stack 0
GLOBAL	__end_of_sledBlink
	__end_of_sledBlink:
;; =============== function _sledBlink ends ============

	signat	_sledBlink,88
	global	___lbdiv
psect	text1270,local,class=CODE,delta=2
global __ptext1270
__ptext1270:

;; *************** function ___lbdiv *****************
;; Defined at:
;;		line 5 in file "C:\item\pan2416\PAN2416\±àÒëÆ÷\CMS_ID~1.03_\data\sources\lbdiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    0[BANK0 ] unsigned char 
;;  quotient        1    2[BANK0 ] unsigned char 
;;  counter         1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         0       3       0
;;      Temps:          0       0       0
;;      Totals:         1       3       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1270
	file	"C:\item\pan2416\PAN2416\±àÒëÆ÷\CMS_ID~1.03_\data\sources\lbdiv.c"
	line	5
	global	__size_of___lbdiv
	__size_of___lbdiv	equ	__end_of___lbdiv-___lbdiv
	
___lbdiv:	
	opt	stack 4
; Regs used in ___lbdiv: [wreg+status,2+status,0]
;___lbdiv@dividend stored from wreg
	line	9
	movwf	(___lbdiv@dividend)
	
l16958:	
	clrf	(___lbdiv@quotient)
	line	10
	
l16960:	
	movf	(___lbdiv@divisor),w
	skipz
	goto	u6200
	goto	l16978
u6200:
	line	11
	
l16962:	
	clrf	(___lbdiv@counter)
	incf	(___lbdiv@counter),f
	line	12
	goto	l16966
	
l11486:	
	line	13
	clrc
	rlf	(___lbdiv@divisor),f
	line	14
	
l16964:	
	incf	(___lbdiv@counter),f
	line	12
	
l16966:	
	btfss	(___lbdiv@divisor),(7)&7
	goto	u6211
	goto	u6210
u6211:
	goto	l11486
u6210:
	line	16
	
l11488:	
	line	17
	clrc
	rlf	(___lbdiv@quotient),f
	line	18
	
l16968:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),w
	skipc
	goto	u6221
	goto	u6220
u6221:
	goto	l16974
u6220:
	line	19
	
l16970:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),f
	line	20
	
l16972:	
	bsf	(___lbdiv@quotient)+(0/8),(0)&7
	line	22
	
l16974:	
	clrc
	rrf	(___lbdiv@divisor),f
	line	23
	
l16976:	
	decfsz	(___lbdiv@counter),f
	goto	u6231
	goto	u6230
u6231:
	goto	l11488
u6230:
	line	25
	
l16978:	
	movf	(___lbdiv@quotient),w
	line	26
	
l11491:	
	return
	opt stack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
;; =============== function ___lbdiv ends ============

	signat	___lbdiv,8313
	global	___bmul
psect	text1271,local,class=CODE,delta=2
global __ptext1271
__ptext1271:

;; *************** function ___bmul *****************
;; Defined at:
;;		line 3 in file "bmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      1    wreg     unsigned char 
;;  multiplicand    1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  multiplier      1    5[COMMON] unsigned char 
;;  product         1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_loadParamsFromEeprom
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1271
	file	"C:\item\pan2416\PAN2416\±àÒëÆ÷\CMS_ID~1.03_\data\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 4
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	movwf	(___bmul@multiplier)
	line	4
	
l15096:	
	clrf	(___bmul@product)
	line	7
	
l15098:	
	btfss	(___bmul@multiplier),(0)&7
	goto	u3221
	goto	u3220
u3221:
	goto	l15102
u3220:
	line	8
	
l15100:	
	movf	(___bmul@multiplicand),w
	addwf	(___bmul@product),f
	line	9
	
l15102:	
	clrc
	rlf	(___bmul@multiplicand),f
	line	10
	
l15104:	
	clrc
	rrf	(___bmul@multiplier),f
	line	11
	
l15106:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u3231
	goto	u3230
u3231:
	goto	l15098
u3230:
	line	12
	
l15108:	
	movf	(___bmul@product),w
	line	13
	
l11455:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
;; =============== function ___bmul ends ============

	signat	___bmul,8313
	global	_iic_delay_us
psect	text1272,local,class=CODE,delta=2
global __ptext1272
__ptext1272:

;; *************** function _iic_delay_us *****************
;; Defined at:
;;		line 6 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\iic.c"
;; Parameters:    Size  Location     Type
;;  delay           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  delay           1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_IIC_START
;;		_IIC_STOP
;;		_IIC_Wait_ACK
;;		_IIC_ACK
;;		_IIC_NACK
;;		_I2C_SendByte
;;		_I2C_ReadByte
;; This function uses a non-reentrant model
;;
psect	text1272
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\iic.c"
	line	6
	global	__size_of_iic_delay_us
	__size_of_iic_delay_us	equ	__end_of_iic_delay_us-_iic_delay_us
	
_iic_delay_us:	
	opt	stack 0
; Regs used in _iic_delay_us: [wreg+status,2+status,0]
;iic_delay_us@delay stored from wreg
	movwf	(iic_delay_us@delay)
	line	7
	
l15092:	
;iic.c: 7: while(delay--);
	
l15094:	
	decf	(iic_delay_us@delay),f
	movf	((iic_delay_us@delay)),w
	xorlw	0FFh
	skipz
	goto	u3211
	goto	u3210
u3211:
	goto	l15094
u3210:
	line	8
	
l10764:	
	return
	opt stack 0
GLOBAL	__end_of_iic_delay_us
	__end_of_iic_delay_us:
;; =============== function _iic_delay_us ends ============

	signat	_iic_delay_us,4216
	global	_UpdateCRC
psect	text1273,local,class=CODE,delta=2
global __ptext1273
__ptext1273:

;; *************** function _UpdateCRC *****************
;; Defined at:
;;		line 65 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\recive.c"
;; Parameters:    Size  Location     Type
;;  CRC_input       1    wreg     PTR unsigned char 
;;		 -> rf_buf(18), 
;;  len             2    3[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  CRC_input       1    3[BANK0 ] PTR unsigned char 
;;		 -> rf_buf(18), 
;;  CRC_acc         2    6[BANK0 ] unsigned short 
;;  i               1    5[BANK0 ] unsigned char 
;;  k               1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    3[COMMON] unsigned short 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         0       5       0
;;      Temps:          0       3       0
;;      Totals:         2       8       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rx_data
;; This function uses a non-reentrant model
;;
psect	text1273
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\recive.c"
	line	65
	global	__size_of_UpdateCRC
	__size_of_UpdateCRC	equ	__end_of_UpdateCRC-_UpdateCRC
	
_UpdateCRC:	
	opt	stack 3
; Regs used in _UpdateCRC: [wreg-fsr0h+status,2+status,0+btemp+1]
;UpdateCRC@CRC_input stored from wreg
	movwf	(UpdateCRC@CRC_input)
	line	66
	
l15064:	
;recive.c: 66: unsigned char i,k = 0;
	clrf	(UpdateCRC@k)
	line	67
	
l15066:	
;recive.c: 67: unsigned short CRC_acc = 0x5555;
	movlw	low(05555h)
	movwf	(UpdateCRC@CRC_acc)
	movlw	high(05555h)
	movwf	((UpdateCRC@CRC_acc))+1
	line	69
;recive.c: 69: while (len--)
	goto	l15086
	line	71
	
l15068:	
;recive.c: 70: {
;recive.c: 71: CRC_acc = CRC_acc ^ (CRC_input[k++] << 8);
	movf	(UpdateCRC@k),w
	addwf	(UpdateCRC@CRC_input),w
	movwf	(??_UpdateCRC+0)+0
	movf	0+(??_UpdateCRC+0)+0,w
	movwf	fsr0
	movf	indf,w
	movwf	(??_UpdateCRC+1)+0
	clrf	(??_UpdateCRC+1)+0+1
	movf	(??_UpdateCRC+1)+0,w
	movwf	(??_UpdateCRC+1)+1
	clrf	(??_UpdateCRC+1)+0
	movf	0+(??_UpdateCRC+1)+0,w
	xorwf	(UpdateCRC@CRC_acc),f
	movf	1+(??_UpdateCRC+1)+0,w
	xorwf	(UpdateCRC@CRC_acc+1),f
	
l15070:	
	incf	(UpdateCRC@k),f
	line	73
	
l15072:	
;recive.c: 73: for (i = 0; i < 8; i++)
	clrf	(UpdateCRC@i)
	line	74
	
l9890:	
	line	75
;recive.c: 74: {
;recive.c: 75: if ((CRC_acc & 0x8000) == 0x8000)
	btfss	(UpdateCRC@CRC_acc+1),(15)&7
	goto	u3181
	goto	u3180
u3181:
	goto	l15082
u3180:
	line	77
	
l15078:	
;recive.c: 76: {
;recive.c: 77: CRC_acc = CRC_acc << 1;
	clrc
	rlf	(UpdateCRC@CRC_acc),f
	rlf	(UpdateCRC@CRC_acc+1),f
	line	78
	
l15080:	
;recive.c: 78: CRC_acc ^= 0x1021;
	movlw	low(01021h)
	xorwf	(UpdateCRC@CRC_acc),f
	movlw	high(01021h)
	xorwf	(UpdateCRC@CRC_acc+1),f
	line	79
;recive.c: 79: }
	goto	l9893
	line	82
	
l15082:	
;recive.c: 80: else
;recive.c: 81: {
;recive.c: 82: CRC_acc = CRC_acc << 1;
	clrc
	rlf	(UpdateCRC@CRC_acc),f
	rlf	(UpdateCRC@CRC_acc+1),f
	line	83
	
l9893:	
	line	73
	incf	(UpdateCRC@i),f
	
l15084:	
	movlw	(08h)
	subwf	(UpdateCRC@i),w
	skipc
	goto	u3191
	goto	u3190
u3191:
	goto	l9890
u3190:
	line	69
	
l15086:	
	movlw	low(01h)
	subwf	(UpdateCRC@len),f
	movlw	high(01h)
	skipc
	decf	(UpdateCRC@len+1),f
	subwf	(UpdateCRC@len+1),f
	incf	((UpdateCRC@len)),w
	skipnz
	incf	((UpdateCRC@len+1)),w

	skipz
	goto	u3201
	goto	u3200
u3201:
	goto	l15068
u3200:
	line	86
	
l15088:	
;recive.c: 83: }
;recive.c: 84: }
;recive.c: 85: }
;recive.c: 86: return CRC_acc;
	movf	(UpdateCRC@CRC_acc+1),w
	movwf	(?_UpdateCRC+1)
	movf	(UpdateCRC@CRC_acc),w
	movwf	(?_UpdateCRC)
	line	87
	
l9895:	
	return
	opt stack 0
GLOBAL	__end_of_UpdateCRC
	__end_of_UpdateCRC:
;; =============== function _UpdateCRC ends ============

	signat	_UpdateCRC,8314
	global	_SPI_RW
psect	text1274,local,class=CODE,delta=2
global __ptext1274
__ptext1274:

;; *************** function _SPI_RW *****************
;; Defined at:
;;		line 331 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;  read_reg_add    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  read_reg_add    1    3[COMMON] unsigned char 
;;  i               1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_RF_Read_Buff
;;		_RF_Write_Buff
;;		_RF_WriteReg
;;		_RF_ReadReg
;; This function uses a non-reentrant model
;;
psect	text1274
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	331
	global	__size_of_SPI_RW
	__size_of_SPI_RW	equ	__end_of_SPI_RW-_SPI_RW
	
_SPI_RW:	
	opt	stack 2
; Regs used in _SPI_RW: [wreg+status,2+status,0]
;SPI_RW@read_reg_addr stored from wreg
	line	333
	movwf	(SPI_RW@read_reg_addr)
	
l16940:	
;rf297L.c: 332: unsigned char i;
;rf297L.c: 333: for(i = 0; i < 8; i++)
	clrf	(SPI_RW@i)
	line	334
	
l5247:	
	line	335
;rf297L.c: 334: {
;rf297L.c: 335: RE1=0;
	bcf	(73/8),(73)&7
	line	336
;rf297L.c: 336: if(read_reg_addr & 0x80)
	btfss	(SPI_RW@read_reg_addr),(7)&7
	goto	u6171
	goto	u6170
u6171:
	goto	l5249
u6170:
	line	338
	
l16946:	
;rf297L.c: 337: {
;rf297L.c: 338: RA5=1;
	bsf	(45/8),(45)&7
	line	339
;rf297L.c: 339: }
	goto	l5250
	line	340
	
l5249:	
	line	342
;rf297L.c: 340: else
;rf297L.c: 341: {
;rf297L.c: 342: RA5=0;
	bcf	(45/8),(45)&7
	line	343
	
l5250:	
	line	344
;rf297L.c: 343: }
;rf297L.c: 344: read_reg_addr = read_reg_addr << 1;
	clrc
	rlf	(SPI_RW@read_reg_addr),f
	line	345
;rf297L.c: 345: RE1=1;
	bsf	(73/8),(73)&7
	line	346
;rf297L.c: 346: if( RA4 )
	btfss	(44/8),(44)&7
	goto	u6181
	goto	u6180
u6181:
	goto	l16950
u6180:
	line	348
	
l16948:	
;rf297L.c: 347: {
;rf297L.c: 348: read_reg_addr = read_reg_addr | 0x01;
	bsf	(SPI_RW@read_reg_addr)+(0/8),(0)&7
	line	333
	
l16950:	
	incf	(SPI_RW@i),f
	
l16952:	
	movlw	(08h)
	subwf	(SPI_RW@i),w
	skipc
	goto	u6191
	goto	u6190
u6191:
	goto	l5247
u6190:
	
l5248:	
	line	351
;rf297L.c: 349: }
;rf297L.c: 350: }
;rf297L.c: 351: RE1=0;
	bcf	(73/8),(73)&7
	line	352
	
l16954:	
;rf297L.c: 352: return read_reg_addr;
	movf	(SPI_RW@read_reg_addr),w
	line	353
	
l5252:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_RW
	__end_of_SPI_RW:
;; =============== function _SPI_RW ends ============

	signat	_SPI_RW,4217
	global	_SPI_init
psect	text1275,local,class=CODE,delta=2
global __ptext1275
__ptext1275:

;; *************** function _SPI_init *****************
;; Defined at:
;;		line 316 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_RF_Init
;; This function uses a non-reentrant model
;;
psect	text1275
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\rf297L.c"
	line	316
	global	__size_of_SPI_init
	__size_of_SPI_init	equ	__end_of_SPI_init-_SPI_init
	
_SPI_init:	
	opt	stack 4
; Regs used in _SPI_init: []
	line	318
	
l15044:	
;rf297L.c: 318: TRISE2 =0;
	bcf	(1098/8)^080h,(1098)&7
	line	319
;rf297L.c: 319: TRISE1=0;
	bcf	(1097/8)^080h,(1097)&7
	line	320
;rf297L.c: 320: TRISA5=0;
	bcf	(1069/8)^080h,(1069)&7
	line	321
;rf297L.c: 321: TRISA7 = 0;
	bcf	(1071/8)^080h,(1071)&7
	line	323
;rf297L.c: 323: TRISA3 = 1;
	bsf	(1067/8)^080h,(1067)&7
	line	324
;rf297L.c: 324: TRISA4=1;
	bsf	(1068/8)^080h,(1068)&7
	line	325
	
l5244:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_init
	__end_of_SPI_init:
;; =============== function _SPI_init ends ============

	signat	_SPI_init,88
	global	_channel_set
psect	text1276,local,class=CODE,delta=2
global __ptext1276
__ptext1276:

;; *************** function _channel_set *****************
;; Defined at:
;;		line 885 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\recive.c"
;; Parameters:    Size  Location     Type
;;  channel_num     1    wreg     unsigned char 
;;  status          1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel_num     1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1276
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\recive.c"
	line	885
	global	__size_of_channel_set
	__size_of_channel_set	equ	__end_of_channel_set-_channel_set
	
_channel_set:	
	opt	stack 5
; Regs used in _channel_set: [wreg-fsr0h+status,2+status,0]
;channel_set@channel_num stored from wreg
	movwf	(channel_set@channel_num)
	line	886
	
l15006:	
;recive.c: 886: switch(channel_num)
	goto	l15016
	line	888
;recive.c: 887: {
;recive.c: 888: case 0 :
	
l10114:	
	line	890
;recive.c: 889: {
;recive.c: 890: if(status)
	movf	(channel_set@status),w
	skipz
	goto	u3110
	goto	l10115
u3110:
	line	892
	
l15008:	
;recive.c: 891: {
;recive.c: 892: TRISB6 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	893
;recive.c: 893: RB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7
	line	894
;recive.c: 894: }
	goto	l10124
	line	895
	
l10115:	
	line	897
;recive.c: 895: else
;recive.c: 896: {
;recive.c: 897: TRISB6 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	898
;recive.c: 898: RB6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(54/8),(54)&7
	goto	l10124
	line	901
;recive.c: 901: case 1:
	
l10118:	
	line	903
;recive.c: 902: {
;recive.c: 903: if(status)
	movf	(channel_set@status),w
	skipz
	goto	u3120
	goto	l10119
u3120:
	line	905
	
l15010:	
;recive.c: 904: {
;recive.c: 905: TRISB5 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7
	line	906
;recive.c: 906: RB5 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(53/8),(53)&7
	line	907
;recive.c: 907: }
	goto	l10124
	line	908
	
l10119:	
	line	910
;recive.c: 908: else
;recive.c: 909: {
;recive.c: 910: TRISB5 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7
	line	911
;recive.c: 911: RB5 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(53/8),(53)&7
	goto	l10124
	line	914
;recive.c: 914: case 2:
	
l10121:	
	line	916
;recive.c: 915: {
;recive.c: 916: if(status)
	movf	(channel_set@status),w
	skipz
	goto	u3130
	goto	l10122
u3130:
	line	918
	
l15012:	
;recive.c: 917: {
;recive.c: 918: TRISB4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	919
;recive.c: 919: RB4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(52/8),(52)&7
	line	920
;recive.c: 920: }
	goto	l10124
	line	921
	
l10122:	
	line	923
;recive.c: 921: else
;recive.c: 922: {
;recive.c: 923: TRISB4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	924
;recive.c: 924: RB4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(52/8),(52)&7
	goto	l10124
	line	886
	
l15016:	
	movf	(channel_set@channel_num),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           13     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l10114
	xorlw	1^0	; case 1
	skipnz
	goto	l10118
	xorlw	2^1	; case 2
	skipnz
	goto	l10121
	goto	l10124
	opt asmopt_on

	line	928
	
l10124:	
	return
	opt stack 0
GLOBAL	__end_of_channel_set
	__end_of_channel_set:
;; =============== function _channel_set ends ============

	signat	_channel_set,8312
	global	_Enable_Interrupt
psect	text1277,local,class=CODE,delta=2
global __ptext1277
__ptext1277:

;; *************** function _Enable_Interrupt *****************
;; Defined at:
;;		line 38 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\system.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1277
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\system.c"
	line	38
	global	__size_of_Enable_Interrupt
	__size_of_Enable_Interrupt	equ	__end_of_Enable_Interrupt-_Enable_Interrupt
	
_Enable_Interrupt:	
	opt	stack 5
; Regs used in _Enable_Interrupt: []
	line	39
	
l15004:	
;system.c: 39: INTCON |= 0x80;
	bsf	(11)+(7/8),(7)&7	;volatile
	line	40
	
l1344:	
	return
	opt stack 0
GLOBAL	__end_of_Enable_Interrupt
	__end_of_Enable_Interrupt:
;; =============== function _Enable_Interrupt ends ============

	signat	_Enable_Interrupt,88
	global	_Timer1_start
psect	text1278,local,class=CODE,delta=2
global __ptext1278
__ptext1278:

;; *************** function _Timer1_start *****************
;; Defined at:
;;		line 45 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\timer1.c"
;; Parameters:    Size  Location     Type
;;  T_nums          2    3[COMMON] unsigned int 
;;  Timer1_ISR_e    1    5[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         3       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1278
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\timer1.c"
	line	45
	global	__size_of_Timer1_start
	__size_of_Timer1_start	equ	__end_of_Timer1_start-_Timer1_start
	
_Timer1_start:	
	opt	stack 5
; Regs used in _Timer1_start: [wreg]
	line	47
	
l14998:	
;timer1.c: 47: TMR1L = (unsigned char)(55532);
	movlw	(0ECh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(14)	;volatile
	line	48
;timer1.c: 48: TMR1H = (unsigned char)(55532>>8);
	movlw	(0D8h)
	movwf	(15)	;volatile
	line	49
	
l15000:	
;timer1.c: 49: PIR1 &= ~(0x01);
	bcf	(12)+(0/8),(0)&7	;volatile
	line	50
	
l15002:	
;timer1.c: 50: T1CON |= 0x01;
	bsf	(16)+(0/8),(0)&7	;volatile
	line	51
	
l2624:	
	return
	opt stack 0
GLOBAL	__end_of_Timer1_start
	__end_of_Timer1_start:
;; =============== function _Timer1_start ends ============

	signat	_Timer1_start,8312
	global	_Timer1_Init
psect	text1279,local,class=CODE,delta=2
global __ptext1279
__ptext1279:

;; *************** function _Timer1_Init *****************
;; Defined at:
;;		line 31 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\timer1.c"
;; Parameters:    Size  Location     Type
;;  TIMER1_DIVID    1    wreg     enum E560
;; Auto vars:     Size  Location     Type
;;  TIMER1_DIVID    1    3[COMMON] enum E560
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1279
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\timer1.c"
	line	31
	global	__size_of_Timer1_Init
	__size_of_Timer1_Init	equ	__end_of_Timer1_Init-_Timer1_Init
	
_Timer1_Init:	
	opt	stack 5
; Regs used in _Timer1_Init: [wreg+status,2+status,0]
;Timer1_Init@TIMER1_DIVIDER stored from wreg
	movwf	(Timer1_Init@TIMER1_DIVIDER)
	line	32
	
l14990:	
;timer1.c: 32: T1CON = 0x00;
	clrf	(16)	;volatile
	line	33
	
l14992:	
;timer1.c: 33: T1CON |= TIMER1_DIVIDER;
	movf	(Timer1_Init@TIMER1_DIVIDER),w
	iorwf	(16),f	;volatile
	line	34
	
l14994:	
;timer1.c: 34: INTCON |= (0x40);
	bsf	(11)+(6/8),(6)&7	;volatile
	line	35
	
l14996:	
;timer1.c: 35: PIE1 |= 0x01;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(140)^080h+(0/8),(0)&7	;volatile
	line	36
	
l2621:	
	return
	opt stack 0
GLOBAL	__end_of_Timer1_Init
	__end_of_Timer1_Init:
;; =============== function _Timer1_Init ends ============

	signat	_Timer1_Init,4216
	global	_key_Init
psect	text1280,local,class=CODE,delta=2
global __ptext1280
__ptext1280:

;; *************** function _key_Init *****************
;; Defined at:
;;		line 417 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\key_scan.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1280
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\key_scan.c"
	line	417
	global	__size_of_key_Init
	__size_of_key_Init	equ	__end_of_key_Init-_key_Init
	
_key_Init:	
	opt	stack 5
; Regs used in _key_Init: [wreg+status,2+status,0]
	line	418
	
l14986:	
;key_scan.c: 418: OPTION_REG &= ~0x80;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(129)^080h+(7/8),(7)&7	;volatile
	line	419
	
l14988:	
;key_scan.c: 419: TRISB |= 0x0e;
	movlw	(0Eh)
	iorwf	(134)^080h,f	;volatile
	line	420
;key_scan.c: 420: WPUB |= 0x0e;
	movlw	(0Eh)
	iorwf	(149)^080h,f	;volatile
	line	421
	
l7297:	
	return
	opt stack 0
GLOBAL	__end_of_key_Init
	__end_of_key_Init:
;; =============== function _key_Init ends ============

	signat	_key_Init,88
	global	_IIC_Init
psect	text1281,local,class=CODE,delta=2
global __ptext1281
__ptext1281:

;; *************** function _IIC_Init *****************
;; Defined at:
;;		line 11 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\iic.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1281
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\iic.c"
	line	11
	global	__size_of_IIC_Init
	__size_of_IIC_Init	equ	__end_of_IIC_Init-_IIC_Init
	
_IIC_Init:	
	opt	stack 5
; Regs used in _IIC_Init: []
	line	12
	
l14984:	
;iic.c: 12: OPTION_REG &= ~0x80;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(129)^080h+(7/8),(7)&7	;volatile
	line	14
;iic.c: 14: RC1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(57/8),(57)&7
	line	15
;iic.c: 15: RC2=1;
	bsf	(58/8),(58)&7
	line	16
	
l10767:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_Init
	__end_of_IIC_Init:
;; =============== function _IIC_Init ends ============

	signat	_IIC_Init,88
	global	_system_set_CPU_frequency
psect	text1282,local,class=CODE,delta=2
global __ptext1282
__ptext1282:

;; *************** function _system_set_CPU_frequency *****************
;; Defined at:
;;		line 19 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\system.c"
;; Parameters:    Size  Location     Type
;;  CPU_Frequenc    1    wreg     enum E551
;; Auto vars:     Size  Location     Type
;;  CPU_Frequenc    1    3[COMMON] enum E551
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1282
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\system.c"
	line	19
	global	__size_of_system_set_CPU_frequency
	__size_of_system_set_CPU_frequency	equ	__end_of_system_set_CPU_frequency-_system_set_CPU_frequency
	
_system_set_CPU_frequency:	
	opt	stack 5
; Regs used in _system_set_CPU_frequency: [wreg+status,2]
;system_set_CPU_frequency@CPU_Frequency stored from wreg
	movwf	(system_set_CPU_frequency@CPU_Frequency)
	line	20
	
l14980:	
;system.c: 20: OSCCON = CPU_Frequency;
	movf	(system_set_CPU_frequency@CPU_Frequency),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h
	line	21
	
l14982:	
;system.c: 21: OSCTUNE = 0X00;
	clrf	(144)^080h	;volatile
	line	22
	
l1335:	
	return
	opt stack 0
GLOBAL	__end_of_system_set_CPU_frequency
	__end_of_system_set_CPU_frequency:
;; =============== function _system_set_CPU_frequency ends ============

	signat	_system_set_CPU_frequency,4216
	global	_soft_delay_ms
psect	text1283,local,class=CODE,delta=2
global __ptext1283
__ptext1283:

;; *************** function _soft_delay_ms *****************
;; Defined at:
;;		line 10 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\delay.c"
;; Parameters:    Size  Location     Type
;;  ms              2    3[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2    0[BANK0 ] volatile unsigned int 
;;  k               1    3[BANK0 ] volatile unsigned char 
;;  j               1    2[BANK0 ] volatile unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         0       4       0
;;      Temps:          0       0       0
;;      Totals:         2       4       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_loadPowerOnEeprom
;;		_main
;;		_RF_Set_RxMode
;;		_sledBlink
;;		_key_scan
;;		_key_value_read
;;		_recive_task
;;		_AT24C02_Write_Msg
;;		_AT24C02_Read_Msg
;; This function uses a non-reentrant model
;;
psect	text1283
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\delay.c"
	line	10
	global	__size_of_soft_delay_ms
	__size_of_soft_delay_ms	equ	__end_of_soft_delay_ms-_soft_delay_ms
	
_soft_delay_ms:	
	opt	stack 2
; Regs used in _soft_delay_ms: [wreg+status,2+status,0]
	line	14
	
l14954:	
;delay.c: 12: volatile unsigned int i;
;delay.c: 13: volatile unsigned char j,k;
;delay.c: 14: for(i=0;i<ms;i++){
	clrf	(soft_delay_ms@i)	;volatile
	clrf	(soft_delay_ms@i+1)	;volatile
	goto	l14978
	line	15
	
l14956:	
;delay.c: 15: for(j=0;j<10;j++){
	clrf	(soft_delay_ms@j)	;volatile
	
l14958:	
	movlw	(0Ah)
	subwf	(soft_delay_ms@j),w	;volatile
	skipc
	goto	u3081
	goto	u3080
u3081:
	goto	l14962
u3080:
	goto	l14976
	line	16
	
l14962:	
;delay.c: 16: for(k=0;k<32;k++);
	clrf	(soft_delay_ms@k)	;volatile
	
l14964:	
	movlw	(020h)
	subwf	(soft_delay_ms@k),w	;volatile
	skipc
	goto	u3091
	goto	u3090
u3091:
	goto	l14968
u3090:
	goto	l14972
	
l14968:	
	incf	(soft_delay_ms@k),f	;volatile
	goto	l14964
	line	15
	
l14972:	
	incf	(soft_delay_ms@j),f	;volatile
	goto	l14958
	line	14
	
l14976:	
	incf	(soft_delay_ms@i),f	;volatile
	skipnz
	incf	(soft_delay_ms@i+1),f	;volatile
	
l14978:	
	movf	(soft_delay_ms@ms+1),w
	subwf	(soft_delay_ms@i+1),w	;volatile
	skipz
	goto	u3105
	movf	(soft_delay_ms@ms),w
	subwf	(soft_delay_ms@i),w	;volatile
u3105:
	skipc
	goto	u3101
	goto	u3100
u3101:
	goto	l14956
u3100:
	line	19
	
l5901:	
	return
	opt stack 0
GLOBAL	__end_of_soft_delay_ms
	__end_of_soft_delay_ms:
;; =============== function _soft_delay_ms ends ============

	signat	_soft_delay_ms,4216
	global	_ISR
psect	text1284,local,class=CODE,delta=2
global __ptext1284
__ptext1284:

;; *************** function _ISR *****************
;; Defined at:
;;		line 48 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\system.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  peripheral_i    1    2[COMMON] unsigned char 
;;  inside_intte    1    0        unsigned char 
;;  peripheral_i    1    0        unsigned char 
;;  inside_intte    1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          2       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_TIMER1_ISR
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text1284
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\system.c"
	line	48
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 0
; Regs used in _ISR: [wreg+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text1284
	line	53
	
i1l15018:	
;system.c: 49: unsigned char inside_intterrupt_enable,peripheral_intterrupt_enable;
;system.c: 50: unsigned char inside_intterrupt_touch,peripheral_intterrupt_touch;
;system.c: 53: inside_intterrupt_enable = INTCON & 0x38;
	movf	(11),w
	line	54
;system.c: 54: peripheral_intterrupt_enable = PIE1 & 0x43;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(140)^080h,w
	line	55
;system.c: 55: inside_intterrupt_touch = INTCON & 0x07;
	movf	(11),w
	line	56
;system.c: 56: peripheral_intterrupt_touch = PIR1 & 0x43;
	bcf	status, 5	;RP0=0, select bank0
	movf	(12),w
	movwf	(ISR@peripheral_intterrupt_touch)
	
i1l15020:	
	movlw	(043h)
	andwf	(ISR@peripheral_intterrupt_touch),f
	line	71
	
i1l15022:	
;system.c: 71: if(peripheral_intterrupt_touch & TIMER1_ISR_TOUCH) {
	btfss	(ISR@peripheral_intterrupt_touch),(0)&7
	goto	u314_21
	goto	u314_20
u314_21:
	goto	i1l1351
u314_20:
	line	72
	
i1l15024:	
;system.c: 72: TIMER1_ISR();
	fcall	_TIMER1_ISR
	line	82
	
i1l1351:	
	movf	(??_ISR+1),w
	movwf	pclath
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
	global	_TIMER1_ISR
psect	text1285,local,class=CODE,delta=2
global __ptext1285
__ptext1285:

;; *************** function _TIMER1_ISR *****************
;; Defined at:
;;		line 62 in file "C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\timer1.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text1285
	file	"C:\item\pan2416\gitforpan2416\PAV03new\FWSWES-PAV03-SCENESWITCHES-PAN2416AV\src\timer1.c"
	line	62
	global	__size_of_TIMER1_ISR
	__size_of_TIMER1_ISR	equ	__end_of_TIMER1_ISR-_TIMER1_ISR
	
_TIMER1_ISR:	
	opt	stack 0
; Regs used in _TIMER1_ISR: [wreg+status,2+status,0]
	line	65
	
i1l15026:	
;timer1.c: 63: static unsigned int flag_1s_add=0;
;timer1.c: 64: static unsigned int flag_1min_add=0;
;timer1.c: 65: T1CON &= ~(0x01);
	bcf	(16)+(0/8),(0)&7	;volatile
	line	66
	
i1l15028:	
;timer1.c: 66: TMR1L = (unsigned char)(55532);
	movlw	(0ECh)
	movwf	(14)	;volatile
	line	67
;timer1.c: 67: TMR1H = (unsigned char)(55532>>8);
	movlw	(0D8h)
	movwf	(15)	;volatile
	line	69
	
i1l15030:	
;timer1.c: 69: flag_time_key0_add++;
	incf	(_flag_time_key0_add),f
	skipnz
	incf	(_flag_time_key0_add+1),f
	line	70
	
i1l15032:	
;timer1.c: 70: flag_time_key1_add++;
	incf	(_flag_time_key1_add),f
	skipnz
	incf	(_flag_time_key1_add+1),f
	line	71
	
i1l15034:	
;timer1.c: 71: flag_time_key2_add++;
	incf	(_flag_time_key2_add),f
	skipnz
	incf	(_flag_time_key2_add+1),f
	line	72
	
i1l15036:	
;timer1.c: 72: flag_5s_add++;
	incf	(_flag_5s_add),f
	skipnz
	incf	(_flag_5s_add+1),f
	line	73
	
i1l15038:	
;timer1.c: 74: flag_1s_add++;
	incf	(_flag_5min_add),f
	skipnz
	incf	(_flag_5min_add+1),f
	line	76
	
i1l15040:	
;timer1.c: 76: PIR1 &= ~(0x01);
	bcf	(12)+(0/8),(0)&7	;volatile
	line	77
	
i1l15042:	
;timer1.c: 77: T1CON |= 0x01;
	bsf	(16)+(0/8),(0)&7	;volatile
	line	78
	
i1l2634:	
	return
	opt stack 0
GLOBAL	__end_of_TIMER1_ISR
	__end_of_TIMER1_ISR:
;; =============== function _TIMER1_ISR ends ============

	signat	_TIMER1_ISR,88
psect	text1286,local,class=CODE,delta=2
global __ptext1286
__ptext1286:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
