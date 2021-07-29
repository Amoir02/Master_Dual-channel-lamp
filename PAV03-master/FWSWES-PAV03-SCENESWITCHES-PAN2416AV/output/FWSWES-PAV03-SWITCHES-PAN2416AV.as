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
	FNCALL	_recive_task,_AT24C02_Write_Byte
	FNCALL	_recive_task,_soft_delay_ms
	FNCALL	_recive_task,___bmul
	FNCALL	_recive_task,_AT24C02_Read_Msg
	FNCALL	_recive_task,_rx_data
	FNCALL	_recive_task,_AT24C02_Write_Msg
	FNCALL	_recive_task,_RF_ClearFIFO
	FNCALL	_recive_task,_RF_ClearStatus
	FNCALL	_loadParamsFromEeprom,___bmul
	FNCALL	_loadParamsFromEeprom,_AT24C02_Read_Msg
	FNCALL	_rx_data,_RF_RxData
	FNCALL	_rx_data,_UpdateCRC
	FNCALL	_AT24C02_Read_Msg,_AT24C02_Read_Byte
	FNCALL	_AT24C02_Read_Msg,_soft_delay_ms
	FNCALL	_AT24C02_Read_Byte,_IIC_START
	FNCALL	_AT24C02_Read_Byte,_I2C_SendByte
	FNCALL	_AT24C02_Read_Byte,_IIC_Wait_ACK
	FNCALL	_AT24C02_Read_Byte,_I2C_ReadByte
	FNCALL	_AT24C02_Read_Byte,_IIC_STOP
	FNCALL	_AT24C02_Write_Msg,_AT24C02_Write_Byte
	FNCALL	_AT24C02_Write_Msg,_soft_delay_ms
	FNCALL	_RF_RxData,_RF_GetStatus
	FNCALL	_RF_RxData,_RF_Read_Buff
	FNCALL	_RF_RxData,_RF_ClearFIFO
	FNCALL	_RF_RxData,_RF_ClearStatus
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
	FNCALL	_key_value_read,_key_scan
	FNCALL	_key_value_read,_soft_delay_ms
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
	FNROOT	_main
	FNCALL	_ISR,_TIMER1_ISR
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_match_channel_flag
	global	_sys_stute
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\key_scan.c"
	line	24

;initializer for _match_channel_flag
	retlw	010h
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\recive.c"
	line	36

;initializer for _sys_stute
	retlw	02h
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
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\recive.c"
	line	21
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
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\recive.c"
	line	19
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
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\recive.c"
	line	20
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
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
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
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
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
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
	line	384
RF_Carrier@BB_cal_data:
	retlw	0Ah
	retlw	06Dh
	retlw	067h
	retlw	09Ch
	retlw	046h
	global	RF_Init@BB_cal_data
psect	strings
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
	line	62
RF_Init@BB_cal_data:
	retlw	0Ah
	retlw	06Dh
	retlw	067h
	retlw	09Ch
	retlw	046h
	global	RF_Carrier@Dem_cal2_data
psect	strings
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
	line	388
RF_Carrier@Dem_cal2_data:
	retlw	0Bh
	retlw	0DFh
	retlw	02h
	global	RF_Carrier@RF_cal_data
psect	strings
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
	line	385
RF_Carrier@RF_cal_data:
	retlw	016h
	retlw	033h
	retlw	027h
	global	RF_Init@Dem_cal2_data
psect	strings
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
	line	66
RF_Init@Dem_cal2_data:
	retlw	0Bh
	retlw	0DFh
	retlw	02h
	global	RF_Init@RF_cal_data
psect	strings
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
	line	63
RF_Init@RF_cal_data:
	retlw	016h
	retlw	033h
	retlw	027h
	global	_RX_ADDRESS_DEF
psect	strings
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
	line	7
_RX_ADDRESS_DEF:
	retlw	02Dh
	retlw	0D7h
	retlw	0B9h
	global	_TX_ADDRESS_DEF
psect	strings
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
	line	6
_TX_ADDRESS_DEF:
	retlw	0CCh
	retlw	0CCh
	retlw	0CCh
	global	RF_Carrier@Dem_cal_data
psect	strings
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
	line	387
RF_Carrier@Dem_cal_data:
	retlw	0E1h
	global	RF_Init@Dem_cal_data
psect	strings
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
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
	global	_ADC_digital_value
	global	_Timer1_set_time
	global	_flag_5min_add
	global	_flag_5s_add
	global	_flag_time_key0_add
	global	_flag_time_key1_add
	global	_flag_time_key2_add
	global	_Timer0_set_time
	global	_delay_flag
	global	_last_PORTB_value
	global	_KEY0_FLAG
	global	_KEY1_FLAG
	global	_KEY2_FLAG
	global	_key_long_flag
	global	_key_long_flag_add
	global	_virtual_timer_group
	global	_rf_buf
	global	_channel_flag
	global	_control_id
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
	file	"FWSWES-PAV03-SWITCHES-PAN2416AV.as"
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

_key_long_flag:
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

_ADC_digital_value:
       ds      2

_Timer1_set_time:
       ds      2

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

_Timer0_set_time:
       ds      1

_delay_flag:
       ds      1

_last_PORTB_value:
       ds      1

_rf_buf:
       ds      18

_channel_flag:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\key_scan.c"
	line	24
_match_channel_flag:
       ds      1

psect	dataBANK0
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\recive.c"
	line	36
_sys_stute:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_virtual_timer_group:
       ds      6

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
	movlw	low((__pbssBANK0)+030h)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+04Eh)
	fcall	clear_ram
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
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
	global	??_system_set_CPU_frequency
??_system_set_CPU_frequency:	; 0 bytes @ 0x3
	global	?_soft_delay_ms
?_soft_delay_ms:	; 0 bytes @ 0x3
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
	global	??_delay_task
??_delay_task:	; 0 bytes @ 0x3
	global	??_SPI_init
??_SPI_init:	; 0 bytes @ 0x3
	global	??_SPI_RW
??_SPI_RW:	; 0 bytes @ 0x3
	global	??_iic_delay_us
??_iic_delay_us:	; 0 bytes @ 0x3
	global	?___bmul
?___bmul:	; 1 bytes @ 0x3
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
	global	??_key_value_read
??_key_value_read:	; 0 bytes @ 0x5
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
	global	??_RF_WriteReg
??_RF_WriteReg:	; 0 bytes @ 0x6
	global	??_RF_ClearFIFO
??_RF_ClearFIFO:	; 0 bytes @ 0x6
	global	??_RF_ClearStatus
??_RF_ClearStatus:	; 0 bytes @ 0x6
	global	??_AT24C02_Write_Byte
??_AT24C02_Write_Byte:	; 0 bytes @ 0x6
	global	??_loadParamsFromEeprom
??_loadParamsFromEeprom:	; 0 bytes @ 0x6
	global	??_main
??_main:	; 0 bytes @ 0x6
	global	??_I2C_ReadByte
??_I2C_ReadByte:	; 0 bytes @ 0x6
	global	??_AT24C02_Read_Byte
??_AT24C02_Read_Byte:	; 0 bytes @ 0x6
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_Timer1_start
??_Timer1_start:	; 0 bytes @ 0x0
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
	global	I2C_ReadByte@data
I2C_ReadByte@data:	; 2 bytes @ 0x1
	ds	1
	global	RF_Read_Buff@reg_addr
RF_Read_Buff@reg_addr:	; 1 bytes @ 0x2
	global	RF_Write_Buff@reg_addr
RF_Write_Buff@reg_addr:	; 1 bytes @ 0x2
	global	soft_delay_ms@j
soft_delay_ms@j:	; 1 bytes @ 0x2
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
	global	AT24C02_Read_Msg@addr
AT24C02_Read_Msg@addr:	; 1 bytes @ 0x9
	ds	1
	global	AT24C02_Read_Msg@i
AT24C02_Read_Msg@i:	; 1 bytes @ 0xA
	ds	1
	global	loadParamsFromEeprom@i
loadParamsFromEeprom@i:	; 1 bytes @ 0xB
	global	rx_data@crc16
rx_data@crc16:	; 2 bytes @ 0xB
	ds	2
	global	rx_data@rand
rx_data@rand:	; 1 bytes @ 0xD
	ds	1
	global	rx_data@rx_flag
rx_data@rx_flag:	; 1 bytes @ 0xE
	ds	1
	global	rx_data@i
rx_data@i:	; 1 bytes @ 0xF
	ds	1
	global	??_recive_task
??_recive_task:	; 0 bytes @ 0x10
	ds	4
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
;;Data sizes: Strings 0, constant 121, data 2, bss 131, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6      11
;; BANK0           80     29      79
;; BANK1           80      0      78

;;
;; Pointer list with targets:

;; ?_I2C_ReadByte	unsigned int  size(1) Largest target is 0
;;
;; ?_UpdateCRC	unsigned short  size(1) Largest target is 0
;;
;; AT24C02_Read_Msg@data	PTR unsigned char  size(1) Largest target is 72
;;		 -> channel_flag(BANK0[1]), control_id(BANK1[72]), 
;;
;; AT24C02_Write_Msg@data	PTR unsigned char  size(1) Largest target is 72
;;		 -> recive_task@msg(BANK0[6]), channel_flag(BANK0[1]), control_id(BANK1[72]), 
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
;;   _AT24C02_Write_Msg->___bmul
;;   _RF_RxData->_RF_Read_Buff
;;   _I2C_ReadByte->_iic_delay_us
;;   _AT24C02_Write_Byte->_I2C_SendByte
;;   _RF_ClearStatus->_RF_WriteReg
;;   _RF_ClearFIFO->_RF_WriteReg
;;   _key_value_read->_soft_delay_ms
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
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_recive_task
;;   _recive_task->_rx_data
;;   _loadParamsFromEeprom->_AT24C02_Read_Msg
;;   _rx_data->_UpdateCRC
;;   _AT24C02_Read_Msg->_AT24C02_Read_Byte
;;   _AT24C02_Read_Byte->_I2C_ReadByte
;;   _AT24C02_Write_Msg->_soft_delay_ms
;;   _RF_RxData->_RF_Read_Buff
;;   _RF_ClearStatus->_RF_WriteReg
;;   _RF_ClearFIFO->_RF_WriteReg
;;   _RF_GetStatus->_RF_ReadReg
;;   _key_value_read->_soft_delay_ms
;;   _RF_Set_RxMode->_soft_delay_ms
;;   _RF_Init->_RF_Write_Buff
;;   _key_scan->_soft_delay_ms
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
;; (0) _main                                                 0     0      0   12939
;;           _system_set_CPU_frequency
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
;; (1) _recive_task                                         13    13      0   10584
;;                                             16 BANK0     13    13      0
;;                 _AT24C02_Write_Byte
;;                      _soft_delay_ms
;;                             ___bmul
;;                   _AT24C02_Read_Msg
;;                            _rx_data
;;                  _AT24C02_Write_Msg
;;                       _RF_ClearFIFO
;;                     _RF_ClearStatus
;; ---------------------------------------------------------------------------------
;; (1) _loadParamsFromEeprom                                 1     1      0     897
;;                                             11 BANK0      1     1      0
;;                             ___bmul
;;                   _AT24C02_Read_Msg
;; ---------------------------------------------------------------------------------
;; (2) _rx_data                                              8     8      0    1697
;;                                              8 BANK0      8     8      0
;;                          _RF_RxData
;;                          _UpdateCRC
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
;; (2) _AT24C02_Write_Msg                                    5     3      2     533
;;                                              4 BANK0      5     3      2
;;                 _AT24C02_Write_Byte
;;                      _soft_delay_ms
;;                             ___bmul (ARG)
;; ---------------------------------------------------------------------------------
;; (3) _RF_RxData                                            3     2      1     956
;;                                              4 BANK0      3     2      1
;;                       _RF_GetStatus
;;                       _RF_Read_Buff
;;                       _RF_ClearFIFO
;;                     _RF_ClearStatus
;; ---------------------------------------------------------------------------------
;; (4) _I2C_ReadByte                                         6     4      2     158
;;                                              4 COMMON     2     0      2
;;                                              0 BANK0      4     4      0
;;                       _iic_delay_us
;;                           _IIC_NACK
;;                            _IIC_ACK
;; ---------------------------------------------------------------------------------
;; (3) _AT24C02_Write_Byte                                   2     1      1     228
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
;; (1) _key_value_read                                       0     0      0     276
;;                           _key_scan
;;                      _soft_delay_ms
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
;; (4) _I2C_SendByte                                         2     2      0      91
;;                                              4 COMMON     2     2      0
;;                       _iic_delay_us
;; ---------------------------------------------------------------------------------
;; (5) _IIC_NACK                                             0     0      0      22
;;                       _iic_delay_us
;; ---------------------------------------------------------------------------------
;; (5) _IIC_ACK                                              0     0      0      22
;;                       _iic_delay_us
;; ---------------------------------------------------------------------------------
;; (4) _IIC_Wait_ACK                                         1     1      0      31
;;                                              4 COMMON     1     1      0
;;                       _iic_delay_us
;; ---------------------------------------------------------------------------------
;; (4) _IIC_STOP                                             0     0      0      22
;;                       _iic_delay_us
;; ---------------------------------------------------------------------------------
;; (4) _IIC_START                                            0     0      0      22
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
;; (2) ___bmul                                               3     2      1      92
;;                                              3 COMMON     3     2      1
;; ---------------------------------------------------------------------------------
;; (5) _iic_delay_us                                         1     1      0      22
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
;; (1) _delay_task                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _channel_set                                          2     1      1      88
;;                                              3 COMMON     2     1      1
;; ---------------------------------------------------------------------------------
;; (1) _Enable_Interrupt                                     0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _Timer1_start                                         5     2      3      44
;;                                              3 COMMON     3     0      3
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _Timer1_Init                                          1     1      0      22
;;                                              3 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _key_Init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _IIC_Init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _soft_delay_ms                                        6     4      2     138
;;                                              3 COMMON     2     0      2
;;                                              0 BANK0      4     4      0
;; ---------------------------------------------------------------------------------
;; (1) _system_set_CPU_frequency                             1     1      0      22
;;                                              3 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
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
;;     _RF_ClearFIFO
;;       _RF_WriteReg
;;         _SPI_RW
;;     _RF_ClearStatus
;;       _RF_WriteReg
;;         _SPI_RW
;;   _key_value_read
;;     _key_scan
;;       _soft_delay_ms
;;     _soft_delay_ms
;;   _delay_task
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
;;BANK1               50      0      4E       7       97.5%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      B2       8        0.0%
;;ABS                  0      0      A8       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       A       2        0.0%
;;BANK0               50     1D      4F       5       98.8%
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
;;		line 78 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\main.c"
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
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\main.c"
	line	78
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	79
	
l17736:	
;main.c: 79: system_set_CPU_frequency(CPU_FREQUENCY_8M);
	movlw	(071h)
	fcall	_system_set_CPU_frequency
	line	80
;main.c: 80: soft_delay_ms(500);
	movlw	low(01F4h)
	movwf	(?_soft_delay_ms)
	movlw	high(01F4h)
	movwf	((?_soft_delay_ms))+1
	fcall	_soft_delay_ms
	line	81
	
l17738:	
# 81 "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\main.c"
nop ;#
psect	maintext
	line	84
	
l17740:	
;main.c: 84: TRISC = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	85
	
l17742:	
;main.c: 85: TRISB |= 0x70;
	movlw	(070h)
	iorwf	(134)^080h,f	;volatile
	line	87
	
l17744:	
;main.c: 87: RC0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	89
	
l17746:	
;main.c: 89: IIC_Init();
	fcall	_IIC_Init
	line	90
	
l17748:	
;main.c: 90: key_Init();
	fcall	_key_Init
	line	91
	
l17750:	
;main.c: 91: RF_Init();
	fcall	_RF_Init
	line	92
	
l17752:	
;main.c: 92: RF_Set_RxMode();
	fcall	_RF_Set_RxMode
	line	94
	
l17754:	
;main.c: 94: Timer1_Init(TIMER1_DIV_8);
	movlw	(030h)
	fcall	_Timer1_Init
	line	95
	
l17756:	
;main.c: 95: Timer1_start(10000, 0);
	movlw	low(02710h)
	movwf	(?_Timer1_start)
	movlw	high(02710h)
	movwf	((?_Timer1_start))+1
	clrf	0+(?_Timer1_start)+02h
	fcall	_Timer1_start
	line	97
	
l17758:	
;main.c: 97: loadParamsFromEeprom();
	fcall	_loadParamsFromEeprom
	line	99
	
l17760:	
;main.c: 99: Enable_Interrupt();
	fcall	_Enable_Interrupt
	line	101
	
l17762:	
;main.c: 101: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l17764:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	102
	
l17766:	
;main.c: 102: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	103
	
l17768:	
;main.c: 103: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l17770:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	107
	
