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
	FNCALL	_main,_Enable_Interrupt
	FNCALL	_main,_recive_task
	FNCALL	_recive_task,_rx_data
	FNCALL	_recive_task,_RF_ClearFIFO
	FNCALL	_recive_task,_RF_ClearStatus
	FNCALL	_rx_data,_RF_RxData
	FNCALL	_rx_data,_UpdateCRC
	FNCALL	_rx_data,_memcpy
	FNCALL	_rx_data,_send
	FNCALL	_RF_RxData,_RF_GetStatus
	FNCALL	_RF_RxData,_RF_Read_Buff
	FNCALL	_RF_RxData,_RF_ClearFIFO
	FNCALL	_RF_RxData,_RF_ClearStatus
	FNCALL	_RF_ClearStatus,_RF_WriteReg
	FNCALL	_RF_ClearFIFO,_RF_WriteReg
	FNCALL	_RF_GetStatus,_RF_ReadReg
	FNCALL	_RF_Set_RxMode,_RF_WriteReg
	FNCALL	_RF_Set_RxMode,_soft_delay_ms
	FNCALL	_RF_Init,_SPI_init
	FNCALL	_RF_Init,_RF_WriteReg
	FNCALL	_RF_Init,_RF_Write_Buff
	FNCALL	_send,_Delay_us
	FNCALL	_RF_ReadReg,_SPI_RW
	FNCALL	_RF_Read_Buff,_SPI_RW
	FNCALL	_RF_Write_Buff,_SPI_RW
	FNCALL	_RF_WriteReg,_SPI_RW
	FNROOT	_main
	FNCALL	_ISR,_TIMER1_ISR
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_frame_count
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\recive.c"
	line	42

;initializer for _frame_count
	retlw	0FFh
	retlw	0FFh
	retlw	0FFh
	retlw	0FFh

	global	_ble_crc_38
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\recive.c"
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
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\recive.c"
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
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\recive.c"
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
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
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
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
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
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	384
RF_Carrier@BB_cal_data:
	retlw	0Ah
	retlw	06Dh
	retlw	067h
	retlw	09Ch
	retlw	046h
	global	RF_Init@BB_cal_data
psect	strings
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	62
RF_Init@BB_cal_data:
	retlw	0Ah
	retlw	06Dh
	retlw	067h
	retlw	09Ch
	retlw	046h
	global	RF_Carrier@Dem_cal2_data
psect	strings
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	388
RF_Carrier@Dem_cal2_data:
	retlw	0Bh
	retlw	0DFh
	retlw	02h
	global	RF_Carrier@RF_cal_data
psect	strings
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	385
RF_Carrier@RF_cal_data:
	retlw	016h
	retlw	033h
	retlw	027h
	global	RF_Init@Dem_cal2_data
psect	strings
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	66
RF_Init@Dem_cal2_data:
	retlw	0Bh
	retlw	0DFh
	retlw	02h
	global	RF_Init@RF_cal_data
psect	strings
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	63
RF_Init@RF_cal_data:
	retlw	016h
	retlw	033h
	retlw	027h
	global	_AdvData_3
psect	strings
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\recive.c"
	line	21
_AdvData_3:
	retlw	0AAh
	retlw	055h
	retlw	010h
	global	_RX_ADDRESS_DEF
psect	strings
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	7
_RX_ADDRESS_DEF:
	retlw	02Dh
	retlw	0D7h
	retlw	0B9h
	global	_TX_ADDRESS_DEF
psect	strings
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	6
_TX_ADDRESS_DEF:
	retlw	0CCh
	retlw	0CCh
	retlw	0CCh
	global	RF_Carrier@Dem_cal_data
psect	strings
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	387
RF_Carrier@Dem_cal_data:
	retlw	0E1h
	global	RF_Init@Dem_cal_data
psect	strings
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
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
	global	_AdvData_3
	global	_RX_ADDRESS_DEF
	global	_TX_ADDRESS_DEF
	global	RF_Carrier@Dem_cal_data
	global	RF_Init@Dem_cal_data
	global	_virtual_timer_group
	global	_ADC_digital_value
	global	_Timer1_set_time
	global	_Timer0_set_time
	global	_last_PORTB_value
	global	_AdvData_23
	global	_rf_buf
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
	global	_TRISB1
_TRISB1	set	1073
	global	_TRISE1
_TRISE1	set	1097
	global	_TRISE2
_TRISE2	set	1098
	file	"PAN2416Ê¾Àý³ÌÐò.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_Timer1_set_time:
       ds      2

_Timer0_set_time:
       ds      1

_last_PORTB_value:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_virtual_timer_group:
       ds      6

_ADC_digital_value:
       ds      2

_AdvData_23:
       ds      19

_rf_buf:
       ds      18

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\recive.c"
	line	42
_frame_count:
       ds      4

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
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+02Dh)
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
	fcall	__pidataBANK0+3		;fetch initializer
	movwf	__pdataBANK0+3&07fh		
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
	global	?_send
?_send:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_RF_GetStatus
?_RF_GetStatus:	; 1 bytes @ 0x0
	global	?_RF_ReadReg
?_RF_ReadReg:	; 1 bytes @ 0x0
	global	?_SPI_RW
?_SPI_RW:	; 1 bytes @ 0x0
	global	?_rx_data
?_rx_data:	; 1 bytes @ 0x0
	ds	4
	global	ISR@peripheral_intterrupt_touch
ISR@peripheral_intterrupt_touch:	; 1 bytes @ 0x4
	ds	1
	global	??_system_set_CPU_frequency
??_system_set_CPU_frequency:	; 0 bytes @ 0x5
	global	??_soft_delay_ms
??_soft_delay_ms:	; 0 bytes @ 0x5
	global	??_IIC_Init
??_IIC_Init:	; 0 bytes @ 0x5
	global	??_key_Init
??_key_Init:	; 0 bytes @ 0x5
	global	??_RF_Init
??_RF_Init:	; 0 bytes @ 0x5
	global	??_RF_Set_RxMode
??_RF_Set_RxMode:	; 0 bytes @ 0x5
	global	??_Timer1_Init
??_Timer1_Init:	; 0 bytes @ 0x5
	global	??_Enable_Interrupt
??_Enable_Interrupt:	; 0 bytes @ 0x5
	global	??_recive_task
??_recive_task:	; 0 bytes @ 0x5
	global	??_RF_GetStatus
??_RF_GetStatus:	; 0 bytes @ 0x5
	global	??_SPI_init
??_SPI_init:	; 0 bytes @ 0x5
	global	??_RF_WriteReg
??_RF_WriteReg:	; 0 bytes @ 0x5
	global	??_RF_Write_Buff
??_RF_Write_Buff:	; 0 bytes @ 0x5
	global	??_RF_ClearFIFO
??_RF_ClearFIFO:	; 0 bytes @ 0x5
	global	??_RF_ClearStatus
??_RF_ClearStatus:	; 0 bytes @ 0x5
	global	??_RF_ReadReg
??_RF_ReadReg:	; 0 bytes @ 0x5
	global	??_SPI_RW
??_SPI_RW:	; 0 bytes @ 0x5
	global	??_send
??_send:	; 0 bytes @ 0x5
	global	??_main
??_main:	; 0 bytes @ 0x5
	global	??_Delay_us
??_Delay_us:	; 0 bytes @ 0x5
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_soft_delay_ms
?_soft_delay_ms:	; 0 bytes @ 0x0
	global	?_Timer1_start
?_Timer1_start:	; 0 bytes @ 0x0
	global	?_Delay_us
?_Delay_us:	; 0 bytes @ 0x0
	global	?_memcpy
?_memcpy:	; 1 bytes @ 0x0
	global	?_UpdateCRC
?_UpdateCRC:	; 2 bytes @ 0x0
	global	system_set_CPU_frequency@CPU_Frequency
system_set_CPU_frequency@CPU_Frequency:	; 1 bytes @ 0x0
	global	Timer1_Init@TIMER1_DIVIDER
Timer1_Init@TIMER1_DIVIDER:	; 1 bytes @ 0x0
	global	SPI_RW@read_reg_addr
SPI_RW@read_reg_addr:	; 1 bytes @ 0x0
	global	Timer1_start@T_nums
Timer1_start@T_nums:	; 2 bytes @ 0x0
	global	soft_delay_ms@ms
soft_delay_ms@ms:	; 2 bytes @ 0x0
	global	Delay_us@us
Delay_us@us:	; 2 bytes @ 0x0
	global	UpdateCRC@len
UpdateCRC@len:	; 2 bytes @ 0x0
	global	memcpy@s1
memcpy@s1:	; 2 bytes @ 0x0
	ds	1
	global	SPI_RW@i
SPI_RW@i:	; 1 bytes @ 0x1
	ds	1
	global	?_RF_WriteReg
?_RF_WriteReg:	; 0 bytes @ 0x2
	global	?_RF_Write_Buff
?_RF_Write_Buff:	; 0 bytes @ 0x2
	global	?_RF_Read_Buff
?_RF_Read_Buff:	; 0 bytes @ 0x2
	global	??_UpdateCRC
??_UpdateCRC:	; 0 bytes @ 0x2
	global	Timer1_start@Timer1_ISR_execution_total_time
Timer1_start@Timer1_ISR_execution_total_time:	; 1 bytes @ 0x2
	global	RF_Read_Buff@pBuff
RF_Read_Buff@pBuff:	; 1 bytes @ 0x2
	global	RF_Write_Buff@pBuff
RF_Write_Buff@pBuff:	; 1 bytes @ 0x2
	global	RF_WriteReg@write_data
RF_WriteReg@write_data:	; 1 bytes @ 0x2
	global	RF_ReadReg@reg_addr
RF_ReadReg@reg_addr:	; 1 bytes @ 0x2
	global	soft_delay_ms@i
soft_delay_ms@i:	; 2 bytes @ 0x2
	global	Delay_us@i
Delay_us@i:	; 2 bytes @ 0x2
	global	memcpy@n
memcpy@n:	; 2 bytes @ 0x2
	ds	1
	global	??_Timer1_start
??_Timer1_start:	; 0 bytes @ 0x3
	global	RF_Read_Buff@length
RF_Read_Buff@length:	; 1 bytes @ 0x3
	global	RF_Write_Buff@length
RF_Write_Buff@length:	; 1 bytes @ 0x3
	global	RF_WriteReg@reg_addr
