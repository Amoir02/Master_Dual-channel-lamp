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
	global	_sys_stute
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\recive.c"
	line	25

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
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\recive.c"
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
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\recive.c"
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
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\recive.c"
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
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
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
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
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
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
	line	384
RF_Carrier@BB_cal_data:
	retlw	0Ah
	retlw	06Dh
	retlw	067h
	retlw	09Ch
	retlw	046h
	global	RF_Init@BB_cal_data
psect	strings
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
	line	62
RF_Init@BB_cal_data:
	retlw	0Ah
	retlw	06Dh
	retlw	067h
	retlw	09Ch
	retlw	046h
	global	RF_Carrier@Dem_cal2_data
psect	strings
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
	line	388
RF_Carrier@Dem_cal2_data:
	retlw	0Bh
	retlw	0DFh
	retlw	02h
	global	RF_Carrier@RF_cal_data
psect	strings
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
	line	385
RF_Carrier@RF_cal_data:
	retlw	016h
	retlw	033h
	retlw	027h
	global	RF_Init@Dem_cal2_data
psect	strings
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
	line	66
RF_Init@Dem_cal2_data:
	retlw	0Bh
	retlw	0DFh
	retlw	02h
	global	RF_Init@RF_cal_data
psect	strings
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
	line	63
RF_Init@RF_cal_data:
	retlw	016h
	retlw	033h
	retlw	027h
	global	_RX_ADDRESS_DEF
psect	strings
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
	line	7
_RX_ADDRESS_DEF:
	retlw	02Dh
	retlw	0D7h
	retlw	0B9h
	global	_TX_ADDRESS_DEF
psect	strings
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
	line	6
_TX_ADDRESS_DEF:
	retlw	0CCh
	retlw	0CCh
	retlw	0CCh
	global	RF_Carrier@Dem_cal_data
psect	strings
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
	line	387
RF_Carrier@Dem_cal_data:
	retlw	0E1h
	global	RF_Init@Dem_cal_data
psect	strings
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
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
	global	_match_channel_flag
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
	file	"PAN2416 æ¿˝≥Ã–Ú.as"
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

_match_channel_flag:
       ds      1

_rf_buf:
       ds      18

_channel_flag:
       ds      3

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\recive.c"
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
	movlw	low((__pbssBANK0)+031h)
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
;;Data sizes: Strings 0, constant 121, data 1, bss 134, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6      11
;; BANK0           80     30      80
;; BANK1           80      0      80

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
;;BANK0               50     1E      50       5      100.0%
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
;;		line 53 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\main.c"
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
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
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
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\main.c"
	line	53
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	55
	
l15818:	
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
	
l15820:	
# 57 "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\main.c"
nop ;#
psect	maintext
	line	60
	
l15822:	
;main.c: 60: TRISC = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	61
	
l15824:	
;main.c: 61: TRISB |= 0x70;
	movlw	(070h)
	iorwf	(134)^080h,f	;volatile
	line	63
	
l15826:	
;main.c: 63: RC0=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	65
	
l15828:	
;main.c: 65: IIC_Init();
	fcall	_IIC_Init
	line	66
	
l15830:	
;main.c: 66: key_Init();
	fcall	_key_Init
	line	67
	
l15832:	
;main.c: 67: RF_Init();
	fcall	_RF_Init
	line	68
	
l15834:	
;main.c: 68: RF_Set_RxMode();
	fcall	_RF_Set_RxMode
	line	70
	
l15836:	
;main.c: 70: Timer1_Init(TIMER1_DIV_8);
	movlw	(030h)
	fcall	_Timer1_Init
	line	71
	
l15838:	
;main.c: 71: Timer1_start(10000,0);
	movlw	low(02710h)
	movwf	(?_Timer1_start)
	movlw	high(02710h)
	movwf	((?_Timer1_start))+1
	clrf	0+(?_Timer1_start)+02h
	fcall	_Timer1_start
	line	74
	
l15840:	
;main.c: 74: for(i=0;i<12;i++)
	clrf	(main@i)
	
l15842:	
	movlw	(0Ch)
	subwf	(main@i),w
	skipc
	goto	u4831
	goto	u4830
u4831:
	goto	l15846
u4830:
	goto	l15852
	line	76
	
l15846:	
;main.c: 75: {
;main.c: 76: AT24C02_Read_Msg(i*6,control_id[i],6);
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
	
l15848:	
	incf	(main@i),f
	goto	l15842
	line	79
	
l15852:	
;main.c: 77: }
;main.c: 79: AT24C02_Read_Msg(100,channel_flag,3);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Read_Msg)
	movlw	(03h)
	movwf	0+(?_AT24C02_Read_Msg)+01h
	movlw	(064h)
	fcall	_AT24C02_Read_Msg
	line	81
	
l15854:	
;main.c: 81: for(i=0;i<12;i++)
	clrf	(main@i)
	
l15856:	
	movlw	(0Ch)
	subwf	(main@i),w
	skipc
	goto	u4841
	goto	u4840
u4841:
	goto	l15860
u4840:
	goto	l15868
	line	83
	
l15860:	
;main.c: 82: {
;main.c: 83: if(channel_flag[i]>=4)channel_flag[i]=0;
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
	goto	l15864
u4850:
	
l15862:	
	movf	(main@i),w
	addlw	_channel_flag&0ffh
	movwf	fsr0
	clrf	indf
	line	81
	
l15864:	
	incf	(main@i),f
	goto	l15856
	line	86
	
l15868:	
;main.c: 84: }
;main.c: 86: Enable_Interrupt();
	fcall	_Enable_Interrupt
	line	90
	