l17772:	
;main.c: 106: {
;main.c: 107: channel_set(0, KEY0.channel_status);
	movf	(_KEY0),w
	movwf	(?_channel_set)
	movlw	(0)
	fcall	_channel_set
	line	108
	
l17774:	
;main.c: 108: channel_set(1, KEY1.channel_status);
	movf	(_KEY1),w
	movwf	(?_channel_set)
	movlw	(01h)
	fcall	_channel_set
	line	109
	
l17776:	
;main.c: 109: channel_set(2, KEY2.channel_status);
	movf	(_KEY2),w
	movwf	(?_channel_set)
	movlw	(02h)
	fcall	_channel_set
	line	111
	
l17778:	
;main.c: 111: recive_task();
	fcall	_recive_task
	line	113
	
l17780:	
;main.c: 113: key_value_read();
	fcall	_key_value_read
	line	115
	
l17782:	
;main.c: 115: delay_task();
	fcall	_delay_task
	goto	l17772
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	117
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_recive_task
psect	text1128,local,class=CODE,delta=2
global __ptext1128
__ptext1128:

;; *************** function _recive_task *****************
;; Defined at:
;;		line 123 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\recive.c"
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
;;		_rx_data
;;		_AT24C02_Write_Msg
;;		_RF_ClearFIFO
;;		_RF_ClearStatus
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1128
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\recive.c"
	line	123
	global	__size_of_recive_task
	__size_of_recive_task	equ	__end_of_recive_task-_recive_task
	
_recive_task:	
	opt	stack 0
; Regs used in _recive_task: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	124
	
l16900:	
	line	126
;recive.c: 126: unsigned char match_flag = 0;
	clrf	(recive_task@match_flag)
	line	127
;recive.c: 127: unsigned char flag = 0;
	clrf	(recive_task@flag)
	line	130
;recive.c: 128: unsigned char msg[6];
;recive.c: 130: switch(sys_stute)
	goto	l17734
	line	132
;recive.c: 131: {
;recive.c: 132: case 3:
	
l9826:	
	line	134
;recive.c: 133: {
;recive.c: 134: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	135
	
l16902:	
;recive.c: 135: if(key_long_flag == 0x11)
	movf	(_key_long_flag),w
	xorlw	011h
	skipz
	goto	u5551
	goto	u5550
u5551:
	goto	l16916
u5550:
	line	137
	
l16904:	
;recive.c: 136: {
;recive.c: 137: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	138
;recive.c: 138: KEY0.key_flag_5s = 0;
	clrf	0+(_KEY0)+02h
	line	139
;recive.c: 139: for(i = 0; i < 18; i++)
	clrf	(recive_task@i)
	
l16906:	
	movlw	(012h)
	subwf	(recive_task@i),w
	skipc
	goto	u5561
	goto	u5560
u5561:
	goto	l16910
u5560:
	goto	l16948
	line	141
	
l16910:	
;recive.c: 140: {
;recive.c: 141: AT24C02_Write_Byte(i + 0, 0xff);
	movlw	(0FFh)
	movwf	(?_AT24C02_Write_Byte)
	movf	(recive_task@i),w
	fcall	_AT24C02_Write_Byte
	line	142
;recive.c: 142: soft_delay_ms(1);
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	139
	
l16912:	
	incf	(recive_task@i),f
	goto	l16906
	line	145
	
l16916:	
;recive.c: 145: else if(key_long_flag == 0x21)
	movf	(_key_long_flag),w
	xorlw	021h
	skipz
	goto	u5571
	goto	u5570
u5571:
	goto	l16932
u5570:
	line	147
	
l16918:	
;recive.c: 146: {
;recive.c: 147: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	148
;recive.c: 148: KEY1.key_flag_5s = 0;
	clrf	0+(_KEY1)+02h
	line	149
	
l16920:	
;recive.c: 149: for(i = 18; i < 36; i++)
	movlw	(012h)
	movwf	(recive_task@i)
	
l16922:	
	movlw	(024h)
	subwf	(recive_task@i),w
	skipc
	goto	u5581
	goto	u5580
u5581:
	goto	l16926
u5580:
	goto	l16948
	line	151
	
l16926:	
;recive.c: 150: {
;recive.c: 151: AT24C02_Write_Byte(i, 0xff);
	movlw	(0FFh)
	movwf	(?_AT24C02_Write_Byte)
	movf	(recive_task@i),w
	fcall	_AT24C02_Write_Byte
	line	152
;recive.c: 152: soft_delay_ms(1);
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	149
	
l16928:	
	incf	(recive_task@i),f
	goto	l16922
	line	155
	
l16932:	
;recive.c: 155: else if(key_long_flag == 0x41)
	movf	(_key_long_flag),w
	xorlw	041h
	skipz
	goto	u5591
	goto	u5590
u5591:
	goto	l16948
u5590:
	line	157
	
l16934:	
;recive.c: 156: {
;recive.c: 157: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	158
;recive.c: 158: KEY2.key_flag_5s = 0;
	clrf	0+(_KEY2)+02h
	line	159
	
l16936:	
;recive.c: 159: for(i = 36; i < 54; i++)
	movlw	(024h)
	movwf	(recive_task@i)
	
l16938:	
	movlw	(036h)
	subwf	(recive_task@i),w
	skipc
	goto	u5601
	goto	u5600
u5601:
	goto	l16942
u5600:
	goto	l16948
	line	161
	
l16942:	
;recive.c: 160: {
;recive.c: 161: AT24C02_Write_Byte(i, 0xff);
	movlw	(0FFh)
	movwf	(?_AT24C02_Write_Byte)
	movf	(recive_task@i),w
	fcall	_AT24C02_Write_Byte
	line	162
;recive.c: 162: soft_delay_ms(1);
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	159
	
l16944:	
	incf	(recive_task@i),f
	goto	l16938
	line	166
	
l16948:	
;recive.c: 163: }
;recive.c: 164: }
;recive.c: 166: for(i = 54; i < 72; i++)
	movlw	(036h)
	movwf	(recive_task@i)
	movlw	(048h)
	subwf	(recive_task@i),w
	skipc
	goto	u5611
	goto	u5610
u5611:
	goto	l16952
u5610:
	goto	l16958
	line	168
	
l16952:	
;recive.c: 167: {
;recive.c: 168: AT24C02_Write_Byte(i, 0x00);
	clrf	(?_AT24C02_Write_Byte)
	movf	(recive_task@i),w
	fcall	_AT24C02_Write_Byte
	line	169
;recive.c: 169: soft_delay_ms(1);
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	166
	
l16954:	
	incf	(recive_task@i),f
	
l16956:	
	movlw	(048h)
	subwf	(recive_task@i),w
	skipc
	goto	u5621
	goto	u5620
u5621:
	goto	l16952
u5620:
	line	172
	
l16958:	
;recive.c: 170: }
;recive.c: 172: for(i = 0; i < 12; i++)
	clrf	(recive_task@i)
	
l16960:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u5631
	goto	u5630
u5631:
	goto	l16964
u5630:
	goto	l9841
	line	174
	
l16964:	
;recive.c: 173: {
;recive.c: 174: AT24C02_Read_Msg(i * 6, control_id[i], 6);
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
	line	172
	
l16966:	
	incf	(recive_task@i),f
	goto	l16960
	
l9841:	
	line	176
;recive.c: 175: }
;recive.c: 176: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	177
	
l16970:	
;recive.c: 177: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	178
	
l16972:	
;recive.c: 178: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l16974:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	179
;recive.c: 179: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	180
	
l16976:	
;recive.c: 180: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l16978:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	181
;recive.c: 181: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	182
	
l16980:	
;recive.c: 182: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l16982:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	183
	
l16984:	
;recive.c: 183: sys_stute=1;
	clrf	(_sys_stute)
	incf	(_sys_stute),f
	line	184
;recive.c: 184: }break;
	goto	l10035
	line	186
;recive.c: 186: case 2:
	
l9843:	
	line	188
;recive.c: 187: {
;recive.c: 188: match_channel_flag |= 0x01;
	bsf	(_match_channel_flag)+(0/8),(0)&7
	line	189
	
l16986:	
;recive.c: 189: if(key_long_flag == 0x11)
	movf	(_key_long_flag),w
	xorlw	011h
	skipz
	goto	u5641
	goto	u5640
u5641:
	goto	l16992
u5640:
	line	191
	
l16988:	
;recive.c: 190: {
;recive.c: 191: KEY0.key_flag_3s = 0;
	clrf	0+(_KEY0)+01h
	line	192
;recive.c: 192: flag_5s_add = 0;
	clrf	(_flag_5s_add)
	clrf	(_flag_5s_add+1)
	line	193
;recive.c: 193: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	194
	
l16990:	
;recive.c: 194: match_channel_flag = 0x10;
	movlw	(010h)
	movwf	(_match_channel_flag)
	line	195
;recive.c: 195: }
	goto	l17004
	line	196
	
l16992:	
;recive.c: 196: else if(key_long_flag == 0x21)
	movf	(_key_long_flag),w
	xorlw	021h
	skipz
	goto	u5651
	goto	u5650
u5651:
	goto	l16998
u5650:
	line	198
	
l16994:	
;recive.c: 197: {
;recive.c: 198: KEY1.key_flag_3s = 0;
	clrf	0+(_KEY1)+01h
	line	199
;recive.c: 199: flag_5s_add = 0;
	clrf	(_flag_5s_add)
	clrf	(_flag_5s_add+1)
	line	200
;recive.c: 200: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	201
	
l16996:	
;recive.c: 201: match_channel_flag = 0x20;
	movlw	(020h)
	movwf	(_match_channel_flag)
	line	202
;recive.c: 202: }
	goto	l17004
	line	203
	
l16998:	
;recive.c: 203: else if(key_long_flag == 0x41)
	movf	(_key_long_flag),w
	xorlw	041h
	skipz
	goto	u5661
	goto	u5660
u5661:
	goto	l17004
u5660:
	line	205
	
l17000:	
;recive.c: 204: {
;recive.c: 205: KEY2.key_flag_3s = 0;
	clrf	0+(_KEY2)+01h
	line	206
;recive.c: 206: flag_5s_add = 0;
	clrf	(_flag_5s_add)
	clrf	(_flag_5s_add+1)
	line	207
;recive.c: 207: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	208
	
l17002:	
;recive.c: 208: match_channel_flag = 0x40;
	movlw	(040h)
	movwf	(_match_channel_flag)
	line	218
	
l17004:	
;recive.c: 209: }
;recive.c: 218: if(rx_data())
	fcall	_rx_data
	xorlw	0
	skipnz
	goto	u5671
	goto	u5670
u5671:
	goto	l17398
u5670:
	line	220
	
l17006:	
;recive.c: 219: {
;recive.c: 220: msg[0] = rf_buf[3];
	movf	0+(_rf_buf)+03h,w
	movwf	(recive_task@msg)
	line	221
;recive.c: 221: msg[1] = rf_buf[4];
	movf	0+(_rf_buf)+04h,w
	movwf	0+(recive_task@msg)+01h
	line	222
;recive.c: 222: msg[2] = rf_buf[5];
	movf	0+(_rf_buf)+05h,w
	movwf	0+(recive_task@msg)+02h
	line	223
;recive.c: 223: msg[3] = rf_buf[6];
	movf	0+(_rf_buf)+06h,w
	movwf	0+(recive_task@msg)+03h
	line	224
;recive.c: 224: msg[4] = rf_buf[10];
	movf	0+(_rf_buf)+0Ah,w
	movwf	0+(recive_task@msg)+04h
	line	225
;recive.c: 225: msg[5] = rf_buf[2];
	movf	0+(_rf_buf)+02h,w
	movwf	0+(recive_task@msg)+05h
	line	228
;recive.c: 228: if (rf_buf[8] == (0x20))
	movf	0+(_rf_buf)+08h,w
	xorlw	020h
	skipz
	goto	u5681
	goto	u5680
u5681:
	goto	l17136
u5680:
	line	230
	
l17008:	
;recive.c: 229: {
;recive.c: 230: for(i = 0; i < 3; i++)
	clrf	(recive_task@i)
	
l17010:	
	movlw	(03h)
	subwf	(recive_task@i),w
	skipc
	goto	u5691
	goto	u5690
u5691:
	goto	l17014
u5690:
	goto	l17032
	line	236
	
l17014:	
;recive.c: 231: {
;recive.c: 232: if((msg[0] == control_id[i + 9][0])
;recive.c: 233: &&(msg[1] == control_id[i + 9][1])
;recive.c: 234: &&(msg[2] == control_id[i + 9][2])
;recive.c: 235: &&(msg[3] == control_id[i + 9][3])
;recive.c: 236: )
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
	goto	u5701
	goto	u5700
u5701:
	goto	l17026
u5700:
	
l17016:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+037h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+01h,w
	xorwf	indf,w
	skipz
	goto	u5711
	goto	u5710
u5711:
	goto	l17026
u5710:
	
l17018:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+038h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+02h,w
	xorwf	indf,w
	skipz
	goto	u5721
	goto	u5720
u5721:
	goto	l17026
u5720:
	
l17020:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+039h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+03h,w
	xorwf	indf,w
	skipz
	goto	u5731
	goto	u5730
u5731:
	goto	l17026
u5730:
	line	238
	
l17022:	
;recive.c: 237: {
;recive.c: 238: match_flag = 1;
	clrf	(recive_task@match_flag)
	incf	(recive_task@match_flag),f
	line	239
;recive.c: 239: break;
	goto	l17032
	line	243
	
l17026:	
;recive.c: 241: else
;recive.c: 242: {
;recive.c: 243: match_flag = 0;
	clrf	(recive_task@match_flag)
	line	230
	
l17028:	
	incf	(recive_task@i),f
	goto	l17010
	line	247
	
l17032:	
;recive.c: 244: }
;recive.c: 245: }
;recive.c: 247: if(match_flag == 0)
	movf	(recive_task@match_flag),f
	skipz
	goto	u5741
	goto	u5740
u5741:
	goto	l17066
u5740:
	line	249
	
l17034:	
;recive.c: 248: {
;recive.c: 249: flag = (channel_flag >> 6) & 0x03;
	movf	(_channel_flag),w
	movwf	(??_recive_task+0)+0
	movlw	06h
u5755:
	clrc
	rrf	(??_recive_task+0)+0,f
	addlw	-1
	skipz
	goto	u5755
	movf	0+(??_recive_task+0)+0,w
	movwf	(recive_task@flag)
	movlw	(03h)
	andwf	(recive_task@flag),f
	line	250
	
l17036:	
;recive.c: 250: if(flag >= 3)
	movlw	(03h)
	subwf	(recive_task@flag),w
	skipc
	goto	u5761
	goto	u5760
u5761:
	goto	l17040
u5760:
	line	252
	
l17038:	
;recive.c: 251: {
;recive.c: 252: flag = 0;
	clrf	(recive_task@flag)
	line	254
	
l17040:	
;recive.c: 253: }
;recive.c: 254: AT24C02_Write_Msg(9 * 6 + flag * 6, msg, 4);
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
	line	255
	
l17042:	
;recive.c: 255: AT24C02_Write_Msg(9 * 6 + flag * 6 + 5, msg + 5, 1);
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
	line	256
;recive.c: 256: for(i = 0; i < 4; i++)
	clrf	(recive_task@i)
	
l17044:	
	movlw	(04h)
	subwf	(recive_task@i),w
	skipc
	goto	u5771
	goto	u5770
u5771:
	goto	l17048
u5770:
	goto	l17054
	line	258
	
l17048:	
;recive.c: 257: {
;recive.c: 258: control_id[flag + 9][i] = msg[i];
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
	line	256
	
l17050:	
	incf	(recive_task@i),f
	goto	l17044
	line	261
	
l17054:	
;recive.c: 259: }
;recive.c: 261: control_id[flag + 9][5] = msg[5];
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@flag),w
	fcall	___bmul
	addlw	_control_id+03Bh&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+05h,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	line	262
	
l17056:	
;recive.c: 262: flag ++;
	incf	(recive_task@flag),f
	line	263
	
l17058:	
;recive.c: 263: if(flag >= 3)
	movlw	(03h)
	subwf	(recive_task@flag),w
	skipc
	goto	u5781
	goto	u5780
u5781:
	goto	l17062
u5780:
	line	265
	
l17060:	
;recive.c: 264: {
;recive.c: 265: flag = 0;
	clrf	(recive_task@flag)
	line	267
	
l17062:	
;recive.c: 266: }
;recive.c: 267: channel_flag &= (~(0x03 << 6));
	movlw	(03Fh)
	andwf	(_channel_flag),f
	line	268
	
l17064:	
;recive.c: 268: channel_flag |= (flag << 6);
	movf	(recive_task@flag),w
	movwf	(??_recive_task+0)+0
	rrf	(??_recive_task+0)+0,f
	rrf	(??_recive_task+0)+0,f
	rrf	(??_recive_task+0)+0,w
	andlw	0c0h
	iorwf	(_channel_flag),f
	line	269
;recive.c: 269: }
	goto	l9860
	line	272
	
l17066:	
;recive.c: 270: else
;recive.c: 271: {
;recive.c: 272: flag = i;
	movf	(recive_task@i),w
	movwf	(recive_task@flag)
	line	273
	
l17068:	
;recive.c: 273: AT24C02_Write_Msg(9 * 6 + flag * 6 + 5, msg + 5, 1);
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
	line	274
	
l17070:	
;recive.c: 274: control_id[flag + 9][5] = msg[5];
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@flag),w
	fcall	___bmul
	addlw	_control_id+03Bh&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+05h,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	line	275
	
l9860:	
	line	279
;recive.c: 275: }
;recive.c: 279: for(i = 9; i < 12; i++)
	movlw	(09h)
	movwf	(recive_task@i)
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u5791
	goto	u5790
u5791:
	goto	l17074
u5790:
	goto	l17104
	line	281
	
l17074:	
;recive.c: 280: {
;recive.c: 281: if ((control_id[i][4] & (0x01 << rf_buf[9])) != 0)
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+04h&0ffh
	movwf	fsr0
	movlw	(01h)
	movwf	(??_recive_task+0)+0
	incf	0+(_rf_buf)+09h,w
	goto	u5804
u5805:
	clrc
	rlf	(??_recive_task+0)+0,f
u5804:
	addlw	-1
	skipz
	goto	u5805
	movf	0+(??_recive_task+0)+0,w
	andwf	indf,w
	btfsc	status,2
	goto	u5811
	goto	u5810
u5811:
	goto	l17088
u5810:
	line	283
	
l17076:	
;recive.c: 282: {
;recive.c: 283: if (i == 9)
	movf	(recive_task@i),w
	xorlw	09h
	skipz
	goto	u5821
	goto	u5820
u5821:
	goto	l17080
u5820:
	line	285
	
l17078:	
;recive.c: 284: {
;recive.c: 285: KEY0.channel_status = 1;
	clrf	(_KEY0)
	incf	(_KEY0),f
	line	286
;recive.c: 286: }
	goto	l17100
	line	287
	
l17080:	
;recive.c: 287: else if (i == 10)
	movf	(recive_task@i),w
	xorlw	0Ah
	skipz
	goto	u5831
	goto	u5830
u5831:
	goto	l17084
u5830:
	line	289
	
l17082:	
;recive.c: 288: {
;recive.c: 289: KEY1.channel_status = 1;
	clrf	(_KEY1)
	incf	(_KEY1),f
	line	290
;recive.c: 290: }
	goto	l17100
	line	291
	
l17084:	
;recive.c: 291: else if (i == 11)
	movf	(recive_task@i),w
	xorlw	0Bh
	skipz
	goto	u5841
	goto	u5840
u5841:
	goto	l9865
u5840:
	line	293
	
l17086:	
;recive.c: 292: {
;recive.c: 293: KEY2.channel_status = 1;
	clrf	(_KEY2)
	incf	(_KEY2),f
	goto	l17100
	line	295
	
l9865:	
;recive.c: 294: }
;recive.c: 295: }
	goto	l17100
	line	298
	
l17088:	
;recive.c: 296: else
;recive.c: 297: {
;recive.c: 298: if (i == 9)
	movf	(recive_task@i),w
	xorlw	09h
	skipz
	goto	u5851
	goto	u5850
u5851:
	goto	l17092
u5850:
	line	300
	
l17090:	
;recive.c: 299: {
;recive.c: 300: KEY0.channel_status = 0;
	clrf	(_KEY0)
	line	301
;recive.c: 301: }
	goto	l17100
	line	302
	
l17092:	
;recive.c: 302: else if (i == 10)
	movf	(recive_task@i),w
	xorlw	0Ah
	skipz
	goto	u5861
	goto	u5860
u5861:
	goto	l17096
u5860:
	line	304
	
l17094:	
;recive.c: 303: {
;recive.c: 304: KEY1.channel_status = 0;
	clrf	(_KEY1)
	line	305
;recive.c: 305: }
	goto	l17100
	line	306
	
l17096:	
;recive.c: 306: else if (i == 11)
	movf	(recive_task@i),w
	xorlw	0Bh
	skipz
	goto	u5871
	goto	u5870
u5871:
	goto	l17100
u5870:
	line	308
	
l17098:	
;recive.c: 307: {
;recive.c: 308: KEY2.channel_status = 0;
	clrf	(_KEY2)
	line	279
	
l17100:	
	incf	(recive_task@i),f
	
l17102:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u5881
	goto	u5880
u5881:
	goto	l17074
u5880:
	line	315
	
l17104:	
;recive.c: 309: }
;recive.c: 310: }
;recive.c: 311: }
;recive.c: 315: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	317
	
l17106:	
;recive.c: 317: AT24C02_Write_Msg(110, &channel_flag,1);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(06Eh)
	fcall	_AT24C02_Write_Msg
	line	318
	
l17108:	
;recive.c: 318: AT24C02_Write_Msg(110, &channel_flag,1);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(06Eh)
	fcall	_AT24C02_Write_Msg
	line	320
;recive.c: 320: for(i = 0; i < 12; i++)
	clrf	(recive_task@i)
	
l17110:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u5891
	goto	u5890
u5891:
	goto	l17114
u5890:
	goto	l17120
	line	322
	
l17114:	
;recive.c: 321: {
;recive.c: 322: AT24C02_Read_Msg(i * 6, control_id[i], 6);
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
	line	320
	
l17116:	
	incf	(recive_task@i),f
	goto	l17110
	line	324
	
l17120:	
;recive.c: 323: }
;recive.c: 324: AT24C02_Read_Msg(110, &channel_flag, 1);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Read_Msg)
	clrf	0+(?_AT24C02_Read_Msg)+01h
	incf	0+(?_AT24C02_Read_Msg)+01h,f
	movlw	(06Eh)
	fcall	_AT24C02_Read_Msg
	line	326
	
l17122:	
;recive.c: 326: sys_stute = 1;
	clrf	(_sys_stute)
	incf	(_sys_stute),f
	line	328
	
l17124:	
;recive.c: 328: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l17126:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	329
	
l17128:	
;recive.c: 329: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	330
	
l17130:	
;recive.c: 330: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l17132:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	331
	
l17134:	
;recive.c: 331: match_channel_flag = 0;
	clrf	(_match_channel_flag)
	line	332
;recive.c: 332: }
	goto	l10035
	line	333
	
l17136:	
;recive.c: 333: else if (rf_buf[8] == (0x10) && msg[4] != 0xff)
	movf	0+(_rf_buf)+08h,w
	xorlw	010h
	skipz
	goto	u5901
	goto	u5900
u5901:
	goto	l9931
u5900:
	
l17138:	
	movf	0+(recive_task@msg)+04h,w
	xorlw	0FFh
	skipnz
	goto	u5911
	goto	u5910
u5911:
	goto	l9931
u5910:
	line	335
	
l17140:	
;recive.c: 334: {
;recive.c: 335: if(match_channel_flag & 0x10)
	btfss	(_match_channel_flag),(4)&7
	goto	u5921
	goto	u5920
u5921:
	goto	l9879
u5920:
	line	337
	
l17142:	
;recive.c: 336: {
;recive.c: 337: for(i = 0; i < 3; i++)
	clrf	(recive_task@i)
	
l17144:	
	movlw	(03h)
	subwf	(recive_task@i),w
	skipc
	goto	u5931
	goto	u5930
u5931:
	goto	l17148
u5930:
	goto	l17168
	line	344
	
l17148:	
;recive.c: 338: {
;recive.c: 339: if((msg[0] == control_id[i][0])
;recive.c: 340: &&(msg[1] == control_id[i][1])
;recive.c: 341: &&(msg[2] == control_id[i][2])
;recive.c: 342: &&(msg[3] == control_id[i][3])
;recive.c: 343: &&(msg[4] == control_id[i][4])
;recive.c: 344: )
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
	goto	u5941
	goto	u5940
u5941:
	goto	l17162
u5940:
	
l17150:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+01h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+01h,w
	xorwf	indf,w
	skipz
	goto	u5951
	goto	u5950
u5951:
	goto	l17162
u5950:
	
l17152:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+02h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+02h,w
	xorwf	indf,w
	skipz
	goto	u5961
	goto	u5960
u5961:
	goto	l17162
u5960:
	
l17154:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+03h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+03h,w
	xorwf	indf,w
	skipz
	goto	u5971
	goto	u5970
u5971:
	goto	l17162
u5970:
	
l17156:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+04h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+04h,w
	xorwf	indf,w
	skipz
	goto	u5981
	goto	u5980
u5981:
	goto	l17162
u5980:
	line	346
	
l17158:	
;recive.c: 345: {
;recive.c: 346: match_flag = 1;
	clrf	(recive_task@match_flag)
	incf	(recive_task@match_flag),f
	line	347
;recive.c: 347: break;
	goto	l17168
	line	351
	
l17162:	
;recive.c: 349: else
;recive.c: 350: {
;recive.c: 351: match_flag = 0;
	clrf	(recive_task@match_flag)
	line	337
	
l17164:	
	incf	(recive_task@i),f
	goto	l17144
	line	355
	
l17168:	
;recive.c: 352: }
;recive.c: 353: }
;recive.c: 355: if(match_flag == 0)
	movf	(recive_task@match_flag),f
	skipz
	goto	u5991
	goto	u5990
u5991:
	goto	l17202
u5990:
	line	357
	
l17170:	
;recive.c: 356: {
;recive.c: 357: flag = (channel_flag >> 0) & 0x03;
	movf	(_channel_flag),w
	movwf	(recive_task@flag)
	
l17172:	
	movlw	(03h)
	andwf	(recive_task@flag),f
	line	359
	
l17174:	
;recive.c: 359: if(flag >= 3)
	movlw	(03h)
	subwf	(recive_task@flag),w
	skipc
	goto	u6001
	goto	u6000
u6001:
	goto	l17178
u6000:
	line	361
	
l17176:	
;recive.c: 360: {
;recive.c: 361: flag = 0;
	clrf	(recive_task@flag)
	line	364
	
l17178:	
;recive.c: 362: }
;recive.c: 364: AT24C02_Write_Msg(0 + flag * 6, msg, 6);
	movlw	(recive_task@msg)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	movlw	(06h)
	movwf	0+(?_AT24C02_Write_Msg)+01h
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@flag),w
	fcall	___bmul
	fcall	_AT24C02_Write_Msg
	line	365
	
l17180:	
;recive.c: 365: for(i = 0; i < 6; i++)
	clrf	(recive_task@i)
	
l17182:	
	movlw	(06h)
	subwf	(recive_task@i),w
	skipc
	goto	u6011
	goto	u6010
u6011:
	goto	l17186
u6010:
	goto	l17192
	line	367
	
l17186:	
;recive.c: 366: {
;recive.c: 367: control_id[flag][i] = msg[i];
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
	line	365
	
l17188:	
	incf	(recive_task@i),f
	goto	l17182
	line	370
	
l17192:	
;recive.c: 368: }
;recive.c: 370: flag ++;
	incf	(recive_task@flag),f
	line	371
	
l17194:	
;recive.c: 371: if(flag >= 3)
	movlw	(03h)
	subwf	(recive_task@flag),w
	skipc
	goto	u6021
	goto	u6020
u6021:
	goto	l17198
u6020:
	line	373
	
l17196:	
;recive.c: 372: {
;recive.c: 373: flag = 0;
	clrf	(recive_task@flag)
	line	376
	
l17198:	
;recive.c: 374: }
;recive.c: 376: channel_flag &= (~(0x03 << 0));
	movlw	(0FCh)
	andwf	(_channel_flag),f
	line	377
	
l17200:	
;recive.c: 377: channel_flag |= (flag << 0);
	movf	(recive_task@flag),w
	iorwf	(_channel_flag),f
	line	378
;recive.c: 378: }
	goto	l17206
	line	381
	
l17202:	
;recive.c: 379: else
;recive.c: 380: {
;recive.c: 381: flag = i;
	movf	(recive_task@i),w
	movwf	(recive_task@flag)
	line	382
	
l17204:	
;recive.c: 382: AT24C02_Write_Msg(0 + flag * 6 + 5, &msg[5], 1);
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
	line	385
	
l17206:	
;recive.c: 383: }
;recive.c: 385: if (rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u6031
	goto	u6030
u6031:
	goto	l17210
u6030:
	line	387
	
l17208:	
;recive.c: 386: {
;recive.c: 387: KEY0.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY0),f
	line	388
;recive.c: 388: }
	goto	l9891
	line	389
	
l17210:	
;recive.c: 389: else if (rf_buf[9] == 1)
	decf	0+(_rf_buf)+09h,w
	skipz
	goto	u6041
	goto	u6040
u6041:
	goto	l17214
u6040:
	line	391
	
l17212:	
;recive.c: 390: {
;recive.c: 391: KEY0.channel_status = 1;
	clrf	(_KEY0)
	incf	(_KEY0),f
	line	392
;recive.c: 392: }
	goto	l9891
	line	393
	
l17214:	
;recive.c: 393: else if (rf_buf[9] == 0)
	movf	0+(_rf_buf)+09h,f
	skipz
	goto	u6051
	goto	u6050
u6051:
	goto	l9891
u6050:
	line	395
	
l17216:	
;recive.c: 394: {
;recive.c: 395: KEY0.channel_status = 0;
	clrf	(_KEY0)
	line	398
	
l9891:	
;recive.c: 396: }
;recive.c: 398: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	399
;recive.c: 399: }
	goto	l17368
	line	400
	
l9879:	
;recive.c: 400: else if(match_channel_flag & 0x20)
	btfss	(_match_channel_flag),(5)&7
	goto	u6061
	goto	u6060
u6061:
	goto	l9896
u6060:
	line	402
	
l17218:	
;recive.c: 401: {
;recive.c: 402: for(i = 0; i < 3; i++)
	clrf	(recive_task@i)
	
l17220:	
	movlw	(03h)
	subwf	(recive_task@i),w
	skipc
	goto	u6071
	goto	u6070
u6071:
	goto	l17224
u6070:
	goto	l17244
	line	409
	
l17224:	
;recive.c: 403: {
;recive.c: 404: if((msg[0] == control_id[i+3][0])
;recive.c: 405: &&(msg[1] == control_id[i+3][1])
;recive.c: 406: &&(msg[2] == control_id[i+3][2])
;recive.c: 407: &&(msg[3] == control_id[i+3][3])
;recive.c: 408: &&(msg[4] == control_id[i+3][4])
;recive.c: 409: )
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
	goto	u6081
	goto	u6080
u6081:
	goto	l17238
u6080:
	
l17226:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+013h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+01h,w
	xorwf	indf,w
	skipz
	goto	u6091
	goto	u6090
u6091:
	goto	l17238
u6090:
	
l17228:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+014h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+02h,w
	xorwf	indf,w
	skipz
	goto	u6101
	goto	u6100
u6101:
	goto	l17238
u6100:
	
l17230:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+015h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+03h,w
	xorwf	indf,w
	skipz
	goto	u6111
	goto	u6110
u6111:
	goto	l17238
u6110:
	
l17232:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+016h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+04h,w
	xorwf	indf,w
	skipz
	goto	u6121
	goto	u6120
u6121:
	goto	l17238
u6120:
	line	411
	
l17234:	
;recive.c: 410: {
;recive.c: 411: match_flag = 1;
	clrf	(recive_task@match_flag)
	incf	(recive_task@match_flag),f
	line	412
;recive.c: 412: break;
	goto	l17244
	line	416
	
l17238:	
;recive.c: 414: else
;recive.c: 415: {
;recive.c: 416: match_flag = 0;
	clrf	(recive_task@match_flag)
	line	402
	
l17240:	
	incf	(recive_task@i),f
	goto	l17220
	line	420
	
l17244:	
;recive.c: 417: }
;recive.c: 418: }
;recive.c: 420: if(match_flag == 0)
	movf	(recive_task@match_flag),f
	skipz
	goto	u6131
	goto	u6130
u6131:
	goto	l17276
u6130:
	line	422
	
l17246:	
;recive.c: 421: {
;recive.c: 422: flag = (channel_flag >> 2) & 0x03;
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
	line	424
	
l17248:	
;recive.c: 424: if(flag >= 3)
	movlw	(03h)
	subwf	(recive_task@flag),w
	skipc
	goto	u6141
	goto	u6140
u6141:
	goto	l17252
u6140:
	line	426
	
l17250:	
;recive.c: 425: {
;recive.c: 426: flag = 0;
	clrf	(recive_task@flag)
	line	429
	
l17252:	
;recive.c: 427: }
;recive.c: 429: AT24C02_Write_Msg(3 * 6 + flag * 6, msg, 6);
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
	line	430
	
l17254:	
;recive.c: 430: for(i = 0; i < 6; i++)
	clrf	(recive_task@i)
	
l17256:	
	movlw	(06h)
	subwf	(recive_task@i),w
	skipc
	goto	u6151
	goto	u6150
u6151:
	goto	l17260
u6150:
	goto	l17266
	line	432
	
l17260:	
;recive.c: 431: {
;recive.c: 432: control_id[flag + 3][i] = msg[i];
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
	line	430
	
l17262:	
	incf	(recive_task@i),f
	goto	l17256
	line	435
	
l17266:	
;recive.c: 433: }
;recive.c: 435: flag ++;
	incf	(recive_task@flag),f
	line	436
	
l17268:	
;recive.c: 436: if(flag >= 3)
	movlw	(03h)
	subwf	(recive_task@flag),w
	skipc
	goto	u6161
	goto	u6160
u6161:
	goto	l17272
u6160:
	line	438
	
l17270:	
;recive.c: 437: {
;recive.c: 438: flag = 0;
	clrf	(recive_task@flag)
	line	440
	
l17272:	
;recive.c: 439: }
;recive.c: 440: channel_flag &= (~(0x03 << 2));
	movlw	(0F3h)
	andwf	(_channel_flag),f
	line	441
	
l17274:	
;recive.c: 441: channel_flag |= (flag << 2);
	movf	(recive_task@flag),w
	movwf	(??_recive_task+0)+0
	clrc
	rlf	(??_recive_task+0)+0,f
	clrc
	rlf	(??_recive_task+0)+0,w
	iorwf	(_channel_flag),f
	line	443
;recive.c: 443: }
	goto	l17282
	line	446
	
l17276:	
;recive.c: 448: debug = flag;
	movf	(recive_task@i),w
	movwf	(recive_task@flag)
	line	450
	
l17278:	
;recive.c: 450: AT24C02_Write_Msg(3 * 6 + flag * 6 + 5, &msg[5], 1);
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
	line	451
	
l17280:	
;recive.c: 451: soft_delay_ms(2);
	movlw	02h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	454
	
l17282:	
;recive.c: 452: }
;recive.c: 454: if (rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u6171
	goto	u6170
u6171:
	goto	l17286
u6170:
	line	456
	
l17284:	
;recive.c: 455: {
;recive.c: 456: KEY1.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY1),f
	line	457
;recive.c: 457: }
	goto	l9891
	line	458
	
l17286:	
;recive.c: 458: else if (rf_buf[9] == 1)
	decf	0+(_rf_buf)+09h,w
	skipz
	goto	u6181
	goto	u6180
u6181:
	goto	l17290
u6180:
	line	460
	
l17288:	
;recive.c: 459: {
;recive.c: 460: KEY1.channel_status = 1;
	clrf	(_KEY1)
	incf	(_KEY1),f
	line	461
;recive.c: 461: }
	goto	l9891
	line	462
	
l17290:	
;recive.c: 462: else if (rf_buf[9] == 0)
	movf	0+(_rf_buf)+09h,f
	skipz
	goto	u6191
	goto	u6190
u6191:
	goto	l9891
u6190:
	line	464
	
l17292:	
;recive.c: 463: {
;recive.c: 464: KEY1.channel_status = 0;
	clrf	(_KEY1)
	goto	l9891
	line	469
	
l9896:	
;recive.c: 469: else if(match_channel_flag&0x40)
	btfss	(_match_channel_flag),(6)&7
	goto	u6201
	goto	u6200
u6201:
	goto	l17368
u6200:
	line	472
	
l17294:	
;recive.c: 470: {
;recive.c: 472: for(i = 0; i < 3; i++)
	clrf	(recive_task@i)
	
l17296:	
	movlw	(03h)
	subwf	(recive_task@i),w
	skipc
	goto	u6211
	goto	u6210
u6211:
	goto	l17300
u6210:
	goto	l17320
	line	479
	
l17300:	
;recive.c: 473: {
;recive.c: 474: if((msg[0] == control_id[i+6][0])
;recive.c: 475: &&(msg[1] == control_id[i+6][1])
;recive.c: 476: &&(msg[2] == control_id[i+6][2])
;recive.c: 477: &&(msg[3] == control_id[i+6][3])
;recive.c: 478: &&(msg[4] == control_id[i+6][4])
;recive.c: 479: )
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
	goto	u6221
	goto	u6220
u6221:
	goto	l17314
u6220:
	
l17302:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+025h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+01h,w
	xorwf	indf,w
	skipz
	goto	u6231
	goto	u6230
u6231:
	goto	l17314
u6230:
	
l17304:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+026h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+02h,w
	xorwf	indf,w
	skipz
	goto	u6241
	goto	u6240
u6241:
	goto	l17314
u6240:
	
l17306:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+027h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+03h,w
	xorwf	indf,w
	skipz
	goto	u6251
	goto	u6250
u6251:
	goto	l17314
u6250:
	
l17308:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+028h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+04h,w
	xorwf	indf,w
	skipz
	goto	u6261
	goto	u6260
u6261:
	goto	l17314
u6260:
	line	481
	
l17310:	
;recive.c: 480: {
;recive.c: 481: match_flag = 1;
	clrf	(recive_task@match_flag)
	incf	(recive_task@match_flag),f
	line	482
;recive.c: 482: break;
	goto	l17320
	line	486
	
l17314:	
;recive.c: 484: else
;recive.c: 485: {
;recive.c: 486: match_flag = 0;
	clrf	(recive_task@match_flag)
	line	472
	
l17316:	
	incf	(recive_task@i),f
	goto	l17296
	line	490
	
l17320:	
;recive.c: 487: }
;recive.c: 488: }
;recive.c: 490: if(match_flag == 0)
	movf	(recive_task@match_flag),f
	skipz
	goto	u6271
	goto	u6270
u6271:
	goto	l17352
u6270:
	line	492
	
l17322:	
;recive.c: 491: {
;recive.c: 492: flag = (channel_flag >> 4) & 0x03;
	swapf	(_channel_flag),w
	andlw	(0ffh shr 4) & 0ffh
	movwf	(recive_task@flag)
	movlw	(03h)
	andwf	(recive_task@flag),f
	line	494
	
l17324:	
;recive.c: 494: if (flag >= 3)
	movlw	(03h)
	subwf	(recive_task@flag),w
	skipc
	goto	u6281
	goto	u6280
u6281:
	goto	l17328
u6280:
	line	496
	
l17326:	
;recive.c: 495: {
;recive.c: 496: flag = 0;
	clrf	(recive_task@flag)
	line	499
	
l17328:	
;recive.c: 497: }
;recive.c: 499: AT24C02_Write_Msg(6 * 6 + flag * 6, msg, 6);
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
	line	500
	
l17330:	
;recive.c: 500: for(i = 0; i < 6; i++)
	clrf	(recive_task@i)
	
l17332:	
	movlw	(06h)
	subwf	(recive_task@i),w
	skipc
	goto	u6291
	goto	u6290
u6291:
	goto	l17336
u6290:
	goto	l17342
	line	502
	
l17336:	
;recive.c: 501: {
;recive.c: 502: control_id[flag + 6][i] = msg[i];
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
	line	500
	
l17338:	
	incf	(recive_task@i),f
	goto	l17332
	line	505
	
l17342:	
;recive.c: 503: }
;recive.c: 505: flag ++;
	incf	(recive_task@flag),f
	line	506
	
l17344:	
;recive.c: 506: if(flag >= 3)
	movlw	(03h)
	subwf	(recive_task@flag),w
	skipc
	goto	u6301
	goto	u6300
u6301:
	goto	l17348
u6300:
	line	508
	
l17346:	
;recive.c: 507: {
;recive.c: 508: flag = 0;
	clrf	(recive_task@flag)
	line	511
	
l17348:	
;recive.c: 509: }
;recive.c: 511: channel_flag &= (~(0x03 << 4));
	movlw	(0CFh)
	andwf	(_channel_flag),f
	line	512
	
l17350:	
;recive.c: 512: channel_flag |= (flag << 4);
	swapf	(recive_task@flag),w
	andlw	(0ffh shl 4) & 0ffh
	iorwf	(_channel_flag),f
	line	514
;recive.c: 514: }
	goto	l17356
	line	517
	
l17352:	
;recive.c: 515: else
;recive.c: 516: {
;recive.c: 517: flag = i;
	movf	(recive_task@i),w
	movwf	(recive_task@flag)
	line	518
	
l17354:	
;recive.c: 518: AT24C02_Write_Msg(6 * 6 + flag * 6 + 5, &msg[5], 1);
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
	line	521
	
l17356:	
;recive.c: 519: }
;recive.c: 521: if (rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u6311
	goto	u6310
u6311:
	goto	l17360
u6310:
	line	523
	
l17358:	
;recive.c: 522: {
;recive.c: 523: KEY2.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY2),f
	line	524
;recive.c: 524: }
	goto	l9891
	line	525
	
l17360:	
;recive.c: 525: else if (rf_buf[9] == 1)
	decf	0+(_rf_buf)+09h,w
	skipz
	goto	u6321
	goto	u6320
u6321:
	goto	l17364
u6320:
	line	527
	
l17362:	
;recive.c: 526: {
;recive.c: 527: KEY2.channel_status = 1;
	clrf	(_KEY2)
	incf	(_KEY2),f
	line	528
;recive.c: 528: }
	goto	l9891
	line	529
	
l17364:	
;recive.c: 529: else if (rf_buf[9] == 0)
	movf	0+(_rf_buf)+09h,f
	skipz
	goto	u6331
	goto	u6330
u6331:
	goto	l9891
u6330:
	line	531
	
l17366:	
;recive.c: 530: {
;recive.c: 531: KEY2.channel_status = 0;
	clrf	(_KEY2)
	goto	l9891
	line	537
	
l17368:	
;recive.c: 535: }
;recive.c: 537: AT24C02_Write_Msg(110, &channel_flag,1);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(06Eh)
	fcall	_AT24C02_Write_Msg
	line	538
	
l17370:	
;recive.c: 538: AT24C02_Write_Msg(110, &channel_flag,1);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	clrf	0+(?_AT24C02_Write_Msg)+01h
	incf	0+(?_AT24C02_Write_Msg)+01h,f
	movlw	(06Eh)
	fcall	_AT24C02_Write_Msg
	line	540
;recive.c: 540: for(i = 0; i < 12; i++)
	clrf	(recive_task@i)
	
l17372:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u6341
	goto	u6340
u6341:
	goto	l17376
u6340:
	goto	l17382
	line	542
	
l17376:	
;recive.c: 541: {
;recive.c: 542: AT24C02_Read_Msg(i * 6, control_id[i], 6);
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
	line	540
	
l17378:	
	incf	(recive_task@i),f
	goto	l17372
	line	544
	
l17382:	
;recive.c: 543: }
;recive.c: 544: AT24C02_Read_Msg(110, &channel_flag, 1);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Read_Msg)
	clrf	0+(?_AT24C02_Read_Msg)+01h
	incf	0+(?_AT24C02_Read_Msg)+01h,f
	movlw	(06Eh)
	fcall	_AT24C02_Read_Msg
	goto	l17122
	line	556
	
l17398:	
;recive.c: 554: else
;recive.c: 555: {
;recive.c: 556: if(flag_5s_add > 500)
	movlw	high(01F5h)
	subwf	(_flag_5s_add+1),w
	movlw	low(01F5h)
	skipnz
	subwf	(_flag_5s_add),w
	skipc
	goto	u6351
	goto	u6350
u6351:
	goto	l10035
u6350:
	line	558
	
l17400:	
;recive.c: 557: {
;recive.c: 558: sys_stute = 1;
	clrf	(_sys_stute)
	incf	(_sys_stute),f
	goto	l17134
	line	561
	
l9931:	
	line	562
;recive.c: 560: }
;recive.c: 561: }
;recive.c: 562: }break;
	goto	l10035
	line	565
	
l17404:	
;recive.c: 564: {
;recive.c: 565: if(rx_data())
	fcall	_rx_data
	xorlw	0
	skipnz
	goto	u6361
	goto	u6360
u6361:
	goto	l10035
u6360:
	line	567
	
l17406:	
;recive.c: 566: {
;recive.c: 567: if (rf_buf[8] == (0x20))
	movf	0+(_rf_buf)+08h,w
	xorlw	020h
	skipz
	goto	u6371
	goto	u6370
u6371:
	goto	l17476
u6370:
	line	569
	
l17408:	
;recive.c: 568: {
;recive.c: 569: if(rf_buf[10] != 0xff)
	movf	0+(_rf_buf)+0Ah,w
	xorlw	0FFh
	skipnz
	goto	u6381
	goto	u6380
u6381:
	goto	l17730
u6380:
	line	571
	
l17410:	
;recive.c: 570: {
;recive.c: 571: for (i = 9; i < 12; i++)
	movlw	(09h)
	movwf	(recive_task@i)
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u6391
	goto	u6390
u6391:
	goto	l17414
u6390:
	goto	l17730
	line	576
	
l17414:	
;recive.c: 572: {
;recive.c: 573: if((rf_buf[3] == control_id[i][0])
;recive.c: 574: &&(rf_buf[4] == control_id[i][1])
;recive.c: 575: &&(rf_buf[5] == control_id[i][2])
;recive.c: 576: &&(rf_buf[6] == control_id[i][3]))
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
	goto	u6401
	goto	u6400
u6401:
	goto	l17472
u6400:
	
l17416:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+01h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+04h,w
	xorwf	indf,w
	skipz
	goto	u6411
	goto	u6410
u6411:
	goto	l17472
u6410:
	
l17418:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+02h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+05h,w
	xorwf	indf,w
	skipz
	goto	u6421
	goto	u6420
u6421:
	goto	l17472
u6420:
	
l17420:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+03h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+06h,w
	xorwf	indf,w
	skipz
	goto	u6431
	goto	u6430
u6431:
	goto	l17472
u6430:
	line	578
	
l17422:	
;recive.c: 577: {
;recive.c: 578: if(rf_buf[2] != control_id[i][5])
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	xorwf	indf,w
	skipnz
	goto	u6441
	goto	u6440
u6441:
	goto	l9936
u6440:
	line	580
	
l17424:	
;recive.c: 579: {
;recive.c: 580: control_id[i][5] = rf_buf[2];
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	movwf	indf
	line	582
	
l17426:	
;recive.c: 582: if(rf_buf[9] < (6))
	movlw	(06h)
	subwf	0+(_rf_buf)+09h,w
	skipnc
	goto	u6451
	goto	u6450
u6451:
	goto	l17730
u6450:
	line	584
	
l17428:	
;recive.c: 583: {
;recive.c: 584: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	585
	
l17430:	
;recive.c: 585: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	586
	
l17432:	
;recive.c: 586: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l17434:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	589
	
l17436:	
;recive.c: 589: for(i = 9; i < 12; i++)
	movlw	(09h)
	movwf	(recive_task@i)
	
l17438:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u6461
	goto	u6460
u6461:
	goto	l17442
u6460:
	goto	l17730
	line	591
	
l17442:	
;recive.c: 590: {
;recive.c: 591: if ((control_id[i][4] & (0x01 << rf_buf[9])) != 0)
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+04h&0ffh
	movwf	fsr0
	movlw	(01h)
	movwf	(??_recive_task+0)+0
	incf	0+(_rf_buf)+09h,w
	goto	u6474
u6475:
	clrc
	rlf	(??_recive_task+0)+0,f
u6474:
	addlw	-1
	skipz
	goto	u6475
	movf	0+(??_recive_task+0)+0,w
	andwf	indf,w
	btfsc	status,2
	goto	u6481
	goto	u6480
u6481:
	goto	l17456
u6480:
	line	593
	
l17444:	
;recive.c: 592: {
;recive.c: 593: if (i == 9)
	movf	(recive_task@i),w
	xorlw	09h
	skipz
	goto	u6491
	goto	u6490
u6491:
	goto	l17448
u6490:
	line	595
	
l17446:	
;recive.c: 594: {
;recive.c: 595: KEY0.channel_status = 1;
	clrf	(_KEY0)
	incf	(_KEY0),f
	line	596
;recive.c: 596: }
	goto	l17468
	line	597
	
l17448:	
;recive.c: 597: else if (i == 10)
	movf	(recive_task@i),w
	xorlw	0Ah
	skipz
	goto	u6501
	goto	u6500
u6501:
	goto	l17452
u6500:
	line	599
	
l17450:	
;recive.c: 598: {
;recive.c: 599: KEY1.channel_status = 1;
	clrf	(_KEY1)
	incf	(_KEY1),f
	line	600
;recive.c: 600: }
	goto	l17468
	line	601
	
l17452:	
;recive.c: 601: else if (i == 11)
	movf	(recive_task@i),w
	xorlw	0Bh
	skipz
	goto	u6511
	goto	u6510
u6511:
	goto	l9946
u6510:
	line	603
	
l17454:	
;recive.c: 602: {
;recive.c: 603: KEY2.channel_status = 1;
	clrf	(_KEY2)
	incf	(_KEY2),f
	goto	l17468
	line	605
	
l9946:	
;recive.c: 604: }
;recive.c: 605: }
	goto	l17468
	line	608
	
l17456:	
;recive.c: 606: else
;recive.c: 607: {
;recive.c: 608: if (i == 9)
	movf	(recive_task@i),w
	xorlw	09h
	skipz
	goto	u6521
	goto	u6520
u6521:
	goto	l17460
u6520:
	line	610
	
l17458:	
;recive.c: 609: {
;recive.c: 610: KEY0.channel_status = 0;
	clrf	(_KEY0)
	line	611
;recive.c: 611: }
	goto	l17468
	line	612
	
l17460:	
;recive.c: 612: else if (i == 10)
	movf	(recive_task@i),w
	xorlw	0Ah
	skipz
	goto	u6531
	goto	u6530
u6531:
	goto	l17464
u6530:
	line	614
	
l17462:	
;recive.c: 613: {
;recive.c: 614: KEY1.channel_status = 0;
	clrf	(_KEY1)
	line	615
;recive.c: 615: }
	goto	l17468
	line	616
	
l17464:	
;recive.c: 616: else if (i == 11)
	movf	(recive_task@i),w
	xorlw	0Bh
	skipz
	goto	u6541
	goto	u6540
u6541:
	goto	l17468
u6540:
	line	618
	
l17466:	
;recive.c: 617: {
;recive.c: 618: KEY2.channel_status = 0;
	clrf	(_KEY2)
	line	589
	
l17468:	
	incf	(recive_task@i),f
	goto	l17438
	line	571
	
l17472:	
	incf	(recive_task@i),f
	
l17474:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u6551
	goto	u6550
u6551:
	goto	l17414
u6550:
	goto	l17730
	line	630
	
l9936:	
	line	632
;recive.c: 627: }
;recive.c: 629: }
;recive.c: 630: }
;recive.c: 632: }
	goto	l17730
	line	633
	
l17476:	
;recive.c: 633: else if (rf_buf[8] == (0x21))
	movf	0+(_rf_buf)+08h,w
	xorlw	021h
	skipz
	goto	u6561
	goto	u6560
u6561:
	goto	l17570
u6560:
	line	635
	
l17478:	
;recive.c: 634: {
;recive.c: 635: match_flag = 0;
	clrf	(recive_task@match_flag)
	line	636
;recive.c: 636: for(i= 0; i< 12; i++)
	clrf	(recive_task@i)
	
l17480:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u6571
	goto	u6570
u6571:
	goto	l17484
u6570:
	goto	l17502
	line	641
	
l17484:	
;recive.c: 637: {
;recive.c: 638: if((rf_buf[3] == control_id[i][0])
;recive.c: 639: &&(rf_buf[4] == control_id[i][1])
;recive.c: 640: &&(rf_buf[5] == control_id[i][2])
;recive.c: 641: &&(rf_buf[6] == control_id[i][3]))
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
	goto	u6581
	goto	u6580
u6581:
	goto	l17498
u6580:
	
l17486:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+01h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+04h,w
	xorwf	indf,w
	skipz
	goto	u6591
	goto	u6590
u6591:
	goto	l17498
u6590:
	
l17488:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+02h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+05h,w
	xorwf	indf,w
	skipz
	goto	u6601
	goto	u6600
u6601:
	goto	l17498
u6600:
	
l17490:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+03h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+06h,w
	xorwf	indf,w
	skipz
	goto	u6611
	goto	u6610
u6611:
	goto	l17498
u6610:
	line	643
	
l17492:	
;recive.c: 642: {
;recive.c: 643: if(rf_buf[2] != control_id[i][5])
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	xorwf	indf,w
	skipnz
	goto	u6621
	goto	u6620
u6621:
	goto	l17502
u6620:
	line	645
	
l17494:	
;recive.c: 644: {
;recive.c: 645: control_id[i][5] = rf_buf[2];
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	movwf	indf
	line	646
	
l17496:	
;recive.c: 646: match_flag = 1;
	clrf	(recive_task@match_flag)
	incf	(recive_task@match_flag),f
	goto	l17502
	line	636
	
l17498:	
	incf	(recive_task@i),f
	goto	l17480
	line	652
	
l17502:	
;recive.c: 649: }
;recive.c: 650: }
;recive.c: 652: if (match_flag && rf_buf[9] < (6) && rf_buf[10] <= (1) && rf_buf[11] < (3))
	movf	(recive_task@match_flag),w
	skipz
	goto	u6630
	goto	l17730
u6630:
	
l17504:	
	movlw	(06h)
	subwf	0+(_rf_buf)+09h,w
	skipnc
	goto	u6641
	goto	u6640
u6641:
	goto	l17730
u6640:
	
l17506:	
	movlw	(02h)
	subwf	0+(_rf_buf)+0Ah,w
	skipnc
	goto	u6651
	goto	u6650
u6651:
	goto	l17730
u6650:
	
l17508:	
	movlw	(03h)
	subwf	0+(_rf_buf)+0Bh,w
	skipnc
	goto	u6661
	goto	u6660
u6661:
	goto	l17730
u6660:
	line	655
	
l17510:	
;recive.c: 653: {
;recive.c: 655: if (rf_buf[10] == (0))
	movf	0+(_rf_buf)+0Ah,f
	skipz
	goto	u6671
	goto	u6670
u6671:
	goto	l17514
u6670:
	line	657
	
l17512:	
;recive.c: 656: {
;recive.c: 657: control_id[9 + rf_buf[11]][4] &= (~ (0x01 << rf_buf[9]));
	movlw	(06h)
	movwf	(?___bmul)
	movf	0+(_rf_buf)+0Bh,w
	fcall	___bmul
	addlw	_control_id+03Ah&0ffh
	movwf	fsr0
	movlw	(01h)
	movwf	(??_recive_task+0)+0
	incf	0+(_rf_buf)+09h,w
	goto	u6684
u6685:
	clrc
	rlf	(??_recive_task+0)+0,f
u6684:
	addlw	-1
	skipz
	goto	u6685
	movf	0+(??_recive_task+0)+0,w
	xorlw	0ffh
	bcf	status, 7	;select IRP bank1
	andwf	indf,f
	line	658
;recive.c: 658: }
	goto	l9964
	line	661
	
l17514:	
;recive.c: 659: else
;recive.c: 660: {
;recive.c: 661: control_id[9 + rf_buf[11]][4] |= ((0x01 << rf_buf[9]));
	movlw	(06h)
	movwf	(?___bmul)
	movf	0+(_rf_buf)+0Bh,w
	fcall	___bmul
	addlw	_control_id+03Ah&0ffh
	movwf	fsr0
	movlw	(01h)
	movwf	(??_recive_task+0)+0
	incf	0+(_rf_buf)+09h,w
	goto	u6694
u6695:
	clrc
	rlf	(??_recive_task+0)+0,f
u6694:
	addlw	-1
	skipz
	goto	u6695
	movf	0+(??_recive_task+0)+0,w
	bcf	status, 7	;select IRP bank1
	iorwf	indf,f
	line	662
	
l9964:	
	line	664
;recive.c: 662: }
;recive.c: 664: AT24C02_Write_Msg(9 * 6 + rf_buf[11] * 6 + 4, &control_id[9 + rf_buf[11]][4], 1);
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
	line	665
	
l17516:	
;recive.c: 665: soft_delay_ms(1);
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	668
	
l17518:	
;recive.c: 668: for(i = 0; i < 12; i++)
	clrf	(recive_task@i)
	
l17520:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u6701
	goto	u6700
u6701:
	goto	l17524
u6700:
	goto	l17530
	line	670
	
l17524:	
;recive.c: 669: {
;recive.c: 670: AT24C02_Read_Msg(i * 6, control_id[i], 6);
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
	line	668
	
l17526:	
	incf	(recive_task@i),f
	goto	l17520
	line	672
	
l17530:	
;recive.c: 671: }
;recive.c: 672: AT24C02_Read_Msg(110, &channel_flag, 1);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Read_Msg)
	clrf	0+(?_AT24C02_Read_Msg)+01h
	incf	0+(?_AT24C02_Read_Msg)+01h,f
	movlw	(06Eh)
	fcall	_AT24C02_Read_Msg
	line	675
	
l17532:	
;recive.c: 675: if (rf_buf[10] == (1))
	decf	0+(_rf_buf)+0Ah,w
	skipz
	goto	u6711
	goto	u6710
u6711:
	goto	l17546
u6710:
	line	677
	
l17534:	
;recive.c: 676: {
;recive.c: 677: if (0 == rf_buf[11])
	movf	0+(_rf_buf)+0Bh,f
	skipz
	goto	u6721
	goto	u6720
u6721:
	goto	l17538
u6720:
	line	679
	
l17536:	
;recive.c: 678: {
;recive.c: 679: KEY0.channel_status = 1;
	clrf	(_KEY0)
	incf	(_KEY0),f
	line	680
;recive.c: 680: }
	goto	l17560
	line	681
	
l17538:	
;recive.c: 681: else if (1 == rf_buf[11])
	decf	0+(_rf_buf)+0Bh,w
	skipz
	goto	u6731
	goto	u6730
u6731:
	goto	l17542
u6730:
	line	683
	
l17540:	
;recive.c: 682: {
;recive.c: 683: KEY1.channel_status = 1;
	clrf	(_KEY1)
	incf	(_KEY1),f
	line	684
;recive.c: 684: }
	goto	l17560
	line	685
	
l17542:	
;recive.c: 685: else if (2 == rf_buf[11])
	movf	0+(_rf_buf)+0Bh,w
	xorlw	02h
	skipz
	goto	u6741
	goto	u6740
u6741:
	goto	l9969
u6740:
	line	687
	
l17544:	
;recive.c: 686: {
;recive.c: 687: KEY2.channel_status = 1;
	clrf	(_KEY2)
	incf	(_KEY2),f
	goto	l17560
	line	689
	
l9969:	
;recive.c: 688: }
;recive.c: 689: }
	goto	l17560
	line	690
	
l17546:	
;recive.c: 690: else if (rf_buf[10] == (0))
	movf	0+(_rf_buf)+0Ah,f
	skipz
	goto	u6751
	goto	u6750
u6751:
	goto	l17560
u6750:
	line	692
	
l17548:	
;recive.c: 691: {
;recive.c: 692: if (0 == rf_buf[11])
	movf	0+(_rf_buf)+0Bh,f
	skipz
	goto	u6761
	goto	u6760
u6761:
	goto	l17552
u6760:
	line	694
	
l17550:	
;recive.c: 693: {
;recive.c: 694: KEY0.channel_status = 0;
	clrf	(_KEY0)
	line	695
;recive.c: 695: }
	goto	l17560
	line	696
	
l17552:	
;recive.c: 696: else if (1 == rf_buf[11])
	decf	0+(_rf_buf)+0Bh,w
	skipz
	goto	u6771
	goto	u6770
u6771:
	goto	l17556
u6770:
	line	698
	
l17554:	
;recive.c: 697: {
;recive.c: 698: KEY1.channel_status = 0;
	clrf	(_KEY1)
	line	699
;recive.c: 699: }
	goto	l17560
	line	700
	
l17556:	
;recive.c: 700: else if (2 == rf_buf[11])
	movf	0+(_rf_buf)+0Bh,w
	xorlw	02h
	skipz
	goto	u6781
	goto	u6780
u6781:
	goto	l9969
u6780:
	line	702
	
l17558:	
;recive.c: 701: {
;recive.c: 702: KEY2.channel_status = 0;
	clrf	(_KEY2)
	line	706
	
l17560:	
;recive.c: 703: }
;recive.c: 704: }
;recive.c: 706: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l17562:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	707
	
l17564:	
;recive.c: 707: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	708
	
l17566:	
;recive.c: 708: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l17568:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	goto	l17730
	line	712
	
l17570:	
;recive.c: 712: else if (rf_buf[8] == (0x10))
	movf	0+(_rf_buf)+08h,w
	xorlw	010h
	skipz
	goto	u6791
	goto	u6790
u6791:
	goto	l17730
u6790:
	line	714
	
l17572:	
;recive.c: 713: {
;recive.c: 714: if(rf_buf[10] != 0xff)
	movf	0+(_rf_buf)+0Ah,w
	xorlw	0FFh
	skipnz
	goto	u6801
	goto	u6800
u6801:
	goto	l17652
u6800:
	line	716
	
l17574:	
;recive.c: 715: {
;recive.c: 716: for(i=0; i<9; i++)
	clrf	(recive_task@i)
	
l17576:	
	movlw	(09h)
	subwf	(recive_task@i),w
	skipc
	goto	u6811
	goto	u6810
u6811:
	goto	l17580
u6810:
	goto	l17730
	line	721
	
l17580:	
;recive.c: 717: {
;recive.c: 718: if((rf_buf[3] == control_id[i][0])
;recive.c: 719: &&(rf_buf[4] == control_id[i][1])
;recive.c: 720: &&(rf_buf[5] == control_id[i][2])
;recive.c: 721: &&(rf_buf[6] == control_id[i][3]))
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
	goto	u6821
	goto	u6820
u6821:
	goto	l17648
u6820:
	
l17582:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+01h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+04h,w
	xorwf	indf,w
	skipz
	goto	u6831
	goto	u6830
u6831:
	goto	l17648
u6830:
	
l17584:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+02h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+05h,w
	xorwf	indf,w
	skipz
	goto	u6841
	goto	u6840
u6841:
	goto	l17648
u6840:
	
l17586:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+03h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+06h,w
	xorwf	indf,w
	skipz
	goto	u6851
	goto	u6850
u6851:
	goto	l17648
u6850:
	line	723
	
l17588:	
;recive.c: 722: {
;recive.c: 723: if(rf_buf[2] != control_id[i][5])
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	xorwf	indf,w
	skipnz
	goto	u6861
	goto	u6860
u6861:
	goto	l17648
u6860:
	line	725
	
l17590:	
;recive.c: 724: {
;recive.c: 725: control_id[i][5] = rf_buf[2];
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	movwf	indf
	line	726
;recive.c: 726: if(rf_buf[10] == control_id[i][4])
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+04h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+0Ah,w
	xorwf	indf,w
	skipz
	goto	u6871
	goto	u6870
u6871:
	goto	l17648
u6870:
	line	728
	
l17592:	
;recive.c: 727: {
;recive.c: 728: if(flag == 0)
	movf	(recive_task@flag),f
	skipz
	goto	u6881
	goto	u6880
u6881:
	goto	l17602
u6880:
	line	730
	
l17594:	
;recive.c: 729: {
;recive.c: 730: flag = 1;
	clrf	(recive_task@flag)
	incf	(recive_task@flag),f
	line	731
;recive.c: 731: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	732
	
l17596:	
;recive.c: 732: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	733
	
l17598:	
;recive.c: 733: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l17600:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	736
	
l17602:	
;recive.c: 734: }
;recive.c: 736: if(rf_buf[11] == 0)
	movf	0+(_rf_buf)+0Bh,f
	skipz
	goto	u6891
	goto	u6890
u6891:
	goto	l17632
u6890:
	line	738
	
l17604:	
;recive.c: 737: {
;recive.c: 738: if(i < 3)
	movlw	(03h)
	subwf	(recive_task@i),w
	skipnc
	goto	u6901
	goto	u6900
u6901:
	goto	l17614
u6900:
	line	740
	
l17606:	
;recive.c: 739: {
;recive.c: 740: if((KEY0_FLAG == 0))
	movf	(_KEY0_FLAG),f
	skipz
	goto	u6911
	goto	u6910
u6911:
	goto	l17648
u6910:
	line	742
	
l17608:	
;recive.c: 741: {
;recive.c: 742: if(rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u6921
	goto	u6920
u6921:
	goto	l17612
u6920:
	line	743
	
l17610:	
;recive.c: 743: KEY0.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY0),f
	goto	l17648
	line	745
	
l17612:	
;recive.c: 744: else
;recive.c: 745: KEY0.channel_status = rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	(_KEY0)
	goto	l17648
	line	748
	
l17614:	
;recive.c: 748: else if(i < 6)
	movlw	(06h)
	subwf	(recive_task@i),w
	skipnc
	goto	u6931
	goto	u6930
u6931:
	goto	l17624
u6930:
	line	750
	
l17616:	
;recive.c: 749: {
;recive.c: 750: if((KEY1_FLAG == 0))
	movf	(_KEY1_FLAG),f
	skipz
	goto	u6941
	goto	u6940
u6941:
	goto	l17648
u6940:
	line	752
	
l17618:	
;recive.c: 751: {
;recive.c: 752: if(rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u6951
	goto	u6950
u6951:
	goto	l17622
u6950:
	line	753
	
l17620:	
;recive.c: 753: KEY1.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY1),f
	goto	l17648
	line	755
	
l17622:	
;recive.c: 754: else
;recive.c: 755: KEY1.channel_status = rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	(_KEY1)
	goto	l17648
	line	761
	
l17624:	
;recive.c: 759: else
;recive.c: 760: {
;recive.c: 761: if((KEY2_FLAG == 0))
	movf	(_KEY2_FLAG),f
	skipz
	goto	u6961
	goto	u6960
u6961:
	goto	l10003
u6960:
	line	763
	
l17626:	
;recive.c: 762: {
;recive.c: 763: if(rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u6971
	goto	u6970
u6971:
	goto	l17630
u6970:
	line	764
	
l17628:	
;recive.c: 764: KEY2.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY2),f
	goto	l17648
	line	766
	
l17630:	
;recive.c: 765: else
;recive.c: 766: KEY2.channel_status = rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	(_KEY2)
	goto	l17648
	line	772
	
l17632:	
;recive.c: 770: else
;recive.c: 771: {
;recive.c: 772: flag_5min_add = 0;
	clrf	(_flag_5min_add)
	clrf	(_flag_5min_add+1)
	line	773
	
l17634:	
;recive.c: 773: if(delay_flag == 1)
	decf	(_delay_flag),w
	skipz
	goto	u6981
	goto	u6980
u6981:
	goto	l17638
u6980:
	line	775
	
l17636:	
;recive.c: 774: {
;recive.c: 775: channel_delay[0] = 0;
	clrf	(_channel_delay)
	line	776
;recive.c: 776: delay_flag = 0;
	clrf	(_delay_flag)
	line	778
	
l17638:	
;recive.c: 777: }
;recive.c: 778: if(i < 3)
	movlw	(03h)
	subwf	(recive_task@i),w
	skipnc
	goto	u6991
	goto	u6990
u6991:
	goto	l17642
u6990:
	line	780
	
l17640:	
;recive.c: 779: {
;recive.c: 780: channel_delay[0] |= 0x01;
	bsf	(_channel_delay)+(0/8),(0)&7
	line	781
;recive.c: 781: }
	goto	l17646
	line	782
	
l17642:	
;recive.c: 782: else if(i < 6)
	movlw	(06h)
	subwf	(recive_task@i),w
	skipnc
	goto	u7001
	goto	u7000
u7001:
	goto	l10007
u7000:
	line	784
	
l17644:	
;recive.c: 783: {
;recive.c: 784: channel_delay[0] |= 0x02;
	bsf	(_channel_delay)+(1/8),(1)&7
	line	785
;recive.c: 785: }
	goto	l17646
	line	786
	
l10007:	
	line	788
;recive.c: 786: else
;recive.c: 787: {
;recive.c: 788: channel_delay[0] |= 0x04;
	bsf	(_channel_delay)+(2/8),(2)&7
	line	790
	
l17646:	
;recive.c: 789: }
;recive.c: 790: channel_delay[1] = rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	0+(_channel_delay)+01h
	line	791
;recive.c: 791: channel_delay[2] = rf_buf[11];
	movf	0+(_rf_buf)+0Bh,w
	movwf	0+(_channel_delay)+02h
	goto	l17648
	line	792
	
l10003:	
	line	716
	
l17648:	
	incf	(recive_task@i),f
	goto	l17576
	line	801
	
l17652:	
;recive.c: 799: else
;recive.c: 800: {
;recive.c: 801: for(i = 0; i < 9; i++)
	clrf	(recive_task@i)
	
l17654:	
	movlw	(09h)
	subwf	(recive_task@i),w
	skipc
	goto	u7011
	goto	u7010
u7011:
	goto	l17658
u7010:
	goto	l17730
	line	806
	
l17658:	
;recive.c: 802: {
;recive.c: 803: if((rf_buf[3] == control_id[i][0])
;recive.c: 804: &&(rf_buf[4] == control_id[i][1])
;recive.c: 805: &&(rf_buf[5] == control_id[i][2])
;recive.c: 806: &&(rf_buf[6] == control_id[i][3]))
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
	goto	u7021
	goto	u7020
u7021:
	goto	l17726
u7020:
	
l17660:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+01h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+04h,w
	xorwf	indf,w
	skipz
	goto	u7031
	goto	u7030
u7031:
	goto	l17726
u7030:
	
l17662:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+02h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+05h,w
	xorwf	indf,w
	skipz
	goto	u7041
	goto	u7040
u7041:
	goto	l17726
u7040:
	
l17664:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+03h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+06h,w
	xorwf	indf,w
	skipz
	goto	u7051
	goto	u7050
u7051:
	goto	l17726
u7050:
	line	808
	
l17666:	
;recive.c: 807: {
;recive.c: 808: if((rf_buf[2] != control_id[i][5]))
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	xorwf	indf,w
	skipnz
	goto	u7061
	goto	u7060
u7061:
	goto	l17726
u7060:
	line	810
	
l17668:	
;recive.c: 809: {
;recive.c: 810: control_id[i][5] = rf_buf[2];
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	movwf	indf
	line	811
	
l17670:	
;recive.c: 811: if(flag == 0)
	movf	(recive_task@flag),f
	skipz
	goto	u7071
	goto	u7070
u7071:
	goto	l17680
u7070:
	line	813
	
l17672:	
;recive.c: 812: {
;recive.c: 813: flag = 1;
	clrf	(recive_task@flag)
	incf	(recive_task@flag),f
	line	814
;recive.c: 814: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	815
	
l17674:	
;recive.c: 815: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	816
	
l17676:	
;recive.c: 816: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l17678:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	818
	
l17680:	
;recive.c: 817: }
;recive.c: 818: if((rf_buf[11] == 0))
	movf	0+(_rf_buf)+0Bh,f
	skipz
	goto	u7081
	goto	u7080
u7081:
	goto	l17710
u7080:
	line	820
	
l17682:	
;recive.c: 819: {
;recive.c: 820: if(i < 3)
	movlw	(03h)
	subwf	(recive_task@i),w
	skipnc
	goto	u7091
	goto	u7090
u7091:
	goto	l17692
u7090:
	line	822
	
l17684:	
;recive.c: 821: {
;recive.c: 822: if((KEY0_FLAG == 0))
	movf	(_KEY0_FLAG),f
	skipz
	goto	u7101
	goto	u7100
u7101:
	goto	l17726
u7100:
	line	824
	
l17686:	
;recive.c: 823: {
;recive.c: 824: if(rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u7111
	goto	u7110
u7111:
	goto	l17690
u7110:
	line	825
	
l17688:	
;recive.c: 825: KEY0.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY0),f
	goto	l17726
	line	827
	
l17690:	
;recive.c: 826: else
;recive.c: 827: KEY0.channel_status = rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	(_KEY0)
	goto	l17726
	line	830
	
l17692:	
;recive.c: 830: else if(i < 6)
	movlw	(06h)
	subwf	(recive_task@i),w
	skipnc
	goto	u7121
	goto	u7120
u7121:
	goto	l17702
u7120:
	line	832
	
l17694:	
;recive.c: 831: {
;recive.c: 832: if((KEY1_FLAG == 0))
	movf	(_KEY1_FLAG),f
	skipz
	goto	u7131
	goto	u7130
u7131:
	goto	l17726
u7130:
	line	834
	
l17696:	
;recive.c: 833: {
;recive.c: 834: if(rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u7141
	goto	u7140
u7141:
	goto	l17700
u7140:
	line	835
	
l17698:	
;recive.c: 835: KEY1.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY1),f
	goto	l17726
	line	837
	
l17700:	
;recive.c: 836: else
;recive.c: 837: KEY1.channel_status = rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	(_KEY1)
	goto	l17726
	line	842
	
l17702:	
;recive.c: 840: else
;recive.c: 841: {
;recive.c: 842: if((KEY2_FLAG == 0))
	movf	(_KEY2_FLAG),f
	skipz
	goto	u7151
	goto	u7150
u7151:
	goto	l10029
u7150:
	line	844
	
l17704:	
;recive.c: 843: {
;recive.c: 844: if(rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u7161
	goto	u7160
u7161:
	goto	l17708
u7160:
	line	845
	
l17706:	
;recive.c: 845: KEY2.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY2),f
	goto	l17726
	line	847
	
l17708:	
;recive.c: 846: else
;recive.c: 847: KEY2.channel_status = rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	(_KEY2)
	goto	l17726
	line	853
	
l17710:	
;recive.c: 851: else
;recive.c: 852: {
;recive.c: 853: flag_5min_add = 0;
	clrf	(_flag_5min_add)
	clrf	(_flag_5min_add+1)
	line	854
	
l17712:	
;recive.c: 854: if(delay_flag == 1)
	decf	(_delay_flag),w
	skipz
	goto	u7171
	goto	u7170
u7171:
	goto	l17716
u7170:
	line	856
	
l17714:	
;recive.c: 855: {
;recive.c: 856: channel_delay[0] = 0;
	clrf	(_channel_delay)
	line	857
;recive.c: 857: delay_flag = 0;
	clrf	(_delay_flag)
	line	859
	
l17716:	
;recive.c: 858: }
;recive.c: 859: if(i < 3)
	movlw	(03h)
	subwf	(recive_task@i),w
	skipnc
	goto	u7181
	goto	u7180
u7181:
	goto	l17720
u7180:
	line	861
	
l17718:	
;recive.c: 860: {
;recive.c: 861: channel_delay[0] |= 0x01;
	bsf	(_channel_delay)+(0/8),(0)&7
	line	862
;recive.c: 862: }
	goto	l17724
	line	863
	
l17720:	
;recive.c: 863: else if(i<6)
	movlw	(06h)
	subwf	(recive_task@i),w
	skipnc
	goto	u7191
	goto	u7190
u7191:
	goto	l10033
u7190:
	line	865
	
l17722:	
;recive.c: 864: {
;recive.c: 865: channel_delay[0] |= 0x02;
	bsf	(_channel_delay)+(1/8),(1)&7
	line	866
;recive.c: 866: }
	goto	l17724
	line	867
	
l10033:	
	line	869
;recive.c: 867: else
;recive.c: 868: {
;recive.c: 869: channel_delay[0] |= 0x04;
	bsf	(_channel_delay)+(2/8),(2)&7
	line	871
	
l17724:	
;recive.c: 870: }
;recive.c: 871: channel_delay[1] = rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	0+(_channel_delay)+01h
	line	872
;recive.c: 872: channel_delay[2] = rf_buf[11];
	movf	0+(_rf_buf)+0Bh,w
	movwf	0+(_channel_delay)+02h
	goto	l17726
	line	873
	
l10029:	
	line	801
	
l17726:	
	incf	(recive_task@i),f
	goto	l17654
	line	882
	
l17730:	
;recive.c: 873: }
;recive.c: 875: }
;recive.c: 876: }
;recive.c: 877: }
;recive.c: 878: }
;recive.c: 879: }
;recive.c: 882: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	883
;recive.c: 883: RF_ClearFIFO();
	fcall	_RF_ClearFIFO
	line	884
;recive.c: 884: RF_ClearStatus();
	fcall	_RF_ClearStatus
	goto	l10035
	line	130
	
l17734:	
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
	goto	l17404
	xorlw	2^1	; case 2
	skipnz
	goto	l9843
	xorlw	3^2	; case 3
	skipnz
	goto	l9826
	goto	l10035
	opt asmopt_on

	line	890
	
l10035:	
	return
	opt stack 0
GLOBAL	__end_of_recive_task
	__end_of_recive_task:
;; =============== function _recive_task ends ============

	signat	_recive_task,88
	global	_loadParamsFromEeprom
psect	text1129,local,class=CODE,delta=2
global __ptext1129
__ptext1129:

;; *************** function _loadParamsFromEeprom *****************
;; Defined at:
;;		line 57 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   11[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  662[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		___bmul
;;		_AT24C02_Read_Msg
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1129
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\main.c"
	line	57
	global	__size_of_loadParamsFromEeprom
	__size_of_loadParamsFromEeprom	equ	__end_of_loadParamsFromEeprom-_loadParamsFromEeprom
	
_loadParamsFromEeprom:	
	opt	stack 0
; Regs used in _loadParamsFromEeprom: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	60
	
l16886:	
;main.c: 58: unsigned char i;
;main.c: 60: for(i=0; i<12; i++)
	clrf	(loadParamsFromEeprom@i)
	
l16888:	
	movlw	(0Ch)
	subwf	(loadParamsFromEeprom@i),w
	skipc
	goto	u5541
	goto	u5540
u5541:
	goto	l16892
u5540:
	goto	l16898
	line	62
	
l16892:	
;main.c: 61: {
;main.c: 62: AT24C02_Read_Msg(i*6, control_id[i], 6);
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
	line	60
	
l16894:	
	incf	(loadParamsFromEeprom@i),f
	goto	l16888
	line	65
	
l16898:	
;main.c: 63: }
;main.c: 65: AT24C02_Read_Msg(110, &channel_flag, 1);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Read_Msg)
	clrf	0+(?_AT24C02_Read_Msg)+01h
	incf	0+(?_AT24C02_Read_Msg)+01h,f
	movlw	(06Eh)
	fcall	_AT24C02_Read_Msg
	line	74
	
l665:	
	return
	opt stack 0
GLOBAL	__end_of_loadParamsFromEeprom
	__end_of_loadParamsFromEeprom:
;; =============== function _loadParamsFromEeprom ends ============

	signat	_loadParamsFromEeprom,90
	global	_rx_data
psect	text1130,local,class=CODE,delta=2
global __ptext1130
__ptext1130:

;; *************** function _rx_data *****************
;; Defined at:
;;		line 80 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\recive.c"
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
psect	text1130
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\recive.c"
	line	80
	global	__size_of_rx_data
	__size_of_rx_data	equ	__end_of_rx_data-_rx_data
	
_rx_data:	
;; using string table level
	opt	stack 1
; Regs used in _rx_data: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	81
	
l16820:	
;recive.c: 81: unsigned char rx_flag = 0;
	clrf	(rx_data@rx_flag)
	line	83
;recive.c: 83: unsigned char i = 0;
	clrf	(rx_data@i)
	line	84
;recive.c: 84: unsigned int crc16 = 0;
	clrf	(rx_data@crc16)
	clrf	(rx_data@crc16+1)
	line	86
	
l16822:	
;recive.c: 86: if(RF_RxData(rf_buf,18))
	movlw	(012h)
	movwf	(?_RF_RxData)
	movlw	(_rf_buf)&0ffh
	fcall	_RF_RxData
	xorlw	0
	skipnz
	goto	u5411
	goto	u5410
u5411:
	goto	l16882
u5410:
	line	88
	
l16824:	
;recive.c: 87: {
;recive.c: 88: for(i = 0; i < 18; i++)
	clrf	(rx_data@i)
	line	90
	
l16830:	
;recive.c: 89: {
;recive.c: 90: rf_buf[i] = rf_buf[i] ^ crc_2_4G_lib[3+i] ^ ble_crc_38[21+i];
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
	line	88
	
l16832:	
	incf	(rx_data@i),f
	
l16834:	
	movlw	(012h)
	subwf	(rx_data@i),w
	skipc
	goto	u5421
	goto	u5420
u5421:
	goto	l16830
u5420:
	line	92
	
l16836:	
;recive.c: 91: }
;recive.c: 92: crc16 = rf_buf[16] + rf_buf[17] * 256;
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
	line	93
	
l16838:	
;recive.c: 93: for(i = 0; i < 16; i++)
	clrf	(rx_data@i)
	line	95
	
l16844:	
;recive.c: 94: {
;recive.c: 95: rf_buf[i] = rf_buf[i] ^ crc_lab[i];
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
	line	93
	
l16846:	
	incf	(rx_data@i),f
	
l16848:	
	movlw	(010h)
	subwf	(rx_data@i),w
	skipc
	goto	u5431
	goto	u5430
u5431:
	goto	l16844
u5430:
	line	97
	
l16850:	
;recive.c: 96: }
;recive.c: 97: rand = rf_buf[15];
	movf	0+(_rf_buf)+0Fh,w
	movwf	(rx_data@rand)
	line	98
;recive.c: 98: for(i = 7; i < 15; i++)
	movlw	(07h)
	movwf	(rx_data@i)
	line	100
	
l16854:	
;recive.c: 99: {
;recive.c: 100: rf_buf[i] ^= rand;
	movf	(rx_data@i),w
	addlw	_rf_buf&0ffh
	movwf	fsr0
	movf	(rx_data@rand),w
	xorwf	indf,f
	line	98
	
l16856:	
	incf	(rx_data@i),f
	
l16858:	
	movlw	(0Fh)
	subwf	(rx_data@i),w
	skipc
	goto	u5441
	goto	u5440
u5441:
	goto	l16854
u5440:
	line	102
	
l16860:	
;recive.c: 101: }
;recive.c: 102: if(crc16 == UpdateCRC(rf_buf,16) )
	movlw	010h
	movwf	(?_UpdateCRC)
	clrf	(?_UpdateCRC+1)
	movlw	(_rf_buf)&0ffh
	fcall	_UpdateCRC
	movf	(rx_data@crc16+1),w
	xorwf	(1+(?_UpdateCRC)),w
	skipz
	goto	u5455
	movf	(rx_data@crc16),w
	xorwf	(0+(?_UpdateCRC)),w
u5455:

	skipz
	goto	u5451
	goto	u5450
u5451:
	goto	l16882
u5450:
	line	104
	
l16862:	
;recive.c: 103: {
;recive.c: 104: if((rf_buf[3] == 0) && (rf_buf[4] == 0) && (rf_buf[5] == 0) && (rf_buf[6] == 0))
	movf	0+(_rf_buf)+03h,f
	skipz
	goto	u5461
	goto	u5460
u5461:
	goto	l16872
u5460:
	
l16864:	
	movf	0+(_rf_buf)+04h,f
	skipz
	goto	u5471
	goto	u5470
u5471:
	goto	l16872
u5470:
	
l16866:	
	movf	0+(_rf_buf)+05h,f
	skipz
	goto	u5481
	goto	u5480
u5481:
	goto	l16872
u5480:
	
l16868:	
	movf	0+(_rf_buf)+06h,f
	skipz
	goto	u5491
	goto	u5490
u5491:
	goto	l16872
u5490:
	line	106
	
l16870:	
;recive.c: 105: {
;recive.c: 106: rx_flag=0;
	clrf	(rx_data@rx_flag)
	line	107
;recive.c: 107: }
	goto	l16882
	line	108
	
l16872:	
;recive.c: 108: else if((rf_buf[3] == 0xff) && (rf_buf[4] == 0xff) && (rf_buf[5] == 0xff) && (rf_buf[6] == 0xff))
	movf	0+(_rf_buf)+03h,w
	xorlw	0FFh
	skipz
	goto	u5501
	goto	u5500
u5501:
	goto	l9820
u5500:
	
l16874:	
	movf	0+(_rf_buf)+04h,w
	xorlw	0FFh
	skipz
	goto	u5511
	goto	u5510
u5511:
	goto	l9820
u5510:
	
l16876:	
	movf	0+(_rf_buf)+05h,w
	xorlw	0FFh
	skipz
	goto	u5521
	goto	u5520
u5521:
	goto	l9820
u5520:
	
l16878:	
	movf	0+(_rf_buf)+06h,w
	xorlw	0FFh
	skipz
	goto	u5531
	goto	u5530
u5531:
	goto	l9820
u5530:
	goto	l16870
	line	112
	
l9820:	
	line	113
;recive.c: 112: else
;recive.c: 113: rx_flag = 1;
	clrf	(rx_data@rx_flag)
	incf	(rx_data@rx_flag),f
	line	117
	
l16882:	
;recive.c: 114: }
;recive.c: 116: }
;recive.c: 117: return rx_flag;
	movf	(rx_data@rx_flag),w
	line	118
	
l9822:	
	return
	opt stack 0
GLOBAL	__end_of_rx_data
	__end_of_rx_data:
;; =============== function _rx_data ends ============

	signat	_rx_data,89
	global	_AT24C02_Read_Msg
psect	text1131,local,class=CODE,delta=2
global __ptext1131
__ptext1131:

;; *************** function _AT24C02_Read_Msg *****************
;; Defined at:
;;		line 53 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\e2prom.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;;  data            1    6[BANK0 ] PTR unsigned char 
;;		 -> channel_flag(1), control_id(72), 
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
;;		_loadParamsFromEeprom
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1131
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\e2prom.c"
	line	53
	global	__size_of_AT24C02_Read_Msg
	__size_of_AT24C02_Read_Msg	equ	__end_of_AT24C02_Read_Msg-_AT24C02_Read_Msg
	
_AT24C02_Read_Msg:	
	opt	stack 0
; Regs used in _AT24C02_Read_Msg: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;AT24C02_Read_Msg@addr stored from wreg
	movwf	(AT24C02_Read_Msg@addr)
	line	54
	
l16808:	
;e2prom.c: 54: unsigned char i=0;
	clrf	(AT24C02_Read_Msg@i)
	line	55
;e2prom.c: 55: for(i=0;i<len;i++)
	clrf	(AT24C02_Read_Msg@i)
	goto	l16818
	line	57
	
l16810:	
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
	
l16812:	
;e2prom.c: 58: addr++;
	incf	(AT24C02_Read_Msg@addr),f
	line	59
	
l16814:	
;e2prom.c: 59: soft_delay_ms(1);
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	55
	
l16816:	
	incf	(AT24C02_Read_Msg@i),f
	
l16818:	
	movf	(AT24C02_Read_Msg@len),w
	subwf	(AT24C02_Read_Msg@i),w
	skipc
	goto	u5401
	goto	u5400
u5401:
	goto	l16810
u5400:
	line	61
	
l11391:	
	return
	opt stack 0
GLOBAL	__end_of_AT24C02_Read_Msg
	__end_of_AT24C02_Read_Msg:
;; =============== function _AT24C02_Read_Msg ends ============

	signat	_AT24C02_Read_Msg,12408
	global	_AT24C02_Read_Byte
psect	text1132,local,class=CODE,delta=2
global __ptext1132
__ptext1132:

;; *************** function _AT24C02_Read_Byte *****************
;; Defined at:
;;		line 21 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\e2prom.c"
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
psect	text1132
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\e2prom.c"
	line	21
	global	__size_of_AT24C02_Read_Byte
	__size_of_AT24C02_Read_Byte	equ	__end_of_AT24C02_Read_Byte-_AT24C02_Read_Byte
	
_AT24C02_Read_Byte:	
	opt	stack 0
; Regs used in _AT24C02_Read_Byte: [wreg+status,2+status,0+pclath+cstack]
;AT24C02_Read_Byte@addr stored from wreg
	movwf	(AT24C02_Read_Byte@addr)
	line	22
	
l15506:	
	line	23
	
l15508:	
;e2prom.c: 23: IIC_START();
	fcall	_IIC_START
	line	25
	
l15510:	
;e2prom.c: 25: I2C_SendByte(0XA0);
	movlw	(0A0h)
	fcall	_I2C_SendByte
	line	26
	
l15512:	
;e2prom.c: 26: IIC_Wait_ACK();
	fcall	_IIC_Wait_ACK
	line	27
	
l15514:	
;e2prom.c: 27: I2C_SendByte(addr);
	movf	(AT24C02_Read_Byte@addr),w
	fcall	_I2C_SendByte
	line	28
	
l15516:	
;e2prom.c: 28: IIC_Wait_ACK();
	fcall	_IIC_Wait_ACK
	line	31
	
l15518:	
;e2prom.c: 31: IIC_START();
	fcall	_IIC_START
	line	32
	
l15520:	
;e2prom.c: 32: I2C_SendByte(0XA1);
	movlw	(0A1h)
	fcall	_I2C_SendByte
	line	33
	
l15522:	
;e2prom.c: 33: IIC_Wait_ACK();
	fcall	_IIC_Wait_ACK
	line	34
	
l15524:	
;e2prom.c: 34: temp = I2C_ReadByte(1);
	movlw	(01h)
	fcall	_I2C_ReadByte
	movf	(0+(?_I2C_ReadByte)),w
	movwf	(AT24C02_Read_Byte@temp)
	line	35
	
l15526:	
;e2prom.c: 35: IIC_STOP();
	fcall	_IIC_STOP
	line	37
	
l15528:	
;e2prom.c: 37: return temp;
	movf	(AT24C02_Read_Byte@temp),w
	line	38
	
l11379:	
	return
	opt stack 0
GLOBAL	__end_of_AT24C02_Read_Byte
	__end_of_AT24C02_Read_Byte:
;; =============== function _AT24C02_Read_Byte ends ============

	signat	_AT24C02_Read_Byte,4217
	global	_AT24C02_Write_Msg
psect	text1133,local,class=CODE,delta=2
global __ptext1133
__ptext1133:

;; *************** function _AT24C02_Write_Msg *****************
;; Defined at:
;;		line 41 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\e2prom.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;;  data            1    4[BANK0 ] PTR unsigned char 
;;		 -> recive_task@msg(6), channel_flag(1), control_id(72), 
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
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1133
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\e2prom.c"
	line	41
	global	__size_of_AT24C02_Write_Msg
	__size_of_AT24C02_Write_Msg	equ	__end_of_AT24C02_Write_Msg-_AT24C02_Write_Msg
	
_AT24C02_Write_Msg:	
	opt	stack 1
; Regs used in _AT24C02_Write_Msg: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;AT24C02_Write_Msg@addr stored from wreg
	movwf	(AT24C02_Write_Msg@addr)
	line	42
	
l16796:	
;e2prom.c: 42: unsigned char i=0;
	clrf	(AT24C02_Write_Msg@i)
	line	43
;e2prom.c: 43: for(i=0;i<len;i++)
	clrf	(AT24C02_Write_Msg@i)
	goto	l16806
	line	45
	
l16798:	
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
	
l16800:	
;e2prom.c: 46: addr++;
	incf	(AT24C02_Write_Msg@addr),f
	line	47
	
l16802:	
;e2prom.c: 47: soft_delay_ms(5);
	movlw	05h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	43
	
l16804:	
	incf	(AT24C02_Write_Msg@i),f
	
l16806:	
	movf	(AT24C02_Write_Msg@len),w
	subwf	(AT24C02_Write_Msg@i),w
	skipc
	goto	u5391
	goto	u5390
u5391:
	goto	l16798
u5390:
	line	49
	
l11385:	
	return
	opt stack 0
GLOBAL	__end_of_AT24C02_Write_Msg
	__end_of_AT24C02_Write_Msg:
;; =============== function _AT24C02_Write_Msg ends ============

	signat	_AT24C02_Write_Msg,12408
	global	_RF_RxData
psect	text1134,local,class=CODE,delta=2
global __ptext1134
__ptext1134:

;; *************** function _RF_RxData *****************
;; Defined at:
;;		line 134 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
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
psect	text1134
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
	line	134
	global	__size_of_RF_RxData
	__size_of_RF_RxData	equ	__end_of_RF_RxData-_RF_RxData
	
_RF_RxData:	
	opt	stack 0
; Regs used in _RF_RxData: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_RxData@payload_buff stored from wreg
	movwf	(RF_RxData@payload_buff)
	line	135
	
l16780:	
;rf297L.c: 135: if(!(RF_GetStatus() & 0X40))
	fcall	_RF_GetStatus
	movwf	(??_RF_RxData+0)+0
	btfsc	0+(??_RF_RxData+0)+0,(6)&7
	goto	u5381
	goto	u5380
u5381:
	goto	l16786
u5380:
	line	137
	
l16782:	
;rf297L.c: 136: {
;rf297L.c: 137: return 0;
	movlw	(0)
	goto	l5160
	line	139
	
l16786:	
;rf297L.c: 138: }
;rf297L.c: 139: RF_Read_Buff(0x61, payload_buff, length);
	movf	(RF_RxData@payload_buff),w
	movwf	(?_RF_Read_Buff)
	movf	(RF_RxData@length),w
	movwf	0+(?_RF_Read_Buff)+01h
	movlw	(061h)
	fcall	_RF_Read_Buff
	line	141
	
l16788:	
;rf297L.c: 141: RF_ClearFIFO();
	fcall	_RF_ClearFIFO
	line	142
	
l16790:	
;rf297L.c: 142: RF_ClearStatus();
	fcall	_RF_ClearStatus
	line	143
	
l16792:	
;rf297L.c: 143: return 1;
	movlw	(01h)
	line	144
	
l5160:	
	return
	opt stack 0
GLOBAL	__end_of_RF_RxData
	__end_of_RF_RxData:
;; =============== function _RF_RxData ends ============

	signat	_RF_RxData,8313
	global	_I2C_ReadByte
psect	text1135,local,class=CODE,delta=2
global __ptext1135
__ptext1135:

;; *************** function _I2C_ReadByte *****************
;; Defined at:
;;		line 117 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\iic.c"
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
psect	text1135
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\iic.c"
	line	117
	global	__size_of_I2C_ReadByte
	__size_of_I2C_ReadByte	equ	__end_of_I2C_ReadByte-_I2C_ReadByte
	
_I2C_ReadByte:	
	opt	stack 0
; Regs used in _I2C_ReadByte: [wreg+status,2+status,0+pclath+cstack]
;I2C_ReadByte@ack stored from wreg
	line	120
	movwf	(I2C_ReadByte@ack)
	
l15444:	
;iic.c: 118: unsigned char cnt;
;iic.c: 119: unsigned int data;
;iic.c: 120: {TRISC1=1,WPUC1=1;};
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1081/8)^080h,(1081)&7
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3193/8)^0180h,(3193)&7
	line	122
	
l15446:	
;iic.c: 122: for(cnt=0; cnt<8; cnt++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(I2C_ReadByte@cnt)
	line	123
	
l10736:	
	line	124
;iic.c: 123: {
;iic.c: 124: RC2=0;
	bcf	(58/8),(58)&7
	line	125
	
l15452:	
;iic.c: 125: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	127
	
l15454:	
;iic.c: 127: RC2=1;
	bsf	(58/8),(58)&7
	line	128
	
l15456:	
;iic.c: 128: data <<= 1;
	clrc
	rlf	(I2C_ReadByte@data),f
	rlf	(I2C_ReadByte@data+1),f
	line	129
	
l15458:	
;iic.c: 129: if(RC1)
	btfss	(57/8),(57)&7
	goto	u3481
	goto	u3480
u3481:
	goto	l15462
u3480:
	line	131
	
l15460:	
;iic.c: 130: {
;iic.c: 131: data |= 0x01;
	bsf	(I2C_ReadByte@data)+(0/8),(0)&7
	line	133
	
l15462:	
;iic.c: 132: }
;iic.c: 133: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	122
	
l15464:	
	incf	(I2C_ReadByte@cnt),f
	
l15466:	
	movlw	(08h)
	subwf	(I2C_ReadByte@cnt),w
	skipc
	goto	u3491
	goto	u3490
u3491:
	goto	l10736
u3490:
	line	135
	
l15468:	
;iic.c: 134: }
;iic.c: 135: if(ack == 0)
	movf	(I2C_ReadByte@ack),f
	skipz
	goto	u3501
	goto	u3500
u3501:
	goto	l15472
u3500:
	line	137
	
l15470:	
;iic.c: 136: {
;iic.c: 137: IIC_NACK();
	fcall	_IIC_NACK
	line	138
;iic.c: 138: }
	goto	l15474
	line	141
	
l15472:	
;iic.c: 139: else
;iic.c: 140: {
;iic.c: 141: IIC_ACK();
	fcall	_IIC_ACK
	line	143
	
l15474:	
;iic.c: 142: }
;iic.c: 143: return data;
	movf	(I2C_ReadByte@data+1),w
	movwf	(?_I2C_ReadByte+1)
	movf	(I2C_ReadByte@data),w
	movwf	(?_I2C_ReadByte)
	line	144
	
l10741:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_ReadByte
	__end_of_I2C_ReadByte:
;; =============== function _I2C_ReadByte ends ============

	signat	_I2C_ReadByte,4218
	global	_AT24C02_Write_Byte
psect	text1136,local,class=CODE,delta=2
global __ptext1136
__ptext1136:

;; *************** function _AT24C02_Write_Byte *****************
;; Defined at:
;;		line 9 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\e2prom.c"
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
psect	text1136
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\e2prom.c"
	line	9
	global	__size_of_AT24C02_Write_Byte
	__size_of_AT24C02_Write_Byte	equ	__end_of_AT24C02_Write_Byte-_AT24C02_Write_Byte
	
_AT24C02_Write_Byte:	
	opt	stack 1
; Regs used in _AT24C02_Write_Byte: [wreg+status,2+status,0+pclath+cstack]
;AT24C02_Write_Byte@addr stored from wreg
	movwf	(AT24C02_Write_Byte@addr)
	line	10
	
l16778:	
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
	
l11376:	
	return
	opt stack 0
GLOBAL	__end_of_AT24C02_Write_Byte
	__end_of_AT24C02_Write_Byte:
;; =============== function _AT24C02_Write_Byte ends ============

	signat	_AT24C02_Write_Byte,8312
	global	_RF_ClearStatus
psect	text1137,local,class=CODE,delta=2
global __ptext1137
__ptext1137:

;; *************** function _RF_ClearStatus *****************
;; Defined at:
;;		line 249 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
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
psect	text1137
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
	line	249
	global	__size_of_RF_ClearStatus
	__size_of_RF_ClearStatus	equ	__end_of_RF_ClearStatus-_RF_ClearStatus
	
_RF_ClearStatus:	
	opt	stack 2
; Regs used in _RF_ClearStatus: [wreg+status,2+status,0+pclath+cstack]
	line	250
	
l16776:	
;rf297L.c: 250: RF_WriteReg(0x20 + 0x07,0x70);
	movlw	(070h)
	movwf	(?_RF_WriteReg)
	movlw	(027h)
	fcall	_RF_WriteReg
	line	251
	
l5179:	
	return
	opt stack 0
GLOBAL	__end_of_RF_ClearStatus
	__end_of_RF_ClearStatus:
;; =============== function _RF_ClearStatus ends ============

	signat	_RF_ClearStatus,88
	global	_RF_ClearFIFO
psect	text1138,local,class=CODE,delta=2
global __ptext1138
__ptext1138:

;; *************** function _RF_ClearFIFO *****************
;; Defined at:
;;		line 243 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
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
psect	text1138
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
	line	243
	global	__size_of_RF_ClearFIFO
	__size_of_RF_ClearFIFO	equ	__end_of_RF_ClearFIFO-_RF_ClearFIFO
	
_RF_ClearFIFO:	
	opt	stack 2
; Regs used in _RF_ClearFIFO: [wreg+status,2+status,0+pclath+cstack]
	line	244
	
l16774:	
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
	
l5176:	
	return
	opt stack 0
GLOBAL	__end_of_RF_ClearFIFO
	__end_of_RF_ClearFIFO:
;; =============== function _RF_ClearFIFO ends ============

	signat	_RF_ClearFIFO,88
	global	_RF_GetStatus
psect	text1139,local,class=CODE,delta=2
global __ptext1139
__ptext1139:

;; *************** function _RF_GetStatus *****************
;; Defined at:
;;		line 254 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
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
psect	text1139
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
	line	254
	global	__size_of_RF_GetStatus
	__size_of_RF_GetStatus	equ	__end_of_RF_GetStatus-_RF_GetStatus
	
_RF_GetStatus:	
	opt	stack 0
; Regs used in _RF_GetStatus: [wreg+status,2+status,0+pclath+cstack]
	line	255
	
l16770:	
;rf297L.c: 255: return RF_ReadReg(0x07)&0x70;
	movlw	(07h)
	fcall	_RF_ReadReg
	andlw	070h
	line	256
	
l5182:	
	return
	opt stack 0
GLOBAL	__end_of_RF_GetStatus
	__end_of_RF_GetStatus:
;; =============== function _RF_GetStatus ends ============

	signat	_RF_GetStatus,89
	global	_key_value_read
psect	text1140,local,class=CODE,delta=2
global __ptext1140
__ptext1140:

;; *************** function _key_value_read *****************
;; Defined at:
;;		line 141 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\key_scan.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_key_scan
;;		_soft_delay_ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1140
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\key_scan.c"
	line	141
	global	__size_of_key_value_read
	__size_of_key_value_read	equ	__end_of_key_value_read-_key_value_read
	
_key_value_read:	
	opt	stack 3
; Regs used in _key_value_read: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	142
	
l15212:	
;key_scan.c: 142: key_scan();
	fcall	_key_scan
	line	143
	
l15214:	
;key_scan.c: 143: if(KEY0_FLAG == 0x01)
	decf	(_KEY0_FLAG),w
	skipz
	goto	u3181
	goto	u3180
u3181:
	goto	l15256
u3180:
	line	146
	
l15216:	
;key_scan.c: 144: {
;key_scan.c: 146: if(flag_time_key0_add >= 500)
	movlw	high(01F4h)
	subwf	(_flag_time_key0_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key0_add),w
	skipc
	goto	u3191
	goto	u3190
u3191:
	goto	l15244
u3190:
	line	148
	
l15218:	
;key_scan.c: 147: {
;key_scan.c: 148: if(key_long_flag == 0x01)
	decf	(_key_long_flag),w
	skipz
	goto	u3201
	goto	u3200
u3201:
	goto	l7182
u3200:
	line	150
	
l15220:	
;key_scan.c: 149: {
;key_scan.c: 150: key_long_flag = 0x10;
	movlw	(010h)
	movwf	(_key_long_flag)
	line	151
	
l15222:	
;key_scan.c: 151: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15224:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	152
	
l15226:	
;key_scan.c: 152: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	153
	
l15228:	
;key_scan.c: 153: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15230:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	154
	
l15232:	
;key_scan.c: 154: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	155
	
l15234:	
;key_scan.c: 155: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15236:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	156
	
l15238:	
;key_scan.c: 156: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	157
	
l15240:	
;key_scan.c: 157: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15242:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	goto	l7182
	line	158
	
l7178:	
	line	159
;key_scan.c: 158: }
;key_scan.c: 159: }
	goto	l7182
	line	160
	
l15244:	
;key_scan.c: 160: else if(flag_time_key0_add >= 300)
	movlw	high(012Ch)
	subwf	(_flag_time_key0_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key0_add),w
	skipc
	goto	u3211
	goto	u3210
u3211:
	goto	l7182
u3210:
	line	162
	
l15246:	
;key_scan.c: 161: {
;key_scan.c: 162: if(key_long_flag == 0)
	movf	(_key_long_flag),f
	skipz
	goto	u3221
	goto	u3220
u3221:
	goto	l7182
u3220:
	line	164
	
l15248:	
;key_scan.c: 163: {
;key_scan.c: 164: key_long_flag = 0x01;
	clrf	(_key_long_flag)
	incf	(_key_long_flag),f
	line	165
;key_scan.c: 165: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	goto	l15238
	line	173
	
l15256:	
;key_scan.c: 173: else if(KEY0_FLAG == 0x03)
	movf	(_KEY0_FLAG),w
	xorlw	03h
	skipz
	goto	u3231
	goto	u3230
u3231:
	goto	l7182
u3230:
	line	175
	
l15258:	
;key_scan.c: 174: {
;key_scan.c: 175: KEY0_FLAG = 0;
	clrf	(_KEY0_FLAG)
	line	177
	
l15260:	
;key_scan.c: 177: if((flag_time_key0_add < 300))
	movlw	high(012Ch)
	subwf	(_flag_time_key0_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key0_add),w
	skipnc
	goto	u3241
	goto	u3240
u3241:
	goto	l15264
u3240:
	line	179
	
l15262:	
;key_scan.c: 178: {
;key_scan.c: 179: KEY0.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY0),f
	line	180
;key_scan.c: 180: }
	goto	l7182
	line	181
	
l15264:	
;key_scan.c: 181: else if(flag_time_key0_add < 500)
	movlw	high(01F4h)
	subwf	(_flag_time_key0_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key0_add),w
	skipnc
	goto	u3251
	goto	u3250
u3251:
	goto	l15276
u3250:
	line	183
	
l15266:	
;key_scan.c: 182: {
;key_scan.c: 183: if(key_long_flag == 0x01)
	decf	(_key_long_flag),w
	skipz
	goto	u3261
	goto	u3260
u3261:
	goto	l7178
u3260:
	line	185
	
l15268:	
;key_scan.c: 184: {
;key_scan.c: 185: KEY0.key_flag_3s = 1;
	clrf	0+(_KEY0)+01h
	incf	0+(_KEY0)+01h,f
	line	186
	
l15270:	
;key_scan.c: 186: key_long_flag = 0x11;
	movlw	(011h)
	movwf	(_key_long_flag)
	line	187
;key_scan.c: 187: sys_stute = 2;
	movlw	(02h)
	movwf	(_sys_stute)
	line	188
	
l15272:	
;key_scan.c: 188: flag_time_key1_add = 0;
	clrf	(_flag_time_key1_add)
	clrf	(_flag_time_key1_add+1)
	line	189
	
l15274:	
;key_scan.c: 189: flag_time_key2_add = 0;
	clrf	(_flag_time_key2_add)
	clrf	(_flag_time_key2_add+1)
	goto	l7182
	line	194
	
l15276:	
;key_scan.c: 192: else
;key_scan.c: 193: {
;key_scan.c: 194: if(key_long_flag == 0x10)
	movf	(_key_long_flag),w
	xorlw	010h
	skipz
	goto	u3271
	goto	u3270
u3271:
	goto	l7178
u3270:
	line	196
	
l15278:	
;key_scan.c: 195: {
;key_scan.c: 196: KEY0.key_flag_5s = 1;
	clrf	0+(_KEY0)+02h
	incf	0+(_KEY0)+02h,f
	line	197
	
l15280:	
;key_scan.c: 197: key_long_flag = 0x11;
	movlw	(011h)
	movwf	(_key_long_flag)
	line	198
;key_scan.c: 198: sys_stute = 3;
	movlw	(03h)
	movwf	(_sys_stute)
	goto	l15272
	line	207
	
l7182:	
;key_scan.c: 201: }
;key_scan.c: 202: }
;key_scan.c: 204: }
;key_scan.c: 207: if(KEY1_FLAG == 0x01)
	decf	(_KEY1_FLAG),w
	skipz
	goto	u3281
	goto	u3280
u3281:
	goto	l15330
u3280:
	line	209
	
l15286:	
;key_scan.c: 208: {
;key_scan.c: 209: if(flag_time_key1_add >= 500)
	movlw	high(01F4h)
	subwf	(_flag_time_key1_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key1_add),w
	skipc
	goto	u3291
	goto	u3290
u3291:
	goto	l15314
u3290:
	line	211
	
l15288:	
;key_scan.c: 210: {
;key_scan.c: 211: if(key_long_flag == 0x02)
	movf	(_key_long_flag),w
	xorlw	02h
	skipz
	goto	u3301
	goto	u3300
u3301:
	goto	l7196
u3300:
	line	213
	
l15290:	
;key_scan.c: 212: {
;key_scan.c: 213: key_long_flag = 0x20;
	movlw	(020h)
	movwf	(_key_long_flag)
	line	214
	
l15292:	
;key_scan.c: 214: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15294:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	215
	
l15296:	
;key_scan.c: 215: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	216
	
l15298:	
;key_scan.c: 216: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15300:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	217
	
l15302:	
;key_scan.c: 217: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	218
	
l15304:	
;key_scan.c: 218: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15306:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	219
	
l15308:	
;key_scan.c: 219: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	220
	
l15310:	
;key_scan.c: 220: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15312:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	goto	l7196
	line	221
	
l7192:	
	line	222
;key_scan.c: 221: }
;key_scan.c: 222: }
	goto	l7196
	line	223
	
l15314:	
;key_scan.c: 223: else if(flag_time_key1_add >= 300)
	movlw	high(012Ch)
	subwf	(_flag_time_key1_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key1_add),w
	skipc
	goto	u3311
	goto	u3310
u3311:
	goto	l7196
u3310:
	line	225
	
l15316:	
;key_scan.c: 224: {
;key_scan.c: 225: if(key_long_flag == 0)
	movf	(_key_long_flag),f
	skipz
	goto	u3321
	goto	u3320
u3321:
	goto	l7196
u3320:
	line	227
	
l15318:	
;key_scan.c: 226: {
;key_scan.c: 227: key_long_flag = 0x02;
	movlw	(02h)
	movwf	(_key_long_flag)
	goto	l15304
	line	235
	
l15330:	
;key_scan.c: 235: else if(KEY1_FLAG == 0x03)
	movf	(_KEY1_FLAG),w
	xorlw	03h
	skipz
	goto	u3331
	goto	u3330
u3331:
	goto	l7196
u3330:
	line	237
	
l15332:	
;key_scan.c: 236: {
;key_scan.c: 237: KEY1_FLAG = 0;
	clrf	(_KEY1_FLAG)
	line	238
	
l15334:	
;key_scan.c: 238: if((flag_time_key1_add < 300))
	movlw	high(012Ch)
	subwf	(_flag_time_key1_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key1_add),w
	skipnc
	goto	u3341
	goto	u3340
u3341:
	goto	l15338
u3340:
	line	240
	
l15336:	
;key_scan.c: 239: {
;key_scan.c: 240: KEY1.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY1),f
	line	241
;key_scan.c: 241: }
	goto	l7196
	line	242
	
l15338:	
;key_scan.c: 242: else if(flag_time_key1_add < 500)
	movlw	high(01F4h)
	subwf	(_flag_time_key1_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key1_add),w
	skipnc
	goto	u3351
	goto	u3350
u3351:
	goto	l15350
u3350:
	line	244
	
l15340:	
;key_scan.c: 243: {
;key_scan.c: 244: if(key_long_flag == 0x02)
	movf	(_key_long_flag),w
	xorlw	02h
	skipz
	goto	u3361
	goto	u3360
u3361:
	goto	l7192
u3360:
	line	246
	
l15342:	
;key_scan.c: 245: {
;key_scan.c: 246: KEY1.key_flag_3s = 1;
	clrf	0+(_KEY1)+01h
	incf	0+(_KEY1)+01h,f
	line	247
	
l15344:	
;key_scan.c: 247: key_long_flag = 0x21;
	movlw	(021h)
	movwf	(_key_long_flag)
	line	248
;key_scan.c: 248: sys_stute = 2;
	movlw	(02h)
	movwf	(_sys_stute)
	line	249
	
l15346:	
;key_scan.c: 249: flag_time_key2_add = 0;
	clrf	(_flag_time_key2_add)
	clrf	(_flag_time_key2_add+1)
	line	250
	
l15348:	
;key_scan.c: 250: flag_time_key0_add = 0;
	clrf	(_flag_time_key0_add)
	clrf	(_flag_time_key0_add+1)
	goto	l7196
	line	255
	
l15350:	
;key_scan.c: 253: else
;key_scan.c: 254: {
;key_scan.c: 255: if(key_long_flag == 0x20)
	movf	(_key_long_flag),w
	xorlw	020h
	skipz
	goto	u3371
	goto	u3370
u3371:
	goto	l7192
u3370:
	line	257
	
l15352:	
;key_scan.c: 256: {
;key_scan.c: 257: KEY1.key_flag_5s = 1;
	clrf	0+(_KEY1)+02h
	incf	0+(_KEY1)+02h,f
	line	258
	
l15354:	
;key_scan.c: 258: key_long_flag = 0x21;
	movlw	(021h)
	movwf	(_key_long_flag)
	line	259
;key_scan.c: 259: sys_stute = 3;
	movlw	(03h)
	movwf	(_sys_stute)
	goto	l15346
	line	267
	
l7196:	
;key_scan.c: 262: }
;key_scan.c: 263: }
;key_scan.c: 264: }
;key_scan.c: 267: if(KEY2_FLAG == 0x01)
	decf	(_KEY2_FLAG),w
	skipz
	goto	u3381
	goto	u3380
u3381:
	goto	l15404
u3380:
	line	269
	
l15360:	
;key_scan.c: 268: {
;key_scan.c: 269: if(flag_time_key2_add >= 500)
	movlw	high(01F4h)
	subwf	(_flag_time_key2_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key2_add),w
	skipc
	goto	u3391
	goto	u3390
u3391:
	goto	l15388
u3390:
	line	271
	
l15362:	
;key_scan.c: 270: {
;key_scan.c: 271: if(key_long_flag == 0x04)
	movf	(_key_long_flag),w
	xorlw	04h
	skipz
	goto	u3401
	goto	u3400
u3401:
	goto	l7218
u3400:
	line	273
	
l15364:	
;key_scan.c: 272: {
;key_scan.c: 273: key_long_flag = 0x40;
	movlw	(040h)
	movwf	(_key_long_flag)
	line	274
	
l15366:	
;key_scan.c: 274: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15368:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	275
	
l15370:	
;key_scan.c: 275: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	276
	
l15372:	
;key_scan.c: 276: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15374:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	277
	
l15376:	
;key_scan.c: 277: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	278
	
l15378:	
;key_scan.c: 278: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15380:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	279
	
l15382:	
;key_scan.c: 279: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	280
	
l15384:	
;key_scan.c: 280: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15386:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	goto	l7218
	line	283
	
l15388:	
;key_scan.c: 283: else if(flag_time_key2_add >= 300)
	movlw	high(012Ch)
	subwf	(_flag_time_key2_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key2_add),w
	skipc
	goto	u3411
	goto	u3410
u3411:
	goto	l7218
u3410:
	line	285
	
l15390:	
;key_scan.c: 284: {
;key_scan.c: 285: if(key_long_flag == 0)
	movf	(_key_long_flag),f
	skipz
	goto	u3421
	goto	u3420
u3421:
	goto	l7207
u3420:
	line	287
	
l15392:	
;key_scan.c: 286: {
;key_scan.c: 287: key_long_flag = 0x04;
	movlw	(04h)
	movwf	(_key_long_flag)
	goto	l15378
	line	293
	
l7207:	
;key_scan.c: 291: }
;key_scan.c: 292: }
;key_scan.c: 293: }
	goto	l7218
	line	294
	
l15404:	
;key_scan.c: 294: else if(KEY2_FLAG == 0x03)
	movf	(_KEY2_FLAG),w
	xorlw	03h
	skipz
	goto	u3431
	goto	u3430
u3431:
	goto	l7218
u3430:
	line	296
	
l15406:	
;key_scan.c: 295: {
;key_scan.c: 296: KEY2_FLAG = 0;
	clrf	(_KEY2_FLAG)
	line	297
	
l15408:	
;key_scan.c: 297: if((flag_time_key2_add < 300))
	movlw	high(012Ch)
	subwf	(_flag_time_key2_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key2_add),w
	skipnc
	goto	u3441
	goto	u3440
u3441:
	goto	l15412
u3440:
	line	299
	
l15410:	
;key_scan.c: 298: {
;key_scan.c: 299: KEY2.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY2),f
	line	300
;key_scan.c: 300: }
	goto	l7218
	line	301
	
l15412:	
;key_scan.c: 301: else if(flag_time_key2_add < 500)
	movlw	high(01F4h)
	subwf	(_flag_time_key2_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key2_add),w
	skipnc
	goto	u3451
	goto	u3450
u3451:
	goto	l15424
u3450:
	line	303
	
l15414:	
;key_scan.c: 302: {
;key_scan.c: 303: if(key_long_flag == 0x04)
	movf	(_key_long_flag),w
	xorlw	04h
	skipz
	goto	u3461
	goto	u3460
u3461:
	goto	l7207
u3460:
	line	305
	
l15416:	
;key_scan.c: 304: {
;key_scan.c: 305: KEY2.key_flag_3s = 1;
	clrf	0+(_KEY2)+01h
	incf	0+(_KEY2)+01h,f
	line	306
	
l15418:	
;key_scan.c: 306: key_long_flag = 0x41;
	movlw	(041h)
	movwf	(_key_long_flag)
	line	307
;key_scan.c: 307: sys_stute = 2;
	movlw	(02h)
	movwf	(_sys_stute)
	line	308
	
l15420:	
;key_scan.c: 308: flag_time_key1_add = 0;
	clrf	(_flag_time_key1_add)
	clrf	(_flag_time_key1_add+1)
	line	309
	
l15422:	
;key_scan.c: 309: flag_time_key0_add = 0;
	clrf	(_flag_time_key0_add)
	clrf	(_flag_time_key0_add+1)
	goto	l7218
	line	315
	
l15424:	
;key_scan.c: 313: else
;key_scan.c: 314: {
;key_scan.c: 315: if(key_long_flag == 0x40)
	movf	(_key_long_flag),w
	xorlw	040h
	skipz
	goto	u3471
	goto	u3470
u3471:
	goto	l7207
u3470:
	line	317
	
l15426:	
;key_scan.c: 316: {
;key_scan.c: 317: KEY2.key_flag_5s = 1;
	clrf	0+(_KEY2)+02h
	incf	0+(_KEY2)+02h,f
	line	318
	
l15428:	
;key_scan.c: 318: key_long_flag = 0x41;
	movlw	(041h)
	movwf	(_key_long_flag)
	line	319
;key_scan.c: 319: sys_stute = 3;
	movlw	(03h)
	movwf	(_sys_stute)
	goto	l15420
	line	326
	
l7218:	
	return
	opt stack 0
GLOBAL	__end_of_key_value_read
	__end_of_key_value_read:
;; =============== function _key_value_read ends ============

	signat	_key_value_read,88
	global	_RF_Set_RxMode
psect	text1141,local,class=CODE,delta=2
global __ptext1141
__ptext1141:

;; *************** function _RF_Set_RxMode *****************
;; Defined at:
;;		line 267 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
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
psect	text1141
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
	line	267
	global	__size_of_RF_Set_RxMode
	__size_of_RF_Set_RxMode	equ	__end_of_RF_Set_RxMode-_RF_Set_RxMode
	
_RF_Set_RxMode:	
	opt	stack 3
; Regs used in _RF_Set_RxMode: [wreg+status,2+status,0+pclath+cstack]
	line	268
	
l16766:	
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
	
l16768:	
;rf297L.c: 270: RA7=1;
	bsf	(47/8),(47)&7
	line	271
;rf297L.c: 271: soft_delay_ms(10);
	movlw	0Ah
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	272
	
l5188:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Set_RxMode
	__end_of_RF_Set_RxMode:
;; =============== function _RF_Set_RxMode ends ============

	signat	_RF_Set_RxMode,88
	global	_RF_Init
psect	text1142,local,class=CODE,delta=2
global __ptext1142
__ptext1142:

;; *************** function _RF_Init *****************
;; Defined at:
;;		line 45 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
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
psect	text1142
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
	line	45
	global	__size_of_RF_Init
	__size_of_RF_Init	equ	__end_of_RF_Init-_RF_Init
	
_RF_Init:	
	opt	stack 3
; Regs used in _RF_Init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	75
	
l16716:	
	line	76
	
l16718:	
;rf297L.c: 76: SPI_init();
	fcall	_SPI_init
	line	77
	
l16720:	
;rf297L.c: 77: RF_WriteReg(0x53, 0x5A);
	movlw	(05Ah)
	movwf	(?_RF_WriteReg)
	movlw	(053h)
	fcall	_RF_WriteReg
	line	78
	
l16722:	
;rf297L.c: 78: RF_WriteReg(0x53, 0XA5);
	movlw	(0A5h)
	movwf	(?_RF_WriteReg)
	movlw	(053h)
	fcall	_RF_WriteReg
	line	79
	
l16724:	
;rf297L.c: 79: RF_WriteReg(0xE1, 0);
	clrf	(?_RF_WriteReg)
	movlw	(0E1h)
	fcall	_RF_WriteReg
	line	80
	
l16726:	
;rf297L.c: 80: RF_WriteReg(0xE2, 0);
	clrf	(?_RF_WriteReg)
	movlw	(0E2h)
	fcall	_RF_WriteReg
	line	81
	
l16728:	
;rf297L.c: 81: RF_WriteReg(0x20 + 0x07, 0x70);
	movlw	(070h)
	movwf	(?_RF_WriteReg)
	movlw	(027h)
	fcall	_RF_WriteReg
	line	82
	
l16730:	
;rf297L.c: 82: RF_WriteReg(0x20 + 0x02, 0x01);
	clrf	(?_RF_WriteReg)
	incf	(?_RF_WriteReg),f
	movlw	(022h)
	fcall	_RF_WriteReg
	line	83
	
l16732:	
;rf297L.c: 83: RF_WriteReg(0x20 + 0x03, 0x01);
	clrf	(?_RF_WriteReg)
	incf	(?_RF_WriteReg),f
	movlw	(023h)
	fcall	_RF_WriteReg
	line	84
	
l16734:	
;rf297L.c: 84: RF_WriteReg(0x20 + 0x05, 26);
	movlw	(01Ah)
	movwf	(?_RF_WriteReg)
	movlw	(025h)
	fcall	_RF_WriteReg
	line	85
	
l16736:	
;rf297L.c: 85: RF_WriteReg(0x20 + 0x11, 18);
	movlw	(012h)
	movwf	(?_RF_WriteReg)
	movlw	(031h)
	fcall	_RF_WriteReg
	line	86
	
l16738:	
;rf297L.c: 86: RF_Write_Buff(0x20 + 0x10, TX_ADDRESS_DEF, sizeof(TX_ADDRESS_DEF));
	movlw	((_TX_ADDRESS_DEF-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(030h)
	fcall	_RF_Write_Buff
	line	87
	
l16740:	
;rf297L.c: 87: RF_Write_Buff(0x20 + 0x0A,RX_ADDRESS_DEF, sizeof(RX_ADDRESS_DEF));
	movlw	((_RX_ADDRESS_DEF-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(02Ah)
	fcall	_RF_Write_Buff
	line	88
	
l16742:	
;rf297L.c: 88: RF_Write_Buff(0x20 + 0x1F, BB_cal_data, sizeof(BB_cal_data));
	movlw	((RF_Init@BB_cal_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(05h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(03Fh)
	fcall	_RF_Write_Buff
	line	89
	
l16744:	
;rf297L.c: 89: RF_Write_Buff(0x20 + 0x1A, RF_cal2_data, sizeof(RF_cal2_data));
	movlw	((RF_Init@RF_cal2_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(06h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(03Ah)
	fcall	_RF_Write_Buff
	line	90
	
l16746:	
;rf297L.c: 90: RF_Write_Buff(0x20 + 0x19, Dem_cal_data, sizeof(Dem_cal_data));
	movlw	((RF_Init@Dem_cal_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	clrf	0+(?_RF_Write_Buff)+01h
	incf	0+(?_RF_Write_Buff)+01h,f
	movlw	(039h)
	fcall	_RF_Write_Buff
	line	91
	
l16748:	
;rf297L.c: 91: RF_Write_Buff(0x20 + 0x1E, RF_cal_data, sizeof(RF_cal_data));
	movlw	((RF_Init@RF_cal_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(03Eh)
	fcall	_RF_Write_Buff
	line	92
	
l16750:	
;rf297L.c: 92: RF_Write_Buff(0x20 + 0x1B, Dem_cal2_data,sizeof(Dem_cal2_data));
	movlw	((RF_Init@Dem_cal2_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(03Bh)
	fcall	_RF_Write_Buff
	line	93
	
l16752:	
;rf297L.c: 93: RF_WriteReg(0x20 + 0x1C, 0x00);
	clrf	(?_RF_WriteReg)
	movlw	(03Ch)
	fcall	_RF_WriteReg
	line	94
	
l16754:	
;rf297L.c: 94: RF_WriteReg(0x20 + 0x06, (0x0e |0X00));
	movlw	(0Eh)
	movwf	(?_RF_WriteReg)
	movlw	(026h)
	fcall	_RF_WriteReg
	line	95
	
l16756:	
;rf297L.c: 95: RF_WriteReg(0x50, 0x73);
	movlw	(073h)
	movwf	(?_RF_WriteReg)
	movlw	(050h)
	fcall	_RF_WriteReg
	line	101
	
l16758:	
;rf297L.c: 101: RF_WriteReg(0x20 + 0x04,0x00);
	clrf	(?_RF_WriteReg)
	movlw	(024h)
	fcall	_RF_WriteReg
	line	102
	
l16760:	
;rf297L.c: 102: RF_WriteReg(0x20 + 0x01, 0x00);
	clrf	(?_RF_WriteReg)
	movlw	(021h)
	fcall	_RF_WriteReg
	line	117
;rf297L.c: 113: if(18 >32){
	
l16764:	
;rf297L.c: 115: }
;rf297L.c: 117: RF_WriteReg(0x20 + 0x1D, feature);
	clrf	(?_RF_WriteReg)
	movlw	(03Dh)
	fcall	_RF_WriteReg
	line	118
	
l5156:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Init
	__end_of_RF_Init:
;; =============== function _RF_Init ends ============

	signat	_RF_Init,88
	global	_I2C_SendByte
psect	text1143,local,class=CODE,delta=2
global __ptext1143
__ptext1143:

;; *************** function _I2C_SendByte *****************
;; Defined at:
;;		line 91 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\iic.c"
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
psect	text1143
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\iic.c"
	line	91
	global	__size_of_I2C_SendByte
	__size_of_I2C_SendByte	equ	__end_of_I2C_SendByte-_I2C_SendByte
	
_I2C_SendByte:	
	opt	stack 1
; Regs used in _I2C_SendByte: [wreg+status,2+status,0+pclath+cstack]
;I2C_SendByte@Data stored from wreg
	line	93
	movwf	(I2C_SendByte@Data)
	
l15140:	
;iic.c: 92: unsigned char cnt;
;iic.c: 93: TRISC1=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	94
	
l15142:	
;iic.c: 94: for(cnt=0; cnt<8; cnt++)
	clrf	(I2C_SendByte@cnt)
	line	95
	
l10729:	
	line	98
;iic.c: 95: {
;iic.c: 98: if(Data & 0x80)
	btfss	(I2C_SendByte@Data),(7)&7
	goto	u3161
	goto	u3160
u3161:
	goto	l10731
u3160:
	line	100
	
l15148:	
;iic.c: 99: {
;iic.c: 100: RC1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(57/8),(57)&7
	line	101
;iic.c: 101: }
	goto	l10732
	line	102
	
l10731:	
	line	104
;iic.c: 102: else
;iic.c: 103: {
;iic.c: 104: RC1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(57/8),(57)&7
	line	105
	
l10732:	
	line	106
;iic.c: 105: }
;iic.c: 106: Data <<= 1;
	clrc
	rlf	(I2C_SendByte@Data),f
	line	107
;iic.c: 107: RC2=1;
	bsf	(58/8),(58)&7
	line	108
	
l15150:	
;iic.c: 108: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	109
	
l15152:	
;iic.c: 109: RC2=0;
	bcf	(58/8),(58)&7
	line	110
;iic.c: 110: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	94
	
l15154:	
	incf	(I2C_SendByte@cnt),f
	
l15156:	
	movlw	(08h)
	subwf	(I2C_SendByte@cnt),w
	skipc
	goto	u3171
	goto	u3170
u3171:
	goto	l10729
u3170:
	line	113
	
l10733:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_SendByte
	__end_of_I2C_SendByte:
;; =============== function _I2C_SendByte ends ============

	signat	_I2C_SendByte,4216
	global	_IIC_NACK
psect	text1144,local,class=CODE,delta=2
global __ptext1144
__ptext1144:

;; *************** function _IIC_NACK *****************
;; Defined at:
;;		line 78 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\iic.c"
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
psect	text1144
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\iic.c"
	line	78
	global	__size_of_IIC_NACK
	__size_of_IIC_NACK	equ	__end_of_IIC_NACK-_IIC_NACK
	
_IIC_NACK:	
	opt	stack 0
; Regs used in _IIC_NACK: [wreg+status,2+status,0+pclath+cstack]
	line	79
	
l15132:	
;iic.c: 79: RC1=1;
	bsf	(57/8),(57)&7
	line	80
	
l15134:	
;iic.c: 80: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	81
	
l15136:	
;iic.c: 81: RC2=1;
	bsf	(58/8),(58)&7
	line	82
;iic.c: 82: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	83
	
l15138:	
;iic.c: 83: RC2=0;
	bcf	(58/8),(58)&7
	line	84
;iic.c: 84: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	85
	
l10726:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_NACK
	__end_of_IIC_NACK:
;; =============== function _IIC_NACK ends ============

	signat	_IIC_NACK,88
	global	_IIC_ACK
psect	text1145,local,class=CODE,delta=2
global __ptext1145
__ptext1145:

;; *************** function _IIC_ACK *****************
;; Defined at:
;;		line 67 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\iic.c"
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
psect	text1145
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\iic.c"
	line	67
	global	__size_of_IIC_ACK
	__size_of_IIC_ACK	equ	__end_of_IIC_ACK-_IIC_ACK
	
_IIC_ACK:	
	opt	stack 0
; Regs used in _IIC_ACK: [wreg+status,2+status,0+pclath+cstack]
	line	68
	
l15122:	
;iic.c: 68: TRISC1=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	69
;iic.c: 69: RC1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(57/8),(57)&7
	line	70
	
l15124:	
;iic.c: 70: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	71
	
l15126:	
;iic.c: 71: RC2=1;
	bsf	(58/8),(58)&7
	line	72
;iic.c: 72: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	73
	
l15128:	
;iic.c: 73: RC2=0;
	bcf	(58/8),(58)&7
	line	74
	
l15130:	
;iic.c: 74: RC1=1;
	bsf	(57/8),(57)&7
	line	75
	
l10723:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_ACK
	__end_of_IIC_ACK:
;; =============== function _IIC_ACK ends ============

	signat	_IIC_ACK,88
	global	_IIC_Wait_ACK
psect	text1146,local,class=CODE,delta=2
global __ptext1146
__ptext1146:

;; *************** function _IIC_Wait_ACK *****************
;; Defined at:
;;		line 42 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\iic.c"
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
psect	text1146
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\iic.c"
	line	42
	global	__size_of_IIC_Wait_ACK
	__size_of_IIC_Wait_ACK	equ	__end_of_IIC_Wait_ACK-_IIC_Wait_ACK
	
_IIC_Wait_ACK:	
	opt	stack 1
; Regs used in _IIC_Wait_ACK: [wreg+status,2+status,0+pclath+cstack]
	line	43
	
l15094:	
	line	44
	
l15096:	
;iic.c: 44: TRISC1=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	45
	
l15098:	
;iic.c: 45: RC1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(57/8),(57)&7
	line	46
	
l15100:	
;iic.c: 46: {TRISC1=1,WPUC1=1;};
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1081/8)^080h,(1081)&7
	
l15102:	
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3193/8)^0180h,(3193)&7
	line	48
	
l15104:	
;iic.c: 48: RC2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	49
	
l15106:	
;iic.c: 49: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	50
	
l15108:	
;iic.c: 50: RC2=1;
	bsf	(58/8),(58)&7
	line	51
	
l15110:	
;iic.c: 51: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	53
	
l15112:	
;iic.c: 53: if(RC1)
	btfss	(57/8),(57)&7
	goto	u3151
	goto	u3150
u3151:
	goto	l15116
u3150:
	line	55
	
l15114:	
	line	56
;iic.c: 56: }
	goto	l15118
	line	59
	
l15116:	
	line	61
	
l15118:	
;iic.c: 60: }
;iic.c: 61: RC2=0;
	bcf	(58/8),(58)&7
	line	64
	
l10720:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_Wait_ACK
	__end_of_IIC_Wait_ACK:
;; =============== function _IIC_Wait_ACK ends ============

	signat	_IIC_Wait_ACK,89
	global	_IIC_STOP
psect	text1147,local,class=CODE,delta=2
global __ptext1147
__ptext1147:

;; *************** function _IIC_STOP *****************
;; Defined at:
;;		line 32 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\iic.c"
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
psect	text1147
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\iic.c"
	line	32
	global	__size_of_IIC_STOP
	__size_of_IIC_STOP	equ	__end_of_IIC_STOP-_IIC_STOP
	
_IIC_STOP:	
	opt	stack 1
; Regs used in _IIC_STOP: [wreg+status,2+status,0+pclath+cstack]
	line	33
	
l15088:	
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
	
l15090:	
;iic.c: 36: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	37
	
l15092:	
;iic.c: 37: RC1=1;
	bsf	(57/8),(57)&7
	line	38
	
l10715:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_STOP
	__end_of_IIC_STOP:
;; =============== function _IIC_STOP ends ============

	signat	_IIC_STOP,88
	global	_IIC_START
psect	text1148,local,class=CODE,delta=2
global __ptext1148
__ptext1148:

;; *************** function _IIC_START *****************
;; Defined at:
;;		line 20 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\iic.c"
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
psect	text1148
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\iic.c"
	line	20
	global	__size_of_IIC_START
	__size_of_IIC_START	equ	__end_of_IIC_START-_IIC_START
	
_IIC_START:	
	opt	stack 1
; Regs used in _IIC_START: [wreg+status,2+status,0+pclath+cstack]
	line	21
	
l15080:	
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
	
l15082:	
;iic.c: 24: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	25
	
l15084:	
;iic.c: 25: RC1=0;
	bcf	(57/8),(57)&7
	line	26
;iic.c: 26: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	27
	
l15086:	
;iic.c: 27: RC2=0;
	bcf	(58/8),(58)&7
	line	28
	
l10712:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_START
	__end_of_IIC_START:
;; =============== function _IIC_START ends ============

	signat	_IIC_START,88
	global	_key_scan
psect	text1149,local,class=CODE,delta=2
global __ptext1149
__ptext1149:

;; *************** function _key_scan *****************
;; Defined at:
;;		line 28 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\key_scan.c"
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
psect	text1149
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\key_scan.c"
	global	__size_of_key_scan
	__size_of_key_scan	equ	__end_of_key_scan-_key_scan
	
_key_scan:	
	opt	stack 3
; Regs used in _key_scan: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	29
	
l15004:	
;key_scan.c: 29: if(RB1 == 0)
	btfsc	(49/8),(49)&7
	goto	u2971
	goto	u2970
u2971:
	goto	l7146
u2970:
	line	31
	
l15006:	
;key_scan.c: 30: {
;key_scan.c: 31: soft_delay_ms(10);
	movlw	0Ah
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	32
	
l15008:	
;key_scan.c: 32: if(RB1 == 0)
	btfsc	(49/8),(49)&7
	goto	u2981
	goto	u2980
u2981:
	goto	l15026
u2980:
	line	33
	
l15010:	
;key_scan.c: 33: if((KEY0_FLAG&0x01) == 0)
	btfsc	(_KEY0_FLAG),(0)&7
	goto	u2991
	goto	u2990
u2991:
	goto	l15026
u2990:
	line	35
	
l15012:	
;key_scan.c: 34: {
;key_scan.c: 35: flag_time_key0_add = 0;
	clrf	(_flag_time_key0_add)
	clrf	(_flag_time_key0_add+1)
	line	36
	
l15014:	
;key_scan.c: 36: KEY0_FLAG|=0X01;
	bsf	(_KEY0_FLAG)+(0/8),(0)&7
	line	37
	
l15016:	
;key_scan.c: 37: if(key_long_flag_add == 0)
	movf	(_key_long_flag_add),f
	skipz
	goto	u3001
	goto	u3000
u3001:
	goto	l7147
u3000:
	line	39
	
l15018:	
;key_scan.c: 38: {
;key_scan.c: 39: key_long_flag_add = 1;
	clrf	(_key_long_flag_add)
	incf	(_key_long_flag_add),f
	goto	l15026
	line	42
	
l7147:	
;key_scan.c: 40: }
;key_scan.c: 41: }
;key_scan.c: 42: }
	goto	l15026
	line	43
	
l7146:	
	line	45
;key_scan.c: 43: else
;key_scan.c: 44: {
;key_scan.c: 45: if(KEY0_FLAG&0x01)
	btfss	(_KEY0_FLAG),(0)&7
	goto	u3011
	goto	u3010
u3011:
	goto	l15026
u3010:
	line	47
	
l15020:	
;key_scan.c: 46: {
;key_scan.c: 47: KEY0_FLAG |= 0X02;
	bsf	(_KEY0_FLAG)+(1/8),(1)&7
	line	48
	
l15022:	
;key_scan.c: 48: if(key_long_flag_add == 1)
	decf	(_key_long_flag_add),w
	skipz
	goto	u3021
	goto	u3020
u3021:
	goto	l15026
u3020:
	line	50
	
l15024:	
;key_scan.c: 49: {
;key_scan.c: 50: key_long_flag_add = 0;
	clrf	(_key_long_flag_add)
	line	55
	
l15026:	
;key_scan.c: 51: }
;key_scan.c: 52: }
;key_scan.c: 53: }
;key_scan.c: 55: if(RB2 == 0)
	btfsc	(50/8),(50)&7
	goto	u3031
	goto	u3030
u3031:
	goto	l7153
u3030:
	line	57
	
l15028:	
;key_scan.c: 56: {
;key_scan.c: 57: soft_delay_ms(10);
	movlw	0Ah
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	58
	
l15030:	
;key_scan.c: 58: if(RB2 == 0)
	btfsc	(50/8),(50)&7
	goto	u3041
	goto	u3040
u3041:
	goto	l15048
u3040:
	line	59
	
l15032:	
;key_scan.c: 59: if((KEY1_FLAG&0x01) == 0)
	btfsc	(_KEY1_FLAG),(0)&7
	goto	u3051
	goto	u3050
u3051:
	goto	l15048
u3050:
	line	61
	
l15034:	
;key_scan.c: 60: {
;key_scan.c: 61: flag_time_key1_add = 0;
	clrf	(_flag_time_key1_add)
	clrf	(_flag_time_key1_add+1)
	line	62
	
l15036:	
;key_scan.c: 62: KEY1_FLAG |= 0X01;
	bsf	(_KEY1_FLAG)+(0/8),(0)&7
	line	63
	
l15038:	
;key_scan.c: 63: if(key_long_flag_add == 0)
	movf	(_key_long_flag_add),f
	skipz
	goto	u3061
	goto	u3060
u3061:
	goto	l7154
u3060:
	line	65
	
l15040:	
;key_scan.c: 64: {
;key_scan.c: 65: key_long_flag_add = 2;
	movlw	(02h)
	movwf	(_key_long_flag_add)
	goto	l15048
	line	69
	
l7154:	
;key_scan.c: 66: }
;key_scan.c: 67: }
;key_scan.c: 69: }
	goto	l15048
	line	70
	
l7153:	
	line	72
;key_scan.c: 70: else
;key_scan.c: 71: {
;key_scan.c: 72: if(KEY1_FLAG & 0x01)
	btfss	(_KEY1_FLAG),(0)&7
	goto	u3071
	goto	u3070
u3071:
	goto	l15048
u3070:
	line	74
	
l15042:	
;key_scan.c: 73: {
;key_scan.c: 74: KEY1_FLAG |= 0X02;
	bsf	(_KEY1_FLAG)+(1/8),(1)&7
	line	75
	
l15044:	
;key_scan.c: 75: if(key_long_flag_add == 2)
	movf	(_key_long_flag_add),w
	xorlw	02h
	skipz
	goto	u3081
	goto	u3080
u3081:
	goto	l15048
u3080:
	line	77
	
l15046:	
;key_scan.c: 76: {
;key_scan.c: 77: key_long_flag_add = 0;
	clrf	(_key_long_flag_add)
	line	86
	
l15048:	
;key_scan.c: 78: }
;key_scan.c: 79: }
;key_scan.c: 80: }
;key_scan.c: 86: if(RB3 == 0)
	btfsc	(51/8),(51)&7
	goto	u3091
	goto	u3090
u3091:
	goto	l7160
u3090:
	line	88
	
l15050:	
;key_scan.c: 87: {
;key_scan.c: 88: soft_delay_ms(10);
	movlw	0Ah
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	89
	
l15052:	
;key_scan.c: 89: if(RB3 == 0)
	btfsc	(51/8),(51)&7
	goto	u3101
	goto	u3100
u3101:
	goto	l15078
u3100:
	line	90
	
l15054:	
;key_scan.c: 90: if((KEY2_FLAG&0x01) == 0)
	btfsc	(_KEY2_FLAG),(0)&7
	goto	u3111
	goto	u3110
u3111:
	goto	l15078
u3110:
	line	92
	
l15056:	
;key_scan.c: 91: {
;key_scan.c: 92: flag_time_key2_add = 0;
	clrf	(_flag_time_key2_add)
	clrf	(_flag_time_key2_add+1)
	line	93
	
l15058:	
;key_scan.c: 93: KEY2_FLAG|=0X01;
	bsf	(_KEY2_FLAG)+(0/8),(0)&7
	line	94
	
l15060:	
;key_scan.c: 94: if(key_long_flag_add == 0)
	movf	(_key_long_flag_add),f
	skipz
	goto	u3121
	goto	u3120
u3121:
	goto	l7164
u3120:
	line	96
	
l15062:	
;key_scan.c: 95: {
;key_scan.c: 96: key_long_flag_add = 4;
	movlw	(04h)
	movwf	(_key_long_flag_add)
	goto	l15078
	line	100
	
l7160:	
	line	102
;key_scan.c: 100: else
;key_scan.c: 101: {
;key_scan.c: 102: if(KEY2_FLAG & 0x01)
	btfss	(_KEY2_FLAG),(0)&7
	goto	u3131
	goto	u3130
u3131:
	goto	l15078
u3130:
	line	104
	
l15064:	
;key_scan.c: 103: {
;key_scan.c: 104: KEY2_FLAG |= 0X02;
	bsf	(_KEY2_FLAG)+(1/8),(1)&7
	line	105
	
l15066:	
;key_scan.c: 105: if(key_long_flag_add == 4)
	movf	(_key_long_flag_add),w
	xorlw	04h
	skipz
	goto	u3141
	goto	u3140
u3141:
	goto	l7164
u3140:
	line	107
	
l15068:	
;key_scan.c: 106: {
;key_scan.c: 107: key_long_flag_add = 0;
	clrf	(_key_long_flag_add)
	goto	l15078
	line	110
	
l7164:	
	line	113
;key_scan.c: 108: }
;key_scan.c: 109: }
;key_scan.c: 110: }
;key_scan.c: 113: switch(key_long_flag_add)
	goto	l15078
	line	121
	
l15070:	
;key_scan.c: 120: {
;key_scan.c: 121: flag_time_key1_add = 0;
	clrf	(_flag_time_key1_add)
	clrf	(_flag_time_key1_add+1)
	line	122
;key_scan.c: 122: flag_time_key2_add = 0;
	clrf	(_flag_time_key2_add)
	clrf	(_flag_time_key2_add+1)
	line	123
;key_scan.c: 123: }break;
	goto	l7173
	line	126
	
l15072:	
;key_scan.c: 125: {
;key_scan.c: 126: flag_time_key0_add = 0;
	clrf	(_flag_time_key0_add)
	clrf	(_flag_time_key0_add+1)
	line	127
;key_scan.c: 127: flag_time_key2_add = 0;
	clrf	(_flag_time_key2_add)
	clrf	(_flag_time_key2_add+1)
	line	128
;key_scan.c: 128: }break;
	goto	l7173
	line	131
	
l15074:	
;key_scan.c: 130: {
;key_scan.c: 131: flag_time_key0_add = 0;
	clrf	(_flag_time_key0_add)
	clrf	(_flag_time_key0_add+1)
	line	132
;key_scan.c: 132: flag_time_key1_add = 0;
	clrf	(_flag_time_key1_add)
	clrf	(_flag_time_key1_add+1)
	line	133
;key_scan.c: 133: }break;
	goto	l7173
	line	113
	
l15078:	
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
	goto	l7173
	xorlw	1^0	; case 1
	skipnz
	goto	l15070
	xorlw	2^1	; case 2
	skipnz
	goto	l15072
	xorlw	4^2	; case 4
	skipnz
	goto	l15074
	goto	l7173
	opt asmopt_on

	line	135
	
l7173:	
	return
	opt stack 0
GLOBAL	__end_of_key_scan
	__end_of_key_scan:
;; =============== function _key_scan ends ============

	signat	_key_scan,88
	global	_RF_ReadReg
psect	text1150,local,class=CODE,delta=2
global __ptext1150
__ptext1150:

;; *************** function _RF_ReadReg *****************
;; Defined at:
;;		line 306 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
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
psect	text1150
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
	line	306
	global	__size_of_RF_ReadReg
	__size_of_RF_ReadReg	equ	__end_of_RF_ReadReg-_RF_ReadReg
	
_RF_ReadReg:	
	opt	stack 0
; Regs used in _RF_ReadReg: [wreg+status,2+status,0+pclath+cstack]
;RF_ReadReg@reg_addr stored from wreg
	line	308
	movwf	(RF_ReadReg@reg_addr)
	
l16706:	
;rf297L.c: 307: unsigned char tmp;
;rf297L.c: 308: RE2=0;
	bcf	(74/8),(74)&7
	line	309
	
l16708:	
;rf297L.c: 309: SPI_RW(reg_addr);
	movf	(RF_ReadReg@reg_addr),w
	fcall	_SPI_RW
	line	310
;rf297L.c: 310: tmp = SPI_RW(0);
	movlw	(0)
	fcall	_SPI_RW
	movwf	(RF_ReadReg@tmp)
	line	311
	
l16710:	
;rf297L.c: 311: RE2=1;
	bsf	(74/8),(74)&7
	line	312
	
l16712:	
;rf297L.c: 312: return tmp;
	movf	(RF_ReadReg@tmp),w
	line	313
	
l5206:	
	return
	opt stack 0
GLOBAL	__end_of_RF_ReadReg
	__end_of_RF_ReadReg:
;; =============== function _RF_ReadReg ends ============

	signat	_RF_ReadReg,4217
	global	_RF_Read_Buff
psect	text1151,local,class=CODE,delta=2
global __ptext1151
__ptext1151:

;; *************** function _RF_Read_Buff *****************
;; Defined at:
;;		line 275 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
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
psect	text1151
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
	line	275
	global	__size_of_RF_Read_Buff
	__size_of_RF_Read_Buff	equ	__end_of_RF_Read_Buff-_RF_Read_Buff
	
_RF_Read_Buff:	
	opt	stack 1
; Regs used in _RF_Read_Buff: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_Read_Buff@reg_addr stored from wreg
	line	277
	movwf	(RF_Read_Buff@reg_addr)
	
l16694:	
;rf297L.c: 276: unsigned char byte_ctr;
;rf297L.c: 277: RE2=0;
	bcf	(74/8),(74)&7
	line	278
	
l16696:	
;rf297L.c: 278: SPI_RW(reg_addr);
	movf	(RF_Read_Buff@reg_addr),w
	fcall	_SPI_RW
	line	279
	
l16698:	
;rf297L.c: 279: for(byte_ctr=0;byte_ctr<length;byte_ctr++){
	clrf	(RF_Read_Buff@byte_ctr)
	goto	l16704
	line	280
	
l16700:	
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
	
l16702:	
	incf	(RF_Read_Buff@byte_ctr),f
	
l16704:	
	movf	(RF_Read_Buff@length),w
	subwf	(RF_Read_Buff@byte_ctr),w
	skipc
	goto	u5371
	goto	u5370
u5371:
	goto	l16700
u5370:
	
l5193:	
	line	282
;rf297L.c: 281: }
;rf297L.c: 282: RE2=1;
	bsf	(74/8),(74)&7
	line	283
	
l5194:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Read_Buff
	__end_of_RF_Read_Buff:
;; =============== function _RF_Read_Buff ends ============

	signat	_RF_Read_Buff,12408
	global	_RF_Write_Buff
psect	text1152,local,class=CODE,delta=2
global __ptext1152
__ptext1152:

;; *************** function _RF_Write_Buff *****************
;; Defined at:
;;		line 286 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
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
psect	text1152
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
	line	286
	global	__size_of_RF_Write_Buff
	__size_of_RF_Write_Buff	equ	__end_of_RF_Write_Buff-_RF_Write_Buff
	
_RF_Write_Buff:	
	opt	stack 3
; Regs used in _RF_Write_Buff: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_Write_Buff@reg_addr stored from wreg
	line	288
	movwf	(RF_Write_Buff@reg_addr)
	
l16682:	
;rf297L.c: 287: unsigned char i;
;rf297L.c: 288: RE2=0;
	bcf	(74/8),(74)&7
	line	289
	
l16684:	
;rf297L.c: 289: SPI_RW(reg_addr);
	movf	(RF_Write_Buff@reg_addr),w
	fcall	_SPI_RW
	line	290
	
l16686:	
;rf297L.c: 290: for(i=0;i<length;i++)
	clrf	(RF_Write_Buff@i)
	goto	l16692
	line	292
	
l16688:	
;rf297L.c: 291: {
;rf297L.c: 292: SPI_RW(pBuff[i]);
	movf	(RF_Write_Buff@i),w
	addwf	(RF_Write_Buff@pBuff),w
	movwf	fsr0
	fcall	stringdir
	fcall	_SPI_RW
	line	290
	
l16690:	
	incf	(RF_Write_Buff@i),f
	
l16692:	
	movf	(RF_Write_Buff@length),w
	subwf	(RF_Write_Buff@i),w
	skipc
	goto	u5361
	goto	u5360
u5361:
	goto	l16688
u5360:
	
l5199:	
	line	294
;rf297L.c: 293: }
;rf297L.c: 294: RE2=1;
	bsf	(74/8),(74)&7
	line	295
	
l5200:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Write_Buff
	__end_of_RF_Write_Buff:
;; =============== function _RF_Write_Buff ends ============

	signat	_RF_Write_Buff,12408
	global	_RF_WriteReg
psect	text1153,local,class=CODE,delta=2
global __ptext1153
__ptext1153:

;; *************** function _RF_WriteReg *****************
;; Defined at:
;;		line 298 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
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
psect	text1153
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
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
	
l16676:	
;rf297L.c: 299: RE2=0;
	bcf	(74/8),(74)&7
	line	300
	
l16678:	
;rf297L.c: 300: SPI_RW(reg_addr);
	movf	(RF_WriteReg@reg_addr),w
	fcall	_SPI_RW
	line	301
;rf297L.c: 301: SPI_RW(write_data);
	movf	(RF_WriteReg@write_data),w
	fcall	_SPI_RW
	line	302
	
l16680:	
;rf297L.c: 302: RE2=1;
	bsf	(74/8),(74)&7
	line	303
	
l5203:	
	return
	opt stack 0
GLOBAL	__end_of_RF_WriteReg
	__end_of_RF_WriteReg:
;; =============== function _RF_WriteReg ends ============

	signat	_RF_WriteReg,8312
	global	___bmul
psect	text1154,local,class=CODE,delta=2
global __ptext1154
__ptext1154:

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
psect	text1154
	file	"F:\许泽彬\PAN2416\PAN2416\编译器\CMS_IDE_V1.41.03_CRC_PANCHIP\CMS_IDE_V1.41.03_CRC_PANCHIP\data\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 4
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	movwf	(___bmul@multiplier)
	line	4
	
l14932:	
	clrf	(___bmul@product)
	line	7
	
l14934:	
	btfss	(___bmul@multiplier),(0)&7
	goto	u2911
	goto	u2910
u2911:
	goto	l14938
u2910:
	line	8
	
l14936:	
	movf	(___bmul@multiplicand),w
	addwf	(___bmul@product),f
	line	9
	
l14938:	
	clrc
	rlf	(___bmul@multiplicand),f
	line	10
	
l14940:	
	clrc
	rrf	(___bmul@multiplier),f
	line	11
	
l14942:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u2921
	goto	u2920
u2921:
	goto	l14934
u2920:
	line	12
	
l14944:	
	movf	(___bmul@product),w
	line	13
	
l11397:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
;; =============== function ___bmul ends ============

	signat	___bmul,8313
	global	_iic_delay_us
psect	text1155,local,class=CODE,delta=2
global __ptext1155
__ptext1155:

;; *************** function _iic_delay_us *****************
;; Defined at:
;;		line 6 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\iic.c"
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
psect	text1155
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\iic.c"
	line	6
	global	__size_of_iic_delay_us
	__size_of_iic_delay_us	equ	__end_of_iic_delay_us-_iic_delay_us
	
_iic_delay_us:	
	opt	stack 1
; Regs used in _iic_delay_us: [wreg+status,2+status,0]
;iic_delay_us@delay stored from wreg
	movwf	(iic_delay_us@delay)
	line	7
	
l14928:	
;iic.c: 7: while(delay--);
	
l14930:	
	decf	(iic_delay_us@delay),f
	movf	((iic_delay_us@delay)),w
	xorlw	0FFh
	skipz
	goto	u2901
	goto	u2900
u2901:
	goto	l14930
u2900:
	line	8
	
l10706:	
	return
	opt stack 0
GLOBAL	__end_of_iic_delay_us
	__end_of_iic_delay_us:
;; =============== function _iic_delay_us ends ============

	signat	_iic_delay_us,4216
	global	_UpdateCRC
psect	text1156,local,class=CODE,delta=2
global __ptext1156
__ptext1156:

;; *************** function _UpdateCRC *****************
;; Defined at:
;;		line 53 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\recive.c"
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
psect	text1156
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\recive.c"
	line	53
	global	__size_of_UpdateCRC
	__size_of_UpdateCRC	equ	__end_of_UpdateCRC-_UpdateCRC
	
_UpdateCRC:	
	opt	stack 3
; Regs used in _UpdateCRC: [wreg-fsr0h+status,2+status,0+btemp+1]
;UpdateCRC@CRC_input stored from wreg
	movwf	(UpdateCRC@CRC_input)
	line	54
	
l14900:	
;recive.c: 54: unsigned char i,k = 0;
	clrf	(UpdateCRC@k)
	line	55
	
l14902:	
;recive.c: 55: unsigned short CRC_acc = 0x5555;
	movlw	low(05555h)
	movwf	(UpdateCRC@CRC_acc)
	movlw	high(05555h)
	movwf	((UpdateCRC@CRC_acc))+1
	line	57
;recive.c: 57: while (len--)
	goto	l14922
	line	59
	
l14904:	
;recive.c: 58: {
;recive.c: 59: CRC_acc = CRC_acc ^ (CRC_input[k++] << 8);
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
	
l14906:	
	incf	(UpdateCRC@k),f
	line	61
	
l14908:	
;recive.c: 61: for (i = 0; i < 8; i++)
	clrf	(UpdateCRC@i)
	line	62
	
l9802:	
	line	63
;recive.c: 62: {
;recive.c: 63: if ((CRC_acc & 0x8000) == 0x8000)
	btfss	(UpdateCRC@CRC_acc+1),(15)&7
	goto	u2871
	goto	u2870
u2871:
	goto	l14918
u2870:
	line	65
	
l14914:	
;recive.c: 64: {
;recive.c: 65: CRC_acc = CRC_acc << 1;
	clrc
	rlf	(UpdateCRC@CRC_acc),f
	rlf	(UpdateCRC@CRC_acc+1),f
	line	66
	
l14916:	
;recive.c: 66: CRC_acc ^= 0x1021;
	movlw	low(01021h)
	xorwf	(UpdateCRC@CRC_acc),f
	movlw	high(01021h)
	xorwf	(UpdateCRC@CRC_acc+1),f
	line	67
;recive.c: 67: }
	goto	l9805
	line	70
	
l14918:	
;recive.c: 68: else
;recive.c: 69: {
;recive.c: 70: CRC_acc = CRC_acc << 1;
	clrc
	rlf	(UpdateCRC@CRC_acc),f
	rlf	(UpdateCRC@CRC_acc+1),f
	line	71
	
l9805:	
	line	61
	incf	(UpdateCRC@i),f
	
l14920:	
	movlw	(08h)
	subwf	(UpdateCRC@i),w
	skipc
	goto	u2881
	goto	u2880
u2881:
	goto	l9802
u2880:
	line	57
	
l14922:	
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
	goto	u2891
	goto	u2890
u2891:
	goto	l14904
u2890:
	line	74
	
l14924:	
;recive.c: 71: }
;recive.c: 72: }
;recive.c: 73: }
;recive.c: 74: return CRC_acc;
	movf	(UpdateCRC@CRC_acc+1),w
	movwf	(?_UpdateCRC+1)
	movf	(UpdateCRC@CRC_acc),w
	movwf	(?_UpdateCRC)
	line	75
	
l9807:	
	return
	opt stack 0
GLOBAL	__end_of_UpdateCRC
	__end_of_UpdateCRC:
;; =============== function _UpdateCRC ends ============

	signat	_UpdateCRC,8314
	global	_SPI_RW
psect	text1157,local,class=CODE,delta=2
global __ptext1157
__ptext1157:

;; *************** function _SPI_RW *****************
;; Defined at:
;;		line 331 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
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
psect	text1157
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
	line	331
	global	__size_of_SPI_RW
	__size_of_SPI_RW	equ	__end_of_SPI_RW-_SPI_RW
	
_SPI_RW:	
	opt	stack 2
; Regs used in _SPI_RW: [wreg+status,2+status,0]
;SPI_RW@read_reg_addr stored from wreg
	line	333
	movwf	(SPI_RW@read_reg_addr)
	
l16658:	
;rf297L.c: 332: unsigned char i;
;rf297L.c: 333: for(i = 0; i < 8; i++)
	clrf	(SPI_RW@i)
	line	334
	
l5212:	
	line	335
;rf297L.c: 334: {
;rf297L.c: 335: RE1=0;
	bcf	(73/8),(73)&7
	line	336
;rf297L.c: 336: if(read_reg_addr & 0x80)
	btfss	(SPI_RW@read_reg_addr),(7)&7
	goto	u5331
	goto	u5330
u5331:
	goto	l5214
u5330:
	line	338
	
l16664:	
;rf297L.c: 337: {
;rf297L.c: 338: RA5=1;
	bsf	(45/8),(45)&7
	line	339
;rf297L.c: 339: }
	goto	l5215
	line	340
	
l5214:	
	line	342
;rf297L.c: 340: else
;rf297L.c: 341: {
;rf297L.c: 342: RA5=0;
	bcf	(45/8),(45)&7
	line	343
	
l5215:	
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
	goto	u5341
	goto	u5340
u5341:
	goto	l16668
u5340:
	line	348
	
l16666:	
;rf297L.c: 347: {
;rf297L.c: 348: read_reg_addr = read_reg_addr | 0x01;
	bsf	(SPI_RW@read_reg_addr)+(0/8),(0)&7
	line	333
	
l16668:	
	incf	(SPI_RW@i),f
	
l16670:	
	movlw	(08h)
	subwf	(SPI_RW@i),w
	skipc
	goto	u5351
	goto	u5350
u5351:
	goto	l5212
u5350:
	
l5213:	
	line	351
;rf297L.c: 349: }
;rf297L.c: 350: }
;rf297L.c: 351: RE1=0;
	bcf	(73/8),(73)&7
	line	352
	
l16672:	
;rf297L.c: 352: return read_reg_addr;
	movf	(SPI_RW@read_reg_addr),w
	line	353
	
l5217:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_RW
	__end_of_SPI_RW:
;; =============== function _SPI_RW ends ============

	signat	_SPI_RW,4217
	global	_SPI_init
psect	text1158,local,class=CODE,delta=2
global __ptext1158
__ptext1158:

;; *************** function _SPI_init *****************
;; Defined at:
;;		line 316 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
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
psect	text1158
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\rf297L.c"
	line	316
	global	__size_of_SPI_init
	__size_of_SPI_init	equ	__end_of_SPI_init-_SPI_init
	
_SPI_init:	
	opt	stack 4
; Regs used in _SPI_init: []
	line	318
	
l14880:	
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
	
l5209:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_init
	__end_of_SPI_init:
;; =============== function _SPI_init ends ============

	signat	_SPI_init,88
	global	_delay_task
psect	text1159,local,class=CODE,delta=2
global __ptext1159
__ptext1159:

;; *************** function _delay_task *****************
;; Defined at:
;;		line 940 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\recive.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
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
psect	text1159
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\recive.c"
	line	940
	global	__size_of_delay_task
	__size_of_delay_task	equ	__end_of_delay_task-_delay_task
	
_delay_task:	
	opt	stack 5
; Regs used in _delay_task: [wreg-fsr0h+status,2+status,0]
	line	942
	
l14792:	
;recive.c: 942: if(channel_delay[0] != 0)
	movf	(_channel_delay),w
	skipz
	goto	u2720
	goto	l10080
u2720:
	line	944
	
l14794:	
;recive.c: 943: {
;recive.c: 944: if(delay_flag == 0)delay_flag = 1;
	movf	(_delay_flag),f
	skipz
	goto	u2731
	goto	u2730
u2731:
	goto	l14798
u2730:
	
l14796:	
	clrf	(_delay_flag)
	incf	(_delay_flag),f
	line	945
	
l14798:	
;recive.c: 945: if(channel_delay[2] > 0)
	movf	0+(_channel_delay)+02h,w
	skipz
	goto	u2740
	goto	l14850
u2740:
	line	947
	
l14800:	
;recive.c: 946: {
;recive.c: 947: if(flag_5min_add >= 30000)
	movlw	high(07530h)
	subwf	(_flag_5min_add+1),w
	movlw	low(07530h)
	skipnz
	subwf	(_flag_5min_add),w
	skipc
	goto	u2751
	goto	u2750
u2751:
	goto	l10080
u2750:
	line	949
	
l14802:	
;recive.c: 948: {
;recive.c: 949: flag_5min_add = 0;
	clrf	(_flag_5min_add)
	clrf	(_flag_5min_add+1)
	line	950
	
l14804:	
;recive.c: 950: channel_delay[2]--;
	decf	0+(_channel_delay)+02h,f
	goto	l10080
	line	959
	
l14806:	
;recive.c: 958: {
;recive.c: 959: if(channel_delay[1] != 2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u2761
	goto	u2760
u2761:
	goto	l14810
u2760:
	line	960
	
l14808:	
;recive.c: 960: KEY0.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY0)
	goto	l14852
	line	962
	
l14810:	
;recive.c: 961: else
;recive.c: 962: KEY0.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY0),f
	goto	l14852
	line	966
	
l14812:	
;recive.c: 965: {
;recive.c: 966: if(channel_delay[1] != 2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u2771
	goto	u2770
u2771:
	goto	l14816
u2770:
	line	967
	
l14814:	
;recive.c: 967: KEY1.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY1)
	goto	l14852
	line	969
	
l14816:	
;recive.c: 968: else
;recive.c: 969: KEY1.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY1),f
	goto	l14852
	line	973
	
l14818:	
;recive.c: 972: {
;recive.c: 973: if(channel_delay[1] != 2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u2781
	goto	u2780
u2781:
	goto	l14822
u2780:
	line	974
	
l14820:	
;recive.c: 974: KEY2.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY2)
	goto	l14852
	line	976
	
l14822:	
;recive.c: 975: else
;recive.c: 976: KEY2.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY2),f
	goto	l14852
	line	980
	
l14824:	
;recive.c: 979: {
;recive.c: 980: if(channel_delay[1] != 2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u2791
	goto	u2790
u2791:
	goto	l14828
u2790:
	line	982
	
l14826:	
;recive.c: 981: {
;recive.c: 982: KEY0.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY0)
	line	983
;recive.c: 983: KEY1.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY1)
	line	984
;recive.c: 984: }
	goto	l14852
	line	987
	
l14828:	
;recive.c: 985: else
;recive.c: 986: {
;recive.c: 987: KEY0.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY0),f
	line	988
;recive.c: 988: KEY1.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY1),f
	goto	l14852
	line	993
	
l14830:	
;recive.c: 992: {
;recive.c: 993: if(channel_delay[1] != 2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u2801
	goto	u2800
u2801:
	goto	l14834
u2800:
	line	995
	
l14832:	
;recive.c: 994: {
;recive.c: 995: KEY0.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY0)
	line	996
;recive.c: 996: KEY2.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY2)
	line	997
;recive.c: 997: }
	goto	l14852
	line	1000
	
l14834:	
;recive.c: 998: else
;recive.c: 999: {
;recive.c: 1000: KEY0.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY0),f
	line	1001
;recive.c: 1001: KEY2.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY2),f
	goto	l14852
	line	1006
	
l14836:	
;recive.c: 1005: {
;recive.c: 1006: if(channel_delay[1] != 2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u2811
	goto	u2810
u2811:
	goto	l14840
u2810:
	line	1008
	
l14838:	
;recive.c: 1007: {
;recive.c: 1008: KEY1.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY1)
	line	1009
;recive.c: 1009: KEY2.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY2)
	line	1010
;recive.c: 1010: }
	goto	l14852
	line	1013
	
l14840:	
;recive.c: 1011: else
;recive.c: 1012: {
;recive.c: 1013: KEY1.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY1),f
	line	1014
;recive.c: 1014: KEY2.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY2),f
	goto	l14852
	line	1019
	
l14842:	
;recive.c: 1018: {
;recive.c: 1019: if(channel_delay[1] != 2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u2821
	goto	u2820
u2821:
	goto	l14846
u2820:
	line	1021
	
l14844:	
;recive.c: 1020: {
;recive.c: 1021: KEY0.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY0)
	line	1022
;recive.c: 1022: KEY1.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY1)
	line	1023
;recive.c: 1023: KEY2.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY2)
	line	1024
;recive.c: 1024: }
	goto	l14852
	line	1027
	
l14846:	
;recive.c: 1025: else
;recive.c: 1026: {
;recive.c: 1027: KEY0.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY0),f
	line	1028
;recive.c: 1028: KEY1.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY1),f
	line	1029
;recive.c: 1029: KEY2.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY2),f
	goto	l14852
	line	955
	
l14850:	
	movf	(_channel_delay),w
	; Switch size 1, requested type "space"
; Number of cases is 7, Range of values is 1 to 7
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           22    12 (average)
; direct_byte           24    10 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l14806
	xorlw	2^1	; case 2
	skipnz
	goto	l14812
	xorlw	3^2	; case 3
	skipnz
	goto	l14824
	xorlw	4^3	; case 4
	skipnz
	goto	l14818
	xorlw	5^4	; case 5
	skipnz
	goto	l14830
	xorlw	6^5	; case 6
	skipnz
	goto	l14836
	xorlw	7^6	; case 7
	skipnz
	goto	l14842
	goto	l14852
	opt asmopt_on

	line	1035
	
l14852:	
;recive.c: 1035: channel_delay[0] = 0;
	clrf	(_channel_delay)
	line	1036
;recive.c: 1036: channel_delay[1] = 0;
	clrf	0+(_channel_delay)+01h
	line	1037
;recive.c: 1037: channel_delay[2] = 0;
	clrf	0+(_channel_delay)+02h
	line	1038
;recive.c: 1038: delay_flag=0;
	clrf	(_delay_flag)
	line	1041
	
l10080:	
	return
	opt stack 0
GLOBAL	__end_of_delay_task
	__end_of_delay_task:
;; =============== function _delay_task ends ============

	signat	_delay_task,88
	global	_channel_set
psect	text1160,local,class=CODE,delta=2
global __ptext1160
__ptext1160:

;; *************** function _channel_set *****************
;; Defined at:
;;		line 894 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\recive.c"
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
psect	text1160
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\recive.c"
	line	894
	global	__size_of_channel_set
	__size_of_channel_set	equ	__end_of_channel_set-_channel_set
	
_channel_set:	
	opt	stack 5
; Regs used in _channel_set: [wreg-fsr0h+status,2+status,0]
;channel_set@channel_num stored from wreg
	movwf	(channel_set@channel_num)
	line	895
	
l14780:	
;recive.c: 895: switch(channel_num)
	goto	l14790
	line	897
;recive.c: 896: {
;recive.c: 897: case 0 :
	
l10039:	
	line	899
;recive.c: 898: {
;recive.c: 899: if(status)
	movf	(channel_set@status),w
	skipz
	goto	u2690
	goto	l10040
u2690:
	line	901
	
l14782:	
;recive.c: 900: {
;recive.c: 901: TRISB6 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	902
;recive.c: 902: RB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7
	line	903
;recive.c: 903: }
	goto	l10049
	line	904
	
l10040:	
	line	906
;recive.c: 904: else
;recive.c: 905: {
;recive.c: 906: TRISB6 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	907
;recive.c: 907: RB6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(54/8),(54)&7
	goto	l10049
	line	910
;recive.c: 910: case 1:
	
l10043:	
	line	912
;recive.c: 911: {
;recive.c: 912: if(status)
	movf	(channel_set@status),w
	skipz
	goto	u2700
	goto	l10044
u2700:
	line	914
	
l14784:	
;recive.c: 913: {
;recive.c: 914: TRISB5 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7
	line	915
;recive.c: 915: RB5 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(53/8),(53)&7
	line	916
;recive.c: 916: }
	goto	l10049
	line	917
	
l10044:	
	line	919
;recive.c: 917: else
;recive.c: 918: {
;recive.c: 919: TRISB5 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7
	line	920
;recive.c: 920: RB5 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(53/8),(53)&7
	goto	l10049
	line	923
;recive.c: 923: case 2:
	
l10046:	
	line	925
;recive.c: 924: {
;recive.c: 925: if(status)
	movf	(channel_set@status),w
	skipz
	goto	u2710
	goto	l10047
u2710:
	line	927
	
l14786:	
;recive.c: 926: {
;recive.c: 927: TRISB4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	928
;recive.c: 928: RB4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(52/8),(52)&7
	line	929
;recive.c: 929: }
	goto	l10049
	line	930
	
l10047:	
	line	932
;recive.c: 930: else
;recive.c: 931: {
;recive.c: 932: TRISB4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	933
;recive.c: 933: RB4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(52/8),(52)&7
	goto	l10049
	line	895
	
l14790:	
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
	goto	l10039
	xorlw	1^0	; case 1
	skipnz
	goto	l10043
	xorlw	2^1	; case 2
	skipnz
	goto	l10046
	goto	l10049
	opt asmopt_on

	line	937
	
l10049:	
	return
	opt stack 0
GLOBAL	__end_of_channel_set
	__end_of_channel_set:
;; =============== function _channel_set ends ============

	signat	_channel_set,8312
	global	_Enable_Interrupt
psect	text1161,local,class=CODE,delta=2
global __ptext1161
__ptext1161:

;; *************** function _Enable_Interrupt *****************
;; Defined at:
;;		line 38 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\system.c"
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
psect	text1161
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\system.c"
	line	38
	global	__size_of_Enable_Interrupt
	__size_of_Enable_Interrupt	equ	__end_of_Enable_Interrupt-_Enable_Interrupt
	
_Enable_Interrupt:	
	opt	stack 5
; Regs used in _Enable_Interrupt: []
	line	39
	
l14778:	
;system.c: 39: INTCON |= 0x80;
	bsf	(11)+(7/8),(7)&7	;volatile
	line	40
	
l1307:	
	return
	opt stack 0
GLOBAL	__end_of_Enable_Interrupt
	__end_of_Enable_Interrupt:
;; =============== function _Enable_Interrupt ends ============

	signat	_Enable_Interrupt,88
	global	_Timer1_start
psect	text1162,local,class=CODE,delta=2
global __ptext1162
__ptext1162:

;; *************** function _Timer1_start *****************
;; Defined at:
;;		line 43 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\timer1.c"
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
;;      Temps:          0       2       0
;;      Totals:         3       2       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1162
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\timer1.c"
	line	43
	global	__size_of_Timer1_start
	__size_of_Timer1_start	equ	__end_of_Timer1_start-_Timer1_start
	
_Timer1_start:	
	opt	stack 5
; Regs used in _Timer1_start: [wreg]
	line	44
	
l14772:	
;timer1.c: 44: Timer1_set_time = 0xffff - T_nums + Timer1_ISR_execution_total_time;
	movf	(Timer1_start@Timer1_ISR_execution_total_time),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_Timer1_set_time)	;volatile
	clrf	(_Timer1_set_time+1)	;volatile
	movf	(Timer1_start@T_nums+1),w
	movwf	(??_Timer1_start+0)+0+1
	movf	(Timer1_start@T_nums),w
	movwf	(??_Timer1_start+0)+0
	comf	(??_Timer1_start+0)+0,f
	comf	(??_Timer1_start+0)+1,f
	movf	0+(??_Timer1_start+0)+0,w
	addwf	(_Timer1_set_time),f	;volatile
	skipnc
	incf	(_Timer1_set_time+1),f	;volatile
	movf	1+(??_Timer1_start+0)+0,w
	addwf	(_Timer1_set_time+1),f	;volatile
	line	45
;timer1.c: 45: TMR1L = (unsigned char)(Timer1_set_time);
	movf	(_Timer1_set_time),w	;volatile
	movwf	(14)	;volatile
	line	46
;timer1.c: 46: TMR1H = (unsigned char)(Timer1_set_time>>8);
	movf	(_Timer1_set_time+1),w	;volatile
	movwf	(15)	;volatile
	line	47
	
l14774:	
;timer1.c: 47: PIR1 &= ~(0x01);
	bcf	(12)+(0/8),(0)&7	;volatile
	line	48
	
l14776:	
;timer1.c: 48: T1CON |= 0x01;
	bsf	(16)+(0/8),(0)&7	;volatile
	line	49
	
l2589:	
	return
	opt stack 0
GLOBAL	__end_of_Timer1_start
	__end_of_Timer1_start:
;; =============== function _Timer1_start ends ============

	signat	_Timer1_start,8312
	global	_Timer1_Init
psect	text1163,local,class=CODE,delta=2
global __ptext1163
__ptext1163:

;; *************** function _Timer1_Init *****************
;; Defined at:
;;		line 29 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\timer1.c"
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
psect	text1163
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\timer1.c"
	line	29
	global	__size_of_Timer1_Init
	__size_of_Timer1_Init	equ	__end_of_Timer1_Init-_Timer1_Init
	
_Timer1_Init:	
	opt	stack 5
; Regs used in _Timer1_Init: [wreg+status,2+status,0]
;Timer1_Init@TIMER1_DIVIDER stored from wreg
	movwf	(Timer1_Init@TIMER1_DIVIDER)
	line	30
	
l14764:	
;timer1.c: 30: T1CON = 0x00;
	clrf	(16)	;volatile
	line	31
	
l14766:	
;timer1.c: 31: T1CON |= TIMER1_DIVIDER;
	movf	(Timer1_Init@TIMER1_DIVIDER),w
	iorwf	(16),f	;volatile
	line	32
	
l14768:	
;timer1.c: 32: INTCON |= (0x40);
	bsf	(11)+(6/8),(6)&7	;volatile
	line	33
	
l14770:	
;timer1.c: 33: PIE1 |= 0x01;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(140)^080h+(0/8),(0)&7	;volatile
	line	34
	
l2586:	
	return
	opt stack 0
GLOBAL	__end_of_Timer1_Init
	__end_of_Timer1_Init:
;; =============== function _Timer1_Init ends ============

	signat	_Timer1_Init,4216
	global	_key_Init
psect	text1164,local,class=CODE,delta=2
global __ptext1164
__ptext1164:

;; *************** function _key_Init *****************
;; Defined at:
;;		line 335 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\key_scan.c"
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
psect	text1164
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\key_scan.c"
	line	335
	global	__size_of_key_Init
	__size_of_key_Init	equ	__end_of_key_Init-_key_Init
	
_key_Init:	
	opt	stack 5
; Regs used in _key_Init: [wreg+status,2+status,0]
	line	336
	
l14760:	
;key_scan.c: 336: OPTION_REG &= ~0x80;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(129)^080h+(7/8),(7)&7	;volatile
	line	337
	
l14762:	
;key_scan.c: 337: TRISB |= 0x0e;
	movlw	(0Eh)
	iorwf	(134)^080h,f	;volatile
	line	338
;key_scan.c: 338: WPUB |= 0x0e;
	movlw	(0Eh)
	iorwf	(149)^080h,f	;volatile
	line	339
	
l7221:	
	return
	opt stack 0
GLOBAL	__end_of_key_Init
	__end_of_key_Init:
;; =============== function _key_Init ends ============

	signat	_key_Init,88
	global	_IIC_Init
psect	text1165,local,class=CODE,delta=2
global __ptext1165
__ptext1165:

;; *************** function _IIC_Init *****************
;; Defined at:
;;		line 11 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\iic.c"
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
psect	text1165
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\iic.c"
	line	11
	global	__size_of_IIC_Init
	__size_of_IIC_Init	equ	__end_of_IIC_Init-_IIC_Init
	
_IIC_Init:	
	opt	stack 5
; Regs used in _IIC_Init: []
	line	12
	
l14758:	
;iic.c: 12: OPTION_REG &= ~0x80;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(129)^080h+(7/8),(7)&7	;volatile
	line	14
;iic.c: 14: RC1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(57/8),(57)&7
	line	15
;iic.c: 15: RC2=1;
	bsf	(58/8),(58)&7
	line	16
	
l10709:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_Init
	__end_of_IIC_Init:
;; =============== function _IIC_Init ends ============

	signat	_IIC_Init,88
	global	_soft_delay_ms
psect	text1166,local,class=CODE,delta=2
global __ptext1166
__ptext1166:

;; *************** function _soft_delay_ms *****************
;; Defined at:
;;		line 10 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\delay.c"
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
;;		On entry : 40/20
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
;;		_main
;;		_RF_Set_RxMode
;;		_key_scan
;;		_key_value_read
;;		_recive_task
;;		_AT24C02_Write_Msg
;;		_AT24C02_Read_Msg
;; This function uses a non-reentrant model
;;
psect	text1166
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\delay.c"
	line	10
	global	__size_of_soft_delay_ms
	__size_of_soft_delay_ms	equ	__end_of_soft_delay_ms-_soft_delay_ms
	
_soft_delay_ms:	
	opt	stack 4
; Regs used in _soft_delay_ms: [wreg+status,2+status,0]
	line	14
	
l14732:	
;delay.c: 12: volatile unsigned int i;
;delay.c: 13: volatile unsigned char j,k;
;delay.c: 14: for(i=0;i<ms;i++){
	bcf	status, 5	;RP0=0, select bank0
	clrf	(soft_delay_ms@i)	;volatile
	clrf	(soft_delay_ms@i+1)	;volatile
	goto	l14756
	line	15
	
l14734:	
;delay.c: 15: for(j=0;j<10;j++){
	clrf	(soft_delay_ms@j)	;volatile
	
l14736:	
	movlw	(0Ah)
	subwf	(soft_delay_ms@j),w	;volatile
	skipc
	goto	u2661
	goto	u2660
u2661:
	goto	l14740
u2660:
	goto	l14754
	line	16
	
l14740:	
;delay.c: 16: for(k=0;k<32;k++);
	clrf	(soft_delay_ms@k)	;volatile
	
l14742:	
	movlw	(020h)
	subwf	(soft_delay_ms@k),w	;volatile
	skipc
	goto	u2671
	goto	u2670
u2671:
	goto	l14746
u2670:
	goto	l14750
	
l14746:	
	incf	(soft_delay_ms@k),f	;volatile
	goto	l14742
	line	15
	
l14750:	
	incf	(soft_delay_ms@j),f	;volatile
	goto	l14736
	line	14
	
l14754:	
	incf	(soft_delay_ms@i),f	;volatile
	skipnz
	incf	(soft_delay_ms@i+1),f	;volatile
	
l14756:	
	movf	(soft_delay_ms@ms+1),w
	subwf	(soft_delay_ms@i+1),w	;volatile
	skipz
	goto	u2685
	movf	(soft_delay_ms@ms),w
	subwf	(soft_delay_ms@i),w	;volatile
u2685:
	skipc
	goto	u2681
	goto	u2680
u2681:
	goto	l14734
u2680:
	line	19
	
l5866:	
	return
	opt stack 0
GLOBAL	__end_of_soft_delay_ms
	__end_of_soft_delay_ms:
;; =============== function _soft_delay_ms ends ============

	signat	_soft_delay_ms,4216
	global	_system_set_CPU_frequency
psect	text1167,local,class=CODE,delta=2
global __ptext1167
__ptext1167:

;; *************** function _system_set_CPU_frequency *****************
;; Defined at:
;;		line 19 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\system.c"
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
psect	text1167
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\system.c"
	global	__size_of_system_set_CPU_frequency
	__size_of_system_set_CPU_frequency	equ	__end_of_system_set_CPU_frequency-_system_set_CPU_frequency
	
_system_set_CPU_frequency:	
	opt	stack 5
; Regs used in _system_set_CPU_frequency: [wreg+status,2]
;system_set_CPU_frequency@CPU_Frequency stored from wreg
	movwf	(system_set_CPU_frequency@CPU_Frequency)
	line	20
	
l14728:	
;system.c: 20: OSCCON = CPU_Frequency;
	movf	(system_set_CPU_frequency@CPU_Frequency),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h
	line	21
	
l14730:	
;system.c: 21: OSCTUNE = 0X00;
	clrf	(144)^080h	;volatile
	line	22
	
l1298:	
	return
	opt stack 0
GLOBAL	__end_of_system_set_CPU_frequency
	__end_of_system_set_CPU_frequency:
;; =============== function _system_set_CPU_frequency ends ============

	signat	_system_set_CPU_frequency,4216
	global	_ISR
psect	text1168,local,class=CODE,delta=2
global __ptext1168
__ptext1168:

;; *************** function _ISR *****************
;; Defined at:
;;		line 48 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\system.c"
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
psect	text1168
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\system.c"
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
psect	text1168
	line	53
	
i1l14854:	
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
	
i1l14856:	
	movlw	(043h)
	andwf	(ISR@peripheral_intterrupt_touch),f
	line	71
	
i1l14858:	
;system.c: 71: if(peripheral_intterrupt_touch & TIMER1_ISR_TOUCH) {
	btfss	(ISR@peripheral_intterrupt_touch),(0)&7
	goto	u283_21
	goto	u283_20
u283_21:
	goto	i1l1314
u283_20:
	line	72
	
i1l14860:	
;system.c: 72: TIMER1_ISR();
	fcall	_TIMER1_ISR
	line	82
	
i1l1314:	
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
psect	text1169,local,class=CODE,delta=2
global __ptext1169
__ptext1169:

;; *************** function _TIMER1_ISR *****************
;; Defined at:
;;		line 60 in file "F:\项目四准备\收\PAV03fix\PAV03\pav03\src\timer1.c"
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
psect	text1169
	file	"F:\项目四准备\收\PAV03fix\PAV03\pav03\src\timer1.c"
	line	60
	global	__size_of_TIMER1_ISR
	__size_of_TIMER1_ISR	equ	__end_of_TIMER1_ISR-_TIMER1_ISR
	
_TIMER1_ISR:	
	opt	stack 0
; Regs used in _TIMER1_ISR: [wreg+status,2+status,0]
	line	63
	
i1l14862:	
;timer1.c: 61: static unsigned int flag_1s_add=0;
;timer1.c: 62: static unsigned int flag_1min_add=0;
;timer1.c: 63: T1CON &= ~(0x01);
	bcf	(16)+(0/8),(0)&7	;volatile
	line	64
	
i1l14864:	
;timer1.c: 64: TMR1L = (unsigned char)(Timer1_set_time);
	movf	(_Timer1_set_time),w	;volatile
	movwf	(14)	;volatile
	line	65
;timer1.c: 65: TMR1H = (unsigned char)(Timer1_set_time>>8);
	movf	(_Timer1_set_time+1),w	;volatile
	movwf	(15)	;volatile
	line	67
	
i1l14866:	
;timer1.c: 67: flag_time_key0_add++;
	incf	(_flag_time_key0_add),f
	skipnz
	incf	(_flag_time_key0_add+1),f
	line	68
	
i1l14868:	
;timer1.c: 68: flag_time_key1_add++;
	incf	(_flag_time_key1_add),f
	skipnz
	incf	(_flag_time_key1_add+1),f
	line	69
	
i1l14870:	
;timer1.c: 69: flag_time_key2_add++;
	incf	(_flag_time_key2_add),f
	skipnz
	incf	(_flag_time_key2_add+1),f
	line	70
	
i1l14872:	
;timer1.c: 70: flag_5s_add++;
	incf	(_flag_5s_add),f
	skipnz
	incf	(_flag_5s_add+1),f
	line	71
	
i1l14874:	
;timer1.c: 72: flag_1s_add++;
	incf	(_flag_5min_add),f
	skipnz
	incf	(_flag_5min_add+1),f
	line	74
	
i1l14876:	
;timer1.c: 74: PIR1 &= ~(0x01);
	bcf	(12)+(0/8),(0)&7	;volatile
	line	75
	
i1l14878:	
;timer1.c: 75: T1CON |= 0x01;
	bsf	(16)+(0/8),(0)&7	;volatile
	line	76
	
i1l2599:	
	return
	opt stack 0
GLOBAL	__end_of_TIMER1_ISR
	__end_of_TIMER1_ISR:
;; =============== function _TIMER1_ISR ends ============

	signat	_TIMER1_ISR,88
psect	text1170,local,class=CODE,delta=2
global __ptext1170
__ptext1170:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