RF_WriteReg@reg_addr:	; 1 bytes @ 0x3
	global	RF_ReadReg@tmp
RF_ReadReg@tmp:	; 1 bytes @ 0x3
	ds	1
	global	??_RF_Read_Buff
??_RF_Read_Buff:	; 0 bytes @ 0x4
	global	??_memcpy
??_memcpy:	; 0 bytes @ 0x4
	global	RF_Write_Buff@reg_addr
RF_Write_Buff@reg_addr:	; 1 bytes @ 0x4
	global	soft_delay_ms@j
soft_delay_ms@j:	; 1 bytes @ 0x4
	global	send@uContent
send@uContent:	; 1 bytes @ 0x4
	ds	1
	global	RF_Read_Buff@reg_addr
RF_Read_Buff@reg_addr:	; 1 bytes @ 0x5
	global	RF_Write_Buff@i
RF_Write_Buff@i:	; 1 bytes @ 0x5
	global	soft_delay_ms@k
soft_delay_ms@k:	; 1 bytes @ 0x5
	global	UpdateCRC@CRC_input
UpdateCRC@CRC_input:	; 1 bytes @ 0x5
	global	send@uSendContent
send@uSendContent:	; 1 bytes @ 0x5
	global	memcpy@d1
memcpy@d1:	; 1 bytes @ 0x5
	ds	1
	global	RF_Read_Buff@byte_ctr
RF_Read_Buff@byte_ctr:	; 1 bytes @ 0x6
	global	UpdateCRC@k
UpdateCRC@k:	; 1 bytes @ 0x6
	global	send@i
send@i:	; 1 bytes @ 0x6
	global	memcpy@s
memcpy@s:	; 2 bytes @ 0x6
	ds	1
	global	?_RF_RxData
?_RF_RxData:	; 1 bytes @ 0x7
	global	RF_RxData@length
RF_RxData@length:	; 1 bytes @ 0x7
	global	UpdateCRC@i
UpdateCRC@i:	; 1 bytes @ 0x7
	ds	1
	global	??_RF_RxData
??_RF_RxData:	; 0 bytes @ 0x8
	global	memcpy@d
memcpy@d:	; 1 bytes @ 0x8
	global	UpdateCRC@CRC_acc
UpdateCRC@CRC_acc:	; 2 bytes @ 0x8
	ds	1
	global	RF_RxData@payload_buff
RF_RxData@payload_buff:	; 1 bytes @ 0x9
	ds	1
	global	??_rx_data
??_rx_data:	; 0 bytes @ 0xA
	ds	4
	global	rx_data@crc16
rx_data@crc16:	; 2 bytes @ 0xE
	ds	2
	global	rx_data@rand
rx_data@rand:	; 1 bytes @ 0x10
	ds	1
	global	rx_data@crc18
rx_data@crc18:	; 2 bytes @ 0x11
	ds	2
	global	rx_data@rx_flag
rx_data@rx_flag:	; 1 bytes @ 0x13
	ds	1
	global	rx_data@i
rx_data@i:	; 1 bytes @ 0x14
	ds	1
;;Data sizes: Strings 0, constant 124, data 4, bss 49, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5       9
;; BANK0           80     21      70
;; BANK1           80      0       0
;; BANK3           88      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:

;; ?_memcpy	PTR void  size(1) Largest target is 19
;;		 -> AdvData_23(BANK0[19]), 
;;
;; ?_UpdateCRC	unsigned short  size(1) Largest target is 0
;;
;; memcpy@d1	PTR void  size(1) Largest target is 19
;;		 -> AdvData_23(BANK0[19]), 
;;
;; memcpy@d	PTR unsigned char  size(1) Largest target is 19
;;		 -> AdvData_23(BANK0[19]), 
;;
;; memcpy@s1	PTR const void  size(2) Largest target is 18
;;		 -> AdvData_3(CODE[3]), rf_buf(BANK0[18]), 
;;
;; memcpy@s	PTR const unsigned char  size(2) Largest target is 18
;;		 -> AdvData_3(CODE[3]), rf_buf(BANK0[18]), 
;;
;; sp__memcpy	PTR void  size(1) Largest target is 19
;;		 -> AdvData_23(BANK0[19]), 
;;
;; UpdateCRC@CRC_input	PTR unsigned char  size(1) Largest target is 19
;;		 -> AdvData_23(BANK0[19]), rf_buf(BANK0[18]), 
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
;;   None.
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _recive_task->_rx_data
;;   _rx_data->_RF_RxData
;;   _rx_data->_UpdateCRC
;;   _RF_RxData->_RF_Read_Buff
;;   _RF_ClearStatus->_RF_WriteReg
;;   _RF_ClearFIFO->_RF_WriteReg
;;   _RF_GetStatus->_RF_ReadReg
;;   _RF_Set_RxMode->_soft_delay_ms
;;   _RF_Init->_RF_Write_Buff
;;   _send->_Delay_us
;;   _RF_ReadReg->_SPI_RW
;;   _RF_Read_Buff->_SPI_RW
;;   _RF_Write_Buff->_SPI_RW
;;   _RF_WriteReg->_SPI_RW
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
;; (0) _main                                                 1     1      0    4041
;;           _system_set_CPU_frequency
;;                      _soft_delay_ms
;;                           _IIC_Init
;;                           _key_Init
;;                            _RF_Init
;;                      _RF_Set_RxMode
;;                        _Timer1_Init
;;                       _Timer1_start
;;                   _Enable_Interrupt
;;                        _recive_task
;; ---------------------------------------------------------------------------------
;; (1) _recive_task                                          0     0      0    2797
;;                            _rx_data
;;                       _RF_ClearFIFO
;;                     _RF_ClearStatus
;; ---------------------------------------------------------------------------------
;; (2) _rx_data                                             12    12      0    2401
;;                                             10 BANK0     11    11      0
;;                          _RF_RxData
;;                          _UpdateCRC
;;                             _memcpy
;;                               _send
;; ---------------------------------------------------------------------------------
;; (3) _RF_RxData                                            3     2      1     956
;;                                              7 BANK0      3     2      1
;;                       _RF_GetStatus
;;                       _RF_Read_Buff
;;                       _RF_ClearFIFO
;;                     _RF_ClearStatus
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
;; (1) _RF_Set_RxMode                                        0     0      0     402
;;                        _RF_WriteReg
;;                      _soft_delay_ms
;; ---------------------------------------------------------------------------------
;; (1) _RF_Init                                              1     1      0     532
;;                                              6 BANK0      1     1      0
;;                           _SPI_init
;;                        _RF_WriteReg
;;                      _RF_Write_Buff
;; ---------------------------------------------------------------------------------
;; (3) _send                                                 3     3      0     250
;;                                              4 BANK0      3     3      0
;;                           _Delay_us
;; ---------------------------------------------------------------------------------
;; (5) _RF_ReadReg                                           2     2      0     201
;;                                              2 BANK0      2     2      0
;;                             _SPI_RW
;; ---------------------------------------------------------------------------------
;; (4) _RF_Read_Buff                                         5     3      2     297
;;                                              2 BANK0      5     3      2
;;                             _SPI_RW
;; ---------------------------------------------------------------------------------
;; (2) _RF_Write_Buff                                        4     2      2     297
;;                                              2 BANK0      4     2      2
;;                             _SPI_RW
;; ---------------------------------------------------------------------------------
;; (3) _RF_WriteReg                                          2     1      1     198
;;                                              2 BANK0      2     1      1
;;                             _SPI_RW
;; ---------------------------------------------------------------------------------
;; (3) _memcpy                                               9     5      4     174
;;                                              0 BANK0      9     5      4
;; ---------------------------------------------------------------------------------
;; (3) _UpdateCRC                                           10     8      2     251
;;                                              0 BANK0     10     8      2
;; ---------------------------------------------------------------------------------
;; (4) _Delay_us                                             4     2      2     108
;;                                              0 BANK0      4     2      2
;; ---------------------------------------------------------------------------------
;; (4) _SPI_RW                                               2     2      0     136
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _SPI_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _Enable_Interrupt                                     0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _Timer1_start                                         5     2      3      62
;;                                              0 BANK0      5     2      3
;; ---------------------------------------------------------------------------------
;; (1) _Timer1_Init                                          1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _key_Init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _IIC_Init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _soft_delay_ms                                        6     4      2     204
;;                                              0 BANK0      6     4      2
;; ---------------------------------------------------------------------------------
;; (1) _system_set_CPU_frequency                             1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (7) _ISR                                                  8     8      0      15
;;                                              0 COMMON     5     5      0
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
;;   _Enable_Interrupt
;;   _recive_task
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
;;       _memcpy
;;       _send
;;         _Delay_us
;;     _RF_ClearFIFO
;;       _RF_WriteReg
;;         _SPI_RW
;;     _RF_ClearStatus
;;       _RF_WriteReg
;;         _SPI_RW
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
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      59      12        0.0%
;;ABS                  0      0      4F       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       A       2        0.0%
;;BANK0               50     15      46       5       87.5%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      5       9       1       64.3%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA              40      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 55 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    0        unsigned char 
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
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
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
;;		_Enable_Interrupt
;;		_recive_task
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\main.c"
	line	55
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	57
	
l14272:	
;main.c: 57: system_set_CPU_frequency(CPU_FREQUENCY_8M);
	movlw	(071h)
	fcall	_system_set_CPU_frequency
	line	58
;main.c: 58: soft_delay_ms(100);
	movlw	064h
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	59
	
l14274:	
# 59 "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\main.c"
nop ;#
psect	maintext
	line	62
	
l14276:	
;main.c: 62: TRISC = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	63
	
l14278:	
;main.c: 63: TRISB |= 0x00;
	movf	(134)^080h,w	;volatile
	line	65
	
l14280:	
;main.c: 65: RC0=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	line	66
	
l14282:	
;main.c: 66: RB1=1;
	bsf	(49/8),(49)&7
	line	68
	
l14284:	
;main.c: 68: IIC_Init();
	fcall	_IIC_Init
	line	69
	
l14286:	
;main.c: 69: key_Init();
	fcall	_key_Init
	line	70
	
l14288:	
;main.c: 70: RF_Init();
	fcall	_RF_Init
	line	71
	
l14290:	
;main.c: 71: RF_Set_RxMode();
	fcall	_RF_Set_RxMode
	line	73
	
l14292:	
;main.c: 73: Timer1_Init(TIMER1_DIV_8);
	movlw	(030h)
	fcall	_Timer1_Init
	line	74
	
