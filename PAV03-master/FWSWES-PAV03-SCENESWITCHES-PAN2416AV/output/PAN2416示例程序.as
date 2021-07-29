opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	MX5325
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
	FNCALL	_main,___bmul
	FNCALL	_main,_AT24C02_Read_Msg
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
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\key_scan.c"
	line	24

;initializer for _match_channel_flag
	retlw	020h
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\recive.c"
	line	25

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
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\recive.c"
	line	10
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
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\recive.c"
	line	8
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
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\recive.c"
	line	9
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
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
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
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
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
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
	line	384
RF_Carrier@BB_cal_data:
	retlw	0Ah
	retlw	06Dh
	retlw	067h
	retlw	09Ch
	retlw	046h
	global	RF_Init@BB_cal_data
psect	strings
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
	line	62
RF_Init@BB_cal_data:
	retlw	0Ah
	retlw	06Dh
	retlw	067h
	retlw	09Ch
	retlw	046h
	global	RF_Carrier@Dem_cal2_data
psect	strings
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
	line	388
RF_Carrier@Dem_cal2_data:
	retlw	0Bh
	retlw	0DFh
	retlw	02h
	global	RF_Carrier@RF_cal_data
psect	strings
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
	line	385
RF_Carrier@RF_cal_data:
	retlw	016h
	retlw	033h
	retlw	027h
	global	RF_Init@Dem_cal2_data
psect	strings
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
	line	66
RF_Init@Dem_cal2_data:
	retlw	0Bh
	retlw	0DFh
	retlw	02h
	global	RF_Init@RF_cal_data
psect	strings
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
	line	63
RF_Init@RF_cal_data:
	retlw	016h
	retlw	033h
	retlw	027h
	global	_RX_ADDRESS_DEF
psect	strings
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
	line	7
_RX_ADDRESS_DEF:
	retlw	02Dh
	retlw	0D7h
	retlw	0B9h
	global	_TX_ADDRESS_DEF
psect	strings
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
	line	6
_TX_ADDRESS_DEF:
	retlw	0CCh
	retlw	0CCh
	retlw	0CCh
	global	RF_Carrier@Dem_cal_data
psect	strings
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
	line	387
RF_Carrier@Dem_cal_data:
	retlw	0E1h
	global	RF_Init@Dem_cal_data
psect	strings
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
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
	global	_ADC_digital_value
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
	file	"PAN2416Ê¾Àý³ÌÐò.as"
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
       ds      3

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\key_scan.c"
	line	24
_match_channel_flag:
       ds      1

psect	dataBANK0
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\recive.c"
	line	25
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
	movlw	low((__pbssBANK0)+030h)
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
	global	recive_task@flag_led
recive_task@flag_led:	; 1 bytes @ 0x14
	ds	1
	global	recive_task@match_flag
recive_task@match_flag:	; 1 bytes @ 0x15
	ds	1
	global	recive_task@msg
recive_task@msg:	; 6 bytes @ 0x16
	ds	6
	global	recive_task@i
recive_task@i:	; 1 bytes @ 0x1C
	ds	1
	global	main@i
main@i:	; 1 bytes @ 0x1D
	ds	1
;;Data sizes: Strings 0, constant 121, data 2, bss 133, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6      11
;; BANK0           80     30      80
;; BANK1           80      0      80
;; BANK3           88      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:

;; ?_I2C_ReadByte	unsigned int  size(1) Largest target is 0
;;
;; ?_UpdateCRC	unsigned short  size(1) Largest target is 0
;;
;; AT24C02_Read_Msg@data	PTR unsigned char  size(1) Largest target is 72
;;		 -> channel_flag(BANK0[3]), control_id(BANK1[72]), 
;;
;; AT24C02_Write_Msg@data	PTR unsigned char  size(1) Largest target is 6
;;		 -> recive_task@msg(BANK0[6]), channel_flag(BANK0[3]), 
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
;;   _main->___bmul
;;   _recive_task->___bmul
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
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK2
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
;; (0) _main                                                 1     1      0    9753
;;                                             29 BANK0      1     1      0
;;           _system_set_CPU_frequency
;;                      _soft_delay_ms
;;                           _IIC_Init
;;                           _key_Init
;;                            _RF_Init
;;                      _RF_Set_RxMode
;;                        _Timer1_Init
;;                       _Timer1_start
;;                             ___bmul
;;                   _AT24C02_Read_Msg
;;                   _Enable_Interrupt
;;                        _channel_set
;;                        _recive_task
;;                     _key_value_read
;;                         _delay_task
;; ---------------------------------------------------------------------------------
;; (1) _recive_task                                         13    13      0    7268
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
;;   ___bmul
;;   _AT24C02_Read_Msg
;;     _AT24C02_Read_Byte
;;       _IIC_START
;;         _iic_delay_us
;;       _I2C_SendByte
;;         _iic_delay_us
;;       _IIC_Wait_ACK
;;         _iic_delay_us
;;       _I2C_ReadByte
;;         _iic_delay_us
;;         _IIC_NACK
;;           _iic_delay_us
;;         _IIC_ACK
;;           _iic_delay_us
;;       _IIC_STOP
;;         _iic_delay_us
;;     _soft_delay_ms
;;     ___bmul (ARG)
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
;;BANK3               58      0       0       9        0.0%
;;BITBANK3            58      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               50      0       0      11        0.0%
;;BITBANK2            50      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0      50       7      100.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      B5      12        0.0%
;;ABS                  0      0      AB       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       A       2        0.0%
;;BANK0               50     1E      50       5      100.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      6       B       1       78.6%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA              40      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 53 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   29[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
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
;;		___bmul
;;		_AT24C02_Read_Msg
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
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\main.c"
	line	53
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	55
	
l16824:	
;main.c: 54: unsigned char i;
;main.c: 55: system_set_CPU_frequency(CPU_FREQUENCY_8M);
	movlw	(071h)
	fcall	_system_set_CPU_frequency
	line	56
;main.c: 56: soft_delay_ms(500);
	movlw	low(01F4h)
	movwf	(?_soft_delay_ms)
	movlw	high(01F4h)
	movwf	((?_soft_delay_ms))+1
	fcall	_soft_delay_ms
	line	57
	
l16826:	
# 57 "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\main.c"
nop ;#
psect	maintext
	line	60
	
l16828:	
;main.c: 60: TRISC = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	61
	
l16830:	
;main.c: 61: TRISB |= 0x70;
	movlw	(070h)
	iorwf	(134)^080h,f	;volatile
	line	63
	
l16832:	
;main.c: 63: RC0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	65
	
l16834:	
;main.c: 65: IIC_Init();
	fcall	_IIC_Init
	line	66
	
l16836:	
;main.c: 66: key_Init();
	fcall	_key_Init
	line	67
	
l16838:	
;main.c: 67: RF_Init();
	fcall	_RF_Init
	line	68
	
l16840:	
;main.c: 68: RF_Set_RxMode();
	fcall	_RF_Set_RxMode
	line	70
	
l16842:	
;main.c: 70: Timer1_Init(TIMER1_DIV_8);
	movlw	(030h)
	fcall	_Timer1_Init
	line	71
	
l16844:	
;main.c: 71: Timer1_start(10000, 0);
	movlw	low(02710h)
	movwf	(?_Timer1_start)
	movlw	high(02710h)
	movwf	((?_Timer1_start))+1
	clrf	0+(?_Timer1_start)+02h
	fcall	_Timer1_start
	line	74
	
l16846:	
;main.c: 74: for(i=0; i<12; i++)
	clrf	(main@i)
	
l16848:	
	movlw	(0Ch)
	subwf	(main@i),w
	skipc
	goto	u4831
	goto	u4830
u4831:
	goto	l16852
u4830:
	goto	l16858
	line	76
	
l16852:	
;main.c: 75: {
;main.c: 76: AT24C02_Read_Msg(i*6, control_id[i], 6);
	movlw	(06h)
	movwf	(?___bmul)
	movf	(main@i),w
	fcall	___bmul
	addlw	_control_id&0ffh
	movwf	(?_AT24C02_Read_Msg)
	movlw	(06h)
	movwf	0+(?_AT24C02_Read_Msg)+01h
	movlw	(06h)
	movwf	(?___bmul)
	movf	(main@i),w
	fcall	___bmul
	fcall	_AT24C02_Read_Msg
	line	74
	
l16854:	
	incf	(main@i),f
	goto	l16848
	line	79
	
l16858:	
;main.c: 77: }
;main.c: 79: AT24C02_Read_Msg(100, channel_flag, 3);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Read_Msg)
	movlw	(03h)
	movwf	0+(?_AT24C02_Read_Msg)+01h
	movlw	(064h)
	fcall	_AT24C02_Read_Msg
	line	81
	
l16860:	
;main.c: 81: for( i=0; i<12; i++ )
	clrf	(main@i)
	
l16862:	
	movlw	(0Ch)
	subwf	(main@i),w
	skipc
	goto	u4841
	goto	u4840
u4841:
	goto	l16866
u4840:
	goto	l16874
	line	83
	
l16866:	
;main.c: 82: {
;main.c: 83: if(channel_flag[i] >= 4)
	movf	(main@i),w
	addlw	_channel_flag&0ffh
	movwf	fsr0
	movlw	(04h)
	bcf	status, 7	;select IRP bank0
	subwf	indf,w
	skipc
	goto	u4851
	goto	u4850
u4851:
	goto	l16870
u4850:
	line	85
	
l16868:	
;main.c: 84: {
;main.c: 85: channel_flag[i] = 0;
	movf	(main@i),w
	addlw	_channel_flag&0ffh
	movwf	fsr0
	clrf	indf
	line	81
	
l16870:	
	incf	(main@i),f
	goto	l16862
	line	89
	
l16874:	
;main.c: 86: }
;main.c: 87: }
;main.c: 89: Enable_Interrupt();
	fcall	_Enable_Interrupt
	line	91
	
l16876:	
;main.c: 91: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l16878:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	92
	
l16880:	
;main.c: 92: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	93
	
l16882:	
;main.c: 93: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l16884:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	97
	