l15870:	
;main.c: 89: {
;main.c: 90: channel_set(0,KEY0.channel_status);
	movf	(_KEY0),w
	movwf	(?_channel_set)
	movlw	(0)
	fcall	_channel_set
	line	91
	
l15872:	
;main.c: 91: channel_set(1,KEY1.channel_status);
	movf	(_KEY1),w
	movwf	(?_channel_set)
	movlw	(01h)
	fcall	_channel_set
	line	92
	
l15874:	
;main.c: 92: channel_set(2,KEY2.channel_status);
	movf	(_KEY2),w
	movwf	(?_channel_set)
	movlw	(02h)
	fcall	_channel_set
	line	94
	
l15876:	
;main.c: 94: recive_task();
	fcall	_recive_task
	line	96
	
l15878:	
;main.c: 96: key_value_read();
	fcall	_key_value_read
	line	98
	
l15880:	
;main.c: 98: delay_task();
	fcall	_delay_task
	goto	l15870
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	100
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
;;		line 112 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\recive.c"
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
psect	text1100
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\recive.c"
	line	112
	global	__size_of_recive_task
	__size_of_recive_task	equ	__end_of_recive_task-_recive_task
	
_recive_task:	
	opt	stack 0
; Regs used in _recive_task: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	114
	
l15376:	
;recive.c: 113: unsigned char i;
;recive.c: 114: unsigned char match_flag=0;
	clrf	(recive_task@match_flag)
	line	115
;recive.c: 115: unsigned char flag_led=0;
	clrf	(recive_task@flag_led)
	line	118
;recive.c: 116: unsigned char msg[6];
;recive.c: 118: switch(sys_stute)
	goto	l15816
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
	
l15378:	
;recive.c: 123: if(key_long_flag==0x11)
	movf	(_key_long_flag),w
	xorlw	011h
	skipz
	goto	u3981
	goto	u3980
u3981:
	goto	l15392
u3980:
	line	125
	
l15380:	
;recive.c: 124: {
;recive.c: 125: key_long_flag=0;
	clrf	(_key_long_flag)
	line	126
;recive.c: 126: KEY0.key_flag_5s=0;
	clrf	0+(_KEY0)+02h
	line	127
;recive.c: 127: for(i=0;i<24;i++)
	clrf	(recive_task@i)
	
l15382:	
	movlw	(018h)
	subwf	(recive_task@i),w
	skipc
	goto	u3991
	goto	u3990
u3991:
	goto	l15386
u3990:
	goto	l15420
	line	129
	
l15386:	
;recive.c: 128: {
;recive.c: 129: AT24C02_Write_Byte(i,0xff);
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
	
l15388:	
	incf	(recive_task@i),f
	goto	l15382
	line	133
	
l15392:	
;recive.c: 133: else if(key_long_flag==0x21)
	movf	(_key_long_flag),w
	xorlw	021h
	skipz
	goto	u4001
	goto	u4000
u4001:
	goto	l15406
u4000:
	line	135
	
l15394:	
;recive.c: 134: {
;recive.c: 135: key_long_flag=0;
	clrf	(_key_long_flag)
	line	136
;recive.c: 136: KEY1.key_flag_5s=0;
	clrf	0+(_KEY1)+02h
	line	137
;recive.c: 137: for(i=0;i<24;i++)
	clrf	(recive_task@i)
	
l15396:	
	movlw	(018h)
	subwf	(recive_task@i),w
	skipc
	goto	u4011
	goto	u4010
u4011:
	goto	l15400
u4010:
	goto	l15420
	line	139
	
l15400:	
;recive.c: 138: {
;recive.c: 139: AT24C02_Write_Byte(i+24,0xff);
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
	
l15402:	
	incf	(recive_task@i),f
	goto	l15396
	line	143
	
l15406:	
;recive.c: 143: else if(key_long_flag==0x41)
	movf	(_key_long_flag),w
	xorlw	041h
	skipz
	goto	u4021
	goto	u4020
u4021:
	goto	l15420
u4020:
	line	145
	
l15408:	
;recive.c: 144: {
;recive.c: 145: key_long_flag=0;
	clrf	(_key_long_flag)
	line	146
;recive.c: 146: KEY2.key_flag_5s=0;
	clrf	0+(_KEY2)+02h
	line	147
;recive.c: 147: for(i=0;i<24;i++)
	clrf	(recive_task@i)
	
l15410:	
	movlw	(018h)
	subwf	(recive_task@i),w
	skipc
	goto	u4031
	goto	u4030
u4031:
	goto	l15414
u4030:
	goto	l15420
	line	149
	
l15414:	
;recive.c: 148: {
;recive.c: 149: AT24C02_Write_Byte(i+48,0xff);
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
	
l15416:	
	incf	(recive_task@i),f
	goto	l15410
	line	153
	
l15420:	
;recive.c: 151: }
;recive.c: 152: }
;recive.c: 153: for(i=0;i<12;i++)
	clrf	(recive_task@i)
	
l15422:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u4041
	goto	u4040
u4041:
	goto	l15426
u4040:
	goto	l9841
	line	155
	
l15426:	
;recive.c: 154: {
;recive.c: 155: AT24C02_Read_Msg(i*6,control_id[i],6);
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
	
l15428:	
	incf	(recive_task@i),f
	goto	l15422
	
l9841:	
	line	157
;recive.c: 156: }
;recive.c: 157: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	158
	
l15432:	
;recive.c: 158: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	159
	
l15434:	
;recive.c: 159: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15436:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	160
;recive.c: 160: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	161
	
l15438:	
;recive.c: 161: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15440:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	162
;recive.c: 162: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	163
	
l15442:	
;recive.c: 163: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15444:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	164
	
l15446:	
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
;recive.c: 169: match_channel_flag|=0x01;
	bsf	(_match_channel_flag)+(0/8),(0)&7
	line	170
	
l15448:	
;recive.c: 170: if(key_long_flag==0x11)
	movf	(_key_long_flag),w
	xorlw	011h
	skipz
	goto	u4051
	goto	u4050
u4051:
	goto	l15454
u4050:
	line	172
	
l15450:	
;recive.c: 171: {
;recive.c: 172: KEY0.key_flag_3s=0;
	clrf	0+(_KEY0)+01h
	line	173
;recive.c: 173: flag_5s_add=0;
	clrf	(_flag_5s_add)
	clrf	(_flag_5s_add+1)
	line	174
;recive.c: 174: key_long_flag=0;
	clrf	(_key_long_flag)
	line	175
	
l15452:	
;recive.c: 175: match_channel_flag=0x10;
	movlw	(010h)
	movwf	(_match_channel_flag)
	line	176
;recive.c: 176: }
	goto	l15466
	line	177
	
l15454:	
;recive.c: 177: else if(key_long_flag==0x21)
	movf	(_key_long_flag),w
	xorlw	021h
	skipz
	goto	u4061
	goto	u4060
u4061:
	goto	l15460
u4060:
	line	179
	
l15456:	
;recive.c: 178: {
;recive.c: 179: KEY1.key_flag_3s=0;
	clrf	0+(_KEY1)+01h
	line	181
;recive.c: 181: flag_5s_add=0;
	clrf	(_flag_5s_add)
	clrf	(_flag_5s_add+1)
	line	182
;recive.c: 182: key_long_flag=0;
	clrf	(_key_long_flag)
	line	183
	
l15458:	
;recive.c: 183: match_channel_flag=0x20;
	movlw	(020h)
	movwf	(_match_channel_flag)
	line	184
;recive.c: 184: }
	goto	l15466
	line	185
	
l15460:	
;recive.c: 185: else if(key_long_flag==0x41)
	movf	(_key_long_flag),w
	xorlw	041h
	skipz
	goto	u4071
	goto	u4070
u4071:
	goto	l15466
u4070:
	line	187
	
l15462:	
;recive.c: 186: {
;recive.c: 187: KEY2.key_flag_3s=0;
	clrf	0+(_KEY2)+01h
	line	188
;recive.c: 188: flag_5s_add=0;
	clrf	(_flag_5s_add)
	clrf	(_flag_5s_add+1)
	line	189
;recive.c: 189: key_long_flag=0;
	clrf	(_key_long_flag)
	line	190
	
l15464:	
;recive.c: 190: match_channel_flag=0x40;
	movlw	(040h)
	movwf	(_match_channel_flag)
	line	200
	
l15466:	
;recive.c: 191: }
;recive.c: 200: if(rx_data())
	fcall	_rx_data
	xorlw	0
	skipnz
	goto	u4081
	goto	u4080
u4081:
	goto	l15646
u4080:
	line	202
	
l15468:	
;recive.c: 201: {
;recive.c: 202: msg[0]=rf_buf[3];
	movf	0+(_rf_buf)+03h,w
	movwf	(recive_task@msg)
	line	203
;recive.c: 203: msg[1]=rf_buf[4];
	movf	0+(_rf_buf)+04h,w
	movwf	0+(recive_task@msg)+01h
	line	204
;recive.c: 204: msg[2]=rf_buf[5];
	movf	0+(_rf_buf)+05h,w
	movwf	0+(recive_task@msg)+02h
	line	205
;recive.c: 205: msg[3]=rf_buf[6];
	movf	0+(_rf_buf)+06h,w
	movwf	0+(recive_task@msg)+03h
	line	206
;recive.c: 206: msg[4]=rf_buf[10];
	movf	0+(_rf_buf)+0Ah,w
	movwf	0+(recive_task@msg)+04h
	line	207
;recive.c: 207: msg[5]=rf_buf[2];
	movf	0+(_rf_buf)+02h,w
	movwf	0+(recive_task@msg)+05h
	line	208
;recive.c: 208: if(msg[4]!=0xff)
	movf	0+(recive_task@msg)+04h,w
	xorlw	0FFh
	skipnz
	goto	u4091
	goto	u4090
u4091:
	goto	l9939
u4090:
	line	210
	
l15470:	
;recive.c: 209: {
;recive.c: 210: if(match_channel_flag&0x10)
	btfss	(_match_channel_flag),(4)&7
	goto	u4101
	goto	u4100
u4101:
	goto	l9851
u4100:
	line	212
	
l15472:	
;recive.c: 211: {
;recive.c: 212: for(i=0;i<4;i++)
	clrf	(recive_task@i)
	
l15474:	
	movlw	(04h)
	subwf	(recive_task@i),w
	skipc
	goto	u4111
	goto	u4110
u4111:
	goto	l15478
u4110:
	goto	l15498
	line	219
	
l15478:	
;recive.c: 213: {
;recive.c: 214: if((msg[0]==control_id[i][0])
;recive.c: 215: &&(msg[1]==control_id[i][1])
;recive.c: 216: &&(msg[2]==control_id[i][2])
;recive.c: 217: &&(msg[3]==control_id[i][3])
;recive.c: 218: &&(msg[4]==control_id[i][4])
;recive.c: 219: )
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
	goto	l15492
u4120:
	
l15480:	
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
	goto	l15492
u4130:
	
l15482:	
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
	goto	l15492
u4140:
	
l15484:	
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
	goto	l15492
u4150:
	
l15486:	
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
	goto	l15492
u4160:
	line	221
	
l15488:	
;recive.c: 220: {
;recive.c: 221: match_flag=1;
	clrf	(recive_task@match_flag)
	incf	(recive_task@match_flag),f
	line	222
;recive.c: 222: break;
	goto	l15498
	line	226
	
l15492:	
;recive.c: 224: else
;recive.c: 225: {
;recive.c: 226: match_flag=0;
	clrf	(recive_task@match_flag)
	line	212
	
l15494:	
	incf	(recive_task@i),f
	goto	l15474
	line	229
	
l15498:	
;recive.c: 227: }
;recive.c: 228: }
;recive.c: 229: if(match_flag==0)
	movf	(recive_task@match_flag),f
	skipz
	goto	u4171
	goto	u4170
u4171:
	goto	l9856
u4170:
	line	231
	
l15500:	
;recive.c: 230: {
;recive.c: 231: AT24C02_Write_Msg(0+channel_flag[0]*6,msg,6);
	movlw	(recive_task@msg)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	movlw	(06h)
	movwf	0+(?_AT24C02_Write_Msg)+01h
	movlw	(06h)
	movwf	(?___bmul)
	movf	(_channel_flag),w
	fcall	___bmul
	fcall	_AT24C02_Write_Msg
	line	232
	
l15502:	
;recive.c: 232: for(i=0;i<6;i++)
	clrf	(recive_task@i)
	
l15504:	
	movlw	(06h)
	subwf	(recive_task@i),w
	skipc
	goto	u4181
	goto	u4180
u4181:
	goto	l15508
u4180:
	goto	l15514
	line	234
	
l15508:	
;recive.c: 233: {
;recive.c: 234: control_id[channel_flag[0]][i]=msg[i];
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
	line	232
	
l15510:	
	incf	(recive_task@i),f
	goto	l15504
	line	236
	
l15514:	
;recive.c: 235: }
;recive.c: 236: channel_flag[0]++;
	incf	(_channel_flag),f
	line	237
	
l15516:	
;recive.c: 237: if(channel_flag[0]>=4)channel_flag[0]=0;
	movlw	(04h)
	subwf	(_channel_flag),w
	skipc
	goto	u4191
	goto	u4190
u4191:
	goto	l9856
u4190:
	
l15518:	
	clrf	(_channel_flag)
	line	238
	
l9856:	
	line	239
;recive.c: 238: }
;recive.c: 239: key_long_flag=0;
	clrf	(_key_long_flag)
	line	240
;recive.c: 240: }
	goto	l15616
	line	241
	
l9851:	
;recive.c: 241: else if(match_channel_flag&0x20)
	btfss	(_match_channel_flag),(5)&7
	goto	u4201
	goto	u4200
u4201:
	goto	l9861
u4200:
	line	243
	
l15520:	
;recive.c: 242: {
;recive.c: 243: for(i=0;i<4;i++)
	clrf	(recive_task@i)
	
l15522:	
	movlw	(04h)
	subwf	(recive_task@i),w
	skipc
	goto	u4211
	goto	u4210
u4211:
	goto	l15526
u4210:
	goto	l15546
	line	250
	
l15526:	
;recive.c: 244: {
;recive.c: 245: if((msg[0]==control_id[i+4][0])
;recive.c: 246: &&(msg[1]==control_id[i+4][1])
;recive.c: 247: &&(msg[2]==control_id[i+4][2])
;recive.c: 248: &&(msg[3]==control_id[i+4][3])
;recive.c: 249: &&(msg[4]==control_id[i+4][4])
;recive.c: 250: )
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
	goto	l15540
u4220:
	
l15528:	
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
	goto	l15540
u4230:
	
l15530:	
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
	goto	l15540
u4240:
	
l15532:	
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
	goto	l15540
u4250:
	
l15534:	
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
	goto	l15540
u4260:
	line	252
	
l15536:	
;recive.c: 251: {
;recive.c: 252: match_flag=1;
	clrf	(recive_task@match_flag)
	incf	(recive_task@match_flag),f
	line	253
;recive.c: 253: break;
	goto	l15546
	line	257
	
l15540:	
;recive.c: 255: else
;recive.c: 256: {
;recive.c: 257: match_flag=0;
	clrf	(recive_task@match_flag)
	line	243
	
l15542:	
	incf	(recive_task@i),f
	goto	l15522
	line	260
	
l15546:	
;recive.c: 258: }
;recive.c: 259: }
;recive.c: 260: if(match_flag==0)
	movf	(recive_task@match_flag),f
	skipz
	goto	u4271
	goto	u4270
u4271:
	goto	l9856
u4270:
	line	262
	
l15548:	
;recive.c: 261: {
;recive.c: 262: AT24C02_Write_Msg(24+channel_flag[1]*6,msg,6);
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
	line	263
	
l15550:	
;recive.c: 263: for(i=0;i<6;i++)
	clrf	(recive_task@i)
	
l15552:	
	movlw	(06h)
	subwf	(recive_task@i),w
	skipc
	goto	u4281
	goto	u4280
u4281:
	goto	l15556
u4280:
	goto	l15562
	line	265
	
l15556:	
;recive.c: 264: {
;recive.c: 265: control_id[channel_flag[1]+4][i]=msg[i];
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
	line	263
	
l15558:	
	incf	(recive_task@i),f
	goto	l15552
	line	267
	
l15562:	
;recive.c: 266: }
;recive.c: 267: channel_flag[1]++;
	incf	0+(_channel_flag)+01h,f
	line	268
	
l15564:	
;recive.c: 268: if(channel_flag[1]>=4)channel_flag[1]=0;
	movlw	(04h)
	subwf	0+(_channel_flag)+01h,w
	skipc
	goto	u4291
	goto	u4290
u4291:
	goto	l9856
u4290:
	
l15566:	
	clrf	0+(_channel_flag)+01h
	goto	l9856
	line	272
	
l9861:	
;recive.c: 272: else if(match_channel_flag&0x40)
	btfss	(_match_channel_flag),(6)&7
	goto	u4301
	goto	u4300
u4301:
	goto	l15616
u4300:
	line	275
	
l15568:	
;recive.c: 273: {
;recive.c: 275: for(i=0;i<4;i++)
	clrf	(recive_task@i)
	
l15570:	
	movlw	(04h)
	subwf	(recive_task@i),w
	skipc
	goto	u4311
	goto	u4310
u4311:
	goto	l15574
u4310:
	goto	l15594
	line	282
	
l15574:	
;recive.c: 276: {
;recive.c: 277: if((msg[0]==control_id[i+8][0])
;recive.c: 278: &&(msg[1]==control_id[i+8][1])
;recive.c: 279: &&(msg[2]==control_id[i+8][2])
;recive.c: 280: &&(msg[3]==control_id[i+8][3])
;recive.c: 281: &&(msg[4]==control_id[i+8][4])
;recive.c: 282: )
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
	goto	l15588
u4320:
	
l15576:	
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
	goto	l15588
u4330:
	
l15578:	
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
	goto	l15588
u4340:
	
l15580:	
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
	goto	l15588
u4350:
	
l15582:	
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
	goto	l15588
u4360:
	line	284
	
l15584:	
;recive.c: 283: {
;recive.c: 284: match_flag=1;
	clrf	(recive_task@match_flag)
	incf	(recive_task@match_flag),f
	line	285
;recive.c: 285: break;
	goto	l15594
	line	289
	
l15588:	
;recive.c: 287: else
;recive.c: 288: {
;recive.c: 289: match_flag=0;
	clrf	(recive_task@match_flag)
	line	275
	
l15590:	
	incf	(recive_task@i),f
	goto	l15570
	line	292
	
l15594:	
;recive.c: 290: }
;recive.c: 291: }
;recive.c: 292: if(match_flag==0)
	movf	(recive_task@match_flag),f
	skipz
	goto	u4371
	goto	u4370
u4371:
	goto	l9856
u4370:
	line	294
	
l15596:	
;recive.c: 293: {
;recive.c: 294: AT24C02_Write_Msg(48+channel_flag[2]*6,msg,6);
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
	line	295
	
l15598:	
;recive.c: 295: for(i=0;i<6;i++)
	clrf	(recive_task@i)
	
l15600:	
	movlw	(06h)
	subwf	(recive_task@i),w
	skipc
	goto	u4381
	goto	u4380
u4381:
	goto	l15604
u4380:
	goto	l15610
	line	297
	
l15604:	
;recive.c: 296: {
;recive.c: 297: control_id[channel_flag[2]+8][i]=msg[i];
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
	line	295
	
l15606:	
	incf	(recive_task@i),f
	goto	l15600
	line	299
	
l15610:	
;recive.c: 298: }
;recive.c: 299: channel_flag[2]++;
	incf	0+(_channel_flag)+02h,f
	line	300
	
l15612:	
;recive.c: 300: if(channel_flag[2]>=4)channel_flag[2]=0;
	movlw	(04h)
	subwf	0+(_channel_flag)+02h,w
	skipc
	goto	u4391
	goto	u4390
u4391:
	goto	l9856
u4390:
	
l15614:	
	clrf	0+(_channel_flag)+02h
	goto	l9856
	line	305
	
l15616:	
;recive.c: 303: }
;recive.c: 305: AT24C02_Write_Msg(100,channel_flag,3);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	movlw	(03h)
	movwf	0+(?_AT24C02_Write_Msg)+01h
	movlw	(064h)
	fcall	_AT24C02_Write_Msg
	line	306
	
l15618:	
;recive.c: 306: AT24C02_Write_Msg(100,channel_flag,3);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	movlw	(03h)
	movwf	0+(?_AT24C02_Write_Msg)+01h
	movlw	(064h)
	fcall	_AT24C02_Write_Msg
	line	308
;recive.c: 308: for(i=0;i<12;i++)
	clrf	(recive_task@i)
	
l15620:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u4401
	goto	u4400
u4401:
	goto	l15624
u4400:
	goto	l15630
	line	310
	
l15624:	
;recive.c: 309: {
;recive.c: 310: AT24C02_Read_Msg(i*6,control_id[i],6);
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
	line	308
	
l15626:	
	incf	(recive_task@i),f
	goto	l15620
	line	312
	
l15630:	
;recive.c: 311: }
;recive.c: 312: AT24C02_Read_Msg(100,channel_flag,3);
	movlw	(_channel_flag)&0ffh
	movwf	(?_AT24C02_Read_Msg)
	movlw	(03h)
	movwf	0+(?_AT24C02_Read_Msg)+01h
	movlw	(064h)
	fcall	_AT24C02_Read_Msg
	line	314
	
l15632:	
;recive.c: 314: sys_stute=1;
	clrf	(_sys_stute)
	incf	(_sys_stute),f
	line	316
	
l15634:	
;recive.c: 316: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15636:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	317
	
l15638:	
;recive.c: 317: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	318
	
l15640:	
;recive.c: 318: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15642:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	319
	
l15644:	
;recive.c: 319: match_channel_flag=0;
	clrf	(_match_channel_flag)
	goto	l9939
	line	324
	
l15646:	
;recive.c: 322: else
;recive.c: 323: {
;recive.c: 324: if(flag_5s_add>500)
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
	line	326
	
l15648:	
;recive.c: 325: {
;recive.c: 326: sys_stute=1;
	clrf	(_sys_stute)
	incf	(_sys_stute),f
	goto	l15644
	line	333
	
l15652:	
;recive.c: 332: {
;recive.c: 333: if(rx_data())
	fcall	_rx_data
	xorlw	0
	skipnz
	goto	u4421
	goto	u4420
u4421:
	goto	l9939
u4420:
	line	335
	
l15654:	
;recive.c: 334: {
;recive.c: 335: if(rf_buf[10]!=0xff)
	movf	0+(_rf_buf)+0Ah,w
	xorlw	0FFh
	skipnz
	goto	u4431
	goto	u4430
u4431:
	goto	l15734
u4430:
	line	337
	
l15656:	
;recive.c: 336: {
;recive.c: 337: for(i=0;i<12;i++)
	clrf	(recive_task@i)
	
l15658:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u4441
	goto	u4440
u4441:
	goto	l15662
u4440:
	goto	l15812
	line	342
	
l15662:	
;recive.c: 338: {
;recive.c: 339: if((rf_buf[3]==control_id[i][0])
;recive.c: 340: &&(rf_buf[4]==control_id[i][1])
;recive.c: 341: &&(rf_buf[5]==control_id[i][2])
;recive.c: 342: &&(rf_buf[6]==control_id[i][3]))
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
	goto	l15730
u4450:
	
l15664:	
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
	goto	l15730
u4460:
	
l15666:	
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
	goto	l15730
u4470:
	
l15668:	
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
	goto	l15730
u4480:
	line	344
	
l15670:	
;recive.c: 343: {
;recive.c: 344: if(rf_buf[2]!=control_id[i][5])
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
	goto	l15730
u4490:
	line	346
	
l15672:	
;recive.c: 345: {
;recive.c: 346: control_id[i][5]=rf_buf[2];
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	movwf	indf
	line	347
;recive.c: 347: if(rf_buf[10]==control_id[i][4])
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
	goto	l15730
u4500:
	line	349
	
l15674:	
;recive.c: 348: {
;recive.c: 349: if(flag_led==0)
	movf	(recive_task@flag_led),f
	skipz
	goto	u4511
	goto	u4510
u4511:
	goto	l15684
u4510:
	line	351
	
l15676:	
;recive.c: 350: {
;recive.c: 351: flag_led=1;
	clrf	(recive_task@flag_led)
	incf	(recive_task@flag_led),f
	line	352
;recive.c: 352: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	353
	
l15678:	
;recive.c: 353: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	354
	
l15680:	
;recive.c: 354: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15682:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	357
	
l15684:	
;recive.c: 355: }
;recive.c: 357: if(rf_buf[11]==0)
	movf	0+(_rf_buf)+0Bh,f
	skipz
	goto	u4521
	goto	u4520
u4521:
	goto	l15714
u4520:
	line	359
	
l15686:	
;recive.c: 358: {
;recive.c: 359: if(i<4)
	movlw	(04h)
	subwf	(recive_task@i),w
	skipnc
	goto	u4531
	goto	u4530
u4531:
	goto	l15696
u4530:
	line	361
	
l15688:	
;recive.c: 360: {
;recive.c: 361: if((KEY0_FLAG==0))
	movf	(_KEY0_FLAG),f
	skipz
	goto	u4541
	goto	u4540
u4541:
	goto	l15730
u4540:
	line	363
	
l15690:	
;recive.c: 362: {
;recive.c: 363: if(rf_buf[9]==2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u4551
	goto	u4550
u4551:
	goto	l15694
u4550:
	line	364
	
l15692:	
;recive.c: 364: KEY0.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY0),f
	goto	l15730
	line	366
	
l15694:	
;recive.c: 365: else
;recive.c: 366: KEY0.channel_status=rf_buf[9]; }
	movf	0+(_rf_buf)+09h,w
	movwf	(_KEY0)
	goto	l15730
	line	368
	
l15696:	
;recive.c: 368: else if(i<8)
	movlw	(08h)
	subwf	(recive_task@i),w
	skipnc
	goto	u4561
	goto	u4560
u4561:
	goto	l15706
u4560:
	line	370
	
l15698:	
;recive.c: 369: {
;recive.c: 370: if((KEY1_FLAG==0))
	movf	(_KEY1_FLAG),f
	skipz
	goto	u4571
	goto	u4570
u4571:
	goto	l15730
u4570:
	line	372
	
l15700:	
;recive.c: 371: {
;recive.c: 372: if(rf_buf[9]==2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u4581
	goto	u4580
u4581:
	goto	l15704
u4580:
	line	373
	
l15702:	
;recive.c: 373: KEY1.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY1),f
	goto	l15730
	line	375
	
l15704:	
;recive.c: 374: else
;recive.c: 375: KEY1.channel_status=rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	(_KEY1)
	goto	l15730
	line	381
	
l15706:	
;recive.c: 379: else
;recive.c: 380: {
;recive.c: 381: if((KEY2_FLAG==0))
	movf	(_KEY2_FLAG),f
	skipz
	goto	u4591
	goto	u4590
u4591:
	goto	l9907
u4590:
	line	383
	
l15708:	
;recive.c: 382: {
;recive.c: 383: if(rf_buf[9]==2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u4601
	goto	u4600
u4601:
	goto	l15712
u4600:
	line	384
	
l15710:	
;recive.c: 384: KEY2.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY2),f
	goto	l15730
	line	386
	
l15712:	
;recive.c: 385: else
;recive.c: 386: KEY2.channel_status=rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	(_KEY2)
	goto	l15730
	line	394
	
l15714:	
;recive.c: 392: else
;recive.c: 393: {
;recive.c: 394: flag_5min_add=0;
	clrf	(_flag_5min_add)
	clrf	(_flag_5min_add+1)
	line	395
	
l15716:	
;recive.c: 395: if(delay_flag==1)
	decf	(_delay_flag),w
	skipz
	goto	u4611
	goto	u4610
u4611:
	goto	l15720
u4610:
	line	397
	
l15718:	
;recive.c: 396: {
;recive.c: 397: channel_delay[0]=0;
	clrf	(_channel_delay)
	line	398
;recive.c: 398: delay_flag=0;
	clrf	(_delay_flag)
	line	400
	
l15720:	
;recive.c: 399: }
;recive.c: 400: if(i<4)
	movlw	(04h)
	subwf	(recive_task@i),w
	skipnc
	goto	u4621
	goto	u4620
u4621:
	goto	l15724
u4620:
	line	402
	
l15722:	
;recive.c: 401: {
;recive.c: 402: channel_delay[0]|=0x01;
	bsf	(_channel_delay)+(0/8),(0)&7
	line	403
;recive.c: 403: }
	goto	l15728
	line	404
	
l15724:	
;recive.c: 404: else if(i<8)
	movlw	(08h)
	subwf	(recive_task@i),w
	skipnc
	goto	u4631
	goto	u4630
u4631:
	goto	l9911
u4630:
	line	406
	
l15726:	
;recive.c: 405: {
;recive.c: 406: channel_delay[0]|=0x02;
	bsf	(_channel_delay)+(1/8),(1)&7
	line	407
;recive.c: 407: }
	goto	l15728
	line	408
	
l9911:	
	line	410
;recive.c: 408: else
;recive.c: 409: {
;recive.c: 410: channel_delay[0]|=0x04;
	bsf	(_channel_delay)+(2/8),(2)&7
	line	412
	
l15728:	
;recive.c: 411: }
;recive.c: 412: channel_delay[1]=rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	0+(_channel_delay)+01h
	line	413
;recive.c: 413: channel_delay[2]=rf_buf[11];
	movf	0+(_rf_buf)+0Bh,w
	movwf	0+(_channel_delay)+02h
	goto	l15730
	line	414
	
l9907:	
	line	337
	
l15730:	
	incf	(recive_task@i),f
	goto	l15658
	line	425
	
l15734:	
;recive.c: 421: else
;recive.c: 422: {
;recive.c: 424: {
;recive.c: 425: for(i=0;i<12;i++)
	clrf	(recive_task@i)
	
l15736:	
	movlw	(0Ch)
	subwf	(recive_task@i),w
	skipc
	goto	u4641
	goto	u4640
u4641:
	goto	l15740
u4640:
	goto	l15812
	line	430
	
l15740:	
;recive.c: 426: {
;recive.c: 427: if((rf_buf[3]==control_id[i][0])
;recive.c: 428: &&(rf_buf[4]==control_id[i][1])
;recive.c: 429: &&(rf_buf[5]==control_id[i][2])
;recive.c: 430: &&(rf_buf[6]==control_id[i][3]))
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
	goto	l15808
u4650:
	
l15742:	
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
	goto	l15808
u4660:
	
l15744:	
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
	goto	l15808
u4670:
	
l15746:	
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
	goto	l15808
u4680:
	line	432
	
l15748:	
;recive.c: 431: {
;recive.c: 432: if((rf_buf[2]!=control_id[i][5]))
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
	goto	l15808
u4690:
	line	434
	
l15750:	
;recive.c: 433: {
;recive.c: 434: control_id[i][5]=rf_buf[2];
	movlw	(06h)
	movwf	(?___bmul)
	movf	(recive_task@i),w
	fcall	___bmul
	addlw	_control_id+05h&0ffh
	movwf	fsr0
	movf	0+(_rf_buf)+02h,w
	movwf	indf
	line	435
	
l15752:	
;recive.c: 435: if(flag_led==0)
	movf	(recive_task@flag_led),f
	skipz
	goto	u4701
	goto	u4700
u4701:
	goto	l15762
u4700:
	line	437
	
l15754:	
;recive.c: 436: {
;recive.c: 437: flag_led=1;
	clrf	(recive_task@flag_led)
	incf	(recive_task@flag_led),f
	line	438
;recive.c: 438: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	439
	
l15756:	
;recive.c: 439: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	440
	
l15758:	
;recive.c: 440: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l15760:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	442
	
l15762:	
;recive.c: 441: }
;recive.c: 442: if((rf_buf[11]==0))
	movf	0+(_rf_buf)+0Bh,f
	skipz
	goto	u4711
	goto	u4710
u4711:
	goto	l15792
u4710:
	line	445
	
l15764:	
;recive.c: 443: {
;recive.c: 445: if(i<4)
	movlw	(04h)
	subwf	(recive_task@i),w
	skipnc
	goto	u4721
	goto	u4720
u4721:
	goto	l15774
u4720:
	line	447
	
l15766:	
;recive.c: 446: {
;recive.c: 447: if((KEY0_FLAG==0))
	movf	(_KEY0_FLAG),f
	skipz
	goto	u4731
	goto	u4730
u4731:
	goto	l15808
u4730:
	line	449
	
l15768:	
;recive.c: 448: {
;recive.c: 449: if(rf_buf[9]==2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u4741
	goto	u4740
u4741:
	goto	l15772
u4740:
	line	450
	
l15770:	
;recive.c: 450: KEY0.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY0),f
	goto	l15808
	line	452
	
l15772:	
;recive.c: 451: else
;recive.c: 452: KEY0.channel_status=rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	(_KEY0)
	goto	l15808
	line	455
	
l15774:	
;recive.c: 455: else if(i<8)
	movlw	(08h)
	subwf	(recive_task@i),w
	skipnc
	goto	u4751
	goto	u4750
u4751:
	goto	l15784
u4750:
	line	457
	
l15776:	
;recive.c: 456: {
;recive.c: 457: if((KEY1_FLAG==0))
	movf	(_KEY1_FLAG),f
	skipz
	goto	u4761
	goto	u4760
u4761:
	goto	l15808
u4760:
	line	459
	
l15778:	
;recive.c: 458: {
;recive.c: 459: if(rf_buf[9]==2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u4771
	goto	u4770
u4771:
	goto	l15782
u4770:
	line	460
	
l15780:	
;recive.c: 460: KEY1.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY1),f
	goto	l15808
	line	462
	
l15782:	
;recive.c: 461: else
;recive.c: 462: KEY1.channel_status=rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	(_KEY1)
	goto	l15808
	line	467
	
l15784:	
;recive.c: 465: else
;recive.c: 466: {
;recive.c: 467: if((KEY2_FLAG==0))
	movf	(_KEY2_FLAG),f
	skipz
	goto	u4781
	goto	u4780
u4781:
	goto	l9933
u4780:
	line	469
	
l15786:	
;recive.c: 468: {
;recive.c: 469: if(rf_buf[9]==2)
	movf	0+(_rf_buf)+09h,w
	xorlw	02h
	skipz
	goto	u4791
	goto	u4790
u4791:
	goto	l15790
u4790:
	line	470
	
l15788:	
;recive.c: 470: KEY2.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY2),f
	goto	l15808
	line	472
	
l15790:	
;recive.c: 471: else
;recive.c: 472: KEY2.channel_status=rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	(_KEY2)
	goto	l15808
	line	478
	
l15792:	
;recive.c: 476: else
;recive.c: 477: {
;recive.c: 478: flag_5min_add=0;
	clrf	(_flag_5min_add)
	clrf	(_flag_5min_add+1)
	line	479
	
l15794:	
;recive.c: 479: if(delay_flag==1)
	decf	(_delay_flag),w
	skipz
	goto	u4801
	goto	u4800
u4801:
	goto	l15798
u4800:
	line	481
	
l15796:	
;recive.c: 480: {
;recive.c: 481: channel_delay[0]=0;
	clrf	(_channel_delay)
	line	482
;recive.c: 482: delay_flag=0;
	clrf	(_delay_flag)
	line	484
	
l15798:	
;recive.c: 483: }
;recive.c: 484: if(i<4)
	movlw	(04h)
	subwf	(recive_task@i),w
	skipnc
	goto	u4811
	goto	u4810
u4811:
	goto	l15802
u4810:
	line	486
	
l15800:	
;recive.c: 485: {
;recive.c: 486: channel_delay[0]|=0x01;
	bsf	(_channel_delay)+(0/8),(0)&7
	line	487
;recive.c: 487: }
	goto	l15806
	line	488
	
l15802:	
;recive.c: 488: else if(i<8)
	movlw	(08h)
	subwf	(recive_task@i),w
	skipnc
	goto	u4821
	goto	u4820
u4821:
	goto	l9937
u4820:
	line	490
	
l15804:	
;recive.c: 489: {
;recive.c: 490: channel_delay[0]|=0x02;
	bsf	(_channel_delay)+(1/8),(1)&7
	line	491
;recive.c: 491: }
	goto	l15806
	line	492
	
l9937:	
	line	494
;recive.c: 492: else
;recive.c: 493: {
;recive.c: 494: channel_delay[0]|=0x04;
	bsf	(_channel_delay)+(2/8),(2)&7
	line	496
	
l15806:	
;recive.c: 495: }
;recive.c: 496: channel_delay[1]=rf_buf[9];
	movf	0+(_rf_buf)+09h,w
	movwf	0+(_channel_delay)+01h
	line	497
;recive.c: 497: channel_delay[2]=rf_buf[11];
	movf	0+(_rf_buf)+0Bh,w
	movwf	0+(_channel_delay)+02h
	goto	l15808
	line	498
	
l9933:	
	line	425
	
l15808:	
	incf	(recive_task@i),f
	goto	l15736
	line	508
	
l15812:	
;recive.c: 498: }
;recive.c: 500: }
;recive.c: 501: }
;recive.c: 502: }
;recive.c: 503: }
;recive.c: 506: }
;recive.c: 508: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	509
;recive.c: 509: RF_ClearFIFO();
	fcall	_RF_ClearFIFO
	line	510
;recive.c: 510: RF_ClearStatus();
	fcall	_RF_ClearStatus
	goto	l9939
	line	118
	
l15816:	
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
	goto	l15652
	xorlw	2^1	; case 2
	skipnz
	goto	l9843
	xorlw	3^2	; case 3
	skipnz
	goto	l9828
	goto	l9939
	opt asmopt_on

	line	516
	
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
;;		line 69 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\recive.c"
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
psect	text1101
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\recive.c"
	line	69
	global	__size_of_rx_data
	__size_of_rx_data	equ	__end_of_rx_data-_rx_data
	
_rx_data:	
;; using string table level
	opt	stack 1
; Regs used in _rx_data: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	70
	
l15310:	
;recive.c: 70: unsigned char rx_flag=0;
	clrf	(rx_data@rx_flag)
	line	72
;recive.c: 72: unsigned char i=0;
	clrf	(rx_data@i)
	line	73
;recive.c: 73: unsigned int crc16=0;
	clrf	(rx_data@crc16)
	clrf	(rx_data@crc16+1)
	line	75
	
l15312:	
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
	goto	l15372
u3850:
	line	77
	
l15314:	
;recive.c: 76: {
;recive.c: 77: for(i=0;i<18;i++)
	clrf	(rx_data@i)
	line	79
	
l15320:	
;recive.c: 78: {
;recive.c: 79: rf_buf[i]=rf_buf[i]^crc_2_4G_lib[3+i]^ble_crc_38[21+i];
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
	
l15322:	
	incf	(rx_data@i),f
	
l15324:	
	movlw	(012h)
	subwf	(rx_data@i),w
	skipc
	goto	u3861
	goto	u3860
u3861:
	goto	l15320
u3860:
	line	81
	
l15326:	
;recive.c: 80: }
;recive.c: 81: crc16 = rf_buf[16]+rf_buf[17]*256;
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
	
l15328:	
;recive.c: 82: for(i=0;i<16;i++)
	clrf	(rx_data@i)
	line	84
	
l15334:	
;recive.c: 83: {
;recive.c: 84: rf_buf[i]=rf_buf[i]^crc_lab[i];
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
	
l15336:	
	incf	(rx_data@i),f
	
l15338:	
	movlw	(010h)
	subwf	(rx_data@i),w
	skipc
	goto	u3871
	goto	u3870
u3871:
	goto	l15334
u3870:
	line	86
	
l15340:	
;recive.c: 85: }
;recive.c: 86: rand = rf_buf[15];
	movf	0+(_rf_buf)+0Fh,w
	movwf	(rx_data@rand)
	line	87
;recive.c: 87: for(i=7;i<15;i++)
	movlw	(07h)
	movwf	(rx_data@i)
	line	89
	
l15344:	
;recive.c: 88: {
;recive.c: 89: rf_buf[i]^=rand;
	movf	(rx_data@i),w
	addlw	_rf_buf&0ffh
	movwf	fsr0
	movf	(rx_data@rand),w
	xorwf	indf,f
	line	87
	
l15346:	
	incf	(rx_data@i),f
	
l15348:	
	movlw	(0Fh)
	subwf	(rx_data@i),w
	skipc
	goto	u3881
	goto	u3880
u3881:
	goto	l15344
u3880:
	line	91
	
l15350:	
;recive.c: 90: }
;recive.c: 91: if(crc16 ==UpdateCRC(rf_buf,16) )
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
	goto	l15372
u3890:
	line	93
	
l15352:	
;recive.c: 92: {
;recive.c: 93: if((rf_buf[3]==0)&&(rf_buf[4]==0)&&(rf_buf[5]==0)&&(rf_buf[6]==0))
	movf	0+(_rf_buf)+03h,f
	skipz
	goto	u3901
	goto	u3900
u3901:
	goto	l15362
u3900:
	
l15354:	
	movf	0+(_rf_buf)+04h,f
	skipz
	goto	u3911
	goto	u3910
u3911:
	goto	l15362
u3910:
	
l15356:	
	movf	0+(_rf_buf)+05h,f
	skipz
	goto	u3921
	goto	u3920
u3921:
	goto	l15362
u3920:
	
l15358:	
	movf	0+(_rf_buf)+06h,f
	skipz
	goto	u3931
	goto	u3930
u3931:
	goto	l15362
u3930:
	line	95
	
l15360:	
;recive.c: 94: {
;recive.c: 95: rx_flag=0;
	clrf	(rx_data@rx_flag)
	line	96
;recive.c: 96: }
	goto	l15372
	line	97
	
l15362:	
;recive.c: 97: else if((rf_buf[3]==0xff)&&(rf_buf[4]==0xff)&&(rf_buf[5]==0xff)&&(rf_buf[6]==0xff))
	movf	0+(_rf_buf)+03h,w
	xorlw	0FFh
	skipz
	goto	u3941
	goto	u3940
u3941:
	goto	l9822
u3940:
	
l15364:	
	movf	0+(_rf_buf)+04h,w
	xorlw	0FFh
	skipz
	goto	u3951
	goto	u3950
u3951:
	goto	l9822
u3950:
	
l15366:	
	movf	0+(_rf_buf)+05h,w
	xorlw	0FFh
	skipz
	goto	u3961
	goto	u3960
u3961:
	goto	l9822
u3960:
	
l15368:	
	movf	0+(_rf_buf)+06h,w
	xorlw	0FFh
	skipz
	goto	u3971
	goto	u3970
u3971:
	goto	l9822
u3970:
	goto	l15360
	line	101
	
l9822:	
	line	102
;recive.c: 101: else
;recive.c: 102: rx_flag=1;
	clrf	(rx_data@rx_flag)
	incf	(rx_data@rx_flag),f
	line	106
	
l15372:	
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
;;		line 53 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\e2prom.c"
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
;;		_main
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1102
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\e2prom.c"
	line	53
	global	__size_of_AT24C02_Read_Msg
	__size_of_AT24C02_Read_Msg	equ	__end_of_AT24C02_Read_Msg-_AT24C02_Read_Msg
	
_AT24C02_Read_Msg:	
	opt	stack 0
; Regs used in _AT24C02_Read_Msg: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;AT24C02_Read_Msg@addr stored from wreg
	movwf	(AT24C02_Read_Msg@addr)
	line	54
	
l15298:	
;e2prom.c: 54: unsigned char i=0;
	clrf	(AT24C02_Read_Msg@i)
	line	55
;e2prom.c: 55: for(i=0;i<len;i++)
	clrf	(AT24C02_Read_Msg@i)
	goto	l15308
	line	57
	
l15300:	
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
	
l15302:	
;e2prom.c: 58: addr++;
	incf	(AT24C02_Read_Msg@addr),f
	line	59
	
l15304:	
;e2prom.c: 59: soft_delay_ms(1);
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	55
	
l15306:	
	incf	(AT24C02_Read_Msg@i),f
	
l15308:	
	movf	(AT24C02_Read_Msg@len),w
	subwf	(AT24C02_Read_Msg@i),w
	skipc
	goto	u3841
	goto	u3840
u3841:
	goto	l15300
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
;;		line 21 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\e2prom.c"
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
psect	text1103
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\e2prom.c"
	line	21
	global	__size_of_AT24C02_Read_Byte
	__size_of_AT24C02_Read_Byte	equ	__end_of_AT24C02_Read_Byte-_AT24C02_Read_Byte
	
_AT24C02_Read_Byte:	
	opt	stack 0
; Regs used in _AT24C02_Read_Byte: [wreg+status,2+status,0+pclath+cstack]
;AT24C02_Read_Byte@addr stored from wreg
	movwf	(AT24C02_Read_Byte@addr)
	line	22
	
l14458:	
	line	23
	
l14460:	
;e2prom.c: 23: IIC_START();
	fcall	_IIC_START
	line	25
	
l14462:	
;e2prom.c: 25: I2C_SendByte(0XA0);
	movlw	(0A0h)
	fcall	_I2C_SendByte
	line	26
	
l14464:	
;e2prom.c: 26: IIC_Wait_ACK();
	fcall	_IIC_Wait_ACK
	line	27
	
l14466:	
;e2prom.c: 27: I2C_SendByte(addr);
	movf	(AT24C02_Read_Byte@addr),w
	fcall	_I2C_SendByte
	line	28
	
l14468:	
;e2prom.c: 28: IIC_Wait_ACK();
	fcall	_IIC_Wait_ACK
	line	31
	
l14470:	
;e2prom.c: 31: IIC_START();
	fcall	_IIC_START
	line	32
	
l14472:	
;e2prom.c: 32: I2C_SendByte(0XA1);
	movlw	(0A1h)
	fcall	_I2C_SendByte
	line	33
	
l14474:	
;e2prom.c: 33: IIC_Wait_ACK();
	fcall	_IIC_Wait_ACK
	line	34
	
l14476:	
;e2prom.c: 34: temp = I2C_ReadByte(1);
	movlw	(01h)
	fcall	_I2C_ReadByte
	movf	(0+(?_I2C_ReadByte)),w
	movwf	(AT24C02_Read_Byte@temp)
	line	35
	
l14478:	
;e2prom.c: 35: IIC_STOP();
	fcall	_IIC_STOP
	line	37
	
l14480:	
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
;;		line 41 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\e2prom.c"
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
psect	text1104
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\e2prom.c"
	line	41
	global	__size_of_AT24C02_Write_Msg
	__size_of_AT24C02_Write_Msg	equ	__end_of_AT24C02_Write_Msg-_AT24C02_Write_Msg
	
_AT24C02_Write_Msg:	
	opt	stack 1
; Regs used in _AT24C02_Write_Msg: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;AT24C02_Write_Msg@addr stored from wreg
	movwf	(AT24C02_Write_Msg@addr)
	line	42
	
l15286:	
;e2prom.c: 42: unsigned char i=0;
	clrf	(AT24C02_Write_Msg@i)
	line	43
;e2prom.c: 43: for(i=0;i<len;i++)
	clrf	(AT24C02_Write_Msg@i)
	goto	l15296
	line	45
	
l15288:	
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
	
l15290:	
;e2prom.c: 46: addr++;
	incf	(AT24C02_Write_Msg@addr),f
	line	47
	
l15292:	
;e2prom.c: 47: soft_delay_ms(5);
	movlw	05h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	43
	
l15294:	
	incf	(AT24C02_Write_Msg@i),f
	
l15296:	
	movf	(AT24C02_Write_Msg@len),w
	subwf	(AT24C02_Write_Msg@i),w
	skipc
	goto	u3831
	goto	u3830
u3831:
	goto	l15288
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
;;		line 134 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
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
psect	text1105
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
	line	134
	global	__size_of_RF_RxData
	__size_of_RF_RxData	equ	__end_of_RF_RxData-_RF_RxData
	
_RF_RxData:	
	opt	stack 0
; Regs used in _RF_RxData: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_RxData@payload_buff stored from wreg
	movwf	(RF_RxData@payload_buff)
	line	135
	
l15270:	
;rf297L.c: 135: if(!(RF_GetStatus() & 0X40))
	fcall	_RF_GetStatus
	movwf	(??_RF_RxData+0)+0
	btfsc	0+(??_RF_RxData+0)+0,(6)&7
	goto	u3821
	goto	u3820
u3821:
	goto	l15276
u3820:
	line	137
	
l15272:	
;rf297L.c: 136: {
;rf297L.c: 137: return 0;
	movlw	(0)
	goto	l5164
	line	139
	
l15276:	
;rf297L.c: 138: }
;rf297L.c: 139: RF_Read_Buff(0x61, payload_buff, length);
	movf	(RF_RxData@payload_buff),w
	movwf	(?_RF_Read_Buff)
	movf	(RF_RxData@length),w
	movwf	0+(?_RF_Read_Buff)+01h
	movlw	(061h)
	fcall	_RF_Read_Buff
	line	141
	
l15278:	
;rf297L.c: 141: RF_ClearFIFO();
	fcall	_RF_ClearFIFO
	line	142
	
l15280:	
;rf297L.c: 142: RF_ClearStatus();
	fcall	_RF_ClearStatus
	line	143
	
l15282:	
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
;;		line 117 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\iic.c"
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
psect	text1106
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\iic.c"
	line	117
	global	__size_of_I2C_ReadByte
	__size_of_I2C_ReadByte	equ	__end_of_I2C_ReadByte-_I2C_ReadByte
	
_I2C_ReadByte:	
	opt	stack 0
; Regs used in _I2C_ReadByte: [wreg+status,2+status,0+pclath+cstack]
;I2C_ReadByte@ack stored from wreg
	line	120
	movwf	(I2C_ReadByte@ack)
	
l14396:	
;iic.c: 118: unsigned char cnt;
;iic.c: 119: unsigned int data;
;iic.c: 120: {TRISC1=1,WPUC1=1;};
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1081/8)^080h,(1081)&7
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3193/8)^0180h,(3193)&7
	line	122
	
l14398:	
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
	
l14404:	
;iic.c: 125: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	127
	
l14406:	
;iic.c: 127: RC2=1;
	bsf	(58/8),(58)&7
	line	128
	
l14408:	
;iic.c: 128: data <<= 1;
	clrc
	rlf	(I2C_ReadByte@data),f
	rlf	(I2C_ReadByte@data+1),f
	line	129
	
l14410:	
;iic.c: 129: if(RC1)
	btfss	(57/8),(57)&7
	goto	u2701
	goto	u2700
u2701:
	goto	l14414
u2700:
	line	131
	
l14412:	
;iic.c: 130: {
;iic.c: 131: data |= 0x01;
	bsf	(I2C_ReadByte@data)+(0/8),(0)&7
	line	133
	
l14414:	
;iic.c: 132: }
;iic.c: 133: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	122
	
l14416:	
	incf	(I2C_ReadByte@cnt),f
	
l14418:	
	movlw	(08h)
	subwf	(I2C_ReadByte@cnt),w
	skipc
	goto	u2711
	goto	u2710
u2711:
	goto	l10640
u2710:
	line	135
	
l14420:	
;iic.c: 134: }
;iic.c: 135: if(ack == 0)
	movf	(I2C_ReadByte@ack),f
	skipz
	goto	u2721
	goto	u2720
u2721:
	goto	l14424
u2720:
	line	137
	
l14422:	
;iic.c: 136: {
;iic.c: 137: IIC_NACK();
	fcall	_IIC_NACK
	line	138
;iic.c: 138: }
	goto	l14426
	line	141
	
l14424:	
;iic.c: 139: else
;iic.c: 140: {
;iic.c: 141: IIC_ACK();
	fcall	_IIC_ACK
	line	143
	
l14426:	
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
;;		line 9 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\e2prom.c"
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
psect	text1107
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\e2prom.c"
	line	9
	global	__size_of_AT24C02_Write_Byte
	__size_of_AT24C02_Write_Byte	equ	__end_of_AT24C02_Write_Byte-_AT24C02_Write_Byte
	
_AT24C02_Write_Byte:	
	opt	stack 1
; Regs used in _AT24C02_Write_Byte: [wreg+status,2+status,0+pclath+cstack]
;AT24C02_Write_Byte@addr stored from wreg
	movwf	(AT24C02_Write_Byte@addr)
	line	10
	
l15268:	
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
;;		line 249 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
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
psect	text1108
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
	line	249
	global	__size_of_RF_ClearStatus
	__size_of_RF_ClearStatus	equ	__end_of_RF_ClearStatus-_RF_ClearStatus
	
_RF_ClearStatus:	
	opt	stack 2
; Regs used in _RF_ClearStatus: [wreg+status,2+status,0+pclath+cstack]
	line	250
	
l15266:	
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
;;		line 243 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
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
psect	text1109
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
	line	243
	global	__size_of_RF_ClearFIFO
	__size_of_RF_ClearFIFO	equ	__end_of_RF_ClearFIFO-_RF_ClearFIFO
	
_RF_ClearFIFO:	
	opt	stack 2
; Regs used in _RF_ClearFIFO: [wreg+status,2+status,0+pclath+cstack]
	line	244
	
l15264:	
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
;;		line 254 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
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
psect	text1110
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
	line	254
	global	__size_of_RF_GetStatus
	__size_of_RF_GetStatus	equ	__end_of_RF_GetStatus-_RF_GetStatus
	
_RF_GetStatus:	
	opt	stack 0
; Regs used in _RF_GetStatus: [wreg+status,2+status,0+pclath+cstack]
	line	255
	
l15260:	
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
;;		line 126 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\key_scan.c"
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
psect	text1111
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\key_scan.c"
	line	126
	global	__size_of_key_value_read
	__size_of_key_value_read	equ	__end_of_key_value_read-_key_value_read
	
_key_value_read:	
	opt	stack 3
; Regs used in _key_value_read: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	127
	
l14164:	
;key_scan.c: 127: key_scan();
	fcall	_key_scan
	line	128
	
l14166:	
;key_scan.c: 128: if(KEY0_FLAG==0x01)
	decf	(_KEY0_FLAG),w
	skipz
	goto	u2401
	goto	u2400
u2401:
	goto	l14208
u2400:
	line	131
	
l14168:	
;key_scan.c: 129: {
;key_scan.c: 131: if(flag_time_key0_add>=500)
	movlw	high(01F4h)
	subwf	(_flag_time_key0_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key0_add),w
	skipc
	goto	u2411
	goto	u2410
u2411:
	goto	l14196
u2410:
	line	133
	
l14170:	
;key_scan.c: 132: {
;key_scan.c: 133: if(key_long_flag==0x01)
	decf	(_key_long_flag),w
	skipz
	goto	u2421
	goto	u2420
u2421:
	goto	l7186
u2420:
	line	135
	
l14172:	
;key_scan.c: 134: {
;key_scan.c: 135: key_long_flag=0x10;
	movlw	(010h)
	movwf	(_key_long_flag)
	line	136
	
l14174:	
;key_scan.c: 136: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l14176:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	137
	
l14178:	
;key_scan.c: 137: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	138
	
l14180:	
;key_scan.c: 138: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l14182:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	139
	
l14184:	
;key_scan.c: 139: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	140
	
l14186:	
;key_scan.c: 140: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l14188:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	141
	
l14190:	
;key_scan.c: 141: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	142
	
l14192:	
;key_scan.c: 142: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l14194:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	goto	l7186
	line	143
	
l7182:	
	line	144
;key_scan.c: 143: }
;key_scan.c: 144: }
	goto	l7186
	line	145
	
l14196:	
;key_scan.c: 145: else if(flag_time_key0_add>=300)
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
	line	147
	
l14198:	
;key_scan.c: 146: {
;key_scan.c: 147: if(key_long_flag==0)
	movf	(_key_long_flag),f
	skipz
	goto	u2441
	goto	u2440
u2441:
	goto	l7186
u2440:
	line	149
	
l14200:	
;key_scan.c: 148: {
;key_scan.c: 149: key_long_flag=0x01;
	clrf	(_key_long_flag)
	incf	(_key_long_flag),f
	line	150
;key_scan.c: 150: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	goto	l14190
	line	158
	
l14208:	
;key_scan.c: 158: else if(KEY0_FLAG==0x03)
	movf	(_KEY0_FLAG),w
	xorlw	03h
	skipz
	goto	u2451
	goto	u2450
u2451:
	goto	l7186
u2450:
	line	160
	
l14210:	
;key_scan.c: 159: {
;key_scan.c: 160: KEY0_FLAG=0;
	clrf	(_KEY0_FLAG)
	line	162
	
l14212:	
;key_scan.c: 162: if((flag_time_key0_add<300))
	movlw	high(012Ch)
	subwf	(_flag_time_key0_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key0_add),w
	skipnc
	goto	u2461
	goto	u2460
u2461:
	goto	l14216
u2460:
	line	164
	
l14214:	
;key_scan.c: 163: {
;key_scan.c: 164: KEY0.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY0),f
	line	165
;key_scan.c: 165: }
	goto	l7186
	line	167
	
l14216:	
;key_scan.c: 167: else if(flag_time_key0_add<500)
	movlw	high(01F4h)
	subwf	(_flag_time_key0_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key0_add),w
	skipnc
	goto	u2471
	goto	u2470
u2471:
	goto	l14228
u2470:
	line	169
	
l14218:	
;key_scan.c: 168: {
;key_scan.c: 169: if(key_long_flag==0x01)
	decf	(_key_long_flag),w
	skipz
	goto	u2481
	goto	u2480
u2481:
	goto	l7182
u2480:
	line	171
	
l14220:	
;key_scan.c: 170: {
;key_scan.c: 171: KEY0.key_flag_3s=1;
	clrf	0+(_KEY0)+01h
	incf	0+(_KEY0)+01h,f
	line	172
	
l14222:	
;key_scan.c: 172: key_long_flag=0x11;
	movlw	(011h)
	movwf	(_key_long_flag)
	line	173
;key_scan.c: 173: sys_stute=2;
	movlw	(02h)
	movwf	(_sys_stute)
	line	174
	
l14224:	
;key_scan.c: 174: flag_time_key1_add=0;
	clrf	(_flag_time_key1_add)
	clrf	(_flag_time_key1_add+1)
	line	175
	
l14226:	
;key_scan.c: 175: flag_time_key2_add=0;
	clrf	(_flag_time_key2_add)
	clrf	(_flag_time_key2_add+1)
	goto	l7186
	line	180
	
l14228:	
;key_scan.c: 178: else
;key_scan.c: 179: {
;key_scan.c: 180: if(key_long_flag==0x10)
	movf	(_key_long_flag),w
	xorlw	010h
	skipz
	goto	u2491
	goto	u2490
u2491:
	goto	l7182
u2490:
	line	182
	
l14230:	
;key_scan.c: 181: {
;key_scan.c: 182: KEY0.key_flag_5s=1;
	clrf	0+(_KEY0)+02h
	incf	0+(_KEY0)+02h,f
	line	183
	
l14232:	
;key_scan.c: 183: key_long_flag=0x11;
	movlw	(011h)
	movwf	(_key_long_flag)
	line	184
;key_scan.c: 184: sys_stute=3;
	movlw	(03h)
	movwf	(_sys_stute)
	goto	l14224
	line	193
	
l7186:	
;key_scan.c: 187: }
;key_scan.c: 188: }
;key_scan.c: 190: }
;key_scan.c: 193: if(KEY1_FLAG==0x01)
	decf	(_KEY1_FLAG),w
	skipz
	goto	u2501
	goto	u2500
u2501:
	goto	l14282
u2500:
	line	196
	
l14238:	
;key_scan.c: 194: {
;key_scan.c: 196: if(flag_time_key1_add>=500)
	movlw	high(01F4h)
	subwf	(_flag_time_key1_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key1_add),w
	skipc
	goto	u2511
	goto	u2510
u2511:
	goto	l14266
u2510:
	line	198
	
l14240:	
;key_scan.c: 197: {
;key_scan.c: 198: if(key_long_flag==0x02)
	movf	(_key_long_flag),w
	xorlw	02h
	skipz
	goto	u2521
	goto	u2520
u2521:
	goto	l7200
u2520:
	line	200
	
l14242:	
;key_scan.c: 199: {
;key_scan.c: 200: key_long_flag=0x20;
	movlw	(020h)
	movwf	(_key_long_flag)
	line	201
	
l14244:	
;key_scan.c: 201: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l14246:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	202
	
l14248:	
;key_scan.c: 202: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	203
	
l14250:	
;key_scan.c: 203: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l14252:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	204
	
l14254:	
;key_scan.c: 204: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	205
	
l14256:	
;key_scan.c: 205: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l14258:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	206
	
l14260:	
;key_scan.c: 206: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	207
	
l14262:	
;key_scan.c: 207: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l14264:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	goto	l7200
	line	208
	
l7196:	
	line	209
;key_scan.c: 208: }
;key_scan.c: 209: }
	goto	l7200
	line	210
	
l14266:	
;key_scan.c: 210: else if(flag_time_key1_add>=300)
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
	line	212
	
l14268:	
;key_scan.c: 211: {
;key_scan.c: 212: if(key_long_flag==0)
	movf	(_key_long_flag),f
	skipz
	goto	u2541
	goto	u2540
u2541:
	goto	l7200
u2540:
	line	214
	
l14270:	
;key_scan.c: 213: {
;key_scan.c: 214: key_long_flag=0x02;
	movlw	(02h)
	movwf	(_key_long_flag)
	goto	l14256
	line	222
	
l14282:	
;key_scan.c: 222: else if(KEY1_FLAG==0x03)
	movf	(_KEY1_FLAG),w
	xorlw	03h
	skipz
	goto	u2551
	goto	u2550
u2551:
	goto	l7200
u2550:
	line	224
	
l14284:	
;key_scan.c: 223: {
;key_scan.c: 224: KEY1_FLAG=0;
	clrf	(_KEY1_FLAG)
	line	225
	
l14286:	
;key_scan.c: 225: if((flag_time_key1_add<300))
	movlw	high(012Ch)
	subwf	(_flag_time_key1_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key1_add),w
	skipnc
	goto	u2561
	goto	u2560
u2561:
	goto	l14290
u2560:
	line	227
	
l14288:	
;key_scan.c: 226: {
;key_scan.c: 227: KEY1.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY1),f
	line	228
;key_scan.c: 228: }
	goto	l7200
	line	230
	
l14290:	
;key_scan.c: 230: else if(flag_time_key1_add<500)
	movlw	high(01F4h)
	subwf	(_flag_time_key1_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key1_add),w
	skipnc
	goto	u2571
	goto	u2570
u2571:
	goto	l14302
u2570:
	line	232
	
l14292:	
;key_scan.c: 231: {
;key_scan.c: 232: if(key_long_flag==0x02)
	movf	(_key_long_flag),w
	xorlw	02h
	skipz
	goto	u2581
	goto	u2580
u2581:
	goto	l7196
u2580:
	line	234
	
l14294:	
;key_scan.c: 233: {
;key_scan.c: 234: KEY1.key_flag_3s=1;
	clrf	0+(_KEY1)+01h
	incf	0+(_KEY1)+01h,f
	line	235
	
l14296:	
;key_scan.c: 235: key_long_flag=0x21;
	movlw	(021h)
	movwf	(_key_long_flag)
	line	236
;key_scan.c: 236: sys_stute=2;
	movlw	(02h)
	movwf	(_sys_stute)
	line	237
	
l14298:	
;key_scan.c: 237: flag_time_key2_add=0;
	clrf	(_flag_time_key2_add)
	clrf	(_flag_time_key2_add+1)
	line	238
	
l14300:	
;key_scan.c: 238: flag_time_key0_add=0;
	clrf	(_flag_time_key0_add)
	clrf	(_flag_time_key0_add+1)
	goto	l7200
	line	243
	
l14302:	
;key_scan.c: 241: else
;key_scan.c: 242: {
;key_scan.c: 243: if(key_long_flag==0x20)
	movf	(_key_long_flag),w
	xorlw	020h
	skipz
	goto	u2591
	goto	u2590
u2591:
	goto	l7196
u2590:
	line	245
	
l14304:	
;key_scan.c: 244: {
;key_scan.c: 245: KEY1.key_flag_5s=1;
	clrf	0+(_KEY1)+02h
	incf	0+(_KEY1)+02h,f
	line	246
	
l14306:	
;key_scan.c: 246: key_long_flag=0x21;
	movlw	(021h)
	movwf	(_key_long_flag)
	line	247
;key_scan.c: 247: sys_stute=3;
	movlw	(03h)
	movwf	(_sys_stute)
	goto	l14298
	line	257
	
l7200:	
;key_scan.c: 250: }
;key_scan.c: 251: }
;key_scan.c: 254: }
;key_scan.c: 257: if(KEY2_FLAG==0x01)
	decf	(_KEY2_FLAG),w
	skipz
	goto	u2601
	goto	u2600
u2601:
	goto	l14356
u2600:
	line	261
	
l14312:	
;key_scan.c: 258: {
;key_scan.c: 261: if(flag_time_key2_add>=500)
	movlw	high(01F4h)
	subwf	(_flag_time_key2_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key2_add),w
	skipc
	goto	u2611
	goto	u2610
u2611:
	goto	l14340
u2610:
	line	263
	
l14314:	
;key_scan.c: 262: {
;key_scan.c: 263: if(key_long_flag==0x04)
	movf	(_key_long_flag),w
	xorlw	04h
	skipz
	goto	u2621
	goto	u2620
u2621:
	goto	l7222
u2620:
	line	265
	
l14316:	
;key_scan.c: 264: {
;key_scan.c: 265: key_long_flag=0x40;
	movlw	(040h)
	movwf	(_key_long_flag)
	line	266
	
l14318:	
;key_scan.c: 266: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l14320:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	267
	
l14322:	
;key_scan.c: 267: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	268
	
l14324:	
;key_scan.c: 268: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l14326:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	269
	
l14328:	
;key_scan.c: 269: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	270
	
l14330:	
;key_scan.c: 270: (TRISC0=0,RC0=0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l14332:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	271
	
l14334:	
;key_scan.c: 271: soft_delay_ms(100);
	movlw	064h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	272
	
l14336:	
;key_scan.c: 272: (TRISC0=0,RC0=1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1080/8)^080h,(1080)&7
	
l14338:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	goto	l7222
	line	276
	
l14340:	
;key_scan.c: 276: else if(flag_time_key2_add>=300)
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
	line	278
	
l14342:	
;key_scan.c: 277: {
;key_scan.c: 278: if(key_long_flag==0)
	movf	(_key_long_flag),f
	skipz
	goto	u2641
	goto	u2640
u2641:
	goto	l7211
u2640:
	line	280
	
l14344:	
;key_scan.c: 279: {
;key_scan.c: 280: key_long_flag=0x04;
	movlw	(04h)
	movwf	(_key_long_flag)
	goto	l14330
	line	287
	
l7211:	
;key_scan.c: 284: }
;key_scan.c: 285: }
;key_scan.c: 287: }
	goto	l7222
	line	288
	
l14356:	
;key_scan.c: 288: else if(KEY2_FLAG==0x03)
	movf	(_KEY2_FLAG),w
	xorlw	03h
	skipz
	goto	u2651
	goto	u2650
u2651:
	goto	l7222
u2650:
	line	290
	
l14358:	
;key_scan.c: 289: {
;key_scan.c: 290: KEY2_FLAG=0;
	clrf	(_KEY2_FLAG)
	line	291
	
l14360:	
;key_scan.c: 291: if((flag_time_key2_add<300))
	movlw	high(012Ch)
	subwf	(_flag_time_key2_add+1),w
	movlw	low(012Ch)
	skipnz
	subwf	(_flag_time_key2_add),w
	skipnc
	goto	u2661
	goto	u2660
u2661:
	goto	l14364
u2660:
	line	293
	
l14362:	
;key_scan.c: 292: {
;key_scan.c: 293: KEY2.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY2),f
	line	294
;key_scan.c: 294: }
	goto	l7222
	line	297
	
l14364:	
;key_scan.c: 297: else if(flag_time_key2_add<500)
	movlw	high(01F4h)
	subwf	(_flag_time_key2_add+1),w
	movlw	low(01F4h)
	skipnz
	subwf	(_flag_time_key2_add),w
	skipnc
	goto	u2671
	goto	u2670
u2671:
	goto	l14376
u2670:
	line	299
	
l14366:	
;key_scan.c: 298: {
;key_scan.c: 299: if(key_long_flag==0x04)
	movf	(_key_long_flag),w
	xorlw	04h
	skipz
	goto	u2681
	goto	u2680
u2681:
	goto	l7211
u2680:
	line	301
	
l14368:	
;key_scan.c: 300: {
;key_scan.c: 301: KEY2.key_flag_3s=1;
	clrf	0+(_KEY2)+01h
	incf	0+(_KEY2)+01h,f
	line	302
	
l14370:	
;key_scan.c: 302: key_long_flag=0x41;
	movlw	(041h)
	movwf	(_key_long_flag)
	line	303
;key_scan.c: 303: sys_stute=2;
	movlw	(02h)
	movwf	(_sys_stute)
	line	304
	
l14372:	
;key_scan.c: 304: flag_time_key1_add=0;
	clrf	(_flag_time_key1_add)
	clrf	(_flag_time_key1_add+1)
	line	305
	
l14374:	
;key_scan.c: 305: flag_time_key0_add=0;
	clrf	(_flag_time_key0_add)
	clrf	(_flag_time_key0_add+1)
	goto	l7222
	line	311
	
l14376:	
;key_scan.c: 309: else
;key_scan.c: 310: {
;key_scan.c: 311: if(key_long_flag==0x40)
	movf	(_key_long_flag),w
	xorlw	040h
	skipz
	goto	u2691
	goto	u2690
u2691:
	goto	l7211
u2690:
	line	313
	
l14378:	
;key_scan.c: 312: {
;key_scan.c: 313: KEY2.key_flag_5s=1;
	clrf	0+(_KEY2)+02h
	incf	0+(_KEY2)+02h,f
	line	314
	
l14380:	
;key_scan.c: 314: key_long_flag=0x41;
	movlw	(041h)
	movwf	(_key_long_flag)
	line	315
;key_scan.c: 315: sys_stute=3;
	movlw	(03h)
	movwf	(_sys_stute)
	goto	l14372
	line	323
	
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
;;		line 267 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
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
psect	text1112
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
	line	267
	global	__size_of_RF_Set_RxMode
	__size_of_RF_Set_RxMode	equ	__end_of_RF_Set_RxMode-_RF_Set_RxMode
	
_RF_Set_RxMode:	
	opt	stack 3
; Regs used in _RF_Set_RxMode: [wreg+status,2+status,0+pclath+cstack]
	line	268
	
l15256:	
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
	
l15258:	
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
;;		line 45 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
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
psect	text1113
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
	line	45
	global	__size_of_RF_Init
	__size_of_RF_Init	equ	__end_of_RF_Init-_RF_Init
	
_RF_Init:	
	opt	stack 3
; Regs used in _RF_Init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	75
	
l15206:	
	line	76
	
l15208:	
;rf297L.c: 76: SPI_init();
	fcall	_SPI_init
	line	77
	
l15210:	
;rf297L.c: 77: RF_WriteReg(0x53, 0x5A);
	movlw	(05Ah)
	movwf	(?_RF_WriteReg)
	movlw	(053h)
	fcall	_RF_WriteReg
	line	78
	
l15212:	
;rf297L.c: 78: RF_WriteReg(0x53, 0XA5);
	movlw	(0A5h)
	movwf	(?_RF_WriteReg)
	movlw	(053h)
	fcall	_RF_WriteReg
	line	79
	
l15214:	
;rf297L.c: 79: RF_WriteReg(0xE1, 0);
	clrf	(?_RF_WriteReg)
	movlw	(0E1h)
	fcall	_RF_WriteReg
	line	80
	
l15216:	
;rf297L.c: 80: RF_WriteReg(0xE2, 0);
	clrf	(?_RF_WriteReg)
	movlw	(0E2h)
	fcall	_RF_WriteReg
	line	81
	
l15218:	
;rf297L.c: 81: RF_WriteReg(0x20 + 0x07, 0x70);
	movlw	(070h)
	movwf	(?_RF_WriteReg)
	movlw	(027h)
	fcall	_RF_WriteReg
	line	82
	
l15220:	
;rf297L.c: 82: RF_WriteReg(0x20 + 0x02, 0x01);
	clrf	(?_RF_WriteReg)
	incf	(?_RF_WriteReg),f
	movlw	(022h)
	fcall	_RF_WriteReg
	line	83
	
l15222:	
;rf297L.c: 83: RF_WriteReg(0x20 + 0x03, 0x01);
	clrf	(?_RF_WriteReg)
	incf	(?_RF_WriteReg),f
	movlw	(023h)
	fcall	_RF_WriteReg
	line	84
	
l15224:	
;rf297L.c: 84: RF_WriteReg(0x20 + 0x05, 26);
	movlw	(01Ah)
	movwf	(?_RF_WriteReg)
	movlw	(025h)
	fcall	_RF_WriteReg
	line	85
	
l15226:	
;rf297L.c: 85: RF_WriteReg(0x20 + 0x11, 18);
	movlw	(012h)
	movwf	(?_RF_WriteReg)
	movlw	(031h)
	fcall	_RF_WriteReg
	line	86
	
l15228:	
;rf297L.c: 86: RF_Write_Buff(0x20 + 0x10, TX_ADDRESS_DEF, sizeof(TX_ADDRESS_DEF));
	movlw	((_TX_ADDRESS_DEF-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(030h)
	fcall	_RF_Write_Buff
	line	87
	
l15230:	
;rf297L.c: 87: RF_Write_Buff(0x20 + 0x0A,RX_ADDRESS_DEF, sizeof(RX_ADDRESS_DEF));
	movlw	((_RX_ADDRESS_DEF-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(02Ah)
	fcall	_RF_Write_Buff
	line	88
	
l15232:	
;rf297L.c: 88: RF_Write_Buff(0x20 + 0x1F, BB_cal_data, sizeof(BB_cal_data));
	movlw	((RF_Init@BB_cal_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(05h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(03Fh)
	fcall	_RF_Write_Buff
	line	89
	
l15234:	
;rf297L.c: 89: RF_Write_Buff(0x20 + 0x1A, RF_cal2_data, sizeof(RF_cal2_data));
	movlw	((RF_Init@RF_cal2_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(06h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(03Ah)
	fcall	_RF_Write_Buff
	line	90
	
l15236:	
;rf297L.c: 90: RF_Write_Buff(0x20 + 0x19, Dem_cal_data, sizeof(Dem_cal_data));
	movlw	((RF_Init@Dem_cal_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	clrf	0+(?_RF_Write_Buff)+01h
	incf	0+(?_RF_Write_Buff)+01h,f
	movlw	(039h)
	fcall	_RF_Write_Buff
	line	91
	
l15238:	
;rf297L.c: 91: RF_Write_Buff(0x20 + 0x1E, RF_cal_data, sizeof(RF_cal_data));
	movlw	((RF_Init@RF_cal_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(03Eh)
	fcall	_RF_Write_Buff
	line	92
	
l15240:	
;rf297L.c: 92: RF_Write_Buff(0x20 + 0x1B, Dem_cal2_data,sizeof(Dem_cal2_data));
	movlw	((RF_Init@Dem_cal2_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(03Bh)
	fcall	_RF_Write_Buff
	line	93
	
l15242:	
;rf297L.c: 93: RF_WriteReg(0x20 + 0x1C, 0x00);
	clrf	(?_RF_WriteReg)
	movlw	(03Ch)
	fcall	_RF_WriteReg
	line	94
	
l15244:	
;rf297L.c: 94: RF_WriteReg(0x20 + 0x06, (0x0e |0X00));
	movlw	(0Eh)
	movwf	(?_RF_WriteReg)
	movlw	(026h)
	fcall	_RF_WriteReg
	line	95
	
l15246:	
;rf297L.c: 95: RF_WriteReg(0x50, 0x73);
	movlw	(073h)
	movwf	(?_RF_WriteReg)
	movlw	(050h)
	fcall	_RF_WriteReg
	line	101
	
l15248:	
;rf297L.c: 101: RF_WriteReg(0x20 + 0x04,0x00);
	clrf	(?_RF_WriteReg)
	movlw	(024h)
	fcall	_RF_WriteReg
	line	102
	
l15250:	
;rf297L.c: 102: RF_WriteReg(0x20 + 0x01, 0x00);
	clrf	(?_RF_WriteReg)
	movlw	(021h)
	fcall	_RF_WriteReg
	line	117
;rf297L.c: 113: if(18 >32){
	
l15254:	
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
;;		line 91 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\iic.c"
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
psect	text1114
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\iic.c"
	line	91
	global	__size_of_I2C_SendByte
	__size_of_I2C_SendByte	equ	__end_of_I2C_SendByte-_I2C_SendByte
	
_I2C_SendByte:	
	opt	stack 1
; Regs used in _I2C_SendByte: [wreg+status,2+status,0+pclath+cstack]
;I2C_SendByte@Data stored from wreg
	line	93
	movwf	(I2C_SendByte@Data)
	
l14092:	
;iic.c: 92: unsigned char cnt;
;iic.c: 93: TRISC1=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	94
	
l14094:	
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
	
l14100:	
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
	
l14102:	
;iic.c: 108: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	109
	
l14104:	
;iic.c: 109: RC2=0;
	bcf	(58/8),(58)&7
	line	110
;iic.c: 110: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	94
	
l14106:	
	incf	(I2C_SendByte@cnt),f
	
l14108:	
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
;;		line 78 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\iic.c"
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
psect	text1115
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\iic.c"
	line	78
	global	__size_of_IIC_NACK
	__size_of_IIC_NACK	equ	__end_of_IIC_NACK-_IIC_NACK
	
_IIC_NACK:	
	opt	stack 0
; Regs used in _IIC_NACK: [wreg+status,2+status,0+pclath+cstack]
	line	79
	
l14084:	
;iic.c: 79: RC1=1;
	bsf	(57/8),(57)&7
	line	80
	
l14086:	
;iic.c: 80: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	81
	
l14088:	
;iic.c: 81: RC2=1;
	bsf	(58/8),(58)&7
	line	82
;iic.c: 82: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	83
	
l14090:	
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
;;		line 67 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\iic.c"
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
psect	text1116
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\iic.c"
	line	67
	global	__size_of_IIC_ACK
	__size_of_IIC_ACK	equ	__end_of_IIC_ACK-_IIC_ACK
	
_IIC_ACK:	
	opt	stack 0
; Regs used in _IIC_ACK: [wreg+status,2+status,0+pclath+cstack]
	line	68
	
l14074:	
;iic.c: 68: TRISC1=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	69
;iic.c: 69: RC1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(57/8),(57)&7
	line	70
	
l14076:	
;iic.c: 70: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	71
	
l14078:	
;iic.c: 71: RC2=1;
	bsf	(58/8),(58)&7
	line	72
;iic.c: 72: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	73
	
l14080:	
;iic.c: 73: RC2=0;
	bcf	(58/8),(58)&7
	line	74
	
l14082:	
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
;;		line 42 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\iic.c"
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
psect	text1117
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\iic.c"
	line	42
	global	__size_of_IIC_Wait_ACK
	__size_of_IIC_Wait_ACK	equ	__end_of_IIC_Wait_ACK-_IIC_Wait_ACK
	
_IIC_Wait_ACK:	
	opt	stack 1
; Regs used in _IIC_Wait_ACK: [wreg+status,2+status,0+pclath+cstack]
	line	43
	
l14046:	
	line	44
	
l14048:	
;iic.c: 44: TRISC1=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1081/8)^080h,(1081)&7
	line	45
	
l14050:	
;iic.c: 45: RC1=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(57/8),(57)&7
	line	46
	
l14052:	
;iic.c: 46: {TRISC1=1,WPUC1=1;};
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1081/8)^080h,(1081)&7
	
l14054:	
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3193/8)^0180h,(3193)&7
	line	48
	
l14056:	
;iic.c: 48: RC2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	49
	
l14058:	
;iic.c: 49: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	50
	
l14060:	
;iic.c: 50: RC2=1;
	bsf	(58/8),(58)&7
	line	51
	
l14062:	
;iic.c: 51: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	53
	
l14064:	
;iic.c: 53: if(RC1)
	btfss	(57/8),(57)&7
	goto	u2371
	goto	u2370
u2371:
	goto	l14068
u2370:
	line	55
	
l14066:	
	line	56
;iic.c: 56: }
	goto	l14070
	line	59
	
l14068:	
	line	61
	
l14070:	
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
;;		line 32 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\iic.c"
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
psect	text1118
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\iic.c"
	line	32
	global	__size_of_IIC_STOP
	__size_of_IIC_STOP	equ	__end_of_IIC_STOP-_IIC_STOP
	
_IIC_STOP:	
	opt	stack 1
; Regs used in _IIC_STOP: [wreg+status,2+status,0+pclath+cstack]
	line	33
	
l14040:	
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
	
l14042:	
;iic.c: 36: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	37
	
l14044:	
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
;;		line 20 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\iic.c"
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
psect	text1119
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\iic.c"
	line	20
	global	__size_of_IIC_START
	__size_of_IIC_START	equ	__end_of_IIC_START-_IIC_START
	
_IIC_START:	
	opt	stack 1
; Regs used in _IIC_START: [wreg+status,2+status,0+pclath+cstack]
	line	21
	
l14032:	
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
	
l14034:	
;iic.c: 24: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	25
	
l14036:	
;iic.c: 25: RC1=0;
	bcf	(57/8),(57)&7
	line	26
;iic.c: 26: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	27
	
l14038:	
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
;;		line 28 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\key_scan.c"
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
psect	text1120
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\key_scan.c"
	global	__size_of_key_scan
	__size_of_key_scan	equ	__end_of_key_scan-_key_scan
	
_key_scan:	
	opt	stack 3
; Regs used in _key_scan: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	29
	
l13956:	
;key_scan.c: 29: if(RB1==0)
	btfsc	(49/8),(49)&7
	goto	u2191
	goto	u2190
u2191:
	goto	l7150
u2190:
	line	31
	
l13958:	
;key_scan.c: 30: {
;key_scan.c: 31: soft_delay_ms(10);
	movlw	0Ah
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	32
	
l13960:	
;key_scan.c: 32: if(RB1==0)
	btfsc	(49/8),(49)&7
	goto	u2201
	goto	u2200
u2201:
	goto	l13978
u2200:
	line	33
	
l13962:	
;key_scan.c: 33: if((KEY0_FLAG&0x01)==0)
	btfsc	(_KEY0_FLAG),(0)&7
	goto	u2211
	goto	u2210
u2211:
	goto	l13978
u2210:
	line	35
	
l13964:	
;key_scan.c: 34: {
;key_scan.c: 35: flag_time_key0_add=0;
	clrf	(_flag_time_key0_add)
	clrf	(_flag_time_key0_add+1)
	line	36
	
l13966:	
;key_scan.c: 36: KEY0_FLAG|=0X01;
	bsf	(_KEY0_FLAG)+(0/8),(0)&7
	line	37
	
l13968:	
;key_scan.c: 37: if(key_long_flag_add==0)
	movf	(_key_long_flag_add),f
	skipz
	goto	u2221
	goto	u2220
u2221:
	goto	l7151
u2220:
	line	38
	
l13970:	
;key_scan.c: 38: key_long_flag_add=1;
	clrf	(_key_long_flag_add)
	incf	(_key_long_flag_add),f
	goto	l13978
	line	40
	
l7151:	
;key_scan.c: 39: }
;key_scan.c: 40: }
	goto	l13978
	line	41
	
l7150:	
	line	43
;key_scan.c: 41: else
;key_scan.c: 42: {
;key_scan.c: 43: if(KEY0_FLAG&0x01)
	btfss	(_KEY0_FLAG),(0)&7
	goto	u2231
	goto	u2230
u2231:
	goto	l13978
u2230:
	line	45
	
l13972:	
;key_scan.c: 44: {
;key_scan.c: 45: KEY0_FLAG|=0X02;
	bsf	(_KEY0_FLAG)+(1/8),(1)&7
	line	46
	
l13974:	
;key_scan.c: 46: if(key_long_flag_add==1)key_long_flag_add=0;
	decf	(_key_long_flag_add),w
	skipz
	goto	u2241
	goto	u2240
u2241:
	goto	l13978
u2240:
	
l13976:	
	clrf	(_key_long_flag_add)
	line	50
	
l13978:	
;key_scan.c: 47: }
;key_scan.c: 48: }
;key_scan.c: 50: if(RB2==0)
	btfsc	(50/8),(50)&7
	goto	u2251
	goto	u2250
u2251:
	goto	l7157
u2250:
	line	52
	
l13980:	
;key_scan.c: 51: {
;key_scan.c: 52: soft_delay_ms(10);
	movlw	0Ah
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	53
	
l13982:	
;key_scan.c: 53: if(RB2==0)
	btfsc	(50/8),(50)&7
	goto	u2261
	goto	u2260
u2261:
	goto	l14000
u2260:
	line	54
	
l13984:	
;key_scan.c: 54: if((KEY1_FLAG&0x01)==0)
	btfsc	(_KEY1_FLAG),(0)&7
	goto	u2271
	goto	u2270
u2271:
	goto	l14000
u2270:
	line	56
	
l13986:	
;key_scan.c: 55: {
;key_scan.c: 56: flag_time_key1_add=0;
	clrf	(_flag_time_key1_add)
	clrf	(_flag_time_key1_add+1)
	line	57
	
l13988:	
;key_scan.c: 57: KEY1_FLAG|=0X01;
	bsf	(_KEY1_FLAG)+(0/8),(0)&7
	line	58
	
l13990:	
;key_scan.c: 58: if(key_long_flag_add==0)
	movf	(_key_long_flag_add),f
	skipz
	goto	u2281
	goto	u2280
u2281:
	goto	l7158
u2280:
	line	59
	
l13992:	
;key_scan.c: 59: key_long_flag_add=2;
	movlw	(02h)
	movwf	(_key_long_flag_add)
	goto	l14000
	line	62
	
l7158:	
;key_scan.c: 60: }
;key_scan.c: 62: }
	goto	l14000
	line	63
	
l7157:	
	line	65
;key_scan.c: 63: else
;key_scan.c: 64: {
;key_scan.c: 65: if(KEY1_FLAG&0x01)
	btfss	(_KEY1_FLAG),(0)&7
	goto	u2291
	goto	u2290
u2291:
	goto	l14000
u2290:
	line	67
	
l13994:	
;key_scan.c: 66: {
;key_scan.c: 67: KEY1_FLAG|=0X02;
	bsf	(_KEY1_FLAG)+(1/8),(1)&7
	line	68
	
l13996:	
;key_scan.c: 68: if(key_long_flag_add==2)key_long_flag_add=0;
	movf	(_key_long_flag_add),w
	xorlw	02h
	skipz
	goto	u2301
	goto	u2300
u2301:
	goto	l14000
u2300:
	
l13998:	
	clrf	(_key_long_flag_add)
	line	76
	
l14000:	
;key_scan.c: 69: }
;key_scan.c: 70: }
;key_scan.c: 76: if(RB3==0)
	btfsc	(51/8),(51)&7
	goto	u2311
	goto	u2310
u2311:
	goto	l7164
u2310:
	line	78
	
l14002:	
;key_scan.c: 77: {
;key_scan.c: 78: soft_delay_ms(10);
	movlw	0Ah
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	79
	
l14004:	
;key_scan.c: 79: if(RB3==0)
	btfsc	(51/8),(51)&7
	goto	u2321
	goto	u2320
u2321:
	goto	l14030
u2320:
	line	80
	
l14006:	
;key_scan.c: 80: if((KEY2_FLAG&0x01)==0)
	btfsc	(_KEY2_FLAG),(0)&7
	goto	u2331
	goto	u2330
u2331:
	goto	l14030
u2330:
	line	82
	
l14008:	
;key_scan.c: 81: {
;key_scan.c: 82: flag_time_key2_add=0;
	clrf	(_flag_time_key2_add)
	clrf	(_flag_time_key2_add+1)
	line	83
	
l14010:	
;key_scan.c: 83: KEY2_FLAG|=0X01;
	bsf	(_KEY2_FLAG)+(0/8),(0)&7
	line	84
	
l14012:	
;key_scan.c: 84: if(key_long_flag_add==0)
	movf	(_key_long_flag_add),f
	skipz
	goto	u2341
	goto	u2340
u2341:
	goto	l7168
u2340:
	line	85
	
l14014:	
;key_scan.c: 85: key_long_flag_add=4;
	movlw	(04h)
	movwf	(_key_long_flag_add)
	goto	l14030
	line	88
	
l7164:	
	line	90
;key_scan.c: 88: else
;key_scan.c: 89: {
;key_scan.c: 90: if(KEY2_FLAG&0x01)
	btfss	(_KEY2_FLAG),(0)&7
	goto	u2351
	goto	u2350
u2351:
	goto	l14030
u2350:
	line	92
	
l14016:	
;key_scan.c: 91: {
;key_scan.c: 92: KEY2_FLAG|=0X02;
	bsf	(_KEY2_FLAG)+(1/8),(1)&7
	line	93
	
l14018:	
;key_scan.c: 93: if(key_long_flag_add==4)key_long_flag_add=0;
	movf	(_key_long_flag_add),w
	xorlw	04h
	skipz
	goto	u2361
	goto	u2360
u2361:
	goto	l7168
u2360:
	
l14020:	
	clrf	(_key_long_flag_add)
	goto	l14030
	line	95
	
l7168:	
	line	98
;key_scan.c: 94: }
;key_scan.c: 95: }
;key_scan.c: 98: switch(key_long_flag_add)
	goto	l14030
	line	106
	
l14022:	
;key_scan.c: 105: {
;key_scan.c: 106: flag_time_key1_add=0;
	clrf	(_flag_time_key1_add)
	clrf	(_flag_time_key1_add+1)
	line	107
;key_scan.c: 107: flag_time_key2_add=0;
	clrf	(_flag_time_key2_add)
	clrf	(_flag_time_key2_add+1)
	line	108
;key_scan.c: 108: }break;
	goto	l7177
	line	111
	
l14024:	
;key_scan.c: 110: {
;key_scan.c: 111: flag_time_key0_add=0;
	clrf	(_flag_time_key0_add)
	clrf	(_flag_time_key0_add+1)
	line	112
;key_scan.c: 112: flag_time_key2_add=0;
	clrf	(_flag_time_key2_add)
	clrf	(_flag_time_key2_add+1)
	line	113
;key_scan.c: 113: }break;
	goto	l7177
	line	116
	
l14026:	
;key_scan.c: 115: {
;key_scan.c: 116: flag_time_key0_add=0;
	clrf	(_flag_time_key0_add)
	clrf	(_flag_time_key0_add+1)
	line	117
;key_scan.c: 117: flag_time_key1_add=0;
	clrf	(_flag_time_key1_add)
	clrf	(_flag_time_key1_add+1)
	line	118
;key_scan.c: 118: }break;
	goto	l7177
	line	98
	
l14030:	
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
	goto	l14022
	xorlw	2^1	; case 2
	skipnz
	goto	l14024
	xorlw	4^2	; case 4
	skipnz
	goto	l14026
	goto	l7177
	opt asmopt_on

	line	120
	
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
;;		line 306 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
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
psect	text1121
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
	line	306
	global	__size_of_RF_ReadReg
	__size_of_RF_ReadReg	equ	__end_of_RF_ReadReg-_RF_ReadReg
	
_RF_ReadReg:	
	opt	stack 0
; Regs used in _RF_ReadReg: [wreg+status,2+status,0+pclath+cstack]
;RF_ReadReg@reg_addr stored from wreg
	line	308
	movwf	(RF_ReadReg@reg_addr)
	
l15196:	
;rf297L.c: 307: unsigned char tmp;
;rf297L.c: 308: RE2=0;
	bcf	(74/8),(74)&7
	line	309
	
l15198:	
;rf297L.c: 309: SPI_RW(reg_addr);
	movf	(RF_ReadReg@reg_addr),w
	fcall	_SPI_RW
	line	310
;rf297L.c: 310: tmp = SPI_RW(0);
	movlw	(0)
	fcall	_SPI_RW
	movwf	(RF_ReadReg@tmp)
	line	311
	
l15200:	
;rf297L.c: 311: RE2=1;
	bsf	(74/8),(74)&7
	line	312
	
l15202:	
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
;;		line 275 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
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
psect	text1122
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
	line	275
	global	__size_of_RF_Read_Buff
	__size_of_RF_Read_Buff	equ	__end_of_RF_Read_Buff-_RF_Read_Buff
	
_RF_Read_Buff:	
	opt	stack 1
; Regs used in _RF_Read_Buff: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_Read_Buff@reg_addr stored from wreg
	line	277
	movwf	(RF_Read_Buff@reg_addr)
	
l15184:	
;rf297L.c: 276: unsigned char byte_ctr;
;rf297L.c: 277: RE2=0;
	bcf	(74/8),(74)&7
	line	278
	
l15186:	
;rf297L.c: 278: SPI_RW(reg_addr);
	movf	(RF_Read_Buff@reg_addr),w
	fcall	_SPI_RW
	line	279
	
l15188:	
;rf297L.c: 279: for(byte_ctr=0;byte_ctr<length;byte_ctr++){
	clrf	(RF_Read_Buff@byte_ctr)
	goto	l15194
	line	280
	
l15190:	
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
	
l15192:	
	incf	(RF_Read_Buff@byte_ctr),f
	
l15194:	
	movf	(RF_Read_Buff@length),w
	subwf	(RF_Read_Buff@byte_ctr),w
	skipc
	goto	u3811
	goto	u3810
u3811:
	goto	l15190
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
;;		line 286 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
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
psect	text1123
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
	line	286
	global	__size_of_RF_Write_Buff
	__size_of_RF_Write_Buff	equ	__end_of_RF_Write_Buff-_RF_Write_Buff
	
_RF_Write_Buff:	
	opt	stack 3
; Regs used in _RF_Write_Buff: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_Write_Buff@reg_addr stored from wreg
	line	288
	movwf	(RF_Write_Buff@reg_addr)
	
l15172:	
;rf297L.c: 287: unsigned char i;
;rf297L.c: 288: RE2=0;
	bcf	(74/8),(74)&7
	line	289
	
l15174:	
;rf297L.c: 289: SPI_RW(reg_addr);
	movf	(RF_Write_Buff@reg_addr),w
	fcall	_SPI_RW
	line	290
	
l15176:	
;rf297L.c: 290: for(i=0;i<length;i++)
	clrf	(RF_Write_Buff@i)
	goto	l15182
	line	292
	
l15178:	
;rf297L.c: 291: {
;rf297L.c: 292: SPI_RW(pBuff[i]);
	movf	(RF_Write_Buff@i),w
	addwf	(RF_Write_Buff@pBuff),w
	movwf	fsr0
	fcall	stringdir
	fcall	_SPI_RW
	line	290
	
l15180:	
	incf	(RF_Write_Buff@i),f
	
l15182:	
	movf	(RF_Write_Buff@length),w
	subwf	(RF_Write_Buff@i),w
	skipc
	goto	u3801
	goto	u3800
u3801:
	goto	l15178
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
;;		line 298 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
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
psect	text1124
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
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
	
l15166:	
;rf297L.c: 299: RE2=0;
	bcf	(74/8),(74)&7
	line	300
	
l15168:	
;rf297L.c: 300: SPI_RW(reg_addr);
	movf	(RF_WriteReg@reg_addr),w
	fcall	_SPI_RW
	line	301
;rf297L.c: 301: SPI_RW(write_data);
	movf	(RF_WriteReg@write_data),w
	fcall	_SPI_RW
	line	302
	
l15170:	
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
;;		_main
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1125
	file	"F:\PAN2416\±‡“Î∆˜\±‡“Î∆˜\CMS_IDE_V1.41.03_CRC_PANCHIP\CMS_IDE_V1.41.03_CRC_PANCHIP\data\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 4
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	movwf	(___bmul@multiplier)
	line	4
	
l13884:	
	clrf	(___bmul@product)
	line	7
	
l13886:	
	btfss	(___bmul@multiplier),(0)&7
	goto	u2131
	goto	u2130
u2131:
	goto	l13890
u2130:
	line	8
	
l13888:	
	movf	(___bmul@multiplicand),w
	addwf	(___bmul@product),f
	line	9
	
l13890:	
	clrc
	rlf	(___bmul@multiplicand),f
	line	10
	
l13892:	
	clrc
	rrf	(___bmul@multiplier),f
	line	11
	
l13894:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u2141
	goto	u2140
u2141:
	goto	l13886
u2140:
	line	12
	
l13896:	
	movf	(___bmul@product),w
	line	13
	
l11301:	
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
;;		line 6 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\iic.c"
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
psect	text1126
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\iic.c"
	line	6
	global	__size_of_iic_delay_us
	__size_of_iic_delay_us	equ	__end_of_iic_delay_us-_iic_delay_us
	
_iic_delay_us:	
	opt	stack 1
; Regs used in _iic_delay_us: [wreg+status,2+status,0]
;iic_delay_us@delay stored from wreg
	movwf	(iic_delay_us@delay)
	line	7
	
l13880:	
;iic.c: 7: while(delay--);
	
l13882:	
	decf	(iic_delay_us@delay),f
	movf	((iic_delay_us@delay)),w
	xorlw	0FFh
	skipz
	goto	u2121
	goto	u2120
u2121:
	goto	l13882
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
;;		line 42 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\recive.c"
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
psect	text1127
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\recive.c"
	line	42
	global	__size_of_UpdateCRC
	__size_of_UpdateCRC	equ	__end_of_UpdateCRC-_UpdateCRC
	
_UpdateCRC:	
	opt	stack 3
; Regs used in _UpdateCRC: [wreg-fsr0h+status,2+status,0+btemp+1]
;UpdateCRC@CRC_input stored from wreg
	movwf	(UpdateCRC@CRC_input)
	line	43
	
l13852:	
;recive.c: 43: unsigned char i,k = 0;
	clrf	(UpdateCRC@k)
	line	44
	
l13854:	
;recive.c: 44: unsigned short CRC_acc=0x5555;
	movlw	low(05555h)
	movwf	(UpdateCRC@CRC_acc)
	movlw	high(05555h)
	movwf	((UpdateCRC@CRC_acc))+1
	line	46
;recive.c: 46: while (len--)
	goto	l13874
	line	48
	
l13856:	
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
	
l13858:	
	incf	(UpdateCRC@k),f
	line	50
	
l13860:	
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
	goto	l13870
u2090:
	line	54
	
l13866:	
;recive.c: 53: {
;recive.c: 54: CRC_acc = CRC_acc << 1;
	clrc
	rlf	(UpdateCRC@CRC_acc),f
	rlf	(UpdateCRC@CRC_acc+1),f
	line	55
	
l13868:	
;recive.c: 55: CRC_acc ^= 0x1021;
	movlw	low(01021h)
	xorwf	(UpdateCRC@CRC_acc),f
	movlw	high(01021h)
	xorwf	(UpdateCRC@CRC_acc+1),f
	line	56
;recive.c: 56: }
	goto	l9807
	line	59
	
l13870:	
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
	
l13872:	
	movlw	(08h)
	subwf	(UpdateCRC@i),w
	skipc
	goto	u2101
	goto	u2100
u2101:
	goto	l9804
u2100:
	line	46
	
l13874:	
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
	goto	l13856
u2110:
	line	63
	
l13876:	
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
;;		line 331 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
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
psect	text1128
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
	line	331
	global	__size_of_SPI_RW
	__size_of_SPI_RW	equ	__end_of_SPI_RW-_SPI_RW
	
_SPI_RW:	
	opt	stack 2
; Regs used in _SPI_RW: [wreg+status,2+status,0]
;SPI_RW@read_reg_addr stored from wreg
	line	333
	movwf	(SPI_RW@read_reg_addr)
	
l15148:	
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
	
l15154:	
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
	goto	l15158
u3780:
	line	348
	
l15156:	
;rf297L.c: 347: {
;rf297L.c: 348: read_reg_addr = read_reg_addr | 0x01;
	bsf	(SPI_RW@read_reg_addr)+(0/8),(0)&7
	line	333
	
l15158:	
	incf	(SPI_RW@i),f
	
l15160:	
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
	
l15162:	
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
;;		line 316 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
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
psect	text1129
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\rf297L.c"
	line	316
	global	__size_of_SPI_init
	__size_of_SPI_init	equ	__end_of_SPI_init-_SPI_init
	
_SPI_init:	
	opt	stack 4
; Regs used in _SPI_init: []
	line	318
	
l13832:	
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
;;		line 566 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\recive.c"
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
psect	text1130
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\recive.c"
	line	566
	global	__size_of_delay_task
	__size_of_delay_task	equ	__end_of_delay_task-_delay_task
	
_delay_task:	
	opt	stack 5
; Regs used in _delay_task: [wreg-fsr0h+status,2+status,0]
	line	568
	
l13744:	
;recive.c: 568: if(channel_delay[0]!=0)
	movf	(_channel_delay),w
	skipz
	goto	u1940
	goto	l9984
u1940:
	line	570
	
l13746:	
;recive.c: 569: {
;recive.c: 570: if(delay_flag==0)delay_flag=1;
	movf	(_delay_flag),f
	skipz
	goto	u1951
	goto	u1950
u1951:
	goto	l13750
u1950:
	
l13748:	
	clrf	(_delay_flag)
	incf	(_delay_flag),f
	line	571
	
l13750:	
;recive.c: 571: if(channel_delay[2]>0)
	movf	0+(_channel_delay)+02h,w
	skipz
	goto	u1960
	goto	l13802
u1960:
	line	573
	
l13752:	
;recive.c: 572: {
;recive.c: 573: if(flag_5min_add>=30000)
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
	line	575
	
l13754:	
;recive.c: 574: {
;recive.c: 575: flag_5min_add=0;
	clrf	(_flag_5min_add)
	clrf	(_flag_5min_add+1)
	line	576
	
l13756:	
;recive.c: 576: channel_delay[2]--;
	decf	0+(_channel_delay)+02h,f
	goto	l9984
	line	585
	
l13758:	
;recive.c: 584: {
;recive.c: 585: if(channel_delay[1]!=2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u1981
	goto	u1980
u1981:
	goto	l13762
u1980:
	line	586
	
l13760:	
;recive.c: 586: KEY0.channel_status=channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY0)
	goto	l13804
	line	588
	
l13762:	
;recive.c: 587: else
;recive.c: 588: KEY0.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY0),f
	goto	l13804
	line	594
	
l13764:	
;recive.c: 593: {
;recive.c: 594: if(channel_delay[1]!=2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u1991
	goto	u1990
u1991:
	goto	l13768
u1990:
	line	595
	
l13766:	
;recive.c: 595: KEY1.channel_status=channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY1)
	goto	l13804
	line	597
	
l13768:	
;recive.c: 596: else
;recive.c: 597: KEY1.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY1),f
	goto	l13804
	line	603
	
l13770:	
;recive.c: 602: {
;recive.c: 603: if(channel_delay[1]!=2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u2001
	goto	u2000
u2001:
	goto	l13774
u2000:
	line	604
	
l13772:	
;recive.c: 604: KEY2.channel_status=channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY2)
	goto	l13804
	line	606
	
l13774:	
;recive.c: 605: else
;recive.c: 606: KEY2.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY2),f
	goto	l13804
	line	611
	
l13776:	
;recive.c: 610: {
;recive.c: 611: if(channel_delay[1]!=2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u2011
	goto	u2010
u2011:
	goto	l13780
u2010:
	line	613
	
l13778:	
;recive.c: 612: {
;recive.c: 613: KEY0.channel_status=channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY0)
	line	614
;recive.c: 614: KEY1.channel_status=channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY1)
	line	615
;recive.c: 615: }
	goto	l13804
	line	618
	
l13780:	
;recive.c: 616: else
;recive.c: 617: {
;recive.c: 618: KEY0.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY0),f
	line	619
;recive.c: 619: KEY1.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY1),f
	goto	l13804
	line	624
	
l13782:	
;recive.c: 623: {
;recive.c: 624: if(channel_delay[1]!=2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u2021
	goto	u2020
u2021:
	goto	l13786
u2020:
	line	626
	
l13784:	
;recive.c: 625: {
;recive.c: 626: KEY0.channel_status=channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY0)
	line	627
;recive.c: 627: KEY2.channel_status=channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY2)
	line	628
;recive.c: 628: }
	goto	l13804
	line	631
	
l13786:	
;recive.c: 629: else
;recive.c: 630: {
;recive.c: 631: KEY0.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY0),f
	line	632
;recive.c: 632: KEY2.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY2),f
	goto	l13804
	line	637
	
l13788:	
;recive.c: 636: {
;recive.c: 637: if(channel_delay[1]!=2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u2031
	goto	u2030
u2031:
	goto	l13792
u2030:
	line	639
	
l13790:	
;recive.c: 638: {
;recive.c: 639: KEY1.channel_status=channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY1)
	line	640
;recive.c: 640: KEY2.channel_status=channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY2)
	line	641
;recive.c: 641: }
	goto	l13804
	line	644
	
l13792:	
;recive.c: 642: else
;recive.c: 643: {
;recive.c: 644: KEY1.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY1),f
	line	645
;recive.c: 645: KEY2.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY2),f
	goto	l13804
	line	650
	
l13794:	
;recive.c: 649: {
;recive.c: 650: if(channel_delay[1]!=2)
	movf	0+(_channel_delay)+01h,w
	xorlw	02h
	skipnz
	goto	u2041
	goto	u2040
u2041:
	goto	l13798
u2040:
	line	652
	
l13796:	
;recive.c: 651: {
;recive.c: 652: KEY0.channel_status=channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY0)
	line	653
;recive.c: 653: KEY1.channel_status=channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY1)
	line	654
;recive.c: 654: KEY2.channel_status=channel_delay[1];
	movf	0+(_channel_delay)+01h,w
	movwf	(_KEY2)
	line	655
;recive.c: 655: }
	goto	l13804
	line	658
	
l13798:	
;recive.c: 656: else
;recive.c: 657: {
;recive.c: 658: KEY0.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY0),f
	line	659
;recive.c: 659: KEY1.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY1),f
	line	660
;recive.c: 660: KEY2.channel_status^=1;
	movlw	(01h)
	xorwf	(_KEY2),f
	goto	l13804
	line	581
	
l13802:	
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
	goto	l13758
	xorlw	2^1	; case 2
	skipnz
	goto	l13764
	xorlw	3^2	; case 3
	skipnz
	goto	l13776
	xorlw	4^3	; case 4
	skipnz
	goto	l13770
	xorlw	5^4	; case 5
	skipnz
	goto	l13782
	xorlw	6^5	; case 6
	skipnz
	goto	l13788
	xorlw	7^6	; case 7
	skipnz
	goto	l13794
	goto	l13804
	opt asmopt_on

	line	666
	
l13804:	
;recive.c: 666: channel_delay[0]=0;
	clrf	(_channel_delay)
	line	667
;recive.c: 667: channel_delay[1]=0;
	clrf	0+(_channel_delay)+01h
	line	668
;recive.c: 668: channel_delay[2]=0;
	clrf	0+(_channel_delay)+02h
	line	669
;recive.c: 669: delay_flag=0;
	clrf	(_delay_flag)
	line	672
	
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
;;		line 520 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\recive.c"
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
psect	text1131
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\recive.c"
	line	520
	global	__size_of_channel_set
	__size_of_channel_set	equ	__end_of_channel_set-_channel_set
	
_channel_set:	
	opt	stack 5
; Regs used in _channel_set: [wreg-fsr0h+status,2+status,0]
;channel_set@channel_num stored from wreg
	movwf	(channel_set@channel_num)
	line	521
	
l13732:	
;recive.c: 521: switch(channel_num)
	goto	l13742
	line	523
;recive.c: 522: {
;recive.c: 523: case 0 :
	
l9943:	
	line	525
;recive.c: 524: {
;recive.c: 525: if(status)
	movf	(channel_set@status),w
	skipz
	goto	u1910
	goto	l9944
u1910:
	line	527
	
l13734:	
;recive.c: 526: {
;recive.c: 527: TRISB6=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	528
;recive.c: 528: RB6=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7
	line	529
;recive.c: 529: }
	goto	l9953
	line	530
	
l9944:	
	line	532
;recive.c: 530: else
;recive.c: 531: {
;recive.c: 532: TRISB6=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	533
;recive.c: 533: RB6=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(54/8),(54)&7
	goto	l9953
	line	536
;recive.c: 536: case 1:
	
l9947:	
	line	538
;recive.c: 537: {
;recive.c: 538: if(status)
	movf	(channel_set@status),w
	skipz
	goto	u1920
	goto	l9948
u1920:
	line	540
	
l13736:	
;recive.c: 539: {
;recive.c: 540: TRISB5=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7
	line	541
;recive.c: 541: RB5=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(53/8),(53)&7
	line	542
;recive.c: 542: }
	goto	l9953
	line	543
	
l9948:	
	line	545
;recive.c: 543: else
;recive.c: 544: {
;recive.c: 545: TRISB5=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7
	line	546
;recive.c: 546: RB5=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(53/8),(53)&7
	goto	l9953
	line	549
;recive.c: 549: case 2:
	
l9950:	
	line	551
;recive.c: 550: {
;recive.c: 551: if(status)
	movf	(channel_set@status),w
	skipz
	goto	u1930
	goto	l9951
u1930:
	line	553
	
l13738:	
;recive.c: 552: {
;recive.c: 553: TRISB4=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	554
;recive.c: 554: RB4=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(52/8),(52)&7
	line	555
;recive.c: 555: }
	goto	l9953
	line	556
	
l9951:	
	line	558
;recive.c: 556: else
;recive.c: 557: {
;recive.c: 558: TRISB4=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	559
;recive.c: 559: RB4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(52/8),(52)&7
	goto	l9953
	line	521
	
l13742:	
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

	line	563
	
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
;;		line 38 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\system.c"
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
psect	text1132
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\system.c"
	line	38
	global	__size_of_Enable_Interrupt
	__size_of_Enable_Interrupt	equ	__end_of_Enable_Interrupt-_Enable_Interrupt
	
_Enable_Interrupt:	
	opt	stack 5
; Regs used in _Enable_Interrupt: []
	line	39
	
l13730:	
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
;;		line 43 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\timer1.c"
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
psect	text1133
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\timer1.c"
	line	43
	global	__size_of_Timer1_start
	__size_of_Timer1_start	equ	__end_of_Timer1_start-_Timer1_start
	
_Timer1_start:	
	opt	stack 5
; Regs used in _Timer1_start: [wreg]
	line	44
	
l13724:	
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
	
l13726:	
;timer1.c: 47: PIR1 &= ~(0x01);
	bcf	(12)+(0/8),(0)&7	;volatile
	line	48
	
l13728:	
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
;;		line 29 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\timer1.c"
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
psect	text1134
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\timer1.c"
	line	29
	global	__size_of_Timer1_Init
	__size_of_Timer1_Init	equ	__end_of_Timer1_Init-_Timer1_Init
	
_Timer1_Init:	
	opt	stack 5
; Regs used in _Timer1_Init: [wreg+status,2+status,0]
;Timer1_Init@TIMER1_DIVIDER stored from wreg
	movwf	(Timer1_Init@TIMER1_DIVIDER)
	line	30
	
l13716:	
;timer1.c: 30: T1CON = 0x00;
	clrf	(16)	;volatile
	line	31
	
l13718:	
;timer1.c: 31: T1CON |= TIMER1_DIVIDER;
	movf	(Timer1_Init@TIMER1_DIVIDER),w
	iorwf	(16),f	;volatile
	line	32
	
l13720:	
;timer1.c: 32: INTCON |= (0x40);
	bsf	(11)+(6/8),(6)&7	;volatile
	line	33
	
l13722:	
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
;;		line 332 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\key_scan.c"
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
psect	text1135
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\key_scan.c"
	line	332
	global	__size_of_key_Init
	__size_of_key_Init	equ	__end_of_key_Init-_key_Init
	
_key_Init:	
	opt	stack 5
; Regs used in _key_Init: [wreg+status,2+status,0]
	line	333
	
l13712:	
;key_scan.c: 333: OPTION_REG &= ~0x80;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(129)^080h+(7/8),(7)&7	;volatile
	line	334
	
l13714:	
;key_scan.c: 334: TRISB|=0x0e;
	movlw	(0Eh)
	iorwf	(134)^080h,f	;volatile
	line	335
;key_scan.c: 335: WPUB|=0x0e;
	movlw	(0Eh)
	iorwf	(149)^080h,f	;volatile
	line	336
	
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
;;		line 11 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\iic.c"
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
psect	text1136
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\iic.c"
	line	11
	global	__size_of_IIC_Init
	__size_of_IIC_Init	equ	__end_of_IIC_Init-_IIC_Init
	
_IIC_Init:	
	opt	stack 5
; Regs used in _IIC_Init: []
	line	12
	
l13710:	
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
;;		line 10 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\delay.c"
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
psect	text1137
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\delay.c"
	line	10
	global	__size_of_soft_delay_ms
	__size_of_soft_delay_ms	equ	__end_of_soft_delay_ms-_soft_delay_ms
	
_soft_delay_ms:	
	opt	stack 4
; Regs used in _soft_delay_ms: [wreg+status,2+status,0]
	line	14
	
l13684:	
;delay.c: 12: volatile unsigned int i;
;delay.c: 13: volatile unsigned char j,k;
;delay.c: 14: for(i=0;i<ms;i++){
	bcf	status, 5	;RP0=0, select bank0
	clrf	(soft_delay_ms@i)	;volatile
	clrf	(soft_delay_ms@i+1)	;volatile
	goto	l13708
	line	15
	
l13686:	
;delay.c: 15: for(j=0;j<10;j++){
	clrf	(soft_delay_ms@j)	;volatile
	
l13688:	
	movlw	(0Ah)
	subwf	(soft_delay_ms@j),w	;volatile
	skipc
	goto	u1881
	goto	u1880
u1881:
	goto	l13692
u1880:
	goto	l13706
	line	16
	
l13692:	
;delay.c: 16: for(k=0;k<32;k++);
	clrf	(soft_delay_ms@k)	;volatile
	
l13694:	
	movlw	(020h)
	subwf	(soft_delay_ms@k),w	;volatile
	skipc
	goto	u1891
	goto	u1890
u1891:
	goto	l13698
u1890:
	goto	l13702
	
l13698:	
	incf	(soft_delay_ms@k),f	;volatile
	goto	l13694
	line	15
	
l13702:	
	incf	(soft_delay_ms@j),f	;volatile
	goto	l13688
	line	14
	
l13706:	
	incf	(soft_delay_ms@i),f	;volatile
	skipnz
	incf	(soft_delay_ms@i+1),f	;volatile
	
l13708:	
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
	goto	l13686
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
;;		line 19 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\system.c"
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
psect	text1138
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\system.c"
	global	__size_of_system_set_CPU_frequency
	__size_of_system_set_CPU_frequency	equ	__end_of_system_set_CPU_frequency-_system_set_CPU_frequency
	
_system_set_CPU_frequency:	
	opt	stack 5
; Regs used in _system_set_CPU_frequency: [wreg+status,2]
;system_set_CPU_frequency@CPU_Frequency stored from wreg
	movwf	(system_set_CPU_frequency@CPU_Frequency)
	line	20
	
l13680:	
;system.c: 20: OSCCON = CPU_Frequency;
	movf	(system_set_CPU_frequency@CPU_Frequency),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h
	line	21
	
l13682:	
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
;;		line 48 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\system.c"
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
psect	text1139
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\system.c"
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
	
i1l13806:	
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
	
i1l13808:	
	movlw	(043h)
	andwf	(ISR@peripheral_intterrupt_touch),f
	line	71
	
i1l13810:	
;system.c: 71: if(peripheral_intterrupt_touch & TIMER1_ISR_TOUCH) {
	btfss	(ISR@peripheral_intterrupt_touch),(0)&7
	goto	u205_21
	goto	u205_20
u205_21:
	goto	i1l1316
u205_20:
	line	72
	
i1l13812:	
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
;;		line 60 in file "F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\timer1.c"
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
psect	text1140
	file	"F:\œÓƒø\ø·’¨\BLE“∆÷≤\rx\src\timer1.c"
	line	60
	global	__size_of_TIMER1_ISR
	__size_of_TIMER1_ISR	equ	__end_of_TIMER1_ISR-_TIMER1_ISR
	
_TIMER1_ISR:	
	opt	stack 0
; Regs used in _TIMER1_ISR: [wreg+status,2+status,0]
	line	63
	
i1l13814:	
;timer1.c: 61: static unsigned int flag_1s_add=0;
;timer1.c: 62: static unsigned int flag_1min_add=0;
;timer1.c: 63: T1CON &= ~(0x01);
	bcf	(16)+(0/8),(0)&7	;volatile
	line	64
	
i1l13816:	
;timer1.c: 64: TMR1L = (unsigned char)(Timer1_set_time);
	movf	(_Timer1_set_time),w	;volatile
	movwf	(14)	;volatile
	line	65
;timer1.c: 65: TMR1H = (unsigned char)(Timer1_set_time>>8);
	movf	(_Timer1_set_time+1),w	;volatile
	movwf	(15)	;volatile
	line	67
	
i1l13818:	
;timer1.c: 67: flag_time_key0_add++;
	incf	(_flag_time_key0_add),f
	skipnz
	incf	(_flag_time_key0_add+1),f
	line	68
	
i1l13820:	
;timer1.c: 68: flag_time_key1_add++;
	incf	(_flag_time_key1_add),f
	skipnz
	incf	(_flag_time_key1_add+1),f
	line	69
	
i1l13822:	
;timer1.c: 69: flag_time_key2_add++;
	incf	(_flag_time_key2_add),f
	skipnz
	incf	(_flag_time_key2_add+1),f
	line	70
	
i1l13824:	
;timer1.c: 70: flag_5s_add++;
	incf	(_flag_5s_add),f
	skipnz
	incf	(_flag_5s_add+1),f
	line	71
	
i1l13826:	
;timer1.c: 72: flag_1s_add++;
	incf	(_flag_5min_add),f
	skipnz
	incf	(_flag_5min_add+1),f
	line	74
	
i1l13828:	
;timer1.c: 74: PIR1 &= ~(0x01);
	bcf	(12)+(0/8),(0)&7	;volatile
	line	75
	
i1l13830:	
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