l14294:	
;main.c: 74: Timer1_start(10000,0);
	movlw	low(02710h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Timer1_start)
	movlw	high(02710h)
	movwf	((?_Timer1_start))+1
	clrf	0+(?_Timer1_start)+02h
	fcall	_Timer1_start
	line	76
	
l14296:	
;main.c: 76: Enable_Interrupt();
	fcall	_Enable_Interrupt
	line	80
	
l14298:	
;main.c: 79: {
;main.c: 80: recive_task();
	fcall	_recive_task
	goto	l14298
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	82
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_recive_task
psect	text732,local,class=CODE,delta=2
global __ptext732
__ptext732:

;; *************** function _recive_task *****************
;; Defined at:
;;		line 152 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\recive.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_rx_data
;;		_RF_ClearFIFO
;;		_RF_ClearStatus
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text732
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\recive.c"
	line	152
	global	__size_of_recive_task
	__size_of_recive_task	equ	__end_of_recive_task-_recive_task
	
_recive_task:	
	opt	stack 0
; Regs used in _recive_task: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	153
	
l14268:	
;recive.c: 153: if (rx_data())
	fcall	_rx_data
	xorlw	0
	skipnz
	goto	u761
	goto	u760
u761:
	goto	l9802
u760:
	line	156
	
l14270:	
;recive.c: 154: {
;recive.c: 156: RF_ClearFIFO();
	fcall	_RF_ClearFIFO
	line	157
;recive.c: 157: RF_ClearStatus();
	fcall	_RF_ClearStatus
	line	159
	
l9802:	
	return
	opt stack 0
GLOBAL	__end_of_recive_task
	__end_of_recive_task:
;; =============== function _recive_task ends ============

	signat	_recive_task,88
	global	_rx_data
psect	text733,local,class=CODE,delta=2
global __ptext733
__ptext733:

;; *************** function _rx_data *****************
;; Defined at:
;;		line 72 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\recive.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  crc18           2   17[BANK0 ] unsigned int 
;;  crc16           2   14[BANK0 ] unsigned int 
;;  i               1   20[BANK0 ] unsigned char 
;;  rx_flag         1   19[BANK0 ] unsigned char 
;;  rand            1   16[BANK0 ] unsigned char 
;;  diff_frame      1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       7       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      11       0       0       0
;;Total ram usage:       11 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_RF_RxData
;;		_UpdateCRC
;;		_memcpy
;;		_send
;; This function is called by:
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text733
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\recive.c"
	line	72
	global	__size_of_rx_data
	__size_of_rx_data	equ	__end_of_rx_data-_rx_data
	
_rx_data:	
;; using string table level
	opt	stack 1
; Regs used in _rx_data: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	73
	
l14184:	
;recive.c: 73: unsigned char rx_flag=0;
	clrf	(rx_data@rx_flag)
	line	75
;recive.c: 75: unsigned char i=0;
	clrf	(rx_data@i)
	line	76
;recive.c: 76: unsigned int crc18=0;
	clrf	(rx_data@crc18)
	clrf	(rx_data@crc18+1)
	line	77
;recive.c: 78: unsigned char diff_frame = 0;
	clrf	(rx_data@crc16)
	clrf	(rx_data@crc16+1)
	line	80
	
l14186:	
;recive.c: 80: if (RF_RxData(rf_buf,18))
	movlw	(012h)
	movwf	(?_RF_RxData)
	movlw	(_rf_buf)&0ffh
	fcall	_RF_RxData
	xorlw	0
	skipnz
	goto	u691
	goto	u690
u691:
	goto	l14264
u690:
	line	85
	
l14188:	
;recive.c: 81: {
;recive.c: 85: for(i = 0;i < 18; i++)
	clrf	(rx_data@i)
	line	87
	
l14194:	
;recive.c: 86: {
;recive.c: 87: rf_buf[i]=rf_buf[i]^crc_2_4G_lib[3+i]^ble_crc_38[21+i];
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
	line	85
	
l14196:	
	incf	(rx_data@i),f
	
l14198:	
	movlw	(012h)
	subwf	(rx_data@i),w
	skipc
	goto	u701
	goto	u700
u701:
	goto	l14194
u700:
	line	90
	
l14200:	
;recive.c: 88: }
;recive.c: 90: crc16 = rf_buf[16] + rf_buf[17] * 256;
	movf	0+(_rf_buf)+011h,w
	movwf	(??_rx_data+0)+0
	movlw	((0x0/2))
	movwf	(??_rx_data+0)+0+1
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
	
l14202:	
;recive.c: 93: for (i = 0; i < 16; i++)
	clrf	(rx_data@i)
	line	95
	
l14208:	
;recive.c: 94: {
;recive.c: 95: rf_buf[i]=rf_buf[i]^crc_lab[i];
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
	
l14210:	
	incf	(rx_data@i),f
	
l14212:	
	movlw	(010h)
	subwf	(rx_data@i),w
	skipc
	goto	u711
	goto	u710
u711:
	goto	l14208
u710:
	line	99
	
l14214:	
;recive.c: 96: }
;recive.c: 99: rand = rf_buf[0];
	movf	(_rf_buf),w
	movwf	(rx_data@rand)
	line	101
	
l14216:	
;recive.c: 101: for (i = 1; i < 16; i++)
	clrf	(rx_data@i)
	incf	(rx_data@i),f
	line	103
	
l14220:	
;recive.c: 102: {
;recive.c: 103: rf_buf[i] ^= rand;
	movf	(rx_data@i),w
	addlw	_rf_buf&0ffh
	movwf	fsr0
	movf	(rx_data@rand),w
	xorwf	indf,f
	line	101
	
l14222:	
	incf	(rx_data@i),f
	
l14224:	
	movlw	(010h)
	subwf	(rx_data@i),w
	skipc
	goto	u721
	goto	u720
u721:
	goto	l14220
u720:
	line	106
	
l14226:	
;recive.c: 104: }
;recive.c: 106: if (crc16 != UpdateCRC(rf_buf, 16))
	movlw	010h
	movwf	(?_UpdateCRC)
	clrf	(?_UpdateCRC+1)
	movlw	(_rf_buf)&0ffh
	fcall	_UpdateCRC
	movf	(rx_data@crc16+1),w
	xorwf	(1+(?_UpdateCRC)),w
	skipz
	goto	u735
	movf	(rx_data@crc16),w
	xorwf	(0+(?_UpdateCRC)),w
u735:

	skipnz
	goto	u731
	goto	u730
u731:
	goto	l14234
u730:
	line	108
	
l14228:	
	line	109
	
l14230:	
;recive.c: 109: return rx_flag;
	movlw	(0)
	goto	l9794
	line	112
	
l14234:	
;recive.c: 110: }
;recive.c: 112: if (frame_count != rf_buf[1])
	movf	0+(_rf_buf)+01h,w
	movwf	(??_rx_data+0)+0
	movlw	((0x0/2))
	movwf	(??_rx_data+0)+0+1
	clrf	(??_rx_data+0)+0+2
	clrf	(??_rx_data+0)+0+3
	movf	(_frame_count+3),w
	xorwf	3+(??_rx_data+0)+0,w
	skipz
	goto	u745
	movf	(_frame_count+2),w
	xorwf	2+(??_rx_data+0)+0,w
	skipz
	goto	u745
	movf	(_frame_count+1),w
	xorwf	1+(??_rx_data+0)+0,w
	skipz
	goto	u745
	movf	(_frame_count),w
	xorwf	0+(??_rx_data+0)+0,w
u745:
	skipnz
	goto	u741
	goto	u740
u741:
	goto	l14262
u740:
	line	114
	
l14236:	
;recive.c: 113: {
;recive.c: 114: frame_count = rf_buf[1];
	movf	0+(_rf_buf)+01h,w
	movwf	(_frame_count)
	clrf	(_frame_count+1)
	clrf	(_frame_count+2)
	clrf	(_frame_count+3)

	line	116
	
l14238:	
;recive.c: 116: rx_flag = 1;
	clrf	(rx_data@rx_flag)
	incf	(rx_data@rx_flag),f
	line	118
	
l14240:	
;recive.c: 118: memcpy(AdvData_23, AdvData_3, 3);
	movlw	low((_AdvData_3-__stringbase))
	movwf	(?_memcpy)
	movlw	80h
	movwf	(?_memcpy+1)
	movlw	03h
	movwf	0+(?_memcpy)+02h
	clrf	1+(?_memcpy)+02h
	movlw	(_AdvData_23)&0ffh
	fcall	_memcpy
	line	119
	
l14242:	
;recive.c: 119: memcpy(AdvData_23 + 3, &rf_buf[2], 14);
	movlw	(_rf_buf+02h&0ffh)
	movwf	(?_memcpy)
	movlw	(0x0/2)
	movwf	(?_memcpy+1)
	movlw	0Eh
	movwf	0+(?_memcpy)+02h
	clrf	1+(?_memcpy)+02h
	movlw	(_AdvData_23+03h)&0ffh
	fcall	_memcpy
	line	121
	
l14244:	
;recive.c: 121: crc18 = UpdateCRC(AdvData_23 + 2, 15);
	movlw	0Fh
	movwf	(?_UpdateCRC)
	clrf	(?_UpdateCRC+1)
	movlw	(_AdvData_23+02h)&0ffh
	fcall	_UpdateCRC
	movf	(1+(?_UpdateCRC)),w
	movwf	(rx_data@crc18+1)
	movf	(0+(?_UpdateCRC)),w
	movwf	(rx_data@crc18)
	line	122
	
l14246:	
;recive.c: 122: AdvData_23[17] = crc18 & 0xff;
	movf	(rx_data@crc18),w
	movwf	0+(_AdvData_23)+011h
	line	123
	
l14248:	
;recive.c: 123: AdvData_23[18] = ((crc18 >> 8) & 0xff);
	movf	(rx_data@crc18+1),w
	movwf	0+(_AdvData_23)+012h
	line	125
	
l14250:	
;recive.c: 125: for (i=0; i < 19; i++)
	clrf	(rx_data@i)
	line	127
	
l14256:	
;recive.c: 126: {
;recive.c: 127: send(AdvData_23[i]);
	movf	(rx_data@i),w
	addlw	_AdvData_23&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_send
	line	125
	
l14258:	
	incf	(rx_data@i),f
	
l14260:	
	movlw	(013h)
	subwf	(rx_data@i),w
	skipc
	goto	u751
	goto	u750
u751:
	goto	l14256
u750:
	goto	l14264
	line	132
	
l14262:	
;recive.c: 130: else
;recive.c: 131: {
;recive.c: 132: rx_flag = 0;
	clrf	(rx_data@rx_flag)
	line	145
	
l14264:	
;recive.c: 133: }
;recive.c: 144: }
;recive.c: 145: return rx_flag;
	movf	(rx_data@rx_flag),w
	line	146
	
l9794:	
	return
	opt stack 0
GLOBAL	__end_of_rx_data
	__end_of_rx_data:
;; =============== function _rx_data ends ============

	signat	_rx_data,89
	global	_RF_RxData
psect	text734,local,class=CODE,delta=2
global __ptext734
__ptext734:

;; *************** function _RF_RxData *****************
;; Defined at:
;;		line 134 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;  payload_buff    1    wreg     PTR unsigned char 
;;		 -> rf_buf(18), 
;;  length          1    7[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  payload_buff    1    9[BANK0 ] PTR unsigned char 
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
psect	text734
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	134
	global	__size_of_RF_RxData
	__size_of_RF_RxData	equ	__end_of_RF_RxData-_RF_RxData
	
_RF_RxData:	
	opt	stack 0
; Regs used in _RF_RxData: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_RxData@payload_buff stored from wreg
	movwf	(RF_RxData@payload_buff)
	line	135
	
l14168:	
;rf297L.c: 135: if(!(RF_GetStatus() & 0X40))
	fcall	_RF_GetStatus
	movwf	(??_RF_RxData+0)+0
	btfsc	0+(??_RF_RxData+0)+0,(6)&7
	goto	u681
	goto	u680
u681:
	goto	l14174
u680:
	line	137
	
l14170:	
;rf297L.c: 136: {
;rf297L.c: 137: return 0;
	movlw	(0)
	goto	l5145
	line	139
	
l14174:	
;rf297L.c: 138: }
;rf297L.c: 139: RF_Read_Buff(0x61, payload_buff, length);
	movf	(RF_RxData@payload_buff),w
	movwf	(?_RF_Read_Buff)
	movf	(RF_RxData@length),w
	movwf	0+(?_RF_Read_Buff)+01h
	movlw	(061h)
	fcall	_RF_Read_Buff
	line	141
	
l14176:	
;rf297L.c: 141: RF_ClearFIFO();
	fcall	_RF_ClearFIFO
	line	142
	
l14178:	
;rf297L.c: 142: RF_ClearStatus();
	fcall	_RF_ClearStatus
	line	143
	
l14180:	
;rf297L.c: 143: return 1;
	movlw	(01h)
	line	144
	
l5145:	
	return
	opt stack 0
GLOBAL	__end_of_RF_RxData
	__end_of_RF_RxData:
;; =============== function _RF_RxData ends ============

	signat	_RF_RxData,8313
	global	_RF_ClearStatus
psect	text735,local,class=CODE,delta=2
global __ptext735
__ptext735:

;; *************** function _RF_ClearStatus *****************
;; Defined at:
;;		line 249 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
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
psect	text735
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	249
	global	__size_of_RF_ClearStatus
	__size_of_RF_ClearStatus	equ	__end_of_RF_ClearStatus-_RF_ClearStatus
	
_RF_ClearStatus:	
	opt	stack 2
; Regs used in _RF_ClearStatus: [wreg+status,2+status,0+pclath+cstack]
	line	250
	
l14166:	
;rf297L.c: 250: RF_WriteReg(0x20 + 0x07,0x70);
	movlw	(070h)
	movwf	(?_RF_WriteReg)
	movlw	(027h)
	fcall	_RF_WriteReg
	line	251
	
l5164:	
	return
	opt stack 0
GLOBAL	__end_of_RF_ClearStatus
	__end_of_RF_ClearStatus:
;; =============== function _RF_ClearStatus ends ============

	signat	_RF_ClearStatus,88
	global	_RF_ClearFIFO
psect	text736,local,class=CODE,delta=2
global __ptext736
__ptext736:

;; *************** function _RF_ClearFIFO *****************
;; Defined at:
;;		line 243 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
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
psect	text736
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	243
	global	__size_of_RF_ClearFIFO
	__size_of_RF_ClearFIFO	equ	__end_of_RF_ClearFIFO-_RF_ClearFIFO
	
_RF_ClearFIFO:	
	opt	stack 2
; Regs used in _RF_ClearFIFO: [wreg+status,2+status,0+pclath+cstack]
	line	244
	
l14164:	
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
	
l5161:	
	return
	opt stack 0
GLOBAL	__end_of_RF_ClearFIFO
	__end_of_RF_ClearFIFO:
;; =============== function _RF_ClearFIFO ends ============

	signat	_RF_ClearFIFO,88
	global	_RF_GetStatus
psect	text737,local,class=CODE,delta=2
global __ptext737
__ptext737:

;; *************** function _RF_GetStatus *****************
;; Defined at:
;;		line 254 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
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
psect	text737
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	254
	global	__size_of_RF_GetStatus
	__size_of_RF_GetStatus	equ	__end_of_RF_GetStatus-_RF_GetStatus
	
_RF_GetStatus:	
	opt	stack 0
; Regs used in _RF_GetStatus: [wreg+status,2+status,0+pclath+cstack]
	line	255
	
l14160:	
;rf297L.c: 255: return RF_ReadReg(0x07)&0x70;
	movlw	(07h)
	fcall	_RF_ReadReg
	andlw	070h
	line	256
	
l5167:	
	return
	opt stack 0
GLOBAL	__end_of_RF_GetStatus
	__end_of_RF_GetStatus:
;; =============== function _RF_GetStatus ends ============

	signat	_RF_GetStatus,89
	global	_RF_Set_RxMode
psect	text738,local,class=CODE,delta=2
global __ptext738
__ptext738:

;; *************** function _RF_Set_RxMode *****************
;; Defined at:
;;		line 267 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
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
psect	text738
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	267
	global	__size_of_RF_Set_RxMode
	__size_of_RF_Set_RxMode	equ	__end_of_RF_Set_RxMode-_RF_Set_RxMode
	
_RF_Set_RxMode:	
	opt	stack 3
; Regs used in _RF_Set_RxMode: [wreg+status,2+status,0+pclath+cstack]
	line	268
	
l14156:	
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
	
l14158:	
;rf297L.c: 270: RA7=1;
	bsf	(47/8),(47)&7
	line	271
;rf297L.c: 271: soft_delay_ms(10);
	movlw	0Ah
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	272
	
l5173:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Set_RxMode
	__end_of_RF_Set_RxMode:
;; =============== function _RF_Set_RxMode ends ============

	signat	_RF_Set_RxMode,88
	global	_RF_Init
psect	text739,local,class=CODE,delta=2
global __ptext739
__ptext739:

;; *************** function _RF_Init *****************
;; Defined at:
;;		line 45 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
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
psect	text739
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	45
	global	__size_of_RF_Init
	__size_of_RF_Init	equ	__end_of_RF_Init-_RF_Init
	
_RF_Init:	
	opt	stack 3
; Regs used in _RF_Init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	75
	
l14106:	
	line	76
	
l14108:	
;rf297L.c: 76: SPI_init();
	fcall	_SPI_init
	line	77
	
l14110:	
;rf297L.c: 77: RF_WriteReg(0x53, 0x5A);
	movlw	(05Ah)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_RF_WriteReg)
	movlw	(053h)
	fcall	_RF_WriteReg
	line	78
	
l14112:	
;rf297L.c: 78: RF_WriteReg(0x53, 0XA5);
	movlw	(0A5h)
	movwf	(?_RF_WriteReg)
	movlw	(053h)
	fcall	_RF_WriteReg
	line	79
	
l14114:	
;rf297L.c: 79: RF_WriteReg(0xE1, 0);
	clrf	(?_RF_WriteReg)
	movlw	(0E1h)
	fcall	_RF_WriteReg
	line	80
	
l14116:	
;rf297L.c: 80: RF_WriteReg(0xE2, 0);
	clrf	(?_RF_WriteReg)
	movlw	(0E2h)
	fcall	_RF_WriteReg
	line	81
	
l14118:	
;rf297L.c: 81: RF_WriteReg(0x20 + 0x07, 0x70);
	movlw	(070h)
	movwf	(?_RF_WriteReg)
	movlw	(027h)
	fcall	_RF_WriteReg
	line	82
	
l14120:	
;rf297L.c: 82: RF_WriteReg(0x20 + 0x02, 0x01);
	clrf	(?_RF_WriteReg)
	incf	(?_RF_WriteReg),f
	movlw	(022h)
	fcall	_RF_WriteReg
	line	83
	
l14122:	
;rf297L.c: 83: RF_WriteReg(0x20 + 0x03, 0x01);
	clrf	(?_RF_WriteReg)
	incf	(?_RF_WriteReg),f
	movlw	(023h)
	fcall	_RF_WriteReg
	line	84
	
l14124:	
;rf297L.c: 84: RF_WriteReg(0x20 + 0x05, 26);
	movlw	(01Ah)
	movwf	(?_RF_WriteReg)
	movlw	(025h)
	fcall	_RF_WriteReg
	line	85
	
l14126:	
;rf297L.c: 85: RF_WriteReg(0x20 + 0x11, 18);
	movlw	(012h)
	movwf	(?_RF_WriteReg)
	movlw	(031h)
	fcall	_RF_WriteReg
	line	86
	
l14128:	
;rf297L.c: 86: RF_Write_Buff(0x20 + 0x10, TX_ADDRESS_DEF, sizeof(TX_ADDRESS_DEF));
	movlw	((_TX_ADDRESS_DEF-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(030h)
	fcall	_RF_Write_Buff
	line	87
	
l14130:	
;rf297L.c: 87: RF_Write_Buff(0x20 + 0x0A,RX_ADDRESS_DEF, sizeof(RX_ADDRESS_DEF));
	movlw	((_RX_ADDRESS_DEF-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(02Ah)
	fcall	_RF_Write_Buff
	line	88
	
l14132:	
;rf297L.c: 88: RF_Write_Buff(0x20 + 0x1F, BB_cal_data, sizeof(BB_cal_data));
	movlw	((RF_Init@BB_cal_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(05h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(03Fh)
	fcall	_RF_Write_Buff
	line	89
	
l14134:	
;rf297L.c: 89: RF_Write_Buff(0x20 + 0x1A, RF_cal2_data, sizeof(RF_cal2_data));
	movlw	((RF_Init@RF_cal2_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(06h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(03Ah)
	fcall	_RF_Write_Buff
	line	90
	
l14136:	
;rf297L.c: 90: RF_Write_Buff(0x20 + 0x19, Dem_cal_data, sizeof(Dem_cal_data));
	movlw	((RF_Init@Dem_cal_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	clrf	0+(?_RF_Write_Buff)+01h
	incf	0+(?_RF_Write_Buff)+01h,f
	movlw	(039h)
	fcall	_RF_Write_Buff
	line	91
	
l14138:	
;rf297L.c: 91: RF_Write_Buff(0x20 + 0x1E, RF_cal_data, sizeof(RF_cal_data));
	movlw	((RF_Init@RF_cal_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(03Eh)
	fcall	_RF_Write_Buff
	line	92
	
l14140:	
;rf297L.c: 92: RF_Write_Buff(0x20 + 0x1B, Dem_cal2_data,sizeof(Dem_cal2_data));
	movlw	((RF_Init@Dem_cal2_data-__stringbase))&0ffh
	movwf	(?_RF_Write_Buff)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+01h
	movlw	(03Bh)
	fcall	_RF_Write_Buff
	line	93
	
l14142:	
;rf297L.c: 93: RF_WriteReg(0x20 + 0x1C, 0x00);
	clrf	(?_RF_WriteReg)
	movlw	(03Ch)
	fcall	_RF_WriteReg
	line	94
	
l14144:	
;rf297L.c: 94: RF_WriteReg(0x20 + 0x06, (0x0e |0X00));
	movlw	(0Eh)
	movwf	(?_RF_WriteReg)
	movlw	(026h)
	fcall	_RF_WriteReg
	line	95
	
l14146:	
;rf297L.c: 95: RF_WriteReg(0x50, 0x73);
	movlw	(073h)
	movwf	(?_RF_WriteReg)
	movlw	(050h)
	fcall	_RF_WriteReg
	line	101
	
l14148:	
;rf297L.c: 101: RF_WriteReg(0x20 + 0x04,0x00);
	clrf	(?_RF_WriteReg)
	movlw	(024h)
	fcall	_RF_WriteReg
	line	102
	
l14150:	
;rf297L.c: 102: RF_WriteReg(0x20 + 0x01, 0x00);
	clrf	(?_RF_WriteReg)
	movlw	(021h)
	fcall	_RF_WriteReg
	line	117
;rf297L.c: 113: if(18 >32){
	
l14154:	
;rf297L.c: 115: }
;rf297L.c: 117: RF_WriteReg(0x20 + 0x1D, feature);
	clrf	(?_RF_WriteReg)
	movlw	(03Dh)
	fcall	_RF_WriteReg
	line	118
	
l5141:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Init
	__end_of_RF_Init:
;; =============== function _RF_Init ends ============

	signat	_RF_Init,88
	global	_send
psect	text740,local,class=CODE,delta=2
global __ptext740
__ptext740:

;; *************** function _send *****************
;; Defined at:
;;		line 6 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\uart.c"
;; Parameters:    Size  Location     Type
;;  uContent        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  uContent        1    4[BANK0 ] unsigned char 
;;  i               1    6[BANK0 ] unsigned char 
;;  uSendContent    1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_Delay_us
;; This function is called by:
;;		_rx_data
;; This function uses a non-reentrant model
;;
psect	text740
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\uart.c"
	line	6
	global	__size_of_send
	__size_of_send	equ	__end_of_send-_send
	
_send:	
	opt	stack 2
; Regs used in _send: [wreg+status,2+status,0+pclath+cstack]
;send@uContent stored from wreg
	movwf	(send@uContent)
	line	7
	
l14078:	
	line	8
	
l14080:	
	line	9
	
l14082:	
;uart.c: 9: uSendContent=uContent;
	movf	(send@uContent),w
	movwf	(send@uSendContent)
	line	10
	
l14084:	
;uart.c: 10: TRISB1=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1073/8)^080h,(1073)&7
	line	11
	
l14086:	
;uart.c: 11: RB1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(49/8),(49)&7
	line	12
	
l14088:	
;uart.c: 12: Delay_us(15);
	movlw	0Fh
	movwf	(?_Delay_us)
	clrf	(?_Delay_us+1)
	fcall	_Delay_us
	line	13
	
l14090:	
;uart.c: 13: for(i=0;i<8;i++)
	clrf	(send@i)
	line	14
	
l11783:	
	line	15
;uart.c: 14: {
;uart.c: 15: RB1 =uSendContent&0x01;
	btfsc	(send@uSendContent),0
	goto	u651
	goto	u650
	
u651:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(49/8),(49)&7
	goto	u664
u650:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(49/8),(49)&7
u664:
	line	16
	
l14096:	
;uart.c: 16: Delay_us(15);
	movlw	0Fh
	movwf	(?_Delay_us)
	clrf	(?_Delay_us+1)
	fcall	_Delay_us
	line	17
	
l14098:	
;uart.c: 17: uSendContent=uSendContent>>1;
	clrc
	rrf	(send@uSendContent),f
	line	13
	
l14100:	
	incf	(send@i),f
	
l14102:	
	movlw	(08h)
	subwf	(send@i),w
	skipc
	goto	u671
	goto	u670
u671:
	goto	l11783
u670:
	
l11784:	
	line	19
;uart.c: 18: }
;uart.c: 19: RB1=1;
	bsf	(49/8),(49)&7
	line	20
	
l14104:	
;uart.c: 20: Delay_us(15);
	movlw	0Fh
	movwf	(?_Delay_us)
	clrf	(?_Delay_us+1)
	fcall	_Delay_us
	line	21
	
l11785:	
	return
	opt stack 0
GLOBAL	__end_of_send
	__end_of_send:
;; =============== function _send ends ============

	signat	_send,4216
	global	_RF_ReadReg
psect	text741,local,class=CODE,delta=2
global __ptext741
__ptext741:

;; *************** function _RF_ReadReg *****************
;; Defined at:
;;		line 306 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;  reg_addr        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg_addr        1    2[BANK0 ] unsigned char 
;;  tmp             1    3[BANK0 ] unsigned char 
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
psect	text741
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	306
	global	__size_of_RF_ReadReg
	__size_of_RF_ReadReg	equ	__end_of_RF_ReadReg-_RF_ReadReg
	
_RF_ReadReg:	
	opt	stack 0
; Regs used in _RF_ReadReg: [wreg+status,2+status,0+pclath+cstack]
;RF_ReadReg@reg_addr stored from wreg
	line	308
	movwf	(RF_ReadReg@reg_addr)
	
l14068:	
;rf297L.c: 307: unsigned char tmp;
;rf297L.c: 308: RE2=0;
	bcf	(74/8),(74)&7
	line	309
	
l14070:	
;rf297L.c: 309: SPI_RW(reg_addr);
	movf	(RF_ReadReg@reg_addr),w
	fcall	_SPI_RW
	line	310
;rf297L.c: 310: tmp = SPI_RW(0);
	movlw	(0)
	fcall	_SPI_RW
	movwf	(RF_ReadReg@tmp)
	line	311
	
l14072:	
;rf297L.c: 311: RE2=1;
	bsf	(74/8),(74)&7
	line	312
	
l14074:	
;rf297L.c: 312: return tmp;
	movf	(RF_ReadReg@tmp),w
	line	313
	
l5191:	
	return
	opt stack 0
GLOBAL	__end_of_RF_ReadReg
	__end_of_RF_ReadReg:
;; =============== function _RF_ReadReg ends ============

	signat	_RF_ReadReg,4217
	global	_RF_Read_Buff
psect	text742,local,class=CODE,delta=2
global __ptext742
__ptext742:

;; *************** function _RF_Read_Buff *****************
;; Defined at:
;;		line 275 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;  reg_addr        1    wreg     unsigned char 
;;  pBuff           1    2[BANK0 ] PTR unsigned char 
;;		 -> rf_buf(18), 
;;  length          1    3[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg_addr        1    5[BANK0 ] unsigned char 
;;  byte_ctr        1    6[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_SPI_RW
;; This function is called by:
;;		_RF_RxData
;; This function uses a non-reentrant model
;;
psect	text742
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	275
	global	__size_of_RF_Read_Buff
	__size_of_RF_Read_Buff	equ	__end_of_RF_Read_Buff-_RF_Read_Buff
	
_RF_Read_Buff:	
	opt	stack 1
; Regs used in _RF_Read_Buff: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_Read_Buff@reg_addr stored from wreg
	line	277
	movwf	(RF_Read_Buff@reg_addr)
	
l14056:	
;rf297L.c: 276: unsigned char byte_ctr;
;rf297L.c: 277: RE2=0;
	bcf	(74/8),(74)&7
	line	278
	
l14058:	
;rf297L.c: 278: SPI_RW(reg_addr);
	movf	(RF_Read_Buff@reg_addr),w
	fcall	_SPI_RW
	line	279
	
l14060:	
;rf297L.c: 279: for(byte_ctr=0;byte_ctr<length;byte_ctr++){
	clrf	(RF_Read_Buff@byte_ctr)
	goto	l14066
	line	280
	
l14062:	
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
	
l14064:	
	incf	(RF_Read_Buff@byte_ctr),f
	
l14066:	
	movf	(RF_Read_Buff@length),w
	subwf	(RF_Read_Buff@byte_ctr),w
	skipc
	goto	u641
	goto	u640
u641:
	goto	l14062
u640:
	
l5178:	
	line	282
;rf297L.c: 281: }
;rf297L.c: 282: RE2=1;
	bsf	(74/8),(74)&7
	line	283
	
l5179:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Read_Buff
	__end_of_RF_Read_Buff:
;; =============== function _RF_Read_Buff ends ============

	signat	_RF_Read_Buff,12408
	global	_RF_Write_Buff
psect	text743,local,class=CODE,delta=2
global __ptext743
__ptext743:

;; *************** function _RF_Write_Buff *****************
;; Defined at:
;;		line 286 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;  reg_addr        1    wreg     unsigned char 
;;  pBuff           1    2[BANK0 ] PTR unsigned char 
;;		 -> RF_Carrier@Dem_cal2_data(3), RF_Carrier@RF_cal_data(3), RF_Carrier@Dem_cal_data(1), RF_Carrier@RF_cal2_data(6), 
;;		 -> RF_Carrier@BB_cal_data(5), RF_Init@Dem_cal2_data(3), RF_Init@RF_cal_data(3), RF_Init@Dem_cal_data(1), 
;;		 -> RF_Init@RF_cal2_data(6), RF_Init@BB_cal_data(5), RX_ADDRESS_DEF(3), TX_ADDRESS_DEF(3), 
;;  length          1    3[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg_addr        1    4[BANK0 ] unsigned char 
;;  i               1    5[BANK0 ] unsigned char 
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
psect	text743
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	286
	global	__size_of_RF_Write_Buff
	__size_of_RF_Write_Buff	equ	__end_of_RF_Write_Buff-_RF_Write_Buff
	
_RF_Write_Buff:	
	opt	stack 3
; Regs used in _RF_Write_Buff: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_Write_Buff@reg_addr stored from wreg
	line	288
	movwf	(RF_Write_Buff@reg_addr)
	
l14044:	
;rf297L.c: 287: unsigned char i;
;rf297L.c: 288: RE2=0;
	bcf	(74/8),(74)&7
	line	289
	
l14046:	
;rf297L.c: 289: SPI_RW(reg_addr);
	movf	(RF_Write_Buff@reg_addr),w
	fcall	_SPI_RW
	line	290
	
l14048:	
;rf297L.c: 290: for(i=0;i<length;i++)
	clrf	(RF_Write_Buff@i)
	goto	l14054
	line	292
	
l14050:	
;rf297L.c: 291: {
;rf297L.c: 292: SPI_RW(pBuff[i]);
	movf	(RF_Write_Buff@i),w
	addwf	(RF_Write_Buff@pBuff),w
	movwf	fsr0
	fcall	stringdir
	fcall	_SPI_RW
	line	290
	
l14052:	
	incf	(RF_Write_Buff@i),f
	
l14054:	
	movf	(RF_Write_Buff@length),w
	subwf	(RF_Write_Buff@i),w
	skipc
	goto	u631
	goto	u630
u631:
	goto	l14050
u630:
	
l5184:	
	line	294
;rf297L.c: 293: }
;rf297L.c: 294: RE2=1;
	bsf	(74/8),(74)&7
	line	295
	
l5185:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Write_Buff
	__end_of_RF_Write_Buff:
;; =============== function _RF_Write_Buff ends ============

	signat	_RF_Write_Buff,12408
	global	_RF_WriteReg
psect	text744,local,class=CODE,delta=2
global __ptext744
__ptext744:

;; *************** function _RF_WriteReg *****************
;; Defined at:
;;		line 298 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;  reg_addr        1    wreg     unsigned char 
;;  write_data      1    2[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg_addr        1    3[BANK0 ] unsigned char 
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
psect	text744
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	298
	global	__size_of_RF_WriteReg
	__size_of_RF_WriteReg	equ	__end_of_RF_WriteReg-_RF_WriteReg
	
_RF_WriteReg:	
	opt	stack 2
; Regs used in _RF_WriteReg: [wreg+status,2+status,0+pclath+cstack]
;RF_WriteReg@reg_addr stored from wreg
	movwf	(RF_WriteReg@reg_addr)
	line	299
	
l14038:	
;rf297L.c: 299: RE2=0;
	bcf	(74/8),(74)&7
	line	300
	
l14040:	
;rf297L.c: 300: SPI_RW(reg_addr);
	movf	(RF_WriteReg@reg_addr),w
	fcall	_SPI_RW
	line	301
;rf297L.c: 301: SPI_RW(write_data);
	movf	(RF_WriteReg@write_data),w
	fcall	_SPI_RW
	line	302
	
l14042:	
;rf297L.c: 302: RE2=1;
	bsf	(74/8),(74)&7
	line	303
	
l5188:	
	return
	opt stack 0
GLOBAL	__end_of_RF_WriteReg
	__end_of_RF_WriteReg:
;; =============== function _RF_WriteReg ends ============

	signat	_RF_WriteReg,8312
	global	_memcpy
psect	text745,local,class=CODE,delta=2
global __ptext745
__ptext745:

;; *************** function _memcpy *****************
;; Defined at:
;;		line 10 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\data\sources\memcpy.c"
;; Parameters:    Size  Location     Type
;;  d1              1    wreg     PTR void 
;;		 -> AdvData_23(19), 
;;  s1              2    0[BANK0 ] PTR const void 
;;		 -> AdvData_3(3), rf_buf(18), 
;;  n               2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  d1              1    5[BANK0 ] PTR void 
;;		 -> AdvData_23(19), 
;;  s               2    6[BANK0 ] PTR const unsigned char 
;;		 -> AdvData_3(3), rf_buf(18), 
;;  d               1    8[BANK0 ] PTR unsigned char 
;;		 -> AdvData_23(19), 
;; Return value:  Size  Location     Type
;;                  1    wreg      PTR void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       9       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rx_data
;; This function uses a non-reentrant model
;;
psect	text745
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\data\sources\memcpy.c"
	line	10
	global	__size_of_memcpy
	__size_of_memcpy	equ	__end_of_memcpy-_memcpy
	
_memcpy:	
	opt	stack 3
; Regs used in _memcpy: [wreg-fsr0h+status,2+status,0+btemp+1+pclath]
;memcpy@d1 stored from wreg
	line	19
	movwf	(memcpy@d1)
	
l14028:	
	movf	(memcpy@s1+1),w
	movwf	(memcpy@s+1)
	movf	(memcpy@s1),w
	movwf	(memcpy@s)
	line	20
	movf	(memcpy@d1),w
	movwf	(memcpy@d)
	line	21
	goto	l14036
	line	22
	
l14030:	
	movf	(memcpy@s+1),w
	movwf	btemp+1
	movf	(memcpy@s),w
	movwf	fsr0
	fcall	stringtab
	movwf	(??_memcpy+0)+0
	movf	(memcpy@d),w
	movwf	fsr0
	movf	(??_memcpy+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l14032:	
	incf	(memcpy@s),f
	skipnz
	incf	(memcpy@s+1),f
	
l14034:	
	incf	(memcpy@d),f
	line	21
	
l14036:	
	movlw	low(01h)
	subwf	(memcpy@n),f
	movlw	high(01h)
	skipc
	decf	(memcpy@n+1),f
	subwf	(memcpy@n+1),f
	incf	((memcpy@n)),w
	skipnz
	incf	((memcpy@n+1)),w

	skipz
	goto	u621
	goto	u620
u621:
	goto	l14030
u620:
	line	24
	
l12771:	
	return
	opt stack 0
GLOBAL	__end_of_memcpy
	__end_of_memcpy:
;; =============== function _memcpy ends ============

	signat	_memcpy,12409
	global	_UpdateCRC
psect	text746,local,class=CODE,delta=2
global __ptext746
__ptext746:

;; *************** function _UpdateCRC *****************
;; Defined at:
;;		line 45 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\recive.c"
;; Parameters:    Size  Location     Type
;;  CRC_input       1    wreg     PTR unsigned char 
;;		 -> AdvData_23(19), rf_buf(18), 
;;  len             2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  CRC_input       1    5[BANK0 ] PTR unsigned char 
;;		 -> AdvData_23(19), rf_buf(18), 
;;  CRC_acc         2    8[BANK0 ] unsigned short 
;;  i               1    7[BANK0 ] unsigned char 
;;  k               1    6[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned short 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       5       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      10       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rx_data
;; This function uses a non-reentrant model
;;
psect	text746
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\recive.c"
	line	45
	global	__size_of_UpdateCRC
	__size_of_UpdateCRC	equ	__end_of_UpdateCRC-_UpdateCRC
	
_UpdateCRC:	
	opt	stack 3
; Regs used in _UpdateCRC: [wreg-fsr0h+status,2+status,0+btemp+1]
;UpdateCRC@CRC_input stored from wreg
	movwf	(UpdateCRC@CRC_input)
	line	46
	
l14000:	
;recive.c: 46: unsigned char i,k = 0;
	clrf	(UpdateCRC@k)
	line	47
	
l14002:	
;recive.c: 47: unsigned short CRC_acc=0x5555;
	movlw	low(05555h)
	movwf	(UpdateCRC@CRC_acc)
	movlw	high(05555h)
	movwf	((UpdateCRC@CRC_acc))+1
	line	49
;recive.c: 49: while (len--)
	goto	l14022
	line	51
	
l14004:	
;recive.c: 50: {
;recive.c: 51: CRC_acc = CRC_acc ^ (CRC_input[k++] << 8);
	movf	(UpdateCRC@k),w
	addwf	(UpdateCRC@CRC_input),w
	movwf	(??_UpdateCRC+0)+0
	movf	0+(??_UpdateCRC+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
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
	
l14006:	
	incf	(UpdateCRC@k),f
	line	53
	
l14008:	
;recive.c: 53: for (i = 0; i < 8; i++)
	clrf	(UpdateCRC@i)
	line	54
	
l9778:	
	line	55
;recive.c: 54: {
;recive.c: 55: if ((CRC_acc & 0x8000) == 0x8000)
	btfss	(UpdateCRC@CRC_acc+1),(15)&7
	goto	u591
	goto	u590
u591:
	goto	l14018
u590:
	line	57
	
l14014:	
;recive.c: 56: {
;recive.c: 57: CRC_acc = CRC_acc << 1;
	clrc
	rlf	(UpdateCRC@CRC_acc),f
	rlf	(UpdateCRC@CRC_acc+1),f
	line	58
	
l14016:	
;recive.c: 58: CRC_acc ^= 0x1021;
	movlw	low(01021h)
	xorwf	(UpdateCRC@CRC_acc),f
	movlw	high(01021h)
	xorwf	(UpdateCRC@CRC_acc+1),f
	line	59
;recive.c: 59: }
	goto	l9781
	line	62
	
l14018:	
;recive.c: 60: else
;recive.c: 61: {
;recive.c: 62: CRC_acc = CRC_acc << 1;
	clrc
	rlf	(UpdateCRC@CRC_acc),f
	rlf	(UpdateCRC@CRC_acc+1),f
	line	63
	
l9781:	
	line	53
	incf	(UpdateCRC@i),f
	
l14020:	
	movlw	(08h)
	subwf	(UpdateCRC@i),w
	skipc
	goto	u601
	goto	u600
u601:
	goto	l9778
u600:
	line	49
	
l14022:	
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
	goto	u611
	goto	u610
u611:
	goto	l14004
u610:
	line	66
	
l14024:	
;recive.c: 63: }
;recive.c: 64: }
;recive.c: 65: }
;recive.c: 66: return CRC_acc;
	movf	(UpdateCRC@CRC_acc+1),w
	movwf	(?_UpdateCRC+1)
	movf	(UpdateCRC@CRC_acc),w
	movwf	(?_UpdateCRC)
	line	67
	
l9783:	
	return
	opt stack 0
GLOBAL	__end_of_UpdateCRC
	__end_of_UpdateCRC:
;; =============== function _UpdateCRC ends ============

	signat	_UpdateCRC,8314
	global	_Delay_us
psect	text747,local,class=CODE,delta=2
global __ptext747
__ptext747:

;; *************** function _Delay_us *****************
;; Defined at:
;;		line 23 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\delay.c"
;; Parameters:    Size  Location     Type
;;  us              2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2    2[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_send
;; This function uses a non-reentrant model
;;
psect	text747
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\delay.c"
	line	23
	global	__size_of_Delay_us
	__size_of_Delay_us	equ	__end_of_Delay_us-_Delay_us
	
_Delay_us:	
	opt	stack 2
; Regs used in _Delay_us: [wreg+status,2+status,0]
	line	24
	
l13982:	
	line	25
	
l13984:	
;delay.c: 25: i = us/2;
	movf	(Delay_us@us+1),w
	movwf	(Delay_us@i+1)
	movf	(Delay_us@us),w
	movwf	(Delay_us@i)
	
l13986:	
	clrc
	rrf	(Delay_us@i+1),f
	rrf	(Delay_us@i),f
	line	26
	
l13988:	
;delay.c: 26: i--;
	movlw	low(01h)
	subwf	(Delay_us@i),f
	movlw	high(01h)
	skipc
	decf	(Delay_us@i+1),f
	subwf	(Delay_us@i+1),f
	line	27
	
l13990:	
# 27 "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\delay.c"
nop ;#
psect	text747
	line	28
	
l13992:	
;delay.c: 28: for(;i!=0;i--)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((Delay_us@i+1)),w
	iorwf	((Delay_us@i)),w
	skipz
	goto	u581
	goto	u580
u581:
	goto	l5854
u580:
	goto	l5856
	line	29
	
l5854:	
	line	30
# 30 "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\delay.c"
nop ;#
# 30 "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\delay.c"
nop ;#
# 30 "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\delay.c"
nop ;#
	line	31
# 31 "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\delay.c"
nop ;#
# 31 "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\delay.c"
nop ;#
# 31 "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\delay.c"
nop ;#
psect	text747
	line	28
	
l13996:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(Delay_us@i),f
	movlw	high(01h)
	skipc
	decf	(Delay_us@i+1),f
	subwf	(Delay_us@i+1),f
	goto	l13992
	line	34
	
l5856:	
	return
	opt stack 0
GLOBAL	__end_of_Delay_us
	__end_of_Delay_us:
;; =============== function _Delay_us ends ============

	signat	_Delay_us,4216
	global	_SPI_RW
psect	text748,local,class=CODE,delta=2
global __ptext748
__ptext748:

;; *************** function _SPI_RW *****************
;; Defined at:
;;		line 331 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;  read_reg_add    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  read_reg_add    1    0[BANK0 ] unsigned char 
;;  i               1    1[BANK0 ] unsigned char 
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
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
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
psect	text748
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	331
	global	__size_of_SPI_RW
	__size_of_SPI_RW	equ	__end_of_SPI_RW-_SPI_RW
	
_SPI_RW:	
	opt	stack 2
; Regs used in _SPI_RW: [wreg+status,2+status,0]
;SPI_RW@read_reg_addr stored from wreg
	line	333
	movwf	(SPI_RW@read_reg_addr)
	
l13964:	
;rf297L.c: 332: unsigned char i;
;rf297L.c: 333: for(i = 0; i < 8; i++)
	clrf	(SPI_RW@i)
	line	334
	
l5197:	
	line	335
;rf297L.c: 334: {
;rf297L.c: 335: RE1=0;
	bcf	(73/8),(73)&7
	line	336
;rf297L.c: 336: if(read_reg_addr & 0x80)
	btfss	(SPI_RW@read_reg_addr),(7)&7
	goto	u551
	goto	u550
u551:
	goto	l5199
u550:
	line	338
	
l13970:	
;rf297L.c: 337: {
;rf297L.c: 338: RA5=1;
	bsf	(45/8),(45)&7
	line	339
;rf297L.c: 339: }
	goto	l5200
	line	340
	
l5199:	
	line	342
;rf297L.c: 340: else
;rf297L.c: 341: {
;rf297L.c: 342: RA5=0;
	bcf	(45/8),(45)&7
	line	343
	
l5200:	
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
	goto	u561
	goto	u560
u561:
	goto	l13974
u560:
	line	348
	
l13972:	
;rf297L.c: 347: {
;rf297L.c: 348: read_reg_addr = read_reg_addr | 0x01;
	bsf	(SPI_RW@read_reg_addr)+(0/8),(0)&7
	line	333
	
l13974:	
	incf	(SPI_RW@i),f
	
l13976:	
	movlw	(08h)
	subwf	(SPI_RW@i),w
	skipc
	goto	u571
	goto	u570
u571:
	goto	l5197
u570:
	
l5198:	
	line	351
;rf297L.c: 349: }
;rf297L.c: 350: }
;rf297L.c: 351: RE1=0;
	bcf	(73/8),(73)&7
	line	352
	
l13978:	
;rf297L.c: 352: return read_reg_addr;
	movf	(SPI_RW@read_reg_addr),w
	line	353
	
l5202:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_RW
	__end_of_SPI_RW:
;; =============== function _SPI_RW ends ============

	signat	_SPI_RW,4217
	global	_SPI_init
psect	text749,local,class=CODE,delta=2
global __ptext749
__ptext749:

;; *************** function _SPI_init *****************
;; Defined at:
;;		line 316 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
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
psect	text749
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\rf297L.c"
	line	316
	global	__size_of_SPI_init
	__size_of_SPI_init	equ	__end_of_SPI_init-_SPI_init
	
_SPI_init:	
	opt	stack 4
; Regs used in _SPI_init: []
	line	318
	
l13582:	
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
	
l5194:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_init
	__end_of_SPI_init:
;; =============== function _SPI_init ends ============

	signat	_SPI_init,88
	global	_Enable_Interrupt
psect	text750,local,class=CODE,delta=2
global __ptext750
__ptext750:

;; *************** function _Enable_Interrupt *****************
;; Defined at:
;;		line 38 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\system.c"
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
psect	text750
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\system.c"
	line	38
	global	__size_of_Enable_Interrupt
	__size_of_Enable_Interrupt	equ	__end_of_Enable_Interrupt-_Enable_Interrupt
	
_Enable_Interrupt:	
	opt	stack 5
; Regs used in _Enable_Interrupt: []
	line	39
	
l13194:	
;system.c: 39: INTCON |= 0x80;
	bsf	(11)+(7/8),(7)&7	;volatile
	line	40
	
l1290:	
	return
	opt stack 0
GLOBAL	__end_of_Enable_Interrupt
	__end_of_Enable_Interrupt:
;; =============== function _Enable_Interrupt ends ============

	signat	_Enable_Interrupt,88
	global	_Timer1_start
psect	text751,local,class=CODE,delta=2
global __ptext751
__ptext751:

;; *************** function _Timer1_start *****************
;; Defined at:
;;		line 43 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\timer1.c"
;; Parameters:    Size  Location     Type
;;  T_nums          2    0[BANK0 ] unsigned int 
;;  Timer1_ISR_e    1    2[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text751
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\timer1.c"
	line	43
	global	__size_of_Timer1_start
	__size_of_Timer1_start	equ	__end_of_Timer1_start-_Timer1_start
	
_Timer1_start:	
	opt	stack 5
; Regs used in _Timer1_start: [wreg]
	line	44
	
l13958:	
;timer1.c: 44: Timer1_set_time = 0xffff - T_nums + Timer1_ISR_execution_total_time;
	movf	(Timer1_start@Timer1_ISR_execution_total_time),w
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
	
l13960:	
;timer1.c: 47: PIR1 &= ~(0x01);
	bcf	(12)+(0/8),(0)&7	;volatile
	line	48
	
l13962:	
;timer1.c: 48: T1CON |= 0x01;
	bsf	(16)+(0/8),(0)&7	;volatile
	line	49
	
l2572:	
	return
	opt stack 0
GLOBAL	__end_of_Timer1_start
	__end_of_Timer1_start:
;; =============== function _Timer1_start ends ============

	signat	_Timer1_start,8312
	global	_Timer1_Init
psect	text752,local,class=CODE,delta=2
global __ptext752
__ptext752:

;; *************** function _Timer1_Init *****************
;; Defined at:
;;		line 29 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\timer1.c"
;; Parameters:    Size  Location     Type
;;  TIMER1_DIVID    1    wreg     enum E573
;; Auto vars:     Size  Location     Type
;;  TIMER1_DIVID    1    0[BANK0 ] enum E573
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
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text752
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\timer1.c"
	line	29
	global	__size_of_Timer1_Init
	__size_of_Timer1_Init	equ	__end_of_Timer1_Init-_Timer1_Init
	
_Timer1_Init:	
	opt	stack 5
; Regs used in _Timer1_Init: [wreg+status,2+status,0]
;Timer1_Init@TIMER1_DIVIDER stored from wreg
	movwf	(Timer1_Init@TIMER1_DIVIDER)
	line	30
	
l13950:	
;timer1.c: 30: T1CON = 0x00;
	clrf	(16)	;volatile
	line	31
	
l13952:	
;timer1.c: 31: T1CON |= TIMER1_DIVIDER;
	movf	(Timer1_Init@TIMER1_DIVIDER),w
	iorwf	(16),f	;volatile
	line	32
	
l13954:	
;timer1.c: 32: INTCON |= (0x40);
	bsf	(11)+(6/8),(6)&7	;volatile
	line	33
	
l13956:	
;timer1.c: 33: PIE1 |= 0x01;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(140)^080h+(0/8),(0)&7	;volatile
	line	34
	
l2569:	
	return
	opt stack 0
GLOBAL	__end_of_Timer1_Init
	__end_of_Timer1_Init:
;; =============== function _Timer1_Init ends ============

	signat	_Timer1_Init,4216
	global	_key_Init
psect	text753,local,class=CODE,delta=2
global __ptext753
__ptext753:

;; *************** function _key_Init *****************
;; Defined at:
;;		line 332 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\key_scan.c"
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
psect	text753
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\key_scan.c"
	line	332
	global	__size_of_key_Init
	__size_of_key_Init	equ	__end_of_key_Init-_key_Init
	
_key_Init:	
	opt	stack 5
; Regs used in _key_Init: [wreg+status,2+status,0]
	line	333
	
l13176:	
;key_scan.c: 333: OPTION_REG &= ~0x80;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(129)^080h+(7/8),(7)&7	;volatile
	line	334
	
l13178:	
;key_scan.c: 334: TRISB|=0x0e;
	movlw	(0Eh)
	iorwf	(134)^080h,f	;volatile
	line	335
;key_scan.c: 335: WPUB|=0x0e;
	movlw	(0Eh)
	iorwf	(149)^080h,f	;volatile
	line	336
	
l7211:	
	return
	opt stack 0
GLOBAL	__end_of_key_Init
	__end_of_key_Init:
;; =============== function _key_Init ends ============

	signat	_key_Init,88
	global	_IIC_Init
psect	text754,local,class=CODE,delta=2
global __ptext754
__ptext754:

;; *************** function _IIC_Init *****************
;; Defined at:
;;		line 11 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\iic.c"
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
psect	text754
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\iic.c"
	line	11
	global	__size_of_IIC_Init
	__size_of_IIC_Init	equ	__end_of_IIC_Init-_IIC_Init
	
_IIC_Init:	
	opt	stack 5
; Regs used in _IIC_Init: []
	line	12
	
l13174:	
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
	
l10476:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_Init
	__end_of_IIC_Init:
;; =============== function _IIC_Init ends ============

	signat	_IIC_Init,88
	global	_soft_delay_ms
psect	text755,local,class=CODE,delta=2
global __ptext755
__ptext755:

;; *************** function _soft_delay_ms *****************
;; Defined at:
;;		line 10 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\delay.c"
;; Parameters:    Size  Location     Type
;;  ms              2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2    2[BANK0 ] volatile unsigned int 
;;  k               1    5[BANK0 ] volatile unsigned char 
;;  j               1    4[BANK0 ] volatile unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_RF_Set_RxMode
;; This function uses a non-reentrant model
;;
psect	text755
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\delay.c"
	line	10
	global	__size_of_soft_delay_ms
	__size_of_soft_delay_ms	equ	__end_of_soft_delay_ms-_soft_delay_ms
	
_soft_delay_ms:	
	opt	stack 4
; Regs used in _soft_delay_ms: [wreg+status,2+status,0]
	line	14
	
l13924:	
;delay.c: 12: volatile unsigned int i;
;delay.c: 13: volatile unsigned char j,k;
;delay.c: 14: for(i=0;i<ms;i++){
	clrf	(soft_delay_ms@i)	;volatile
	clrf	(soft_delay_ms@i+1)	;volatile
	goto	l13948
	line	15
	
l13926:	
;delay.c: 15: for(j=0;j<10;j++){
	clrf	(soft_delay_ms@j)	;volatile
	
l13928:	
	movlw	(0Ah)
	subwf	(soft_delay_ms@j),w	;volatile
	skipc
	goto	u521
	goto	u520
u521:
	goto	l13932
u520:
	goto	l13946
	line	16
	
l13932:	
;delay.c: 16: for(k=0;k<32;k++);
	clrf	(soft_delay_ms@k)	;volatile
	
l13934:	
	movlw	(020h)
	subwf	(soft_delay_ms@k),w	;volatile
	skipc
	goto	u531
	goto	u530
u531:
	goto	l13938
u530:
	goto	l13942
	
l13938:	
	incf	(soft_delay_ms@k),f	;volatile
	goto	l13934
	line	15
	
l13942:	
	incf	(soft_delay_ms@j),f	;volatile
	goto	l13928
	line	14
	
l13946:	
	incf	(soft_delay_ms@i),f	;volatile
	skipnz
	incf	(soft_delay_ms@i+1),f	;volatile
	
l13948:	
	movf	(soft_delay_ms@ms+1),w
	subwf	(soft_delay_ms@i+1),w	;volatile
	skipz
	goto	u545
	movf	(soft_delay_ms@ms),w
	subwf	(soft_delay_ms@i),w	;volatile
u545:
	skipc
	goto	u541
	goto	u540
u541:
	goto	l13926
u540:
	line	19
	
l5851:	
	return
	opt stack 0
GLOBAL	__end_of_soft_delay_ms
	__end_of_soft_delay_ms:
;; =============== function _soft_delay_ms ends ============

	signat	_soft_delay_ms,4216
	global	_system_set_CPU_frequency
psect	text756,local,class=CODE,delta=2
global __ptext756
__ptext756:

;; *************** function _system_set_CPU_frequency *****************
;; Defined at:
;;		line 19 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\system.c"
;; Parameters:    Size  Location     Type
;;  CPU_Frequenc    1    wreg     enum E564
;; Auto vars:     Size  Location     Type
;;  CPU_Frequenc    1    0[BANK0 ] enum E564
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
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text756
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\system.c"
	global	__size_of_system_set_CPU_frequency
	__size_of_system_set_CPU_frequency	equ	__end_of_system_set_CPU_frequency-_system_set_CPU_frequency
	
_system_set_CPU_frequency:	
	opt	stack 5
; Regs used in _system_set_CPU_frequency: [wreg+status,2]
;system_set_CPU_frequency@CPU_Frequency stored from wreg
	movwf	(system_set_CPU_frequency@CPU_Frequency)
	line	20
	
l13920:	
;system.c: 20: OSCCON = CPU_Frequency;
	movf	(system_set_CPU_frequency@CPU_Frequency),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h
	line	21
	
l13922:	
;system.c: 21: OSCTUNE = 0X00;
	clrf	(144)^080h	;volatile
	line	22
	
l1281:	
	return
	opt stack 0
GLOBAL	__end_of_system_set_CPU_frequency
	__end_of_system_set_CPU_frequency:
;; =============== function _system_set_CPU_frequency ends ============

	signat	_system_set_CPU_frequency,4216
	global	_ISR
psect	text757,local,class=CODE,delta=2
global __ptext757
__ptext757:

;; *************** function _ISR *****************
;; Defined at:
;;		line 48 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\system.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  peripheral_i    1    4[COMMON] unsigned char 
;;  inside_intte    1    0        unsigned char 
;;  peripheral_i    1    0        unsigned char 
;;  inside_intte    1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_TIMER1_ISR
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text757
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\system.c"
	line	48
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 0
; Regs used in _ISR: [allreg]
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
	movf	fsr0,w
	movwf	(??_ISR+1)
	movf	pclath,w
	movwf	(??_ISR+2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_ISR+3)
	ljmp	_ISR
psect	text757
	line	53
	
i1l13196:	
;system.c: 49: unsigned char inside_intterrupt_enable,peripheral_intterrupt_enable;
;system.c: 50: unsigned char inside_intterrupt_touch,peripheral_intterrupt_touch;
;system.c: 53: inside_intterrupt_enable = INTCON & 0x38;
	movf	(11),w
	line	54
;system.c: 54: peripheral_intterrupt_enable = PIE1 & 0x43;
	bsf	status, 5	;RP0=1, select bank1
	movf	(140)^080h,w
	line	55
;system.c: 55: inside_intterrupt_touch = INTCON & 0x07;
	movf	(11),w
	line	56
;system.c: 56: peripheral_intterrupt_touch = PIR1 & 0x43;
	bcf	status, 5	;RP0=0, select bank0
	movf	(12),w
	movwf	(ISR@peripheral_intterrupt_touch)
	
i1l13198:	
	movlw	(043h)
	andwf	(ISR@peripheral_intterrupt_touch),f
	line	71
	
i1l13200:	
;system.c: 71: if(peripheral_intterrupt_touch & TIMER1_ISR_TOUCH) {
	btfss	(ISR@peripheral_intterrupt_touch),(0)&7
	goto	u4_21
	goto	u4_20
u4_21:
	goto	i1l1297
u4_20:
	line	72
	
i1l13202:	
;system.c: 72: TIMER1_ISR();
	fcall	_TIMER1_ISR
	line	82
	
i1l1297:	
	movf	(??_ISR+3),w
	movwf	btemp+1
	movf	(??_ISR+2),w
	movwf	pclath
	movf	(??_ISR+1),w
	movwf	fsr0
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
psect	text758,local,class=CODE,delta=2
global __ptext758
__ptext758:

;; *************** function _TIMER1_ISR *****************
;; Defined at:
;;		line 60 in file "D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\timer1.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
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
psect	text758
	file	"D:\CMS_IDE_V1.41.03_CRC_PANCHIP\PAV03-translate\demo\src\timer1.c"
	line	60
	global	__size_of_TIMER1_ISR
	__size_of_TIMER1_ISR	equ	__end_of_TIMER1_ISR-_TIMER1_ISR
	
_TIMER1_ISR:	
	opt	stack 0
; Regs used in _TIMER1_ISR: [wreg]
	line	63
	
i1l13204:	
;timer1.c: 61: static unsigned int flag_1s_add=0;
;timer1.c: 62: static unsigned int flag_1min_add=0;
;timer1.c: 63: T1CON &= ~(0x01);
	bcf	(16)+(0/8),(0)&7	;volatile
	line	64
	
i1l13206:	
;timer1.c: 64: TMR1L = (unsigned char)(Timer1_set_time);
	movf	(_Timer1_set_time),w	;volatile
	movwf	(14)	;volatile
	line	65
;timer1.c: 72: flag_1s_add++;
	movf	(_Timer1_set_time+1),w	;volatile
	movwf	(15)	;volatile
	line	74
	
i1l13208:	
;timer1.c: 74: PIR1 &= ~(0x01);
	bcf	(12)+(0/8),(0)&7	;volatile
	line	75
	
i1l13210:	
;timer1.c: 75: T1CON |= 0x01;
	bsf	(16)+(0/8),(0)&7	;volatile
	line	76
	
i1l2582:	
	return
	opt stack 0
GLOBAL	__end_of_TIMER1_ISR
	__end_of_TIMER1_ISR:
;; =============== function _TIMER1_ISR ends ============

	signat	_TIMER1_ISR,88
psect	text759,local,class=CODE,delta=2
global __ptext759
__ptext759:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