l16886:	
;main.c: 96: {
;main.c: 97: channel_set(0, KEY0.channel_status);
	movf	(_KEY0),w
	movwf	(?_channel_set)
	movlw	(0)
	fcall	_channel_set
	line	98
	
l16888:	
;main.c: 98: channel_set(1, KEY1.channel_status);
	movf	(_KEY1),w
	movwf	(?_channel_set)
	movlw	(01h)
	fcall	_channel_set
	line	99
	
l16890:	
;main.c: 99: channel_set(2, KEY2.channel_status);
	movf	(_KEY2),w
	movwf	(?_channel_set)
	movlw	(02h)
	fcall	_channel_set
	line	101
	
l16892:	
;main.c: 101: recive_task();
	fcall	_recive_task
	line	103
	
l16894:	
;main.c: 103: key_value_read();
	fcall	_key_value_read
	line	105
	
l16896:	
;main.c: 105: delay_task();
	fcall	_delay_task
	goto	l16886
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	107
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_recive_task
psect	text1100,local,class=CODE,delta=2
global __ptext1100
__ptext1100:

;; *************** function _recive_task *****************
;; Defined at:
;;		line 112 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\recive.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  msg             6   22[BANK0 ] unsigned char [6]
;;  i               1   28[BANK0 ] unsigned char 
;;  match_flag      1   21[BANK0 ] unsigned char 
;;  flag_led        1   20[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       9       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      13       0       0       0
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
psect	text1100
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\recive.c"
	line	112
	global	__size_of_recive_task
	__size_of_recive_task	equ	__end_of_recive_task-_recive_task
	
_recive_task:	
	opt	stack 0
; Regs used in _recive_task: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	114
	
l16380:	
;recive.c: 113: unsigned char i;
;recive.c: 114: unsigned char match_flag = 0;
	clrf	(recive_task@match_flag)
	line	115
;recive.c: 115: unsigned char flag_led = 0;
	clrf	(recive_task@flag_led)
	line	118
;recive.c: 116: unsigned char msg[6];
;recive.c: 118: switch(sys_stute)
	goto	l16822
	line	120
;recive.c: 119: {
;recive.c: 120: case 3:
	
l9828:	
	line	122
;recive.c: 121: {
;recive.c: 122: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	123
	
l16382:	
;recive.c: 123: if(key_long_flag == 0x11)
	movf	(_key_long_flag),w
	xorlw	011h
	skipz
	goto	u3981
	goto	u3980
u3981:
	goto	l16396
u3980:
	line	125
	
l16384:	
;recive.c: 124: {
;recive.c: 125: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	126
;recive.c: 126: KEY0.key_flag_5s = 0;
	clrf	0+(_KEY0)+02h
	line	127
;recive.c: 127: for(i = 0;i < 24; i++)
	clrf	(recive_task@i)
	
l16386:	
	movlw	(018h)
	subwf	(recive_task@i),w
	skipc
	goto	u3991
	goto	u3990
u3991:
	goto	l16390
u3990:
	goto	l16424
	line	129
	
l16390:	
;recive.c: 128: {
;recive.c: 129: AT24C02_Write_Byte(i, 0xff);
	movlw	(0FFh)
	movwf	(?_AT24C02_Write_Byte)
	movf	(recive_task@i),w
	fcall	_AT24C02_Write_Byte
	line	130
;recive.c: 130: soft_delay_ms(1);
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	127
	
l16392:	
	incf	(recive_task@i),f
	goto	l16386
	line	133
	
l16396:	
;recive.c: 133: else if(key_long_flag == 0x21)
	movf	(_key_long_flag),w
	xorlw	021h
	skipz
	goto	u4001
	goto	u4000
u4001:
	goto	l16410
u4000:
	line	135
	
l16398:	
;recive.c: 134: {
;recive.c: 135: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	136
;recive.c: 136: KEY1.key_flag_5s = 0;
	clrf	0+(_KEY1)+02h
	line	137
;recive.c: 137: for(i = 0; i < 24; i++)
	clrf	(recive_task@i)
	
l16400:	
	movlw	(018h)
	subwf	(recive_task@i),w
	skipc
	goto	u4011
	goto	u4010
u4011:
	goto	l16404
u4010:
	goto	l16424
	line	139
	
l16404:	
;recive.c: 138: {
;recive.c: 139: AT24C02_Write_Byte(i + 24, 0xff);
	movlw	(0FFh)
	movwf	(?_AT24C02_Write_Byte)
	movf	(recive_task@i),w
	addlw	018h
	fcall	_AT24C02_Write_Byte
	line	140
;recive.c: 140: soft_delay_ms(1);
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	137
	
l16406:	
	incf	(recive_task@i),f
	goto	l16400
	line	143
	
l16410:	
;recive.c: 143: else if(key_long_flag == 0x41)
	movf	(_key_long_flag),w
	xorlw	041h
	skipz
	goto	u4021
	goto	u4020
u4021:
	goto	l16424
u4020:
	line	145
	
l16412:	
;recive.c: 144: {
;recive.c: 145: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	146
;recive.c: 146: KEY2.key_flag_5s = 0;
	clrf	0+(_KEY2)+02h
	line	147
;recive.c: 147: for(i = 0; i < 24; i++)
	clrf	(recive_task@i)
	
l16414:	
	movlw	(018h)
	subwf	(recive_task@i),w
	skipc
	goto	u4031
	goto	u4030
u4031:
	goto	l16418
u4030:
	goto	l16424
	line	149
	
l16418:	
;recive.c: 148: {
;recive.c: 149: AT24C02_Write_Byte(i + 48, 0xff);
	movlw	(0FFh)
	movwf	(?_AT24C02_Write_Byte)
	movf	(recive_task@i),w
	addlw	030h
	fcall	_AT24C02_Write_Byte
	line	150
;recive.c: 150: soft_delay_ms(1);
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	147
	
l16420:	
	incf	(recive_task@i),f
	goto	l16414
	line	153
	
l16424:	
;recive.c: 151: }
;recive.c: 152: }
;recive.c: 153: for(i = 0; i < 12; i++)
	clrf	(recive_task@i)
	
l16426:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u4041
	goto	u4040
u4041:
	goto	l16430
u4040:
	goto	l9841
	line	155
	
l16430:	
;recive.c: 154: {
;recive.c: 155: AT24C02_Read_Msg(i * 6, control_id[i], 6);
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
	line	153
	
l16432:	
	incf	(recive_task@i),f
	goto	l16426
	
l9841:	
	line	157
;recive.c: 156: }
;recive.c: 157: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	158
	
l16436:	
;recive.c: 158: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	159
	
l16438:	
;recive.c: 159: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l16440:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	160
;recive.c: 160: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	161
	
l16442:	
;recive.c: 161: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l16444:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	162
;recive.c: 162: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	163
	
l16446:	
;recive.c: 163: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l16448:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	164
	
l16450:	
;recive.c: 164: sys_stute=1;
	clrf	(_sys_stute)
	incf	(_sys_stute),f
	line	165
;recive.c: 165: }break;
	goto	l9939
	line	167
;recive.c: 167: case 2:
	
l9843:	
	line	169
;recive.c: 168: {
;recive.c: 169: match_channel_flag |= 0x01;
	bsf	(_match_channel_flag)+(0/8),(0)&7
	line	170
	
l16452:	
;recive.c: 170: if(key_long_flag == 0x11)
	movf	(_key_long_flag),w
	xorlw	011h
	skipz
	goto	u4051
	goto	u4050
u4051:
	goto	l16458
u4050:
	line	172
	
l16454:	
;recive.c: 171: {
;recive.c: 172: KEY0.key_flag_3s = 0;
	clrf	0+(_KEY0)+01h
	line	173
;recive.c: 173: flag_5s_add = 0;
	clrf	(_flag_5s_add)
	clrf	(_flag_5s_add+1)
	line	174
;recive.c: 174: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	175
	
l16456:	
;recive.c: 175: match_channel_flag = 0x10;
	movlw	(010h)
	movwf	(_match_channel_flag)
	line	176
;recive.c: 176: }
	goto	l16470
	line	177
	
l16458:	
;recive.c: 177: else if(key_long_flag == 0x21)
	movf	(_key_long_flag),w
	xorlw	021h
	skipz
	goto	u4061
	goto	u4060
u4061:
	goto	l16464
u4060:
	line	179
	
l16460:	
;recive.c: 178: {
;recive.c: 179: KEY1.key_flag_3s = 0;
	clrf	0+(_KEY1)+01h
	line	180
;recive.c: 180: flag_5s_add = 0;
	clrf	(_flag_5s_add)
	clrf	(_flag_5s_add+1)
	line	181
;recive.c: 181: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	182
	
l16462:	
;recive.c: 182: match_channel_flag = 0x20;
	movlw	(020h)
	movwf	(_match_channel_flag)
	line	183
;recive.c: 183: }
	goto	l16470
	line	184
	
l16464:	
;recive.c: 184: else if(key_long_flag == 0x41)
	movf	(_key_long_flag),w
	xorlw	041h
	skipz
	goto	u4071
	goto	u4070
u4071:
	goto	l16470
u4070:
	line	186
	
l16466:	
;recive.c: 185: {
;recive.c: 186: KEY2.key_flag_3s = 0;
	clrf	0+(_KEY2)+01h
	line	187
;recive.c: 187: flag_5s_add = 0;
	clrf	(_flag_5s_add)
	clrf	(_flag_5s_add+1)
	line	188
;recive.c: 188: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	189
	
l16468:	
;recive.c: 189: match_channel_flag = 0x40;
	movlw	(040h)
	movwf	(_match_channel_flag)
	line	199
	
l16470:	
;recive.c: 190: }
;recive.c: 199: if(rx_data())
	fcall	_rx_data
	xorlw	0
	skipnz
	goto	u4081
	goto	u4080
u4081:
	goto	l16650
u4080:
	line	201
	
l16472:	
;recive.c: 200: {
;recive.c: 201: msg[0] = rf_buf[3];
	movf	0+(_rf_buf)+03h,w
	movwf	(recive_task@msg)
	line	202
;recive.c: 202: msg[1] = rf_buf[4];
	movf	0+(_rf_buf)+04h,w
	movwf	0+(recive_task@msg)+01h
	line	203
;recive.c: 203: msg[2] = rf_buf[5];
	movf	0+(_rf_buf)+05h,w
	movwf	0+(recive_task@msg)+02h
	line	204
;recive.c: 204: msg[3] = rf_buf[6];
	movf	0+(_rf_buf)+06h,w
	movwf	0+(recive_task@msg)+03h
	line	205
;recive.c: 205: msg[4] = rf_buf[10];
	movf	0+(_rf_buf)+0Ah,w
	movwf	0+(recive_task@msg)+04h
	line	206
;recive.c: 206: msg[5] = rf_buf[2];
	movf	0+(_rf_buf)+02h,w
	movwf	0+(recive_task@msg)+05h
	line	207
;recive.c: 207: if(msg[4] != 0xff)
	movf	0+(recive_task@msg)+04h,w
	xorlw	0FFh
	skipnz
	goto	u4091
	goto	u4090
u4091:
	goto	l9939
u4090:
	line	209
	
l16474:	
;recive.c: 208: {
;recive.c: 209: if(match_channel_flag & 0x10)
	btfss	(_match_channel_flag),(4)&7
	goto	u4101
	goto	u4100
u4101:
	goto	l9851
u4100:
	line	211
	
l16476:	
;recive.c: 210: {
;recive.c: 211: for(i = 0; i < 4; i++)
	clrf	(recive_task@i)
	
l16478:	
	movlw	(04h)
	subwf	(recive_task@i),w
	skipc
	goto	u4111
	goto	u4110
u4111:
	goto	l16482
u4110:
	goto	l16502
	line	218
	
l16482:	
;recive.c: 212: {
;recive.c: 213: if((msg[0] == control_id[i][0])
;recive.c: 214: &&(msg[1] == control_id[i][1])
;recive.c: 215: &&(msg[2] == control_id[i][2])
;recive.c: 216: &&(msg[3] == control_id[i][3])
;recive.c: 217: &&(msg[4] == control_id[i][4])
;recive.c: 218: )
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
	goto	u4121
	goto	u4120
u4121:
	goto	l16496
u4120:
	
l16484:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+01h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+01h,w
	xorwf	indf,w
	skipz
	goto	u4131
	goto	u4130
u4131:
	goto	l16496
u4130:
	
l16486:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+02h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+02h,w
	xorwf	indf,w
	skipz
	goto	u4141
	goto	u4140
u4141:
	goto	l16496
u4140:
	
l16488:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+03h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+03h,w
	xorwf	indf,w
	skipz
	goto	u4151
	goto	u4150
u4151:
	goto	l16496
u4150:
	
l16490:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+04h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+04h,w
	xorwf	indf,w
	skipz
	goto	u4161
	goto	u4160
u4161:
	goto	l16496
u4160:
	line	220
	
l16492:	
;recive.c: 219: {
;recive.c: 220: match_flag = 1;
	clrf	(recive_task@match_flag)
	incf	(recive_task@match_flag),f
	line	221
;recive.c: 221: break;
	goto	l16502
	line	225
	
l16496:	
;recive.c: 223: else
;recive.c: 224: {
;recive.c: 225: match_flag = 0;
	clrf	(recive_task@match_flag)
	line	211
	
l16498:	
	incf	(recive_task@i),f
	goto	l16478
	line	228
	
l16502:	
;recive.c: 226: }
;recive.c: 227: }
;recive.c: 228: if(match_flag == 0)
	movf	(recive_task@match_flag),f
	skipz
	goto	u4171
	goto	u4170
u4171:
	goto	l9856
u4170:
	line	230
	
l16504:	
;recive.c: 229: {
;recive.c: 230: AT24C02_Write_Msg(0 + channel_flag[0] * 6, msg, 6);
	movlw	(recive_task@msg)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	movlw	(06h)
	movwf	0+(?_AT24C02_Write_Msg)+01h
	movlw	(06h)
	movwf	(?___bmul)
	movf	(_channel_flag),w
	fcall	___bmul
	fcall	_AT24C02_Write_Msg
	line	231
	
l16506:	
;recive.c: 231: for(i = 0; i < 6; i++)
	clrf	(recive_task@i)
	
l16508:	
	movlw	(06h)
	subwf	(recive_task@i),w
	skipc
	goto	u4181
	goto	u4180
u4181:
	goto	l16512
u4180:
	goto	l16518
	line	233
	
l16512:	
;recive.c: 232: {
;recive.c: 233: control_id[channel_flag[0]][i] = msg[i];
	movf	(recive_task@i),w
	addlw	recive_task@msg&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_recive_task+0)+0
	movlw	(06h)
	movwf	(?___bmul)
	movf	(_channel_flag),w
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
	line	231
	
l16514:	
	incf	(recive_task@i),f
	goto	l16508
	line	235
	
l16518:	
;recive.c: 234: }
;recive.c: 235: channel_flag[0]++;
	incf	(_channel_flag),f
	line	236
	
l16520:	
;recive.c: 236: if(channel_flag[0] >= 4)
	movlw	(04h)
	subwf	(_channel_flag),w
	skipc
	goto	u4191
	goto	u4190
u4191:
	goto	l9856
u4190:
	line	238
	
l16522:	
;recive.c: 237: {
;recive.c: 238: channel_flag[0] = 0;
	clrf	(_channel_flag)
	line	240
	
l9856:	
	line	241
;recive.c: 239: }
;recive.c: 240: }
;recive.c: 241: key_long_flag = 0;
	clrf	(_key_long_flag)
	line	242
;recive.c: 242: }
	goto	l16620
	line	243
	
l9851:	
;recive.c: 243: else if(match_channel_flag & 0x20)
	btfss	(_match_channel_flag),(5)&7
	goto	u4201
	goto	u4200
u4201:
	goto	l9861
u4200:
	line	245
	
l16524:	
;recive.c: 244: {
;recive.c: 245: for(i = 0; i < 4; i++)
	clrf	(recive_task@i)
	
l16526:	
	movlw	(04h)
	subwf	(recive_task@i),w
	skipc
	goto	u4211
	goto	u4210
u4211:
	goto	l16530
u4210:
	goto	l16550
	line	252
	
l16530:	
;recive.c: 246: {
;recive.c: 247: if((msg[0] == control_id[i+4][0])
;recive.c: 248: &&(msg[1] == control_id[i+4][1])
;recive.c: 249: &&(msg[2] == control_id[i+4][2])
;recive.c: 250: &&(msg[3] == control_id[i+4][3])
;recive.c: 251: &&(msg[4] == control_id[i+4][4])
;recive.c: 252: )
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+018h&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	xorwf	(recive_task@msg),w
	skipz
	goto	u4221
	goto	u4220
u4221:
	goto	l16544
u4220:
	
l16532:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+019h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+01h,w
	xorwf	indf,w
	skipz
	goto	u4231
	goto	u4230
u4231:
	goto	l16544
u4230:
	
l16534:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+01Ah&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+02h,w
	xorwf	indf,w
	skipz
	goto	u4241
	goto	u4240
u4241:
	goto	l16544
u4240:
	
l16536:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+01Bh&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+03h,w
	xorwf	indf,w
	skipz
	goto	u4251
	goto	u4250
u4251:
	goto	l16544
u4250:
	
l16538:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+01Ch&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+04h,w
	xorwf	indf,w
	skipz
	goto	u4261
	goto	u4260
u4261:
	goto	l16544
u4260:
	line	254
	
l16540:	
;recive.c: 253: {
;recive.c: 254: match_flag = 1;
	clrf	(recive_task@match_flag)
	incf	(recive_task@match_flag),f
	line	255
;recive.c: 255: break;
	goto	l16550
	line	259
	
l16544:	
;recive.c: 257: else
;recive.c: 258: {
;recive.c: 259: match_flag = 0;
	clrf	(recive_task@match_flag)
	line	245
	
l16546:	
	incf	(recive_task@i),f
	goto	l16526
	line	262
	
l16550:	
;recive.c: 260: }
;recive.c: 261: }
;recive.c: 262: if(match_flag == 0)
	movf	(recive_task@match_flag),f
	skipz
	goto	u4271
	goto	u4270
u4271:
	goto	l9856
u4270:
	line	264
	
l16552:	
;recive.c: 263: {
;recive.c: 264: AT24C02_Write_Msg(24+channel_flag[1]*6,msg,6);
	movlw	(recive_task@msg)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	movlw	(06h)
	movwf	0+(?_AT24C02_Write_Msg)+01h
	movlw	(06h)
	movwf	(?___bmul)
	movf	0+(_channel_flag)+01h,w
	fcall	___bmul
	addlw	018h
	fcall	_AT24C02_Write_Msg
	line	265
	
l16554:	
;recive.c: 265: for(i = 0; i < 6; i++)
	clrf	(recive_task@i)
	
l16556:	
	movlw	(06h)
	subwf	(recive_task@i),w
	skipc
	goto	u4281
	goto	u4280
u4281:
	goto	l16560
u4280:
	goto	l16566
	line	267
	
l16560:	
;recive.c: 266: {
;recive.c: 267: control_id[channel_flag[1]+4][i] = msg[i];
	movf	(recive_task@i),w
	addlw	recive_task@msg&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_recive_task+0)+0
	movlw	(06h)
	movwf	(?___bmul)
	movf	0+(_channel_flag)+01h,w
	fcall	___bmul
	movwf	(??_recive_task+1)+0
	movlw	(_control_id+018h)&0ffh
	addwf	0+(??_recive_task+1)+0,w
	movwf	(??_recive_task+2)+0
	movf	(recive_task@i),w
	addwf	0+(??_recive_task+2)+0,w
	movwf	(??_recive_task+3)+0
	movf	0+(??_recive_task+3)+0,w
	movwf	fsr0
	movf	(??_recive_task+0)+0,w
	movwf	indf
	line	265
	
l16562:	
	incf	(recive_task@i),f
	goto	l16556
	line	269
	
l16566:	
;recive.c: 268: }
;recive.c: 269: channel_flag[1]++;
	incf	0+(_channel_flag)+01h,f
	line	270
	
l16568:	
;recive.c: 270: if(channel_flag[1] >= 4)
	movlw	(04h)
	subwf	0+(_channel_flag)+01h,w
	skipc
	goto	u4291
	goto	u4290
u4291:
	goto	l9856
u4290:
	line	272
	
l16570:	
;recive.c: 271: {
;recive.c: 272: channel_flag[1] = 0;
	clrf	0+(_channel_flag)+01h
	goto	l9856
	line	277
	
l9861:	
;recive.c: 277: else if(match_channel_flag&0x40)
	btfss	(_match_channel_flag),(6)&7
	goto	u4301
	goto	u4300
u4301:
	goto	l16620
u4300:
	line	280
	
l16572:	
;recive.c: 278: {
;recive.c: 280: for(i = 0; i < 4; i++)
	clrf	(recive_task@i)
	
l16574:	
	movlw	(04h)
	subwf	(recive_task@i),w
	skipc
	goto	u4311
	goto	u4310
u4311:
	goto	l16578
u4310:
	goto	l16598
	line	287
	
l16578:	
;recive.c: 281: {
;recive.c: 282: if((msg[0] == control_id[i+8][0])
;recive.c: 283: &&(msg[1] == control_id[i+8][1])
;recive.c: 284: &&(msg[2] == control_id[i+8][2])
;recive.c: 285: &&(msg[3] == control_id[i+8][3])
;recive.c: 286: &&(msg[4] == control_id[i+8][4])
;recive.c: 287: )
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+030h&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	xorwf	(recive_task@msg),w
	skipz
	goto	u4321
	goto	u4320
u4321:
	goto	l16592
u4320:
	
l16580:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+031h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+01h,w
	xorwf	indf,w
	skipz
	goto	u4331
	goto	u4330
u4331:
	goto	l16592
u4330:
	
l16582:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+032h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+02h,w
	xorwf	indf,w
	skipz
	goto	u4341
	goto	u4340
u4341:
	goto	l16592
u4340:
	
l16584:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+033h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+03h,w
	xorwf	indf,w
	skipz
	goto	u4351
	goto	u4350
u4351:
	goto	l16592
u4350:
	
l16586:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+034h&0ffh
	movwf	fsr0
	movf	0+(recive_task@msg)+04h,w
	xorwf	indf,w
	skipz
	goto	u4361
	goto	u4360
u4361:
	goto	l16592
u4360:
	line	289
	
l16588:	
;recive.c: 288: {
;recive.c: 289: match_flag = 1;
	clrf	(recive_task@match_flag)
	incf	(recive_task@match_flag),f
	line	290
;recive.c: 290: break;
	goto	l16598
	line	294
	
l16592:	
;recive.c: 292: else
;recive.c: 293: {
;recive.c: 294: match_flag = 0;
	clrf	(recive_task@match_flag)
	line	280
	
l16594:	
	incf	(recive_task@i),f
	goto	l16574
	line	297
	
l16598:	
;recive.c: 295: }
;recive.c: 296: }
;recive.c: 297: if(match_flag == 0)
	movf	(recive_task@match_flag),f
	skipz
	goto	u4371
	goto	u4370
u4371:
	goto	l9856
u4370:
	line	299
	
l16600:	
;recive.c: 298: {
;recive.c: 299: AT24C02_Write_Msg(48 + channel_flag[2] * 6, msg, 6);
	movlw	(recive_task@msg)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	movlw	(06h)
	movwf	0+(?_AT24C02_Write_Msg)+01h
	movlw	(06h)
	movwf	(?___bmul)
	movf	0+(_channel_flag)+02h,w
	fcall	___bmul
	addlw	030h
	fcall	_AT24C02_Write_Msg
	line	300
	
l16602:	
;recive.c: 300: for(i = 0; i < 6; i++)
	clrf	(recive_task@i)
	
l16604:	
	movlw	(06h)
	subwf	(recive_task@i),w
	skipc
	goto	u4381
	goto	u4380
u4381:
	goto	l16608
u4380:
	goto	l16614
	line	302
	
l16608:	
;recive.c: 301: {
;recive.c: 302: control_id[channel_flag[2]+8][i] = msg[i];
	movf	(recive_task@i),w
	addlw	recive_task@msg&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_recive_task+0)+0
	movlw	(06h)
	movwf	(?___bmul)
	movf	0+(_channel_flag)+02h,w
	fcall	___bmul
	movwf	(??_recive_task+1)+0
	movlw	(_control_id+030h)&0ffh
	addwf	0+(??_recive_task+1)+0,w
	movwf	(??_recive_task+2)+0
	movf	(recive_task@i),w
	addwf	0+(??_recive_task+2)+0,w
	movwf	(??_recive_task+3)+0
	movf	0+(??_recive_task+3)+0,w
	movwf	fsr0
	movf	(??_recive_task+0)+0,w
	movwf	indf
	line	300
	
l16610:	
	incf	(recive_task@i),f
	goto	l16604
	line	304
	
l16614:	
;recive.c: 303: }
;recive.c: 304: channel_flag[2]++;
	incf	0+(_channel_flag)+02h,f
	line	305
	
l16616:	
;recive.c: 305: if(channel_flag[2] >= 4)
	movlw	(04h)
	subwf	0+(_channel_flag)+02h,w
	skipc
	goto	u4391
	goto	u4390
u4391:
	goto	l9856
u4390:
	line	307
	
l16618:	
;recive.c: 306: {
;recive.c: 307: channel_flag[2] = 0;
	clrf	0+(_channel_flag)+02h
	goto	l9856
	line	313
	
l16620:	
;recive.c: 311: }
;recive.c: 313: AT24C02_Write_Msg(100, channel_flag,3);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	movlw	(03h)
	movwf	0+(?_AT24C02_Write_Msg)+01h
	movlw	(064h)
	fcall	_AT24C02_Write_Msg
	line	314
	
l16622:	
;recive.c: 314: AT24C02_Write_Msg(100, channel_flag,3);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	movlw	(03h)
	movwf	0+(?_AT24C02_Write_Msg)+01h
	movlw	(064h)
	fcall	_AT24C02_Write_Msg
	line	316
;recive.c: 316: for(i = 0; i < 12; i++)
	clrf	(recive_task@i)
	
l16624:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u4401
	goto	u4400
u4401:
	goto	l16628
u4400:
	goto	l16634
	line	318
	
l16628:	
;recive.c: 317: {
;recive.c: 318: AT24C02_Read_Msg(i * 6, control_id[i], 6);
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
	line	316
	
l16630:	
	incf	(recive_task@i),f
	goto	l16624
	line	320
	
l16634:	
;recive.c: 319: }
;recive.c: 320: AT24C02_Read_Msg(100, channel_flag, 3);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Read_Msg)
	movlw	(03h)
	movwf	0+(?_AT24C02_Read_Msg)+01h
	movlw	(064h)
	fcall	_AT24C02_Read_Msg
	line	322
	
l16636:	
;recive.c: 322: sys_stute = 1;
	clrf	(_sys_stute)
	incf	(_sys_stute),f
	line	324
	
l16638:	
;recive.c: 324: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l16640:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	325
	
l16642:	
;recive.c: 325: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	326
	
l16644:	
;recive.c: 326: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l16646:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	327
	
l16648:	
;recive.c: 327: match_channel_flag = 0;
	clrf	(_match_channel_flag)
	goto	l9939
	line	332
	
l16650:	
;recive.c: 330: else
;recive.c: 331: {
;recive.c: 332: if(flag_5s_add > 500)
	movlw	high(01F5h)
	subwf	(_flag_5s_add+1),w
	movlw	low(01F5h)
	skipnz
	subwf	(_flag_5s_add),w
	skipc
	goto	u4411
	goto	u4410
u4411:
	goto	l9939
u4410:
	line	334
	
l16652:	
;recive.c: 333: {
;recive.c: 334: sys_stute = 1;
	clrf	(_sys_stute)
	incf	(_sys_stute),f
	goto	l16648
	line	341
	
l16656:	
;recive.c: 340: {
;recive.c: 341: if(rx_data())
	fcall	_rx_data
	xorlw	0
	skipnz
	goto	u4421
	goto	u4420
u4421:
	goto	l9939
u4420:
	line	343
	
l16658:	
;recive.c: 342: {
;recive.c: 343: rf_buf[2] = ~rf_buf[2];
	movlw	(0FFh)
	xorwf	0+(_rf_buf)+02h,f
	line	344
	
l16660:	
;recive.c: 344: if(rf_buf[10] != 0xff)
	movf	0+(_rf_buf)+0Ah,w
	xorlw	0FFh
	skipnz
	goto	u4431
	goto	u4430
u4431:
	goto	l16740
u4430:
	line	346
	
l16662:	
;recive.c: 345: {
;recive.c: 346: for(i=0; i<12; i++)
	clrf	(recive_task@i)
	
l16664:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u4441
	goto	u4440
u4441:
	goto	l16668
u4440:
	goto	l16818
	line	351
	
l16668:	
;recive.c: 347: {
;recive.c: 348: if((rf_buf[3] == control_id[i][0])
;recive.c: 349: &&(rf_buf[4] == control_id[i][1])
;recive.c: 350: &&(rf_buf[5] == control_id[i][2])
;recive.c: 351: &&(rf_buf[6] == control_id[i][3]))
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
	goto	u4451
	goto	u4450
u4451:
	goto	l16736
u4450:
	
l16670:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+01h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+04h,w
	xorwf	indf,w
	skipz
	goto	u4461
	goto	u4460
u4461:
	goto	l16736
u4460:
	
l16672:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+02h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+05h,w
	xorwf	indf,w
	skipz
	goto	u4471
	goto	u4470
u4471:
	goto	l16736
u4470:
	
l16674:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+03h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+06h,w
	xorwf	indf,w
	skipz
	goto	u4481
	goto	u4480
u4481:
	goto	l16736
u4480:
	line	353
	
l16676:	
;recive.c: 352: {
;recive.c: 353: if(rf_buf[2] != control_id[i][5])
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	xorwf	indf,w
	skipnz
	goto	u4491
	goto	u4490
u4491:
	goto	l16736
u4490:
	line	355
	
l16678:	
;recive.c: 354: {
;recive.c: 355: control_id[i][5] = rf_buf[2];
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	movwf	indf
	line	356
;recive.c: 356: if(rf_buf[10] == control_id[i][4])
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+04h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+0Ah,w
	xorwf	indf,w
	skipz
	goto	u4501
	goto	u4500
u4501:
	goto	l16736
u4500:
	line	358
	
l16680:	
;recive.c: 357: {
;recive.c: 358: if(flag_led == 0)
	movf	(recive_task@flag_led),f
	skipz
	goto	u4511
	goto	u4510
u4511:
	goto	l16690
u4510:
	line	360
	
l16682:	
;recive.c: 359: {
;recive.c: 360: flag_led = 1;
	clrf	(recive_task@flag_led)
	incf	(recive_task@flag_led),f
	line	361
;recive.c: 361: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	362
	
l16684:	
;recive.c: 362: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	363
	
l16686:	
;recive.c: 363: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l16688:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	366
	
l16690:	
;recive.c: 364: }
;recive.c: 366: if(rf_buf[11] == 0)
	movf	0+(_rf_buf)+0Bh,f
	skipz
	goto	u4521
	goto	u4520
u4521:
	goto	l16720
u4520:
	line	368
	
l16692:	
;recive.c: 367: {
;recive.c: 368: if(i < 4)
	movlw	(04h)
	subwf	(recive_task@i),w
	skipnc
	goto	u4531
	goto	u4530
u4531:
	goto	l16702
u4530:
	line	370
	
l16694:	
;recive.c: 369: {
;recive.c: 370: if((KEY0_FLAG == 0))
	movf	(_KEY0_FLAG),f
	skipz
	goto	u4541
	goto	u4540
u4541:
	goto	l16736
u4540:
	line	372
	
l16696:	
;recive.c: 371: {
;recive.c: 372: if(rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u4551
	goto	u4550
u4551:
	goto	l16700
u4550:
	line	373
	
l16698:	
;recive.c: 373: KEY0.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY0),f
	goto	l16736
	line	375
	
l16700:	
;recive.c: 374: else
;recive.c: 375: KEY0.channel_status = rf_buf[9]; }
	movf	0+(_rf_buf)+09h,w
	movwf	(_KEY0)
	goto	l16736
	line	377
	
l16702:	
;recive.c: 377: else if(i < 8)
	movlw	(08h)
	subwf	(recive_task@i),w
	skipnc
	goto	u4561
	goto	u4560
u4561:
	goto	l16712
u4560:
	line	379
	
l16704:	
;recive.c: 378: {
;recive.c: 379: if((KEY1_FLAG == 0))
	movf	(_KEY1_FLAG),f
	skipz
	goto	u4571
	goto	u4570
u4571:
	goto	l16736
u4570:
	line	381
	
l16706:	
;recive.c: 380: {
;recive.c: 381: if(rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u4581
	goto	u4580
u4581:
	goto	l16710
u4580:
	line	382
	
l16708:	
;recive.c: 382: KEY1.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY1),f
	goto	l16736
	line	384
	
l16710:	
;recive.c: 383: else
;recive.c: 384: KEY1.channel_status = rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	(_KEY1)
	goto	l16736
	line	390
	
l16712:	
;recive.c: 388: else
;recive.c: 389: {
;recive.c: 390: if((KEY2_FLAG == 0))
	movf	(_KEY2_FLAG),f
	skipz
	goto	u4591
	goto	u4590
u4591:
	goto	l9907
u4590:
	line	392
	
l16714:	
;recive.c: 391: {
;recive.c: 392: if(rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u4601
	goto	u4600
u4601:
	goto	l16718
u4600:
	line	393
	
l16716:	
;recive.c: 393: KEY2.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY2),f
	goto	l16736
	line	395
	
l16718:	
;recive.c: 394: else
;recive.c: 395: KEY2.channel_status = rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	(_KEY2)
	goto	l16736
	line	401
	
l16720:	
;recive.c: 399: else
;recive.c: 400: {
;recive.c: 401: flag_5min_add = 0;
	clrf	(_flag_5min_add)
	clrf	(_flag_5min_add+1)
	line	402
	
l16722:	
;recive.c: 402: if(delay_flag == 1)
	decf	(_delay_flag),w
	skipz
	goto	u4611
	goto	u4610
u4611:
	goto	l16726
u4610:
	line	404
	
l16724:	
;recive.c: 403: {
;recive.c: 404: channel_delay[0] = 0;
	clrf	(_channel_delay)
	line	405
;recive.c: 405: delay_flag = 0;
	clrf	(_delay_flag)
	line	407
	
l16726:	
;recive.c: 406: }
;recive.c: 407: if(i < 4)
	movlw	(04h)
	subwf	(recive_task@i),w
	skipnc
	goto	u4621
	goto	u4620
u4621:
	goto	l16730
u4620:
	line	409
	
l16728:	
;recive.c: 408: {
;recive.c: 409: channel_delay[0] |= 0x01;
	bsf	(_channel_delay)+(0/8),(0)&7
	line	410
;recive.c: 410: }
	goto	l16734
	line	411
	
l16730:	
;recive.c: 411: else if(i < 8)
	movlw	(08h)
	subwf	(recive_task@i),w
	skipnc
	goto	u4631
	goto	u4630
u4631:
	goto	l9911
u4630:
	line	413
	
l16732:	
;recive.c: 412: {
;recive.c: 413: channel_delay[0] |= 0x02;
	bsf	(_channel_delay)+(1/8),(1)&7
	line	414
;recive.c: 414: }
	goto	l16734
	line	415
	
l9911:	
	line	417
;recive.c: 415: else
;recive.c: 416: {
;recive.c: 417: channel_delay[0] |= 0x04;
	bsf	(_channel_delay)+(2/8),(2)&7
	line	419
	
l16734:	
;recive.c: 418: }
;recive.c: 419: channel_delay[1] = rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	0+(_channel_delay)+01h
	line	420
;recive.c: 420: channel_delay[2] = rf_buf[11];
	movf	0+(_rf_buf)+0Bh,w
	movwf	0+(_channel_delay)+02h
	goto	l16736
	line	421
	
l9907:	
	line	346
	
l16736:	
	incf	(recive_task@i),f
	goto	l16664
	line	432
	
l16740:	
;recive.c: 428: else
;recive.c: 429: {
;recive.c: 431: {
;recive.c: 432: for(i = 0; i < 12; i++)
	clrf	(recive_task@i)
	
l16742:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u4641
	goto	u4640
u4641:
	goto	l16746
u4640:
	goto	l16818
	line	437
	
l16746:	
;recive.c: 433: {
;recive.c: 434: if((rf_buf[3] == control_id[i][0])
;recive.c: 435: &&(rf_buf[4] == control_id[i][1])
;recive.c: 436: &&(rf_buf[5] == control_id[i][2])
;recive.c: 437: &&(rf_buf[6] == control_id[i][3]))
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
	goto	u4651
	goto	u4650
u4651:
	goto	l16814
u4650:
	
l16748:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+01h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+04h,w
	xorwf	indf,w
	skipz
	goto	u4661
	goto	u4660
u4661:
	goto	l16814
u4660:
	
l16750:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+02h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+05h,w
	xorwf	indf,w
	skipz
	goto	u4671
	goto	u4670
u4671:
	goto	l16814
u4670:
	
l16752:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+03h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+06h,w
	xorwf	indf,w
	skipz
	goto	u4681
	goto	u4680
u4681:
	goto	l16814
u4680:
	line	439
	
l16754:	
;recive.c: 438: {
;recive.c: 439: if((rf_buf[2] != control_id[i][5]))
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	xorwf	indf,w
	skipnz
	goto	u4691
	goto	u4690
u4691:
	goto	l16814
u4690:
	line	441
	
l16756:	
;recive.c: 440: {
;recive.c: 441: control_id[i][5] = rf_buf[2];
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	movwf	indf
	line	442
	
l16758:	
;recive.c: 442: if(flag_led == 0)
	movf	(recive_task@flag_led),f
	skipz
	goto	u4701
	goto	u4700
u4701:
	goto	l16768
u4700:
	line	444
	
l16760:	
;recive.c: 443: {
;recive.c: 444: flag_led = 1;
	clrf	(recive_task@flag_led)
	incf	(recive_task@flag_led),f
	line	445
;recive.c: 445: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	446
	
l16762:	
;recive.c: 446: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	447
	
l16764:	
;recive.c: 447: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l16766:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	449
	
l16768:	
;recive.c: 448: }
;recive.c: 449: if((rf_buf[11] == 0))
	movf	0+(_rf_buf)+0Bh,f
	skipz
	goto	u4711
	goto	u4710
u4711:
	goto	l16798
u4710:
	line	451
	
l16770:	
;recive.c: 450: {
;recive.c: 451: if(i < 4)
	movlw	(04h)
	subwf	(recive_task@i),w
	skipnc
	goto	u4721
	goto	u4720
u4721:
	goto	l16780
u4720:
	line	453
	
l16772:	
;recive.c: 452: {
;recive.c: 453: if((KEY0_FLAG == 0))
	movf	(_KEY0_FLAG),f
	skipz
	goto	u4731
	goto	u4730
u4731:
	goto	l16814
u4730:
	line	455
	
l16774:	
;recive.c: 454: {
;recive.c: 455: if(rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u4741
	goto	u4740
u4741:
	goto	l16778
u4740:
	line	456
	
l16776:	
;recive.c: 456: KEY0.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY0),f
	goto	l16814
	line	458
	
l16778:	
;recive.c: 457: else
;recive.c: 458: KEY0.channel_status = rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	(_KEY0)
	goto	l16814
	line	461
	
l16780:	
;recive.c: 461: else if(i < 8)
	movlw	(08h)
	subwf	(recive_task@i),w
	skipnc
	goto	u4751
	goto	u4750
u4751:
	goto	l16790
u4750:
	line	463
	
l16782:	
;recive.c: 462: {
;recive.c: 463: if((KEY1_FLAG == 0))
	movf	(_KEY1_FLAG),f
	skipz
	goto	u4761
	goto	u4760
u4761:
	goto	l16814
u4760:
	line	465
	
l16784:	
;recive.c: 464: {
;recive.c: 465: if(rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u4771
	goto	u4770
u4771:
	goto	l16788
u4770:
	line	466
	
l16786:	
;recive.c: 466: KEY1.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY1),f
	goto	l16814
	line	468
	
l16788:	
;recive.c: 467: else
;recive.c: 468: KEY1.channel_status = rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	(_KEY1)
	goto	l16814
	line	473
	
l16790:	
;recive.c: 471: else
;recive.c: 472: {
;recive.c: 473: if((KEY2_FLAG == 0))
	movf	(_KEY2_FLAG),f
	skipz
	goto	u4781
	goto	u4780
u4781:
	goto	l9933
u4780:
	line	475
	
l16792:	
;recive.c: 474: {
;recive.c: 475: if(rf_buf[9] == 2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u4791
	goto	u4790
u4791:
	goto	l16796
u4790:
	line	476
	
l16794:	
;recive.c: 476: KEY2.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY2),f
	goto	l16814
	line	478
	
l16796:	
;recive.c: 477: else
;recive.c: 478: KEY2.channel_status = rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	(_KEY2)
	goto	l16814
	line	484
	
l16798:	
;recive.c: 482: else
;recive.c: 483: {
;recive.c: 484: flag_5min_add = 0;
	clrf	(_flag_5min_add)
	clrf	(_flag_5min_add+1)
	line	485
	
l16800:	
;recive.c: 485: if(delay_flag == 1)
	decf	(_delay_flag),w
	skipz
	goto	u4801
	goto	u4800
u4801:
	goto	l16804
u4800:
	line	487
	
l16802:	
;recive.c: 486: {
;recive.c: 487: channel_delay[0] = 0;
	clrf	(_channel_delay)
	line	488
;recive.c: 488: delay_flag = 0;
	clrf	(_delay_flag)
	line	490
	
l16804:	
;recive.c: 489: }
;recive.c: 490: if(i < 4)
	movlw	(04h)
	subwf	(recive_task@i),w
	skipnc
	goto	u4811
	goto	u4810
u4811:
	goto	l16808
u4810:
	line	492
	
l16806:	
;recive.c: 491: {
;recive.c: 492: channel_delay[0] |= 0x01;
	bsf	(_channel_delay)+(0/8),(0)&7
	line	493
;recive.c: 493: }
	goto	l16812
	line	494
	
l16808:	
;recive.c: 494: else if(i<8)
	movlw	(08h)
	subwf	(recive_task@i),w
	skipnc
	goto	u4821
	goto	u4820
u4821:
	goto	l9937
u4820:
	line	496
	
l16810:	
;recive.c: 495: {
;recive.c: 496: channel_delay[0] |= 0x02;
	bsf	(_channel_delay)+(1/8),(1)&7
	line	497
;recive.c: 497: }
	goto	l16812
	line	498
	
l9937:	
	line	500
;recive.c: 498: else
;recive.c: 499: {
;recive.c: 500: channel_delay[0] |= 0x04;
	bsf	(_channel_delay)+(2/8),(2)&7
	line	502
	
l16812:	
;recive.c: 501: }
;recive.c: 502: channel_delay[1] = rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	0+(_channel_delay)+01h
	line	503
;recive.c: 503: channel_delay[2] = rf_buf[11];
	movf	0+(_rf_buf)+0Bh,w
	movwf	0+(_channel_delay)+02h
	goto	l16814
	line	504
	
l9933:	
	line	432
	
l16814:	
	incf	(recive_task@i),f
	goto	l16742
	line	514
	
l16818:	
;recive.c: 504: }
;recive.c: 506: }
;recive.c: 507: }
;recive.c: 508: }
;recive.c: 509: }
;recive.c: 512: }
;recive.c: 514: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	515
;recive.c: 515: RF_ClearFIFO();
	fcall	_RF_ClearFIFO
	line	516
;recive.c: 516: RF_ClearStatus();
	fcall	_RF_ClearStatus
	goto	l9939
	line	118
	
l16822:	
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
	goto	l16656
	xorlw	2^1	; case 2
	skipnz
	goto	l9843
	xorlw	3^2	; case 3
	skipnz
	goto	l9828
	goto	l9939
	opt asmopt_on

	line	522
	
l9939:	
	return
	opt stack 0
GLOBAL	__end_of_recive_task
	__end_of_recive_task:
;; =============== function _recive_task ends ============

	signat	_recive_task,88
	global	_rx_data
psect	text1101,local,class=CODE,delta=2
global __ptext1101
__ptext1101:

;; *************** function _rx_data *****************
;; Defined at:
;;		line 69 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\recive.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       5       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       8       0       0       0
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
psect	text1101
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\recive.c"
	line	69
	global	__size_of_rx_data
	__size_of_rx_data	equ	__end_of_rx_data-_rx_data
	
_rx_data:	
;; using string table level
	opt	stack 1
; Regs used in _rx_data: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	70
	
l16314:	
;recive.c: 70: unsigned char rx_flag = 0;
	clrf	(rx_data@rx_flag)
	line	72
;recive.c: 72: unsigned char i = 0;
	clrf	(rx_data@i)
	line	73
;recive.c: 73: unsigned int crc16 = 0;
	clrf	(rx_data@crc16)
	clrf	(rx_data@crc16+1)
	line	75
	
l16316:	
;recive.c: 75: if(RF_RxData(rf_buf,18))
	movlw	(012h)
	movwf	(?_RF_RxData)
	movlw	(_rf_buf)&0ffh
	fcall	_RF_RxData
	xorlw	0
	skipnz
	goto	u3851
	goto	u3850
u3851:
	goto	l16376
u3850:
	line	77
	
l16318:	
;recive.c: 76: {
;recive.c: 77: for(i = 0; i < 18; i++)
	clrf	(rx_data@i)
	line	79
	
l16324:	
;recive.c: 78: {
;recive.c: 79: rf_buf[i] = rf_buf[i] ^ crc_2_4G_lib[3+i] ^ ble_crc_38[21+i];
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
	line	77
	
l16326:	
	incf	(rx_data@i),f
	
l16328:	
	movlw	(012h)
	subwf	(rx_data@i),w
	skipc
	goto	u3861
	goto	u3860
u3861:
	goto	l16324
u3860:
	line	81
	
l16330:	
;recive.c: 80: }
;recive.c: 81: crc16 = rf_buf[16] + rf_buf[17] * 256;
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
	line	82
	
l16332:	
;recive.c: 82: for(i = 0; i < 16; i++)
	clrf	(rx_data@i)
	line	84
	
l16338:	
;recive.c: 83: {
;recive.c: 84: rf_buf[i] = rf_buf[i] ^ crc_lab[i];
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
	line	82
	
l16340:	
	incf	(rx_data@i),f
	
l16342:	
	movlw	(010h)
	subwf	(rx_data@i),w
	skipc
	goto	u3871
	goto	u3870
u3871:
	goto	l16338
u3870:
	line	86
	
l16344:	
;recive.c: 85: }
;recive.c: 86: rand = rf_buf[15];
	movf	0+(_rf_buf)+0Fh,w
	movwf	(rx_data@rand)
	line	87
;recive.c: 87: for(i = 7; i < 15; i++)
	movlw	(07h)
	movwf	(rx_data@i)
	line	89
	
l16348:	
;recive.c: 88: {
;recive.c: 89: rf_buf[i] ^= rand;
	movf	(rx_data@i),w
	addlw	_rf_buf&0ffh
	movwf	fsr0
	movf	(rx_data@rand),w
	xorwf	indf,f
	line	87
	
l16350:	
	incf	(rx_data@i),f
	
l16352:	
	movlw	(0Fh)
	subwf	(rx_data@i),w
	skipc
	goto	u3881
	goto	u3880
u3881:
	goto	l16348
u3880:
	line	91
	
l16354:	
;recive.c: 90: }
;recive.c: 91: if(crc16 == UpdateCRC(rf_buf,16) )
	movlw	010h
	movwf	(?_UpdateCRC)
	clrf	(?_UpdateCRC+1)
	movlw	(_rf_buf)&0ffh
	fcall	_UpdateCRC
	movf	(rx_data@crc16+1),w
	xorwf	(1+(?_UpdateCRC)),w
	skipz
	goto	u3895
	movf	(rx_data@crc16),w
	xorwf	(0+(?_UpdateCRC)),w
u3895:

	skipz
	goto	u3891
	goto	u3890
u3891:
	goto	l16376
u3890:
	line	93
	
l16356:	
;recive.c: 92: {
;recive.c: 93: if((rf_buf[3] == 0) && (rf_buf[4] == 0) && (rf_buf[5] == 0) && (rf_buf[6] == 0))
	movf	0+(_rf_buf)+03h,f
	skipz
	goto	u3901
	goto	u3900
u3901:
	goto	l16366
u3900:
	
l16358:	
	movf	0+(_rf_buf)+04h,f
	skipz
	goto	u3911
	goto	u3910
u3911:
	goto	l16366
u3910:
	
l16360:	
	movf	0+(_rf_buf)+05h,f
	skipz
	goto	u3921
	goto	u3920
u3921:
	goto	l16366
u3920:
	
l16362:	
	movf	0+(_rf_buf)+06h,f
	skipz
	goto	u3931
	goto	u3930
u3931:
	goto	l16366
u3930:
	line	95
	
l16364:	
;recive.c: 94: {
;recive.c: 95: rx_flag=0;
	clrf	(rx_data@rx_flag)
	line	96
;recive.c: 96: }
	goto	l16376
	line	97
	
l16366:	
;recive.c: 97: else if((rf_buf[3] == 0xff) && (rf_buf[4] == 0xff) && (rf_buf[5] == 0xff) && (rf_buf[6] == 0xff))
	movf	0+(_rf_buf)+03h,w
	xorlw	0FFh
	skipz
	goto	u3941
	goto	u3940
u3941:
	goto	l9822
u3940:
	
l16368:	
	movf	0+(_rf_buf)+04h,w
	xorlw	0FFh
	skipz
	goto	u3951
	goto	u3950
u3951:
	goto	l9822
u3950:
	
l16370:	
	movf	0+(_rf_buf)+05h,w
	xorlw	0FFh
	skipz
	goto	u3961
	goto	u3960
u3961:
	goto	l9822
u3960:
	
l16372:	
	movf	0+(_rf_buf)+06h,w
	xorlw	0FFh
	skipz
	goto	u3971
	goto	u3970
u3971:
	goto	l9822
u3970:
	goto	l16364
	line	101
	
l9822:	
	line	102
;recive.c: 101: else
;recive.c: 102: rx_flag = 1;
	clrf	(rx_data@rx_flag)
	incf	(rx_data@rx_flag),f
	line	106
	
l16376:	
;recive.c: 103: }
;recive.c: 105: }
;recive.c: 106: return rx_flag;
	movf	(rx_data@rx_flag),w
	line	107
	
l9824:	
	return
	opt stack 0
GLOBAL	__end_of_rx_data
	__end_of_rx_data:
;; =============== function _rx_data ends ============

	signat	_rx_data,89
	global	_AT24C02_Read_Msg
psect	text1102,local,class=CODE,delta=2
global __ptext1102
__ptext1102:

;; *************** function _AT24C02_Read_Msg *****************
;; Defined at:
;;		line 53 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\e2prom.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;;  data            1    6[BANK0 ] PTR unsigned char 
;;		 -> channel_flag(3), control_id(72), 
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_AT24C02_Read_Byte
;;		_soft_delay_ms
;; This function is called by:
;;		_main
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1102
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\e2prom.c"
	line	53
	global	__size_of_AT24C02_Read_Msg
	__size_of_AT24C02_Read_Msg	equ	__end_of_AT24C02_Read_Msg-_AT24C02_Read_Msg
	
_AT24C02_Read_Msg:	
	opt	stack 0
; Regs used in _AT24C02_Read_Msg: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;AT24C02_Read_Msg@addr stored from wreg
	movwf	(AT24C02_Read_Msg@addr)
	line	54
	
l16302:	
;e2prom.c: 54: unsigned char i=0;
	clrf	(AT24C02_Read_Msg@i)
	line	55
;e2prom.c: 55: for(i=0;i<len;i++)
	clrf	(AT24C02_Read_Msg@i)
	goto	l16312
	line	57
	
l16304:	
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
	
l16306:	
;e2prom.c: 58: addr++;
	incf	(AT24C02_Read_Msg@addr),f
	line	59
	
l16308:	
;e2prom.c: 59: soft_delay_ms(1);
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	55
	
l16310:	
	incf	(AT24C02_Read_Msg@i),f
	
l16312:	
	movf	(AT24C02_Read_Msg@len),w
	subwf	(AT24C02_Read_Msg@i),w
	skipc
	goto	u3841
	goto	u3840
u3841:
	goto	l16304
u3840:
	line	61
	
l11295:	
	return
	opt stack 0
GLOBAL	__end_of_AT24C02_Read_Msg
	__end_of_AT24C02_Read_Msg:
;; =============== function _AT24C02_Read_Msg ends ============

	signat	_AT24C02_Read_Msg,12408
	global	_AT24C02_Read_Byte
psect	text1103,local,class=CODE,delta=2
global __ptext1103
__ptext1103:

;; *************** function _AT24C02_Read_Byte *****************
;; Defined at:
;;		line 21 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\e2prom.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
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
psect	text1103
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\e2prom.c"
	line	21
	global	__size_of_AT24C02_Read_Byte
	__size_of_AT24C02_Read_Byte	equ	__end_of_AT24C02_Read_Byte-_AT24C02_Read_Byte
	
_AT24C02_Read_Byte:	
	opt	stack 0
; Regs used in _AT24C02_Read_Byte: [wreg+status,2+status,0+pclath+cstack]
;AT24C02_Read_Byte@addr stored from wreg
	movwf	(AT24C02_Read_Byte@addr)
	line	22
	
l15450:	
	line	23
	
l15452:	
;e2prom.c: 23: IIC_START();
	fcall	_IIC_START
	line	25
	
l15454:	
;e2prom.c: 25: I2C_SendByte(0XA0);
	movlw	(0A0h)
	fcall	_I2C_SendByte
	line	26
	
l15456:	
;e2prom.c: 26: IIC_Wait_ACK();
	fcall	_IIC_Wait_ACK
	line	27
	
l15458:	
;e2prom.c: 27: I2C_SendByte(addr);
	movf	(AT24C02_Read_Byte@addr),w
	fcall	_I2C_SendByte
	line	28
	
l15460:	
;e2prom.c: 28: IIC_Wait_ACK();
	fcall	_IIC_Wait_ACK
	line	31
	
l15462:	
;e2prom.c: 31: IIC_START();
	fcall	_IIC_START
	line	32
	
l15464:	
;e2prom.c: 32: I2C_SendByte(0XA1);
	movlw	(0A1h)
	fcall	_I2C_SendByte
	line	33
	
l15466:	
;e2prom.c: 33: IIC_Wait_ACK();
	fcall	_IIC_Wait_ACK
	line	34
	
l15468:	
;e2prom.c: 34: temp = I2C_ReadByte(1);
	movlw	(01h)
	fcall	_I2C_ReadByte
	movf	(0+(?_I2C_ReadByte)),w
	movwf	(AT24C02_Read_Byte@temp)
	line	35
	
l15470:	
;e2prom.c: 35: IIC_STOP();
	fcall	_IIC_STOP
	line	37
	
l15472:	
;e2prom.c: 37: return temp;
	movf	(AT24C02_Read_Byte@temp),w
	line	38
	
l11283:	
	return
	opt stack 0
GLOBAL	__end_of_AT24C02_Read_Byte
	__end_of_AT24C02_Read_Byte:
;; =============== function _AT24C02_Read_Byte ends ============

	signat	_AT24C02_Read_Byte,4217
	global	_AT24C02_Write_Msg
psect	text1104,local,class=CODE,delta=2
global __ptext1104
__ptext1104:

;; *************** function _AT24C02_Write_Msg *****************
;; Defined at:
;;		line 41 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\e2prom.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;;  data            1    4[BANK0 ] PTR unsigned char 
;;		 -> recive_task@msg(6), channel_flag(3), 
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       5       0       0       0
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
psect	text1104
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\e2prom.c"
	line	41
	global	__size_of_AT24C02_Write_Msg
	__size_of_AT24C02_Write_Msg	equ	__end_of_AT24C02_Write_Msg-_AT24C02_Write_Msg
	
_AT24C02_Write_Msg:	
	opt	stack 1
; Regs used in _AT24C02_Write_Msg: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;AT24C02_Write_Msg@addr stored from wreg
	movwf	(AT24C02_Write_Msg@addr)
	line	42
	
l16290:	
;e2prom.c: 42: unsigned char i=0;
	clrf	(AT24C02_Write_Msg@i)
	line	43
;e2prom.c: 43: for(i=0;i<len;i++)
	clrf	(AT24C02_Write_Msg@i)
	goto	l16300
	line	45
	
l16292:	
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
	
l16294:	
;e2prom.c: 46: addr++;
	incf	(AT24C02_Write_Msg@addr),f
	line	47
	
l16296:	
;e2prom.c: 47: soft_delay_ms(5);
	movlw	05h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	43
	
l16298:	
	incf	(AT24C02_Write_Msg@i),f
	
l16300:	
	movf	(AT24C02_Write_Msg@len),w
	subwf	(AT24C02_Write_Msg@i),w
	skipc
	goto	u3831
	goto	u3830
u3831:
	goto	l16292
u3830:
	line	49
	
l11289:	
	return
	opt stack 0
GLOBAL	__end_of_AT24C02_Write_Msg
	__end_of_AT24C02_Write_Msg:
;; =============== function _AT24C02_Write_Msg ends ============

	signat	_AT24C02_Write_Msg,12408
	global	_RF_RxData
psect	text1105,local,class=CODE,delta=2
global __ptext1105
__ptext1105:

;; *************** function _RF_RxData *****************
;; Defined at:
;;		line 134 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       1       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       3       0       0       0
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
psect	text1105
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
	line	134
	global	__size_of_RF_RxData
	__size_of_RF_RxData	equ	__end_of_RF_RxData-_RF_RxData
	
_RF_RxData:	
	opt	stack 0
; Regs used in _RF_RxData: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_RxData@payload_buff stored from wreg
	movwf	(RF_RxData@payload_buff)
	line	135
	
l16274:	
;rf297L.c: 135: if(!(RF_GetStatus() & 0X40))
	fcall	_RF_GetStatus
	movwf	(??_RF_RxData+0)+0
	btfsc	0+(??_RF_RxData+0)+0,(6)&7
	goto	u3821
	goto	u3820
u3821:
	goto	l16280
u3820:
	line	137
	
l16276:	
;rf297L.c: 136: {
;rf297L.c: 137: return 0;
	movlw	(0)
	goto	l5164
	line	139
	
l16280:	
;rf297L.c: 138: }
;rf297L.c: 139: RF_Read_Buff(0x61, payload_buff, length);
	movf	(RF_RxData@payload_buff),w
	movwf	(?_RF_Read_Buff)
	movf	(RF_RxData@length),w
	movwf	0+(?_RF_Read_Buff)+01h
	movlw	(061h)
	fcall	_RF_Read_Buff
	line	141
	
l16282:	
;rf297L.c: 141: RF_ClearFIFO();
	fcall	_RF_ClearFIFO
	line	142
	
l16284:	
;rf297L.c: 142: RF_ClearStatus();
	fcall	_RF_ClearStatus
	line	143
	
l16286:	
;rf297L.c: 143: return 1;
	movlw	(01h)
	line	144
	
l5164:	
	return
	opt stack 0
GLOBAL	__end_of_RF_RxData
	__end_of_RF_RxData:
;; =============== function _RF_RxData ends ============

	signat	_RF_RxData,8313
	global	_I2C_ReadByte
psect	text1106,local,class=CODE,delta=2
global __ptext1106
__ptext1106:

;; *************** function _I2C_ReadByte *****************
;; Defined at:
;;		line 117 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\iic.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       4       0       0       0
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
psect	text1106
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\iic.c"
	line	117
	global	__size_of_I2C_ReadByte
	__size_of_I2C_ReadByte	equ	__end_of_I2C_ReadByte-_I2C_ReadByte
	
_I2C_ReadByte:	
	opt	stack 0
; Regs used in _I2C_ReadByte: [wreg+status,2+status,0+pclath+cstack]
;I2C_ReadByte@ack stored from wreg
	line	120
	movwf	(I2C_ReadByte@ack)
	
l15388:	
;iic.c: 118: unsigned char cnt;
;iic.c: 119: unsigned int data;
;iic.c: 120: {TRISC1=1,WPUC1=1;};
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1081/8)^080h,(1081)&7
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3193/8)^0180h,(3193)&7
	line	122
	
l15390:	
;iic.c: 122: for(cnt=0; cnt<8; cnt++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(I2C_ReadByte@cnt)
	line	123
	
l10640:	
	line	124
;iic.c: 123: {
;iic.c: 124: RC2=0;
	bcf	(58/8),(58)&7
	line	125
	
l15396:	
;iic.c: 125: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	127
	
l15398:	
;iic.c: 127: RC2=1;
	bsf	(58/8),(58)&7
	line	128
	
l15400:	
;iic.c: 128: data <<= 1;
	clrc
	rlf	(I2C_ReadByte@data),f
	rlf	(I2C_ReadByte@data+1),f
	line	129
	
l15402:	
;iic.c: 129: if(RC1)
	btfss	(57/8),(57)&7
	goto	u2701
	goto	u2700
u2701:
	goto	l15406
u2700:
	line	131
	
l15404:	
;iic.c: 130: {
;iic.c: 131: data |= 0x01;
	bsf	(I2C_ReadByte@data)+(0/8),(0)&7
	line	133
	
l15406:	
;iic.c: 132: }
;iic.c: 133: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	122
	
l15408:	
	incf	(I2C_ReadByte@cnt),f
	
l15410:	
	movlw	(08h)
	subwf	(I2C_ReadByte@cnt),w
	skipc
	goto	u2711
	goto	u2710
u2711:
	goto	l10640
u2710:
	line	135
	
l15412:	
;iic.c: 134: }
;iic.c: 135: if(ack == 0)
	movf	(I2C_ReadByte@ack),f
	skipz
	goto	u2721
	goto	u2720
u2721:
	goto	l15416
u2720:
	line	137
	
l15414:	
;iic.c: 136: {
;iic.c: 137: IIC_NACK();
	fcall	_IIC_NACK
	line	138
;iic.c: 138: }
	goto	l15418
	line	141
	
l15416:	
;iic.c: 139: else
;iic.c: 140: {
;iic.c: 141: IIC_ACK();
	fcall	_IIC_ACK
	line	143
	
l15418:	
;iic.c: 142: }
;iic.c: 143: return data;
	movf	(I2C_ReadByte@data+1),w
	movwf	(?_I2C_ReadByte+1)
	movf	(I2C_ReadByte@data),w
	movwf	(?_I2C_ReadByte)
	line	144
	
l10645:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_ReadByte
	__end_of_I2C_ReadByte:
;; =============== function _I2C_ReadByte ends ============

	signat	_I2C_ReadByte,4218
	global	_AT24C02_Write_Byte
psect	text1107,local,class=CODE,delta=2
global __ptext1107
__ptext1107:

;; *************** function _AT24C02_Write_Byte *****************
;; Defined at:
;;		line 9 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\e2prom.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       1       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
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
psect	text1107
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\e2prom.c"
	line	9
	global	__size_of_AT24C02_Write_Byte
	__size_of_AT24C02_Write_Byte	equ	__end_of_AT24C02_Write_Byte-_AT24C02_Write_Byte
	
_AT24C02_Write_Byte:	
	opt	stack 1
; Regs used in _AT24C02_Write_Byte: [wreg+status,2+status,0+pclath+cstack]
;AT24C02_Write_Byte@addr stored from wreg
	movwf	(AT24C02_Write_Byte@addr)
	line	10
	
l16272:	
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
	
l11280:	
	return
	opt stack 0
GLOBAL	__end_of_AT24C02_Write_Byte
	__end_of_AT24C02_Write_Byte:
;; =============== function _AT24C02_Write_Byte ends ============

	signat	_AT24C02_Write_Byte,8312
	global	_RF_ClearStatus
psect	text1108,local,class=CODE,delta=2
global __ptext1108
__ptext1108:

;; *************** function _RF_ClearStatus *****************
;; Defined at:
;;		line 249 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
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
psect	text1108
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
	line	249
	global	__size_of_RF_ClearStatus
	__size_of_RF_ClearStatus	equ	__end_of_RF_ClearStatus-_RF_ClearStatus
	
_RF_ClearStatus:	
	opt	stack 2
; Regs used in _RF_ClearStatus: [wreg+status,2+status,0+pclath+cstack]
	line	250
	
l16270:	
;rf297L.c: 250: RF_WriteReg(0x20 + 0x07,0x70);
	movlw	(070h)
	movwf	(?_RF_WriteReg)
	movlw	(027h)
	fcall	_RF_WriteReg
	line	251
	
l5183:	
	return
	opt stack 0
GLOBAL	__end_of_RF_ClearStatus
	__end_of_RF_ClearStatus:
;; =============== function _RF_ClearStatus ends ============

	signat	_RF_ClearStatus,88
	global	_RF_ClearFIFO
psect	text1109,local,class=CODE,delta=2
global __ptext1109
__ptext1109:

;; *************** function _RF_ClearFIFO *****************
;; Defined at:
;;		line 243 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
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
psect	text1109
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
	line	243
	global	__size_of_RF_ClearFIFO
	__size_of_RF_ClearFIFO	equ	__end_of_RF_ClearFIFO-_RF_ClearFIFO
	
_RF_ClearFIFO:	
	opt	stack 2
; Regs used in _RF_ClearFIFO: [wreg+status,2+status,0+pclath+cstack]
	line	244
	
l16268:	
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
	
l5180:	
	return
	opt stack 0
GLOBAL	__end_of_RF_ClearFIFO
	__end_of_RF_ClearFIFO:
;; =============== function _RF_ClearFIFO ends ============

	signat	_RF_ClearFIFO,88
	global	_RF_GetStatus
psect	text1110,local,class=CODE,delta=2
global __ptext1110
__ptext1110:

;; *************** function _RF_GetStatus *****************
;; Defined at:
;;		line 254 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_RF_ReadReg
;; This function is called by:
;;		_RF_RxData
;; This function uses a non-reentrant model
;;
psect	text1110
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
	line	254
	global	__size_of_RF_GetStatus
	__size_of_RF_GetStatus	equ	__end_of_RF_GetStatus-_RF_GetStatus
	
_RF_GetStatus:	
	opt	stack 0
; Regs used in _RF_GetStatus: [wreg+status,2+status,0+pclath+cstack]
	line	255
	
l16264:	
;rf297L.c: 255: return RF_ReadReg(0x07)&0x70;
	movlw	(07h)
	fcall	_RF_ReadReg
	andlw	070h
	line	256
	
l5186:	
	return
	opt stack 0
GLOBAL	__end_of_RF_GetStatus
	__end_of_RF_GetStatus:
;; =============== function _RF_GetStatus ends ============

	signat	_RF_GetStatus,89
	global	_key_value_read
psect	text1111,local,class=CODE,delta=2
global __ptext1111
__ptext1111:

;; *************** function _key_value_read *****************
;; Defined at:
;;		line 141 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\key_scan.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
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
psect	text1111
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\key_scan.c"
	line	141
	global	__size_of_key_value_read
	__size_of_key_value_read	equ	__end_of_key_value_read-_key_value_read
	
_key_value_read:	
	opt	stack 3
; Regs used in _key_value_read: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	142
	
l15156:	
;key_scan.c: 142: key_scan();
	fcall	_key_scan
	line	143
	
l15158:	
;key_scan.c: 143: if(KEY0_FLAG == 0x01)
	decf	(_KEY0_FLAG),w
	skipz
	goto	u2401
	goto	u2400
u2401:
	goto	l15200
u2400:
	line	146
	
l15160:	
;key_scan.c: 144: {
;key_scan.c: 146: if(flag_time_key0_add >= 500)
	movlw	high(01F4h)
	subwf	(_flag_time_key0_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key0_add),w
	skipc
	goto	u2411
	goto	u2410
u2411:
	goto	l15188
u2410:
	line	148
	
l15162:	
;key_scan.c: 147: {
;key_scan.c: 148: if(key_long_flag == 0x01)
	decf	(_key_long_flag),w
	skipz
	goto	u2421
	goto	u2420
u2421:
	goto	l7186
u2420:
	line	150
	
l15164:	
;key_scan.c: 149: {
;key_scan.c: 150: key_long_flag = 0x10;
	movlw	(010h)
	movwf	(_key_long_flag)
	line	151
	
l15166:	
;key_scan.c: 151: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15168:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	152
	
l15170:	
;key_scan.c: 152: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	153
	
l15172:	
;key_scan.c: 153: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15174:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	154
	
l15176:	
;key_scan.c: 154: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	155
	
l15178:	
;key_scan.c: 155: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15180:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	156
	
l15182:	
;key_scan.c: 156: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	157
	
l15184:	
;key_scan.c: 157: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15186:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	goto	l7186
	line	158
	
l7182:	
	line	159
;key_scan.c: 158: }
;key_scan.c: 159: }
	goto	l7186
	line	160
	
l15188:	
;key_scan.c: 160: else if(flag_time_key0_add >= 300)
	movlw	high(012Ch)
	subwf	(_flag_time_key0_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key0_add),w
	skipc
	goto	u2431
	goto	u2430
u2431:
	goto	l7186
u2430:
	line	162
	
l15190:	
;key_scan.c: 161: {
;key_scan.c: 162: if(key_long_flag == 0)
	movf	(_key_long_flag),f
	skipz
	goto	u2441
	goto	u2440
u2441:
	goto	l7186
u2440:
	line	164
	
l15192:	
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
	goto	l15182
	line	173
	
l15200:	
;key_scan.c: 173: else if(KEY0_FLAG == 0x03)
	movf	(_KEY0_FLAG),w
	xorlw	03h
	skipz
	goto	u2451
	goto	u2450
u2451:
	goto	l7186
u2450:
	line	175
	
l15202:	
;key_scan.c: 174: {
;key_scan.c: 175: KEY0_FLAG = 0;
	clrf	(_KEY0_FLAG)
	line	177
	
l15204:	
;key_scan.c: 177: if((flag_time_key0_add < 300))
	movlw	high(012Ch)
	subwf	(_flag_time_key0_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key0_add),w
	skipnc
	goto	u2461
	goto	u2460
u2461:
	goto	l15208
u2460:
	line	179
	
l15206:	
;key_scan.c: 178: {
;key_scan.c: 179: KEY0.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY0),f
	line	180
;key_scan.c: 180: }
	goto	l7186
	line	181
	
l15208:	
;key_scan.c: 181: else if(flag_time_key0_add < 500)
	movlw	high(01F4h)
	subwf	(_flag_time_key0_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key0_add),w
	skipnc
	goto	u2471
	goto	u2470
u2471:
	goto	l15220
u2470:
	line	183
	
l15210:	
;key_scan.c: 182: {
;key_scan.c: 183: if(key_long_flag == 0x01)
	decf	(_key_long_flag),w
	skipz
	goto	u2481
	goto	u2480
u2481:
	goto	l7182
u2480:
	line	185
	
l15212:	
;key_scan.c: 184: {
;key_scan.c: 185: KEY0.key_flag_3s = 1;
	clrf	0+(_KEY0)+01h
	incf	0+(_KEY0)+01h,f
	line	186
	
l15214:	
;key_scan.c: 186: key_long_flag = 0x11;
	movlw	(011h)
	movwf	(_key_long_flag)
	line	187
;key_scan.c: 187: sys_stute = 2;
	movlw	(02h)
	movwf	(_sys_stute)
	line	188
	
l15216:	
;key_scan.c: 188: flag_time_key1_add = 0;
	clrf	(_flag_time_key1_add)
	clrf	(_flag_time_key1_add+1)
	line	189
	
l15218:	
;key_scan.c: 189: flag_time_key2_add = 0;
	clrf	(_flag_time_key2_add)
	clrf	(_flag_time_key2_add+1)
	goto	l7186
	line	194
	
l15220:	
;key_scan.c: 192: else
;key_scan.c: 193: {
;key_scan.c: 194: if(key_long_flag == 0x10)
	movf	(_key_long_flag),w
	xorlw	010h
	skipz
	goto	u2491
	goto	u2490
u2491:
	goto	l7182
u2490:
	line	196
	
l15222:	
;key_scan.c: 195: {
;key_scan.c: 196: KEY0.key_flag_5s = 1;
	clrf	0+(_KEY0)+02h
	incf	0+(_KEY0)+02h,f
	line	197
	
l15224:	
;key_scan.c: 197: key_long_flag = 0x11;
	movlw	(011h)
	movwf	(_key_long_flag)
	line	198
;key_scan.c: 198: sys_stute = 3;
	movlw	(03h)
	movwf	(_sys_stute)
	goto	l15216
	line	207
	
l7186:	
;key_scan.c: 201: }
;key_scan.c: 202: }
;key_scan.c: 204: }
;key_scan.c: 207: if(KEY1_FLAG == 0x01)
	decf	(_KEY1_FLAG),w
	skipz
	goto	u2501
	goto	u2500
u2501:
	goto	l15274
u2500:
	line	209
	
l15230:	
;key_scan.c: 208: {
;key_scan.c: 209: if(flag_time_key1_add >= 500)
	movlw	high(01F4h)
	subwf	(_flag_time_key1_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key1_add),w
	skipc
	goto	u2511
	goto	u2510
u2511:
	goto	l15258
u2510:
	line	211
	
l15232:	
;key_scan.c: 210: {
;key_scan.c: 211: if(key_long_flag == 0x02)
	movf	(_key_long_flag),w
	xorlw	02h
	skipz
	goto	u2521
	goto	u2520
u2521:
	goto	l7200
u2520:
	line	213
	
l15234:	
;key_scan.c: 212: {
;key_scan.c: 213: key_long_flag = 0x20;
	movlw	(020h)
	movwf	(_key_long_flag)
	line	214
	
l15236:	
;key_scan.c: 214: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15238:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	215
	
l15240:	
;key_scan.c: 215: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	216
	
l15242:	
;key_scan.c: 216: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15244:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	217
	
l15246:	
;key_scan.c: 217: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	218
	
l15248:	
;key_scan.c: 218: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15250:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	219
	
l15252:	
;key_scan.c: 219: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	220
	
l15254:	
;key_scan.c: 220: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15256:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	goto	l7200
	line	221
	
l7196:	
	line	222
;key_scan.c: 221: }
;key_scan.c: 222: }
	goto	l7200
	line	223
	
l15258:	
;key_scan.c: 223: else if(flag_time_key1_add >= 300)
	movlw	high(012Ch)
	subwf	(_flag_time_key1_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key1_add),w
	skipc
	goto	u2531
	goto	u2530
u2531:
	goto	l7200
u2530:
	line	225
	
l15260:	
;key_scan.c: 224: {
;key_scan.c: 225: if(key_long_flag == 0)
	movf	(_key_long_flag),f
	skipz
	goto	u2541
	goto	u2540
u2541:
	goto	l7200
u2540:
	line	227
	
l15262:	
;key_scan.c: 226: {
;key_scan.c: 227: key_long_flag = 0x02;
	movlw	(02h)
	movwf	(_key_long_flag)
	goto	l15248
	line	235
	
l15274:	
;key_scan.c: 235: else if(KEY1_FLAG == 0x03)
	movf	(_KEY1_FLAG),w
	xorlw	03h
	skipz
	goto	u2551
	goto	u2550
u2551:
	goto	l7200
u2550:
	line	237
	
l15276:	
;key_scan.c: 236: {
;key_scan.c: 237: KEY1_FLAG = 0;
	clrf	(_KEY1_FLAG)
	line	238
	
l15278:	
;key_scan.c: 238: if((flag_time_key1_add < 300))
	movlw	high(012Ch)
	subwf	(_flag_time_key1_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key1_add),w
	skipnc
	goto	u2561
	goto	u2560
u2561:
	goto	l15282
u2560:
	line	240
	
l15280:	
;key_scan.c: 239: {
;key_scan.c: 240: KEY1.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY1),f
	line	241
;key_scan.c: 241: }
	goto	l7200
	line	242
	
l15282:	
;key_scan.c: 242: else if(flag_time_key1_add < 500)
	movlw	high(01F4h)
	subwf	(_flag_time_key1_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key1_add),w
	skipnc
	goto	u2571
	goto	u2570
u2571:
	goto	l15294
u2570:
	line	244
	
l15284:	
;key_scan.c: 243: {
;key_scan.c: 244: if(key_long_flag == 0x02)
	movf	(_key_long_flag),w
	xorlw	02h
	skipz
	goto	u2581
	goto	u2580
u2581:
	goto	l7196
u2580:
	line	246
	
l15286:	
;key_scan.c: 245: {
;key_scan.c: 246: KEY1.key_flag_3s = 1;
	clrf	0+(_KEY1)+01h
	incf	0+(_KEY1)+01h,f
	line	247
	
l15288:	
;key_scan.c: 247: key_long_flag = 0x21;
	movlw	(021h)
	movwf	(_key_long_flag)
	line	248
;key_scan.c: 248: sys_stute = 2;
	movlw	(02h)
	movwf	(_sys_stute)
	line	249
	
l15290:	
;key_scan.c: 249: flag_time_key2_add = 0;
	clrf	(_flag_time_key2_add)
	clrf	(_flag_time_key2_add+1)
	line	250
	
l15292:	
;key_scan.c: 250: flag_time_key0_add = 0;
	clrf	(_flag_time_key0_add)
	clrf	(_flag_time_key0_add+1)
	goto	l7200
	line	255
	
l15294:	
;key_scan.c: 253: else
;key_scan.c: 254: {
;key_scan.c: 255: if(key_long_flag == 0x20)
	movf	(_key_long_flag),w
	xorlw	020h
	skipz
	goto	u2591
	goto	u2590
u2591:
	goto	l7196
u2590:
	line	257
	
l15296:	
;key_scan.c: 256: {
;key_scan.c: 257: KEY1.key_flag_5s = 1;
	clrf	0+(_KEY1)+02h
	incf	0+(_KEY1)+02h,f
	line	258
	
l15298:	
;key_scan.c: 258: key_long_flag = 0x21;
	movlw	(021h)
	movwf	(_key_long_flag)
	line	259
;key_scan.c: 259: sys_stute = 3;
	movlw	(03h)
	movwf	(_sys_stute)
	goto	l15290
	line	267
	
l7200:	
;key_scan.c: 262: }
;key_scan.c: 263: }
;key_scan.c: 264: }
;key_scan.c: 267: if(KEY2_FLAG == 0x01)
	decf	(_KEY2_FLAG),w
	skipz
	goto	u2601
	goto	u2600
u2601:
	goto	l15348
u2600:
	line	269
	
l15304:	
;key_scan.c: 268: {
;key_scan.c: 269: if(flag_time_key2_add >= 500)
	movlw	high(01F4h)
	subwf	(_flag_time_key2_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key2_add),w
	skipc
	goto	u2611
	goto	u2610
u2611:
	goto	l15332
u2610:
	line	271
	
l15306:	
;key_scan.c: 270: {
;key_scan.c: 271: if(key_long_flag == 0x04)
	movf	(_key_long_flag),w
	xorlw	04h
	skipz
	goto	u2621
	goto	u2620
u2621:
	goto	l7222
u2620:
	line	273
	
l15308:	
;key_scan.c: 272: {
;key_scan.c: 273: key_long_flag = 0x40;
	movlw	(040h)
	movwf	(_key_long_flag)
	line	274
	
l15310:	
;key_scan.c: 274: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15312:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	275
	
l15314:	
;key_scan.c: 275: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	276
	
l15316:	
;key_scan.c: 276: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15318:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	277
	
l15320:	
;key_scan.c: 277: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	278
	
l15322:	
;key_scan.c: 278: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15324:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	279
	
l15326:	
;key_scan.c: 279: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	280
	
l15328:	
;key_scan.c: 280: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15330:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	goto	l7222
	line	283
	
l15332:	
;key_scan.c: 283: else if(flag_time_key2_add >= 300)
	movlw	high(012Ch)
	subwf	(_flag_time_key2_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key2_add),w
	skipc
	goto	u2631
	goto	u2630
u2631:
	goto	l7222
u2630:
	line	285
	
l15334:	
;key_scan.c: 284: {
;key_scan.c: 285: if(key_long_flag == 0)
	movf	(_key_long_flag),f
	skipz
	goto	u2641
	goto	u2640
u2641:
	goto	l7211
u2640:
	line	287
	
l15336:	
;key_scan.c: 286: {
;key_scan.c: 287: key_long_flag = 0x04;
	movlw	(04h)
	movwf	(_key_long_flag)
	goto	l15322
	line	293
	
l7211:	
;key_scan.c: 291: }
;key_scan.c: 292: }
;key_scan.c: 293: }
	goto	l7222
	line	294
	
l15348:	
;key_scan.c: 294: else if(KEY2_FLAG == 0x03)
	movf	(_KEY2_FLAG),w
	xorlw	03h
	skipz
	goto	u2651
	goto	u2650
u2651:
	goto	l7222
u2650:
	line	296
	
l15350:	
;key_scan.c: 295: {
;key_scan.c: 296: KEY2_FLAG = 0;
	clrf	(_KEY2_FLAG)
	line	297
	
l15352:	
;key_scan.c: 297: if((flag_time_key2_add < 300))
	movlw	high(012Ch)
	subwf	(_flag_time_key2_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key2_add),w
	skipnc
	goto	u2661
	goto	u2660
u2661:
	goto	l15356
u2660:
	line	299
	
l15354:	
;key_scan.c: 298: {
;key_scan.c: 299: KEY2.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY2),f
	line	300
;key_scan.c: 300: }
	goto	l7222
	line	301
	
l15356:	
;key_scan.c: 301: else if(flag_time_key2_add < 500)
	movlw	high(01F4h)
	subwf	(_flag_time_key2_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key2_add),w
	skipnc
	goto	u2671
	goto	u2670
u2671:
	goto	l15368
u2670:
	line	303
	
l15358:	
;key_scan.c: 302: {
;key_scan.c: 303: if(key_long_flag == 0x04)
	movf	(_key_long_flag),w
	xorlw	04h
	skipz
	goto	u2681
	goto	u2680
u2681:
	goto	l7211
u2680:
	line	305
	
l15360:	
;key_scan.c: 304: {
;key_scan.c: 305: KEY2.key_flag_3s = 1;
	clrf	0+(_KEY2)+01h
	incf	0+(_KEY2)+01h,f
	line	306
	
l15362:	
;key_scan.c: 306: key_long_flag = 0x41;
	movlw	(041h)
	movwf	(_key_long_flag)
	line	307
;key_scan.c: 307: sys_stute = 2;
	movlw	(02h)
	movwf	(_sys_stute)
	line	308
	
l15364:	
;key_scan.c: 308: flag_time_key1_add = 0;
	clrf	(_flag_time_key1_add)
	clrf	(_flag_time_key1_add+1)
	line	309
	
l15366:	
;key_scan.c: 309: flag_time_key0_add = 0;
	clrf	(_flag_time_key0_add)
	clrf	(_flag_time_key0_add+1)
	goto	l7222
	line	315
	
l15368:	
;key_scan.c: 313: else
;key_scan.c: 314: {
;key_scan.c: 315: if(key_long_flag == 0x40)
	movf	(_key_long_flag),w
	xorlw	040h
	skipz
	goto	u2691
	goto	u2690
u2691:
	goto	l7211
u2690:
	line	317
	
l15370:	
;key_scan.c: 316: {
;key_scan.c: 317: KEY2.key_flag_5s = 1;
	clrf	0+(_KEY2)+02h
	incf	0+(_KEY2)+02h,f
	line	318
	
l15372:	
;key_scan.c: 318: key_long_flag = 0x41;
	movlw	(041h)
	movwf	(_key_long_flag)
	line	319
;key_scan.c: 319: sys_stute = 3;
	movlw	(03h)
	movwf	(_sys_stute)
	goto	l15364
	line	326
	
l7222:	
	return
	opt stack 0
GLOBAL	__end_of_key_value_read
	__end_of_key_value_read:
;; =============== function _key_value_read ends ============

	signat	_key_value_read,88
	global	_RF_Set_RxMode
psect	text1112,local,class=CODE,delta=2
global __ptext1112
__ptext1112:

;; *************** function _RF_Set_RxMode *****************
;; Defined at:
;;		line 267 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
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
psect	text1112
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
	line	267
	global	__size_of_RF_Set_RxMode
	__size_of_RF_Set_RxMode	equ	__end_of_RF_Set_RxMode-_RF_Set_RxMode
	
_RF_Set_RxMode:	
	opt	stack 3
; Regs used in _RF_Set_RxMode: [wreg+status,2+status,0+pclath+cstack]
	line	268
	
l16260:	
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
	
l16262:	
;rf297L.c: 270: RA7=1;
	bsf	(47/8),(47)&7
	line	271
;rf297L.c: 271: soft_delay_ms(10);
	movlw	0Ah
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	272
	
l5192:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Set_RxMode
	__end_of_RF_Set_RxMode:
;; =============== function _RF_Set_RxMode ends ============

	signat	_RF_Set_RxMode,88
	global	_RF_Init
psect	text1113,local,class=CODE,delta=2
global __ptext1113
__ptext1113:

;; *************** function _RF_Init *****************
;; Defined at:
;;		line 45 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
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
psect	text1113
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
	line	45
	global	__size_of_RF_Init
	__size_of_RF_Init	equ	__end_of_RF_Init-_RF_Init
	
_RF_Init:	
	opt	stack 3
; Regs used in _RF_Init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	75
	
l16210:	
	line	76
	
l16212:	
;rf297L.c: 76: SPI_init();
	fcall	_SPI_init
	line	77
	
l16214:	
;rf297L.c: 77: RF_WriteReg(0x53, 0x5A);
	movlw	(05Ah)
	movwf	(?_RF_WriteReg)
	movlw	(053h)
	fcall	_RF_WriteReg
	line	78
	
l16216:	
;rf297L.c: 78: RF_WriteReg(0x53, 0XA5);
	movlw	(0A5h)
	movwf	(?_RF_WriteReg)
	movlw	(053h)
	fcall	_RF_WriteReg
	line	79
	
l16218:	
;rf297L.c: 79: RF_WriteReg(0xE1, 0);
	clrf	(?_RF_WriteReg)
	movlw	(0E1h)
	fcall	_RF_WriteReg
	line	80
	
l16220:	
;rf297L.c: 80: RF_WriteReg(0xE2, 0);
	clrf	(?_RF_WriteReg)
	movlw	(0E2h)
	fcall	_RF_WriteReg
	line	81
	
l16222:	
;rf297L.c: 81: RF_WriteReg(0x20 + 0x07, 0x70);
	movlw	(070h)
	movwf	(?_RF_WriteReg)
	movlw	(027h)
	fcall	_RF_WriteReg
	line	82
	
l16224:	
;rf297L.c: 82: RF_WriteReg(0x20 + 0x02, 0x01);
	clrf	(?_RF_WriteReg)
	incf	(?_RF_WriteReg),f
	movlw	(022h)
	fcall	_RF_WriteReg
	line	83
	
l16226:	
;rf297L.c: 83: RF_WriteReg(0x20 + 0x03, 0x01);
	clrf	(?_RF_WriteReg)
	incf	(?_RF_WriteReg),f
	movlw	(023h)
	fcall	_RF_WriteReg
	line	84
	
l16228:	
;rf297L.c: 84: RF_WriteReg(0x20 + 0x05, 26);
	movlw	(01Ah)
	movwf	(?_RF_WriteReg)
	movlw	(025h)
	fcall	_RF_WriteReg
	line	85
	
l16230:	
;rf297L.c: 85: RF_WriteReg(0x20 + 0x11, 18);
	movlw	(012h)
	movwf	(?_RF_WriteReg)
	movlw	(031h)
	fcall	_RF_WriteReg
	line	86
	
l16232:	
;rf297L.c: 86: RF_Write_Buff(0x20 + 0x10, TX_ADDRESS_DEF, sizeof(TX_ADDRESS_DEF));
	movlw	((_TX_ADDRESS_DEF-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(030h)
	fcall	_RF_Write_Buff
	line	87
	
l16234:	
;rf297L.c: 87: RF_Write_Buff(0x20 + 0x0A,RX_ADDRESS_DEF, sizeof(RX_ADDRESS_DEF));
	movlw	((_RX_ADDRESS_DEF-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(02Ah)
	fcall	_RF_Write_Buff
	line	88
	
l16236:	
;rf297L.c: 88: RF_Write_Buff(0x20 + 0x1F, BB_cal_data, sizeof(BB_cal_data));
	movlw	((RF_Init@BB_cal_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(05h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(03Fh)
	fcall	_RF_Write_Buff
	line	89
	
l16238:	
;rf297L.c: 89: RF_Write_Buff(0x20 + 0x1A, RF_cal2_data, sizeof(RF_cal2_data));
	movlw	((RF_Init@RF_cal2_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(06h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(03Ah)
	fcall	_RF_Write_Buff
	line	90
	
l16240:	
;rf297L.c: 90: RF_Write_Buff(0x20 + 0x19, Dem_cal_data, sizeof(Dem_cal_data));
	movlw	((RF_Init@Dem_cal_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	clrf	0+(?_RF_Write_Buff)+01h
	incf	0+(?_RF_Write_Buff)+01h,f
	movlw	(039h)
	fcall	_RF_Write_Buff
	line	91
	
l16242:	
;rf297L.c: 91: RF_Write_Buff(0x20 + 0x1E, RF_cal_data, sizeof(RF_cal_data));
	movlw	((RF_Init@RF_cal_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(03Eh)
	fcall	_RF_Write_Buff
	line	92
	
l16244:	
;rf297L.c: 92: RF_Write_Buff(0x20 + 0x1B, Dem_cal2_data,sizeof(Dem_cal2_data));
	movlw	((RF_Init@Dem_cal2_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(03Bh)
	fcall	_RF_Write_Buff
	line	93
	
l16246:	
;rf297L.c: 93: RF_WriteReg(0x20 + 0x1C, 0x00);
	clrf	(?_RF_WriteReg)
	movlw	(03Ch)
	fcall	_RF_WriteReg
	line	94
	
l16248:	
;rf297L.c: 94: RF_WriteReg(0x20 + 0x06, (0x0e |0X00));
	movlw	(0Eh)
	movwf	(?_RF_WriteReg)
	movlw	(026h)
	fcall	_RF_WriteReg
	line	95
	
l16250:	
;rf297L.c: 95: RF_WriteReg(0x50, 0x73);
	movlw	(073h)
	movwf	(?_RF_WriteReg)
	movlw	(050h)
	fcall	_RF_WriteReg
	line	101
	
l16252:	
;rf297L.c: 101: RF_WriteReg(0x20 + 0x04,0x00);
	clrf	(?_RF_WriteReg)
	movlw	(024h)
	fcall	_RF_WriteReg
	line	102
	
l16254:	
;rf297L.c: 102: RF_WriteReg(0x20 + 0x01, 0x00);
	clrf	(?_RF_WriteReg)
	movlw	(021h)
	fcall	_RF_WriteReg
	line	117
;rf297L.c: 113: if(18 >32){
	
l16258:	
;rf297L.c: 115: }
;rf297L.c: 117: RF_WriteReg(0x20 + 0x1D, feature);
	clrf	(?_RF_WriteReg)
	movlw	(03Dh)
	fcall	_RF_WriteReg
	line	118
	
l5160:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Init
	__end_of_RF_Init:
;; =============== function _RF_Init ends ============

	signat	_RF_Init,88
	global	_I2C_SendByte
psect	text1114,local,class=CODE,delta=2
global __ptext1114
__ptext1114:

;; *************** function _I2C_SendByte *****************
;; Defined at:
;;		line 91 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\iic.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
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
psect	text1114
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\iic.c"
	line	91
	global	__size_of_I2C_SendByte
	__size_of_I2C_SendByte	equ	__end_of_I2C_SendByte-_I2C_SendByte
	
_I2C_SendByte:	
	opt	stack 1
; Regs used in _I2C_SendByte: [wreg+status,2+status,0+pclath+cstack]
;I2C_SendByte@Data stored from wreg
	line	93
	movwf	(I2C_SendByte@Data)
	
l15084:	
;iic.c: 92: unsigned char cnt;
;iic.c: 93: TRISC1=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	94
	
l15086:	
;iic.c: 94: for(cnt=0; cnt<8; cnt++)
	clrf	(I2C_SendByte@cnt)
	line	95
	
l10633:	
	line	98
;iic.c: 95: {
;iic.c: 98: if(Data & 0x80)
	btfss	(I2C_SendByte@Data),(7)&7
	goto	u2381
	goto	u2380
u2381:
	goto	l10635
u2380:
	line	100
	
l15092:	
;iic.c: 99: {
;iic.c: 100: RC1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(57/8),(57)&7
	line	101
;iic.c: 101: }
	goto	l10636
	line	102
	
l10635:	
	line	104
;iic.c: 102: else
;iic.c: 103: {
;iic.c: 104: RC1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(57/8),(57)&7
	line	105
	
l10636:	
	line	106
;iic.c: 105: }
;iic.c: 106: Data <<= 1;
	clrc
	rlf	(I2C_SendByte@Data),f
	line	107
;iic.c: 107: RC2=1;
	bsf	(58/8),(58)&7
	line	108
	
l15094:	
;iic.c: 108: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	109
	
l15096:	
;iic.c: 109: RC2=0;
	bcf	(58/8),(58)&7
	line	110
;iic.c: 110: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	94
	
l15098:	
	incf	(I2C_SendByte@cnt),f
	
l15100:	
	movlw	(08h)
	subwf	(I2C_SendByte@cnt),w
	skipc
	goto	u2391
	goto	u2390
u2391:
	goto	l10633
u2390:
	line	113
	
l10637:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_SendByte
	__end_of_I2C_SendByte:
;; =============== function _I2C_SendByte ends ============

	signat	_I2C_SendByte,4216
	global	_IIC_NACK
psect	text1115,local,class=CODE,delta=2
global __ptext1115
__ptext1115:

;; *************** function _IIC_NACK *****************
;; Defined at:
;;		line 78 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\iic.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_iic_delay_us
;; This function is called by:
;;		_I2C_ReadByte
;; This function uses a non-reentrant model
;;
psect	text1115
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\iic.c"
	line	78
	global	__size_of_IIC_NACK
	__size_of_IIC_NACK	equ	__end_of_IIC_NACK-_IIC_NACK
	
_IIC_NACK:	
	opt	stack 0
; Regs used in _IIC_NACK: [wreg+status,2+status,0+pclath+cstack]
	line	79
	
l15076:	
;iic.c: 79: RC1=1;
	bsf	(57/8),(57)&7
	line	80
	
l15078:	
;iic.c: 80: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	81
	
l15080:	
;iic.c: 81: RC2=1;
	bsf	(58/8),(58)&7
	line	82
;iic.c: 82: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	83
	
l15082:	
;iic.c: 83: RC2=0;
	bcf	(58/8),(58)&7
	line	84
;iic.c: 84: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	85
	
l10630:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_NACK
	__end_of_IIC_NACK:
;; =============== function _IIC_NACK ends ============

	signat	_IIC_NACK,88
	global	_IIC_ACK
psect	text1116,local,class=CODE,delta=2
global __ptext1116
__ptext1116:

;; *************** function _IIC_ACK *****************
;; Defined at:
;;		line 67 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\iic.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_iic_delay_us
;; This function is called by:
;;		_I2C_ReadByte
;; This function uses a non-reentrant model
;;
psect	text1116
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\iic.c"
	line	67
	global	__size_of_IIC_ACK
	__size_of_IIC_ACK	equ	__end_of_IIC_ACK-_IIC_ACK
	
_IIC_ACK:	
	opt	stack 0
; Regs used in _IIC_ACK: [wreg+status,2+status,0+pclath+cstack]
	line	68
	
l15066:	
;iic.c: 68: TRISC1=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	69
;iic.c: 69: RC1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(57/8),(57)&7
	line	70
	
l15068:	
;iic.c: 70: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	71
	
l15070:	
;iic.c: 71: RC2=1;
	bsf	(58/8),(58)&7
	line	72
;iic.c: 72: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	73
	
l15072:	
;iic.c: 73: RC2=0;
	bcf	(58/8),(58)&7
	line	74
	
l15074:	
;iic.c: 74: RC1=1;
	bsf	(57/8),(57)&7
	line	75
	
l10627:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_ACK
	__end_of_IIC_ACK:
;; =============== function _IIC_ACK ends ============

	signat	_IIC_ACK,88
	global	_IIC_Wait_ACK
psect	text1117,local,class=CODE,delta=2
global __ptext1117
__ptext1117:

;; *************** function _IIC_Wait_ACK *****************
;; Defined at:
;;		line 42 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\iic.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
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
psect	text1117
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\iic.c"
	line	42
	global	__size_of_IIC_Wait_ACK
	__size_of_IIC_Wait_ACK	equ	__end_of_IIC_Wait_ACK-_IIC_Wait_ACK
	
_IIC_Wait_ACK:	
	opt	stack 1
; Regs used in _IIC_Wait_ACK: [wreg+status,2+status,0+pclath+cstack]
	line	43
	
l15038:	
	line	44
	
l15040:	
;iic.c: 44: TRISC1=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	45
	
l15042:	
;iic.c: 45: RC1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(57/8),(57)&7
	line	46
	
l15044:	
;iic.c: 46: {TRISC1=1,WPUC1=1;};
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1081/8)^080h,(1081)&7
	
l15046:	
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3193/8)^0180h,(3193)&7
	line	48
	
l15048:	
;iic.c: 48: RC2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	49
	
l15050:	
;iic.c: 49: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	50
	
l15052:	
;iic.c: 50: RC2=1;
	bsf	(58/8),(58)&7
	line	51
	
l15054:	
;iic.c: 51: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	53
	
l15056:	
;iic.c: 53: if(RC1)
	btfss	(57/8),(57)&7
	goto	u2371
	goto	u2370
u2371:
	goto	l15060
u2370:
	line	55
	
l15058:	
	line	56
;iic.c: 56: }
	goto	l15062
	line	59
	
l15060:	
	line	61
	
l15062:	
;iic.c: 60: }
;iic.c: 61: RC2=0;
	bcf	(58/8),(58)&7
	line	64
	
l10624:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_Wait_ACK
	__end_of_IIC_Wait_ACK:
;; =============== function _IIC_Wait_ACK ends ============

	signat	_IIC_Wait_ACK,89
	global	_IIC_STOP
psect	text1118,local,class=CODE,delta=2
global __ptext1118
__ptext1118:

;; *************** function _IIC_STOP *****************
;; Defined at:
;;		line 32 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\iic.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
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
psect	text1118
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\iic.c"
	line	32
	global	__size_of_IIC_STOP
	__size_of_IIC_STOP	equ	__end_of_IIC_STOP-_IIC_STOP
	
_IIC_STOP:	
	opt	stack 1
; Regs used in _IIC_STOP: [wreg+status,2+status,0+pclath+cstack]
	line	33
	
l15032:	
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
	
l15034:	
;iic.c: 36: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	37
	
l15036:	
;iic.c: 37: RC1=1;
	bsf	(57/8),(57)&7
	line	38
	
l10619:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_STOP
	__end_of_IIC_STOP:
;; =============== function _IIC_STOP ends ============

	signat	_IIC_STOP,88
	global	_IIC_START
psect	text1119,local,class=CODE,delta=2
global __ptext1119
__ptext1119:

;; *************** function _IIC_START *****************
;; Defined at:
;;		line 20 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\iic.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
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
psect	text1119
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\iic.c"
	line	20
	global	__size_of_IIC_START
	__size_of_IIC_START	equ	__end_of_IIC_START-_IIC_START
	
_IIC_START:	
	opt	stack 1
; Regs used in _IIC_START: [wreg+status,2+status,0+pclath+cstack]
	line	21
	
l15024:	
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
	
l15026:	
;iic.c: 24: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	25
	
l15028:	
;iic.c: 25: RC1=0;
	bcf	(57/8),(57)&7
	line	26
;iic.c: 26: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	27
	
l15030:	
;iic.c: 27: RC2=0;
	bcf	(58/8),(58)&7
	line	28
	
l10616:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_START
	__end_of_IIC_START:
;; =============== function _IIC_START ends ============

	signat	_IIC_START,88
	global	_key_scan
psect	text1120,local,class=CODE,delta=2
global __ptext1120
__ptext1120:

;; *************** function _key_scan *****************
;; Defined at:
;;		line 28 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\key_scan.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_soft_delay_ms
;; This function is called by:
;;		_key_value_read
;; This function uses a non-reentrant model
;;
psect	text1120
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\key_scan.c"
	global	__size_of_key_scan
	__size_of_key_scan	equ	__end_of_key_scan-_key_scan
	
_key_scan:	
	opt	stack 3
; Regs used in _key_scan: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	29
	
l14948:	
;key_scan.c: 29: if(RB1 == 0)
	btfsc	(49/8),(49)&7
	goto	u2191
	goto	u2190
u2191:
	goto	l7150
u2190:
	line	31
	
l14950:	
;key_scan.c: 30: {
;key_scan.c: 31: soft_delay_ms(10);
	movlw	0Ah
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	32
	
l14952:	
;key_scan.c: 32: if(RB1 == 0)
	btfsc	(49/8),(49)&7
	goto	u2201
	goto	u2200
u2201:
	goto	l14970
u2200:
	line	33
	
l14954:	
;key_scan.c: 33: if((KEY0_FLAG&0x01) == 0)
	btfsc	(_KEY0_FLAG),(0)&7
	goto	u2211
	goto	u2210
u2211:
	goto	l14970
u2210:
	line	35
	
l14956:	
;key_scan.c: 34: {
;key_scan.c: 35: flag_time_key0_add = 0;
	clrf	(_flag_time_key0_add)
	clrf	(_flag_time_key0_add+1)
	line	36
	
l14958:	
;key_scan.c: 36: KEY0_FLAG|=0X01;
	bsf	(_KEY0_FLAG)+(0/8),(0)&7
	line	37
	
l14960:	
;key_scan.c: 37: if(key_long_flag_add == 0)
	movf	(_key_long_flag_add),f
	skipz
	goto	u2221
	goto	u2220
u2221:
	goto	l7151
u2220:
	line	39
	
l14962:	
;key_scan.c: 38: {
;key_scan.c: 39: key_long_flag_add = 1;
	clrf	(_key_long_flag_add)
	incf	(_key_long_flag_add),f
	goto	l14970
	line	42
	
l7151:	
;key_scan.c: 40: }
;key_scan.c: 41: }
;key_scan.c: 42: }
	goto	l14970
	line	43
	
l7150:	
	line	45
;key_scan.c: 43: else
;key_scan.c: 44: {
;key_scan.c: 45: if(KEY0_FLAG&0x01)
	btfss	(_KEY0_FLAG),(0)&7
	goto	u2231
	goto	u2230
u2231:
	goto	l14970
u2230:
	line	47
	
l14964:	
;key_scan.c: 46: {
;key_scan.c: 47: KEY0_FLAG |= 0X02;
	bsf	(_KEY0_FLAG)+(1/8),(1)&7
	line	48
	
l14966:	
;key_scan.c: 48: if(key_long_flag_add == 1)
	decf	(_key_long_flag_add),w
	skipz
	goto	u2241
	goto	u2240
u2241:
	goto	l14970
u2240:
	line	50
	
l14968:	
;key_scan.c: 49: {
;key_scan.c: 50: key_long_flag_add = 0;
	clrf	(_key_long_flag_add)
	line	55
	
l14970:	
;key_scan.c: 51: }
;key_scan.c: 52: }
;key_scan.c: 53: }
;key_scan.c: 55: if(RB2 == 0)
	btfsc	(50/8),(50)&7
	goto	u2251
	goto	u2250
u2251:
	goto	l7157
u2250:
	line	57
	
l14972:	
;key_scan.c: 56: {
;key_scan.c: 57: soft_delay_ms(10);
	movlw	0Ah
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	58
	
l14974:	
;key_scan.c: 58: if(RB2 == 0)
	btfsc	(50/8),(50)&7
	goto	u2261
	goto	u2260
u2261:
	goto	l14992
u2260:
	line	59
	
l14976:	
;key_scan.c: 59: if((KEY1_FLAG&0x01) == 0)
	btfsc	(_KEY1_FLAG),(0)&7
	goto	u2271
	goto	u2270
u2271:
	goto	l14992
u2270:
	line	61
	
l14978:	
;key_scan.c: 60: {
;key_scan.c: 61: flag_time_key1_add = 0;
	clrf	(_flag_time_key1_add)
	clrf	(_flag_time_key1_add+1)
	line	62
	
l14980:	
;key_scan.c: 62: KEY1_FLAG |= 0X01;
	bsf	(_KEY1_FLAG)+(0/8),(0)&7
	line	63
	
l14982:	
;key_scan.c: 63: if(key_long_flag_add == 0)
	movf	(_key_long_flag_add),f
	skipz
	goto	u2281
	goto	u2280
u2281:
	goto	l7158
u2280:
	line	65
	
l14984:	
;key_scan.c: 64: {
;key_scan.c: 65: key_long_flag_add = 2;
	movlw	(02h)
	movwf	(_key_long_flag_add)
	goto	l14992
	line	69
	
l7158:	
;key_scan.c: 66: }
;key_scan.c: 67: }
;key_scan.c: 69: }
	goto	l14992
	line	70
	
l7157:	
	line	72
;key_scan.c: 70: else
;key_scan.c: 71: {
;key_scan.c: 72: if(KEY1_FLAG & 0x01)
	btfss	(_KEY1_FLAG),(0)&7
	goto	u2291
	goto	u2290
u2291:
	goto	l14992
u2290:
	line	74
	
l14986:	
;key_scan.c: 73: {
;key_scan.c: 74: KEY1_FLAG |= 0X02;
	bsf	(_KEY1_FLAG)+(1/8),(1)&7
	line	75
	
l14988:	
;key_scan.c: 75: if(key_long_flag_add == 2)
	movf	(_key_long_flag_add),w
	xorlw	02h
	skipz
	goto	u2301
	goto	u2300
u2301:
	goto	l14992
u2300:
	line	77
	
l14990:	
;key_scan.c: 76: {
;key_scan.c: 77: key_long_flag_add = 0;
	clrf	(_key_long_flag_add)
	line	86
	
l14992:	
;key_scan.c: 78: }
;key_scan.c: 79: }
;key_scan.c: 80: }
;key_scan.c: 86: if(RB3 == 0)
	btfsc	(51/8),(51)&7
	goto	u2311
	goto	u2310
u2311:
	goto	l7164
u2310:
	line	88
	
l14994:	
;key_scan.c: 87: {
;key_scan.c: 88: soft_delay_ms(10);
	movlw	0Ah
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	89
	
l14996:	
;key_scan.c: 89: if(RB3 == 0)
	btfsc	(51/8),(51)&7
	goto	u2321
	goto	u2320
u2321:
	goto	l15022
u2320:
	line	90
	
l14998:	
;key_scan.c: 90: if((KEY2_FLAG&0x01) == 0)
	btfsc	(_KEY2_FLAG),(0)&7
	goto	u2331
	goto	u2330
u2331:
	goto	l15022
u2330:
	line	92
	
l15000:	
;key_scan.c: 91: {
;key_scan.c: 92: flag_time_key2_add = 0;
	clrf	(_flag_time_key2_add)
	clrf	(_flag_time_key2_add+1)
	line	93
	
l15002:	
;key_scan.c: 93: KEY2_FLAG|=0X01;
	bsf	(_KEY2_FLAG)+(0/8),(0)&7
	line	94
	
l15004:	
;key_scan.c: 94: if(key_long_flag_add == 0)
	movf	(_key_long_flag_add),f
	skipz
	goto	u2341
	goto	u2340
u2341:
	goto	l7168
u2340:
	line	96
	
l15006:	
;key_scan.c: 95: {
;key_scan.c: 96: key_long_flag_add = 4;
	movlw	(04h)
	movwf	(_key_long_flag_add)
	goto	l15022
	line	100
	
l7164:	
	line	102
;key_scan.c: 100: else
;key_scan.c: 101: {
;key_scan.c: 102: if(KEY2_FLAG & 0x01)
	btfss	(_KEY2_FLAG),(0)&7
	goto	u2351
	goto	u2350
u2351:
	goto	l15022
u2350:
	line	104
	
l15008:	
;key_scan.c: 103: {
;key_scan.c: 104: KEY2_FLAG |= 0X02;
	bsf	(_KEY2_FLAG)+(1/8),(1)&7
	line	105
	
l15010:	
;key_scan.c: 105: if(key_long_flag_add == 4)
	movf	(_key_long_flag_add),w
	xorlw	04h
	skipz
	goto	u2361
	goto	u2360
u2361:
	goto	l7168
u2360:
	line	107
	
l15012:	
;key_scan.c: 106: {
;key_scan.c: 107: key_long_flag_add = 0;
	clrf	(_key_long_flag_add)
	goto	l15022
	line	110
	
l7168:	
	line	113
;key_scan.c: 108: }
;key_scan.c: 109: }
;key_scan.c: 110: }
;key_scan.c: 113: switch(key_long_flag_add)
	goto	l15022
	line	121
	
l15014:	
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
	goto	l7177
	line	126
	
l15016:	
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
	goto	l7177
	line	131
	
l15018:	
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
	goto	l7177
	line	113
	
l15022:	
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
	goto	l7177
	xorlw	1^0	; case 1
	skipnz
	goto	l15014
	xorlw	2^1	; case 2
	skipnz
	goto	l15016
	xorlw	4^2	; case 4
	skipnz
	goto	l15018
	goto	l7177
	opt asmopt_on

	line	135
	
l7177:	
	return
	opt stack 0
GLOBAL	__end_of_key_scan
	__end_of_key_scan:
;; =============== function _key_scan ends ============

	signat	_key_scan,88
	global	_RF_ReadReg
psect	text1121,local,class=CODE,delta=2
global __ptext1121
__ptext1121:

;; *************** function _RF_ReadReg *****************
;; Defined at:
;;		line 306 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_SPI_RW
;; This function is called by:
;;		_RF_GetStatus
;; This function uses a non-reentrant model
;;
psect	text1121
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
	line	306
	global	__size_of_RF_ReadReg
	__size_of_RF_ReadReg	equ	__end_of_RF_ReadReg-_RF_ReadReg
	
_RF_ReadReg:	
	opt	stack 0
; Regs used in _RF_ReadReg: [wreg+status,2+status,0+pclath+cstack]
;RF_ReadReg@reg_addr stored from wreg
	line	308
	movwf	(RF_ReadReg@reg_addr)
	
l16200:	
;rf297L.c: 307: unsigned char tmp;
;rf297L.c: 308: RE2=0;
	bcf	(74/8),(74)&7
	line	309
	
l16202:	
;rf297L.c: 309: SPI_RW(reg_addr);
	movf	(RF_ReadReg@reg_addr),w
	fcall	_SPI_RW
	line	310
;rf297L.c: 310: tmp = SPI_RW(0);
	movlw	(0)
	fcall	_SPI_RW
	movwf	(RF_ReadReg@tmp)
	line	311
	
l16204:	
;rf297L.c: 311: RE2=1;
	bsf	(74/8),(74)&7
	line	312
	
l16206:	
;rf297L.c: 312: return tmp;
	movf	(RF_ReadReg@tmp),w
	line	313
	
l5210:	
	return
	opt stack 0
GLOBAL	__end_of_RF_ReadReg
	__end_of_RF_ReadReg:
;; =============== function _RF_ReadReg ends ============

	signat	_RF_ReadReg,4217
	global	_RF_Read_Buff
psect	text1122,local,class=CODE,delta=2
global __ptext1122
__ptext1122:

;; *************** function _RF_Read_Buff *****************
;; Defined at:
;;		line 275 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       4       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_SPI_RW
;; This function is called by:
;;		_RF_RxData
;; This function uses a non-reentrant model
;;
psect	text1122
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
	line	275
	global	__size_of_RF_Read_Buff
	__size_of_RF_Read_Buff	equ	__end_of_RF_Read_Buff-_RF_Read_Buff
	
_RF_Read_Buff:	
	opt	stack 1
; Regs used in _RF_Read_Buff: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_Read_Buff@reg_addr stored from wreg
	line	277
	movwf	(RF_Read_Buff@reg_addr)
	
l16188:	
;rf297L.c: 276: unsigned char byte_ctr;
;rf297L.c: 277: RE2=0;
	bcf	(74/8),(74)&7
	line	278
	
l16190:	
;rf297L.c: 278: SPI_RW(reg_addr);
	movf	(RF_Read_Buff@reg_addr),w
	fcall	_SPI_RW
	line	279
	
l16192:	
;rf297L.c: 279: for(byte_ctr=0;byte_ctr<length;byte_ctr++){
	clrf	(RF_Read_Buff@byte_ctr)
	goto	l16198
	line	280
	
l16194:	
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
	
l16196:	
	incf	(RF_Read_Buff@byte_ctr),f
	
l16198:	
	movf	(RF_Read_Buff@length),w
	subwf	(RF_Read_Buff@byte_ctr),w
	skipc
	goto	u3811
	goto	u3810
u3811:
	goto	l16194
u3810:
	
l5197:	
	line	282
;rf297L.c: 281: }
;rf297L.c: 282: RE2=1;
	bsf	(74/8),(74)&7
	line	283
	
l5198:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Read_Buff
	__end_of_RF_Read_Buff:
;; =============== function _RF_Read_Buff ends ============

	signat	_RF_Read_Buff,12408
	global	_RF_Write_Buff
psect	text1123,local,class=CODE,delta=2
global __ptext1123
__ptext1123:

;; *************** function _RF_Write_Buff *****************
;; Defined at:
;;		line 286 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_SPI_RW
;; This function is called by:
;;		_RF_Init
;; This function uses a non-reentrant model
;;
psect	text1123
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
	line	286
	global	__size_of_RF_Write_Buff
	__size_of_RF_Write_Buff	equ	__end_of_RF_Write_Buff-_RF_Write_Buff
	
_RF_Write_Buff:	
	opt	stack 3
; Regs used in _RF_Write_Buff: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_Write_Buff@reg_addr stored from wreg
	line	288
	movwf	(RF_Write_Buff@reg_addr)
	
l16176:	
;rf297L.c: 287: unsigned char i;
;rf297L.c: 288: RE2=0;
	bcf	(74/8),(74)&7
	line	289
	
l16178:	
;rf297L.c: 289: SPI_RW(reg_addr);
	movf	(RF_Write_Buff@reg_addr),w
	fcall	_SPI_RW
	line	290
	
l16180:	
;rf297L.c: 290: for(i=0;i<length;i++)
	clrf	(RF_Write_Buff@i)
	goto	l16186
	line	292
	
l16182:	
;rf297L.c: 291: {
;rf297L.c: 292: SPI_RW(pBuff[i]);
	movf	(RF_Write_Buff@i),w
	addwf	(RF_Write_Buff@pBuff),w
	movwf	fsr0
	fcall	stringdir
	fcall	_SPI_RW
	line	290
	
l16184:	
	incf	(RF_Write_Buff@i),f
	
l16186:	
	movf	(RF_Write_Buff@length),w
	subwf	(RF_Write_Buff@i),w
	skipc
	goto	u3801
	goto	u3800
u3801:
	goto	l16182
u3800:
	
l5203:	
	line	294
;rf297L.c: 293: }
;rf297L.c: 294: RE2=1;
	bsf	(74/8),(74)&7
	line	295
	
l5204:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Write_Buff
	__end_of_RF_Write_Buff:
;; =============== function _RF_Write_Buff ends ============

	signat	_RF_Write_Buff,12408
	global	_RF_WriteReg
psect	text1124,local,class=CODE,delta=2
global __ptext1124
__ptext1124:

;; *************** function _RF_WriteReg *****************
;; Defined at:
;;		line 298 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       1       0       0       0
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
psect	text1124
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
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
	
l16170:	
;rf297L.c: 299: RE2=0;
	bcf	(74/8),(74)&7
	line	300
	
l16172:	
;rf297L.c: 300: SPI_RW(reg_addr);
	movf	(RF_WriteReg@reg_addr),w
	fcall	_SPI_RW
	line	301
;rf297L.c: 301: SPI_RW(write_data);
	movf	(RF_WriteReg@write_data),w
	fcall	_SPI_RW
	line	302
	
l16174:	
;rf297L.c: 302: RE2=1;
	bsf	(74/8),(74)&7
	line	303
	
l5207:	
	return
	opt stack 0
GLOBAL	__end_of_RF_WriteReg
	__end_of_RF_WriteReg:
;; =============== function _RF_WriteReg ends ============

	signat	_RF_WriteReg,8312
	global	___bmul
psect	text1125,local,class=CODE,delta=2
global __ptext1125
__ptext1125:

;; *************** function ___bmul *****************
;; Defined at:
;;		line 3 in file "C:\Users\Andrew\Desktop\PAN2416\PAN2416\PAN2416\±àÒëÆ÷\CMS_IDE_V1.41.03_CRC_PANCHIP\data\sources\bmul.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1125
	file	"C:\Users\Andrew\Desktop\PAN2416\PAN2416\PAN2416\±àÒëÆ÷\CMS_IDE_V1.41.03_CRC_PANCHIP\data\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 4
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	movwf	(___bmul@multiplier)
	line	4
	
l14876:	
	clrf	(___bmul@product)
	line	7
	
l14878:	
	btfss	(___bmul@multiplier),(0)&7
	goto	u2131
	goto	u2130
u2131:
	goto	l14882
u2130:
	line	8
	
l14880:	
	movf	(___bmul@multiplicand),w
	addwf	(___bmul@product),f
	line	9
	
l14882:	
	clrc
	rlf	(___bmul@multiplicand),f
	line	10
	
l14884:	
	clrc
	rrf	(___bmul@multiplier),f
	line	11
	
l14886:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u2141
	goto	u2140
u2141:
	goto	l14878
u2140:
	line	12
	
l14888:	
	movf	(___bmul@product),w
	line	13
	
l12281:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
;; =============== function ___bmul ends ============

	signat	___bmul,8313
	global	_iic_delay_us
psect	text1126,local,class=CODE,delta=2
global __ptext1126
__ptext1126:

;; *************** function _iic_delay_us *****************
;; Defined at:
;;		line 6 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\iic.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
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
psect	text1126
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\iic.c"
	line	6
	global	__size_of_iic_delay_us
	__size_of_iic_delay_us	equ	__end_of_iic_delay_us-_iic_delay_us
	
_iic_delay_us:	
	opt	stack 1
; Regs used in _iic_delay_us: [wreg+status,2+status,0]
;iic_delay_us@delay stored from wreg
	movwf	(iic_delay_us@delay)
	line	7
	
l14872:	
;iic.c: 7: while(delay--);
	
l14874:	
	decf	(iic_delay_us@delay),f
	movf	((iic_delay_us@delay)),w
	xorlw	0FFh
	skipz
	goto	u2121
	goto	u2120
u2121:
	goto	l14874
u2120:
	line	8
	
l10610:	
	return
	opt stack 0
GLOBAL	__end_of_iic_delay_us
	__end_of_iic_delay_us:
;; =============== function _iic_delay_us ends ============

	signat	_iic_delay_us,4216
	global	_UpdateCRC
psect	text1127,local,class=CODE,delta=2
global __ptext1127
__ptext1127:

;; *************** function _UpdateCRC *****************
;; Defined at:
;;		line 42 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\recive.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       5       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         2       8       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rx_data
;; This function uses a non-reentrant model
;;
psect	text1127
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\recive.c"
	line	42
	global	__size_of_UpdateCRC
	__size_of_UpdateCRC	equ	__end_of_UpdateCRC-_UpdateCRC
	
_UpdateCRC:	
	opt	stack 3
; Regs used in _UpdateCRC: [wreg-fsr0h+status,2+status,0+btemp+1]
;UpdateCRC@CRC_input stored from wreg
	movwf	(UpdateCRC@CRC_input)
	line	43
	
l14844:	
;recive.c: 43: unsigned char i,k = 0;
	clrf	(UpdateCRC@k)
	line	44
	
l14846:	
;recive.c: 44: unsigned short CRC_acc = 0x5555;
	movlw	low(05555h)
	movwf	(UpdateCRC@CRC_acc)
	movlw	high(05555h)
	movwf	((UpdateCRC@CRC_acc))+1
	line	46
;recive.c: 46: while (len--)
	goto	l14866
	line	48
	
l14848:	
;recive.c: 47: {
;recive.c: 48: CRC_acc = CRC_acc ^ (CRC_input[k++] << 8);
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
	
l14850:	
	incf	(UpdateCRC@k),f
	line	50
	
l14852:	
;recive.c: 50: for (i = 0; i < 8; i++)
	clrf	(UpdateCRC@i)
	line	51
	
l9804:	
	line	52
;recive.c: 51: {
;recive.c: 52: if ((CRC_acc & 0x8000) == 0x8000)
	btfss	(UpdateCRC@CRC_acc+1),(15)&7
	goto	u2091
	goto	u2090
u2091:
	goto	l14862
u2090:
	line	54
	
l14858:	
;recive.c: 53: {
;recive.c: 54: CRC_acc = CRC_acc << 1;
	clrc
	rlf	(UpdateCRC@CRC_acc),f
	rlf	(UpdateCRC@CRC_acc+1),f
	line	55
	
l14860:	
;recive.c: 55: CRC_acc ^= 0x1021;
	movlw	low(01021h)
	xorwf	(UpdateCRC@CRC_acc),f
	movlw	high(01021h)
	xorwf	(UpdateCRC@CRC_acc+1),f
	line	56
;recive.c: 56: }
	goto	l9807
	line	59
	
l14862:	
;recive.c: 57: else
;recive.c: 58: {
;recive.c: 59: CRC_acc = CRC_acc << 1;
	clrc
	rlf	(UpdateCRC@CRC_acc),f
	rlf	(UpdateCRC@CRC_acc+1),f
	line	60
	
l9807:	
	line	50
	incf	(UpdateCRC@i),f
	
l14864:	
	movlw	(08h)
	subwf	(UpdateCRC@i),w
	skipc
	goto	u2101
	goto	u2100
u2101:
	goto	l9804
u2100:
	line	46
	
l14866:	
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
	goto	u2111
	goto	u2110
u2111:
	goto	l14848
u2110:
	line	63
	
l14868:	
;recive.c: 60: }
;recive.c: 61: }
;recive.c: 62: }
;recive.c: 63: return CRC_acc;
	movf	(UpdateCRC@CRC_acc+1),w
	movwf	(?_UpdateCRC+1)
	movf	(UpdateCRC@CRC_acc),w
	movwf	(?_UpdateCRC)
	line	64
	
l9809:	
	return
	opt stack 0
GLOBAL	__end_of_UpdateCRC
	__end_of_UpdateCRC:
;; =============== function _UpdateCRC ends ============

	signat	_UpdateCRC,8314
	global	_SPI_RW
psect	text1128,local,class=CODE,delta=2
global __ptext1128
__ptext1128:

;; *************** function _SPI_RW *****************
;; Defined at:
;;		line 331 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
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
psect	text1128
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
	line	331
	global	__size_of_SPI_RW
	__size_of_SPI_RW	equ	__end_of_SPI_RW-_SPI_RW
	
_SPI_RW:	
	opt	stack 2
; Regs used in _SPI_RW: [wreg+status,2+status,0]
;SPI_RW@read_reg_addr stored from wreg
	line	333
	movwf	(SPI_RW@read_reg_addr)
	
l16152:	
;rf297L.c: 332: unsigned char i;
;rf297L.c: 333: for(i = 0; i < 8; i++)
	clrf	(SPI_RW@i)
	line	334
	
l5216:	
	line	335
;rf297L.c: 334: {
;rf297L.c: 335: RE1=0;
	bcf	(73/8),(73)&7
	line	336
;rf297L.c: 336: if(read_reg_addr & 0x80)
	btfss	(SPI_RW@read_reg_addr),(7)&7
	goto	u3771
	goto	u3770
u3771:
	goto	l5218
u3770:
	line	338
	
l16158:	
;rf297L.c: 337: {
;rf297L.c: 338: RA5=1;
	bsf	(45/8),(45)&7
	line	339
;rf297L.c: 339: }
	goto	l5219
	line	340
	
l5218:	
	line	342
;rf297L.c: 340: else
;rf297L.c: 341: {
;rf297L.c: 342: RA5=0;
	bcf	(45/8),(45)&7
	line	343
	
l5219:	
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
	goto	u3781
	goto	u3780
u3781:
	goto	l16162
u3780:
	line	348
	
l16160:	
;rf297L.c: 347: {
;rf297L.c: 348: read_reg_addr = read_reg_addr | 0x01;
	bsf	(SPI_RW@read_reg_addr)+(0/8),(0)&7
	line	333
	
l16162:	
	incf	(SPI_RW@i),f
	
l16164:	
	movlw	(08h)
	subwf	(SPI_RW@i),w
	skipc
	goto	u3791
	goto	u3790
u3791:
	goto	l5216
u3790:
	
l5217:	
	line	351
;rf297L.c: 349: }
;rf297L.c: 350: }
;rf297L.c: 351: RE1=0;
	bcf	(73/8),(73)&7
	line	352
	
l16166:	
;rf297L.c: 352: return read_reg_addr;
	movf	(SPI_RW@read_reg_addr),w
	line	353
	
l5221:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_RW
	__end_of_SPI_RW:
;; =============== function _SPI_RW ends ============

	signat	_SPI_RW,4217
	global	_SPI_init
psect	text1129,local,class=CODE,delta=2
global __ptext1129
__ptext1129:

;; *************** function _SPI_init *****************
;; Defined at:
;;		line 316 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_RF_Init
;; This function uses a non-reentrant model
;;
psect	text1129
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\rf297L.c"
	line	316
	global	__size_of_SPI_init
	__size_of_SPI_init	equ	__end_of_SPI_init-_SPI_init
	
_SPI_init:	
	opt	stack 4
; Regs used in _SPI_init: []
	line	318
	
l14824:	
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
	
l5213:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_init
	__end_of_SPI_init:
;; =============== function _SPI_init ends ============

	signat	_SPI_init,88
	global	_delay_task
psect	text1130,local,class=CODE,delta=2
global __ptext1130
__ptext1130:

;; *************** function _delay_task *****************
;; Defined at:
;;		line 572 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\recive.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1130
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\recive.c"
	line	572
	global	__size_of_delay_task
	__size_of_delay_task	equ	__end_of_delay_task-_delay_task
	
_delay_task:	
	opt	stack 5
; Regs used in _delay_task: [wreg-fsr0h+status,2+status,0]
	line	574
	
l14736:	
;recive.c: 574: if(channel_delay[0] != 0)
	movf	(_channel_delay),w
	skipz
	goto	u1940
	goto	l9984
u1940:
	line	576
	
l14738:	
;recive.c: 575: {
;recive.c: 576: if(delay_flag == 0)delay_flag = 1;
	movf	(_delay_flag),f
	skipz
	goto	u1951
	goto	u1950
u1951:
	goto	l14742
u1950:
	
l14740:	
	clrf	(_delay_flag)
	incf	(_delay_flag),f
	line	577
	
l14742:	
;recive.c: 577: if(channel_delay[2] > 0)
	movf	0+(_channel_delay)+02h,w
	skipz
	goto	u1960
	goto	l14794
u1960:
	line	579
	
l14744:	
;recive.c: 578: {
;recive.c: 579: if(flag_5min_add >= 30000)
	movlw	high(07530h)
	subwf	(_flag_5min_add+1),w
	movlw	low(07530h)
	skipnz
	subwf	(_flag_5min_add),w
	skipc
	goto	u1971
	goto	u1970
u1971:
	goto	l9984
u1970:
	line	581
	
l14746:	
;recive.c: 580: {
;recive.c: 581: flag_5min_add = 0;
	clrf	(_flag_5min_add)
	clrf	(_flag_5min_add+1)
	line	582
	
l14748:	
;recive.c: 582: channel_delay[2]--;
	decf	0+(_channel_delay)+02h,f
	goto	l9984
	line	591
	
l14750:	
;recive.c: 590: {
;recive.c: 591: if(channel_delay[1] != 2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u1981
	goto	u1980
u1981:
	goto	l14754
u1980:
	line	592
	
l14752:	
;recive.c: 592: KEY0.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY0)
	goto	l14796
	line	594
	
l14754:	
;recive.c: 593: else
;recive.c: 594: KEY0.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY0),f
	goto	l14796
	line	598
	
l14756:	
;recive.c: 597: {
;recive.c: 598: if(channel_delay[1] != 2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u1991
	goto	u1990
u1991:
	goto	l14760
u1990:
	line	599
	
l14758:	
;recive.c: 599: KEY1.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY1)
	goto	l14796
	line	601
	
l14760:	
;recive.c: 600: else
;recive.c: 601: KEY1.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY1),f
	goto	l14796
	line	605
	
l14762:	
;recive.c: 604: {
;recive.c: 605: if(channel_delay[1] != 2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u2001
	goto	u2000
u2001:
	goto	l14766
u2000:
	line	606
	
l14764:	
;recive.c: 606: KEY2.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY2)
	goto	l14796
	line	608
	
l14766:	
;recive.c: 607: else
;recive.c: 608: KEY2.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY2),f
	goto	l14796
	line	612
	
l14768:	
;recive.c: 611: {
;recive.c: 612: if(channel_delay[1] != 2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u2011
	goto	u2010
u2011:
	goto	l14772
u2010:
	line	614
	
l14770:	
;recive.c: 613: {
;recive.c: 614: KEY0.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY0)
	line	615
;recive.c: 615: KEY1.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY1)
	line	616
;recive.c: 616: }
	goto	l14796
	line	619
	
l14772:	
;recive.c: 617: else
;recive.c: 618: {
;recive.c: 619: KEY0.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY0),f
	line	620
;recive.c: 620: KEY1.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY1),f
	goto	l14796
	line	625
	
l14774:	
;recive.c: 624: {
;recive.c: 625: if(channel_delay[1] != 2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u2021
	goto	u2020
u2021:
	goto	l14778
u2020:
	line	627
	
l14776:	
;recive.c: 626: {
;recive.c: 627: KEY0.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY0)
	line	628
;recive.c: 628: KEY2.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY2)
	line	629
;recive.c: 629: }
	goto	l14796
	line	632
	
l14778:	
;recive.c: 630: else
;recive.c: 631: {
;recive.c: 632: KEY0.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY0),f
	line	633
;recive.c: 633: KEY2.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY2),f
	goto	l14796
	line	638
	
l14780:	
;recive.c: 637: {
;recive.c: 638: if(channel_delay[1] != 2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u2031
	goto	u2030
u2031:
	goto	l14784
u2030:
	line	640
	
l14782:	
;recive.c: 639: {
;recive.c: 640: KEY1.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY1)
	line	641
;recive.c: 641: KEY2.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY2)
	line	642
;recive.c: 642: }
	goto	l14796
	line	645
	
l14784:	
;recive.c: 643: else
;recive.c: 644: {
;recive.c: 645: KEY1.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY1),f
	line	646
;recive.c: 646: KEY2.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY2),f
	goto	l14796
	line	651
	
l14786:	
;recive.c: 650: {
;recive.c: 651: if(channel_delay[1] != 2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u2041
	goto	u2040
u2041:
	goto	l14790
u2040:
	line	653
	
l14788:	
;recive.c: 652: {
;recive.c: 653: KEY0.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY0)
	line	654
;recive.c: 654: KEY1.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY1)
	line	655
;recive.c: 655: KEY2.channel_status = channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY2)
	line	656
;recive.c: 656: }
	goto	l14796
	line	659
	
l14790:	
;recive.c: 657: else
;recive.c: 658: {
;recive.c: 659: KEY0.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY0),f
	line	660
;recive.c: 660: KEY1.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY1),f
	line	661
;recive.c: 661: KEY2.channel_status ^= 1;
	movlw	(01h)
	xorwf	(_KEY2),f
	goto	l14796
	line	587
	
l14794:	
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
	goto	l14750
	xorlw	2^1	; case 2
	skipnz
	goto	l14756
	xorlw	3^2	; case 3
	skipnz
	goto	l14768
	xorlw	4^3	; case 4
	skipnz
	goto	l14762
	xorlw	5^4	; case 5
	skipnz
	goto	l14774
	xorlw	6^5	; case 6
	skipnz
	goto	l14780
	xorlw	7^6	; case 7
	skipnz
	goto	l14786
	goto	l14796
	opt asmopt_on

	line	667
	
l14796:	
;recive.c: 667: channel_delay[0] = 0;
	clrf	(_channel_delay)
	line	668
;recive.c: 668: channel_delay[1] = 0;
	clrf	0+(_channel_delay)+01h
	line	669
;recive.c: 669: channel_delay[2] = 0;
	clrf	0+(_channel_delay)+02h
	line	670
;recive.c: 670: delay_flag=0;
	clrf	(_delay_flag)
	line	673
	
l9984:	
	return
	opt stack 0
GLOBAL	__end_of_delay_task
	__end_of_delay_task:
;; =============== function _delay_task ends ============

	signat	_delay_task,88
	global	_channel_set
psect	text1131,local,class=CODE,delta=2
global __ptext1131
__ptext1131:

;; *************** function _channel_set *****************
;; Defined at:
;;		line 526 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\recive.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1131
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\recive.c"
	line	526
	global	__size_of_channel_set
	__size_of_channel_set	equ	__end_of_channel_set-_channel_set
	
_channel_set:	
	opt	stack 5
; Regs used in _channel_set: [wreg-fsr0h+status,2+status,0]
;channel_set@channel_num stored from wreg
	movwf	(channel_set@channel_num)
	line	527
	
l14724:	
;recive.c: 527: switch(channel_num)
	goto	l14734
	line	529
;recive.c: 528: {
;recive.c: 529: case 0 :
	
l9943:	
	line	531
;recive.c: 530: {
;recive.c: 531: if(status)
	movf	(channel_set@status),w
	skipz
	goto	u1910
	goto	l9944
u1910:
	line	533
	
l14726:	
;recive.c: 532: {
;recive.c: 533: TRISB6 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	534
;recive.c: 534: RB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7
	line	535
;recive.c: 535: }
	goto	l9953
	line	536
	
l9944:	
	line	538
;recive.c: 536: else
;recive.c: 537: {
;recive.c: 538: TRISB6 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	539
;recive.c: 539: RB6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(54/8),(54)&7
	goto	l9953
	line	542
;recive.c: 542: case 1:
	
l9947:	
	line	544
;recive.c: 543: {
;recive.c: 544: if(status)
	movf	(channel_set@status),w
	skipz
	goto	u1920
	goto	l9948
u1920:
	line	546
	
l14728:	
;recive.c: 545: {
;recive.c: 546: TRISB5 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7
	line	547
;recive.c: 547: RB5 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(53/8),(53)&7
	line	548
;recive.c: 548: }
	goto	l9953
	line	549
	
l9948:	
	line	551
;recive.c: 549: else
;recive.c: 550: {
;recive.c: 551: TRISB5 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7
	line	552
;recive.c: 552: RB5 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(53/8),(53)&7
	goto	l9953
	line	555
;recive.c: 555: case 2:
	
l9950:	
	line	557
;recive.c: 556: {
;recive.c: 557: if(status)
	movf	(channel_set@status),w
	skipz
	goto	u1930
	goto	l9951
u1930:
	line	559
	
l14730:	
;recive.c: 558: {
;recive.c: 559: TRISB4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	560
;recive.c: 560: RB4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(52/8),(52)&7
	line	561
;recive.c: 561: }
	goto	l9953
	line	562
	
l9951:	
	line	564
;recive.c: 562: else
;recive.c: 563: {
;recive.c: 564: TRISB4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	565
;recive.c: 565: RB4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(52/8),(52)&7
	goto	l9953
	line	527
	
l14734:	
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
	goto	l9943
	xorlw	1^0	; case 1
	skipnz
	goto	l9947
	xorlw	2^1	; case 2
	skipnz
	goto	l9950
	goto	l9953
	opt asmopt_on

	line	569
	
l9953:	
	return
	opt stack 0
GLOBAL	__end_of_channel_set
	__end_of_channel_set:
;; =============== function _channel_set ends ============

	signat	_channel_set,8312
	global	_Enable_Interrupt
psect	text1132,local,class=CODE,delta=2
global __ptext1132
__ptext1132:

;; *************** function _Enable_Interrupt *****************
;; Defined at:
;;		line 38 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\system.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1132
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\system.c"
	line	38
	global	__size_of_Enable_Interrupt
	__size_of_Enable_Interrupt	equ	__end_of_Enable_Interrupt-_Enable_Interrupt
	
_Enable_Interrupt:	
	opt	stack 5
; Regs used in _Enable_Interrupt: []
	line	39
	
l14722:	
;system.c: 39: INTCON |= 0x80;
	bsf	(11)+(7/8),(7)&7	;volatile
	line	40
	
l1309:	
	return
	opt stack 0
GLOBAL	__end_of_Enable_Interrupt
	__end_of_Enable_Interrupt:
;; =============== function _Enable_Interrupt ends ============

	signat	_Enable_Interrupt,88
	global	_Timer1_start
psect	text1133,local,class=CODE,delta=2
global __ptext1133
__ptext1133:

;; *************** function _Timer1_start *****************
;; Defined at:
;;		line 43 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\timer1.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         3       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         3       2       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1133
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\timer1.c"
	line	43
	global	__size_of_Timer1_start
	__size_of_Timer1_start	equ	__end_of_Timer1_start-_Timer1_start
	
_Timer1_start:	
	opt	stack 5
; Regs used in _Timer1_start: [wreg]
	line	44
	
l14716:	
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
	
l14718:	
;timer1.c: 47: PIR1 &= ~(0x01);
	bcf	(12)+(0/8),(0)&7	;volatile
	line	48
	
l14720:	
;timer1.c: 48: T1CON |= 0x01;
	bsf	(16)+(0/8),(0)&7	;volatile
	line	49
	
l2591:	
	return
	opt stack 0
GLOBAL	__end_of_Timer1_start
	__end_of_Timer1_start:
;; =============== function _Timer1_start ends ============

	signat	_Timer1_start,8312
	global	_Timer1_Init
psect	text1134,local,class=CODE,delta=2
global __ptext1134
__ptext1134:

;; *************** function _Timer1_Init *****************
;; Defined at:
;;		line 29 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\timer1.c"
;; Parameters:    Size  Location     Type
;;  TIMER1_DIVID    1    wreg     enum E573
;; Auto vars:     Size  Location     Type
;;  TIMER1_DIVID    1    3[COMMON] enum E573
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1134
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\timer1.c"
	line	29
	global	__size_of_Timer1_Init
	__size_of_Timer1_Init	equ	__end_of_Timer1_Init-_Timer1_Init
	
_Timer1_Init:	
	opt	stack 5
; Regs used in _Timer1_Init: [wreg+status,2+status,0]
;Timer1_Init@TIMER1_DIVIDER stored from wreg
	movwf	(Timer1_Init@TIMER1_DIVIDER)
	line	30
	
l14708:	
;timer1.c: 30: T1CON = 0x00;
	clrf	(16)	;volatile
	line	31
	
l14710:	
;timer1.c: 31: T1CON |= TIMER1_DIVIDER;
	movf	(Timer1_Init@TIMER1_DIVIDER),w
	iorwf	(16),f	;volatile
	line	32
	
l14712:	
;timer1.c: 32: INTCON |= (0x40);
	bsf	(11)+(6/8),(6)&7	;volatile
	line	33
	
l14714:	
;timer1.c: 33: PIE1 |= 0x01;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(140)^080h+(0/8),(0)&7	;volatile
	line	34
	
l2588:	
	return
	opt stack 0
GLOBAL	__end_of_Timer1_Init
	__end_of_Timer1_Init:
;; =============== function _Timer1_Init ends ============

	signat	_Timer1_Init,4216
	global	_key_Init
psect	text1135,local,class=CODE,delta=2
global __ptext1135
__ptext1135:

;; *************** function _key_Init *****************
;; Defined at:
;;		line 335 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\key_scan.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1135
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\key_scan.c"
	line	335
	global	__size_of_key_Init
	__size_of_key_Init	equ	__end_of_key_Init-_key_Init
	
_key_Init:	
	opt	stack 5
; Regs used in _key_Init: [wreg+status,2+status,0]
	line	336
	
l14704:	
;key_scan.c: 336: OPTION_REG &= ~0x80;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(129)^080h+(7/8),(7)&7	;volatile
	line	337
	
l14706:	
;key_scan.c: 337: TRISB |= 0x0e;
	movlw	(0Eh)
	iorwf	(134)^080h,f	;volatile
	line	338
;key_scan.c: 338: WPUB |= 0x0e;
	movlw	(0Eh)
	iorwf	(149)^080h,f	;volatile
	line	339
	
l7225:	
	return
	opt stack 0
GLOBAL	__end_of_key_Init
	__end_of_key_Init:
;; =============== function _key_Init ends ============

	signat	_key_Init,88
	global	_IIC_Init
psect	text1136,local,class=CODE,delta=2
global __ptext1136
__ptext1136:

;; *************** function _IIC_Init *****************
;; Defined at:
;;		line 11 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\iic.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1136
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\iic.c"
	line	11
	global	__size_of_IIC_Init
	__size_of_IIC_Init	equ	__end_of_IIC_Init-_IIC_Init
	
_IIC_Init:	
	opt	stack 5
; Regs used in _IIC_Init: []
	line	12
	
l14702:	
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
	
l10613:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_Init
	__end_of_IIC_Init:
;; =============== function _IIC_Init ends ============

	signat	_IIC_Init,88
	global	_soft_delay_ms
psect	text1137,local,class=CODE,delta=2
global __ptext1137
__ptext1137:

;; *************** function _soft_delay_ms *****************
;; Defined at:
;;		line 10 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\delay.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       4       0       0       0
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
psect	text1137
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\delay.c"
	line	10
	global	__size_of_soft_delay_ms
	__size_of_soft_delay_ms	equ	__end_of_soft_delay_ms-_soft_delay_ms
	
_soft_delay_ms:	
	opt	stack 4
; Regs used in _soft_delay_ms: [wreg+status,2+status,0]
	line	14
	
l14676:	
;delay.c: 12: volatile unsigned int i;
;delay.c: 13: volatile unsigned char j,k;
;delay.c: 14: for(i=0;i<ms;i++){
	bcf	status, 5	;RP0=0, select bank0
	clrf	(soft_delay_ms@i)	;volatile
	clrf	(soft_delay_ms@i+1)	;volatile
	goto	l14700
	line	15
	
l14678:	
;delay.c: 15: for(j=0;j<10;j++){
	clrf	(soft_delay_ms@j)	;volatile
	
l14680:	
	movlw	(0Ah)
	subwf	(soft_delay_ms@j),w	;volatile
	skipc
	goto	u1881
	goto	u1880
u1881:
	goto	l14684
u1880:
	goto	l14698
	line	16
	
l14684:	
;delay.c: 16: for(k=0;k<32;k++);
	clrf	(soft_delay_ms@k)	;volatile
	
l14686:	
	movlw	(020h)
	subwf	(soft_delay_ms@k),w	;volatile
	skipc
	goto	u1891
	goto	u1890
u1891:
	goto	l14690
u1890:
	goto	l14694
	
l14690:	
	incf	(soft_delay_ms@k),f	;volatile
	goto	l14686
	line	15
	
l14694:	
	incf	(soft_delay_ms@j),f	;volatile
	goto	l14680
	line	14
	
l14698:	
	incf	(soft_delay_ms@i),f	;volatile
	skipnz
	incf	(soft_delay_ms@i+1),f	;volatile
	
l14700:	
	movf	(soft_delay_ms@ms+1),w
	subwf	(soft_delay_ms@i+1),w	;volatile
	skipz
	goto	u1905
	movf	(soft_delay_ms@ms),w
	subwf	(soft_delay_ms@i),w	;volatile
u1905:
	skipc
	goto	u1901
	goto	u1900
u1901:
	goto	l14678
u1900:
	line	19
	
l5870:	
	return
	opt stack 0
GLOBAL	__end_of_soft_delay_ms
	__end_of_soft_delay_ms:
;; =============== function _soft_delay_ms ends ============

	signat	_soft_delay_ms,4216
	global	_system_set_CPU_frequency
psect	text1138,local,class=CODE,delta=2
global __ptext1138
__ptext1138:

;; *************** function _system_set_CPU_frequency *****************
;; Defined at:
;;		line 19 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\system.c"
;; Parameters:    Size  Location     Type
;;  CPU_Frequenc    1    wreg     enum E564
;; Auto vars:     Size  Location     Type
;;  CPU_Frequenc    1    3[COMMON] enum E564
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1138
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\system.c"
	global	__size_of_system_set_CPU_frequency
	__size_of_system_set_CPU_frequency	equ	__end_of_system_set_CPU_frequency-_system_set_CPU_frequency
	
_system_set_CPU_frequency:	
	opt	stack 5
; Regs used in _system_set_CPU_frequency: [wreg+status,2]
;system_set_CPU_frequency@CPU_Frequency stored from wreg
	movwf	(system_set_CPU_frequency@CPU_Frequency)
	line	20
	
l14672:	
;system.c: 20: OSCCON = CPU_Frequency;
	movf	(system_set_CPU_frequency@CPU_Frequency),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h
	line	21
	
l14674:	
;system.c: 21: OSCTUNE = 0X00;
	clrf	(144)^080h	;volatile
	line	22
	
l1300:	
	return
	opt stack 0
GLOBAL	__end_of_system_set_CPU_frequency
	__end_of_system_set_CPU_frequency:
;; =============== function _system_set_CPU_frequency ends ============

	signat	_system_set_CPU_frequency,4216
	global	_ISR
psect	text1139,local,class=CODE,delta=2
global __ptext1139
__ptext1139:

;; *************** function _ISR *****************
;; Defined at:
;;		line 48 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\system.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_TIMER1_ISR
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text1139
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\system.c"
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
psect	text1139
	line	53
	
i1l14798:	
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
	
i1l14800:	
	movlw	(043h)
	andwf	(ISR@peripheral_intterrupt_touch),f
	line	71
	
i1l14802:	
;system.c: 71: if(peripheral_intterrupt_touch & TIMER1_ISR_TOUCH) {
	btfss	(ISR@peripheral_intterrupt_touch),(0)&7
	goto	u205_21
	goto	u205_20
u205_21:
	goto	i1l1316
u205_20:
	line	72
	
i1l14804:	
;system.c: 72: TIMER1_ISR();
	fcall	_TIMER1_ISR
	line	82
	
i1l1316:	
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
psect	text1140,local,class=CODE,delta=2
global __ptext1140
__ptext1140:

;; *************** function _TIMER1_ISR *****************
;; Defined at:
;;		line 60 in file "C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\timer1.c"
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
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text1140
	file	"C:\Users\Andrew\Desktop\EleMatch\PAV03\FWSWES-PAV03-SWITCHES-PAN2416AV\src\timer1.c"
	line	60
	global	__size_of_TIMER1_ISR
	__size_of_TIMER1_ISR	equ	__end_of_TIMER1_ISR-_TIMER1_ISR
	
_TIMER1_ISR:	
	opt	stack 0
; Regs used in _TIMER1_ISR: [wreg+status,2+status,0]
	line	63
	
i1l14806:	
;timer1.c: 61: static unsigned int flag_1s_add=0;
;timer1.c: 62: static unsigned int flag_1min_add=0;
;timer1.c: 63: T1CON &= ~(0x01);
	bcf	(16)+(0/8),(0)&7	;volatile
	line	64
	
i1l14808:	
;timer1.c: 64: TMR1L = (unsigned char)(Timer1_set_time);
	movf	(_Timer1_set_time),w	;volatile
	movwf	(14)	;volatile
	line	65
;timer1.c: 65: TMR1H = (unsigned char)(Timer1_set_time>>8);
	movf	(_Timer1_set_time+1),w	;volatile
	movwf	(15)	;volatile
	line	67
	
i1l14810:	
;timer1.c: 67: flag_time_key0_add++;
	incf	(_flag_time_key0_add),f
	skipnz
	incf	(_flag_time_key0_add+1),f
	line	68
	
i1l14812:	
;timer1.c: 68: flag_time_key1_add++;
	incf	(_flag_time_key1_add),f
	skipnz
	incf	(_flag_time_key1_add+1),f
	line	69
	
i1l14814:	
;timer1.c: 69: flag_time_key2_add++;
	incf	(_flag_time_key2_add),f
	skipnz
	incf	(_flag_time_key2_add+1),f
	line	70
	
i1l14816:	
;timer1.c: 70: flag_5s_add++;
	incf	(_flag_5s_add),f
	skipnz
	incf	(_flag_5s_add+1),f
	line	71
	
i1l14818:	
;timer1.c: 72: flag_1s_add++;
	incf	(_flag_5min_add),f
	skipnz
	incf	(_flag_5min_add+1),f
	line	74
	
i1l14820:	
;timer1.c: 74: PIR1 &= ~(0x01);
	bcf	(12)+(0/8),(0)&7	;volatile
	line	75
	
i1l14822:	
;timer1.c: 75: T1CON |= 0x01;
	bsf	(16)+(0/8),(0)&7	;volatile
	line	76
	
i1l2601:	
	return
	opt stack 0
GLOBAL	__end_of_TIMER1_ISR
	__end_of_TIMER1_ISR:
;; =============== function _TIMER1_ISR ends ============

	signat	_TIMER1_ISR,88
psect	text1141,local,class=CODE,delta=2
global __ptext1141
__ptext1141:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
