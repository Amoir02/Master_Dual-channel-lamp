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
	FNCALL	_main,_CCPX_Init
	FNCALL	_main,_CCP1_set_duty_cycle
	FNCALL	_main,_CCP2_set_duty_cycle
	FNCALL	_main,_EEPROM_Init
	FNCALL	_main,_EP_GetONOFFStep
	FNCALL	_main,_PWM_12SetVol
	FNCALL	_main,_EP_SetONOFFStep
	FNCALL	_main,_IIC_Init1
	FNCALL	_main,_AT24C02_Read_Msg
	FNCALL	_main,_RF_Init
	FNCALL	_main,_RF_Set_RxMode
	FNCALL	_main,_RF_ADDSSet
	FNCALL	_main,_SetRunEn
	FNCALL	_main,_Enable_Interrupt
	FNCALL	_main,_Timer1_Init
	FNCALL	_main,_Timer1_start
	FNCALL	_main,_WDT_enable
	FNCALL	_main,_WDT_clear
	FNCALL	_main,_EP_IsADDCfg
	FNCALL	_main,_EP_GetRFAdd
	FNCALL	_main,_RF_Init4
	FNCALL	_main,_RF_Set_RxMode1
	FNCALL	_main,_RF_Init3
	FNCALL	_main,_RF_ENHANCE_RxData
	FNCALL	_main,_Key_Handle
	FNCALL	_main,_recive_task
	FNCALL	_main,_getClock
	FNCALL	_main,_Key_HandRunning
	FNCALL	_main,_LED_ALLOFF
	FNCALL	_recive_task,_rx_data
	FNCALL	_recive_task,_Remote_Pairing
	FNCALL	_recive_task,_Data_Check
	FNCALL	_recive_task,_LED_Dimming
	FNCALL	_recive_task,_LED_ALLOFF
	FNCALL	_recive_task,_PWM_LED1
	FNCALL	_recive_task,_PWM_LED2
	FNCALL	_recive_task,_SetRunEn
	FNCALL	_recive_task,_LEDCon_Chg
	FNCALL	_recive_task,_Delete_One_RemoteAddr
	FNCALL	_recive_task,_RF_ClearFIFO
	FNCALL	_recive_task,_RF_ClearStatus
	FNCALL	_Key_Handle,_EP_SetRFAdd
	FNCALL	_Key_Handle,_soft_delay_ms
	FNCALL	_Key_Handle,_EP_GetRFAdd
	FNCALL	_Key_Handle,_RF_ADDSSet
	FNCALL	_Key_Handle,_EP_SetADDCfg
	FNCALL	_Key_Handle,_Pair_LED
	FNCALL	_Key_Handle,_LED_ALLOFF
	FNCALL	_Key_Handle,_PWM_LED1
	FNCALL	_Key_Handle,_PWM_LED2
	FNCALL	_Key_Handle,_CCP1_set_duty_cycle
	FNCALL	_Key_Handle,_CCP2_set_duty_cycle
	FNCALL	_Key_Handle,_WDT_clear
	FNCALL	_Key_Handle,_SetRunEn
	FNCALL	_Key_Handle,_GetChgLV
	FNCALL	_Key_Handle,_BufSetRun
	FNCALL	_Key_Handle,_LEDCon_Chg
	FNCALL	_Key_Handle,_GerBuff_RunSAT
	FNCALL	_Remote_Pairing,_Data_Check
	FNCALL	_Remote_Pairing,_Write_Remote_Addr
	FNCALL	_Remote_Pairing,_Pair_LED
	FNCALL	_EP_SetRFAdd,_WDT_clear
	FNCALL	_EP_SetRFAdd,_EEPROM_SendByte
	FNCALL	_EP_SetADDCfg,_WDT_clear
	FNCALL	_EP_SetADDCfg,_EEPROM_SendByte
	FNCALL	_EP_SetONOFFStep,_EEPROM_SendByte
	FNCALL	_EP_SetONOFFStep,_WDT_clear
	FNCALL	_Delete_One_RemoteAddr,_Data_Check
	FNCALL	_Delete_One_RemoteAddr,_AT24C02_Write_Msg
	FNCALL	_Write_Remote_Addr,_AT24C02_Write_Msg
	FNCALL	_rx_data,_RF_RxData
	FNCALL	_rx_data,_UpdateCRC
	FNCALL	_EEPROM_SendByte,_IIC_SendByte
	FNCALL	_EEPROM_SendByte,_EEPROM_CheckBusy
	FNCALL	_EP_GetRFAdd,_WDT_clear
	FNCALL	_EP_GetRFAdd,_EEPROM_ReceByte
	FNCALL	_EP_IsADDCfg,_EEPROM_ReceByte
	FNCALL	_EP_IsADDCfg,_WDT_clear
	FNCALL	_AT24C02_Read_Msg,_WDT_clear
	FNCALL	_AT24C02_Read_Msg,_AT24C02_Read_Byte1
	FNCALL	_AT24C02_Read_Msg,_soft_delay_ms
	FNCALL	_EP_GetONOFFStep,_EEPROM_ReceByte
	FNCALL	_EP_GetONOFFStep,_WDT_clear
	FNCALL	_AT24C02_Write_Msg,_WDT_clear
	FNCALL	_AT24C02_Write_Msg,_AT24C02_Write_Byte1
	FNCALL	_AT24C02_Write_Msg,_soft_delay_ms
	FNCALL	_AT24C02_Read_Byte1,_IIC_START1
	FNCALL	_AT24C02_Read_Byte1,_I2C_SendByte1
	FNCALL	_AT24C02_Read_Byte1,_IIC_Wait_ACK1
	FNCALL	_AT24C02_Read_Byte1,_I2C_ReadByte1
	FNCALL	_AT24C02_Read_Byte1,_IIC_STOP1
	FNCALL	_EEPROM_ReceByte,_IIC_ReceByte
	FNCALL	_EEPROM_CheckBusy,_IIC_CheckBusy
	FNCALL	_RF_RxData,_RF_GetStatus
	FNCALL	_RF_RxData,_RF_Read_Buff
	FNCALL	_RF_RxData,_RF_ClearFIFO
	FNCALL	_RF_RxData,_RF_ClearStatus
	FNCALL	_Key_HandRunning,_BufRuning
	FNCALL	_Key_HandRunning,_PWM_LED1
	FNCALL	_Key_HandRunning,_PWM_LED2
	FNCALL	_RF_ENHANCE_RxData,_RF_GetStatus
	FNCALL	_RF_ENHANCE_RxData,_RF_Read_Buff
	FNCALL	_RF_ENHANCE_RxData,_RF_ClearFIFO
	FNCALL	_RF_ENHANCE_RxData,_RF_ClearStatus
	FNCALL	_RF_Init3,_RF_WriteReg
	FNCALL	_RF_Init3,_RF_ADDSSet
	FNCALL	_RF_Init,_SPI_init
	FNCALL	_RF_Init,_RF_WriteReg
	FNCALL	_RF_Init,_RF_ADDSSet
	FNCALL	_RF_Init,_RF_Write_Buff
	FNCALL	_LED_Dimming,_Convert_Duty_Cycle1
	FNCALL	_LED_Dimming,_Convert_Duty_Cycle2
	FNCALL	_LED_Dimming,_BufSetRun
	FNCALL	_BufRuning,_BufferRun
	FNCALL	_BufRuning,_Buffer_VaryFun
	FNCALL	_I2C_ReadByte1,_iic_delay_us
	FNCALL	_I2C_ReadByte1,_IIC_NACK1
	FNCALL	_I2C_ReadByte1,_IIC_ACK1
	FNCALL	_AT24C02_Write_Byte1,_IIC_START1
	FNCALL	_AT24C02_Write_Byte1,_I2C_SendByte1
	FNCALL	_AT24C02_Write_Byte1,_IIC_Wait_ACK1
	FNCALL	_AT24C02_Write_Byte1,_IIC_STOP1
	FNCALL	_IIC_ReceByte,_IIC_start
	FNCALL	_IIC_ReceByte,_IIC_Wbyte
	FNCALL	_IIC_ReceByte,_IIC_RACK
	FNCALL	_IIC_ReceByte,_IIC_Rbyte
	FNCALL	_IIC_ReceByte,_IIC_WACK
	FNCALL	_IIC_ReceByte,_IIC_stop
	FNCALL	_IIC_SendByte,_IIC_start
	FNCALL	_IIC_SendByte,_IIC_Wbyte
	FNCALL	_IIC_SendByte,_IIC_RACK
	FNCALL	_IIC_SendByte,_IIC_stop
	FNCALL	_IIC_CheckBusy,_IIC_start
	FNCALL	_IIC_CheckBusy,_IIC_Wbyte
	FNCALL	_IIC_CheckBusy,_IIC_RACK
	FNCALL	_RF_ClearStatus,_RF_WriteReg
	FNCALL	_RF_ClearFIFO,_RF_WriteReg
	FNCALL	_RF_GetStatus,_RF_ReadReg
	FNCALL	_RF_Set_RxMode1,_RF_WriteReg
	FNCALL	_RF_Init4,_RF_WriteReg
	FNCALL	_RF_Init4,_RF_Write_Buff
	FNCALL	_RF_ADDSSet,_RF_WriteReg
	FNCALL	_RF_ADDSSet,_RF_Write_Buff
	FNCALL	_RF_Set_RxMode,_RF_WriteReg
	FNCALL	_EEPROM_Init,_IIC_Init
	FNCALL	_IIC_NACK1,_iic_delay_us
	FNCALL	_IIC_ACK1,_iic_delay_us
	FNCALL	_Convert_Duty_Cycle2,___wmul
	FNCALL	_Convert_Duty_Cycle2,___lwdiv
	FNCALL	_Convert_Duty_Cycle1,___wmul
	FNCALL	_Convert_Duty_Cycle1,___lwdiv
	FNCALL	_Buffer_VaryFun,_PWM_LED1
	FNCALL	_Buffer_VaryFun,_PWM_LED2
	FNCALL	_LEDCon_Chg,_PWM_LED1
	FNCALL	_LEDCon_Chg,_PWM_LED2
	FNCALL	_LEDCon_Chg,_SetRunEn
	FNCALL	_Pair_LED,_CCP1_set_duty_cycle
	FNCALL	_Pair_LED,_CCP2_set_duty_cycle
	FNCALL	_Pair_LED,_soft_delay_ms
	FNCALL	_Pair_LED,_WDT_clear
	FNCALL	_IIC_Rbyte,_IIC_delay
	FNCALL	_IIC_Wbyte,_IIC_delay
	FNCALL	_IIC_WACK,_IIC_delay
	FNCALL	_IIC_RACK,_IIC_delay
	FNCALL	_IIC_RACK,___lbdiv
	FNCALL	_IIC_stop,_IIC_delay
	FNCALL	_IIC_start,_IIC_delay
	FNCALL	_IIC_STOP1,_iic_delay_us
	FNCALL	_IIC_Wait_ACK1,_iic_delay_us
	FNCALL	_I2C_SendByte1,_iic_delay_us
	FNCALL	_IIC_START1,_iic_delay_us
	FNCALL	_IIC_Init,_IIC_delay
	FNCALL	_RF_ReadReg,_SPI_RW
	FNCALL	_RF_Read_Buff,_SPI_RW
	FNCALL	_RF_Write_Buff,_SPI_RW
	FNCALL	_RF_WriteReg,_SPI_RW
	FNCALL	_LED_ALLOFF,_SetRunEn
	FNCALL	_LED_ALLOFF,_PWM_LED1
	FNCALL	_LED_ALLOFF,_PWM_LED2
	FNCALL	_PWM_12SetVol,_CCP1_set_duty_cycle
	FNCALL	_PWM_12SetVol,_CCP2_set_duty_cycle
	FNROOT	_main
	FNCALL	_ISR,_TIMER1_ISR
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_KeyVolSV
	global	_SysRunTimeCnt
	global	RF_Init@F670
	global	_LED_ON_Sat
	global	RF_Init@F668
	global	RF_Init@F664
	global	RF_Init@F666
	global	RF_Init@F672
	global	_TX_ADDRESS_DEF
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\Key.c"
	line	176

;initializer for _KeyVolSV
	retlw	0FFh
	retlw	0FFh

	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\main.c"
	line	21

;initializer for _SysRunTimeCnt
	retlw	01h
	retlw	0

	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	78

;initializer for RF_Init@F670
	retlw	01h
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
	line	34

;initializer for _LED_ON_Sat
	retlw	01h
psect	idataBANK1,class=CODE,space=0,delta=2
global __pidataBANK1
__pidataBANK1:
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	77

;initializer for RF_Init@F668
	retlw	045h
	retlw	021h
	retlw	03Fh
	retlw	02Dh
	retlw	05Ch
	retlw	040h
	line	75

;initializer for RF_Init@F664
	retlw	0Ah
	retlw	06Dh
	retlw	067h
	retlw	09Ch
	retlw	046h
	line	76

;initializer for RF_Init@F666
	retlw	016h
	retlw	033h
	retlw	027h
	line	79

;initializer for RF_Init@F672
	retlw	0Bh
	retlw	0DFh
	retlw	02h
	line	8

;initializer for _TX_ADDRESS_DEF
	retlw	0A5h
	retlw	08Dh
	retlw	01Eh
	retlw	0C9h
	retlw	06Bh
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
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
	line	18
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
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
	line	16
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
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
	line	17
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
	global	_ChgLV_FW
psect	strings
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\Key.c"
	line	155
_ChgLV_FW:
	retlw	0FEh
	retlw	0AFh
	retlw	04Bh
	retlw	022h
	retlw	0Dh
	retlw	05h
	retlw	0
	global	_ChgLV_ZX
psect	strings
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\Key.c"
	line	154
_ChgLV_ZX:
	retlw	0FAh
	retlw	064h
	retlw	032h
	retlw	010h
	retlw	07h
	retlw	02h
	global	_ack_buf
psect	strings
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\main.c"
	line	24
_ack_buf:
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	global	_RX2_ADDRESS_DEF
psect	strings
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	10
_RX2_ADDRESS_DEF:
	retlw	02Dh
	retlw	0D7h
	retlw	0B9h
	global	_TX2_ADDRESS_DEF
psect	strings
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	9
_TX2_ADDRESS_DEF:
	retlw	0CCh
	retlw	0CCh
	retlw	0CCh
	global	_ble_crc_38
	global	_crc_2_4G_lib
	global	_crc_lab
	global	_ChgLV_FW
	global	_ChgLV_ZX
	global	_ack_buf
	global	_RX2_ADDRESS_DEF
	global	_TX2_ADDRESS_DEF
	global	_BriCoTem_Value
	global	_CLRRF_AddTimeSV
	global	_KeyVol
	global	_Time1s_cot
	global	_Timecnt_3S
	global	_Timecnt_LEDTrun
	global	Key_HandRunning@Cnt2
	global	_Count_Save
	global	_DingShi
	global	_KEYKeepAddMark_1
	global	_KEYKeepAddMark_2
	global	_KEYKeepSunMark_1
	global	_KEYKeepSunMark_2
	global	_LEDR1_Vol
	global	_LEDR2_Vol
	global	_PWM_CH_LED1
	global	_PWM_CH_LED2
	global	_Pairing_Num
	global	_SysDingShiCnt
	global	_SysDingShiEn
	global	_SysDingShiOne
	global	_SysDingShiSTEP
	global	_SysRunTime_3S
	global	_TimeEN_LEDTrun
	global	_clk_flag
	global	_Dtime
	global	_LED_Chg_Cnt
	global	_clk_count
	global	_dClkCnt0
	global	_RunParam_Reg
	global	_RF_ADDRESS
	global	_EP_BP
	global	_rf_buf
	global	_addr_buf
	global	_CCP1CON
_CCP1CON	set	23
	global	_CCP2CON
_CCP2CON	set	29
	global	_CCPR1L
_CCPR1L	set	21
	global	_CCPR2L
_CCPR2L	set	27
	global	_INTCON
_INTCON	set	11
	global	_PIR1
_PIR1	set	12
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_T1CON
_T1CON	set	16
	global	_T2CON
_T2CON	set	18
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
	global	_RB6
_RB6	set	54
	global	_RB7
_RB7	set	55
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
	global	_PR2
_PR2	set	146
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISA3
_TRISA3	set	1067
	global	_TRISA4
_TRISA4	set	1068
	global	_TRISA5
_TRISA5	set	1069
	global	_TRISA7
_TRISA7	set	1071
	global	_TRISB6
_TRISB6	set	1078
	global	_TRISB7
_TRISB7	set	1079
	global	_TRISE1
_TRISE1	set	1097
	global	_TRISE2
_TRISE2	set	1098
	global	_WPUB6
_WPUB6	set	1198
	global	_WDTCON
_WDTCON	set	261
	file	"PAN2416示例程序.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_Dtime:
       ds      1

_LED_Chg_Cnt:
       ds      1

_clk_count:
       ds      1

_dClkCnt0:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_BriCoTem_Value:
       ds      2

_CLRRF_AddTimeSV:
       ds      2

_KeyVol:
       ds      2

_Time1s_cot:
       ds      2

_Timecnt_3S:
       ds      2

_Timecnt_LEDTrun:
       ds      2

Key_HandRunning@Cnt2:
       ds      1

_Count_Save:
       ds      1

_DingShi:
       ds      1

_KEYKeepAddMark_1:
       ds      1

_KEYKeepAddMark_2:
       ds      1

_KEYKeepSunMark_1:
       ds      1

_KEYKeepSunMark_2:
       ds      1

_LEDR1_Vol:
       ds      1

_LEDR2_Vol:
       ds      1

_PWM_CH_LED1:
       ds      1

_PWM_CH_LED2:
       ds      1

_Pairing_Num:
       ds      1

_SysDingShiCnt:
       ds      1

_SysDingShiEn:
       ds      1

_SysDingShiOne:
       ds      1

_SysDingShiSTEP:
       ds      1

_SysRunTime_3S:
       ds      1

_TimeEN_LEDTrun:
       ds      1

_clk_flag:
       ds      1

_RF_ADDRESS:
       ds      5

_EP_BP:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\Key.c"
	line	176
_KeyVolSV:
       ds      2

psect	dataBANK0
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\main.c"
	line	21
_SysRunTimeCnt:
       ds      2

psect	dataBANK0
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	78
RF_Init@F670:
       ds      1

psect	dataBANK0
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
	line	34
_LED_ON_Sat:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_RunParam_Reg:
       ds      16

_rf_buf:
       ds      18

_addr_buf:
       ds      16

psect	dataBANK1,class=BANK1,space=1
global __pdataBANK1
__pdataBANK1:
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	77
RF_Init@F668:
       ds      6

psect	dataBANK1
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	75
RF_Init@F664:
       ds      5

psect	dataBANK1
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	76
RF_Init@F666:
       ds      3

psect	dataBANK1
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	79
RF_Init@F672:
       ds      3

psect	dataBANK1
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	8
_TX_ADDRESS_DEF:
       ds      5

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
	movlw	low((__pbssBANK0)+025h)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+032h)
	fcall	clear_ram
; Initialize objects allocated to BANK1
	global __pidataBANK1
psect cinit,class=CODE,delta=2
	bsf	status, 5	;RP0=1, select bank1
	fcall	__pidataBANK1+0		;fetch initializer
	movwf	__pdataBANK1+0&07fh		
	fcall	__pidataBANK1+1		;fetch initializer
	movwf	__pdataBANK1+1&07fh		
	fcall	__pidataBANK1+2		;fetch initializer
	movwf	__pdataBANK1+2&07fh		
	fcall	__pidataBANK1+3		;fetch initializer
	movwf	__pdataBANK1+3&07fh		
	fcall	__pidataBANK1+4		;fetch initializer
	movwf	__pdataBANK1+4&07fh		
	fcall	__pidataBANK1+5		;fetch initializer
	movwf	__pdataBANK1+5&07fh		
	fcall	__pidataBANK1+6		;fetch initializer
	movwf	__pdataBANK1+6&07fh		
	fcall	__pidataBANK1+7		;fetch initializer
	movwf	__pdataBANK1+7&07fh		
	fcall	__pidataBANK1+8		;fetch initializer
	movwf	__pdataBANK1+8&07fh		
	fcall	__pidataBANK1+9		;fetch initializer
	movwf	__pdataBANK1+9&07fh		
	fcall	__pidataBANK1+10		;fetch initializer
	movwf	__pdataBANK1+10&07fh		
	fcall	__pidataBANK1+11		;fetch initializer
	movwf	__pdataBANK1+11&07fh		
	fcall	__pidataBANK1+12		;fetch initializer
	movwf	__pdataBANK1+12&07fh		
	fcall	__pidataBANK1+13		;fetch initializer
	movwf	__pdataBANK1+13&07fh		
	fcall	__pidataBANK1+14		;fetch initializer
	movwf	__pdataBANK1+14&07fh		
	fcall	__pidataBANK1+15		;fetch initializer
	movwf	__pdataBANK1+15&07fh		
	fcall	__pidataBANK1+16		;fetch initializer
	movwf	__pdataBANK1+16&07fh		
	fcall	__pidataBANK1+17		;fetch initializer
	movwf	__pdataBANK1+17&07fh		
	fcall	__pidataBANK1+18		;fetch initializer
	movwf	__pdataBANK1+18&07fh		
	fcall	__pidataBANK1+19		;fetch initializer
	movwf	__pdataBANK1+19&07fh		
	fcall	__pidataBANK1+20		;fetch initializer
	movwf	__pdataBANK1+20&07fh		
	fcall	__pidataBANK1+21		;fetch initializer
	movwf	__pdataBANK1+21&07fh		
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	bcf	status, 5	;RP0=0, select bank0
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
	fcall	__pidataBANK0+3		;fetch initializer
	movwf	__pdataBANK0+3&07fh		
	fcall	__pidataBANK0+4		;fetch initializer
	movwf	__pdataBANK0+4&07fh		
	fcall	__pidataBANK0+5		;fetch initializer
	movwf	__pdataBANK0+5&07fh		
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
	global	?_PWM_12SetVol
?_PWM_12SetVol:	; 0 bytes @ 0x0
	global	?_EP_SetONOFFStep
?_EP_SetONOFFStep:	; 0 bytes @ 0x0
	global	?_IIC_Init1
?_IIC_Init1:	; 0 bytes @ 0x0
	global	?_RF_Init
?_RF_Init:	; 0 bytes @ 0x0
	global	?_RF_Set_RxMode
?_RF_Set_RxMode:	; 0 bytes @ 0x0
	global	?_RF_ADDSSet
?_RF_ADDSSet:	; 0 bytes @ 0x0
	global	?_Enable_Interrupt
?_Enable_Interrupt:	; 0 bytes @ 0x0
	global	?_Timer1_Init
?_Timer1_Init:	; 0 bytes @ 0x0
	global	?_WDT_enable
?_WDT_enable:	; 0 bytes @ 0x0
	global	?_WDT_clear
?_WDT_clear:	; 0 bytes @ 0x0
	global	?_EP_GetRFAdd
?_EP_GetRFAdd:	; 0 bytes @ 0x0
	global	?_RF_Init4
?_RF_Init4:	; 0 bytes @ 0x0
	global	?_RF_Set_RxMode1
?_RF_Set_RxMode1:	; 0 bytes @ 0x0
	global	?_RF_Init3
?_RF_Init3:	; 0 bytes @ 0x0
	global	?_getClock
?_getClock:	; 0 bytes @ 0x0
	global	?_Key_HandRunning
?_Key_HandRunning:	; 0 bytes @ 0x0
	global	?_LED_ALLOFF
?_LED_ALLOFF:	; 0 bytes @ 0x0
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
	global	?_IIC_Init
?_IIC_Init:	; 0 bytes @ 0x0
	global	?_IIC_START1
?_IIC_START1:	; 0 bytes @ 0x0
	global	?_I2C_SendByte1
?_I2C_SendByte1:	; 0 bytes @ 0x0
	global	?_IIC_STOP1
?_IIC_STOP1:	; 0 bytes @ 0x0
	global	?_BufRuning
?_BufRuning:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_PWM_LED1
?_PWM_LED1:	; 0 bytes @ 0x0
	global	?_PWM_LED2
?_PWM_LED2:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_EP_SetRFAdd
?_EP_SetRFAdd:	; 0 bytes @ 0x0
	global	?_Pair_LED
?_Pair_LED:	; 0 bytes @ 0x0
	global	?_LEDCon_Chg
?_LEDCon_Chg:	; 0 bytes @ 0x0
	global	?_Write_Remote_Addr
?_Write_Remote_Addr:	; 0 bytes @ 0x0
	global	?_Delete_One_RemoteAddr
?_Delete_One_RemoteAddr:	; 0 bytes @ 0x0
	global	?_Remote_Pairing
?_Remote_Pairing:	; 0 bytes @ 0x0
	global	?_iic_delay_us
?_iic_delay_us:	; 0 bytes @ 0x0
	global	?_IIC_ACK1
?_IIC_ACK1:	; 0 bytes @ 0x0
	global	?_IIC_NACK1
?_IIC_NACK1:	; 0 bytes @ 0x0
	global	?_EEPROM_Init
?_EEPROM_Init:	; 1 bytes @ 0x0
	global	?_EP_GetONOFFStep
?_EP_GetONOFFStep:	; 1 bytes @ 0x0
	global	?_EP_IsADDCfg
?_EP_IsADDCfg:	; 1 bytes @ 0x0
	global	?_RF_GetStatus
?_RF_GetStatus:	; 1 bytes @ 0x0
	global	?_RF_ReadReg
?_RF_ReadReg:	; 1 bytes @ 0x0
	global	?_SPI_RW
?_SPI_RW:	; 1 bytes @ 0x0
	global	?_IIC_CheckBusy
?_IIC_CheckBusy:	; 1 bytes @ 0x0
	global	?_IIC_Wait_ACK1
?_IIC_Wait_ACK1:	; 1 bytes @ 0x0
	global	?_GerBuff_RunSAT
?_GerBuff_RunSAT:	; 1 bytes @ 0x0
	global	?_EEPROM_CheckBusy
?_EEPROM_CheckBusy:	; 1 bytes @ 0x0
	global	?_EP_SetADDCfg
?_EP_SetADDCfg:	; 1 bytes @ 0x0
	global	?_AT24C02_Read_Byte1
?_AT24C02_Read_Byte1:	; 1 bytes @ 0x0
	global	?_IIC_start
?_IIC_start:	; 1 bytes @ 0x0
	global	?_IIC_stop
?_IIC_stop:	; 1 bytes @ 0x0
	global	?_IIC_RACK
?_IIC_RACK:	; 1 bytes @ 0x0
	global	?_IIC_WACK
?_IIC_WACK:	; 1 bytes @ 0x0
	global	?_IIC_Wbyte
?_IIC_Wbyte:	; 1 bytes @ 0x0
	global	?_IIC_Rbyte
?_IIC_Rbyte:	; 1 bytes @ 0x0
	global	?_GetChgLV
?_GetChgLV:	; 1 bytes @ 0x0
	global	?_BufferRun
?_BufferRun:	; 1 bytes @ 0x0
	global	?_rx_data
?_rx_data:	; 1 bytes @ 0x0
	global	?_Data_Check
?_Data_Check:	; 1 bytes @ 0x0
	global	?_IIC_delay
?_IIC_delay:	; 2 bytes @ 0x0
	ds	2
	global	ISR@peripheral_intterrupt_touch
ISR@peripheral_intterrupt_touch:	; 1 bytes @ 0x2
	ds	1
	global	??_system_set_CPU_frequency
??_system_set_CPU_frequency:	; 0 bytes @ 0x3
	global	?_soft_delay_ms
?_soft_delay_ms:	; 0 bytes @ 0x3
	global	?_CCPX_Init
?_CCPX_Init:	; 0 bytes @ 0x3
	global	?_CCP1_set_duty_cycle
?_CCP1_set_duty_cycle:	; 0 bytes @ 0x3
	global	?_CCP2_set_duty_cycle
?_CCP2_set_duty_cycle:	; 0 bytes @ 0x3
	global	??_IIC_Init1
??_IIC_Init1:	; 0 bytes @ 0x3
	global	?_SetRunEn
?_SetRunEn:	; 0 bytes @ 0x3
	global	??_Enable_Interrupt
??_Enable_Interrupt:	; 0 bytes @ 0x3
	global	??_Timer1_Init
??_Timer1_Init:	; 0 bytes @ 0x3
	global	?_Timer1_start
?_Timer1_start:	; 0 bytes @ 0x3
	global	??_WDT_enable
??_WDT_enable:	; 0 bytes @ 0x3
	global	??_WDT_clear
??_WDT_clear:	; 0 bytes @ 0x3
	global	??_getClock
??_getClock:	; 0 bytes @ 0x3
	global	??_SPI_init
??_SPI_init:	; 0 bytes @ 0x3
	global	??_SPI_RW
??_SPI_RW:	; 0 bytes @ 0x3
	global	?_BufSetRun
?_BufSetRun:	; 0 bytes @ 0x3
	global	??_GerBuff_RunSAT
??_GerBuff_RunSAT:	; 0 bytes @ 0x3
	global	??_PWM_LED1
??_PWM_LED1:	; 0 bytes @ 0x3
	global	??_PWM_LED2
??_PWM_LED2:	; 0 bytes @ 0x3
	global	??_IIC_delay
??_IIC_delay:	; 0 bytes @ 0x3
	global	??_GetChgLV
??_GetChgLV:	; 0 bytes @ 0x3
	global	??_BufferRun
??_BufferRun:	; 0 bytes @ 0x3
	global	??_Data_Check
??_Data_Check:	; 0 bytes @ 0x3
	global	??_iic_delay_us
??_iic_delay_us:	; 0 bytes @ 0x3
	global	?___lbdiv
?___lbdiv:	; 1 bytes @ 0x3
	global	?_UpdateCRC
?_UpdateCRC:	; 2 bytes @ 0x3
	global	?___wmul
?___wmul:	; 2 bytes @ 0x3
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x3
	global	PWM_LED1@PWM
PWM_LED1@PWM:	; 1 bytes @ 0x3
	global	PWM_LED2@PWM
PWM_LED2@PWM:	; 1 bytes @ 0x3
	global	system_set_CPU_frequency@CPU_Frequency
system_set_CPU_frequency@CPU_Frequency:	; 1 bytes @ 0x3
	global	Timer1_Init@TIMER1_DIVIDER
Timer1_Init@TIMER1_DIVIDER:	; 1 bytes @ 0x3
	global	WDT_enable@WDT_DIVIDE_RATIO
WDT_enable@WDT_DIVIDE_RATIO:	; 1 bytes @ 0x3
	global	SPI_RW@read_reg_addr
SPI_RW@read_reg_addr:	; 1 bytes @ 0x3
	global	IIC_delay@DLAtime
IIC_delay@DLAtime:	; 1 bytes @ 0x3
	global	BufSetRun@Deg
BufSetRun@Deg:	; 1 bytes @ 0x3
	global	SetRunEn@RunEn
SetRunEn@RunEn:	; 1 bytes @ 0x3
	global	GerBuff_RunSAT@BufNo
GerBuff_RunSAT@BufNo:	; 1 bytes @ 0x3
	global	CCPX_Init@T_nums
CCPX_Init@T_nums:	; 1 bytes @ 0x3
	global	getClock@temp
getClock@temp:	; 1 bytes @ 0x3
	global	iic_delay_us@delay
iic_delay_us@delay:	; 1 bytes @ 0x3
	global	___lbdiv@divisor
___lbdiv@divisor:	; 1 bytes @ 0x3
	global	Timer1_start@T_nums
Timer1_start@T_nums:	; 2 bytes @ 0x3
	global	soft_delay_ms@ms
soft_delay_ms@ms:	; 2 bytes @ 0x3
	global	CCP1_set_duty_cycle@duty_cycle
CCP1_set_duty_cycle@duty_cycle:	; 2 bytes @ 0x3
	global	CCP2_set_duty_cycle@duty_cycle
CCP2_set_duty_cycle@duty_cycle:	; 2 bytes @ 0x3
	global	UpdateCRC@len
UpdateCRC@len:	; 2 bytes @ 0x3
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x3
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x3
	ds	1
	global	??_CCPX_Init
??_CCPX_Init:	; 0 bytes @ 0x4
	global	??_IIC_START1
??_IIC_START1:	; 0 bytes @ 0x4
	global	??_I2C_SendByte1
??_I2C_SendByte1:	; 0 bytes @ 0x4
	global	??_IIC_Wait_ACK1
??_IIC_Wait_ACK1:	; 0 bytes @ 0x4
	global	??_IIC_STOP1
??_IIC_STOP1:	; 0 bytes @ 0x4
	global	?_Buffer_VaryFun
?_Buffer_VaryFun:	; 0 bytes @ 0x4
	global	??_IIC_ACK1
??_IIC_ACK1:	; 0 bytes @ 0x4
	global	??_IIC_NACK1
??_IIC_NACK1:	; 0 bytes @ 0x4
	global	??___lbdiv
??___lbdiv:	; 0 bytes @ 0x4
	global	?_I2C_ReadByte1
?_I2C_ReadByte1:	; 2 bytes @ 0x4
	global	SPI_RW@i
SPI_RW@i:	; 1 bytes @ 0x4
	global	IIC_delay@j
IIC_delay@j:	; 1 bytes @ 0x4
	global	GetChgLV@vol
GetChgLV@vol:	; 1 bytes @ 0x4
	global	BufSetRun@SPD
BufSetRun@SPD:	; 1 bytes @ 0x4
	global	CCPX_Init@PWM_DIV
CCPX_Init@PWM_DIV:	; 1 bytes @ 0x4
	global	I2C_SendByte1@Data
I2C_SendByte1@Data:	; 1 bytes @ 0x4
	global	___lbdiv@dividend
___lbdiv@dividend:	; 1 bytes @ 0x4
	global	Buffer_VaryFun@dat
Buffer_VaryFun@dat:	; 2 bytes @ 0x4
	global	SetRunEn@MID
SetRunEn@MID:	; 2 bytes @ 0x4
	ds	1
	global	??_soft_delay_ms
??_soft_delay_ms:	; 0 bytes @ 0x5
	global	??_CCP1_set_duty_cycle
??_CCP1_set_duty_cycle:	; 0 bytes @ 0x5
	global	??_CCP2_set_duty_cycle
??_CCP2_set_duty_cycle:	; 0 bytes @ 0x5
	global	?_RF_WriteReg
?_RF_WriteReg:	; 0 bytes @ 0x5
	global	??_RF_Write_Buff
??_RF_Write_Buff:	; 0 bytes @ 0x5
	global	?_RF_Read_Buff
?_RF_Read_Buff:	; 0 bytes @ 0x5
	global	??_RF_ReadReg
??_RF_ReadReg:	; 0 bytes @ 0x5
	global	??_IIC_Init
??_IIC_Init:	; 0 bytes @ 0x5
	global	??_IIC_start
??_IIC_start:	; 0 bytes @ 0x5
	global	??_IIC_stop
??_IIC_stop:	; 0 bytes @ 0x5
	global	??_IIC_WACK
??_IIC_WACK:	; 0 bytes @ 0x5
	global	??_IIC_Wbyte
??_IIC_Wbyte:	; 0 bytes @ 0x5
	global	??_IIC_Rbyte
??_IIC_Rbyte:	; 0 bytes @ 0x5
	global	Timer1_start@Timer1_ISR_execution_total_time
Timer1_start@Timer1_ISR_execution_total_time:	; 1 bytes @ 0x5
	global	RF_Read_Buff@pBuff
RF_Read_Buff@pBuff:	; 1 bytes @ 0x5
	global	RF_Write_Buff@reg_addr
RF_Write_Buff@reg_addr:	; 1 bytes @ 0x5
	global	RF_WriteReg@write_data
RF_WriteReg@write_data:	; 1 bytes @ 0x5
	global	RF_ReadReg@reg_addr
RF_ReadReg@reg_addr:	; 1 bytes @ 0x5
	global	IIC_Init@freq
IIC_Init@freq:	; 1 bytes @ 0x5
	global	GetChgLV@i
GetChgLV@i:	; 1 bytes @ 0x5
	global	BufSetRun@PIX
BufSetRun@PIX:	; 1 bytes @ 0x5
	global	I2C_SendByte1@cnt
I2C_SendByte1@cnt:	; 1 bytes @ 0x5
	global	___lbdiv@counter
___lbdiv@counter:	; 1 bytes @ 0x5
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x5
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x5
	ds	1
	global	??_EEPROM_Init
??_EEPROM_Init:	; 0 bytes @ 0x6
	global	??_AT24C02_Read_Msg
??_AT24C02_Read_Msg:	; 0 bytes @ 0x6
	global	??_SetRunEn
??_SetRunEn:	; 0 bytes @ 0x6
	global	??_Timer1_start
??_Timer1_start:	; 0 bytes @ 0x6
	global	??_RF_WriteReg
??_RF_WriteReg:	; 0 bytes @ 0x6
	global	??_I2C_ReadByte1
??_I2C_ReadByte1:	; 0 bytes @ 0x6
	global	??_BufSetRun
??_BufSetRun:	; 0 bytes @ 0x6
	global	?_AT24C02_Write_Byte1
?_AT24C02_Write_Byte1:	; 0 bytes @ 0x6
	global	??_AT24C02_Read_Byte1
??_AT24C02_Read_Byte1:	; 0 bytes @ 0x6
	global	??_Buffer_VaryFun
??_Buffer_VaryFun:	; 0 bytes @ 0x6
	global	RF_Read_Buff@length
RF_Read_Buff@length:	; 1 bytes @ 0x6
	global	RF_Write_Buff@i
RF_Write_Buff@i:	; 1 bytes @ 0x6
	global	RF_WriteReg@reg_addr
RF_WriteReg@reg_addr:	; 1 bytes @ 0x6
	global	RF_ReadReg@tmp
RF_ReadReg@tmp:	; 1 bytes @ 0x6
	global	EEPROM_Init@SPD_I2C
EEPROM_Init@SPD_I2C:	; 1 bytes @ 0x6
	global	AT24C02_Write_Byte1@data
AT24C02_Write_Byte1@data:	; 1 bytes @ 0x6
	global	IIC_WACK@ACK
IIC_WACK@ACK:	; 1 bytes @ 0x6
	global	Buffer_VaryFun@n
Buffer_VaryFun@n:	; 1 bytes @ 0x6
	global	BufSetRun@BufNo
BufSetRun@BufNo:	; 1 bytes @ 0x6
	global	SetRunEn@BufNo
SetRunEn@BufNo:	; 1 bytes @ 0x6
	global	___lbdiv@quotient
___lbdiv@quotient:	; 1 bytes @ 0x6
	ds	1
	global	??_EP_GetONOFFStep
??_EP_GetONOFFStep:	; 0 bytes @ 0x7
	global	??_PWM_12SetVol
??_PWM_12SetVol:	; 0 bytes @ 0x7
	global	??_EP_SetONOFFStep
??_EP_SetONOFFStep:	; 0 bytes @ 0x7
	global	??_RF_Init
??_RF_Init:	; 0 bytes @ 0x7
	global	??_RF_Set_RxMode
??_RF_Set_RxMode:	; 0 bytes @ 0x7
	global	??_RF_ADDSSet
??_RF_ADDSSet:	; 0 bytes @ 0x7
	global	??_EP_IsADDCfg
??_EP_IsADDCfg:	; 0 bytes @ 0x7
	global	??_EP_GetRFAdd
??_EP_GetRFAdd:	; 0 bytes @ 0x7
	global	??_RF_Init4
??_RF_Init4:	; 0 bytes @ 0x7
	global	??_RF_Set_RxMode1
??_RF_Set_RxMode1:	; 0 bytes @ 0x7
	global	??_RF_Init3
??_RF_Init3:	; 0 bytes @ 0x7
	global	??_recive_task
??_recive_task:	; 0 bytes @ 0x7
	global	??_Key_HandRunning
??_Key_HandRunning:	; 0 bytes @ 0x7
	global	??_LED_ALLOFF
??_LED_ALLOFF:	; 0 bytes @ 0x7
	global	??_RF_GetStatus
??_RF_GetStatus:	; 0 bytes @ 0x7
	global	??_RF_ClearFIFO
??_RF_ClearFIFO:	; 0 bytes @ 0x7
	global	??_RF_ClearStatus
??_RF_ClearStatus:	; 0 bytes @ 0x7
	global	??_IIC_CheckBusy
??_IIC_CheckBusy:	; 0 bytes @ 0x7
	global	??_IIC_SendByte
??_IIC_SendByte:	; 0 bytes @ 0x7
	global	??_IIC_ReceByte
??_IIC_ReceByte:	; 0 bytes @ 0x7
	global	??_Convert_Duty_Cycle1
??_Convert_Duty_Cycle1:	; 0 bytes @ 0x7
	global	??_main
??_main:	; 0 bytes @ 0x7
	global	??_EEPROM_CheckBusy
??_EEPROM_CheckBusy:	; 0 bytes @ 0x7
	global	??_EEPROM_SendByte
??_EEPROM_SendByte:	; 0 bytes @ 0x7
	global	??_EEPROM_ReceByte
??_EEPROM_ReceByte:	; 0 bytes @ 0x7
	global	??_EP_SetADDCfg
??_EP_SetADDCfg:	; 0 bytes @ 0x7
	global	??_AT24C02_Write_Byte1
??_AT24C02_Write_Byte1:	; 0 bytes @ 0x7
	global	??_IIC_RACK
??_IIC_RACK:	; 0 bytes @ 0x7
	global	??_Pair_LED
??_Pair_LED:	; 0 bytes @ 0x7
	global	??_LEDCon_Chg
??_LEDCon_Chg:	; 0 bytes @ 0x7
	global	??_LED_Dimming
??_LED_Dimming:	; 0 bytes @ 0x7
	global	??_Remote_Pairing
??_Remote_Pairing:	; 0 bytes @ 0x7
	global	??___wmul
??___wmul:	; 0 bytes @ 0x7
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x7
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_RF_Write_Buff
?_RF_Write_Buff:	; 0 bytes @ 0x0
	global	??_RF_Read_Buff
??_RF_Read_Buff:	; 0 bytes @ 0x0
	global	??_UpdateCRC
??_UpdateCRC:	; 0 bytes @ 0x0
	global	AT24C02_Write_Byte1@addr
AT24C02_Write_Byte1@addr:	; 1 bytes @ 0x0
	global	IIC_Wbyte@Wdat
IIC_Wbyte@Wdat:	; 1 bytes @ 0x0
	global	IIC_Rbyte@temp
IIC_Rbyte@temp:	; 1 bytes @ 0x0
	global	BufferRun@BufNo
BufferRun@BufNo:	; 1 bytes @ 0x0
	global	CCP1_set_duty_cycle@i
CCP1_set_duty_cycle@i:	; 1 bytes @ 0x0
	global	CCP2_set_duty_cycle@i
CCP2_set_duty_cycle@i:	; 1 bytes @ 0x0
	global	Data_Check@k
Data_Check@k:	; 1 bytes @ 0x0
	global	I2C_ReadByte1@ack
I2C_ReadByte1@ack:	; 1 bytes @ 0x0
	global	RF_Write_Buff@pBuff
RF_Write_Buff@pBuff:	; 2 bytes @ 0x0
	global	soft_delay_ms@i
soft_delay_ms@i:	; 2 bytes @ 0x0
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x0
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x0
	global	IIC_RACK@buf
IIC_RACK@buf:	; 5 bytes @ 0x0
	ds	1
	global	??_BufRuning
??_BufRuning:	; 0 bytes @ 0x1
	global	RF_Read_Buff@reg_addr
RF_Read_Buff@reg_addr:	; 1 bytes @ 0x1
	global	IIC_Wbyte@i
IIC_Wbyte@i:	; 1 bytes @ 0x1
	global	IIC_Rbyte@k
IIC_Rbyte@k:	; 1 bytes @ 0x1
	global	Data_Check@p
Data_Check@p:	; 1 bytes @ 0x1
	global	I2C_ReadByte1@data
I2C_ReadByte1@data:	; 2 bytes @ 0x1
	ds	1
	global	RF_Read_Buff@byte_ctr
RF_Read_Buff@byte_ctr:	; 1 bytes @ 0x2
	global	RF_Write_Buff@length
RF_Write_Buff@length:	; 1 bytes @ 0x2
	global	soft_delay_ms@j
soft_delay_ms@j:	; 1 bytes @ 0x2
	global	IIC_Rbyte@i
IIC_Rbyte@i:	; 1 bytes @ 0x2
	global	Data_Check@temp
Data_Check@temp:	; 1 bytes @ 0x2
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x2
	ds	1
	global	?_RF_ENHANCE_RxData
?_RF_ENHANCE_RxData:	; 1 bytes @ 0x3
	global	?_RF_RxData
?_RF_RxData:	; 1 bytes @ 0x3
	global	?_Convert_Duty_Cycle1
?_Convert_Duty_Cycle1:	; 2 bytes @ 0x3
	global	?_Convert_Duty_Cycle2
?_Convert_Duty_Cycle2:	; 2 bytes @ 0x3
	global	RF_ADDSSet@Buf
RF_ADDSSet@Buf:	; 1 bytes @ 0x3
	global	RF_RxData@length
RF_RxData@length:	; 1 bytes @ 0x3
	global	RF_ENHANCE_RxData@length
RF_ENHANCE_RxData@length:	; 1 bytes @ 0x3
	global	soft_delay_ms@k
soft_delay_ms@k:	; 1 bytes @ 0x3
	global	BufRuning@k
BufRuning@k:	; 1 bytes @ 0x3
	global	UpdateCRC@CRC_input
UpdateCRC@CRC_input:	; 1 bytes @ 0x3
	global	Data_Check@j
Data_Check@j:	; 1 bytes @ 0x3
	global	Convert_Duty_Cycle1@Color_Temp
Convert_Duty_Cycle1@Color_Temp:	; 1 bytes @ 0x3
	global	Convert_Duty_Cycle2@Color_Temp
Convert_Duty_Cycle2@Color_Temp:	; 1 bytes @ 0x3
	global	I2C_ReadByte1@cnt
I2C_ReadByte1@cnt:	; 1 bytes @ 0x3
	ds	1
	global	??_RF_RxData
??_RF_RxData:	; 0 bytes @ 0x4
	global	?_AT24C02_Write_Msg
?_AT24C02_Write_Msg:	; 0 bytes @ 0x4
	global	RF_ENHANCE_RxData@postback_buff
RF_ENHANCE_RxData@postback_buff:	; 1 bytes @ 0x4
	global	AT24C02_Read_Byte1@addr
AT24C02_Read_Byte1@addr:	; 1 bytes @ 0x4
	global	AT24C02_Write_Msg@data
AT24C02_Write_Msg@data:	; 1 bytes @ 0x4
	global	Pair_LED@i
Pair_LED@i:	; 1 bytes @ 0x4
	global	BufRuning@i
BufRuning@i:	; 1 bytes @ 0x4
	global	UpdateCRC@k
UpdateCRC@k:	; 1 bytes @ 0x4
	global	Data_Check@i
Data_Check@i:	; 1 bytes @ 0x4
	global	RF_Init@RF_cal2_data
RF_Init@RF_cal2_data:	; 6 bytes @ 0x4
	ds	1
	global	??_RF_ENHANCE_RxData
??_RF_ENHANCE_RxData:	; 0 bytes @ 0x5
	global	??_Convert_Duty_Cycle2
??_Convert_Duty_Cycle2:	; 0 bytes @ 0x5
	global	RF_RxData@payload_buff
RF_RxData@payload_buff:	; 1 bytes @ 0x5
	global	AT24C02_Read_Byte1@temp
AT24C02_Read_Byte1@temp:	; 1 bytes @ 0x5
	global	AT24C02_Write_Msg@len
AT24C02_Write_Msg@len:	; 1 bytes @ 0x5
	global	IIC_RACK@k
IIC_RACK@k:	; 1 bytes @ 0x5
	global	Pair_LED@k
Pair_LED@k:	; 1 bytes @ 0x5
	global	UpdateCRC@i
UpdateCRC@i:	; 1 bytes @ 0x5
	global	Convert_Duty_Cycle1@Brightness
Convert_Duty_Cycle1@Brightness:	; 1 bytes @ 0x5
	ds	1
	global	?_AT24C02_Read_Msg
?_AT24C02_Read_Msg:	; 0 bytes @ 0x6
	global	??_AT24C02_Write_Msg
??_AT24C02_Write_Msg:	; 0 bytes @ 0x6
	global	RF_ENHANCE_RxData@payload_buff
RF_ENHANCE_RxData@payload_buff:	; 1 bytes @ 0x6
	global	AT24C02_Read_Msg@data
AT24C02_Read_Msg@data:	; 1 bytes @ 0x6
	global	IIC_RACK@i
IIC_RACK@i:	; 1 bytes @ 0x6
	global	Convert_Duty_Cycle2@Brightness
Convert_Duty_Cycle2@Brightness:	; 1 bytes @ 0x6
	global	UpdateCRC@CRC_acc
UpdateCRC@CRC_acc:	; 2 bytes @ 0x6
	global	Convert_Duty_Cycle1@temp
Convert_Duty_Cycle1@temp:	; 2 bytes @ 0x6
	ds	1
	global	?_IIC_SendByte
?_IIC_SendByte:	; 1 bytes @ 0x7
	global	?_IIC_ReceByte
?_IIC_ReceByte:	; 1 bytes @ 0x7
	global	AT24C02_Write_Msg@addr
AT24C02_Write_Msg@addr:	; 1 bytes @ 0x7
	global	AT24C02_Read_Msg@len
AT24C02_Read_Msg@len:	; 1 bytes @ 0x7
	global	IIC_ReceByte@Chip_Adds
IIC_ReceByte@Chip_Adds:	; 1 bytes @ 0x7
	global	IIC_SendByte@Reg_Adds
IIC_SendByte@Reg_Adds:	; 1 bytes @ 0x7
	global	IIC_CheckBusy@Chip_Adds
IIC_CheckBusy@Chip_Adds:	; 1 bytes @ 0x7
	global	Convert_Duty_Cycle2@temp
Convert_Duty_Cycle2@temp:	; 2 bytes @ 0x7
	ds	1
	global	??_rx_data
??_rx_data:	; 0 bytes @ 0x8
	global	AT24C02_Write_Msg@i
AT24C02_Write_Msg@i:	; 1 bytes @ 0x8
	global	AT24C02_Read_Msg@addr
AT24C02_Read_Msg@addr:	; 1 bytes @ 0x8
	global	IIC_ReceByte@Reg_Adds
IIC_ReceByte@Reg_Adds:	; 1 bytes @ 0x8
	global	IIC_SendByte@Wdat
IIC_SendByte@Wdat:	; 1 bytes @ 0x8
	ds	1
	global	??_Write_Remote_Addr
??_Write_Remote_Addr:	; 0 bytes @ 0x9
	global	??_Delete_One_RemoteAddr
??_Delete_One_RemoteAddr:	; 0 bytes @ 0x9
	global	?_LED_Dimming
?_LED_Dimming:	; 0 bytes @ 0x9
	global	AT24C02_Read_Msg@i
AT24C02_Read_Msg@i:	; 1 bytes @ 0x9
	global	IIC_ReceByte@Rdat
IIC_ReceByte@Rdat:	; 1 bytes @ 0x9
	global	IIC_SendByte@Chip_Adds
IIC_SendByte@Chip_Adds:	; 1 bytes @ 0x9
	global	LED_Dimming@Color_Temp
LED_Dimming@Color_Temp:	; 1 bytes @ 0x9
	ds	1
	global	?_EEPROM_SendByte
?_EEPROM_SendByte:	; 1 bytes @ 0xA
	global	EEPROM_SendByte@Wdat
EEPROM_SendByte@Wdat:	; 1 bytes @ 0xA
	global	IIC_ReceByte@ACK
IIC_ReceByte@ACK:	; 1 bytes @ 0xA
	global	Write_Remote_Addr@j
Write_Remote_Addr@j:	; 1 bytes @ 0xA
	global	Delete_One_RemoteAddr@p
Delete_One_RemoteAddr@p:	; 1 bytes @ 0xA
	global	LED_Dimming@Brightness
LED_Dimming@Brightness:	; 1 bytes @ 0xA
	global	RF_Init@BB_cal_data
RF_Init@BB_cal_data:	; 5 bytes @ 0xA
	ds	1
	global	?_EEPROM_ReceByte
?_EEPROM_ReceByte:	; 1 bytes @ 0xB
	global	EEPROM_SendByte@REGadds
EEPROM_SendByte@REGadds:	; 1 bytes @ 0xB
	global	EEPROM_ReceByte@Rdat
EEPROM_ReceByte@Rdat:	; 1 bytes @ 0xB
	global	Write_Remote_Addr@i
Write_Remote_Addr@i:	; 1 bytes @ 0xB
	global	Delete_One_RemoteAddr@j
Delete_One_RemoteAddr@j:	; 1 bytes @ 0xB
	global	rx_data@crc16
rx_data@crc16:	; 2 bytes @ 0xB
	ds	1
	global	EEPROM_SendByte@cnt
EEPROM_SendByte@cnt:	; 1 bytes @ 0xC
	global	EEPROM_ReceByte@REGadds
EEPROM_ReceByte@REGadds:	; 1 bytes @ 0xC
	global	Delete_One_RemoteAddr@i
Delete_One_RemoteAddr@i:	; 1 bytes @ 0xC
	ds	1
	global	EEPROM_SendByte@i
EEPROM_SendByte@i:	; 1 bytes @ 0xD
	global	EP_GetRFAdd@OutP
EP_GetRFAdd@OutP:	; 1 bytes @ 0xD
	global	rx_data@rand
rx_data@rand:	; 1 bytes @ 0xD
	ds	1
	global	??_EP_SetRFAdd
??_EP_SetRFAdd:	; 0 bytes @ 0xE
	global	EP_SetADDCfg@ID
EP_SetADDCfg@ID:	; 1 bytes @ 0xE
	global	EP_SetONOFFStep@D
EP_SetONOFFStep@D:	; 1 bytes @ 0xE
	global	EP_GetRFAdd@i
EP_GetRFAdd@i:	; 1 bytes @ 0xE
	global	rx_data@rx_flag
rx_data@rx_flag:	; 1 bytes @ 0xE
	ds	1
	global	EP_SetRFAdd@InP
EP_SetRFAdd@InP:	; 1 bytes @ 0xF
	global	rx_data@i
rx_data@i:	; 1 bytes @ 0xF
	global	RF_Init@RF_cal_data
RF_Init@RF_cal_data:	; 3 bytes @ 0xF
	ds	1
	global	?_recive_task
?_recive_task:	; 0 bytes @ 0x10
	global	EP_SetRFAdd@i
EP_SetRFAdd@i:	; 1 bytes @ 0x10
	ds	1
	global	?_Key_Handle
?_Key_Handle:	; 0 bytes @ 0x11
	global	Key_Handle@buf
Key_Handle@buf:	; 1 bytes @ 0x11
	ds	1
	global	RF_Init@Dem_cal2_data
RF_Init@Dem_cal2_data:	; 3 bytes @ 0x12
	ds	1
	global	??_Key_Handle
??_Key_Handle:	; 0 bytes @ 0x13
	ds	2
	global	RF_Init@Dem_cal_data
RF_Init@Dem_cal_data:	; 1 bytes @ 0x15
	global	_Key_Handle$3416
_Key_Handle$3416:	; 2 bytes @ 0x15
	ds	1
	global	RF_Init@feature
RF_Init@feature:	; 1 bytes @ 0x16
	ds	1
	global	_Key_Handle$3417
_Key_Handle$3417:	; 2 bytes @ 0x17
	ds	2
	global	_Key_Handle$3418
_Key_Handle$3418:	; 2 bytes @ 0x19
	ds	2
	global	_Key_Handle$3419
_Key_Handle$3419:	; 2 bytes @ 0x1B
	ds	2
	global	Key_Handle@k
Key_Handle@k:	; 2 bytes @ 0x1D
	ds	2
	global	Key_Handle@n
Key_Handle@n:	; 1 bytes @ 0x1F
	ds	1
	global	Key_Handle@i
Key_Handle@i:	; 1 bytes @ 0x20
	ds	1
	global	main@j
main@j:	; 1 bytes @ 0x21
	ds	1
	global	main@i
main@i:	; 1 bytes @ 0x22
	ds	1
;;Data sizes: Strings 0, constant 106, data 28, bss 91, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7      11
;; BANK0           80     35      78
;; BANK1           80      0      72

;;
;; Pointer list with targets:

;; ?_I2C_ReadByte1	unsigned int  size(1) Largest target is 0
;;
;; ?_Convert_Duty_Cycle2	unsigned int  size(1) Largest target is 0
;;
;; ?_Convert_Duty_Cycle1	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; ?_UpdateCRC	unsigned short  size(1) Largest target is 0
;;
;; RF_ENHANCE_RxData@postback_buff	PTR unsigned char  size(1) Largest target is 8
;;		 -> ack_buf(CODE[8]), 
;;
;; UpdateCRC@CRC_input	PTR unsigned char  size(1) Largest target is 18
;;		 -> rf_buf(BANK1[18]), 
;;
;; Key_Handle@buf	PTR unsigned char  size(1) Largest target is 18
;;		 -> rf_buf(BANK1[18]), 
;;
;; IIC_ReceByte@Rdat	PTR unsigned char  size(1) Largest target is 5
;;		 -> EP_BP(BANK0[1]), RF_ADDRESS(BANK0[5]), 
;;
;; AT24C02_Read_Msg@data	PTR unsigned char  size(1) Largest target is 16
;;		 -> addr_buf(BANK1[16]), 
;;
;; AT24C02_Write_Msg@data	PTR unsigned char  size(1) Largest target is 16
;;		 -> addr_buf(BANK1[16]), 
;;
;; EP_SetRFAdd@InP	PTR unsigned char  size(1) Largest target is 18
;;		 -> rf_buf(BANK1[18]), 
;;
;; EP_GetRFAdd@OutP	PTR unsigned char  size(1) Largest target is 5
;;		 -> RF_ADDRESS(BANK0[5]), 
;;
;; EEPROM_ReceByte@Rdat	PTR unsigned char  size(1) Largest target is 5
;;		 -> EP_BP(BANK0[1]), RF_ADDRESS(BANK0[5]), 
;;
;; RF_Write_Buff@pBuff	PTR unsigned char  size(2) Largest target is 6
;;		 -> RX2_ADDRESS_DEF(CODE[3]), TX2_ADDRESS_DEF(CODE[3]), RF_Init@Dem_cal2_data(BANK0[3]), RF_Init@Dem_cal_data(BANK0[1]), 
;;		 -> RF_Init@RF_cal2_data(BANK0[6]), RF_Init@RF_cal_data(BANK0[3]), RF_Init@BB_cal_data(BANK0[5]), RF_ADDRESS(BANK0[5]), 
;;		 -> TX_ADDRESS_DEF(BANK1[5]), 
;;
;; RF_Read_Buff@pBuff	PTR unsigned char  size(1) Largest target is 18
;;		 -> rf_buf(BANK1[18]), 
;;
;; RF_ENHANCE_RxData@payload_buff	PTR unsigned char  size(1) Largest target is 18
;;		 -> rf_buf(BANK1[18]), 
;;
;; RF_RxData@payload_buff	PTR unsigned char  size(1) Largest target is 18
;;		 -> rf_buf(BANK1[18]), 
;;
;; RF_ADDSSet@Buf	PTR unsigned char  size(1) Largest target is 5
;;		 -> RF_ADDRESS(BANK0[5]), TX_ADDRESS_DEF(BANK1[5]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_CCP1_set_duty_cycle
;;   _main->_CCP2_set_duty_cycle
;;   _main->_EEPROM_Init
;;   _main->_AT24C02_Read_Msg
;;   _main->_SetRunEn
;;   _recive_task->_SetRunEn
;;   _Key_Handle->_CCP1_set_duty_cycle
;;   _Key_Handle->_CCP2_set_duty_cycle
;;   _Key_Handle->_SetRunEn
;;   _Key_Handle->_BufSetRun
;;   _AT24C02_Write_Msg->_AT24C02_Write_Byte1
;;   _AT24C02_Read_Byte1->_I2C_SendByte1
;;   _AT24C02_Read_Byte1->_I2C_ReadByte1
;;   _RF_RxData->_RF_Read_Buff
;;   _RF_ENHANCE_RxData->_RF_Read_Buff
;;   _RF_Init3->_RF_WriteReg
;;   _RF_Init->_RF_WriteReg
;;   _RF_Init->_RF_Write_Buff
;;   _LED_Dimming->_BufSetRun
;;   _BufRuning->_BufferRun
;;   _BufRuning->_Buffer_VaryFun
;;   _I2C_ReadByte1->_iic_delay_us
;;   _AT24C02_Write_Byte1->_I2C_SendByte1
;;   _IIC_ReceByte->_IIC_WACK
;;   _RF_ClearStatus->_RF_WriteReg
;;   _RF_ClearFIFO->_RF_WriteReg
;;   _RF_GetStatus->_RF_ReadReg
;;   _RF_Set_RxMode1->_RF_WriteReg
;;   _RF_Init4->_RF_WriteReg
;;   _RF_Init4->_RF_Write_Buff
;;   _RF_ADDSSet->_RF_WriteReg
;;   _RF_ADDSSet->_RF_Write_Buff
;;   _RF_Set_RxMode->_RF_WriteReg
;;   _EEPROM_Init->_IIC_Init
;;   _IIC_NACK1->_iic_delay_us
;;   _IIC_ACK1->_iic_delay_us
;;   _Convert_Duty_Cycle2->___wmul
;;   _Convert_Duty_Cycle2->___lwdiv
;;   _Convert_Duty_Cycle1->___wmul
;;   _Convert_Duty_Cycle1->___lwdiv
;;   _Buffer_VaryFun->_PWM_LED1
;;   _Buffer_VaryFun->_PWM_LED2
;;   _LEDCon_Chg->_SetRunEn
;;   _Pair_LED->_CCP1_set_duty_cycle
;;   _Pair_LED->_CCP2_set_duty_cycle
;;   _IIC_Rbyte->_IIC_delay
;;   _IIC_Wbyte->_IIC_delay
;;   _IIC_WACK->_IIC_delay
;;   _IIC_RACK->___lbdiv
;;   _IIC_stop->_IIC_delay
;;   _IIC_start->_IIC_delay
;;   _IIC_STOP1->_iic_delay_us
;;   _IIC_Wait_ACK1->_iic_delay_us
;;   _I2C_SendByte1->_iic_delay_us
;;   _IIC_START1->_iic_delay_us
;;   _IIC_Init->_IIC_delay
;;   _RF_ReadReg->_SPI_RW
;;   _RF_Read_Buff->_SPI_RW
;;   _RF_Write_Buff->_SPI_RW
;;   _RF_WriteReg->_SPI_RW
;;   _LED_ALLOFF->_SetRunEn
;;   _PWM_12SetVol->_CCP1_set_duty_cycle
;;   _PWM_12SetVol->_CCP2_set_duty_cycle
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_Key_Handle
;;   _recive_task->_rx_data
;;   _Key_Handle->_EP_SetRFAdd
;;   _Remote_Pairing->_Write_Remote_Addr
;;   _EP_SetRFAdd->_EEPROM_SendByte
;;   _EP_SetADDCfg->_EEPROM_SendByte
;;   _EP_SetONOFFStep->_EEPROM_SendByte
;;   _Delete_One_RemoteAddr->_AT24C02_Write_Msg
;;   _Write_Remote_Addr->_AT24C02_Write_Msg
;;   _rx_data->_UpdateCRC
;;   _EEPROM_SendByte->_IIC_SendByte
;;   _EP_GetRFAdd->_EEPROM_ReceByte
;;   _EP_IsADDCfg->_EEPROM_ReceByte
;;   _AT24C02_Read_Msg->_AT24C02_Read_Byte1
;;   _EP_GetONOFFStep->_EEPROM_ReceByte
;;   _AT24C02_Write_Msg->_soft_delay_ms
;;   _AT24C02_Read_Byte1->_I2C_ReadByte1
;;   _EEPROM_ReceByte->_IIC_ReceByte
;;   _EEPROM_CheckBusy->_IIC_CheckBusy
;;   _RF_RxData->_RF_Read_Buff
;;   _Key_HandRunning->_BufRuning
;;   _RF_ENHANCE_RxData->_RF_Read_Buff
;;   _RF_Init3->_RF_ADDSSet
;;   _RF_Init->_RF_ADDSSet
;;   _LED_Dimming->_Convert_Duty_Cycle2
;;   _BufRuning->_BufferRun
;;   _IIC_ReceByte->_IIC_RACK
;;   _IIC_SendByte->_IIC_RACK
;;   _IIC_CheckBusy->_IIC_RACK
;;   _RF_Init4->_RF_Write_Buff
;;   _RF_ADDSSet->_RF_Write_Buff
;;   _Convert_Duty_Cycle2->___lwdiv
;;   _Convert_Duty_Cycle1->___lwdiv
;;   _Pair_LED->_soft_delay_ms
;;   _PWM_12SetVol->_CCP1_set_duty_cycle
;;   _PWM_12SetVol->_CCP2_set_duty_cycle
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
;; (0) _main                                                 2     2      0   23740
;;                                             33 BANK0      2     2      0
;;           _system_set_CPU_frequency
;;                      _soft_delay_ms
;;                          _CCPX_Init
;;                _CCP1_set_duty_cycle
;;                _CCP2_set_duty_cycle
;;                        _EEPROM_Init
;;                    _EP_GetONOFFStep
;;                       _PWM_12SetVol
;;                    _EP_SetONOFFStep
;;                          _IIC_Init1
;;                   _AT24C02_Read_Msg
;;                            _RF_Init
;;                      _RF_Set_RxMode
;;                         _RF_ADDSSet
;;                           _SetRunEn
;;                   _Enable_Interrupt
;;                        _Timer1_Init
;;                       _Timer1_start
;;                         _WDT_enable
;;                          _WDT_clear
;;                        _EP_IsADDCfg
;;                        _EP_GetRFAdd
;;                           _RF_Init4
;;                     _RF_Set_RxMode1
;;                           _RF_Init3
;;                  _RF_ENHANCE_RxData
;;                         _Key_Handle
;;                        _recive_task
;;                           _getClock
;;                    _Key_HandRunning
;;                         _LED_ALLOFF
;; ---------------------------------------------------------------------------------
;; (0) _recive_task                                          5     4      1    5569
;;                                             16 BANK0      1     0      1
;;                            _rx_data
;;                     _Remote_Pairing
;;                         _Data_Check
;;                        _LED_Dimming
;;                         _LED_ALLOFF
;;                           _PWM_LED1
;;                           _PWM_LED2
;;                           _SetRunEn
;;                         _LEDCon_Chg
;;              _Delete_One_RemoteAddr
;;                       _RF_ClearFIFO
;;                     _RF_ClearStatus
;; ---------------------------------------------------------------------------------
;; (0) _Key_Handle                                          16    14      2    7738
;;                                             17 BANK0     16    14      2
;;                        _EP_SetRFAdd
;;                      _soft_delay_ms
;;                        _EP_GetRFAdd
;;                         _RF_ADDSSet
;;                       _EP_SetADDCfg
;;                           _Pair_LED
;;                         _LED_ALLOFF
;;                           _PWM_LED1
;;                           _PWM_LED2
;;                _CCP1_set_duty_cycle
;;                _CCP2_set_duty_cycle
;;                          _WDT_clear
;;                           _SetRunEn
;;                           _GetChgLV
;;                          _BufSetRun
;;                         _LEDCon_Chg
;;                     _GerBuff_RunSAT
;; ---------------------------------------------------------------------------------
;; (1) _Remote_Pairing                                       0     0      0    1290
;;                         _Data_Check
;;                  _Write_Remote_Addr
;;                           _Pair_LED
;; ---------------------------------------------------------------------------------
;; (1) _EP_SetRFAdd                                          3     3      0    1550
;;                                             14 BANK0      3     3      0
;;                          _WDT_clear
;;                    _EEPROM_SendByte
;; ---------------------------------------------------------------------------------
;; (1) _EP_SetADDCfg                                         1     1      0    1459
;;                                             14 BANK0      1     1      0
;;                          _WDT_clear
;;                    _EEPROM_SendByte
;; ---------------------------------------------------------------------------------
;; (1) _EP_SetONOFFStep                                      1     1      0    1459
;;                                             14 BANK0      1     1      0
;;                    _EEPROM_SendByte
;;                          _WDT_clear
;; ---------------------------------------------------------------------------------
;; (1) _Delete_One_RemoteAddr                                4     4      0     808
;;                                              9 BANK0      4     4      0
;;                         _Data_Check
;;                  _AT24C02_Write_Msg
;; ---------------------------------------------------------------------------------
;; (2) _Write_Remote_Addr                                    3     3      0     644
;;                                              9 BANK0      3     3      0
;;                  _AT24C02_Write_Msg
;; ---------------------------------------------------------------------------------
;; (1) _rx_data                                              8     8      0    1215
;;                                              8 BANK0      8     8      0
;;                          _RF_RxData
;;                          _UpdateCRC
;; ---------------------------------------------------------------------------------
;; (2) _EEPROM_SendByte                                      4     3      1    1437
;;                                             10 BANK0      4     3      1
;;                       _IIC_SendByte
;;                   _EEPROM_CheckBusy
;; ---------------------------------------------------------------------------------
;; (1) _EP_GetRFAdd                                          2     2      0    1143
;;                                             13 BANK0      2     2      0
;;                          _WDT_clear
;;                    _EEPROM_ReceByte
;; ---------------------------------------------------------------------------------
;; (1) _EP_IsADDCfg                                          0     0      0    1030
;;                    _EEPROM_ReceByte
;;                          _WDT_clear
;; ---------------------------------------------------------------------------------
;; (1) _AT24C02_Read_Msg                                     5     3      2     622
;;                                              6 COMMON     1     1      0
;;                                              6 BANK0      4     2      2
;;                          _WDT_clear
;;                 _AT24C02_Read_Byte1
;;                      _soft_delay_ms
;; ---------------------------------------------------------------------------------
;; (1) _EP_GetONOFFStep                                      0     0      0    1030
;;                    _EEPROM_ReceByte
;;                          _WDT_clear
;; ---------------------------------------------------------------------------------
;; (2) _AT24C02_Write_Msg                                    5     3      2     462
;;                                              4 BANK0      5     3      2
;;                          _WDT_clear
;;                _AT24C02_Write_Byte1
;;                      _soft_delay_ms
;; ---------------------------------------------------------------------------------
;; (2) _AT24C02_Read_Byte1                                   2     2      0     370
;;                                              4 BANK0      2     2      0
;;                         _IIC_START1
;;                      _I2C_SendByte1
;;                      _IIC_Wait_ACK1
;;                      _I2C_ReadByte1
;;                          _IIC_STOP1
;; ---------------------------------------------------------------------------------
;; (2) _EEPROM_ReceByte                                      2     1      1    1030
;;                                             11 BANK0      2     1      1
;;                       _IIC_ReceByte
;; ---------------------------------------------------------------------------------
;; (3) _EEPROM_CheckBusy                                     0     0      0     622
;;                      _IIC_CheckBusy
;; ---------------------------------------------------------------------------------
;; (2) _RF_RxData                                            3     2      1     657
;;                                              3 BANK0      3     2      1
;;                       _RF_GetStatus
;;                       _RF_Read_Buff
;;                       _RF_ClearFIFO
;;                     _RF_ClearStatus
;; ---------------------------------------------------------------------------------
;; (1) _Key_HandRunning                                      0     0      0     817
;;                          _BufRuning
;;                           _PWM_LED1
;;                           _PWM_LED2
;; ---------------------------------------------------------------------------------
;; (1) _RF_ENHANCE_RxData                                    4     2      2     657
;;                                              3 BANK0      4     2      2
;;                       _RF_GetStatus
;;                       _RF_Read_Buff
;;                       _RF_ClearFIFO
;;                     _RF_ClearStatus
;; ---------------------------------------------------------------------------------
;; (1) _RF_Init3                                             0     0      0     542
;;                        _RF_WriteReg
;;                         _RF_ADDSSet
;; ---------------------------------------------------------------------------------
;; (1) _RF_Init                                             19    19      0     891
;;                                              4 BANK0     19    19      0
;;                           _SPI_init
;;                        _RF_WriteReg
;;                         _RF_ADDSSet
;;                      _RF_Write_Buff
;; ---------------------------------------------------------------------------------
;; (1) _LED_Dimming                                          2     1      1    1160
;;                                              9 BANK0      2     1      1
;;                _Convert_Duty_Cycle1
;;                _Convert_Duty_Cycle2
;;                          _BufSetRun
;; ---------------------------------------------------------------------------------
;; (2) _BufRuning                                            4     4      0     773
;;                                              1 BANK0      4     4      0
;;                          _BufferRun
;;                     _Buffer_VaryFun
;; ---------------------------------------------------------------------------------
;; (3) _I2C_ReadByte1                                        6     4      2     158
;;                                              4 COMMON     2     0      2
;;                                              0 BANK0      4     4      0
;;                       _iic_delay_us
;;                          _IIC_NACK1
;;                           _IIC_ACK1
;; ---------------------------------------------------------------------------------
;; (3) _AT24C02_Write_Byte1                                  2     1      1     210
;;                                              6 COMMON     1     0      1
;;                                              0 BANK0      1     1      0
;;                         _IIC_START1
;;                      _I2C_SendByte1
;;                      _IIC_Wait_ACK1
;;                          _IIC_STOP1
;; ---------------------------------------------------------------------------------
;; (3) _IIC_ReceByte                                         4     1      3     986
;;                                              7 BANK0      4     1      3
;;                          _IIC_start
;;                          _IIC_Wbyte
;;                           _IIC_RACK
;;                          _IIC_Rbyte
;;                           _IIC_WACK
;;                           _IIC_stop
;; ---------------------------------------------------------------------------------
;; (3) _IIC_SendByte                                         3     1      2     712
;;                                              7 BANK0      3     1      2
;;                          _IIC_start
;;                          _IIC_Wbyte
;;                           _IIC_RACK
;;                           _IIC_stop
;; ---------------------------------------------------------------------------------
;; (4) _IIC_CheckBusy                                        1     1      0     622
;;                                              7 BANK0      1     1      0
;;                          _IIC_start
;;                          _IIC_Wbyte
;;                           _IIC_RACK
;; ---------------------------------------------------------------------------------
;; (1) _RF_ClearStatus                                       0     0      0     136
;;                        _RF_WriteReg
;; ---------------------------------------------------------------------------------
;; (1) _RF_ClearFIFO                                         0     0      0     136
;;                        _RF_WriteReg
;; ---------------------------------------------------------------------------------
;; (3) _RF_GetStatus                                         0     0      0     137
;;                         _RF_ReadReg
;; ---------------------------------------------------------------------------------
;; (1) _RF_Set_RxMode1                                       1     1      0     136
;;                        _RF_WriteReg
;; ---------------------------------------------------------------------------------
;; (1) _RF_Init4                                             0     0      0     340
;;                        _RF_WriteReg
;;                      _RF_Write_Buff
;; ---------------------------------------------------------------------------------
;; (1) _RF_ADDSSet                                           1     1      0     406
;;                                              3 BANK0      1     1      0
;;                        _RF_WriteReg
;;                      _RF_Write_Buff
;; ---------------------------------------------------------------------------------
;; (1) _RF_Set_RxMode                                        1     1      0     136
;;                        _RF_WriteReg
;; ---------------------------------------------------------------------------------
;; (1) _EEPROM_Init                                          1     1      0      90
;;                                              6 COMMON     1     1      0
;;                           _IIC_Init
;; ---------------------------------------------------------------------------------
;; (4) _IIC_NACK1                                            0     0      0      22
;;                       _iic_delay_us
;; ---------------------------------------------------------------------------------
;; (4) _IIC_ACK1                                             0     0      0      22
;;                       _iic_delay_us
;; ---------------------------------------------------------------------------------
;; (2) _Convert_Duty_Cycle2                                  6     4      2     437
;;                                              3 BANK0      6     4      2
;;                             ___wmul
;;                            ___lwdiv
;; ---------------------------------------------------------------------------------
;; (2) _Convert_Duty_Cycle1                                  5     3      2     437
;;                                              3 BANK0      5     3      2
;;                             ___wmul
;;                            ___lwdiv
;; ---------------------------------------------------------------------------------
;; (3) _Buffer_VaryFun                                       3     1      2     110
;;                                              4 COMMON     3     1      2
;;                           _PWM_LED1
;;                           _PWM_LED2
;; ---------------------------------------------------------------------------------
;; (1) _LEDCon_Chg                                           0     0      0     198
;;                           _PWM_LED1
;;                           _PWM_LED2
;;                           _SetRunEn
;; ---------------------------------------------------------------------------------
;; (2) _Pair_LED                                             2     2      0     416
;;                                              4 BANK0      2     2      0
;;                _CCP1_set_duty_cycle
;;                _CCP2_set_duty_cycle
;;                      _soft_delay_ms
;;                          _WDT_clear
;; ---------------------------------------------------------------------------------
;; (4) _IIC_Rbyte                                            4     4      0     162
;;                                              5 COMMON     1     1      0
;;                                              0 BANK0      3     3      0
;;                          _IIC_delay
;; ---------------------------------------------------------------------------------
;; (5) _IIC_Wbyte                                            4     4      0     137
;;                                              5 COMMON     1     1      0
;;                                              0 BANK0      2     2      0
;;                          _IIC_delay
;; ---------------------------------------------------------------------------------
;; (4) _IIC_WACK                                             2     2      0      68
;;                                              5 COMMON     2     2      0
;;                          _IIC_delay
;; ---------------------------------------------------------------------------------
;; (5) _IIC_RACK                                             7     7      0     417
;;                                              0 BANK0      7     7      0
;;                          _IIC_delay
;;                            ___lbdiv
;; ---------------------------------------------------------------------------------
;; (4) _IIC_stop                                             1     1      0      46
;;                          _IIC_delay
;; ---------------------------------------------------------------------------------
;; (5) _IIC_start                                            1     1      0      46
;;                          _IIC_delay
;; ---------------------------------------------------------------------------------
;; (4) _IIC_STOP1                                            0     0      0      22
;;                       _iic_delay_us
;; ---------------------------------------------------------------------------------
;; (4) _IIC_Wait_ACK1                                        1     1      0      31
;;                                              4 COMMON     1     1      0
;;                       _iic_delay_us
;; ---------------------------------------------------------------------------------
;; (4) _I2C_SendByte1                                        2     2      0      91
;;                                              4 COMMON     2     2      0
;;                       _iic_delay_us
;; ---------------------------------------------------------------------------------
;; (4) _IIC_START1                                           0     0      0      22
;;                       _iic_delay_us
;; ---------------------------------------------------------------------------------
;; (2) _IIC_Init                                             1     1      0      68
;;                                              5 COMMON     1     1      0
;;                          _IIC_delay
;; ---------------------------------------------------------------------------------
;; (4) _RF_ReadReg                                           2     2      0     137
;;                                              5 COMMON     2     2      0
;;                             _SPI_RW
;; ---------------------------------------------------------------------------------
;; (3) _RF_Read_Buff                                         5     3      2     204
;;                                              5 COMMON     2     0      2
;;                                              0 BANK0      3     3      0
;;                             _SPI_RW
;; ---------------------------------------------------------------------------------
;; (2) _RF_Write_Buff                                        5     2      3     204
;;                                              5 COMMON     2     2      0
;;                                              0 BANK0      3     0      3
;;                             _SPI_RW
;; ---------------------------------------------------------------------------------
;; (2) _RF_WriteReg                                          2     1      1     136
;;                                              5 COMMON     2     1      1
;;                             _SPI_RW
;; ---------------------------------------------------------------------------------
;; (1) _LED_ALLOFF                                           0     0      0     198
;;                           _SetRunEn
;;                           _PWM_LED1
;;                           _PWM_LED2
;; ---------------------------------------------------------------------------------
;; (1) _PWM_12SetVol                                         0     0      0     140
;;                _CCP1_set_duty_cycle
;;                _CCP2_set_duty_cycle
;; ---------------------------------------------------------------------------------
;; (6) ___lbdiv                                              4     3      1     162
;;                                              3 COMMON     4     3      1
;; ---------------------------------------------------------------------------------
;; (3) ___lwdiv                                              7     3      4     162
;;                                              3 COMMON     4     0      4
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (3) ___wmul                                               6     2      4      92
;;                                              3 COMMON     4     0      4
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (5) _iic_delay_us                                         1     1      0      22
;;                                              3 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _Data_Check                                           8     8      0     230
;;                                              3 COMMON     3     3      0
;;                                              0 BANK0      5     5      0
;; ---------------------------------------------------------------------------------
;; (2) _UpdateCRC                                           10     8      2     169
;;                                              3 COMMON     2     0      2
;;                                              0 BANK0      8     8      0
;; ---------------------------------------------------------------------------------
;; (3) _BufferRun                                            5     5      0     352
;;                                              3 COMMON     4     4      0
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _GerBuff_RunSAT                                       1     1      0      22
;;                                              3 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _BufSetRun                                            4     1      3     198
;;                                              3 COMMON     4     1      3
;; ---------------------------------------------------------------------------------
;; (1) _GetChgLV                                             3     3      0     113
;;                                              3 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (6) _IIC_delay                                            2     2      0      46
;;                                              3 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (3) _SPI_RW                                               2     2      0      92
;;                                              3 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _SPI_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _PWM_LED2                                             1     1      0      22
;;                                              3 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _PWM_LED1                                             1     1      0      22
;;                                              3 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _getClock                                             1     1      0      24
;;                                              3 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (3) _WDT_clear                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _WDT_enable                                           1     1      0      22
;;                                              3 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _Timer1_start                                         3     0      3       0
;;                                              3 COMMON     3     0      3
;; ---------------------------------------------------------------------------------
;; (1) _Timer1_Init                                          1     1      0      22
;;                                              3 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _Enable_Interrupt                                     0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _SetRunEn                                             4     1      3     154
;;                                              3 COMMON     4     1      3
;; ---------------------------------------------------------------------------------
;; (1) _IIC_Init1                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _CCP2_set_duty_cycle                                  5     3      2      70
;;                                              3 COMMON     4     2      2
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (3) _CCP1_set_duty_cycle                                  5     3      2      70
;;                                              3 COMMON     4     2      2
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _CCPX_Init                                            2     1      1      44
;;                                              3 COMMON     2     1      1
;; ---------------------------------------------------------------------------------
;; (3) _soft_delay_ms                                        6     4      2     138
;;                                              3 COMMON     2     0      2
;;                                              0 BANK0      4     4      0
;; ---------------------------------------------------------------------------------
;; (1) _system_set_CPU_frequency                             1     1      0      22
;;                                              3 COMMON     1     1      0
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
;;   _soft_delay_ms
;;   _CCPX_Init
;;   _CCP1_set_duty_cycle
;;   _CCP2_set_duty_cycle
;;   _EEPROM_Init
;;     _IIC_Init
;;       _IIC_delay
;;   _EP_GetONOFFStep
;;     _EEPROM_ReceByte
;;       _IIC_ReceByte
;;         _IIC_start
;;           _IIC_delay
;;         _IIC_Wbyte
;;           _IIC_delay
;;         _IIC_RACK
;;           _IIC_delay
;;           ___lbdiv
;;         _IIC_Rbyte
;;           _IIC_delay
;;         _IIC_WACK
;;           _IIC_delay
;;         _IIC_stop
;;           _IIC_delay
;;     _WDT_clear
;;   _PWM_12SetVol
;;     _CCP1_set_duty_cycle
;;     _CCP2_set_duty_cycle
;;   _EP_SetONOFFStep
;;     _EEPROM_SendByte
;;       _IIC_SendByte
;;         _IIC_start
;;           _IIC_delay
;;         _IIC_Wbyte
;;           _IIC_delay
;;         _IIC_RACK
;;           _IIC_delay
;;           ___lbdiv
;;         _IIC_stop
;;           _IIC_delay
;;       _EEPROM_CheckBusy
;;         _IIC_CheckBusy
;;           _IIC_start
;;             _IIC_delay
;;           _IIC_Wbyte
;;             _IIC_delay
;;           _IIC_RACK
;;             _IIC_delay
;;             ___lbdiv
;;     _WDT_clear
;;   _IIC_Init1
;;   _AT24C02_Read_Msg
;;     _WDT_clear
;;     _AT24C02_Read_Byte1
;;       _IIC_START1
;;         _iic_delay_us
;;       _I2C_SendByte1
;;         _iic_delay_us
;;       _IIC_Wait_ACK1
;;         _iic_delay_us
;;       _I2C_ReadByte1
;;         _iic_delay_us
;;         _IIC_NACK1
;;           _iic_delay_us
;;         _IIC_ACK1
;;           _iic_delay_us
;;       _IIC_STOP1
;;         _iic_delay_us
;;     _soft_delay_ms
;;   _RF_Init
;;     _SPI_init
;;     _RF_WriteReg
;;       _SPI_RW
;;     _RF_ADDSSet
;;       _RF_WriteReg
;;         _SPI_RW
;;       _RF_Write_Buff
;;         _SPI_RW
;;     _RF_Write_Buff
;;       _SPI_RW
;;   _RF_Set_RxMode
;;     _RF_WriteReg
;;       _SPI_RW
;;   _RF_ADDSSet
;;     _RF_WriteReg
;;       _SPI_RW
;;     _RF_Write_Buff
;;       _SPI_RW
;;   _SetRunEn
;;   _Enable_Interrupt
;;   _Timer1_Init
;;   _Timer1_start
;;   _WDT_enable
;;   _WDT_clear
;;   _EP_IsADDCfg
;;     _EEPROM_ReceByte
;;       _IIC_ReceByte
;;         _IIC_start
;;           _IIC_delay
;;         _IIC_Wbyte
;;           _IIC_delay
;;         _IIC_RACK
;;           _IIC_delay
;;           ___lbdiv
;;         _IIC_Rbyte
;;           _IIC_delay
;;         _IIC_WACK
;;           _IIC_delay
;;         _IIC_stop
;;           _IIC_delay
;;     _WDT_clear
;;   _EP_GetRFAdd
;;     _WDT_clear
;;     _EEPROM_ReceByte
;;       _IIC_ReceByte
;;         _IIC_start
;;           _IIC_delay
;;         _IIC_Wbyte
;;           _IIC_delay
;;         _IIC_RACK
;;           _IIC_delay
;;           ___lbdiv
;;         _IIC_Rbyte
;;           _IIC_delay
;;         _IIC_WACK
;;           _IIC_delay
;;         _IIC_stop
;;           _IIC_delay
;;   _RF_Init4
;;     _RF_WriteReg
;;       _SPI_RW
;;     _RF_Write_Buff
;;       _SPI_RW
;;   _RF_Set_RxMode1
;;     _RF_WriteReg
;;       _SPI_RW
;;   _RF_Init3
;;     _RF_WriteReg
;;       _SPI_RW
;;     _RF_ADDSSet
;;       _RF_WriteReg
;;         _SPI_RW
;;       _RF_Write_Buff
;;         _SPI_RW
;;   _RF_ENHANCE_RxData
;;     _RF_GetStatus
;;       _RF_ReadReg
;;         _SPI_RW
;;     _RF_Read_Buff
;;       _SPI_RW
;;     _RF_ClearFIFO
;;       _RF_WriteReg
;;         _SPI_RW
;;     _RF_ClearStatus
;;       _RF_WriteReg
;;         _SPI_RW
;;   _Key_Handle
;;     _EP_SetRFAdd
;;       _WDT_clear
;;       _EEPROM_SendByte
;;         _IIC_SendByte
;;           _IIC_start
;;             _IIC_delay
;;           _IIC_Wbyte
;;             _IIC_delay
;;           _IIC_RACK
;;             _IIC_delay
;;             ___lbdiv
;;           _IIC_stop
;;             _IIC_delay
;;         _EEPROM_CheckBusy
;;           _IIC_CheckBusy
;;             _IIC_start
;;               _IIC_delay
;;             _IIC_Wbyte
;;               _IIC_delay
;;             _IIC_RACK
;;               _IIC_delay
;;               ___lbdiv
;;     _soft_delay_ms
;;     _EP_GetRFAdd
;;       _WDT_clear
;;       _EEPROM_ReceByte
;;         _IIC_ReceByte
;;           _IIC_start
;;             _IIC_delay
;;           _IIC_Wbyte
;;             _IIC_delay
;;           _IIC_RACK
;;             _IIC_delay
;;             ___lbdiv
;;           _IIC_Rbyte
;;             _IIC_delay
;;           _IIC_WACK
;;             _IIC_delay
;;           _IIC_stop
;;             _IIC_delay
;;     _RF_ADDSSet
;;       _RF_WriteReg
;;         _SPI_RW
;;       _RF_Write_Buff
;;         _SPI_RW
;;     _EP_SetADDCfg
;;       _WDT_clear
;;       _EEPROM_SendByte
;;         _IIC_SendByte
;;           _IIC_start
;;             _IIC_delay
;;           _IIC_Wbyte
;;             _IIC_delay
;;           _IIC_RACK
;;             _IIC_delay
;;             ___lbdiv
;;           _IIC_stop
;;             _IIC_delay
;;         _EEPROM_CheckBusy
;;           _IIC_CheckBusy
;;             _IIC_start
;;               _IIC_delay
;;             _IIC_Wbyte
;;               _IIC_delay
;;             _IIC_RACK
;;               _IIC_delay
;;               ___lbdiv
;;     _Pair_LED
;;       _CCP1_set_duty_cycle
;;       _CCP2_set_duty_cycle
;;       _soft_delay_ms
;;       _WDT_clear
;;     _LED_ALLOFF
;;       _SetRunEn
;;       _PWM_LED1
;;       _PWM_LED2
;;     _PWM_LED1
;;     _PWM_LED2
;;     _CCP1_set_duty_cycle
;;     _CCP2_set_duty_cycle
;;     _WDT_clear
;;     _SetRunEn
;;     _GetChgLV
;;     _BufSetRun
;;     _LEDCon_Chg
;;       _PWM_LED1
;;       _PWM_LED2
;;       _SetRunEn
;;     _GerBuff_RunSAT
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
;;     _Remote_Pairing
;;       _Data_Check
;;       _Write_Remote_Addr
;;         _AT24C02_Write_Msg
;;           _WDT_clear
;;           _AT24C02_Write_Byte1
;;             _IIC_START1
;;               _iic_delay_us
;;             _I2C_SendByte1
;;               _iic_delay_us
;;             _IIC_Wait_ACK1
;;               _iic_delay_us
;;             _IIC_STOP1
;;               _iic_delay_us
;;           _soft_delay_ms
;;       _Pair_LED
;;         _CCP1_set_duty_cycle
;;         _CCP2_set_duty_cycle
;;         _soft_delay_ms
;;         _WDT_clear
;;     _Data_Check
;;     _LED_Dimming
;;       _Convert_Duty_Cycle1
;;         ___wmul
;;         ___lwdiv
;;       _Convert_Duty_Cycle2
;;         ___wmul
;;         ___lwdiv
;;       _BufSetRun
;;     _LED_ALLOFF
;;       _SetRunEn
;;       _PWM_LED1
;;       _PWM_LED2
;;     _PWM_LED1
;;     _PWM_LED2
;;     _SetRunEn
;;     _LEDCon_Chg
;;       _PWM_LED1
;;       _PWM_LED2
;;       _SetRunEn
;;     _Delete_One_RemoteAddr
;;       _Data_Check
;;       _AT24C02_Write_Msg
;;         _WDT_clear
;;         _AT24C02_Write_Byte1
;;           _IIC_START1
;;             _iic_delay_us
;;           _I2C_SendByte1
;;             _iic_delay_us
;;           _IIC_Wait_ACK1
;;             _iic_delay_us
;;           _IIC_STOP1
;;             _iic_delay_us
;;         _soft_delay_ms
;;     _RF_ClearFIFO
;;       _RF_WriteReg
;;         _SPI_RW
;;     _RF_ClearStatus
;;       _RF_WriteReg
;;         _SPI_RW
;;   _getClock
;;   _Key_HandRunning
;;     _BufRuning
;;       _BufferRun
;;       _Buffer_VaryFun
;;         _PWM_LED1
;;         _PWM_LED2
;;     _PWM_LED1
;;     _PWM_LED2
;;   _LED_ALLOFF
;;     _SetRunEn
;;     _PWM_LED1
;;     _PWM_LED2
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
;;BANK1               50      0      48       7       90.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      AB       8        0.0%
;;ABS                  0      0      A1       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       A       2        0.0%
;;BANK0               50     23      4E       5       97.5%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      7       B       1       78.6%
;;BITCOMMON            E      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 56 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   34[BANK0 ] unsigned char 
;;  j               1   33[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_system_set_CPU_frequency
;;		_soft_delay_ms
;;		_CCPX_Init
;;		_CCP1_set_duty_cycle
;;		_CCP2_set_duty_cycle
;;		_EEPROM_Init
;;		_EP_GetONOFFStep
;;		_PWM_12SetVol
;;		_EP_SetONOFFStep
;;		_IIC_Init1
;;		_AT24C02_Read_Msg
;;		_RF_Init
;;		_RF_Set_RxMode
;;		_RF_ADDSSet
;;		_SetRunEn
;;		_Enable_Interrupt
;;		_Timer1_Init
;;		_Timer1_start
;;		_WDT_enable
;;		_WDT_clear
;;		_EP_IsADDCfg
;;		_EP_GetRFAdd
;;		_RF_Init4
;;		_RF_Set_RxMode1
;;		_RF_Init3
;;		_RF_ENHANCE_RxData
;;		_Key_Handle
;;		_recive_task
;;		_getClock
;;		_Key_HandRunning
;;		_LED_ALLOFF
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\main.c"
	line	56
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	57
	
l13994:	
	line	58
;main.c: 58: unsigned char j = 0;
	clrf	(main@j)
	line	60
	
l13996:	
;main.c: 60: system_set_CPU_frequency(CPU_FREQUENCY_8M);
	movlw	(071h)
	fcall	_system_set_CPU_frequency
	line	61
	
l13998:	
;main.c: 61: soft_delay_ms(200);
	movlw	0C8h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	62
	
l14000:	
# 62 "D:\Work\project\遥控+接收主程序\双信道接收2\src\main.c"
nop ;#
psect	maintext
	line	63
;main.c: 63: TRISC = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	64
;main.c: 64: TRISB = 0x00;
	clrf	(134)^080h	;volatile
	line	65
;main.c: 65: PORTC = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	66
;main.c: 66: PORTB = 0x00;
	clrf	(6)	;volatile
	line	68
	
l14002:	
;main.c: 68: CCPX_Init(1,61);
	movlw	(03Dh)
	movwf	(?_CCPX_Init)
	movlw	(01h)
	fcall	_CCPX_Init
	line	69
	
l14004:	
;main.c: 69: CCP1_set_duty_cycle(0);
	clrf	(?_CCP1_set_duty_cycle)
	clrf	(?_CCP1_set_duty_cycle+1)
	fcall	_CCP1_set_duty_cycle
	line	70
	
l14006:	
;main.c: 70: CCP2_set_duty_cycle(0);
	clrf	(?_CCP2_set_duty_cycle)
	clrf	(?_CCP2_set_duty_cycle+1)
	fcall	_CCP2_set_duty_cycle
	line	72
	
l14008:	
;main.c: 72: soft_delay_ms(10);
	movlw	0Ah
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	73
	
l14010:	
	movlw	(0Ah)
	fcall	_EEPROM_Init
	line	74
	
l14012:	
;main.c: 74: soft_delay_ms(10);
	movlw	0Ah
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	78
	
l14014:	
;main.c: 78: i=EP_GetONOFFStep();
	fcall	_EP_GetONOFFStep
	movwf	(main@i)
	line	79
;main.c: 79: switch(i)
	goto	l14030
	line	81
	
l14016:	
	movlw	(0FAh)
	movwf	(_PWM_CH_LED1)
	
l14018:	
	clrf	(_PWM_CH_LED2)
	goto	l14032
	line	82
	
l14020:	
	clrf	(_PWM_CH_LED1)
	
l14022:	
	movlw	(0FAh)
	movwf	(_PWM_CH_LED2)
	goto	l14032
	line	83
	
l14024:	
	movlw	(0FAh)
	movwf	(_PWM_CH_LED1)
	movlw	(0FAh)
	movwf	(_PWM_CH_LED2)
	goto	l14032
	line	84
	
l14026:	
	movlw	(02h)
	movwf	(_PWM_CH_LED1)
	movlw	(02h)
	movwf	(_PWM_CH_LED2)
	goto	l14032
	line	79
	
l14030:	
	movf	(main@i),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           15     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             8     6 (fixed)
; spacedrange           14     9 (fixed)
; locatedrange           4     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l14016
	xorlw	1^0	; case 1
	skipnz
	goto	l14020
	xorlw	2^1	; case 2
	skipnz
	goto	l14024
	xorlw	3^2	; case 3
	skipnz
	goto	l14026
	goto	l14032
	opt asmopt_on

	line	86
	
l14032:	
;main.c: 86: LEDR1_Vol=PWM_CH_LED1;
	movf	(_PWM_CH_LED1),w
	movwf	(_LEDR1_Vol)
	line	87
;main.c: 87: LEDR2_Vol=PWM_CH_LED2;
	movf	(_PWM_CH_LED2),w
	movwf	(_LEDR2_Vol)
	line	88
	
l14034:	
;main.c: 88: PWM_12SetVol();
	fcall	_PWM_12SetVol
	line	89
	
l14036:	
;main.c: 89: if(++i>=4) i=0;
	movlw	(04h)
	incf	(main@i),f
	subwf	((main@i)),w
	skipc
	goto	u4341
	goto	u4340
u4341:
	goto	l14040
u4340:
	
l14038:	
	clrf	(main@i)
	line	91
	
l14040:	
;main.c: 91: EP_SetONOFFStep(i);
	movf	(main@i),w
	fcall	_EP_SetONOFFStep
	line	93
	
l14042:	
;main.c: 93: IIC_Init1();
	fcall	_IIC_Init1
	line	94
	
l14044:	
;main.c: 94: AT24C02_Read_Msg(30, addr_buf, 16);
	movlw	(_addr_buf)&0ffh
	movwf	(?_AT24C02_Read_Msg)
	movlw	(010h)
	movwf	0+(?_AT24C02_Read_Msg)+01h
	movlw	(01Eh)
	fcall	_AT24C02_Read_Msg
	line	97
	
l14046:	
;main.c: 97: RF_Init();
	fcall	_RF_Init
	line	98
	
l14048:	
;main.c: 98: RF_Set_RxMode();
	fcall	_RF_Set_RxMode
	line	99
	
l14050:	
;main.c: 99: soft_delay_ms(30);
	movlw	01Eh
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	100
	
l14052:	
;main.c: 100: RF_ADDSSet(TX_ADDRESS_DEF);
	movlw	(_TX_ADDRESS_DEF)&0ffh
	fcall	_RF_ADDSSet
	line	104
	
l14054:	
;main.c: 104: SetRunEn(0,1,LEDR1_Vol);
	clrf	(?_SetRunEn)
	incf	(?_SetRunEn),f
	movf	(_LEDR1_Vol),w
	movwf	0+(?_SetRunEn)+01h
	clrf	1+(?_SetRunEn)+01h
	movlw	(0)
	fcall	_SetRunEn
	line	105
	
l14056:	
;main.c: 105: SetRunEn(1,1,LEDR2_Vol);
	clrf	(?_SetRunEn)
	incf	(?_SetRunEn),f
	movf	(_LEDR2_Vol),w
	movwf	0+(?_SetRunEn)+01h
	clrf	1+(?_SetRunEn)+01h
	movlw	(01h)
	fcall	_SetRunEn
	line	106
	
l14058:	
;main.c: 106: Enable_Interrupt();
	fcall	_Enable_Interrupt
	line	108
	
l14060:	
;main.c: 108: Timer1_Init(TIMER1_DIV_8);
	movlw	(030h)
	fcall	_Timer1_Init
	line	109
	
l14062:	
;main.c: 109: Timer1_start(1000, 0);
	movlw	low(03E8h)
	movwf	(?_Timer1_start)
	movlw	high(03E8h)
	movwf	((?_Timer1_start))+1
	clrf	0+(?_Timer1_start)+02h
	fcall	_Timer1_start
	line	110
;main.c: 110: Time1s_cot = 0;
	clrf	(_Time1s_cot)
	clrf	(_Time1s_cot+1)
	line	111
	
l14064:	
;main.c: 111: WDT_enable(7);
	movlw	(07h)
	fcall	_WDT_enable
	line	113
	
l14066:	
;main.c: 113: BriCoTem_Value.Brightness =100;
	movlw	(064h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_BriCoTem_Value)
	line	114
	
l14068:	
;main.c: 114: BriCoTem_Value.ColorTemp = 50;
	movlw	(032h)
	movwf	0+(_BriCoTem_Value)+01h
	line	122
	
l14070:	
;main.c: 117: {
;main.c: 122: if(TimeEN_LEDTrun==0 && (clk_flag & 0x01))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_TimeEN_LEDTrun),f
	skipz
	goto	u4351
	goto	u4350
u4351:
	goto	l14084
u4350:
	
l14072:	
	btfss	(_clk_flag),(0)&7
	goto	u4361
	goto	u4360
u4361:
	goto	l14084
u4360:
	line	124
	
l14074:	
;main.c: 123: {
;main.c: 124: if(Timecnt_LEDTrun++>1700)
	incf	(_Timecnt_LEDTrun),f
	skipnz
	incf	(_Timecnt_LEDTrun+1),f
	movlw	high(06A6h)
	subwf	((_Timecnt_LEDTrun+1)),w
	movlw	low(06A6h)
	skipnz
	subwf	((_Timecnt_LEDTrun)),w
	skipc
	goto	u4371
	goto	u4370
u4371:
	goto	l14084
u4370:
	line	126
	
l14076:	
;main.c: 125: {
;main.c: 126: TimeEN_LEDTrun=1;
	clrf	(_TimeEN_LEDTrun)
	incf	(_TimeEN_LEDTrun),f
	line	127
	
l14078:	
;main.c: 127: soft_delay_ms(1);
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	128
	
l14080:	
;main.c: 128: EP_SetONOFFStep(0);
	movlw	(0)
	fcall	_EP_SetONOFFStep
	line	129
	
l14082:	
;main.c: 129: WDT_clear();
	fcall	_WDT_clear
	line	133
	
l14084:	
;main.c: 130: }
;main.c: 131: }
;main.c: 133: if(SysRunTime_3S==0 && (clk_flag & 0x01))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_SysRunTime_3S),f
	skipz
	goto	u4381
	goto	u4380
u4381:
	goto	l14104
u4380:
	
l14086:	
	btfss	(_clk_flag),(0)&7
	goto	u4391
	goto	u4390
u4391:
	goto	l14104
u4390:
	line	135
	
l14088:	
;main.c: 134: {
;main.c: 135: if(Timecnt_3S++>3000)
	incf	(_Timecnt_3S),f
	skipnz
	incf	(_Timecnt_3S+1),f
	movlw	high(0BBAh)
	subwf	((_Timecnt_3S+1)),w
	movlw	low(0BBAh)
	skipnz
	subwf	((_Timecnt_3S)),w
	skipc
	goto	u4401
	goto	u4400
u4401:
	goto	l14104
u4400:
	line	137
	
l14090:	
;main.c: 136: {
;main.c: 137: SysRunTime_3S=1;
	clrf	(_SysRunTime_3S)
	incf	(_SysRunTime_3S),f
	line	139
	
l14092:	
;main.c: 139: i=EP_IsADDCfg();
	fcall	_EP_IsADDCfg
	movwf	(main@i)
	line	140
	
l14094:	
;main.c: 140: if(i)
	movf	(main@i),w
	skipz
	goto	u4410
	goto	l14104
u4410:
	line	142
	
l14096:	
;main.c: 141: {
;main.c: 142: EP_GetRFAdd(RF_ADDRESS);
	movlw	(_RF_ADDRESS)&0ffh
	fcall	_EP_GetRFAdd
	line	144
	
l14098:	
;main.c: 144: soft_delay_ms(1);
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	145
	
l14100:	
;main.c: 145: RF_ADDSSet(RF_ADDRESS);
	movlw	(_RF_ADDRESS)&0ffh
	fcall	_RF_ADDSSet
	line	146
	
l14102:	
;main.c: 146: WDT_clear();
	fcall	_WDT_clear
	line	151
	
l14104:	
;main.c: 147: }
;main.c: 148: }
;main.c: 149: }
;main.c: 151: if((clk_flag & 0x10) && Time1s_cot==0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_clk_flag),(4)&7
	goto	u4421
	goto	u4420
u4421:
	goto	l14120
u4420:
	
l14106:	
	movf	((_Time1s_cot+1)),w
	iorwf	((_Time1s_cot)),w
	skipz
	goto	u4431
	goto	u4430
u4431:
	goto	l14120
u4430:
	line	153
	
l14108:	
;main.c: 152: {
;main.c: 153: if(j)
	movf	(main@j),w
	skipz
	goto	u4440
	goto	l739
u4440:
	line	155
	
l14110:	
;main.c: 154: {
;main.c: 155: j = 0;
	clrf	(main@j)
	line	156
	
l14112:	
;main.c: 156: RF_Init4();
	fcall	_RF_Init4
	line	157
	
l14114:	
;main.c: 157: RF_Set_RxMode1();
	fcall	_RF_Set_RxMode1
	line	158
;main.c: 158: }
	goto	l14120
	line	159
	
l739:	
	line	161
;main.c: 159: else
;main.c: 160: {
;main.c: 161: j = 1;
	clrf	(main@j)
	incf	(main@j),f
	line	163
	
l14116:	
;main.c: 163: RF_Init3();
	fcall	_RF_Init3
	line	164
	
l14118:	
;main.c: 164: RF_Set_RxMode();
	fcall	_RF_Set_RxMode
	line	168
	
l14120:	
;main.c: 165: }
;main.c: 166: }
;main.c: 168: if(j == 1)
	decf	(main@j),w
	skipz
	goto	u4451
	goto	u4450
u4451:
	goto	l14140
u4450:
	line	170
	
l14122:	
;main.c: 169: {
;main.c: 170: if(RF_ENHANCE_RxData(rf_buf,8,ack_buf))
	movlw	(08h)
	movwf	(?_RF_ENHANCE_RxData)
	movlw	((_ack_buf-__stringbase))&0ffh
	movwf	(0+?_RF_ENHANCE_RxData+01h)
	movlw	(_rf_buf)&0ffh
	fcall	_RF_ENHANCE_RxData
	xorlw	0
	skipnz
	goto	u4461
	goto	u4460
u4461:
	goto	l14140
u4460:
	line	173
	
l14124:	
;main.c: 171: {
;main.c: 173: Key_Handle(rf_buf);
	movlw	(_rf_buf)&0ffh
	movwf	(?_Key_Handle)
psect	jmp_tab__Key_Handle,class=ENTRY,delta=2
global __pjmp_tab__Key_Handle
__pjmp_tab__Key_Handle:
	
u4477jt:
	ljmp	u4477jf
psect	maintext
	
	movlw	low(u4477jt)
	ljmp	_Key_Handle
u4477jf:
	line	174
	
l14126:	
;main.c: 174: for(i=0;i<8;i++) rf_buf[i]=0; WDT_clear();
	clrf	(main@i)
	
l14132:	
	movf	(main@i),w
	addlw	_rf_buf&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrf	indf
	
l14134:	
	incf	(main@i),f
	
l14136:	
	movlw	(08h)
	subwf	(main@i),w
	skipc
	goto	u4481
	goto	u4480
u4481:
	goto	l14132
u4480:
	
l14138:	
	fcall	_WDT_clear
	line	177
	
l14140:	
;main.c: 175: }
;main.c: 176: }
;main.c: 177: if(j == 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@j),f
	skipz
	goto	u4491
	goto	u4490
u4491:
	goto	l14144
u4490:
	line	179
	
l14142:	
;main.c: 178: {
;main.c: 179: recive_task();
psect	jmp_tab__recive_task,class=ENTRY,delta=2
global __pjmp_tab__recive_task
__pjmp_tab__recive_task:
	
u4507jt:
	ljmp	u4507jf
psect	maintext
	
	movlw	low(u4507jt)
	ljmp	_recive_task
u4507jf:
	line	181
	
l14144:	
;main.c: 180: }
;main.c: 181: PWM_12SetVol();
	fcall	_PWM_12SetVol
	line	184
	
l14146:	
;main.c: 184: getClock();
	fcall	_getClock
	line	185
	
l14148:	
;main.c: 185: if((clk_flag & 0x01))
	btfss	(_clk_flag),(0)&7
	goto	u4511
	goto	u4510
u4511:
	goto	l14166
u4510:
	line	187
	
l14150:	
;main.c: 186: {
;main.c: 187: Key_HandRunning();
	fcall	_Key_HandRunning
	line	189
	
l14152:	
;main.c: 189: if(++DingShi > 99)
	movlw	(064h)
	incf	(_DingShi),f
	subwf	((_DingShi)),w
	skipc
	goto	u4521
	goto	u4520
u4521:
	goto	l14166
u4520:
	line	191
	
l14154:	
;main.c: 190: {
;main.c: 191: DingShi=0;
	clrf	(_DingShi)
	line	193
	
l14156:	
;main.c: 193: if(SysDingShiEn)
	movf	(_SysDingShiEn),w
	skipz
	goto	u4530
	goto	l14166
u4530:
	line	195
	
l14158:	
;main.c: 194: {
;main.c: 195: SysRunTimeCnt--;
	movlw	low(01h)
	subwf	(_SysRunTimeCnt),f
	movlw	high(01h)
	skipc
	decf	(_SysRunTimeCnt+1),f
	subwf	(_SysRunTimeCnt+1),f
	line	196
	
l14160:	
;main.c: 196: if(SysRunTimeCnt==0)
	movf	((_SysRunTimeCnt+1)),w
	iorwf	((_SysRunTimeCnt)),w
	skipz
	goto	u4541
	goto	u4540
u4541:
	goto	l747
u4540:
	line	198
	
l14162:	
;main.c: 197: {
;main.c: 198: SysDingShiEn=0;
	clrf	(_SysDingShiEn)
	line	199
;main.c: 199: SysRunTimeCnt=0;
	clrf	(_SysRunTimeCnt)
	clrf	(_SysRunTimeCnt+1)
	line	200
	
l14164:	
;main.c: 200: LED_ALLOFF();
	fcall	_LED_ALLOFF
	goto	l14166
	line	203
	
l747:	
	line	206
	
l14166:	
;main.c: 201: }
;main.c: 202: }
;main.c: 203: }
;main.c: 204: }
;main.c: 206: WDT_clear();
	fcall	_WDT_clear
	goto	l14070
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	209
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_recive_task
psect	text1829,local,class=CODE,delta=2
global __ptext1829
__ptext1829:

;; *************** function _recive_task *****************
;; Defined at:
;;		line 261 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  tmp_brightne    1    0        unsigned char 
;;  flag            1    0        unsigned char 
;;  match_flag      1    0        unsigned char 
;;  i               1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       1       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_rx_data
;;		_Remote_Pairing
;;		_Data_Check
;;		_LED_Dimming
;;		_LED_ALLOFF
;;		_PWM_LED1
;;		_PWM_LED2
;;		_SetRunEn
;;		_LEDCon_Chg
;;		_Delete_One_RemoteAddr
;;		_RF_ClearFIFO
;;		_RF_ClearStatus
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1829
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
	line	261
	global	__size_of_recive_task
	__size_of_recive_task	equ	__end_of_recive_task-_recive_task
	
_recive_task:	
	opt	stack 0
; Regs used in _recive_task: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
movwf	(?_recive_task+0)^00h
	line	267
	
l13924:	
;recive.c: 267: if(rx_data())
	fcall	_rx_data
	xorlw	0
	skipnz
	goto	u4201
	goto	u4200
u4201:
	goto	l8388
u4200:
	line	270
	
l13926:	
;recive.c: 270: if(SysRunTime_3S == 0)
	movf	(_SysRunTime_3S),f
	skipz
	goto	u4211
	goto	u4210
u4211:
	goto	l13930
u4210:
	line	272
	
l13928:	
;recive.c: 271: {
;recive.c: 272: Remote_Pairing();
	fcall	_Remote_Pairing
	line	274
	
l13930:	
;recive.c: 273: }
;recive.c: 274: if (rf_buf[2] != Count_Save)
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_rf_buf)^080h+02h,w
	bcf	status, 5	;RP0=0, select bank0
	xorwf	(_Count_Save),w
	skipnz
	goto	u4221
	goto	u4220
u4221:
	goto	l13990
u4220:
	line	276
	
l13932:	
;recive.c: 275: {
;recive.c: 276: Count_Save = rf_buf[2];
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_rf_buf)^080h+02h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_Count_Save)
	line	277
	
l13934:	
;recive.c: 277: Pairing_Num = Data_Check();
	fcall	_Data_Check
	movwf	(_Pairing_Num)
	line	278
	
l13936:	
;recive.c: 278: if(Pairing_Num == 0xFF)
	movf	(_Pairing_Num),w
	xorlw	0FFh
	skipz
	goto	u4231
	goto	u4230
u4231:
	goto	l13940
u4230:
	goto	l8388
	line	282
	
l13940:	
;recive.c: 281: }
;recive.c: 282: Time1s_cot = 1000;
	movlw	low(03E8h)
	movwf	(_Time1s_cot)
	movlw	high(03E8h)
	movwf	((_Time1s_cot))+1
	line	283
;recive.c: 283: if (rf_buf[8] == (0x12))
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_rf_buf)^080h+08h,w
	xorlw	012h
	skipz
	goto	u4241
	goto	u4240
u4241:
	goto	l13960
u4240:
	line	286
	
l13942:	
;recive.c: 284: {
;recive.c: 286: if (rf_buf[9] == 0x00)
	movf	0+(_rf_buf)^080h+09h,f
	skipz
	goto	u4251
	goto	u4250
u4251:
	goto	l13948
u4250:
	line	288
	
l13944:	
;recive.c: 287: {
;recive.c: 288: BriCoTem_Value.Brightness = rf_buf[10];
	movf	0+(_rf_buf)^080h+0Ah,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_BriCoTem_Value)
	line	290
	
l13946:	
;recive.c: 290: LED_Dimming(rf_buf[10],BriCoTem_Value.ColorTemp);
	movf	0+(_BriCoTem_Value)+01h,w
	movwf	(?_LED_Dimming)
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_rf_buf)^080h+0Ah,w
	fcall	_LED_Dimming
	line	292
;recive.c: 292: }
	goto	l13990
	line	293
	
l13948:	
;recive.c: 293: else if (rf_buf[9] == 0x01)
	decf	0+(_rf_buf)^080h+09h,w
	skipz
	goto	u4261
	goto	u4260
u4261:
	goto	l13954
u4260:
	line	295
	
l13950:	
;recive.c: 294: {
;recive.c: 295: BriCoTem_Value.ColorTemp = rf_buf[11];
	movf	0+(_rf_buf)^080h+0Bh,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_BriCoTem_Value)+01h
	line	296
	
l13952:	
;recive.c: 296: LED_Dimming(BriCoTem_Value.Brightness,rf_buf[11]);
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_rf_buf)^080h+0Bh,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_LED_Dimming)
	movf	(_BriCoTem_Value),w
	fcall	_LED_Dimming
	line	298
;recive.c: 298: }
	goto	l13990
	line	299
	
l13954:	
;recive.c: 299: else if (rf_buf[9] == 0x02)
	movf	0+(_rf_buf)^080h+09h,w
	xorlw	02h
	skipz
	goto	u4271
	goto	u4270
u4271:
	goto	l8395
u4270:
	line	301
	
l13956:	
;recive.c: 300: {
;recive.c: 301: BriCoTem_Value.Brightness = rf_buf[10];
	movf	0+(_rf_buf)^080h+0Ah,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_BriCoTem_Value)
	line	302
;recive.c: 302: BriCoTem_Value.ColorTemp = rf_buf[11];
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_rf_buf)^080h+0Bh,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_BriCoTem_Value)+01h
	line	303
	
l13958:	
;recive.c: 303: LED_Dimming(BriCoTem_Value.Brightness,BriCoTem_Value.ColorTemp);
	movf	0+(_BriCoTem_Value)+01h,w
	movwf	(?_LED_Dimming)
	movf	(_BriCoTem_Value),w
	fcall	_LED_Dimming
	goto	l13990
	line	309
	
l13960:	
;recive.c: 309: else if (rf_buf[8] == (0x11))
	movf	0+(_rf_buf)^080h+08h,w
	xorlw	011h
	skipz
	goto	u4281
	goto	u4280
u4281:
	goto	l13986
u4280:
	line	311
	
l13962:	
;recive.c: 310: {
;recive.c: 311: if(rf_buf[9] == 0x00)
	movf	0+(_rf_buf)^080h+09h,f
	skipz
	goto	u4291
	goto	u4290
u4291:
	goto	l13968
u4290:
	line	313
	
l13964:	
;recive.c: 312: {
;recive.c: 313: LED_ALLOFF();
	fcall	_LED_ALLOFF
	line	314
	
l13966:	
;recive.c: 314: SysDingShiEn=0;
	clrf	(_SysDingShiEn)
	line	315
;recive.c: 315: }
	goto	l13990
	line	316
	
l13968:	
;recive.c: 316: else if(rf_buf[9] == 0x01)
	decf	0+(_rf_buf)^080h+09h,w
	skipz
	goto	u4301
	goto	u4300
u4301:
	goto	l13990
u4300:
	line	319
	
l13970:	
;recive.c: 317: {
;recive.c: 319: if(LED_ON_Sat==0)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_LED_ON_Sat),f
	skipz
	goto	u4311
	goto	u4310
u4311:
	goto	l13980
u4310:
	line	321
	
l13972:	
;recive.c: 320: {
;recive.c: 321: LED_ON_Sat=1;
	clrf	(_LED_ON_Sat)
	incf	(_LED_ON_Sat),f
	line	323
	
l13974:	
;recive.c: 323: PWM_LED1(LEDR1_Vol);
	movf	(_LEDR1_Vol),w
	fcall	_PWM_LED1
	line	324
;recive.c: 324: PWM_LED2(LEDR2_Vol);
	movf	(_LEDR2_Vol),w
	fcall	_PWM_LED2
	line	325
	
l13976:	
;recive.c: 325: SetRunEn(0,1,LEDR1_Vol);
	clrf	(?_SetRunEn)
	incf	(?_SetRunEn),f
	movf	(_LEDR1_Vol),w
	movwf	0+(?_SetRunEn)+01h
	clrf	1+(?_SetRunEn)+01h
	movlw	(0)
	fcall	_SetRunEn
	line	326
	
l13978:	
;recive.c: 326: SetRunEn(1,1,LEDR2_Vol);
	clrf	(?_SetRunEn)
	incf	(?_SetRunEn),f
	movf	(_LEDR2_Vol),w
	movwf	0+(?_SetRunEn)+01h
	clrf	1+(?_SetRunEn)+01h
	movlw	(01h)
	fcall	_SetRunEn
	line	327
;recive.c: 327: }
	goto	l13966
	line	330
	
l13980:	
;recive.c: 328: else
;recive.c: 329: {
;recive.c: 330: LEDCon_Chg();
	fcall	_LEDCon_Chg
	line	331
	
l13982:	
;recive.c: 331: if(++LED_Chg_Cnt>=6) LED_Chg_Cnt=0;
	movlw	(06h)
	incf	(_LED_Chg_Cnt),f
	subwf	((_LED_Chg_Cnt)),w
	skipc
	goto	u4321
	goto	u4320
u4321:
	goto	l13966
u4320:
	
l13984:	
	clrf	(_LED_Chg_Cnt)
	goto	l13966
	line	337
	
l13986:	
;recive.c: 337: else if(rf_buf[8] == (0x13))
	movf	0+(_rf_buf)^080h+08h,w
	xorlw	013h
	skipz
	goto	u4331
	goto	u4330
u4331:
	goto	l8395
u4330:
	line	339
	
l13988:	
;recive.c: 338: {
;recive.c: 339: Delete_One_RemoteAddr();
	fcall	_Delete_One_RemoteAddr
	goto	l13990
	line	341
	
l8395:	
	line	342
	
l13990:	
;recive.c: 340: }
;recive.c: 341: }
;recive.c: 342: RF_ClearFIFO();
	fcall	_RF_ClearFIFO
	line	343
	
l13992:	
;recive.c: 343: RF_ClearStatus();
	fcall	_RF_ClearStatus
	line	345
	
l8388:	
	movlw	high __pjmp_tab__recive_task
	movwf pclath
	movf	(?_recive_task+0)^00h,w
	movwf	pc
	opt stack 0
GLOBAL	__end_of_recive_task
	__end_of_recive_task:
;; =============== function _recive_task ends ============

	signat	_recive_task,88
	global	_Key_Handle
psect	text1830,local,class=CODE,delta=2
global __ptext1830
__ptext1830:

;; *************** function _Key_Handle *****************
;; Defined at:
;;		line 211 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\Key.c"
;; Parameters:    Size  Location     Type
;;  buf             1   17[BANK0 ] PTR unsigned char 
;;		 -> rf_buf(18), 
;; Auto vars:     Size  Location     Type
;;  k               2   29[BANK0 ] unsigned short 
;;  i               1   32[BANK0 ] unsigned char 
;;  n               1   31[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0      12       0
;;      Temps:          0       2       0
;;      Totals:         0      16       0
;;Total ram usage:       16 bytes
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_EP_SetRFAdd
;;		_soft_delay_ms
;;		_EP_GetRFAdd
;;		_RF_ADDSSet
;;		_EP_SetADDCfg
;;		_Pair_LED
;;		_LED_ALLOFF
;;		_PWM_LED1
;;		_PWM_LED2
;;		_CCP1_set_duty_cycle
;;		_CCP2_set_duty_cycle
;;		_WDT_clear
;;		_SetRunEn
;;		_GetChgLV
;;		_BufSetRun
;;		_LEDCon_Chg
;;		_GerBuff_RunSAT
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1830
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\Key.c"
	line	211
	global	__size_of_Key_Handle
	__size_of_Key_Handle	equ	__end_of_Key_Handle-_Key_Handle
	
_Key_Handle:	
;; using string table level
	opt	stack 1
; Regs used in _Key_Handle: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
movwf	(?_Key_Handle+1)^00h
	line	212
	
l13480:	
	line	213
;Key.c: 213: unsigned short int k=0;
	clrf	(Key_Handle@k)
	clrf	(Key_Handle@k+1)
	line	214
;Key.c: 214: unsigned char n=0;
	clrf	(Key_Handle@n)
	line	216
	
l13482:	
;Key.c: 216: if(buf[0]!=0x8C) return;
	movf	(Key_Handle@buf),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorlw	08Ch
	skipnz
	goto	u3491
	goto	u3490
u3491:
	goto	l13486
u3490:
	goto	l6238
	
l13484:	
	goto	l6238
	line	218
	
l13486:	
;Key.c: 218: Time1s_cot = 1000;
	movlw	low(03E8h)
	movwf	(_Time1s_cot)
	movlw	high(03E8h)
	movwf	((_Time1s_cot))+1
	line	220
	
l13488:	
;Key.c: 220: KeyVol=((unsigned short int)buf[1]<<8);
	movf	(Key_Handle@buf),w
	addlw	01h
	movwf	fsr0
	movf	indf,w
	movwf	(_KeyVol+1)
	clrf	(_KeyVol)
	line	221
	
l13490:	
;Key.c: 221: KeyVol+=buf[2];
	movf	(Key_Handle@buf),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	addwf	(_KeyVol),f
	skipnc
	incf	(_KeyVol+1),f
	line	223
;Key.c: 223: if(KeyVolSV!=KeyVol)
	movf	(_KeyVol+1),w
	xorwf	(_KeyVolSV+1),w
	skipz
	goto	u3505
	movf	(_KeyVol),w
	xorwf	(_KeyVolSV),w
u3505:

	skipnz
	goto	u3501
	goto	u3500
u3501:
	goto	l13886
u3500:
	line	225
	
l13492:	
;Key.c: 224: {
;Key.c: 225: KeyVolSV=KeyVol;
	movf	(_KeyVol+1),w
	movwf	(_KeyVolSV+1)
	movf	(_KeyVol),w
	movwf	(_KeyVolSV)
	line	227
	
l13494:	
;Key.c: 227: if(SysRunTime_3S==0)
	movf	(_SysRunTime_3S),f
	skipz
	goto	u3511
	goto	u3510
u3511:
	goto	l13806
u3510:
	line	231
	
l13496:	
;Key.c: 228: {
;Key.c: 231: if((KeyVol==0x0001)||(KeyVol==0x4000))
	decf	(_KeyVol),w
	iorwf	(_KeyVol+1),w

	skipnz
	goto	u3521
	goto	u3520
u3521:
	goto	l13500
u3520:
	
l13498:	
		movf	(_KeyVol+1),w
	xorlw	64
	iorwf	(_KeyVol),w

	skipz
	goto	u3531
	goto	u3530
u3531:
	goto	l13546
u3530:
	line	234
	
l13500:	
;Key.c: 232: {
;Key.c: 234: EP_SetRFAdd(&buf[3]);
	movf	(Key_Handle@buf),w
	addlw	03h
	fcall	_EP_SetRFAdd
	line	235
	
l13502:	
;Key.c: 235: soft_delay_ms(10);
	movlw	0Ah
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	236
	
l13504:	
;Key.c: 236: EP_GetRFAdd(RF_ADDRESS);
	movlw	(_RF_ADDRESS)&0ffh
	fcall	_EP_GetRFAdd
	line	238
	
l13506:	
;Key.c: 238: for(i=0;i<5;i++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Key_Handle@i)
	line	240
	
l13512:	
;Key.c: 239: {
;Key.c: 240: if(RF_ADDRESS[i]!=buf[i+3]) break;
	movf	(Key_Handle@i),w
	addwf	(Key_Handle@buf),w
	movwf	(??_Key_Handle+0)+0
	movf	0+(??_Key_Handle+0)+0,w
	addlw	03h
	movwf	fsr
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_Key_Handle+1)+0
	movf	(Key_Handle@i),w
	addlw	_RF_ADDRESS&0ffh
	movwf	fsr0
	movf	indf,w
	xorwf	(??_Key_Handle+1)+0,w
	skipnz
	goto	u3541
	goto	u3540
u3541:
	goto	l13516
u3540:
	goto	l13520
	line	238
	
l13516:	
	incf	(Key_Handle@i),f
	
l13518:	
	movlw	(05h)
	subwf	(Key_Handle@i),w
	skipc
	goto	u3551
	goto	u3550
u3551:
	goto	l13512
u3550:
	line	242
	
l13520:	
;Key.c: 241: }
;Key.c: 242: if(i==5)
	movf	(Key_Handle@i),w
	xorlw	05h
	skipz
	goto	u3561
	goto	u3560
u3561:
	goto	l6238
u3560:
	line	244
	
l13522:	
;Key.c: 243: {
;Key.c: 244: soft_delay_ms(5);
	movlw	05h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	245
	
l13524:	
;Key.c: 245: RF_ADDSSet(RF_ADDRESS);
	movlw	(_RF_ADDRESS)&0ffh
	fcall	_RF_ADDSSet
	line	246
	
l13526:	
;Key.c: 246: soft_delay_ms(5);
	movlw	05h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	247
	
l13528:	
;Key.c: 247: EP_SetADDCfg(1);
	movlw	(01h)
	fcall	_EP_SetADDCfg
	line	249
	
l13530:	
;Key.c: 249: Pair_LED();
	fcall	_Pair_LED
	line	251
	
l13532:	
;Key.c: 251: LED_ALLOFF();
	fcall	_LED_ALLOFF
	line	252
	
l13534:	
;Key.c: 252: LEDR1_Vol=0; LEDR2_Vol=250;
	clrf	(_LEDR1_Vol)
	
l13536:	
	movlw	(0FAh)
	movwf	(_LEDR2_Vol)
	line	253
	
l13538:	
;Key.c: 253: PWM_LED1(LEDR1_Vol);
	movf	(_LEDR1_Vol),w
	fcall	_PWM_LED1
	line	254
	
l13540:	
;Key.c: 254: PWM_LED2(LEDR2_Vol);
	movf	(_LEDR2_Vol),w
	fcall	_PWM_LED2
	line	255
	
l13542:	
;Key.c: 255: SysRunTime_3S=1;
	clrf	(_SysRunTime_3S)
	incf	(_SysRunTime_3S),f
	goto	l6238
	line	265
	
l13546:	
;Key.c: 261: }
;Key.c: 265: if((KeyVol==0x0010)||(KeyVol==0x0040))
		movf	(_KeyVol),w
	xorlw	16
	iorwf	(_KeyVol+1),w

	skipnz
	goto	u3571
	goto	u3570
u3571:
	goto	l13550
u3570:
	
l13548:	
		movf	(_KeyVol),w
	xorlw	64
	iorwf	(_KeyVol+1),w

	skipz
	goto	u3581
	goto	u3580
u3581:
	goto	l13806
u3580:
	line	267
	
l13550:	
;Key.c: 266: {
;Key.c: 267: EP_SetADDCfg(0);
	movlw	(0)
	fcall	_EP_SetADDCfg
	line	268
	
l13552:	
;Key.c: 268: soft_delay_ms(5);
	movlw	05h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	269
	
l13554:	
;Key.c: 269: RF_ADDSSet(TX_ADDRESS_DEF);
	movlw	(_TX_ADDRESS_DEF)&0ffh
	fcall	_RF_ADDSSet
	line	270
	
l13556:	
;Key.c: 270: soft_delay_ms(5);
	movlw	05h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	272
	
l13558:	
;Key.c: 272: LED_ALLOFF();
	fcall	_LED_ALLOFF
	line	273
	
l13560:	
;Key.c: 273: LEDR1_Vol=0; LEDR2_Vol=250;
	clrf	(_LEDR1_Vol)
	
l13562:	
	movlw	(0FAh)
	movwf	(_LEDR2_Vol)
	line	274
	
l13564:	
;Key.c: 274: PWM_LED1(LEDR1_Vol);
	movf	(_LEDR1_Vol),w
	fcall	_PWM_LED1
	line	275
	
l13566:	
;Key.c: 275: PWM_LED2(LEDR2_Vol);
	movf	(_LEDR2_Vol),w
	fcall	_PWM_LED2
	goto	l13542
	line	286
	
l13572:	
;Key.c: 286: if(LED_ON_Sat)
	movf	(_LED_ON_Sat),w
	skipz
	goto	u3590
	goto	l6238
u3590:
	line	288
	
l13574:	
;Key.c: 287: {
;Key.c: 288: SysDingShiEn=1;
	clrf	(_SysDingShiEn)
	incf	(_SysDingShiEn),f
	line	289
	
l13576:	
;Key.c: 289: SysRunTimeCnt=18000;
	movlw	low(04650h)
	movwf	(_SysRunTimeCnt)
	movlw	high(04650h)
	movwf	((_SysRunTimeCnt))+1
	line	292
	
l13578:	
;Key.c: 292: CCP1_set_duty_cycle(0);
	clrf	(?_CCP1_set_duty_cycle)
	clrf	(?_CCP1_set_duty_cycle+1)
	fcall	_CCP1_set_duty_cycle
	line	293
	
l13580:	
;Key.c: 293: CCP2_set_duty_cycle(0);
	clrf	(?_CCP2_set_duty_cycle)
	clrf	(?_CCP2_set_duty_cycle+1)
	fcall	_CCP2_set_duty_cycle
	line	294
	
l13582:	
;Key.c: 294: for(k=0;k<120;k++){ soft_delay_ms(1); WDT_clear();};
	clrf	(Key_Handle@k)
	clrf	(Key_Handle@k+1)
	
l13588:	
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	
l13590:	
	fcall	_WDT_clear
	
l13592:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Key_Handle@k),f
	skipnz
	incf	(Key_Handle@k+1),f
	
l13594:	
	movlw	high(078h)
	subwf	(Key_Handle@k+1),w
	movlw	low(078h)
	skipnz
	subwf	(Key_Handle@k),w
	skipc
	goto	u3601
	goto	u3600
u3601:
	goto	l13588
u3600:
	line	295
	
l13596:	
;Key.c: 295: PWM_LED1(LEDR1_Vol); PWM_LED2(LEDR2_Vol);
	movf	(_LEDR1_Vol),w
	fcall	_PWM_LED1
	movf	(_LEDR2_Vol),w
	fcall	_PWM_LED2
	goto	l6238
	line	304
	
l13598:	
;Key.c: 304: if(LED_ON_Sat)
	movf	(_LED_ON_Sat),w
	skipz
	goto	u3610
	goto	l6238
u3610:
	line	306
	
l13600:	
;Key.c: 305: {
;Key.c: 306: SysDingShiEn=2;
	movlw	(02h)
	movwf	(_SysDingShiEn)
	line	307
;Key.c: 307: SysRunTimeCnt=36000;
	movlw	low(08CA0h)
	movwf	(_SysRunTimeCnt)
	movlw	high(08CA0h)
	movwf	((_SysRunTimeCnt))+1
	line	309
	
l13602:	
;Key.c: 309: SysDingShiOne=0;
	clrf	(_SysDingShiOne)
	line	310
	
l13604:	
;Key.c: 310: SysDingShiCnt=100;
	movlw	(064h)
	movwf	(_SysDingShiCnt)
	line	311
;Key.c: 311: SysDingShiSTEP=0;
	clrf	(_SysDingShiSTEP)
	goto	l6238
	line	319
	
l13606:	
;Key.c: 319: if(LED_ON_Sat)
	movf	(_LED_ON_Sat),w
	skipz
	goto	u3620
	goto	l13664
u3620:
	line	321
	
l13608:	
;Key.c: 320: {
;Key.c: 321: if(LEDR1_Vol!=0)
	movf	(_LEDR1_Vol),w
	skipz
	goto	u3630
	goto	l13636
u3630:
	line	323
	
l13610:	
;Key.c: 322: {
;Key.c: 323: KEYKeepAddMark_1=0;
	clrf	(_KEYKeepAddMark_1)
	line	324
	
l13612:	
;Key.c: 324: SetRunEn(0,1,LEDR1_Vol);
	clrf	(?_SetRunEn)
	incf	(?_SetRunEn),f
	movf	(_LEDR1_Vol),w
	movwf	0+(?_SetRunEn)+01h
	clrf	1+(?_SetRunEn)+01h
	movlw	(0)
	fcall	_SetRunEn
	line	328
	
l13614:	
;Key.c: 328: i=GetChgLV(LEDR1_Vol);
	movf	(_LEDR1_Vol),w
	fcall	_GetChgLV
	movwf	(Key_Handle@i)
	line	330
	
l13616:	
;Key.c: 330: n=1; if(i==0||i==1) n=4; if(i==2) n=3; if(i==3) n=2;
	clrf	(Key_Handle@n)
	incf	(Key_Handle@n),f
	
l13618:	
	movf	(Key_Handle@i),w
	skipz
	goto	u3640
	goto	l13622
u3640:
	
l13620:	
	decf	(Key_Handle@i),w
	skipz
	goto	u3651
	goto	u3650
u3651:
	goto	l6262
u3650:
	
l13622:	
	movlw	(04h)
	movwf	(Key_Handle@n)
	
l6262:	
	movf	(Key_Handle@i),w
	xorlw	02h
	skipz
	goto	u3661
	goto	u3660
u3661:
	goto	l6265
u3660:
	
l13624:	
	movlw	(03h)
	movwf	(Key_Handle@n)
	
l6265:	
	movf	(Key_Handle@i),w
	xorlw	03h
	skipz
	goto	u3671
	goto	u3670
u3671:
	goto	l6266
u3670:
	
l13626:	
	movlw	(02h)
	movwf	(Key_Handle@n)
	
l6266:	
	line	332
;Key.c: 332: i = (i==0)?(ChgLV_ZX[i]):(ChgLV_ZX[i-1]);
	movf	(Key_Handle@i),w
	skipz
	goto	u3680
	goto	l13630
u3680:
	
l13628:	
	movf	(Key_Handle@i),w
	addlw	low((_ChgLV_ZX-__stringbase)+-1)
	movwf	fsr0
	fcall	stringdir
	movwf	(_Key_Handle$3416)
	clrf	(_Key_Handle$3416+1)
	goto	l13632
	
l13630:	
	movf	(Key_Handle@i),w
	addlw	low((_ChgLV_ZX-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(_Key_Handle$3416)
	clrf	(_Key_Handle$3416+1)
	
l13632:	
	movf	(_Key_Handle$3416),w
	movwf	(Key_Handle@i)
	line	333
	
l13634:	
;Key.c: 333: BufSetRun(0,i,1,n);
	movf	(Key_Handle@i),w
	movwf	(?_BufSetRun)
	clrf	0+(?_BufSetRun)+01h
	incf	0+(?_BufSetRun)+01h,f
	movf	(Key_Handle@n),w
	movwf	0+(?_BufSetRun)+02h
	movlw	(0)
	fcall	_BufSetRun
	line	336
	
l13636:	
;Key.c: 334: }
;Key.c: 336: if(LEDR2_Vol!=0)
	movf	(_LEDR2_Vol),w
	skipz
	goto	u3690
	goto	l13664
u3690:
	line	338
	
l13638:	
;Key.c: 337: {
;Key.c: 338: KEYKeepAddMark_2=0;
	clrf	(_KEYKeepAddMark_2)
	line	339
	
l13640:	
;Key.c: 339: SetRunEn(1,1,LEDR2_Vol);
	clrf	(?_SetRunEn)
	incf	(?_SetRunEn),f
	movf	(_LEDR2_Vol),w
	movwf	0+(?_SetRunEn)+01h
	clrf	1+(?_SetRunEn)+01h
	movlw	(01h)
	fcall	_SetRunEn
	line	341
	
l13642:	
;Key.c: 341: i=GetChgLV(LEDR2_Vol);
	movf	(_LEDR2_Vol),w
	fcall	_GetChgLV
	movwf	(Key_Handle@i)
	line	342
	
l13644:	
;Key.c: 342: n=1; if(i==0||i==1) n=4; if(i==2) n=3; if(i==3) n=2;
	clrf	(Key_Handle@n)
	incf	(Key_Handle@n),f
	
l13646:	
	movf	(Key_Handle@i),w
	skipz
	goto	u3700
	goto	l13650
u3700:
	
l13648:	
	decf	(Key_Handle@i),w
	skipz
	goto	u3711
	goto	u3710
u3711:
	goto	l6272
u3710:
	
l13650:	
	movlw	(04h)
	movwf	(Key_Handle@n)
	
l6272:	
	movf	(Key_Handle@i),w
	xorlw	02h
	skipz
	goto	u3721
	goto	u3720
u3721:
	goto	l6275
u3720:
	
l13652:	
	movlw	(03h)
	movwf	(Key_Handle@n)
	
l6275:	
	movf	(Key_Handle@i),w
	xorlw	03h
	skipz
	goto	u3731
	goto	u3730
u3731:
	goto	l6276
u3730:
	
l13654:	
	movlw	(02h)
	movwf	(Key_Handle@n)
	
l6276:	
	line	344
;Key.c: 344: i = (i==0)?(ChgLV_ZX[i]):(ChgLV_ZX[i-1]);
	movf	(Key_Handle@i),w
	skipz
	goto	u3740
	goto	l13658
u3740:
	
l13656:	
	movf	(Key_Handle@i),w
	addlw	low((_ChgLV_ZX-__stringbase)+-1)
	movwf	fsr0
	fcall	stringdir
	movwf	(_Key_Handle$3417)
	clrf	(_Key_Handle$3417+1)
	goto	l13660
	
l13658:	
	movf	(Key_Handle@i),w
	addlw	low((_ChgLV_ZX-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(_Key_Handle$3417)
	clrf	(_Key_Handle$3417+1)
	
l13660:	
	movf	(_Key_Handle$3417),w
	movwf	(Key_Handle@i)
	line	345
	
l13662:	
;Key.c: 345: BufSetRun(1,i,1,n);
	movf	(Key_Handle@i),w
	movwf	(?_BufSetRun)
	clrf	0+(?_BufSetRun)+01h
	incf	0+(?_BufSetRun)+01h,f
	movf	(Key_Handle@n),w
	movwf	0+(?_BufSetRun)+02h
	movlw	(01h)
	fcall	_BufSetRun
	line	349
	
l13664:	
;Key.c: 346: }
;Key.c: 348: }
;Key.c: 349: SysDingShiEn=0;
	clrf	(_SysDingShiEn)
	line	350
;Key.c: 350: break;
	goto	l6238
	line	353
	
l13666:	
;Key.c: 353: if(LED_ON_Sat)
	movf	(_LED_ON_Sat),w
	skipz
	goto	u3750
	goto	l13664
u3750:
	line	356
	
l13668:	
;Key.c: 354: {
;Key.c: 356: if(LEDR1_Vol!=0)
	movf	(_LEDR1_Vol),w
	skipz
	goto	u3760
	goto	l13696
u3760:
	line	358
	
l13670:	
;Key.c: 357: {
;Key.c: 358: KEYKeepSunMark_1=0;
	clrf	(_KEYKeepSunMark_1)
	line	359
	
l13672:	
;Key.c: 359: SetRunEn(0,1,LEDR1_Vol);
	clrf	(?_SetRunEn)
	incf	(?_SetRunEn),f
	movf	(_LEDR1_Vol),w
	movwf	0+(?_SetRunEn)+01h
	clrf	1+(?_SetRunEn)+01h
	movlw	(0)
	fcall	_SetRunEn
	line	361
	
l13674:	
;Key.c: 361: i=GetChgLV(LEDR1_Vol);
	movf	(_LEDR1_Vol),w
	fcall	_GetChgLV
	movwf	(Key_Handle@i)
	line	362
	
l13676:	
;Key.c: 362: n=1; if(i==0||i==1) n=4; if(i==2) n=3; if(i==3) n=2;
	clrf	(Key_Handle@n)
	incf	(Key_Handle@n),f
	
l13678:	
	movf	(Key_Handle@i),w
	skipz
	goto	u3770
	goto	l13682
u3770:
	
l13680:	
	decf	(Key_Handle@i),w
	skipz
	goto	u3781
	goto	u3780
u3781:
	goto	l6284
u3780:
	
l13682:	
	movlw	(04h)
	movwf	(Key_Handle@n)
	
l6284:	
	movf	(Key_Handle@i),w
	xorlw	02h
	skipz
	goto	u3791
	goto	u3790
u3791:
	goto	l6287
u3790:
	
l13684:	
	movlw	(03h)
	movwf	(Key_Handle@n)
	
l6287:	
	movf	(Key_Handle@i),w
	xorlw	03h
	skipz
	goto	u3801
	goto	u3800
u3801:
	goto	l6288
u3800:
	
l13686:	
	movlw	(02h)
	movwf	(Key_Handle@n)
	
l6288:	
	line	363
;Key.c: 363: i = (i==5)?(ChgLV_ZX[i]):(ChgLV_ZX[i+1]);
	movf	(Key_Handle@i),w
	xorlw	05h
	skipnz
	goto	u3811
	goto	u3810
u3811:
	goto	l13690
u3810:
	
l13688:	
	movf	(Key_Handle@i),w
	addlw	low((_ChgLV_ZX-__stringbase)+01h)
	movwf	fsr0
	fcall	stringdir
	movwf	(_Key_Handle$3418)
	clrf	(_Key_Handle$3418+1)
	goto	l13692
	
l13690:	
	movf	(Key_Handle@i),w
	addlw	low((_ChgLV_ZX-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(_Key_Handle$3418)
	clrf	(_Key_Handle$3418+1)
	
l13692:	
	movf	(_Key_Handle$3418),w
	movwf	(Key_Handle@i)
	line	365
	
l13694:	
;Key.c: 365: BufSetRun(0,i,1,n);
	movf	(Key_Handle@i),w
	movwf	(?_BufSetRun)
	clrf	0+(?_BufSetRun)+01h
	incf	0+(?_BufSetRun)+01h,f
	movf	(Key_Handle@n),w
	movwf	0+(?_BufSetRun)+02h
	movlw	(0)
	fcall	_BufSetRun
	line	368
	
l13696:	
;Key.c: 366: }
;Key.c: 368: if(LEDR2_Vol!=0)
	movf	(_LEDR2_Vol),w
	skipz
	goto	u3820
	goto	l13664
u3820:
	line	370
	
l13698:	
;Key.c: 369: {
;Key.c: 370: KEYKeepSunMark_2=0;
	clrf	(_KEYKeepSunMark_2)
	line	371
	
l13700:	
;Key.c: 371: SetRunEn(1,1,LEDR2_Vol);
	clrf	(?_SetRunEn)
	incf	(?_SetRunEn),f
	movf	(_LEDR2_Vol),w
	movwf	0+(?_SetRunEn)+01h
	clrf	1+(?_SetRunEn)+01h
	movlw	(01h)
	fcall	_SetRunEn
	line	372
	
l13702:	
;Key.c: 372: i=GetChgLV(LEDR2_Vol);
	movf	(_LEDR2_Vol),w
	fcall	_GetChgLV
	movwf	(Key_Handle@i)
	line	373
	
l13704:	
;Key.c: 373: n=1; if(i==0||i==1) n=4; if(i==2) n=3; if(i==3) n=2;
	clrf	(Key_Handle@n)
	incf	(Key_Handle@n),f
	
l13706:	
	movf	(Key_Handle@i),w
	skipz
	goto	u3830
	goto	l13710
u3830:
	
l13708:	
	decf	(Key_Handle@i),w
	skipz
	goto	u3841
	goto	u3840
u3841:
	goto	l6294
u3840:
	
l13710:	
	movlw	(04h)
	movwf	(Key_Handle@n)
	
l6294:	
	movf	(Key_Handle@i),w
	xorlw	02h
	skipz
	goto	u3851
	goto	u3850
u3851:
	goto	l6297
u3850:
	
l13712:	
	movlw	(03h)
	movwf	(Key_Handle@n)
	
l6297:	
	movf	(Key_Handle@i),w
	xorlw	03h
	skipz
	goto	u3861
	goto	u3860
u3861:
	goto	l6298
u3860:
	
l13714:	
	movlw	(02h)
	movwf	(Key_Handle@n)
	
l6298:	
	line	374
;Key.c: 374: i = (i==5)?(ChgLV_ZX[i]):(ChgLV_ZX[i+1]);
	movf	(Key_Handle@i),w
	xorlw	05h
	skipnz
	goto	u3871
	goto	u3870
u3871:
	goto	l13718
u3870:
	
l13716:	
	movf	(Key_Handle@i),w
	addlw	low((_ChgLV_ZX-__stringbase)+01h)
	movwf	fsr0
	fcall	stringdir
	movwf	(_Key_Handle$3419)
	clrf	(_Key_Handle$3419+1)
	goto	l13720
	
l13718:	
	movf	(Key_Handle@i),w
	addlw	low((_ChgLV_ZX-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(_Key_Handle$3419)
	clrf	(_Key_Handle$3419+1)
	
l13720:	
	movf	(_Key_Handle$3419),w
	movwf	(Key_Handle@i)
	line	375
	
l13722:	
;Key.c: 375: BufSetRun(1,i,1,n);
	movf	(Key_Handle@i),w
	movwf	(?_BufSetRun)
	clrf	0+(?_BufSetRun)+01h
	incf	0+(?_BufSetRun)+01h,f
	movf	(Key_Handle@n),w
	movwf	0+(?_BufSetRun)+02h
	movlw	(01h)
	fcall	_BufSetRun
	goto	l13664
	line	384
	
l13726:	
;Key.c: 384: if(LED_ON_Sat)
	movf	(_LED_ON_Sat),w
	skipz
	goto	u3880
	goto	l6238
u3880:
	line	387
	
l13728:	
;Key.c: 385: {
;Key.c: 387: if((LEDR1_Vol)&&(LEDR2_Vol))
	movf	(_LEDR1_Vol),w
	skipz
	goto	u3890
	goto	l13744
u3890:
	
l13730:	
	movf	(_LEDR2_Vol),w
	skipz
	goto	u3900
	goto	l13744
u3900:
	line	389
	
l13732:	
;Key.c: 388: {
;Key.c: 389: k=(unsigned short int)LEDR1_Vol+(unsigned short int)LEDR2_Vol;
	movf	(_LEDR1_Vol),w
	movwf	(Key_Handle@k)
	clrf	(Key_Handle@k+1)
	movf	(_LEDR2_Vol),w
	addwf	(Key_Handle@k),f
	skipnc
	incf	(Key_Handle@k+1),f
	line	390
;Key.c: 390: if(k>(unsigned short int)250) k=250;
	movlw	high(0FBh)
	subwf	(Key_Handle@k+1),w
	movlw	low(0FBh)
	skipnz
	subwf	(Key_Handle@k),w
	skipc
	goto	u3911
	goto	u3910
u3911:
	goto	l13736
u3910:
	
l13734:	
	movlw	0FAh
	movwf	(Key_Handle@k)
	clrf	(Key_Handle@k+1)
	line	392
	
l13736:	
;Key.c: 392: SetRunEn(0,1,LEDR1_Vol); BufSetRun(0,k,1,3);
	clrf	(?_SetRunEn)
	incf	(?_SetRunEn),f
	movf	(_LEDR1_Vol),w
	movwf	0+(?_SetRunEn)+01h
	clrf	1+(?_SetRunEn)+01h
	movlw	(0)
	fcall	_SetRunEn
	
l13738:	
	movf	(Key_Handle@k),w
	movwf	(?_BufSetRun)
	clrf	0+(?_BufSetRun)+01h
	incf	0+(?_BufSetRun)+01h,f
	movlw	(03h)
	movwf	0+(?_BufSetRun)+02h
	movlw	(0)
	fcall	_BufSetRun
	line	393
	
l13740:	
;Key.c: 393: SetRunEn(1,1,LEDR2_Vol); BufSetRun(1,0,1,3);
	clrf	(?_SetRunEn)
	incf	(?_SetRunEn),f
	movf	(_LEDR2_Vol),w
	movwf	0+(?_SetRunEn)+01h
	clrf	1+(?_SetRunEn)+01h
	movlw	(01h)
	fcall	_SetRunEn
	
l13742:	
	clrf	(?_BufSetRun)
	clrf	0+(?_BufSetRun)+01h
	incf	0+(?_BufSetRun)+01h,f
	movlw	(03h)
	movwf	0+(?_BufSetRun)+02h
	movlw	(01h)
	fcall	_BufSetRun
	line	396
	
l13744:	
;Key.c: 394: }
;Key.c: 396: if((LEDR1_Vol==0)&&(LEDR2_Vol))
	movf	(_LEDR1_Vol),f
	skipz
	goto	u3921
	goto	u3920
u3921:
	goto	l13484
u3920:
	
l13746:	
	movf	(_LEDR2_Vol),w
	skipz
	goto	u3930
	goto	l13484
u3930:
	line	398
	
l13748:	
;Key.c: 397: {
;Key.c: 398: i=LEDR2_Vol/2;
	clrc
	rrf	(_LEDR2_Vol),w
	movwf	(Key_Handle@i)
	line	400
	
l13750:	
;Key.c: 400: SetRunEn(0,1,LEDR1_Vol); BufSetRun(0,i,1,3);
	clrf	(?_SetRunEn)
	incf	(?_SetRunEn),f
	movf	(_LEDR1_Vol),w
	movwf	0+(?_SetRunEn)+01h
	clrf	1+(?_SetRunEn)+01h
	movlw	(0)
	fcall	_SetRunEn
	
l13752:	
	movf	(Key_Handle@i),w
	movwf	(?_BufSetRun)
	clrf	0+(?_BufSetRun)+01h
	incf	0+(?_BufSetRun)+01h,f
	movlw	(03h)
	movwf	0+(?_BufSetRun)+02h
	movlw	(0)
	fcall	_BufSetRun
	line	401
	
l13754:	
;Key.c: 401: SetRunEn(1,1,LEDR2_Vol); BufSetRun(1,i,1,3);
	clrf	(?_SetRunEn)
	incf	(?_SetRunEn),f
	movf	(_LEDR2_Vol),w
	movwf	0+(?_SetRunEn)+01h
	clrf	1+(?_SetRunEn)+01h
	movlw	(01h)
	fcall	_SetRunEn
	
l13756:	
	movf	(Key_Handle@i),w
	movwf	(?_BufSetRun)
	clrf	0+(?_BufSetRun)+01h
	incf	0+(?_BufSetRun)+01h,f
	movlw	(03h)
	movwf	0+(?_BufSetRun)+02h
	movlw	(01h)
	fcall	_BufSetRun
	goto	l6238
	line	408
	
l13758:	
;Key.c: 408: if(LED_ON_Sat)
	movf	(_LED_ON_Sat),w
	skipz
	goto	u3940
	goto	l6238
u3940:
	line	410
	
l13760:	
;Key.c: 409: {
;Key.c: 410: if((LEDR1_Vol)&&(LEDR2_Vol))
	movf	(_LEDR1_Vol),w
	skipz
	goto	u3950
	goto	l6310
u3950:
	
l13762:	
	movf	(_LEDR2_Vol),w
	skipz
	goto	u3960
	goto	l6310
u3960:
	line	412
	
l13764:	
;Key.c: 411: {
;Key.c: 412: k=(unsigned short int)LEDR1_Vol+(unsigned short int)LEDR2_Vol;
	movf	(_LEDR1_Vol),w
	movwf	(Key_Handle@k)
	clrf	(Key_Handle@k+1)
	movf	(_LEDR2_Vol),w
	addwf	(Key_Handle@k),f
	skipnc
	incf	(Key_Handle@k+1),f
	line	413
;Key.c: 413: if(k>(unsigned short int)250) k=250;
	movlw	high(0FBh)
	subwf	(Key_Handle@k+1),w
	movlw	low(0FBh)
	skipnz
	subwf	(Key_Handle@k),w
	skipc
	goto	u3971
	goto	u3970
u3971:
	goto	l13768
u3970:
	
l13766:	
	movlw	0FAh
	movwf	(Key_Handle@k)
	clrf	(Key_Handle@k+1)
	line	415
	
l13768:	
;Key.c: 415: SetRunEn(0,1,LEDR1_Vol); BufSetRun(0,0,1,3);
	clrf	(?_SetRunEn)
	incf	(?_SetRunEn),f
	movf	(_LEDR1_Vol),w
	movwf	0+(?_SetRunEn)+01h
	clrf	1+(?_SetRunEn)+01h
	movlw	(0)
	fcall	_SetRunEn
	
l13770:	
	clrf	(?_BufSetRun)
	clrf	0+(?_BufSetRun)+01h
	incf	0+(?_BufSetRun)+01h,f
	movlw	(03h)
	movwf	0+(?_BufSetRun)+02h
	movlw	(0)
	fcall	_BufSetRun
	line	416
	
l13772:	
;Key.c: 416: SetRunEn(1,1,LEDR2_Vol); BufSetRun(1,k,1,3);
	clrf	(?_SetRunEn)
	incf	(?_SetRunEn),f
	movf	(_LEDR2_Vol),w
	movwf	0+(?_SetRunEn)+01h
	clrf	1+(?_SetRunEn)+01h
	movlw	(01h)
	fcall	_SetRunEn
	
l13774:	
	movf	(Key_Handle@k),w
	movwf	(?_BufSetRun)
	clrf	0+(?_BufSetRun)+01h
	incf	0+(?_BufSetRun)+01h,f
	movlw	(03h)
	movwf	0+(?_BufSetRun)+02h
	movlw	(01h)
	fcall	_BufSetRun
	line	417
	
l6310:	
	line	419
;Key.c: 417: }
;Key.c: 419: if((LEDR1_Vol)&&(LEDR2_Vol==0))
	movf	(_LEDR1_Vol),w
	skipz
	goto	u3980
	goto	l13484
u3980:
	
l13776:	
	movf	(_LEDR2_Vol),f
	skipz
	goto	u3991
	goto	u3990
u3991:
	goto	l13484
u3990:
	line	422
	
l13778:	
;Key.c: 420: {
;Key.c: 422: i=LEDR1_Vol/2;
	clrc
	rrf	(_LEDR1_Vol),w
	movwf	(Key_Handle@i)
	line	423
	
l13780:	
;Key.c: 423: SetRunEn(0,1,LEDR1_Vol); BufSetRun(0,i,1,3);
	clrf	(?_SetRunEn)
	incf	(?_SetRunEn),f
	movf	(_LEDR1_Vol),w
	movwf	0+(?_SetRunEn)+01h
	clrf	1+(?_SetRunEn)+01h
	movlw	(0)
	fcall	_SetRunEn
	
l13782:	
	movf	(Key_Handle@i),w
	movwf	(?_BufSetRun)
	clrf	0+(?_BufSetRun)+01h
	incf	0+(?_BufSetRun)+01h,f
	movlw	(03h)
	movwf	0+(?_BufSetRun)+02h
	movlw	(0)
	fcall	_BufSetRun
	line	424
	
l13784:	
;Key.c: 424: SetRunEn(1,1,LEDR2_Vol); BufSetRun(1,i,1,3);
	clrf	(?_SetRunEn)
	incf	(?_SetRunEn),f
	movf	(_LEDR2_Vol),w
	movwf	0+(?_SetRunEn)+01h
	clrf	1+(?_SetRunEn)+01h
	movlw	(01h)
	fcall	_SetRunEn
	
l13786:	
	movf	(Key_Handle@i),w
	movwf	(?_BufSetRun)
	clrf	0+(?_BufSetRun)+01h
	incf	0+(?_BufSetRun)+01h,f
	movlw	(03h)
	movwf	0+(?_BufSetRun)+02h
	movlw	(01h)
	fcall	_BufSetRun
	goto	l6238
	line	437
	
l13788:	
;Key.c: 435: case 0x4000:
;Key.c: 437: if(LED_ON_Sat==0)
	movf	(_LED_ON_Sat),f
	skipz
	goto	u4001
	goto	u4000
u4001:
	goto	l13794
u4000:
	line	439
	
l13790:	
;Key.c: 438: {
;Key.c: 439: LED_ON_Sat=1;
	clrf	(_LED_ON_Sat)
	incf	(_LED_ON_Sat),f
	line	441
	
l13792:	
;Key.c: 441: PWM_LED1(LEDR1_Vol); PWM_LED2(LEDR2_Vol);
	movf	(_LEDR1_Vol),w
	fcall	_PWM_LED1
	movf	(_LEDR2_Vol),w
	fcall	_PWM_LED2
	line	442
;Key.c: 442: }
	goto	l13664
	line	445
	
l13794:	
;Key.c: 443: else
;Key.c: 444: {
;Key.c: 445: LEDCon_Chg();
	fcall	_LEDCon_Chg
	line	446
	
l13796:	
;Key.c: 446: if(++LED_Chg_Cnt>=6) LED_Chg_Cnt=0;
	movlw	(06h)
	incf	(_LED_Chg_Cnt),f
	subwf	((_LED_Chg_Cnt)),w
	skipc
	goto	u4011
	goto	u4010
u4011:
	goto	l13664
u4010:
	
l13798:	
	clrf	(_LED_Chg_Cnt)
	goto	l13664
	line	455
	
l13800:	
;Key.c: 453: case 0x0040:
;Key.c: 455: LED_ALLOFF();
	fcall	_LED_ALLOFF
	goto	l13664
	line	283
	
l13806:	
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 5 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 0 to 128
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
; jumptable            260     6 (fixed)
; rangetable           133     6 (fixed)
; spacedrange          264     9 (fixed)
; locatedrange         129     3 (fixed)
;	Chosen strategy is simple_byte

	movf (_KeyVol+1),w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l14358
	xorlw	2^0	; case 2
	skipnz
	goto	l14360
	xorlw	32^2	; case 32
	skipnz
	goto	l14362
	xorlw	64^32	; case 64
	skipnz
	goto	l14364
	xorlw	128^64	; case 128
	skipnz
	goto	l14366
	goto	l6238
	opt asmopt_on
	
l14358:	
; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 1 to 128
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           19    10 (average)
; direct_byte          266    10 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	movf (_KeyVol),w
	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l13788
	xorlw	2^1	; case 2
	skipnz
	goto	l13606
	xorlw	16^2	; case 16
	skipnz
	goto	l13800
	xorlw	32^16	; case 32
	skipnz
	goto	l13666
	xorlw	64^32	; case 64
	skipnz
	goto	l13800
	xorlw	128^64	; case 128
	skipnz
	goto	l13598
	goto	l6238
	opt asmopt_on
	
l14360:	
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte            9     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             5     6 (fixed)
; spacedrange            8     9 (fixed)
; locatedrange           1     3 (fixed)
;	Chosen strategy is simple_byte

	movf (_KeyVol),w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l13758
	goto	l6238
	opt asmopt_on
	
l14362:	
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte            9     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             5     6 (fixed)
; spacedrange            8     9 (fixed)
; locatedrange           1     3 (fixed)
;	Chosen strategy is simple_byte

	movf (_KeyVol),w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l13726
	goto	l6238
	opt asmopt_on
	
l14364:	
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte            9     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             5     6 (fixed)
; spacedrange            8     9 (fixed)
; locatedrange           1     3 (fixed)
;	Chosen strategy is simple_byte

	movf (_KeyVol),w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l13788
	goto	l6238
	opt asmopt_on
	
l14366:	
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte            9     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             5     6 (fixed)
; spacedrange            8     9 (fixed)
; locatedrange           1     3 (fixed)
;	Chosen strategy is simple_byte

	movf (_KeyVol),w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l13572
	goto	l6238
	opt asmopt_on

	line	465
	
l13808:	
;Key.c: 465: if(LED_ON_Sat)
	movf	(_LED_ON_Sat),w
	skipz
	goto	u4020
	goto	l6238
u4020:
	line	467
	
l13810:	
;Key.c: 466: {
;Key.c: 467: if(LEDR1_Vol!=0)
	movf	(_LEDR1_Vol),w
	skipz
	goto	u4030
	goto	l13828
u4030:
	line	469
	
l13812:	
;Key.c: 468: {
;Key.c: 469: if(KEYKeepAddMark_1==0) i=!GerBuff_RunSAT(0); else i=1;
	movf	(_KEYKeepAddMark_1),f
	skipz
	goto	u4041
	goto	u4040
u4041:
	goto	l6325
u4040:
	
l13814:	
	movlw	(0)
	fcall	_GerBuff_RunSAT
	xorlw	0
	movlw	0
	skipnz
	movlw	1
	movwf	(Key_Handle@i)
	goto	l13816
	
l6325:	
	clrf	(Key_Handle@i)
	incf	(Key_Handle@i),f
	line	470
	
l13816:	
;Key.c: 470: if(i)
	movf	(Key_Handle@i),w
	skipz
	goto	u4050
	goto	l13828
u4050:
	line	472
	
l13818:	
;Key.c: 471: {
;Key.c: 472: KEYKeepAddMark_1=1;
	clrf	(_KEYKeepAddMark_1)
	incf	(_KEYKeepAddMark_1),f
	line	474
	
l13820:	
;Key.c: 474: if((unsigned short int)LEDR1_Vol+(unsigned short int)20>=(unsigned short int)250) i=250; else i=LEDR1_Vol+20;
	movf	(_LEDR1_Vol),w
	addlw	low(014h)
	movwf	(??_Key_Handle+0)+0
	movlw	high(014h)
	skipnc
	movlw	(high(014h)+1)&0ffh
	movwf	((??_Key_Handle+0)+0)+1
	movlw	high(0FAh)
	subwf	1+(??_Key_Handle+0)+0,w
	movlw	low(0FAh)
	skipnz
	subwf	0+(??_Key_Handle+0)+0,w
	skipc
	goto	u4061
	goto	u4060
u4061:
	goto	l13824
u4060:
	
l13822:	
	movlw	(0FAh)
	movwf	(Key_Handle@i)
	goto	l13826
	
l13824:	
	movf	(_LEDR1_Vol),w
	addlw	014h
	movwf	(Key_Handle@i)
	line	475
	
l13826:	
;Key.c: 475: BufSetRun(0,i,1,1);
	movf	(Key_Handle@i),w
	movwf	(?_BufSetRun)
	clrf	0+(?_BufSetRun)+01h
	incf	0+(?_BufSetRun)+01h,f
	clrf	0+(?_BufSetRun)+02h
	incf	0+(?_BufSetRun)+02h,f
	movlw	(0)
	fcall	_BufSetRun
	line	479
	
l13828:	
;Key.c: 476: }
;Key.c: 477: }
;Key.c: 479: if(LEDR2_Vol!=0)
	movf	(_LEDR2_Vol),w
	skipz
	goto	u4070
	goto	l6238
u4070:
	line	481
	
l13830:	
;Key.c: 480: {
;Key.c: 481: if(KEYKeepAddMark_2==0) i=!GerBuff_RunSAT(1); else i=1;
	movf	(_KEYKeepAddMark_2),f
	skipz
	goto	u4081
	goto	u4080
u4081:
	goto	l6331
u4080:
	
l13832:	
	movlw	(01h)
	fcall	_GerBuff_RunSAT
	xorlw	0
	movlw	0
	skipnz
	movlw	1
	movwf	(Key_Handle@i)
	goto	l13834
	
l6331:	
	clrf	(Key_Handle@i)
	incf	(Key_Handle@i),f
	line	482
	
l13834:	
;Key.c: 482: if(i)
	movf	(Key_Handle@i),w
	skipz
	goto	u4090
	goto	l13484
u4090:
	line	484
	
l13836:	
;Key.c: 483: {
;Key.c: 484: KEYKeepAddMark_2=1;
	clrf	(_KEYKeepAddMark_2)
	incf	(_KEYKeepAddMark_2),f
	line	486
	
l13838:	
;Key.c: 486: if((unsigned short int)LEDR2_Vol+(unsigned short int)20>=(unsigned short int)250) i=250; else i=LEDR2_Vol+20;
	movf	(_LEDR2_Vol),w
	addlw	low(014h)
	movwf	(??_Key_Handle+0)+0
	movlw	high(014h)
	skipnc
	movlw	(high(014h)+1)&0ffh
	movwf	((??_Key_Handle+0)+0)+1
	movlw	high(0FAh)
	subwf	1+(??_Key_Handle+0)+0,w
	movlw	low(0FAh)
	skipnz
	subwf	0+(??_Key_Handle+0)+0,w
	skipc
	goto	u4101
	goto	u4100
u4101:
	goto	l13842
u4100:
	
l13840:	
	movlw	(0FAh)
	movwf	(Key_Handle@i)
	goto	l13844
	
l13842:	
	movf	(_LEDR2_Vol),w
	addlw	014h
	movwf	(Key_Handle@i)
	line	487
	
l13844:	
;Key.c: 487: BufSetRun(1,i,1,1);
	movf	(Key_Handle@i),w
	movwf	(?_BufSetRun)
	clrf	0+(?_BufSetRun)+01h
	incf	0+(?_BufSetRun)+01h,f
	clrf	0+(?_BufSetRun)+02h
	incf	0+(?_BufSetRun)+02h,f
	movlw	(01h)
	fcall	_BufSetRun
	goto	l6238
	line	496
	
l13846:	
;Key.c: 496: if(LED_ON_Sat)
	movf	(_LED_ON_Sat),w
	skipz
	goto	u4110
	goto	l6238
u4110:
	line	499
	
l13848:	
;Key.c: 497: {
;Key.c: 499: if(LEDR1_Vol!=0)
	movf	(_LEDR1_Vol),w
	skipz
	goto	u4120
	goto	l13866
u4120:
	line	501
	
l13850:	
;Key.c: 500: {
;Key.c: 501: if(KEYKeepSunMark_1==0) i=!GerBuff_RunSAT(0); else i=1;
	movf	(_KEYKeepSunMark_1),f
	skipz
	goto	u4131
	goto	u4130
u4131:
	goto	l6340
u4130:
	
l13852:	
	movlw	(0)
	fcall	_GerBuff_RunSAT
	xorlw	0
	movlw	0
	skipnz
	movlw	1
	movwf	(Key_Handle@i)
	goto	l13854
	
l6340:	
	clrf	(Key_Handle@i)
	incf	(Key_Handle@i),f
	line	502
	
l13854:	
;Key.c: 502: if(i)
	movf	(Key_Handle@i),w
	skipz
	goto	u4140
	goto	l13866
u4140:
	line	504
	
l13856:	
;Key.c: 503: {
;Key.c: 504: KEYKeepSunMark_1=1;
	clrf	(_KEYKeepSunMark_1)
	incf	(_KEYKeepSunMark_1),f
	line	506
	
l13858:	
;Key.c: 506: if((unsigned short int)LEDR1_Vol>=((unsigned short int)2+(unsigned short int)20)) i=LEDR1_Vol-20; else i=2;
	movlw	(016h)
	subwf	(_LEDR1_Vol),w
	skipc
	goto	u4151
	goto	u4150
u4151:
	goto	l13862
u4150:
	
l13860:	
	movf	(_LEDR1_Vol),w
	addlw	0ECh
	movwf	(Key_Handle@i)
	goto	l13864
	
l13862:	
	movlw	(02h)
	movwf	(Key_Handle@i)
	line	507
	
l13864:	
;Key.c: 507: BufSetRun(0,i,1,1);
	movf	(Key_Handle@i),w
	movwf	(?_BufSetRun)
	clrf	0+(?_BufSetRun)+01h
	incf	0+(?_BufSetRun)+01h,f
	clrf	0+(?_BufSetRun)+02h
	incf	0+(?_BufSetRun)+02h,f
	movlw	(0)
	fcall	_BufSetRun
	line	511
	
l13866:	
;Key.c: 508: }
;Key.c: 509: }
;Key.c: 511: if(LEDR2_Vol!=0)
	movf	(_LEDR2_Vol),w
	skipz
	goto	u4160
	goto	l6238
u4160:
	line	513
	
l13868:	
;Key.c: 512: {
;Key.c: 513: if(KEYKeepSunMark_2==0) i=!GerBuff_RunSAT(1); else i=1;
	movf	(_KEYKeepSunMark_2),f
	skipz
	goto	u4171
	goto	u4170
u4171:
	goto	l6346
u4170:
	
l13870:	
	movlw	(01h)
	fcall	_GerBuff_RunSAT
	xorlw	0
	movlw	0
	skipnz
	movlw	1
	movwf	(Key_Handle@i)
	goto	l13872
	
l6346:	
	clrf	(Key_Handle@i)
	incf	(Key_Handle@i),f
	line	514
	
l13872:	
;Key.c: 514: if(i)
	movf	(Key_Handle@i),w
	skipz
	goto	u4180
	goto	l6238
u4180:
	line	516
	
l13874:	
;Key.c: 515: {
;Key.c: 516: KEYKeepSunMark_2=1;
	clrf	(_KEYKeepSunMark_2)
	incf	(_KEYKeepSunMark_2),f
	line	518
	
l13876:	
;Key.c: 518: if((unsigned short int)LEDR2_Vol>=(unsigned short int)2+(unsigned short int)20) i=LEDR2_Vol-20; else i=2;
	movlw	(016h)
	subwf	(_LEDR2_Vol),w
	skipc
	goto	u4191
	goto	u4190
u4191:
	goto	l13880
u4190:
	
l13878:	
	movf	(_LEDR2_Vol),w
	addlw	0ECh
	movwf	(Key_Handle@i)
	goto	l13882
	
l13880:	
	movlw	(02h)
	movwf	(Key_Handle@i)
	line	519
	
l13882:	
;Key.c: 519: BufSetRun(1,i,1,1);
	movf	(Key_Handle@i),w
	movwf	(?_BufSetRun)
	clrf	0+(?_BufSetRun)+01h
	incf	0+(?_BufSetRun)+01h,f
	clrf	0+(?_BufSetRun)+02h
	incf	0+(?_BufSetRun)+02h,f
	movlw	(01h)
	fcall	_BufSetRun
	goto	l6238
	line	462
	
l13886:	
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte            9     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             5     6 (fixed)
; spacedrange            8     9 (fixed)
; locatedrange           1     3 (fixed)
;	Chosen strategy is simple_byte

	movf (_KeyVol+1),w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l14368
	goto	l6238
	opt asmopt_on
	
l14368:	
; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 2 to 32
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
; direct_byte           72    10 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	movf (_KeyVol),w
	opt asmopt_off
	xorlw	2^0	; case 2
	skipnz
	goto	l13808
	xorlw	32^2	; case 32
	skipnz
	goto	l13846
	goto	l6238
	opt asmopt_on

	line	528
	
l6238:	
	movlw	high __pjmp_tab__Key_Handle
	movwf pclath
	movf	(?_Key_Handle+1)^00h,w
	movwf	pc
	opt stack 0
GLOBAL	__end_of_Key_Handle
	__end_of_Key_Handle:
;; =============== function _Key_Handle ends ============

	signat	_Key_Handle,4216
	global	_Remote_Pairing
psect	text1831,local,class=CODE,delta=2
global __ptext1831
__ptext1831:

;; *************** function _Remote_Pairing *****************
;; Defined at:
;;		line 244 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
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
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_Data_Check
;;		_Write_Remote_Addr
;;		_Pair_LED
;; This function is called by:
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1831
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
	line	244
	global	__size_of_Remote_Pairing
	__size_of_Remote_Pairing	equ	__end_of_Remote_Pairing-_Remote_Pairing
	
_Remote_Pairing:	
	opt	stack 0
; Regs used in _Remote_Pairing: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	245
	
l13466:	
;recive.c: 245: if(rf_buf[0] == 0x05)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_rf_buf)^080h,w
	xorlw	05h
	skipz
	goto	u3471
	goto	u3470
u3471:
	goto	l13478
u3470:
	line	247
	
l13468:	
;recive.c: 246: {
;recive.c: 247: Pairing_Num = Data_Check();
	fcall	_Data_Check
	movwf	(_Pairing_Num)
	line	248
	
l13470:	
;recive.c: 248: if(Pairing_Num == 0xFF)
	movf	(_Pairing_Num),w
	xorlw	0FFh
	skipz
	goto	u3481
	goto	u3480
u3481:
	goto	l13476
u3480:
	line	250
	
l13472:	
;recive.c: 249: {
;recive.c: 250: Write_Remote_Addr();
	fcall	_Write_Remote_Addr
	line	251
	
l13474:	
;recive.c: 251: Pair_LED();
	fcall	_Pair_LED
	line	253
	
l13476:	
;recive.c: 252: }
;recive.c: 253: Pairing_Num = 0xFF;
	movlw	(0FFh)
	movwf	(_Pairing_Num)
	line	255
	
l13478:	
;recive.c: 254: }
;recive.c: 255: SysRunTime_3S = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_SysRunTime_3S)
	incf	(_SysRunTime_3S),f
	line	256
	
l8380:	
	return
	opt stack 0
GLOBAL	__end_of_Remote_Pairing
	__end_of_Remote_Pairing:
;; =============== function _Remote_Pairing ends ============

	signat	_Remote_Pairing,88
	global	_EP_SetRFAdd
psect	text1832,local,class=CODE,delta=2
global __ptext1832
__ptext1832:

;; *************** function _EP_SetRFAdd *****************
;; Defined at:
;;		line 146 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
;; Parameters:    Size  Location     Type
;;  InP             1    wreg     PTR unsigned char 
;;		 -> rf_buf(18), 
;; Auto vars:     Size  Location     Type
;;  InP             1   15[BANK0 ] PTR unsigned char 
;;		 -> rf_buf(18), 
;;  i               1   16[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       1       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_WDT_clear
;;		_EEPROM_SendByte
;; This function is called by:
;;		_Key_Handle
;; This function uses a non-reentrant model
;;
psect	text1832
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
	line	146
	global	__size_of_EP_SetRFAdd
	__size_of_EP_SetRFAdd	equ	__end_of_EP_SetRFAdd-_EP_SetRFAdd
	
_EP_SetRFAdd:	
	opt	stack 0
; Regs used in _EP_SetRFAdd: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;EP_SetRFAdd@InP stored from wreg
	movwf	(EP_SetRFAdd@InP)
	line	147
	
l13450:	
;24lc02.c: 147: unsigned char i=0;
	clrf	(EP_SetRFAdd@i)
	line	148
;24lc02.c: 148: for(i=0;i<5;i++)
	clrf	(EP_SetRFAdd@i)
	line	150
	
l13456:	
;24lc02.c: 149: {
;24lc02.c: 150: WDT_clear();
	fcall	_WDT_clear
	line	151
	
l13458:	
;24lc02.c: 151: EEPROM_SendByte(8+i,InP[i]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(EP_SetRFAdd@i),w
	addwf	(EP_SetRFAdd@InP),w
	movwf	(??_EP_SetRFAdd+0)+0
	movf	0+(??_EP_SetRFAdd+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(?_EEPROM_SendByte)
	movf	(EP_SetRFAdd@i),w
	addlw	08h
	fcall	_EEPROM_SendByte
	line	148
	
l13460:	
	incf	(EP_SetRFAdd@i),f
	
l13462:	
	movlw	(05h)
	subwf	(EP_SetRFAdd@i),w
	skipc
	goto	u3461
	goto	u3460
u3461:
	goto	l13456
u3460:
	line	153
	
l13464:	
;24lc02.c: 152: }
;24lc02.c: 153: WDT_clear();
	fcall	_WDT_clear
	line	154
	
l4726:	
	return
	opt stack 0
GLOBAL	__end_of_EP_SetRFAdd
	__end_of_EP_SetRFAdd:
;; =============== function _EP_SetRFAdd ends ============

	signat	_EP_SetRFAdd,4216
	global	_EP_SetADDCfg
psect	text1833,local,class=CODE,delta=2
global __ptext1833
__ptext1833:

;; *************** function _EP_SetADDCfg *****************
;; Defined at:
;;		line 104 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
;; Parameters:    Size  Location     Type
;;  ID              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ID              1   14[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_WDT_clear
;;		_EEPROM_SendByte
;; This function is called by:
;;		_Key_Handle
;; This function uses a non-reentrant model
;;
psect	text1833
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
	line	104
	global	__size_of_EP_SetADDCfg
	__size_of_EP_SetADDCfg	equ	__end_of_EP_SetADDCfg-_EP_SetADDCfg
	
_EP_SetADDCfg:	
	opt	stack 0
; Regs used in _EP_SetADDCfg: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;EP_SetADDCfg@ID stored from wreg
	movwf	(EP_SetADDCfg@ID)
	line	105
	
l13438:	
;24lc02.c: 105: if(ID) EP_BP=0xE5; else EP_BP=0;
	movf	(EP_SetADDCfg@ID),w
	skipz
	goto	u3450
	goto	l13442
u3450:
	
l13440:	
	movlw	(0E5h)
	movwf	(_EP_BP)
	goto	l13444
	
l13442:	
	clrf	(_EP_BP)
	line	107
	
l13444:	
;24lc02.c: 107: WDT_clear();
	fcall	_WDT_clear
	line	108
	
l13446:	
;24lc02.c: 108: EEPROM_SendByte(4,EP_BP);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_EP_BP),w
	movwf	(?_EEPROM_SendByte)
	movlw	(04h)
	fcall	_EEPROM_SendByte
	line	110
	
l4710:	
	return
	opt stack 0
GLOBAL	__end_of_EP_SetADDCfg
	__end_of_EP_SetADDCfg:
;; =============== function _EP_SetADDCfg ends ============

	signat	_EP_SetADDCfg,4217
	global	_EP_SetONOFFStep
psect	text1834,local,class=CODE,delta=2
global __ptext1834
__ptext1834:

;; *************** function _EP_SetONOFFStep *****************
;; Defined at:
;;		line 123 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
;; Parameters:    Size  Location     Type
;;  D               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  D               1   14[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_EEPROM_SendByte
;;		_WDT_clear
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1834
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
	line	123
	global	__size_of_EP_SetONOFFStep
	__size_of_EP_SetONOFFStep	equ	__end_of_EP_SetONOFFStep-_EP_SetONOFFStep
	
_EP_SetONOFFStep:	
	opt	stack 0
; Regs used in _EP_SetONOFFStep: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;EP_SetONOFFStep@D stored from wreg
	movwf	(EP_SetONOFFStep@D)
	line	124
	
l13434:	
;24lc02.c: 124: EEPROM_SendByte(6,D);
	movf	(EP_SetONOFFStep@D),w
	movwf	(?_EEPROM_SendByte)
	movlw	(06h)
	fcall	_EEPROM_SendByte
	line	125
	
l13436:	
;24lc02.c: 125: WDT_clear();
	fcall	_WDT_clear
	line	126
	
l4716:	
	return
	opt stack 0
GLOBAL	__end_of_EP_SetONOFFStep
	__end_of_EP_SetONOFFStep:
;; =============== function _EP_SetONOFFStep ends ============

	signat	_EP_SetONOFFStep,4216
	global	_Delete_One_RemoteAddr
psect	text1835,local,class=CODE,delta=2
global __ptext1835
__ptext1835:

;; *************** function _Delete_One_RemoteAddr *****************
;; Defined at:
;;		line 168 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   12[BANK0 ] unsigned char 
;;  j               1   11[BANK0 ] unsigned char 
;;  p               1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/20
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       3       0
;;      Temps:          0       1       0
;;      Totals:         0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_Data_Check
;;		_AT24C02_Write_Msg
;; This function is called by:
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1835
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
	line	168
	global	__size_of_Delete_One_RemoteAddr
	__size_of_Delete_One_RemoteAddr	equ	__end_of_Delete_One_RemoteAddr-_Delete_One_RemoteAddr
	
_Delete_One_RemoteAddr:	
	opt	stack 1
; Regs used in _Delete_One_RemoteAddr: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	172
	
l13416:	
;recive.c: 169: unsigned char i;
;recive.c: 170: unsigned char j;
;recive.c: 171: unsigned char p;
;recive.c: 172: i = Data_Check();
	fcall	_Data_Check
	movwf	(Delete_One_RemoteAddr@i)
	line	173
	
l13418:	
;recive.c: 173: i = 4 * i;
	clrc
	rlf	(Delete_One_RemoteAddr@i),f
	clrc
	rlf	(Delete_One_RemoteAddr@i),f
	line	174
	
l13420:	
;recive.c: 174: p = 16 - i;
	movf	(Delete_One_RemoteAddr@i),w
	sublw	010h
	movwf	(Delete_One_RemoteAddr@p)
	line	175
	
l13422:	
;recive.c: 175: for(j = 0; j < p; j++)
	clrf	(Delete_One_RemoteAddr@j)
	goto	l13430
	line	177
	
l13424:	
;recive.c: 176: {
;recive.c: 177: addr_buf[i] = addr_buf[i + 4];
	movf	(Delete_One_RemoteAddr@i),w
	addlw	_addr_buf+04h&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_Delete_One_RemoteAddr+0)+0
	movf	(Delete_One_RemoteAddr@i),w
	addlw	_addr_buf&0ffh
	movwf	fsr0
	movf	(??_Delete_One_RemoteAddr+0)+0,w
	movwf	indf
	line	178
	
l13426:	
;recive.c: 178: i++;
	incf	(Delete_One_RemoteAddr@i),f
	line	175
	
l13428:	
	incf	(Delete_One_RemoteAddr@j),f
	
l13430:	
	movf	(Delete_One_RemoteAddr@p),w
	subwf	(Delete_One_RemoteAddr@j),w
	skipc
	goto	u3441
	goto	u3440
u3441:
	goto	l13424
u3440:
	line	180
	
l13432:	
;recive.c: 179: }
;recive.c: 180: AT24C02_Write_Msg(30, addr_buf, 16);
	movlw	(_addr_buf)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	movlw	(010h)
	movwf	0+(?_AT24C02_Write_Msg)+01h
	movlw	(01Eh)
	fcall	_AT24C02_Write_Msg
	line	182
	
l8359:	
	return
	opt stack 0
GLOBAL	__end_of_Delete_One_RemoteAddr
	__end_of_Delete_One_RemoteAddr:
;; =============== function _Delete_One_RemoteAddr ends ============

	signat	_Delete_One_RemoteAddr,88
	global	_Write_Remote_Addr
psect	text1836,local,class=CODE,delta=2
global __ptext1836
__ptext1836:

;; *************** function _Write_Remote_Addr *****************
;; Defined at:
;;		line 121 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   11[BANK0 ] unsigned char 
;;  j               1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       1       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_AT24C02_Write_Msg
;; This function is called by:
;;		_Remote_Pairing
;; This function uses a non-reentrant model
;;
psect	text1836
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
	line	121
	global	__size_of_Write_Remote_Addr
	__size_of_Write_Remote_Addr	equ	__end_of_Write_Remote_Addr-_Write_Remote_Addr
	
_Write_Remote_Addr:	
	opt	stack 0
; Regs used in _Write_Remote_Addr: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	123
	
l13390:	
;recive.c: 122: unsigned char i;
;recive.c: 123: unsigned char j = 3;
	movlw	(03h)
	movwf	(Write_Remote_Addr@j)
	line	124
;recive.c: 124: for(i = 15; i > 3; i--)
	movlw	(0Fh)
	movwf	(Write_Remote_Addr@i)
	line	126
	
l13394:	
;recive.c: 125: {
;recive.c: 126: addr_buf[i] = addr_buf[i - 4];
	movf	(Write_Remote_Addr@i),w
	addlw	_addr_buf+-4&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_Write_Remote_Addr+0)+0
	movf	(Write_Remote_Addr@i),w
	addlw	_addr_buf&0ffh
	movwf	fsr0
	movf	(??_Write_Remote_Addr+0)+0,w
	movwf	indf
	line	124
	
l13396:	
	decf	(Write_Remote_Addr@i),f
	
l13398:	
	movlw	(04h)
	subwf	(Write_Remote_Addr@i),w
	skipnc
	goto	u3421
	goto	u3420
u3421:
	goto	l13394
u3420:
	line	128
	
l13400:	
;recive.c: 127: }
;recive.c: 128: for(i = 0; i < 4; i++)
	clrf	(Write_Remote_Addr@i)
	line	130
	
l13406:	
;recive.c: 129: {
;recive.c: 130: addr_buf[i] = rf_buf[j];
	movf	(Write_Remote_Addr@j),w
	addlw	_rf_buf&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_Write_Remote_Addr+0)+0
	movf	(Write_Remote_Addr@i),w
	addlw	_addr_buf&0ffh
	movwf	fsr0
	movf	(??_Write_Remote_Addr+0)+0,w
	movwf	indf
	line	131
	
l13408:	
;recive.c: 131: j++;
	incf	(Write_Remote_Addr@j),f
	line	128
	
l13410:	
	incf	(Write_Remote_Addr@i),f
	
l13412:	
	movlw	(04h)
	subwf	(Write_Remote_Addr@i),w
	skipc
	goto	u3431
	goto	u3430
u3431:
	goto	l13406
u3430:
	line	133
	
l13414:	
;recive.c: 132: }
;recive.c: 133: AT24C02_Write_Msg(30, addr_buf, 16);
	movlw	(_addr_buf)&0ffh
	movwf	(?_AT24C02_Write_Msg)
	movlw	(010h)
	movwf	0+(?_AT24C02_Write_Msg)+01h
	movlw	(01Eh)
	fcall	_AT24C02_Write_Msg
	line	135
	
l8343:	
	return
	opt stack 0
GLOBAL	__end_of_Write_Remote_Addr
	__end_of_Write_Remote_Addr:
;; =============== function _Write_Remote_Addr ends ============

	signat	_Write_Remote_Addr,88
	global	_rx_data
psect	text1837,local,class=CODE,delta=2
global __ptext1837
__ptext1837:

;; *************** function _rx_data *****************
;; Defined at:
;;		line 80 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
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
psect	text1837
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
	line	80
	global	__size_of_rx_data
	__size_of_rx_data	equ	__end_of_rx_data-_rx_data
	
_rx_data:	
	opt	stack 1
; Regs used in _rx_data: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	81
	
l13324:	
;recive.c: 81: unsigned char rx_flag=0;
	clrf	(rx_data@rx_flag)
	line	83
;recive.c: 83: unsigned char i=0;
	clrf	(rx_data@i)
	line	84
;recive.c: 84: unsigned int crc16=0;
	clrf	(rx_data@crc16)
	clrf	(rx_data@crc16+1)
	line	86
	
l13326:	
;recive.c: 86: if(RF_RxData(rf_buf,18))
	movlw	(012h)
	movwf	(?_RF_RxData)
	movlw	(_rf_buf)&0ffh
	fcall	_RF_RxData
	xorlw	0
	skipnz
	goto	u3291
	goto	u3290
u3291:
	goto	l13386
u3290:
	line	88
	
l13328:	
;recive.c: 87: {
;recive.c: 88: for(i=0;i<18;i++)
	clrf	(rx_data@i)
	line	90
	
l13334:	
;recive.c: 89: {
;recive.c: 90: rf_buf[i]=rf_buf[i]^crc_2_4G_lib[3+i]^ble_crc_38[21+i];
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
	bcf	status, 7	;select IRP bank1
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
	
l13336:	
	incf	(rx_data@i),f
	
l13338:	
	movlw	(012h)
	subwf	(rx_data@i),w
	skipc
	goto	u3301
	goto	u3300
u3301:
	goto	l13334
u3300:
	line	92
	
l13340:	
;recive.c: 91: }
;recive.c: 92: crc16 = rf_buf[16]+rf_buf[17]*256;
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_rf_buf)^080h+011h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_rx_data+0)+0
	movlw	((0x0/2))
	movwf	(??_rx_data+0)+0+1
	movf	(??_rx_data+0)+0,w
	movwf	(??_rx_data+0)+1
	clrf	(??_rx_data+0)+0
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_rf_buf)^080h+010h,w
	bcf	status, 5	;RP0=0, select bank0
	addwf	0+(??_rx_data+0)+0,w
	movwf	(rx_data@crc16)
	movf	1+(??_rx_data+0)+0,w
	skipnc
	incf	1+(??_rx_data+0)+0,w
	movwf	((rx_data@crc16))+1
	line	93
	
l13342:	
;recive.c: 93: for(i=0;i<16;i++)
	clrf	(rx_data@i)
	line	95
	
l13348:	
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
	
l13350:	
	incf	(rx_data@i),f
	
l13352:	
	movlw	(010h)
	subwf	(rx_data@i),w
	skipc
	goto	u3311
	goto	u3310
u3311:
	goto	l13348
u3310:
	line	97
	
l13354:	
;recive.c: 96: }
;recive.c: 97: rand = rf_buf[15];
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_rf_buf)^080h+0Fh,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(rx_data@rand)
	line	98
;recive.c: 98: for(i=7;i<15;i++)
	movlw	(07h)
	movwf	(rx_data@i)
	line	100
	
l13358:	
;recive.c: 99: {
;recive.c: 100: rf_buf[i]^=rand;
	movf	(rx_data@i),w
	addlw	_rf_buf&0ffh
	movwf	fsr0
	movf	(rx_data@rand),w
	xorwf	indf,f
	line	98
	
l13360:	
	incf	(rx_data@i),f
	
l13362:	
	movlw	(0Fh)
	subwf	(rx_data@i),w
	skipc
	goto	u3321
	goto	u3320
u3321:
	goto	l13358
u3320:
	line	102
	
l13364:	
;recive.c: 101: }
;recive.c: 102: if(crc16 ==UpdateCRC(rf_buf,16) )
	movlw	010h
	movwf	(?_UpdateCRC)
	clrf	(?_UpdateCRC+1)
	movlw	(_rf_buf)&0ffh
	fcall	_UpdateCRC
	movf	(rx_data@crc16+1),w
	xorwf	(1+(?_UpdateCRC)),w
	skipz
	goto	u3335
	movf	(rx_data@crc16),w
	xorwf	(0+(?_UpdateCRC)),w
u3335:

	skipz
	goto	u3331
	goto	u3330
u3331:
	goto	l13386
u3330:
	line	104
	
l13366:	
;recive.c: 103: {
;recive.c: 104: if((rf_buf[3]==0)&&(rf_buf[4]==0)&&(rf_buf[5]==0)&&(rf_buf[6]==0))
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_rf_buf)^080h+03h,f
	skipz
	goto	u3341
	goto	u3340
u3341:
	goto	l13376
u3340:
	
l13368:	
	movf	0+(_rf_buf)^080h+04h,f
	skipz
	goto	u3351
	goto	u3350
u3351:
	goto	l13376
u3350:
	
l13370:	
	movf	0+(_rf_buf)^080h+05h,f
	skipz
	goto	u3361
	goto	u3360
u3361:
	goto	l13376
u3360:
	
l13372:	
	movf	0+(_rf_buf)^080h+06h,f
	skipz
	goto	u3371
	goto	u3370
u3371:
	goto	l13376
u3370:
	line	106
	
l13374:	
;recive.c: 105: {
;recive.c: 106: rx_flag=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(rx_data@rx_flag)
	line	107
;recive.c: 107: }
	goto	l13386
	line	108
	
l13376:	
;recive.c: 108: else if((rf_buf[3]==0xff)&&(rf_buf[4]==0xff)&&(rf_buf[5]==0xff)&&(rf_buf[6]==0xff))
	movf	0+(_rf_buf)^080h+03h,w
	xorlw	0FFh
	skipz
	goto	u3381
	goto	u3380
u3381:
	goto	l8334
u3380:
	
l13378:	
	movf	0+(_rf_buf)^080h+04h,w
	xorlw	0FFh
	skipz
	goto	u3391
	goto	u3390
u3391:
	goto	l8334
u3390:
	
l13380:	
	movf	0+(_rf_buf)^080h+05h,w
	xorlw	0FFh
	skipz
	goto	u3401
	goto	u3400
u3401:
	goto	l8334
u3400:
	
l13382:	
	movf	0+(_rf_buf)^080h+06h,w
	xorlw	0FFh
	skipz
	goto	u3411
	goto	u3410
u3411:
	goto	l8334
u3410:
	goto	l13374
	line	112
	
l8334:	
	line	113
;recive.c: 112: else
;recive.c: 113: rx_flag=1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(rx_data@rx_flag)
	incf	(rx_data@rx_flag),f
	line	117
	
l13386:	
;recive.c: 114: }
;recive.c: 116: }
;recive.c: 117: return rx_flag;
	movf	(rx_data@rx_flag),w
	line	118
	
l8336:	
	return
	opt stack 0
GLOBAL	__end_of_rx_data
	__end_of_rx_data:
;; =============== function _rx_data ends ============

	signat	_rx_data,89
	global	_EEPROM_SendByte
psect	text1838,local,class=CODE,delta=2
global __ptext1838
__ptext1838:

;; *************** function _EEPROM_SendByte *****************
;; Defined at:
;;		line 39 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
;; Parameters:    Size  Location     Type
;;  REGadds         1    wreg     unsigned char 
;;  Wdat            1   10[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  REGadds         1   11[BANK0 ] unsigned char 
;;  i               1   13[BANK0 ] unsigned char 
;;  cnt             1   12[BANK0 ] unsigned char 
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
;;      Locals:         0       3       0
;;      Temps:          0       0       0
;;      Totals:         0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_IIC_SendByte
;;		_EEPROM_CheckBusy
;; This function is called by:
;;		_EP_SetADDCfg
;;		_EP_SetONOFFStep
;;		_EP_SetRFAdd
;; This function uses a non-reentrant model
;;
psect	text1838
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
	line	39
	global	__size_of_EEPROM_SendByte
	__size_of_EEPROM_SendByte	equ	__end_of_EEPROM_SendByte-_EEPROM_SendByte
	
_EEPROM_SendByte:	
	opt	stack 0
; Regs used in _EEPROM_SendByte: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;EEPROM_SendByte@REGadds stored from wreg
	movwf	(EEPROM_SendByte@REGadds)
	line	40
	
l13310:	
;24lc02.c: 40: unsigned char cnt=0;
	clrf	(EEPROM_SendByte@cnt)
	line	42
	
l13312:	
;24lc02.c: 42: unsigned char i=IIC_SendByte(0x50|(REGadds>>8),REGadds,Wdat);
	movf	(EEPROM_SendByte@REGadds),w
	movwf	(?_IIC_SendByte)
	movf	(EEPROM_SendByte@Wdat),w
	movwf	0+(?_IIC_SendByte)+01h
	movlw	(050h)
	fcall	_IIC_SendByte
	bcf	status, 5	;RP0=0, select bank0
	movwf	(EEPROM_SendByte@i)
	line	43
	
l13314:	
;24lc02.c: 43: if(i) return(i);
	movf	(EEPROM_SendByte@i),w
	skipz
	goto	u3260
	goto	l13322
u3260:
	goto	l4690
	line	47
	
l13318:	
;24lc02.c: 46: {
;24lc02.c: 47: if(cnt++>250){i=0xee; break;}
	movlw	(0FCh)
	incf	(EEPROM_SendByte@cnt),f
	subwf	((EEPROM_SendByte@cnt)),w
	skipc
	goto	u3271
	goto	u3270
u3271:
	goto	l13322
u3270:
	
l13320:	
	goto	l4690
	line	45
	
l13322:	
	fcall	_EEPROM_CheckBusy
	iorlw	0
	skipz
	goto	u3281
	goto	u3280
u3281:
	goto	l13318
u3280:
	line	51
	
l4690:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_SendByte
	__end_of_EEPROM_SendByte:
;; =============== function _EEPROM_SendByte ends ============

	signat	_EEPROM_SendByte,8313
	global	_EP_GetRFAdd
psect	text1839,local,class=CODE,delta=2
global __ptext1839
__ptext1839:

;; *************** function _EP_GetRFAdd *****************
;; Defined at:
;;		line 132 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
;; Parameters:    Size  Location     Type
;;  OutP            1    wreg     PTR unsigned char 
;;		 -> RF_ADDRESS(5), 
;; Auto vars:     Size  Location     Type
;;  OutP            1   13[BANK0 ] PTR unsigned char 
;;		 -> RF_ADDRESS(5), 
;;  i               1   14[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_WDT_clear
;;		_EEPROM_ReceByte
;; This function is called by:
;;		_main
;;		_Key_Handle
;; This function uses a non-reentrant model
;;
psect	text1839
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
	line	132
	global	__size_of_EP_GetRFAdd
	__size_of_EP_GetRFAdd	equ	__end_of_EP_GetRFAdd-_EP_GetRFAdd
	
_EP_GetRFAdd:	
	opt	stack 1
; Regs used in _EP_GetRFAdd: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;EP_GetRFAdd@OutP stored from wreg
	movwf	(EP_GetRFAdd@OutP)
	line	133
	
l13294:	
;24lc02.c: 133: unsigned char i=0;
	clrf	(EP_GetRFAdd@i)
	line	134
;24lc02.c: 134: for(i=0;i<5;i++)
	clrf	(EP_GetRFAdd@i)
	line	136
	
l13300:	
;24lc02.c: 135: {
;24lc02.c: 136: WDT_clear();
	fcall	_WDT_clear
	line	137
	
l13302:	
;24lc02.c: 137: EEPROM_ReceByte(8+i,&OutP[i]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(EP_GetRFAdd@i),w
	addwf	(EP_GetRFAdd@OutP),w
	movwf	(?_EEPROM_ReceByte)
	movf	(EP_GetRFAdd@i),w
	addlw	08h
	fcall	_EEPROM_ReceByte
	line	134
	
l13304:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(EP_GetRFAdd@i),f
	
l13306:	
	movlw	(05h)
	subwf	(EP_GetRFAdd@i),w
	skipc
	goto	u3251
	goto	u3250
u3251:
	goto	l13300
u3250:
	line	140
	
l13308:	
;24lc02.c: 139: }
;24lc02.c: 140: WDT_clear();
	fcall	_WDT_clear
	line	141
	
l4721:	
	return
	opt stack 0
GLOBAL	__end_of_EP_GetRFAdd
	__end_of_EP_GetRFAdd:
;; =============== function _EP_GetRFAdd ends ============

	signat	_EP_GetRFAdd,4216
	global	_EP_IsADDCfg
psect	text1840,local,class=CODE,delta=2
global __ptext1840
__ptext1840:

;; *************** function _EP_IsADDCfg *****************
;; Defined at:
;;		line 93 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_EEPROM_ReceByte
;;		_WDT_clear
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1840
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
	line	93
	global	__size_of_EP_IsADDCfg
	__size_of_EP_IsADDCfg	equ	__end_of_EP_IsADDCfg-_EP_IsADDCfg
	
_EP_IsADDCfg:	
	opt	stack 1
; Regs used in _EP_IsADDCfg: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	94
	
l13278:	
;24lc02.c: 94: EEPROM_ReceByte(4,&EP_BP);
	movlw	(_EP_BP)&0ffh
	movwf	(?_EEPROM_ReceByte)
	movlw	(04h)
	fcall	_EEPROM_ReceByte
	line	95
	
l13280:	
;24lc02.c: 95: WDT_clear();
	fcall	_WDT_clear
	line	97
	
l13282:	
;24lc02.c: 97: if(EP_BP==0xE5) return 1; else return 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_EP_BP),w
	xorlw	0E5h
	skipz
	goto	u3241
	goto	u3240
u3241:
	goto	l13290
u3240:
	
l13284:	
	movlw	(01h)
	goto	l4704
	
l13290:	
	movlw	(0)
	line	98
	
l4704:	
	return
	opt stack 0
GLOBAL	__end_of_EP_IsADDCfg
	__end_of_EP_IsADDCfg:
;; =============== function _EP_IsADDCfg ends ============

	signat	_EP_IsADDCfg,89
	global	_AT24C02_Read_Msg
psect	text1841,local,class=CODE,delta=2
global __ptext1841
__ptext1841:

;; *************** function _AT24C02_Read_Msg *****************
;; Defined at:
;;		line 204 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;;  data            1    6[BANK0 ] PTR unsigned char 
;;		 -> addr_buf(16), 
;;  len             1    7[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1    8[BANK0 ] unsigned char 
;;  i               1    9[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       2       0
;;      Temps:          1       0       0
;;      Totals:         1       4       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_WDT_clear
;;		_AT24C02_Read_Byte1
;;		_soft_delay_ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1841
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
	line	204
	global	__size_of_AT24C02_Read_Msg
	__size_of_AT24C02_Read_Msg	equ	__end_of_AT24C02_Read_Msg-_AT24C02_Read_Msg
	
_AT24C02_Read_Msg:	
	opt	stack 1
; Regs used in _AT24C02_Read_Msg: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;AT24C02_Read_Msg@addr stored from wreg
	movwf	(AT24C02_Read_Msg@addr)
	line	205
	
l13260:	
;24lc02.c: 205: unsigned char i=0;
	clrf	(AT24C02_Read_Msg@i)
	line	206
;24lc02.c: 206: for(i=0;i<len;i++)
	clrf	(AT24C02_Read_Msg@i)
	goto	l13274
	line	208
	
l13262:	
;24lc02.c: 207: {
;24lc02.c: 208: WDT_clear();
	fcall	_WDT_clear
	line	209
	
l13264:	
;24lc02.c: 209: data[i] = AT24C02_Read_Byte1(addr);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(AT24C02_Read_Msg@i),w
	addwf	(AT24C02_Read_Msg@data),w
	movwf	(??_AT24C02_Read_Msg+0)+0
	movf	0+(??_AT24C02_Read_Msg+0)+0,w
	movwf	fsr0
	movf	(AT24C02_Read_Msg@addr),w
	fcall	_AT24C02_Read_Byte1
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	210
	
l13266:	
;24lc02.c: 210: addr++;
	incf	(AT24C02_Read_Msg@addr),f
	line	211
	
l13268:	
;24lc02.c: 211: WDT_clear();
	fcall	_WDT_clear
	line	212
	
l13270:	
;24lc02.c: 212: soft_delay_ms(1);
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	206
	
l13272:	
	incf	(AT24C02_Read_Msg@i),f
	
l13274:	
	movf	(AT24C02_Read_Msg@len),w
	subwf	(AT24C02_Read_Msg@i),w
	skipc
	goto	u3231
	goto	u3230
u3231:
	goto	l13262
u3230:
	line	214
	
l13276:	
;24lc02.c: 213: }
;24lc02.c: 214: WDT_clear();
	fcall	_WDT_clear
	line	215
	
l4744:	
	return
	opt stack 0
GLOBAL	__end_of_AT24C02_Read_Msg
	__end_of_AT24C02_Read_Msg:
;; =============== function _AT24C02_Read_Msg ends ============

	signat	_AT24C02_Read_Msg,12408
	global	_EP_GetONOFFStep
psect	text1842,local,class=CODE,delta=2
global __ptext1842
__ptext1842:

;; *************** function _EP_GetONOFFStep *****************
;; Defined at:
;;		line 116 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_EEPROM_ReceByte
;;		_WDT_clear
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1842
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
	line	116
	global	__size_of_EP_GetONOFFStep
	__size_of_EP_GetONOFFStep	equ	__end_of_EP_GetONOFFStep-_EP_GetONOFFStep
	
_EP_GetONOFFStep:	
	opt	stack 1
; Regs used in _EP_GetONOFFStep: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	117
	
l13252:	
;24lc02.c: 117: EEPROM_ReceByte(6,&EP_BP);
	movlw	(_EP_BP)&0ffh
	movwf	(?_EEPROM_ReceByte)
	movlw	(06h)
	fcall	_EEPROM_ReceByte
	line	118
	
l13254:	
;24lc02.c: 118: WDT_clear();
	fcall	_WDT_clear
	line	119
	
l13256:	
;24lc02.c: 119: return EP_BP;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_EP_BP),w
	line	120
	
l4713:	
	return
	opt stack 0
GLOBAL	__end_of_EP_GetONOFFStep
	__end_of_EP_GetONOFFStep:
;; =============== function _EP_GetONOFFStep ends ============

	signat	_EP_GetONOFFStep,89
	global	_AT24C02_Write_Msg
psect	text1843,local,class=CODE,delta=2
global __ptext1843
__ptext1843:

;; *************** function _AT24C02_Write_Msg *****************
;; Defined at:
;;		line 190 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;;  data            1    4[BANK0 ] PTR unsigned char 
;;		 -> addr_buf(16), 
;;  len             1    5[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1    7[BANK0 ] unsigned char 
;;  i               1    8[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       2       0
;;      Temps:          0       1       0
;;      Totals:         0       5       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_WDT_clear
;;		_AT24C02_Write_Byte1
;;		_soft_delay_ms
;; This function is called by:
;;		_Write_Remote_Addr
;;		_Delete_One_RemoteAddr
;; This function uses a non-reentrant model
;;
psect	text1843
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
	line	190
	global	__size_of_AT24C02_Write_Msg
	__size_of_AT24C02_Write_Msg	equ	__end_of_AT24C02_Write_Msg-_AT24C02_Write_Msg
	
_AT24C02_Write_Msg:	
	opt	stack 1
; Regs used in _AT24C02_Write_Msg: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;AT24C02_Write_Msg@addr stored from wreg
	movwf	(AT24C02_Write_Msg@addr)
	line	191
	
l13234:	
;24lc02.c: 191: unsigned char i=0;
	clrf	(AT24C02_Write_Msg@i)
	line	192
;24lc02.c: 192: for(i=0;i<len;i++)
	clrf	(AT24C02_Write_Msg@i)
	goto	l13248
	line	194
	
l13236:	
;24lc02.c: 193: {
;24lc02.c: 194: WDT_clear();
	fcall	_WDT_clear
	line	195
	
l13238:	
;24lc02.c: 195: AT24C02_Write_Byte1(addr,data[i]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(AT24C02_Write_Msg@i),w
	addwf	(AT24C02_Write_Msg@data),w
	movwf	(??_AT24C02_Write_Msg+0)+0
	movf	0+(??_AT24C02_Write_Msg+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(?_AT24C02_Write_Byte1)
	movf	(AT24C02_Write_Msg@addr),w
	fcall	_AT24C02_Write_Byte1
	line	196
	
l13240:	
;24lc02.c: 196: addr++;
	incf	(AT24C02_Write_Msg@addr),f
	line	197
	
l13242:	
;24lc02.c: 197: WDT_clear();
	fcall	_WDT_clear
	line	198
	
l13244:	
;24lc02.c: 198: soft_delay_ms(5);
	movlw	05h
	movwf	(?_soft_delay_ms)
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	line	192
	
l13246:	
	incf	(AT24C02_Write_Msg@i),f
	
l13248:	
	movf	(AT24C02_Write_Msg@len),w
	subwf	(AT24C02_Write_Msg@i),w
	skipc
	goto	u3221
	goto	u3220
u3221:
	goto	l13236
u3220:
	line	200
	
l13250:	
;24lc02.c: 199: }
;24lc02.c: 200: WDT_clear();
	fcall	_WDT_clear
	line	201
	
l4738:	
	return
	opt stack 0
GLOBAL	__end_of_AT24C02_Write_Msg
	__end_of_AT24C02_Write_Msg:
;; =============== function _AT24C02_Write_Msg ends ============

	signat	_AT24C02_Write_Msg,12408
	global	_AT24C02_Read_Byte1
psect	text1844,local,class=CODE,delta=2
global __ptext1844
__ptext1844:

;; *************** function _AT24C02_Read_Byte1 *****************
;; Defined at:
;;		line 169 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
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
;;		_IIC_START1
;;		_I2C_SendByte1
;;		_IIC_Wait_ACK1
;;		_I2C_ReadByte1
;;		_IIC_STOP1
;; This function is called by:
;;		_AT24C02_Read_Msg
;; This function uses a non-reentrant model
;;
psect	text1844
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
	line	169
	global	__size_of_AT24C02_Read_Byte1
	__size_of_AT24C02_Read_Byte1	equ	__end_of_AT24C02_Read_Byte1-_AT24C02_Read_Byte1
	
_AT24C02_Read_Byte1:	
	opt	stack 1
; Regs used in _AT24C02_Read_Byte1: [wreg+status,2+status,0+pclath+cstack]
;AT24C02_Read_Byte1@addr stored from wreg
	movwf	(AT24C02_Read_Byte1@addr)
	line	170
	
l13208:	
	line	171
	
l13210:	
;24lc02.c: 171: IIC_START1();
	fcall	_IIC_START1
	line	173
	
l13212:	
;24lc02.c: 173: I2C_SendByte1(0XA0);
	movlw	(0A0h)
	fcall	_I2C_SendByte1
	line	174
	
l13214:	
;24lc02.c: 174: IIC_Wait_ACK1();
	fcall	_IIC_Wait_ACK1
	line	175
	
l13216:	
;24lc02.c: 175: I2C_SendByte1(addr);
	movf	(AT24C02_Read_Byte1@addr),w
	fcall	_I2C_SendByte1
	line	176
	
l13218:	
;24lc02.c: 176: IIC_Wait_ACK1();
	fcall	_IIC_Wait_ACK1
	line	178
	
l13220:	
;24lc02.c: 178: IIC_START1();
	fcall	_IIC_START1
	line	179
	
l13222:	
;24lc02.c: 179: I2C_SendByte1(0XA1);
	movlw	(0A1h)
	fcall	_I2C_SendByte1
	line	180
	
l13224:	
;24lc02.c: 180: IIC_Wait_ACK1();
	fcall	_IIC_Wait_ACK1
	line	181
	
l13226:	
;24lc02.c: 181: temp = I2C_ReadByte1(1);
	movlw	(01h)
	fcall	_I2C_ReadByte1
	movf	(0+(?_I2C_ReadByte1)),w
	movwf	(AT24C02_Read_Byte1@temp)
	line	182
	
l13228:	
;24lc02.c: 182: IIC_STOP1();
	fcall	_IIC_STOP1
	line	184
	
l13230:	
;24lc02.c: 184: return temp;
	movf	(AT24C02_Read_Byte1@temp),w
	line	185
	
l4732:	
	return
	opt stack 0
GLOBAL	__end_of_AT24C02_Read_Byte1
	__end_of_AT24C02_Read_Byte1:
;; =============== function _AT24C02_Read_Byte1 ends ============

	signat	_AT24C02_Read_Byte1,4217
	global	_EEPROM_ReceByte
psect	text1845,local,class=CODE,delta=2
global __ptext1845
__ptext1845:

;; *************** function _EEPROM_ReceByte *****************
;; Defined at:
;;		line 54 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
;; Parameters:    Size  Location     Type
;;  REGadds         1    wreg     unsigned char 
;;  Rdat            1   11[BANK0 ] PTR unsigned char 
;;		 -> EP_BP(1), RF_ADDRESS(5), 
;; Auto vars:     Size  Location     Type
;;  REGadds         1   12[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 40/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       1       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_IIC_ReceByte
;; This function is called by:
;;		_EP_IsADDCfg
;;		_EP_GetONOFFStep
;;		_EP_GetRFAdd
;; This function uses a non-reentrant model
;;
psect	text1845
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
	line	54
	global	__size_of_EEPROM_ReceByte
	__size_of_EEPROM_ReceByte	equ	__end_of_EEPROM_ReceByte-_EEPROM_ReceByte
	
_EEPROM_ReceByte:	
	opt	stack 1
; Regs used in _EEPROM_ReceByte: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;EEPROM_ReceByte@REGadds stored from wreg
	movwf	(EEPROM_ReceByte@REGadds)
	line	55
	
l13204:	
;24lc02.c: 55: return(IIC_ReceByte(1,0x50|(REGadds>>8),REGadds,Rdat));
;	Return value of _EEPROM_ReceByte is never used
	movlw	(050h)
	movwf	(?_IIC_ReceByte)
	movf	(EEPROM_ReceByte@REGadds),w
	movwf	0+(?_IIC_ReceByte)+01h
	movf	(EEPROM_ReceByte@Rdat),w
	movwf	(0+?_IIC_ReceByte+02h)
	movlw	(01h)
	fcall	_IIC_ReceByte
	line	56
	
l4697:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_ReceByte
	__end_of_EEPROM_ReceByte:
;; =============== function _EEPROM_ReceByte ends ============

	signat	_EEPROM_ReceByte,8313
	global	_EEPROM_CheckBusy
psect	text1846,local,class=CODE,delta=2
global __ptext1846
__ptext1846:

;; *************** function _EEPROM_CheckBusy *****************
;; Defined at:
;;		line 33 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_IIC_CheckBusy
;; This function is called by:
;;		_EEPROM_SendByte
;; This function uses a non-reentrant model
;;
psect	text1846
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
	line	33
	global	__size_of_EEPROM_CheckBusy
	__size_of_EEPROM_CheckBusy	equ	__end_of_EEPROM_CheckBusy-_EEPROM_CheckBusy
	
_EEPROM_CheckBusy:	
	opt	stack 0
; Regs used in _EEPROM_CheckBusy: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	34
	
l13200:	
;24lc02.c: 34: return(IIC_CheckBusy(0x50));
	movlw	(050h)
	fcall	_IIC_CheckBusy
	line	35
	
l4686:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_CheckBusy
	__end_of_EEPROM_CheckBusy:
;; =============== function _EEPROM_CheckBusy ends ============

	signat	_EEPROM_CheckBusy,89
	global	_RF_RxData
psect	text1847,local,class=CODE,delta=2
global __ptext1847
__ptext1847:

;; *************** function _RF_RxData *****************
;; Defined at:
;;		line 166 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;  payload_buff    1    wreg     PTR unsigned char 
;;		 -> rf_buf(18), 
;;  length          1    3[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  payload_buff    1    5[BANK0 ] PTR unsigned char 
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
psect	text1847
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	166
	global	__size_of_RF_RxData
	__size_of_RF_RxData	equ	__end_of_RF_RxData-_RF_RxData
	
_RF_RxData:	
	opt	stack 1
; Regs used in _RF_RxData: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_RxData@payload_buff stored from wreg
	movwf	(RF_RxData@payload_buff)
	line	167
	
l13184:	
;rf297L.c: 167: if(!(RF_GetStatus() & 0X40))
	fcall	_RF_GetStatus
	movwf	(??_RF_RxData+0)+0
	btfsc	0+(??_RF_RxData+0)+0,(6)&7
	goto	u3211
	goto	u3210
u3211:
	goto	l13190
u3210:
	line	169
	
l13186:	
;rf297L.c: 168: {
;rf297L.c: 169: return 0;
	movlw	(0)
	goto	l3352
	line	171
	
l13190:	
;rf297L.c: 170: }
;rf297L.c: 171: RF_Read_Buff(0x61, payload_buff, length);
	movf	(RF_RxData@payload_buff),w
	movwf	(?_RF_Read_Buff)
	movf	(RF_RxData@length),w
	movwf	0+(?_RF_Read_Buff)+01h
	movlw	(061h)
	fcall	_RF_Read_Buff
	line	173
	
l13192:	
;rf297L.c: 173: RF_ClearFIFO();
	fcall	_RF_ClearFIFO
	line	174
	
l13194:	
;rf297L.c: 174: RF_ClearStatus();
	fcall	_RF_ClearStatus
	line	175
	
l13196:	
;rf297L.c: 175: return 1;
	movlw	(01h)
	line	176
	
l3352:	
	return
	opt stack 0
GLOBAL	__end_of_RF_RxData
	__end_of_RF_RxData:
;; =============== function _RF_RxData ends ============

	signat	_RF_RxData,8313
	global	_Key_HandRunning
psect	text1848,local,class=CODE,delta=2
global __ptext1848
__ptext1848:

;; *************** function _Key_HandRunning *****************
;; Defined at:
;;		line 94 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\Key.c"
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
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_BufRuning
;;		_PWM_LED1
;;		_PWM_LED2
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1848
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\Key.c"
	line	94
	global	__size_of_Key_HandRunning
	__size_of_Key_HandRunning	equ	__end_of_Key_HandRunning-_Key_HandRunning
	
_Key_HandRunning:	
	opt	stack 2
; Regs used in _Key_HandRunning: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	108
	
l13140:	
;Key.c: 95: static unsigned char Cnt=0;
;Key.c: 96: static unsigned char Cnt2=0;
;Key.c: 108: if(Cnt2++>4)
	movlw	(06h)
	incf	(Key_HandRunning@Cnt2),f
	subwf	((Key_HandRunning@Cnt2)),w
	skipc
	goto	u3161
	goto	u3160
u3161:
	goto	l6225
u3160:
	line	110
	
l13142:	
;Key.c: 109: {
;Key.c: 110: Cnt2=0;
	clrf	(Key_HandRunning@Cnt2)
	line	111
	
l13144:	
;Key.c: 111: BufRuning();
	fcall	_BufRuning
	line	114
	
l13146:	
;Key.c: 114: if(SysDingShiEn)
	movf	(_SysDingShiEn),w
	skipz
	goto	u3170
	goto	l6225
u3170:
	line	116
	
l13148:	
;Key.c: 115: {
;Key.c: 116: if(SysDingShiOne==0)
	movf	(_SysDingShiOne),f
	skipz
	goto	u3181
	goto	u3180
u3181:
	goto	l6225
u3180:
	line	119
	
l13150:	
;Key.c: 117: {
;Key.c: 119: if(SysDingShiEn==2)
	movf	(_SysDingShiEn),w
	xorlw	02h
	skipz
	goto	u3191
	goto	u3190
u3191:
	goto	l6225
u3190:
	line	121
	
l13152:	
;Key.c: 120: {
;Key.c: 121: if(++SysDingShiCnt>16)
	movlw	(011h)
	incf	(_SysDingShiCnt),f
	subwf	((_SysDingShiCnt)),w
	skipc
	goto	u3201
	goto	u3200
u3201:
	goto	l6225
u3200:
	line	123
	
l13154:	
;Key.c: 122: {
;Key.c: 123: SysDingShiCnt=0;
	clrf	(_SysDingShiCnt)
	line	125
;Key.c: 125: switch(SysDingShiSTEP)
	goto	l13176
	line	127
	
l13156:	
	movlw	(0)
	fcall	_PWM_LED1
	movlw	(0)
	fcall	_PWM_LED2
	
l13158:	
	incf	(_SysDingShiSTEP),f
	goto	l6225
	line	128
	
l13160:	
	movf	(_LEDR1_Vol),w
	fcall	_PWM_LED1
	movf	(_LEDR2_Vol),w
	fcall	_PWM_LED2
	goto	l13158
	line	129
	
l13164:	
	movlw	(0)
	fcall	_PWM_LED1
	movlw	(0)
	fcall	_PWM_LED2
	goto	l13158
	line	130
	
l13168:	
	movf	(_LEDR1_Vol),w
	fcall	_PWM_LED1
	movf	(_LEDR2_Vol),w
	fcall	_PWM_LED2
	line	131
	
l13170:	
;Key.c: 131: SysDingShiOne=1;
	clrf	(_SysDingShiOne)
	incf	(_SysDingShiOne),f
	line	132
	
l13172:	
;Key.c: 132: SysDingShiSTEP=0;
	clrf	(_SysDingShiSTEP)
	line	133
;Key.c: 133: break;
	goto	l6225
	line	125
	
l13176:	
	movf	(_SysDingShiSTEP),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           15     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             8     6 (fixed)
; spacedrange           14     9 (fixed)
; locatedrange           4     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l13156
	xorlw	1^0	; case 1
	skipnz
	goto	l13160
	xorlw	2^1	; case 2
	skipnz
	goto	l13164
	xorlw	3^2	; case 3
	skipnz
	goto	l13168
	goto	l6214
	opt asmopt_on

	line	138
	
l6214:	
	line	151
	
l6225:	
	return
	opt stack 0
GLOBAL	__end_of_Key_HandRunning
	__end_of_Key_HandRunning:
;; =============== function _Key_HandRunning ends ============

	signat	_Key_HandRunning,88
	global	_RF_ENHANCE_RxData
psect	text1849,local,class=CODE,delta=2
global __ptext1849
__ptext1849:

;; *************** function _RF_ENHANCE_RxData *****************
;; Defined at:
;;		line 192 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;  payload_buff    1    wreg     PTR unsigned char 
;;		 -> rf_buf(18), 
;;  length          1    3[BANK0 ] unsigned char 
;;  postback_buf    1    4[BANK0 ] PTR unsigned char 
;;		 -> ack_buf(8), 
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
;;      Params:         0       2       0
;;      Locals:         0       1       0
;;      Temps:          0       1       0
;;      Totals:         0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_RF_GetStatus
;;		_RF_Read_Buff
;;		_RF_ClearFIFO
;;		_RF_ClearStatus
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1849
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	192
	global	__size_of_RF_ENHANCE_RxData
	__size_of_RF_ENHANCE_RxData	equ	__end_of_RF_ENHANCE_RxData-_RF_ENHANCE_RxData
	
_RF_ENHANCE_RxData:	
	opt	stack 2
; Regs used in _RF_ENHANCE_RxData: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_ENHANCE_RxData@payload_buff stored from wreg
	line	194
	movwf	(RF_ENHANCE_RxData@payload_buff)
	
l13124:	
;rf297L.c: 194: if(!(RF_GetStatus() & 0X40))
	fcall	_RF_GetStatus
	movwf	(??_RF_ENHANCE_RxData+0)+0
	btfsc	0+(??_RF_ENHANCE_RxData+0)+0,(6)&7
	goto	u3151
	goto	u3150
u3151:
	goto	l13130
u3150:
	line	196
	
l13126:	
;rf297L.c: 195: {
;rf297L.c: 196: return 0;
	movlw	(0)
	goto	l3356
	line	198
	
l13130:	
;rf297L.c: 197: }
;rf297L.c: 198: RF_Read_Buff(0x61, payload_buff, length);
	movf	(RF_ENHANCE_RxData@payload_buff),w
	movwf	(?_RF_Read_Buff)
	movf	(RF_ENHANCE_RxData@length),w
	movwf	0+(?_RF_Read_Buff)+01h
	movlw	(061h)
	fcall	_RF_Read_Buff
	line	199
	
l13132:	
;rf297L.c: 199: RF_ClearFIFO();
	fcall	_RF_ClearFIFO
	line	200
	
l13134:	
;rf297L.c: 200: RF_ClearStatus();
	fcall	_RF_ClearStatus
	line	202
	
l13136:	
;rf297L.c: 202: return 1;
	movlw	(01h)
	line	203
	
l3356:	
	return
	opt stack 0
GLOBAL	__end_of_RF_ENHANCE_RxData
	__end_of_RF_ENHANCE_RxData:
;; =============== function _RF_ENHANCE_RxData ends ============

	signat	_RF_ENHANCE_RxData,12409
	global	_RF_Init3
psect	text1850,local,class=CODE,delta=2
global __ptext1850
__ptext1850:

;; *************** function _RF_Init3 *****************
;; Defined at:
;;		line 135 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
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
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_RF_WriteReg
;;		_RF_ADDSSet
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1850
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	135
	global	__size_of_RF_Init3
	__size_of_RF_Init3	equ	__end_of_RF_Init3-_RF_Init3
	
_RF_Init3:	
	opt	stack 2
; Regs used in _RF_Init3: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	136
	
l13116:	
;rf297L.c: 136: RF_WriteReg(0x20 + 0x03, 0x03);
	movlw	(03h)
	movwf	(?_RF_WriteReg)
	movlw	(023h)
	fcall	_RF_WriteReg
	line	137
;rf297L.c: 137: RF_WriteReg(0x20 + 0x11, 8);
	movlw	(08h)
	movwf	(?_RF_WriteReg)
	movlw	(031h)
	fcall	_RF_WriteReg
	line	138
	
l13118:	
;rf297L.c: 138: RF_ADDSSet(TX_ADDRESS_DEF);
	movlw	(_TX_ADDRESS_DEF)&0ffh
	fcall	_RF_ADDSSet
	line	139
	
l13120:	
;rf297L.c: 139: RF_WriteReg(0x20 + 0x04,0x01);
	clrf	(?_RF_WriteReg)
	incf	(?_RF_WriteReg),f
	movlw	(024h)
	fcall	_RF_WriteReg
	line	140
	
l13122:	
;rf297L.c: 140: RF_WriteReg(0x20 + 0x01, 0x01);
	clrf	(?_RF_WriteReg)
	incf	(?_RF_WriteReg),f
	movlw	(021h)
	fcall	_RF_WriteReg
	line	141
	
l3345:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Init3
	__end_of_RF_Init3:
;; =============== function _RF_Init3 ends ============

	signat	_RF_Init3,88
	global	_RF_Init
psect	text1851,local,class=CODE,delta=2
global __ptext1851
__ptext1851:

;; *************** function _RF_Init *****************
;; Defined at:
;;		line 58 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  RF_cal2_data    6    4[BANK0 ] unsigned char [6]
;;  BB_cal_data     5   10[BANK0 ] unsigned char [5]
;;  Dem_cal2_dat    3   18[BANK0 ] unsigned char [3]
;;  RF_cal_data     3   15[BANK0 ] unsigned char [3]
;;  feature         1   22[BANK0 ] unsigned char 
;;  Dem_cal_data    1   21[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0      19       0
;;      Temps:          0       0       0
;;      Totals:         0      19       0
;;Total ram usage:       19 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_SPI_init
;;		_RF_WriteReg
;;		_RF_ADDSSet
;;		_RF_Write_Buff
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1851
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	58
	global	__size_of_RF_Init
	__size_of_RF_Init	equ	__end_of_RF_Init-_RF_Init
	
_RF_Init:	
	opt	stack 2
; Regs used in _RF_Init: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	75
	
l13062:	
;rf297L.c: 75: unsigned char BB_cal_data[] = {0x0A,0x6D,0x67,0x9C,0x46};
	movlw	(RF_Init@BB_cal_data)&0ffh
	movwf	fsr0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(RF_Init@F664)^080h,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(RF_Init@F664)^080h+1,w
	movwf	indf
	incf	fsr0,f
	movf	(RF_Init@F664)^080h+2,w
	movwf	indf
	incf	fsr0,f
	movf	(RF_Init@F664)^080h+3,w
	movwf	indf
	incf	fsr0,f
	movf	(RF_Init@F664)^080h+4,w
	movwf	indf
	line	76
	
l13064:	
;rf297L.c: 76: unsigned char RF_cal_data[] = {0x16,0x33,0x27};
	movf	(RF_Init@F666)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(RF_Init@RF_cal_data)
	bsf	status, 5	;RP0=1, select bank1
	movf	(RF_Init@F666+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(RF_Init@RF_cal_data+1)
	bsf	status, 5	;RP0=1, select bank1
	movf	(RF_Init@F666+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(RF_Init@RF_cal_data+2)
	line	77
	
l13066:	
;rf297L.c: 77: unsigned char RF_cal2_data[] = {0x45,0x21,0x3F,0x2D,0x5C,0x40};
	movlw	(RF_Init@RF_cal2_data)&0ffh
	movwf	fsr0
	bsf	status, 5	;RP0=1, select bank1
	movf	(RF_Init@F668)^080h,w
	movwf	indf
	incf	fsr0,f
	movf	(RF_Init@F668)^080h+1,w
	movwf	indf
	incf	fsr0,f
	movf	(RF_Init@F668)^080h+2,w
	movwf	indf
	incf	fsr0,f
	movf	(RF_Init@F668)^080h+3,w
	movwf	indf
	incf	fsr0,f
	movf	(RF_Init@F668)^080h+4,w
	movwf	indf
	incf	fsr0,f
	movf	(RF_Init@F668)^080h+5,w
	movwf	indf
	line	78
;rf297L.c: 78: unsigned char Dem_cal_data[] = {0x01};
	bcf	status, 5	;RP0=0, select bank0
	movf	(RF_Init@F670),w
	movwf	(RF_Init@Dem_cal_data)
	line	79
;rf297L.c: 79: unsigned char Dem_cal2_data[] = {0x0B,0xDF,0x02};
	bsf	status, 5	;RP0=1, select bank1
	movf	(RF_Init@F672)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(RF_Init@Dem_cal2_data)
	bsf	status, 5	;RP0=1, select bank1
	movf	(RF_Init@F672+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(RF_Init@Dem_cal2_data+1)
	bsf	status, 5	;RP0=1, select bank1
	movf	(RF_Init@F672+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(RF_Init@Dem_cal2_data+2)
	line	88
	
l13068:	
;rf297L.c: 88: unsigned char feature = 0x00;
	clrf	(RF_Init@feature)
	line	89
	
l13070:	
;rf297L.c: 89: SPI_init();
	fcall	_SPI_init
	line	90
	
l13072:	
;rf297L.c: 90: RF_WriteReg(0x53, 0x5A);
	movlw	(05Ah)
	movwf	(?_RF_WriteReg)
	movlw	(053h)
	fcall	_RF_WriteReg
	line	91
	
l13074:	
;rf297L.c: 91: RF_WriteReg(0x53, 0XA5);
	movlw	(0A5h)
	movwf	(?_RF_WriteReg)
	movlw	(053h)
	fcall	_RF_WriteReg
	line	92
	
l13076:	
;rf297L.c: 92: RF_WriteReg(0xE1, 0);
	clrf	(?_RF_WriteReg)
	movlw	(0E1h)
	fcall	_RF_WriteReg
	line	93
	
l13078:	
;rf297L.c: 93: RF_WriteReg(0xE2, 0);
	clrf	(?_RF_WriteReg)
	movlw	(0E2h)
	fcall	_RF_WriteReg
	line	94
	
l13080:	
;rf297L.c: 94: RF_WriteReg(0x20 + 0x07, 0x70);
	movlw	(070h)
	movwf	(?_RF_WriteReg)
	movlw	(027h)
	fcall	_RF_WriteReg
	line	95
	
l13082:	
;rf297L.c: 95: RF_WriteReg(0x20 + 0x02, 0x01);
	clrf	(?_RF_WriteReg)
	incf	(?_RF_WriteReg),f
	movlw	(022h)
	fcall	_RF_WriteReg
	line	96
	
l13084:	
;rf297L.c: 96: RF_WriteReg(0x20 + 0x03, 0x03);
	movlw	(03h)
	movwf	(?_RF_WriteReg)
	movlw	(023h)
	fcall	_RF_WriteReg
	line	98
	
l13086:	
;rf297L.c: 98: RF_WriteReg(0x20 + 0x11, 8);
	movlw	(08h)
	movwf	(?_RF_WriteReg)
	movlw	(031h)
	fcall	_RF_WriteReg
	line	100
	
l13088:	
;rf297L.c: 100: RF_ADDSSet(TX_ADDRESS_DEF);
	movlw	(_TX_ADDRESS_DEF)&0ffh
	fcall	_RF_ADDSSet
	line	102
	
l13090:	
;rf297L.c: 102: RF_Write_Buff(0x20 + 0x1F, BB_cal_data, sizeof(BB_cal_data));
	movlw	(RF_Init@BB_cal_data&0ffh)
	movwf	(?_RF_Write_Buff)
	movlw	(0x0/2)
	movwf	(?_RF_Write_Buff+1)
	movlw	(05h)
	movwf	0+(?_RF_Write_Buff)+02h
	movlw	(03Fh)
	fcall	_RF_Write_Buff
	line	103
	
l13092:	
;rf297L.c: 103: RF_Write_Buff(0x20 + 0x1A, RF_cal2_data, sizeof(RF_cal2_data));
	movlw	(RF_Init@RF_cal2_data&0ffh)
	movwf	(?_RF_Write_Buff)
	movlw	(0x0/2)
	movwf	(?_RF_Write_Buff+1)
	movlw	(06h)
	movwf	0+(?_RF_Write_Buff)+02h
	movlw	(03Ah)
	fcall	_RF_Write_Buff
	line	104
	
l13094:	
;rf297L.c: 104: RF_Write_Buff(0x20 + 0x19, Dem_cal_data, sizeof(Dem_cal_data));
	movlw	(RF_Init@Dem_cal_data&0ffh)
	movwf	(?_RF_Write_Buff)
	movlw	(0x0/2)
	movwf	(?_RF_Write_Buff+1)
	clrf	0+(?_RF_Write_Buff)+02h
	incf	0+(?_RF_Write_Buff)+02h,f
	movlw	(039h)
	fcall	_RF_Write_Buff
	line	105
	
l13096:	
;rf297L.c: 105: RF_Write_Buff(0x20 + 0x1E, RF_cal_data, sizeof(RF_cal_data));
	movlw	(RF_Init@RF_cal_data&0ffh)
	movwf	(?_RF_Write_Buff)
	movlw	(0x0/2)
	movwf	(?_RF_Write_Buff+1)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+02h
	movlw	(03Eh)
	fcall	_RF_Write_Buff
	line	106
	
l13098:	
;rf297L.c: 106: RF_Write_Buff(0x20 + 0x1B, Dem_cal2_data,sizeof(Dem_cal2_data));
	movlw	(RF_Init@Dem_cal2_data&0ffh)
	movwf	(?_RF_Write_Buff)
	movlw	(0x0/2)
	movwf	(?_RF_Write_Buff+1)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+02h
	movlw	(03Bh)
	fcall	_RF_Write_Buff
	line	107
	
l13100:	
;rf297L.c: 107: RF_WriteReg(0x20 + 0x1C, 0x00);
	clrf	(?_RF_WriteReg)
	movlw	(03Ch)
	fcall	_RF_WriteReg
	line	108
	
l13102:	
;rf297L.c: 108: RF_WriteReg(0x20 + 0x06, (0x0e |0X00));
	movlw	(0Eh)
	movwf	(?_RF_WriteReg)
	movlw	(026h)
	fcall	_RF_WriteReg
	line	109
	
l13104:	
;rf297L.c: 109: RF_WriteReg(0x50, 0x73);
	movlw	(073h)
	movwf	(?_RF_WriteReg)
	movlw	(050h)
	fcall	_RF_WriteReg
	line	112
	
l13106:	
;rf297L.c: 112: RF_WriteReg(0x20 + 0x04,0x01);
	clrf	(?_RF_WriteReg)
	incf	(?_RF_WriteReg),f
	movlw	(024h)
	fcall	_RF_WriteReg
	line	113
	
l13108:	
;rf297L.c: 113: RF_WriteReg(0x20 + 0x01, 0x01);
	clrf	(?_RF_WriteReg)
	incf	(?_RF_WriteReg),f
	movlw	(021h)
	fcall	_RF_WriteReg
	line	125
	
l13110:	
;rf297L.c: 125: feature |= 0x02;
	bsf	(RF_Init@feature)+(1/8),(1)&7
	line	131
;rf297L.c: 127: if(8 >32){
	
l13114:	
;rf297L.c: 129: }
;rf297L.c: 131: RF_WriteReg(0x20 + 0x1D, feature);
	movf	(RF_Init@feature),w
	movwf	(?_RF_WriteReg)
	movlw	(03Dh)
	fcall	_RF_WriteReg
	line	132
	
l3342:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Init
	__end_of_RF_Init:
;; =============== function _RF_Init ends ============

	signat	_RF_Init,88
	global	_LED_Dimming
psect	text1852,local,class=CODE,delta=2
global __ptext1852
__ptext1852:

;; *************** function _LED_Dimming *****************
;; Defined at:
;;		line 231 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
;; Parameters:    Size  Location     Type
;;  Brightness      1    wreg     unsigned char 
;;  Color_Temp      1    9[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  Brightness      1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 140/20
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       1       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_Convert_Duty_Cycle1
;;		_Convert_Duty_Cycle2
;;		_BufSetRun
;; This function is called by:
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1852
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
	line	231
	global	__size_of_LED_Dimming
	__size_of_LED_Dimming	equ	__end_of_LED_Dimming-_LED_Dimming
	
_LED_Dimming:	
	opt	stack 3
; Regs used in _LED_Dimming: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;LED_Dimming@Brightness stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(LED_Dimming@Brightness)
	line	232
	
l13056:	
;recive.c: 232: LEDR1_Vol = Convert_Duty_Cycle1(Brightness,Color_Temp);
	movf	(LED_Dimming@Color_Temp),w
	movwf	(?_Convert_Duty_Cycle1)
	movf	(LED_Dimming@Brightness),w
	fcall	_Convert_Duty_Cycle1
	movf	(0+(?_Convert_Duty_Cycle1)),w
	movwf	(_LEDR1_Vol)
	line	233
;recive.c: 233: LEDR2_Vol = Convert_Duty_Cycle2(Brightness,Color_Temp);
	movf	(LED_Dimming@Color_Temp),w
	movwf	(?_Convert_Duty_Cycle2)
	movf	(LED_Dimming@Brightness),w
	fcall	_Convert_Duty_Cycle2
	movf	(0+(?_Convert_Duty_Cycle2)),w
	movwf	(_LEDR2_Vol)
	line	237
	
l13058:	
;recive.c: 237: BufSetRun(0,LEDR1_Vol,1,3);
	movf	(_LEDR1_Vol),w
	movwf	(?_BufSetRun)
	clrf	0+(?_BufSetRun)+01h
	incf	0+(?_BufSetRun)+01h,f
	movlw	(03h)
	movwf	0+(?_BufSetRun)+02h
	movlw	(0)
	fcall	_BufSetRun
	line	238
	
l13060:	
;recive.c: 238: BufSetRun(1,LEDR2_Vol,1,3);
	movf	(_LEDR2_Vol),w
	movwf	(?_BufSetRun)
	clrf	0+(?_BufSetRun)+01h
	incf	0+(?_BufSetRun)+01h,f
	movlw	(03h)
	movwf	0+(?_BufSetRun)+02h
	movlw	(01h)
	fcall	_BufSetRun
	line	241
	
l8375:	
	return
	opt stack 0
GLOBAL	__end_of_LED_Dimming
	__end_of_LED_Dimming:
;; =============== function _LED_Dimming ends ============

	signat	_LED_Dimming,8312
	global	_BufRuning
psect	text1853,local,class=CODE,delta=2
global __ptext1853
__ptext1853:

;; *************** function _BufRuning *****************
;; Defined at:
;;		line 37 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\Buffer.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    4[BANK0 ] unsigned char 
;;  k               1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 160/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       2       0
;;      Totals:         0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_BufferRun
;;		_Buffer_VaryFun
;; This function is called by:
;;		_Key_HandRunning
;; This function uses a non-reentrant model
;;
psect	text1853
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\Buffer.C"
	line	37
	global	__size_of_BufRuning
	__size_of_BufRuning	equ	__end_of_BufRuning-_BufRuning
	
_BufRuning:	
	opt	stack 2
; Regs used in _BufRuning: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	40
	
l13030:	
;Buffer.C: 38: unsigned char i,k;
;Buffer.C: 40: for(i=0;i<2;i++)
	clrf	(BufRuning@i)
	line	43
	
l13036:	
;Buffer.C: 41: {
;Buffer.C: 43: if(RunParam_Reg.RunEN[i])
	movf	(BufRuning@i),w
	addlw	_RunParam_Reg+0Ch&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf
	skipnz
	goto	u3111
	goto	u3110
u3111:
	goto	l13052
u3110:
	line	48
	
l13038:	
;Buffer.C: 44: {
;Buffer.C: 48: if(RunParam_Reg.RunSAT[i])
	movf	(BufRuning@i),w
	addlw	_RunParam_Reg+0Ah&0ffh
	movwf	fsr0
	movf	indf
	skipnz
	goto	u3121
	goto	u3120
u3121:
	goto	l13052
u3120:
	line	51
	
l13040:	
;Buffer.C: 49: {
;Buffer.C: 51: if((++RunParam_Reg.TallyTimeing[i]) >= RunParam_Reg.GapTime[i] )
	movf	(BufRuning@i),w
	addlw	_RunParam_Reg+04h&0ffh
	movwf	fsr
	movf	indf,w
	movwf	(??_BufRuning+0)+0
	movf	(BufRuning@i),w
	addlw	_RunParam_Reg+06h&0ffh
	movwf	fsr0
	incf	indf,f
	movf	(indf),w
	movwf	(??_BufRuning+1)+0
	movf	(??_BufRuning+0)+0,w
	subwf	(??_BufRuning+1)+0,w
	skipc
	goto	u3131
	goto	u3130
u3131:
	goto	l13052
u3130:
	line	53
	
l13042:	
;Buffer.C: 52: {
;Buffer.C: 53: RunParam_Reg.TallyTimeing[i]=0;
	movf	(BufRuning@i),w
	addlw	_RunParam_Reg+06h&0ffh
	movwf	fsr0
	clrf	indf
	line	54
	
l13044:	
;Buffer.C: 54: k=BufferRun(i);
	movf	(BufRuning@i),w
	fcall	_BufferRun
	movwf	(BufRuning@k)
	line	55
	
l13046:	
;Buffer.C: 55: RunParam_Reg.RunFinish[i]=k;
	movf	(BufRuning@i),w
	addlw	_RunParam_Reg+0Eh&0ffh
	movwf	fsr0
	movf	(BufRuning@k),w
	movwf	indf
	line	56
	
l13048:	
;Buffer.C: 56: RunParam_Reg.RunSAT[i]=k;
	movf	(BufRuning@i),w
	addlw	_RunParam_Reg+0Ah&0ffh
	movwf	fsr0
	movf	(BufRuning@k),w
	movwf	indf
	line	57
	
l13050:	
;Buffer.C: 57: Buffer_VaryFun(i,RunParam_Reg.GoalValing [i]);
	movf	(BufRuning@i),w
	addlw	_RunParam_Reg+02h&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(?_Buffer_VaryFun)
	clrf	(?_Buffer_VaryFun+1)
	movf	(BufRuning@i),w
	fcall	_Buffer_VaryFun
	line	40
	
l13052:	
	incf	(BufRuning@i),f
	
l13054:	
	movlw	(02h)
	subwf	(BufRuning@i),w
	skipc
	goto	u3141
	goto	u3140
u3141:
	goto	l13036
u3140:
	line	62
	
l6996:	
	return
	opt stack 0
GLOBAL	__end_of_BufRuning
	__end_of_BufRuning:
;; =============== function _BufRuning ends ============

	signat	_BufRuning,88
	global	_I2C_ReadByte1
psect	text1854,local,class=CODE,delta=2
global __ptext1854
__ptext1854:

;; *************** function _I2C_ReadByte1 *****************
;; Defined at:
;;		line 117 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\iic.c"
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
;;		_IIC_NACK1
;;		_IIC_ACK1
;; This function is called by:
;;		_AT24C02_Read_Byte1
;; This function uses a non-reentrant model
;;
psect	text1854
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\iic.c"
	line	117
	global	__size_of_I2C_ReadByte1
	__size_of_I2C_ReadByte1	equ	__end_of_I2C_ReadByte1-_I2C_ReadByte1
	
_I2C_ReadByte1:	
	opt	stack 1
; Regs used in _I2C_ReadByte1: [wreg+status,2+status,0+pclath+cstack]
;I2C_ReadByte1@ack stored from wreg
	line	120
	movwf	(I2C_ReadByte1@ack)
	
l12996:	
;iic.c: 118: unsigned char cnt;
;iic.c: 119: unsigned int data;
;iic.c: 120: {TRISB6=1,WPUB6=1;};
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1078/8)^080h,(1078)&7
	bsf	(1198/8)^080h,(1198)&7
	line	122
	
l12998:	
;iic.c: 122: for(cnt=0; cnt<8; cnt++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(I2C_ReadByte1@cnt)
	line	123
	
l9070:	
	line	124
;iic.c: 123: {
;iic.c: 124: RB7=0;
	bcf	(55/8),(55)&7
	line	125
	
l13004:	
;iic.c: 125: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	127
	
l13006:	
;iic.c: 127: RB7=1;
	bsf	(55/8),(55)&7
	line	128
	
l13008:	
;iic.c: 128: data <<= 1;
	clrc
	rlf	(I2C_ReadByte1@data),f
	rlf	(I2C_ReadByte1@data+1),f
	line	129
	
l13010:	
;iic.c: 129: if(RB6)
	btfss	(54/8),(54)&7
	goto	u3081
	goto	u3080
u3081:
	goto	l13014
u3080:
	line	131
	
l13012:	
;iic.c: 130: {
;iic.c: 131: data |= 0x01;
	bsf	(I2C_ReadByte1@data)+(0/8),(0)&7
	line	133
	
l13014:	
;iic.c: 132: }
;iic.c: 133: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	122
	
l13016:	
	incf	(I2C_ReadByte1@cnt),f
	
l13018:	
	movlw	(08h)
	subwf	(I2C_ReadByte1@cnt),w
	skipc
	goto	u3091
	goto	u3090
u3091:
	goto	l9070
u3090:
	line	135
	
l13020:	
;iic.c: 134: }
;iic.c: 135: if(ack == 0)
	movf	(I2C_ReadByte1@ack),f
	skipz
	goto	u3101
	goto	u3100
u3101:
	goto	l13024
u3100:
	line	137
	
l13022:	
;iic.c: 136: {
;iic.c: 137: IIC_NACK1();
	fcall	_IIC_NACK1
	line	138
;iic.c: 138: }
	goto	l13026
	line	141
	
l13024:	
;iic.c: 139: else
;iic.c: 140: {
;iic.c: 141: IIC_ACK1();
	fcall	_IIC_ACK1
	line	143
	
l13026:	
;iic.c: 142: }
;iic.c: 143: return data;
	movf	(I2C_ReadByte1@data+1),w
	movwf	(?_I2C_ReadByte1+1)
	movf	(I2C_ReadByte1@data),w
	movwf	(?_I2C_ReadByte1)
	line	144
	
l9075:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_ReadByte1
	__end_of_I2C_ReadByte1:
;; =============== function _I2C_ReadByte1 ends ============

	signat	_I2C_ReadByte1,4218
	global	_AT24C02_Write_Byte1
psect	text1855,local,class=CODE,delta=2
global __ptext1855
__ptext1855:

;; *************** function _AT24C02_Write_Byte1 *****************
;; Defined at:
;;		line 157 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;;  data            1    6[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         1       1       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_IIC_START1
;;		_I2C_SendByte1
;;		_IIC_Wait_ACK1
;;		_IIC_STOP1
;; This function is called by:
;;		_AT24C02_Write_Msg
;; This function uses a non-reentrant model
;;
psect	text1855
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
	line	157
	global	__size_of_AT24C02_Write_Byte1
	__size_of_AT24C02_Write_Byte1	equ	__end_of_AT24C02_Write_Byte1-_AT24C02_Write_Byte1
	
_AT24C02_Write_Byte1:	
	opt	stack 1
; Regs used in _AT24C02_Write_Byte1: [wreg+status,2+status,0+pclath+cstack]
;AT24C02_Write_Byte1@addr stored from wreg
	movwf	(AT24C02_Write_Byte1@addr)
	line	158
	
l12994:	
;24lc02.c: 158: IIC_START1();
	fcall	_IIC_START1
	line	159
;24lc02.c: 159: I2C_SendByte1(0XA0);
	movlw	(0A0h)
	fcall	_I2C_SendByte1
	line	160
;24lc02.c: 160: IIC_Wait_ACK1();
	fcall	_IIC_Wait_ACK1
	line	161
;24lc02.c: 161: I2C_SendByte1(addr);
	movf	(AT24C02_Write_Byte1@addr),w
	fcall	_I2C_SendByte1
	line	162
;24lc02.c: 162: IIC_Wait_ACK1();
	fcall	_IIC_Wait_ACK1
	line	163
;24lc02.c: 163: I2C_SendByte1(data);
	movf	(AT24C02_Write_Byte1@data),w
	fcall	_I2C_SendByte1
	line	164
;24lc02.c: 164: IIC_Wait_ACK1();
	fcall	_IIC_Wait_ACK1
	line	165
;24lc02.c: 165: IIC_STOP1();
	fcall	_IIC_STOP1
	line	166
	
l4729:	
	return
	opt stack 0
GLOBAL	__end_of_AT24C02_Write_Byte1
	__end_of_AT24C02_Write_Byte1:
;; =============== function _AT24C02_Write_Byte1 ends ============

	signat	_AT24C02_Write_Byte1,8312
	global	_IIC_ReceByte
psect	text1856,local,class=CODE,delta=2
global __ptext1856
__ptext1856:

;; *************** function _IIC_ReceByte *****************
;; Defined at:
;;		line 243 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
;; Parameters:    Size  Location     Type
;;  ACK             1    wreg     unsigned char 
;;  Chip_Adds       1    7[BANK0 ] unsigned char 
;;  Reg_Adds        1    8[BANK0 ] unsigned char 
;;  Rdat            1    9[BANK0 ] PTR unsigned char 
;;		 -> EP_BP(1), RF_ADDRESS(5), 
;; Auto vars:     Size  Location     Type
;;  ACK             1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 40/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       3       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_IIC_start
;;		_IIC_Wbyte
;;		_IIC_RACK
;;		_IIC_Rbyte
;;		_IIC_WACK
;;		_IIC_stop
;; This function is called by:
;;		_EEPROM_ReceByte
;; This function uses a non-reentrant model
;;
psect	text1856
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
	line	243
	global	__size_of_IIC_ReceByte
	__size_of_IIC_ReceByte	equ	__end_of_IIC_ReceByte-_IIC_ReceByte
	
_IIC_ReceByte:	
	opt	stack 1
; Regs used in _IIC_ReceByte: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;IIC_ReceByte@ACK stored from wreg
	movwf	(IIC_ReceByte@ACK)
	line	244
	
l12928:	
;I2C_Base.c: 244: if(IIC_start()) return(1);
	fcall	_IIC_start
	xorlw	0
	skipnz
	goto	u2981
	goto	u2980
u2981:
	goto	l12934
u2980:
	
l12930:	
	movlw	(01h)
	goto	l5411
	line	245
	
l12934:	
;I2C_Base.c: 245: if(IIC_Wbyte(Chip_Adds<<1)) return(2);
	clrc
	rlf	(IIC_ReceByte@Chip_Adds),w
	fcall	_IIC_Wbyte
	xorlw	0
	skipnz
	goto	u2991
	goto	u2990
u2991:
	goto	l12940
u2990:
	
l12936:	
	movlw	(02h)
	goto	l5411
	line	246
	
l12940:	
;I2C_Base.c: 246: if(IIC_RACK()) return(3);
	fcall	_IIC_RACK
	xorlw	0
	skipnz
	goto	u3001
	goto	u3000
u3001:
	goto	l12946
u3000:
	
l12942:	
	movlw	(03h)
	goto	l5411
	line	247
	
l12946:	
;I2C_Base.c: 247: if(IIC_Wbyte(Reg_Adds)) return(4);
	movf	(IIC_ReceByte@Reg_Adds),w
	fcall	_IIC_Wbyte
	xorlw	0
	skipnz
	goto	u3011
	goto	u3010
u3011:
	goto	l12952
u3010:
	
l12948:	
	movlw	(04h)
	goto	l5411
	line	248
	
l12952:	
;I2C_Base.c: 248: if(IIC_RACK()) return(5);
	fcall	_IIC_RACK
	xorlw	0
	skipnz
	goto	u3021
	goto	u3020
u3021:
	goto	l12958
u3020:
	
l12954:	
	movlw	(05h)
	goto	l5411
	line	250
	
l12958:	
;I2C_Base.c: 250: if(IIC_start()) return(6);
	fcall	_IIC_start
	xorlw	0
	skipnz
	goto	u3031
	goto	u3030
u3031:
	goto	l12964
u3030:
	
l12960:	
	movlw	(06h)
	goto	l5411
	line	251
	
l12964:	
;I2C_Base.c: 251: if(IIC_Wbyte((Chip_Adds<<1)+1)) return(7);
	setc
	rlf	(IIC_ReceByte@Chip_Adds),w
	fcall	_IIC_Wbyte
	xorlw	0
	skipnz
	goto	u3041
	goto	u3040
u3041:
	goto	l12970
u3040:
	
l12966:	
	movlw	(07h)
	goto	l5411
	line	252
	
l12970:	
;I2C_Base.c: 252: if(IIC_RACK()) return(8);
	fcall	_IIC_RACK
	xorlw	0
	skipnz
	goto	u3051
	goto	u3050
u3051:
	goto	l12976
u3050:
	
l12972:	
	movlw	(08h)
	goto	l5411
	line	253
	
l12976:	
;I2C_Base.c: 253: *Rdat=IIC_Rbyte();
	movf	(IIC_ReceByte@Rdat),w
	movwf	fsr0
	fcall	_IIC_Rbyte
	movwf	indf
	line	254
	
l12978:	
;I2C_Base.c: 254: if(IIC_WACK(ACK)) return(9);
	movf	(IIC_ReceByte@ACK),w
	fcall	_IIC_WACK
	xorlw	0
	skipnz
	goto	u3061
	goto	u3060
u3061:
	goto	l12984
u3060:
	
l12980:	
	movlw	(09h)
	goto	l5411
	line	255
	
l12984:	
;I2C_Base.c: 255: if(IIC_stop()) return(10);
	fcall	_IIC_stop
	xorlw	0
	skipnz
	goto	u3071
	goto	u3070
u3071:
	goto	l12990
u3070:
	
l12986:	
	movlw	(0Ah)
	goto	l5411
	line	256
	
l12990:	
;I2C_Base.c: 256: return(0);
	movlw	(0)
	line	257
	
l5411:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_ReceByte
	__end_of_IIC_ReceByte:
;; =============== function _IIC_ReceByte ends ============

	signat	_IIC_ReceByte,16505
	global	_IIC_SendByte
psect	text1857,local,class=CODE,delta=2
global __ptext1857
__ptext1857:

;; *************** function _IIC_SendByte *****************
;; Defined at:
;;		line 336 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
;; Parameters:    Size  Location     Type
;;  Chip_Adds       1    wreg     unsigned char 
;;  Reg_Adds        1    7[BANK0 ] unsigned char 
;;  Wdat            1    8[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  Chip_Adds       1    9[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 40/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_IIC_start
;;		_IIC_Wbyte
;;		_IIC_RACK
;;		_IIC_stop
;; This function is called by:
;;		_EEPROM_SendByte
;; This function uses a non-reentrant model
;;
psect	text1857
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
	line	336
	global	__size_of_IIC_SendByte
	__size_of_IIC_SendByte	equ	__end_of_IIC_SendByte-_IIC_SendByte
	
_IIC_SendByte:	
	opt	stack 1
; Regs used in _IIC_SendByte: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;IIC_SendByte@Chip_Adds stored from wreg
	movwf	(IIC_SendByte@Chip_Adds)
	line	337
	
l12876:	
;I2C_Base.c: 337: if(IIC_start()) return(1);
	fcall	_IIC_start
	xorlw	0
	skipnz
	goto	u2901
	goto	u2900
u2901:
	goto	l12882
u2900:
	
l12878:	
	movlw	(01h)
	goto	l5441
	line	338
	
l12882:	
;I2C_Base.c: 338: if(IIC_Wbyte(Chip_Adds<<1)) return(2);
	clrc
	rlf	(IIC_SendByte@Chip_Adds),w
	fcall	_IIC_Wbyte
	xorlw	0
	skipnz
	goto	u2911
	goto	u2910
u2911:
	goto	l12888
u2910:
	
l12884:	
	movlw	(02h)
	goto	l5441
	line	339
	
l12888:	
;I2C_Base.c: 339: if(IIC_RACK()!=0) return(3);
	fcall	_IIC_RACK
	xorlw	0
	skipnz
	goto	u2921
	goto	u2920
u2921:
	goto	l12894
u2920:
	
l12890:	
	movlw	(03h)
	goto	l5441
	line	340
	
l12894:	
;I2C_Base.c: 340: if(IIC_Wbyte(Reg_Adds)) return(4);
	movf	(IIC_SendByte@Reg_Adds),w
	fcall	_IIC_Wbyte
	xorlw	0
	skipnz
	goto	u2931
	goto	u2930
u2931:
	goto	l12900
u2930:
	
l12896:	
	movlw	(04h)
	goto	l5441
	line	341
	
l12900:	
;I2C_Base.c: 341: if(IIC_RACK()!=0) return(5);
	fcall	_IIC_RACK
	xorlw	0
	skipnz
	goto	u2941
	goto	u2940
u2941:
	goto	l12906
u2940:
	
l12902:	
	movlw	(05h)
	goto	l5441
	line	342
	
l12906:	
;I2C_Base.c: 342: if(IIC_Wbyte(Wdat)) return(6);
	movf	(IIC_SendByte@Wdat),w
	fcall	_IIC_Wbyte
	xorlw	0
	skipnz
	goto	u2951
	goto	u2950
u2951:
	goto	l12912
u2950:
	
l12908:	
	movlw	(06h)
	goto	l5441
	line	343
	
l12912:	
;I2C_Base.c: 343: if(IIC_RACK()!=0) return(7);
	fcall	_IIC_RACK
	xorlw	0
	skipnz
	goto	u2961
	goto	u2960
u2961:
	goto	l12918
u2960:
	
l12914:	
	movlw	(07h)
	goto	l5441
	line	344
	
l12918:	
;I2C_Base.c: 344: if(IIC_stop()) return(8);
	fcall	_IIC_stop
	xorlw	0
	skipnz
	goto	u2971
	goto	u2970
u2971:
	goto	l12924
u2970:
	
l12920:	
	movlw	(08h)
	goto	l5441
	line	345
	
l12924:	
;I2C_Base.c: 345: return(0);
	movlw	(0)
	line	346
	
l5441:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_SendByte
	__end_of_IIC_SendByte:
;; =============== function _IIC_SendByte ends ============

	signat	_IIC_SendByte,12409
	global	_IIC_CheckBusy
psect	text1858,local,class=CODE,delta=2
global __ptext1858
__ptext1858:

;; *************** function _IIC_CheckBusy *****************
;; Defined at:
;;		line 413 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
;; Parameters:    Size  Location     Type
;;  Chip_Adds       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Chip_Adds       1    7[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_IIC_start
;;		_IIC_Wbyte
;;		_IIC_RACK
;; This function is called by:
;;		_EEPROM_CheckBusy
;; This function uses a non-reentrant model
;;
psect	text1858
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
	line	413
	global	__size_of_IIC_CheckBusy
	__size_of_IIC_CheckBusy	equ	__end_of_IIC_CheckBusy-_IIC_CheckBusy
	
_IIC_CheckBusy:	
	opt	stack 0
; Regs used in _IIC_CheckBusy: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;IIC_CheckBusy@Chip_Adds stored from wreg
	movwf	(IIC_CheckBusy@Chip_Adds)
	line	414
	
l12854:	
;I2C_Base.c: 414: if(IIC_start()) return(1);
	fcall	_IIC_start
	xorlw	0
	skipnz
	goto	u2871
	goto	u2870
u2871:
	goto	l12860
u2870:
	
l12856:	
	movlw	(01h)
	goto	l5467
	line	415
	
l12860:	
;I2C_Base.c: 415: if(IIC_Wbyte(Chip_Adds<<1)) return(2);
	clrc
	rlf	(IIC_CheckBusy@Chip_Adds),w
	fcall	_IIC_Wbyte
	xorlw	0
	skipnz
	goto	u2881
	goto	u2880
u2881:
	goto	l12866
u2880:
	
l12862:	
	movlw	(02h)
	goto	l5467
	line	416
	
l12866:	
;I2C_Base.c: 416: if(IIC_RACK()!=0) return(3);
	fcall	_IIC_RACK
	xorlw	0
	skipnz
	goto	u2891
	goto	u2890
u2891:
	goto	l12872
u2890:
	
l12868:	
	movlw	(03h)
	goto	l5467
	line	417
	
l12872:	
;I2C_Base.c: 417: return(0);
	movlw	(0)
	line	418
	
l5467:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_CheckBusy
	__end_of_IIC_CheckBusy:
;; =============== function _IIC_CheckBusy ends ============

	signat	_IIC_CheckBusy,4217
	global	_RF_ClearStatus
psect	text1859,local,class=CODE,delta=2
global __ptext1859
__ptext1859:

;; *************** function _RF_ClearStatus *****************
;; Defined at:
;;		line 284 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
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
;;		_RF_ENHANCE_RxData
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1859
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	284
	global	__size_of_RF_ClearStatus
	__size_of_RF_ClearStatus	equ	__end_of_RF_ClearStatus-_RF_ClearStatus
	
_RF_ClearStatus:	
	opt	stack 3
; Regs used in _RF_ClearStatus: [wreg+status,2+status,0+pclath+cstack]
	line	285
	
l12852:	
;rf297L.c: 285: RF_WriteReg(0x20 + 0x07,0x70);
	movlw	(070h)
	movwf	(?_RF_WriteReg)
	movlw	(027h)
	fcall	_RF_WriteReg
	line	286
	
l3371:	
	return
	opt stack 0
GLOBAL	__end_of_RF_ClearStatus
	__end_of_RF_ClearStatus:
;; =============== function _RF_ClearStatus ends ============

	signat	_RF_ClearStatus,88
	global	_RF_ClearFIFO
psect	text1860,local,class=CODE,delta=2
global __ptext1860
__ptext1860:

;; *************** function _RF_ClearFIFO *****************
;; Defined at:
;;		line 278 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
;;		_RF_ENHANCE_RxData
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1860
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	278
	global	__size_of_RF_ClearFIFO
	__size_of_RF_ClearFIFO	equ	__end_of_RF_ClearFIFO-_RF_ClearFIFO
	
_RF_ClearFIFO:	
	opt	stack 3
; Regs used in _RF_ClearFIFO: [wreg+status,2+status,0+pclath+cstack]
	line	279
	
l12850:	
;rf297L.c: 279: RF_WriteReg(0xE1, 0);
	clrf	(?_RF_WriteReg)
	movlw	(0E1h)
	fcall	_RF_WriteReg
	line	280
;rf297L.c: 280: RF_WriteReg(0xE2, 0);
	clrf	(?_RF_WriteReg)
	movlw	(0E2h)
	fcall	_RF_WriteReg
	line	281
	
l3368:	
	return
	opt stack 0
GLOBAL	__end_of_RF_ClearFIFO
	__end_of_RF_ClearFIFO:
;; =============== function _RF_ClearFIFO ends ============

	signat	_RF_ClearFIFO,88
	global	_RF_GetStatus
psect	text1861,local,class=CODE,delta=2
global __ptext1861
__ptext1861:

;; *************** function _RF_GetStatus *****************
;; Defined at:
;;		line 289 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
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
;;		_RF_ENHANCE_RxData
;; This function uses a non-reentrant model
;;
psect	text1861
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	289
	global	__size_of_RF_GetStatus
	__size_of_RF_GetStatus	equ	__end_of_RF_GetStatus-_RF_GetStatus
	
_RF_GetStatus:	
	opt	stack 1
; Regs used in _RF_GetStatus: [wreg+status,2+status,0+pclath+cstack]
	line	290
	
l12846:	
;rf297L.c: 290: return RF_ReadReg(0x07)&0x70;
	movlw	(07h)
	fcall	_RF_ReadReg
	andlw	070h
	line	291
	
l3374:	
	return
	opt stack 0
GLOBAL	__end_of_RF_GetStatus
	__end_of_RF_GetStatus:
;; =============== function _RF_GetStatus ends ============

	signat	_RF_GetStatus,89
	global	_RF_Set_RxMode1
psect	text1862,local,class=CODE,delta=2
global __ptext1862
__ptext1862:

;; *************** function _RF_Set_RxMode1 *****************
;; Defined at:
;;		line 303 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  k               1    0        unsigned char 
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1862
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	303
	global	__size_of_RF_Set_RxMode1
	__size_of_RF_Set_RxMode1	equ	__end_of_RF_Set_RxMode1-_RF_Set_RxMode1
	
_RF_Set_RxMode1:	
	opt	stack 3
; Regs used in _RF_Set_RxMode1: [wreg+status,2+status,0+pclath+cstack]
	line	306
	
l12842:	
;rf297L.c: 304: unsigned char k;
;rf297L.c: 306: RF_WriteReg(0x20 + 0x00, 0X87);
	movlw	(087h)
	movwf	(?_RF_WriteReg)
	movlw	(020h)
	fcall	_RF_WriteReg
	line	308
	
l12844:	
;rf297L.c: 308: RA7=1;
	bsf	(47/8),(47)&7
	line	310
	
l3380:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Set_RxMode1
	__end_of_RF_Set_RxMode1:
;; =============== function _RF_Set_RxMode1 ends ============

	signat	_RF_Set_RxMode1,88
	global	_RF_Init4
psect	text1863,local,class=CODE,delta=2
global __ptext1863
__ptext1863:

;; *************** function _RF_Init4 *****************
;; Defined at:
;;		line 143 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
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
;;		Unchanged: FFE9F/0
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
;;		_RF_Write_Buff
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1863
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	143
	global	__size_of_RF_Init4
	__size_of_RF_Init4	equ	__end_of_RF_Init4-_RF_Init4
	
_RF_Init4:	
	opt	stack 3
; Regs used in _RF_Init4: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	144
	
l12836:	
;rf297L.c: 144: RF_WriteReg(0x20 + 0x03, 0x01);
	clrf	(?_RF_WriteReg)
	incf	(?_RF_WriteReg),f
	movlw	(023h)
	fcall	_RF_WriteReg
	line	145
;rf297L.c: 145: RF_WriteReg(0x20 + 0x05, 26);
	movlw	(01Ah)
	movwf	(?_RF_WriteReg)
	movlw	(025h)
	fcall	_RF_WriteReg
	line	146
;rf297L.c: 146: RF_WriteReg(0x20 + 0x11, 18);
	movlw	(012h)
	movwf	(?_RF_WriteReg)
	movlw	(031h)
	fcall	_RF_WriteReg
	line	147
	
l12838:	
;rf297L.c: 147: RF_Write_Buff(0x20 + 0x10, TX2_ADDRESS_DEF, sizeof(TX2_ADDRESS_DEF));
	movlw	low((_TX2_ADDRESS_DEF-__stringbase))
	movwf	(?_RF_Write_Buff)
	movlw	80h
	movwf	(?_RF_Write_Buff+1)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+02h
	movlw	(030h)
	fcall	_RF_Write_Buff
	line	148
	
l12840:	
;rf297L.c: 148: RF_Write_Buff(0x20 + 0x0A,RX2_ADDRESS_DEF, sizeof(RX2_ADDRESS_DEF));
	movlw	low((_RX2_ADDRESS_DEF-__stringbase))
	movwf	(?_RF_Write_Buff)
	movlw	80h
	movwf	(?_RF_Write_Buff+1)
	movlw	(03h)
	movwf	0+(?_RF_Write_Buff)+02h
	movlw	(02Ah)
	fcall	_RF_Write_Buff
	line	149
;rf297L.c: 149: RF_WriteReg(0x20 + 0x04,0x00);
	clrf	(?_RF_WriteReg)
	movlw	(024h)
	fcall	_RF_WriteReg
	line	150
;rf297L.c: 150: RF_WriteReg(0x20 + 0x01, 0x00);
	clrf	(?_RF_WriteReg)
	movlw	(021h)
	fcall	_RF_WriteReg
	line	151
	
l3348:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Init4
	__end_of_RF_Init4:
;; =============== function _RF_Init4 ends ============

	signat	_RF_Init4,88
	global	_RF_ADDSSet
psect	text1864,local,class=CODE,delta=2
global __ptext1864
__ptext1864:

;; *************** function _RF_ADDSSet *****************
;; Defined at:
;;		line 49 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;  Buf             1    wreg     PTR unsigned char 
;;		 -> RF_ADDRESS(5), TX_ADDRESS_DEF(5), 
;; Auto vars:     Size  Location     Type
;;  Buf             1    3[BANK0 ] PTR unsigned char 
;;		 -> RF_ADDRESS(5), TX_ADDRESS_DEF(5), 
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
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_RF_WriteReg
;;		_RF_Write_Buff
;; This function is called by:
;;		_main
;;		_RF_Init
;;		_RF_Init3
;;		_Key_Handle
;; This function uses a non-reentrant model
;;
psect	text1864
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	49
	global	__size_of_RF_ADDSSet
	__size_of_RF_ADDSSet	equ	__end_of_RF_ADDSSet-_RF_ADDSSet
	
_RF_ADDSSet:	
	opt	stack 3
; Regs used in _RF_ADDSSet: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;RF_ADDSSet@Buf stored from wreg
	movwf	(RF_ADDSSet@Buf)
	line	50
	
l12830:	
;rf297L.c: 50: RF_WriteReg(0x20 + 0x05, Buf[4]&0x7f);
	movf	(RF_ADDSSet@Buf),w
	addlw	04h
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(?_RF_WriteReg)
	bcf	(?_RF_WriteReg)+(7/8),(7)&7
	movlw	(025h)
	fcall	_RF_WriteReg
	line	51
	
l12832:	
;rf297L.c: 51: RF_Write_Buff(0x20 + 0x10, Buf, 5);
	movf	(RF_ADDSSet@Buf),w
	movwf	(?_RF_Write_Buff)
	movlw	(0x0/2)
	movwf	(?_RF_Write_Buff+1)
	movlw	(05h)
	movwf	0+(?_RF_Write_Buff)+02h
	movlw	(030h)
	fcall	_RF_Write_Buff
	line	52
	
l12834:	
;rf297L.c: 52: RF_Write_Buff(0x20 + 0x0A,Buf, 5);
	movf	(RF_ADDSSet@Buf),w
	movwf	(?_RF_Write_Buff)
	movlw	(0x0/2)
	movwf	(?_RF_Write_Buff+1)
	movlw	(05h)
	movwf	0+(?_RF_Write_Buff)+02h
	movlw	(02Ah)
	fcall	_RF_Write_Buff
	line	53
	
l3328:	
	return
	opt stack 0
GLOBAL	__end_of_RF_ADDSSet
	__end_of_RF_ADDSSet:
;; =============== function _RF_ADDSSet ends ============

	signat	_RF_ADDSSet,4216
	global	_RF_Set_RxMode
psect	text1865,local,class=CODE,delta=2
global __ptext1865
__ptext1865:

;; *************** function _RF_Set_RxMode *****************
;; Defined at:
;;		line 295 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  k               1    0        unsigned char 
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1865
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	295
	global	__size_of_RF_Set_RxMode
	__size_of_RF_Set_RxMode	equ	__end_of_RF_Set_RxMode-_RF_Set_RxMode
	
_RF_Set_RxMode:	
	opt	stack 3
; Regs used in _RF_Set_RxMode: [wreg+status,2+status,0+pclath+cstack]
	line	297
	
l12826:	
;rf297L.c: 296: unsigned char k;
;rf297L.c: 297: RF_WriteReg(0x20 + 0x00, 0X8F);
	movlw	(08Fh)
	movwf	(?_RF_WriteReg)
	movlw	(020h)
	fcall	_RF_WriteReg
	line	299
	
l12828:	
;rf297L.c: 299: RA7=1;
	bsf	(47/8),(47)&7
	line	301
	
l3377:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Set_RxMode
	__end_of_RF_Set_RxMode:
;; =============== function _RF_Set_RxMode ends ============

	signat	_RF_Set_RxMode,88
	global	_EEPROM_Init
psect	text1866,local,class=CODE,delta=2
global __ptext1866
__ptext1866:

;; *************** function _EEPROM_Init *****************
;; Defined at:
;;		line 71 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
;; Parameters:    Size  Location     Type
;;  SPD_I2C         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  SPD_I2C         1    6[COMMON] unsigned char 
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_IIC_Init
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1866
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\24lc02.c"
	line	71
	global	__size_of_EEPROM_Init
	__size_of_EEPROM_Init	equ	__end_of_EEPROM_Init-_EEPROM_Init
	
_EEPROM_Init:	
	opt	stack 3
; Regs used in _EEPROM_Init: [wreg+status,2+status,0+pclath+cstack]
;EEPROM_Init@SPD_I2C stored from wreg
	line	73
	movwf	(EEPROM_Init@SPD_I2C)
	
l12820:	
;24lc02.c: 73: IIC_Init(SPD_I2C);
	movf	(EEPROM_Init@SPD_I2C),w
	fcall	_IIC_Init
	line	74
	
l12822:	
;24lc02.c: 74: return(0);
	movlw	(0)
	line	75
	
l4700:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_Init
	__end_of_EEPROM_Init:
;; =============== function _EEPROM_Init ends ============

	signat	_EEPROM_Init,4217
	global	_IIC_NACK1
psect	text1867,local,class=CODE,delta=2
global __ptext1867
__ptext1867:

;; *************** function _IIC_NACK1 *****************
;; Defined at:
;;		line 78 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\iic.c"
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
;;		_I2C_ReadByte1
;; This function uses a non-reentrant model
;;
psect	text1867
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\iic.c"
	line	78
	global	__size_of_IIC_NACK1
	__size_of_IIC_NACK1	equ	__end_of_IIC_NACK1-_IIC_NACK1
	
_IIC_NACK1:	
	opt	stack 1
; Regs used in _IIC_NACK1: [wreg+status,2+status,0+pclath+cstack]
	line	79
	
l12812:	
;iic.c: 79: RB6=1;
	bsf	(54/8),(54)&7
	line	80
	
l12814:	
;iic.c: 80: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	81
	
l12816:	
;iic.c: 81: RB7=1;
	bsf	(55/8),(55)&7
	line	82
;iic.c: 82: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	83
	
l12818:	
;iic.c: 83: RB7=0;
	bcf	(55/8),(55)&7
	line	84
;iic.c: 84: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	85
	
l9060:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_NACK1
	__end_of_IIC_NACK1:
;; =============== function _IIC_NACK1 ends ============

	signat	_IIC_NACK1,88
	global	_IIC_ACK1
psect	text1868,local,class=CODE,delta=2
global __ptext1868
__ptext1868:

;; *************** function _IIC_ACK1 *****************
;; Defined at:
;;		line 67 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\iic.c"
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
;;		_I2C_ReadByte1
;; This function uses a non-reentrant model
;;
psect	text1868
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\iic.c"
	line	67
	global	__size_of_IIC_ACK1
	__size_of_IIC_ACK1	equ	__end_of_IIC_ACK1-_IIC_ACK1
	
_IIC_ACK1:	
	opt	stack 1
; Regs used in _IIC_ACK1: [wreg+status,2+status,0+pclath+cstack]
	line	68
	
l12802:	
;iic.c: 68: TRISB6=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	69
;iic.c: 69: RB6=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(54/8),(54)&7
	line	70
	
l12804:	
;iic.c: 70: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	71
	
l12806:	
;iic.c: 71: RB7=1;
	bsf	(55/8),(55)&7
	line	72
;iic.c: 72: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	73
	
l12808:	
;iic.c: 73: RB7=0;
	bcf	(55/8),(55)&7
	line	74
	
l12810:	
;iic.c: 74: RB6=1;
	bsf	(54/8),(54)&7
	line	75
	
l9057:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_ACK1
	__end_of_IIC_ACK1:
;; =============== function _IIC_ACK1 ends ============

	signat	_IIC_ACK1,88
	global	_Convert_Duty_Cycle2
psect	text1869,local,class=CODE,delta=2
global __ptext1869
__ptext1869:

;; *************** function _Convert_Duty_Cycle2 *****************
;; Defined at:
;;		line 213 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
;; Parameters:    Size  Location     Type
;;  Brightness      1    wreg     unsigned char 
;;  Color_Temp      1    3[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  Brightness      1    6[BANK0 ] unsigned char 
;;  temp            2    7[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    3[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       3       0
;;      Temps:          0       1       0
;;      Totals:         0       6       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___wmul
;;		___lwdiv
;; This function is called by:
;;		_LED_Dimming
;; This function uses a non-reentrant model
;;
psect	text1869
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
	line	213
	global	__size_of_Convert_Duty_Cycle2
	__size_of_Convert_Duty_Cycle2	equ	__end_of_Convert_Duty_Cycle2-_Convert_Duty_Cycle2
	
_Convert_Duty_Cycle2:	
	opt	stack 3
; Regs used in _Convert_Duty_Cycle2: [wreg+status,2+status,0+pclath+cstack]
;Convert_Duty_Cycle2@Brightness stored from wreg
	movwf	(Convert_Duty_Cycle2@Brightness)
	line	214
	
l12784:	
	line	215
	
l12786:	
;recive.c: 215: temp = Brightness * (100 - Color_Temp);
	movf	(Convert_Duty_Cycle2@Brightness),w
	movwf	(?___wmul)
	clrf	(?___wmul+1)
	movlw	064h
	movwf	(??_Convert_Duty_Cycle2+0)+0
	movf	(Convert_Duty_Cycle2@Color_Temp),w
	subwf	(??_Convert_Duty_Cycle2+0)+0,w
	movwf	0+(?___wmul)+02h
	clrf	0+(?___wmul)+02h+1
	skipc
	decf	1+0+(?___wmul)+02h,f
	
	fcall	___wmul
	movf	(1+(?___wmul)),w
	movwf	(Convert_Duty_Cycle2@temp+1)
	movf	(0+(?___wmul)),w
	movwf	(Convert_Duty_Cycle2@temp)
	line	216
	
l12788:	
;recive.c: 216: temp /= 100;
	movlw	064h
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	movf	(Convert_Duty_Cycle2@temp+1),w
	movwf	1+(?___lwdiv)+02h
	movf	(Convert_Duty_Cycle2@temp),w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	(Convert_Duty_Cycle2@temp+1)
	movf	(0+(?___lwdiv)),w
	movwf	(Convert_Duty_Cycle2@temp)
	line	217
	
l12790:	
;recive.c: 217: temp *= 255;
	movlw	0FFh
	movwf	(?___wmul)
	clrf	(?___wmul+1)
	movf	(Convert_Duty_Cycle2@temp+1),w
	movwf	1+(?___wmul)+02h
	movf	(Convert_Duty_Cycle2@temp),w
	movwf	0+(?___wmul)+02h
	fcall	___wmul
	movf	(1+(?___wmul)),w
	movwf	(Convert_Duty_Cycle2@temp+1)
	movf	(0+(?___wmul)),w
	movwf	(Convert_Duty_Cycle2@temp)
	line	218
	
l12792:	
;recive.c: 218: temp /= 100;
	movlw	064h
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	movf	(Convert_Duty_Cycle2@temp+1),w
	movwf	1+(?___lwdiv)+02h
	movf	(Convert_Duty_Cycle2@temp),w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	(Convert_Duty_Cycle2@temp+1)
	movf	(0+(?___lwdiv)),w
	movwf	(Convert_Duty_Cycle2@temp)
	line	219
	
l12794:	
;recive.c: 219: if(temp >= 250)
	movlw	high(0FAh)
	subwf	(Convert_Duty_Cycle2@temp+1),w
	movlw	low(0FAh)
	skipnz
	subwf	(Convert_Duty_Cycle2@temp),w
	skipc
	goto	u2851
	goto	u2850
u2851:
	goto	l8370
u2850:
	line	221
	
l12796:	
;recive.c: 220: {
;recive.c: 221: temp = 250;
	movlw	0FAh
	movwf	(Convert_Duty_Cycle2@temp)
	clrf	(Convert_Duty_Cycle2@temp+1)
	line	222
	
l8370:	
	line	223
;recive.c: 222: }
;recive.c: 223: if(temp <= 2)
	movlw	high(03h)
	subwf	(Convert_Duty_Cycle2@temp+1),w
	movlw	low(03h)
	skipnz
	subwf	(Convert_Duty_Cycle2@temp),w
	skipnc
	goto	u2861
	goto	u2860
u2861:
	goto	l8371
u2860:
	line	225
	
l12798:	
;recive.c: 224: {
;recive.c: 225: temp = 2;
	movlw	02h
	movwf	(Convert_Duty_Cycle2@temp)
	clrf	(Convert_Duty_Cycle2@temp+1)
	line	226
	
l8371:	
	line	227
;recive.c: 226: }
;recive.c: 227: return temp;
	movf	(Convert_Duty_Cycle2@temp+1),w
	movwf	(?_Convert_Duty_Cycle2+1)
	movf	(Convert_Duty_Cycle2@temp),w
	movwf	(?_Convert_Duty_Cycle2)
	line	228
	
l8372:	
	return
	opt stack 0
GLOBAL	__end_of_Convert_Duty_Cycle2
	__end_of_Convert_Duty_Cycle2:
;; =============== function _Convert_Duty_Cycle2 ends ============

	signat	_Convert_Duty_Cycle2,8314
	global	_Convert_Duty_Cycle1
psect	text1870,local,class=CODE,delta=2
global __ptext1870
__ptext1870:

;; *************** function _Convert_Duty_Cycle1 *****************
;; Defined at:
;;		line 195 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
;; Parameters:    Size  Location     Type
;;  Brightness      1    wreg     unsigned char 
;;  Color_Temp      1    3[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  Brightness      1    5[BANK0 ] unsigned char 
;;  temp            2    6[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    3[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       3       0
;;      Temps:          0       0       0
;;      Totals:         0       5       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___wmul
;;		___lwdiv
;; This function is called by:
;;		_LED_Dimming
;; This function uses a non-reentrant model
;;
psect	text1870
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
	line	195
	global	__size_of_Convert_Duty_Cycle1
	__size_of_Convert_Duty_Cycle1	equ	__end_of_Convert_Duty_Cycle1-_Convert_Duty_Cycle1
	
_Convert_Duty_Cycle1:	
	opt	stack 3
; Regs used in _Convert_Duty_Cycle1: [wreg+status,2+status,0+pclath+cstack]
;Convert_Duty_Cycle1@Brightness stored from wreg
	movwf	(Convert_Duty_Cycle1@Brightness)
	line	196
	
l12766:	
	line	197
	
l12768:	
;recive.c: 197: temp = Brightness * Color_Temp;
	movf	(Convert_Duty_Cycle1@Brightness),w
	movwf	(?___wmul)
	clrf	(?___wmul+1)
	movf	(Convert_Duty_Cycle1@Color_Temp),w
	movwf	0+(?___wmul)+02h
	clrf	1+(?___wmul)+02h
	fcall	___wmul
	movf	(1+(?___wmul)),w
	movwf	(Convert_Duty_Cycle1@temp+1)
	movf	(0+(?___wmul)),w
	movwf	(Convert_Duty_Cycle1@temp)
	line	198
	
l12770:	
;recive.c: 198: temp /= 100;
	movlw	064h
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	movf	(Convert_Duty_Cycle1@temp+1),w
	movwf	1+(?___lwdiv)+02h
	movf	(Convert_Duty_Cycle1@temp),w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	(Convert_Duty_Cycle1@temp+1)
	movf	(0+(?___lwdiv)),w
	movwf	(Convert_Duty_Cycle1@temp)
	line	199
	
l12772:	
;recive.c: 199: temp *= 255;
	movlw	0FFh
	movwf	(?___wmul)
	clrf	(?___wmul+1)
	movf	(Convert_Duty_Cycle1@temp+1),w
	movwf	1+(?___wmul)+02h
	movf	(Convert_Duty_Cycle1@temp),w
	movwf	0+(?___wmul)+02h
	fcall	___wmul
	movf	(1+(?___wmul)),w
	movwf	(Convert_Duty_Cycle1@temp+1)
	movf	(0+(?___wmul)),w
	movwf	(Convert_Duty_Cycle1@temp)
	line	200
	
l12774:	
;recive.c: 200: temp /= 100;
	movlw	064h
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	movf	(Convert_Duty_Cycle1@temp+1),w
	movwf	1+(?___lwdiv)+02h
	movf	(Convert_Duty_Cycle1@temp),w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	(Convert_Duty_Cycle1@temp+1)
	movf	(0+(?___lwdiv)),w
	movwf	(Convert_Duty_Cycle1@temp)
	line	201
	
l12776:	
;recive.c: 201: if(temp >= 250)
	movlw	high(0FAh)
	subwf	(Convert_Duty_Cycle1@temp+1),w
	movlw	low(0FAh)
	skipnz
	subwf	(Convert_Duty_Cycle1@temp),w
	skipc
	goto	u2831
	goto	u2830
u2831:
	goto	l8365
u2830:
	line	203
	
l12778:	
;recive.c: 202: {
;recive.c: 203: temp = 250;
	movlw	0FAh
	movwf	(Convert_Duty_Cycle1@temp)
	clrf	(Convert_Duty_Cycle1@temp+1)
	line	204
	
l8365:	
	line	205
;recive.c: 204: }
;recive.c: 205: if(temp <= 2)
	movlw	high(03h)
	subwf	(Convert_Duty_Cycle1@temp+1),w
	movlw	low(03h)
	skipnz
	subwf	(Convert_Duty_Cycle1@temp),w
	skipnc
	goto	u2841
	goto	u2840
u2841:
	goto	l8366
u2840:
	line	207
	
l12780:	
;recive.c: 206: {
;recive.c: 207: temp = 2;
	movlw	02h
	movwf	(Convert_Duty_Cycle1@temp)
	clrf	(Convert_Duty_Cycle1@temp+1)
	line	208
	
l8366:	
	line	209
;recive.c: 208: }
;recive.c: 209: return temp;
	movf	(Convert_Duty_Cycle1@temp+1),w
	movwf	(?_Convert_Duty_Cycle1+1)
	movf	(Convert_Duty_Cycle1@temp),w
	movwf	(?_Convert_Duty_Cycle1)
	line	210
	
l8367:	
	return
	opt stack 0
GLOBAL	__end_of_Convert_Duty_Cycle1
	__end_of_Convert_Duty_Cycle1:
;; =============== function _Convert_Duty_Cycle1 ends ============

	signat	_Convert_Duty_Cycle1,8314
	global	_Buffer_VaryFun
psect	text1871,local,class=CODE,delta=2
global __ptext1871
__ptext1871:

;; *************** function _Buffer_VaryFun *****************
;; Defined at:
;;		line 548 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\Key.c"
;; Parameters:    Size  Location     Type
;;  n               1    wreg     unsigned char 
;;  dat             2    4[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  n               1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_PWM_LED1
;;		_PWM_LED2
;; This function is called by:
;;		_BufRuning
;; This function uses a non-reentrant model
;;
psect	text1871
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\Key.c"
	line	548
	global	__size_of_Buffer_VaryFun
	__size_of_Buffer_VaryFun	equ	__end_of_Buffer_VaryFun-_Buffer_VaryFun
	
_Buffer_VaryFun:	
	opt	stack 2
; Regs used in _Buffer_VaryFun: [wreg+status,2+status,0+pclath+cstack]
;Buffer_VaryFun@n stored from wreg
	movwf	(Buffer_VaryFun@n)
	line	549
	
l12756:	
;Key.c: 549: if(n==0)
	movf	(Buffer_VaryFun@n),f
	skipz
	goto	u2821
	goto	u2820
u2821:
	goto	l12762
u2820:
	line	551
	
l12758:	
;Key.c: 550: {
;Key.c: 551: LEDR1_Vol=dat;
	movf	(Buffer_VaryFun@dat),w
	movwf	(_LEDR1_Vol)
	line	552
	
l12760:	
;Key.c: 552: PWM_LED1(LEDR1_Vol);
	movf	(_LEDR1_Vol),w
	fcall	_PWM_LED1
	line	553
;Key.c: 553: }
	goto	l6355
	line	556
	
l12762:	
;Key.c: 554: else
;Key.c: 555: {
;Key.c: 556: LEDR2_Vol=dat;
	movf	(Buffer_VaryFun@dat),w
	movwf	(_LEDR2_Vol)
	line	557
	
l12764:	
;Key.c: 557: PWM_LED2(LEDR2_Vol);
	movf	(_LEDR2_Vol),w
	fcall	_PWM_LED2
	line	559
	
l6355:	
	return
	opt stack 0
GLOBAL	__end_of_Buffer_VaryFun
	__end_of_Buffer_VaryFun:
;; =============== function _Buffer_VaryFun ends ============

	signat	_Buffer_VaryFun,8312
	global	_LEDCon_Chg
psect	text1872,local,class=CODE,delta=2
global __ptext1872
__ptext1872:

;; *************** function _LEDCon_Chg *****************
;; Defined at:
;;		line 65 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\Key.c"
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
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_PWM_LED1
;;		_PWM_LED2
;;		_SetRunEn
;; This function is called by:
;;		_Key_Handle
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1872
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\Key.c"
	line	65
	global	__size_of_LEDCon_Chg
	__size_of_LEDCon_Chg	equ	__end_of_LEDCon_Chg-_LEDCon_Chg
	
_LEDCon_Chg:	
	opt	stack 4
; Regs used in _LEDCon_Chg: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	66
	
l12720:	
;Key.c: 66: switch(LED_Chg_Cnt)
	goto	l12744
	line	68
	
l12722:	
	movlw	(0FAh)
	movwf	(_LEDR1_Vol)
	
l12724:	
	clrf	(_LEDR2_Vol)
	goto	l12746
	line	69
	
l12726:	
	clrf	(_LEDR1_Vol)
	
l12728:	
	movlw	(0FAh)
	movwf	(_LEDR2_Vol)
	goto	l12746
	line	70
	
l12730:	
	movlw	(0FAh)
	movwf	(_LEDR1_Vol)
	movlw	(0FAh)
	movwf	(_LEDR2_Vol)
	goto	l12746
	line	71
	
l12732:	
	movlw	(02h)
	movwf	(_LEDR1_Vol)
	movlw	(02h)
	movwf	(_LEDR2_Vol)
	goto	l12746
	line	73
	
l12734:	
	movlw	(02h)
	movwf	(_LEDR1_Vol)
	goto	l12724
	line	74
	
l12738:	
	clrf	(_LEDR1_Vol)
	
l12740:	
	movlw	(02h)
	movwf	(_LEDR2_Vol)
	goto	l12746
	line	66
	
l12744:	
	movf	(_LED_Chg_Cnt),w
	; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 0 to 5
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           19     7 (fixed)
; simple_byte           19    10 (average)
; jumptable            260     6 (fixed)
; rangetable            10     6 (fixed)
; spacedrange           18     9 (fixed)
; locatedrange           6     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	6
	subwf	fsr,w
skipnc
goto l12746
movlw high(S14370)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S14370)
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S14370:
	ljmp	l12722
	ljmp	l12726
	ljmp	l12730
	ljmp	l12732
	ljmp	l12734
	ljmp	l12738
psect	text1872

	line	77
	
l12746:	
;Key.c: 77: PWM_LED1(LEDR1_Vol); PWM_LED2(LEDR2_Vol);
	movf	(_LEDR1_Vol),w
	fcall	_PWM_LED1
	movf	(_LEDR2_Vol),w
	fcall	_PWM_LED2
	line	78
	
l12748:	
;Key.c: 78: SetRunEn(0,1,LEDR1_Vol);
	clrf	(?_SetRunEn)
	incf	(?_SetRunEn),f
	movf	(_LEDR1_Vol),w
	movwf	0+(?_SetRunEn)+01h
	clrf	1+(?_SetRunEn)+01h
	movlw	(0)
	fcall	_SetRunEn
	line	79
	
l12750:	
;Key.c: 79: SetRunEn(1,1,LEDR2_Vol);
	clrf	(?_SetRunEn)
	incf	(?_SetRunEn),f
	movf	(_LEDR2_Vol),w
	movwf	0+(?_SetRunEn)+01h
	clrf	1+(?_SetRunEn)+01h
	movlw	(01h)
	fcall	_SetRunEn
	line	80
	
l6205:	
	return
	opt stack 0
GLOBAL	__end_of_LEDCon_Chg
	__end_of_LEDCon_Chg:
;; =============== function _LEDCon_Chg ends ============

	signat	_LEDCon_Chg,88
	global	_Pair_LED
psect	text1873,local,class=CODE,delta=2
global __ptext1873
__ptext1873:

;; *************** function _Pair_LED *****************
;; Defined at:
;;		line 52 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\Key.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    4[BANK0 ] unsigned char 
;;  k               1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_CCP1_set_duty_cycle
;;		_CCP2_set_duty_cycle
;;		_soft_delay_ms
;;		_WDT_clear
;; This function is called by:
;;		_Key_Handle
;;		_Remote_Pairing
;; This function uses a non-reentrant model
;;
psect	text1873
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\Key.c"
	line	52
	global	__size_of_Pair_LED
	__size_of_Pair_LED	equ	__end_of_Pair_LED-_Pair_LED
	
_Pair_LED:	
	opt	stack 3
; Regs used in _Pair_LED: [wreg+status,2+status,0+pclath+cstack]
	line	54
	
l12678:	
;Key.c: 53: unsigned char k;
;Key.c: 54: for(unsigned char i=0;i<4;i++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Pair_LED@i)
	line	56
	
l12684:	
;Key.c: 55: {
;Key.c: 56: CCP1_set_duty_cycle(250); CCP2_set_duty_cycle(250);
	movlw	0FAh
	movwf	(?_CCP1_set_duty_cycle)
	clrf	(?_CCP1_set_duty_cycle+1)
	fcall	_CCP1_set_duty_cycle
	movlw	0FAh
	movwf	(?_CCP2_set_duty_cycle)
	clrf	(?_CCP2_set_duty_cycle+1)
	fcall	_CCP2_set_duty_cycle
	line	57
	
l12686:	
;Key.c: 57: for(k=0;k<120;k++){ soft_delay_ms(1); WDT_clear();};
	clrf	(Pair_LED@k)
	
l12692:	
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	
l12694:	
	fcall	_WDT_clear
	
l12696:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Pair_LED@k),f
	
l12698:	
	movlw	(078h)
	subwf	(Pair_LED@k),w
	skipc
	goto	u2791
	goto	u2790
u2791:
	goto	l12692
u2790:
	line	58
	
l12700:	
;Key.c: 58: CCP1_set_duty_cycle(0); CCP2_set_duty_cycle(0);
	clrf	(?_CCP1_set_duty_cycle)
	clrf	(?_CCP1_set_duty_cycle+1)
	fcall	_CCP1_set_duty_cycle
	clrf	(?_CCP2_set_duty_cycle)
	clrf	(?_CCP2_set_duty_cycle+1)
	fcall	_CCP2_set_duty_cycle
	line	59
	
l12702:	
;Key.c: 59: for(k=0;k<120;k++){ soft_delay_ms(1); WDT_clear();};
	clrf	(Pair_LED@k)
	
l12708:	
	clrf	(?_soft_delay_ms)
	incf	(?_soft_delay_ms),f
	clrf	(?_soft_delay_ms+1)
	fcall	_soft_delay_ms
	
l12710:	
	fcall	_WDT_clear
	
l12712:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Pair_LED@k),f
	
l12714:	
	movlw	(078h)
	subwf	(Pair_LED@k),w
	skipc
	goto	u2801
	goto	u2800
u2801:
	goto	l12708
u2800:
	line	54
	
l12716:	
	incf	(Pair_LED@i),f
	
l12718:	
	movlw	(04h)
	subwf	(Pair_LED@i),w
	skipc
	goto	u2811
	goto	u2810
u2811:
	goto	l12684
u2810:
	line	61
	
l6194:	
	return
	opt stack 0
GLOBAL	__end_of_Pair_LED
	__end_of_Pair_LED:
;; =============== function _Pair_LED ends ============

	signat	_Pair_LED,88
	global	_IIC_Rbyte
psect	text1874,local,class=CODE,delta=2
global __ptext1874
__ptext1874:

;; *************** function _IIC_Rbyte *****************
;; Defined at:
;;		line 193 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    2[BANK0 ] unsigned char 
;;  k               1    1[BANK0 ] unsigned char 
;;  temp            1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       3       0
;;      Temps:          1       0       0
;;      Totals:         1       3       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_IIC_delay
;; This function is called by:
;;		_IIC_ReceByte
;; This function uses a non-reentrant model
;;
psect	text1874
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
	line	193
	global	__size_of_IIC_Rbyte
	__size_of_IIC_Rbyte	equ	__end_of_IIC_Rbyte-_IIC_Rbyte
	
_IIC_Rbyte:	
	opt	stack 1
; Regs used in _IIC_Rbyte: [wreg+status,2+status,0+pclath+cstack]
	line	195
	
l12650:	
;I2C_Base.c: 194: unsigned char i;
;I2C_Base.c: 195: unsigned char temp=0;
	clrf	(IIC_Rbyte@temp)
	line	199
	
l12652:	
;I2C_Base.c: 199: RB6=1;
	bsf	(54/8),(54)&7
	line	200
	
l12654:	
;I2C_Base.c: 200: {WPUB6=1; TRISB6=1;};
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1198/8)^080h,(1198)&7
	
l12656:	
	bsf	(1078/8)^080h,(1078)&7
	line	202
;I2C_Base.c: 202: for(i=0;i<8;i++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(IIC_Rbyte@i)
	line	203
	
l5405:	
	line	204
;I2C_Base.c: 203: {
;I2C_Base.c: 204: RB7=0; IIC_delay(Dtime);
	bcf	(55/8),(55)&7
	
l12662:	
	movf	(_Dtime),w
	fcall	_IIC_delay
	line	205
	
l12664:	
;I2C_Base.c: 205: RB7=1; IIC_delay(Dtime/2);
	bsf	(55/8),(55)&7
	clrc
	rrf	(_Dtime),w
	fcall	_IIC_delay
	line	207
;I2C_Base.c: 207: IIC_delay(Dtime/2);
	clrc
	rrf	(_Dtime),w
	fcall	_IIC_delay
	line	208
	
l12666:	
;I2C_Base.c: 208: k=RB6;
	movlw	0
	btfsc	(54/8),(54)&7
	movlw	1
	movwf	(IIC_Rbyte@k)
	line	209
	
l12668:	
;I2C_Base.c: 209: temp|=((k)?(1):(0))<<(7-i);
	movlw	0
	movf	(IIC_Rbyte@k),f
	skipz
	movlw	1
	movwf	(??_IIC_Rbyte+0)+0
	movf	(IIC_Rbyte@i),w
	sublw	07h
	addlw	1
	goto	u2774
u2775:
	clrc
	rlf	(??_IIC_Rbyte+0)+0,f
u2774:
	addlw	-1
	skipz
	goto	u2775
	movf	0+(??_IIC_Rbyte+0)+0,w
	iorwf	(IIC_Rbyte@temp),f
	line	210
	
l12670:	
;I2C_Base.c: 210: IIC_delay(Dtime/2);
	clrc
	rrf	(_Dtime),w
	fcall	_IIC_delay
	line	202
	incf	(IIC_Rbyte@i),f
	
l12672:	
	movlw	(08h)
	subwf	(IIC_Rbyte@i),w
	skipc
	goto	u2781
	goto	u2780
u2781:
	goto	l5405
u2780:
	line	212
	
l12674:	
;I2C_Base.c: 211: }
;I2C_Base.c: 212: return(temp);
	movf	(IIC_Rbyte@temp),w
	line	213
	
l5407:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_Rbyte
	__end_of_IIC_Rbyte:
;; =============== function _IIC_Rbyte ends ============

	signat	_IIC_Rbyte,89
	global	_IIC_Wbyte
psect	text1875,local,class=CODE,delta=2
global __ptext1875
__ptext1875:

;; *************** function _IIC_Wbyte *****************
;; Defined at:
;;		line 160 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
;; Parameters:    Size  Location     Type
;;  Wdat            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Wdat            1    0[BANK0 ] unsigned char 
;;  i               1    1[BANK0 ] unsigned char 
;;  k               1    0        unsigned char 
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
;;      Temps:          1       0       0
;;      Totals:         1       2       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_IIC_delay
;; This function is called by:
;;		_IIC_ReceByte
;;		_IIC_SendByte
;;		_IIC_CheckBusy
;; This function uses a non-reentrant model
;;
psect	text1875
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
	line	160
	global	__size_of_IIC_Wbyte
	__size_of_IIC_Wbyte	equ	__end_of_IIC_Wbyte-_IIC_Wbyte
	
_IIC_Wbyte:	
	opt	stack 0
; Regs used in _IIC_Wbyte: [wreg+status,2+status,0+pclath+cstack]
;IIC_Wbyte@Wdat stored from wreg
	movwf	(IIC_Wbyte@Wdat)
	line	163
	
l12624:	
	line	165
	
l12626:	
;I2C_Base.c: 165: TRISB6=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	167
;I2C_Base.c: 167: for(i=0;i<8;i++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(IIC_Wbyte@i)
	line	168
	
l5398:	
	line	169
;I2C_Base.c: 168: {
;I2C_Base.c: 169: RB7=0;
	bcf	(55/8),(55)&7
	line	170
	
l12632:	
;I2C_Base.c: 170: IIC_delay(Dtime/2);
	clrc
	rrf	(_Dtime),w
	fcall	_IIC_delay
	line	172
	
l12634:	
;I2C_Base.c: 172: if((Wdat&(1<<(7-i)))?(1):(0))
	movlw	(01h)
	movwf	(??_IIC_Wbyte+0)+0
	movf	(IIC_Wbyte@i),w
	sublw	07h
	addlw	1
	goto	u2744
u2745:
	clrc
	rlf	(??_IIC_Wbyte+0)+0,f
u2744:
	addlw	-1
	skipz
	goto	u2745
	movf	0+(??_IIC_Wbyte+0)+0,w
	andwf	(IIC_Wbyte@Wdat),w
	btfsc	status,2
	goto	u2751
	goto	u2750
u2751:
	goto	l5400
u2750:
	line	173
	
l12636:	
;I2C_Base.c: 173: RB6=1;
	bsf	(54/8),(54)&7
	goto	l12638
	line	174
	
l5400:	
	line	175
;I2C_Base.c: 174: else
;I2C_Base.c: 175: RB6=0;
	bcf	(54/8),(54)&7
	line	178
	
l12638:	
;I2C_Base.c: 178: IIC_delay(Dtime/2);
	clrc
	rrf	(_Dtime),w
	fcall	_IIC_delay
	line	179
	
l12640:	
;I2C_Base.c: 179: RB7=1; IIC_delay(Dtime/2);
	bsf	(55/8),(55)&7
	clrc
	rrf	(_Dtime),w
	fcall	_IIC_delay
	line	182
;I2C_Base.c: 182: IIC_delay(Dtime/2);
	clrc
	rrf	(_Dtime),w
	fcall	_IIC_delay
	line	167
	
l12642:	
	incf	(IIC_Wbyte@i),f
	
l12644:	
	movlw	(08h)
	subwf	(IIC_Wbyte@i),w
	skipc
	goto	u2761
	goto	u2760
u2761:
	goto	l5398
u2760:
	line	184
	
l12646:	
;I2C_Base.c: 183: }
;I2C_Base.c: 184: return(0);
	movlw	(0)
	line	185
	
l5402:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_Wbyte
	__end_of_IIC_Wbyte:
;; =============== function _IIC_Wbyte ends ============

	signat	_IIC_Wbyte,4217
	global	_IIC_WACK
psect	text1876,local,class=CODE,delta=2
global __ptext1876
__ptext1876:

;; *************** function _IIC_WACK *****************
;; Defined at:
;;		line 128 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
;; Parameters:    Size  Location     Type
;;  ACK             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ACK             1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/20
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          1       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_IIC_delay
;; This function is called by:
;;		_IIC_ReceByte
;; This function uses a non-reentrant model
;;
psect	text1876
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
	line	128
	global	__size_of_IIC_WACK
	__size_of_IIC_WACK	equ	__end_of_IIC_WACK-_IIC_WACK
	
_IIC_WACK:	
	opt	stack 1
; Regs used in _IIC_WACK: [wreg+status,2+status,0+pclath+cstack]
;IIC_WACK@ACK stored from wreg
	line	131
	movwf	(IIC_WACK@ACK)
	
l12598:	
;I2C_Base.c: 131: RB7=0; IIC_delay(Dtime/2);
	bcf	(55/8),(55)&7
	
l12600:	
	clrc
	rrf	(_Dtime),w
	fcall	_IIC_delay
	line	133
	
l12602:	
;I2C_Base.c: 133: TRISB6=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	134
	
l12604:	
;I2C_Base.c: 134: if(ACK)
	movf	(IIC_WACK@ACK),w
	skipz
	goto	u2730
	goto	l5393
u2730:
	line	135
	
l12606:	
;I2C_Base.c: 135: RB6=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7
	goto	l12608
	line	136
	
l5393:	
	line	137
;I2C_Base.c: 136: else
;I2C_Base.c: 137: RB6=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(54/8),(54)&7
	line	139
	
l12608:	
;I2C_Base.c: 139: IIC_delay(Dtime/2);
	clrc
	rrf	(_Dtime),w
	fcall	_IIC_delay
	line	140
	
l12610:	
;I2C_Base.c: 140: RB7=1; IIC_delay(Dtime/2);
	bsf	(55/8),(55)&7
	clrc
	rrf	(_Dtime),w
	fcall	_IIC_delay
	line	142
;I2C_Base.c: 142: IIC_delay(Dtime);
	movf	(_Dtime),w
	fcall	_IIC_delay
	line	145
	
l12612:	
;I2C_Base.c: 145: RB7=0; IIC_delay(Dtime/4);
	bcf	(55/8),(55)&7
	movf	(_Dtime),w
	movwf	(??_IIC_WACK+0)+0
	clrc
	rrf	(??_IIC_WACK+0)+0,f
	clrc
	rrf	(??_IIC_WACK+0)+0,f
	movf	0+(??_IIC_WACK+0)+0,w
	fcall	_IIC_delay
	line	147
	
l12614:	
;I2C_Base.c: 147: RB6=1;
	bsf	(54/8),(54)&7
	line	148
	
l12616:	
;I2C_Base.c: 148: {WPUB6=1; TRISB6=1;};
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1198/8)^080h,(1198)&7
	
l12618:	
	bsf	(1078/8)^080h,(1078)&7
	line	149
	
l12620:	
;I2C_Base.c: 149: return(0);
	movlw	(0)
	line	150
	
l5395:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_WACK
	__end_of_IIC_WACK:
;; =============== function _IIC_WACK ends ============

	signat	_IIC_WACK,4217
	global	_IIC_RACK
psect	text1877,local,class=CODE,delta=2
global __ptext1877
__ptext1877:

;; *************** function _IIC_RACK *****************
;; Defined at:
;;		line 97 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf             5    0[BANK0 ] unsigned char [5]
;;  i               1    6[BANK0 ] unsigned char 
;;  k               1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       7       0
;;      Temps:          0       0       0
;;      Totals:         0       7       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_IIC_delay
;;		___lbdiv
;; This function is called by:
;;		_IIC_ReceByte
;;		_IIC_SendByte
;;		_IIC_CheckBusy
;; This function uses a non-reentrant model
;;
psect	text1877
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
	line	97
	global	__size_of_IIC_RACK
	__size_of_IIC_RACK	equ	__end_of_IIC_RACK-_IIC_RACK
	
_IIC_RACK:	
	opt	stack 0
; Regs used in _IIC_RACK: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	99
	
l12542:	
	clrf	(IIC_RACK@k)
	line	104
	
l12544:	
;I2C_Base.c: 104: RB7=0; IIC_delay(Dtime);
	bcf	(55/8),(55)&7
	
l12546:	
	movf	(_Dtime),w
	fcall	_IIC_delay
	line	106
	
l12548:	
;I2C_Base.c: 106: {WPUB6=1; TRISB6=1;};
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1198/8)^080h,(1198)&7
	
l12550:	
	bsf	(1078/8)^080h,(1078)&7
	line	107
	
l12552:	
;I2C_Base.c: 107: RB6=1; IIC_delay(Dtime/2);
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7
	
l12554:	
	clrc
	rrf	(_Dtime),w
	fcall	_IIC_delay
	line	109
	
l12556:	
;I2C_Base.c: 109: RB7=1; IIC_delay(Dtime/3);
	bsf	(55/8),(55)&7
	
l12558:	
	movlw	(03h)
	movwf	(?___lbdiv)
	movf	(_Dtime),w
	fcall	___lbdiv
	fcall	_IIC_delay
	line	111
	
l12560:	
;I2C_Base.c: 111: IIC_delay(Dtime/3);
	movlw	(03h)
	movwf	(?___lbdiv)
	movf	(_Dtime),w
	fcall	___lbdiv
	fcall	_IIC_delay
	line	113
;I2C_Base.c: 113: for(i=0;i<5;i++) buf[i]=RB6;
	clrf	(IIC_RACK@i)
	
l12566:	
	movf	(IIC_RACK@i),w
	addlw	IIC_RACK@buf&0ffh
	movwf	fsr0
	movlw	0
	btfsc	(54/8),(54)&7
	movlw	1
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l12568:	
	incf	(IIC_RACK@i),f
	
l12570:	
	movlw	(05h)
	subwf	(IIC_RACK@i),w
	skipc
	goto	u2691
	goto	u2690
u2691:
	goto	l12566
u2690:
	line	114
	
l12572:	
;I2C_Base.c: 114: k=0;
	clrf	(IIC_RACK@k)
	line	115
;I2C_Base.c: 115: for(i=0;i<5;i++) {if(buf[i]!=0)k++; if(k>3) return(1);}
	clrf	(IIC_RACK@i)
	
l12578:	
	movf	(IIC_RACK@i),w
	addlw	IIC_RACK@buf&0ffh
	movwf	fsr0
	movf	indf
	skipnz
	goto	u2701
	goto	u2700
u2701:
	goto	l12582
u2700:
	
l12580:	
	incf	(IIC_RACK@k),f
	
l12582:	
	movlw	(04h)
	subwf	(IIC_RACK@k),w
	skipc
	goto	u2711
	goto	u2710
u2711:
	goto	l12588
u2710:
	
l12584:	
	movlw	(01h)
	goto	l5390
	
l12588:	
	incf	(IIC_RACK@i),f
	
l12590:	
	movlw	(05h)
	subwf	(IIC_RACK@i),w
	skipc
	goto	u2721
	goto	u2720
u2721:
	goto	l12578
u2720:
	line	117
	
l12592:	
;I2C_Base.c: 117: IIC_delay(Dtime/3);
	movlw	(03h)
	movwf	(?___lbdiv)
	movf	(_Dtime),w
	fcall	___lbdiv
	fcall	_IIC_delay
	line	118
	
l12594:	
;I2C_Base.c: 118: return(0);
	movlw	(0)
	line	119
	
l5390:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_RACK
	__end_of_IIC_RACK:
;; =============== function _IIC_RACK ends ============

	signat	_IIC_RACK,89
	global	_IIC_stop
psect	text1878,local,class=CODE,delta=2
global __ptext1878
__ptext1878:

;; *************** function _IIC_stop *****************
;; Defined at:
;;		line 72 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  k               1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 140/20
;;		On exit  : 160/20
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_IIC_delay
;; This function is called by:
;;		_IIC_ReceByte
;;		_IIC_SendByte
;; This function uses a non-reentrant model
;;
psect	text1878
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
	line	72
	global	__size_of_IIC_stop
	__size_of_IIC_stop	equ	__end_of_IIC_stop-_IIC_stop
	
_IIC_stop:	
	opt	stack 1
; Regs used in _IIC_stop: [wreg+status,2+status,0+pclath+cstack]
	line	75
	
l12522:	
;I2C_Base.c: 75: RB7=0; IIC_delay(Dtime/2);
	bcf	status, 5	;RP0=0, select bank0
	bcf	(55/8),(55)&7
	
l12524:	
	clrc
	rrf	(_Dtime),w
	fcall	_IIC_delay
	line	77
	
l12526:	
;I2C_Base.c: 77: TRISB6=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	78
	
l12528:	
;I2C_Base.c: 78: RB6=0; IIC_delay(Dtime/2);
	bcf	status, 5	;RP0=0, select bank0
	bcf	(54/8),(54)&7
	clrc
	rrf	(_Dtime),w
	fcall	_IIC_delay
	line	79
	
l12530:	
;I2C_Base.c: 79: RB7=1; IIC_delay(Dtime/2);
	bsf	(55/8),(55)&7
	clrc
	rrf	(_Dtime),w
	fcall	_IIC_delay
	line	81
;I2C_Base.c: 81: IIC_delay(Dtime);
	movf	(_Dtime),w
	fcall	_IIC_delay
	line	82
	
l12532:	
;I2C_Base.c: 82: RB6=1; IIC_delay(Dtime);
	bsf	(54/8),(54)&7
	movf	(_Dtime),w
	fcall	_IIC_delay
	line	85
	
l12534:	
;I2C_Base.c: 85: {WPUB6=1; TRISB6=1;};
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1198/8)^080h,(1198)&7
	
l12536:	
	bsf	(1078/8)^080h,(1078)&7
	line	86
	
l12538:	
;I2C_Base.c: 86: return(0);
	movlw	(0)
	line	87
	
l5381:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_stop
	__end_of_IIC_stop:
;; =============== function _IIC_stop ends ============

	signat	_IIC_stop,89
	global	_IIC_start
psect	text1879,local,class=CODE,delta=2
global __ptext1879
__ptext1879:

;; *************** function _IIC_start *****************
;; Defined at:
;;		line 48 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  k               1    0        unsigned char 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_IIC_delay
;; This function is called by:
;;		_IIC_ReceByte
;;		_IIC_SendByte
;;		_IIC_CheckBusy
;; This function uses a non-reentrant model
;;
psect	text1879
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
	line	48
	global	__size_of_IIC_start
	__size_of_IIC_start	equ	__end_of_IIC_start-_IIC_start
	
_IIC_start:	
	opt	stack 0
; Regs used in _IIC_start: [wreg+status,2+status,0+pclath+cstack]
	line	53
	
l12510:	
;I2C_Base.c: 53: RB7=0;
	bcf	(55/8),(55)&7
	line	55
;I2C_Base.c: 55: TRISB6=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	56
;I2C_Base.c: 56: RB6=1; IIC_delay(Dtime/2);
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7
	
l12512:	
	clrc
	rrf	(_Dtime),w
	fcall	_IIC_delay
	line	58
	
l12514:	
;I2C_Base.c: 58: RB7=1; IIC_delay(Dtime/2);
	bsf	(55/8),(55)&7
	clrc
	rrf	(_Dtime),w
	fcall	_IIC_delay
	line	60
;I2C_Base.c: 60: IIC_delay(Dtime/2);
	clrc
	rrf	(_Dtime),w
	fcall	_IIC_delay
	line	61
	
l12516:	
;I2C_Base.c: 61: RB6=0; IIC_delay(Dtime);
	bcf	(54/8),(54)&7
	movf	(_Dtime),w
	fcall	_IIC_delay
	line	62
	
l12518:	
;I2C_Base.c: 62: return(0);
	movlw	(0)
	line	63
	
l5378:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_start
	__end_of_IIC_start:
;; =============== function _IIC_start ends ============

	signat	_IIC_start,89
	global	_IIC_STOP1
psect	text1880,local,class=CODE,delta=2
global __ptext1880
__ptext1880:

;; *************** function _IIC_STOP1 *****************
;; Defined at:
;;		line 32 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\iic.c"
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
;;		_AT24C02_Write_Byte1
;;		_AT24C02_Read_Byte1
;; This function uses a non-reentrant model
;;
psect	text1880
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\iic.c"
	line	32
	global	__size_of_IIC_STOP1
	__size_of_IIC_STOP1	equ	__end_of_IIC_STOP1-_IIC_STOP1
	
_IIC_STOP1:	
	opt	stack 1
; Regs used in _IIC_STOP1: [wreg+status,2+status,0+pclath+cstack]
	line	33
	
l12504:	
;iic.c: 33: TRISB6=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	34
;iic.c: 34: RB6=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(54/8),(54)&7
	line	35
;iic.c: 35: RB7=1;
	bsf	(55/8),(55)&7
	line	36
	
l12506:	
;iic.c: 36: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	37
	
l12508:	
;iic.c: 37: RB6=1;
	bsf	(54/8),(54)&7
	line	38
	
l9049:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_STOP1
	__end_of_IIC_STOP1:
;; =============== function _IIC_STOP1 ends ============

	signat	_IIC_STOP1,88
	global	_IIC_Wait_ACK1
psect	text1881,local,class=CODE,delta=2
global __ptext1881
__ptext1881:

;; *************** function _IIC_Wait_ACK1 *****************
;; Defined at:
;;		line 42 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\iic.c"
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
;;		_AT24C02_Write_Byte1
;;		_AT24C02_Read_Byte1
;; This function uses a non-reentrant model
;;
psect	text1881
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\iic.c"
	line	42
	global	__size_of_IIC_Wait_ACK1
	__size_of_IIC_Wait_ACK1	equ	__end_of_IIC_Wait_ACK1-_IIC_Wait_ACK1
	
_IIC_Wait_ACK1:	
	opt	stack 1
; Regs used in _IIC_Wait_ACK1: [wreg+status,2+status,0+pclath+cstack]
	line	43
	
l12476:	
	line	44
	
l12478:	
;iic.c: 44: TRISB6=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	45
	
l12480:	
;iic.c: 45: RB6=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7
	line	46
	
l12482:	
;iic.c: 46: {TRISB6=1,WPUB6=1;};
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1078/8)^080h,(1078)&7
	
l12484:	
	bsf	(1198/8)^080h,(1198)&7
	line	48
	
l12486:	
;iic.c: 48: RB7=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(55/8),(55)&7
	line	49
	
l12488:	
;iic.c: 49: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	50
	
l12490:	
;iic.c: 50: RB7=1;
	bsf	(55/8),(55)&7
	line	51
	
l12492:	
;iic.c: 51: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	53
	
l12494:	
;iic.c: 53: if(RB6)
	btfss	(54/8),(54)&7
	goto	u2681
	goto	u2680
u2681:
	goto	l12498
u2680:
	line	55
	
l12496:	
	line	56
;iic.c: 56: }
	goto	l12500
	line	59
	
l12498:	
	line	61
	
l12500:	
;iic.c: 60: }
;iic.c: 61: RB7=0;
	bcf	(55/8),(55)&7
	line	64
	
l9054:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_Wait_ACK1
	__end_of_IIC_Wait_ACK1:
;; =============== function _IIC_Wait_ACK1 ends ============

	signat	_IIC_Wait_ACK1,89
	global	_I2C_SendByte1
psect	text1882,local,class=CODE,delta=2
global __ptext1882
__ptext1882:

;; *************** function _I2C_SendByte1 *****************
;; Defined at:
;;		line 91 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\iic.c"
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
;;		_AT24C02_Write_Byte1
;;		_AT24C02_Read_Byte1
;; This function uses a non-reentrant model
;;
psect	text1882
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\iic.c"
	line	91
	global	__size_of_I2C_SendByte1
	__size_of_I2C_SendByte1	equ	__end_of_I2C_SendByte1-_I2C_SendByte1
	
_I2C_SendByte1:	
	opt	stack 1
; Regs used in _I2C_SendByte1: [wreg+status,2+status,0+pclath+cstack]
;I2C_SendByte1@Data stored from wreg
	line	93
	movwf	(I2C_SendByte1@Data)
	
l12458:	
;iic.c: 92: unsigned char cnt;
;iic.c: 93: TRISB6=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	94
	
l12460:	
;iic.c: 94: for(cnt=0; cnt<8; cnt++)
	clrf	(I2C_SendByte1@cnt)
	line	95
	
l9063:	
	line	98
;iic.c: 95: {
;iic.c: 98: if(Data & 0x80)
	btfss	(I2C_SendByte1@Data),(7)&7
	goto	u2661
	goto	u2660
u2661:
	goto	l9065
u2660:
	line	100
	
l12466:	
;iic.c: 99: {
;iic.c: 100: RB6=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7
	line	101
;iic.c: 101: }
	goto	l9066
	line	102
	
l9065:	
	line	104
;iic.c: 102: else
;iic.c: 103: {
;iic.c: 104: RB6=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(54/8),(54)&7
	line	105
	
l9066:	
	line	106
;iic.c: 105: }
;iic.c: 106: Data <<= 1;
	clrc
	rlf	(I2C_SendByte1@Data),f
	line	107
;iic.c: 107: RB7=1;
	bsf	(55/8),(55)&7
	line	108
	
l12468:	
;iic.c: 108: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	109
	
l12470:	
;iic.c: 109: RB7=0;
	bcf	(55/8),(55)&7
	line	110
;iic.c: 110: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	94
	
l12472:	
	incf	(I2C_SendByte1@cnt),f
	
l12474:	
	movlw	(08h)
	subwf	(I2C_SendByte1@cnt),w
	skipc
	goto	u2671
	goto	u2670
u2671:
	goto	l9063
u2670:
	line	113
	
l9067:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_SendByte1
	__end_of_I2C_SendByte1:
;; =============== function _I2C_SendByte1 ends ============

	signat	_I2C_SendByte1,4216
	global	_IIC_START1
psect	text1883,local,class=CODE,delta=2
global __ptext1883
__ptext1883:

;; *************** function _IIC_START1 *****************
;; Defined at:
;;		line 20 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\iic.c"
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
;;		_AT24C02_Write_Byte1
;;		_AT24C02_Read_Byte1
;; This function uses a non-reentrant model
;;
psect	text1883
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\iic.c"
	line	20
	global	__size_of_IIC_START1
	__size_of_IIC_START1	equ	__end_of_IIC_START1-_IIC_START1
	
_IIC_START1:	
	opt	stack 1
; Regs used in _IIC_START1: [wreg+status,2+status,0+pclath+cstack]
	line	21
	
l12450:	
;iic.c: 21: TRISB6=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	22
;iic.c: 22: RB6=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7
	line	23
;iic.c: 23: RB7=1;
	bsf	(55/8),(55)&7
	line	24
	
l12452:	
;iic.c: 24: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	25
	
l12454:	
;iic.c: 25: RB6=0;
	bcf	(54/8),(54)&7
	line	26
;iic.c: 26: iic_delay_us(1);
	movlw	(01h)
	fcall	_iic_delay_us
	line	27
	
l12456:	
;iic.c: 27: RB7=0;
	bcf	(55/8),(55)&7
	line	28
	
l9046:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_START1
	__end_of_IIC_START1:
;; =============== function _IIC_START1 ends ============

	signat	_IIC_START1,88
	global	_IIC_Init
psect	text1884,local,class=CODE,delta=2
global __ptext1884
__ptext1884:

;; *************** function _IIC_Init *****************
;; Defined at:
;;		line 26 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
;; Parameters:    Size  Location     Type
;;  freq            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  freq            1    5[COMMON] unsigned char 
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
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_IIC_delay
;; This function is called by:
;;		_EEPROM_Init
;; This function uses a non-reentrant model
;;
psect	text1884
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
	line	26
	global	__size_of_IIC_Init
	__size_of_IIC_Init	equ	__end_of_IIC_Init-_IIC_Init
	
_IIC_Init:	
	opt	stack 3
; Regs used in _IIC_Init: [wreg+status,2+status,0+pclath+cstack]
;IIC_Init@freq stored from wreg
	line	28
	movwf	(IIC_Init@freq)
	
l12432:	
;I2C_Base.c: 28: Dtime=freq;
	movf	(IIC_Init@freq),w
	movwf	(_Dtime)
	line	29
	
l12434:	
;I2C_Base.c: 29: TRISB7=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1079/8)^080h,(1079)&7
	line	32
	
l12436:	
;I2C_Base.c: 32: {WPUB6=1; TRISB6=1;};
	bsf	(1198/8)^080h,(1198)&7
	
l12438:	
	bsf	(1078/8)^080h,(1078)&7
	line	33
	
l12440:	
;I2C_Base.c: 33: RB7=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(55/8),(55)&7
	line	34
	
l12442:	
;I2C_Base.c: 34: IIC_delay(10);
	movlw	(0Ah)
	fcall	_IIC_delay
	line	35
	
l12444:	
;I2C_Base.c: 35: TRISB6=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	36
	
l12446:	
;I2C_Base.c: 36: RB6=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7
	line	37
	
l12448:	
;I2C_Base.c: 37: IIC_delay(10);
	movlw	(0Ah)
	fcall	_IIC_delay
	line	38
	
l5375:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_Init
	__end_of_IIC_Init:
;; =============== function _IIC_Init ends ============

	signat	_IIC_Init,4216
	global	_RF_ReadReg
psect	text1885,local,class=CODE,delta=2
global __ptext1885
__ptext1885:

;; *************** function _RF_ReadReg *****************
;; Defined at:
;;		line 344 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;  reg_addr        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg_addr        1    5[COMMON] unsigned char 
;;  tmp             1    6[COMMON] unsigned char 
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
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_SPI_RW
;; This function is called by:
;;		_RF_GetStatus
;; This function uses a non-reentrant model
;;
psect	text1885
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	344
	global	__size_of_RF_ReadReg
	__size_of_RF_ReadReg	equ	__end_of_RF_ReadReg-_RF_ReadReg
	
_RF_ReadReg:	
	opt	stack 1
; Regs used in _RF_ReadReg: [wreg+status,2+status,0+pclath+cstack]
;RF_ReadReg@reg_addr stored from wreg
	line	346
	movwf	(RF_ReadReg@reg_addr)
	
l12422:	
;rf297L.c: 345: unsigned char tmp;
;rf297L.c: 346: RE2=0;
	bcf	(74/8),(74)&7
	line	347
	
l12424:	
;rf297L.c: 347: SPI_RW(reg_addr);
	movf	(RF_ReadReg@reg_addr),w
	fcall	_SPI_RW
	line	348
;rf297L.c: 348: tmp = SPI_RW(0);
	movlw	(0)
	fcall	_SPI_RW
	movwf	(RF_ReadReg@tmp)
	line	349
	
l12426:	
;rf297L.c: 349: RE2=1;
	bsf	(74/8),(74)&7
	line	350
	
l12428:	
;rf297L.c: 350: return tmp;
	movf	(RF_ReadReg@tmp),w
	line	351
	
l3398:	
	return
	opt stack 0
GLOBAL	__end_of_RF_ReadReg
	__end_of_RF_ReadReg:
;; =============== function _RF_ReadReg ends ============

	signat	_RF_ReadReg,4217
	global	_RF_Read_Buff
psect	text1886,local,class=CODE,delta=2
global __ptext1886
__ptext1886:

;; *************** function _RF_Read_Buff *****************
;; Defined at:
;;		line 313 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;  reg_addr        1    wreg     unsigned char 
;;  pBuff           1    5[COMMON] PTR unsigned char 
;;		 -> rf_buf(18), 
;;  length          1    6[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg_addr        1    1[BANK0 ] unsigned char 
;;  byte_ctr        1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         0       2       0
;;      Temps:          0       1       0
;;      Totals:         2       3       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_SPI_RW
;; This function is called by:
;;		_RF_RxData
;;		_RF_ENHANCE_RxData
;; This function uses a non-reentrant model
;;
psect	text1886
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	313
	global	__size_of_RF_Read_Buff
	__size_of_RF_Read_Buff	equ	__end_of_RF_Read_Buff-_RF_Read_Buff
	
_RF_Read_Buff:	
	opt	stack 2
; Regs used in _RF_Read_Buff: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_Read_Buff@reg_addr stored from wreg
	line	315
	movwf	(RF_Read_Buff@reg_addr)
	
l12410:	
;rf297L.c: 314: unsigned char byte_ctr;
;rf297L.c: 315: RE2=0;
	bcf	(74/8),(74)&7
	line	316
	
l12412:	
;rf297L.c: 316: SPI_RW(reg_addr);
	movf	(RF_Read_Buff@reg_addr),w
	fcall	_SPI_RW
	line	317
	
l12414:	
;rf297L.c: 317: for(byte_ctr=0;byte_ctr<length;byte_ctr++){
	clrf	(RF_Read_Buff@byte_ctr)
	goto	l12420
	line	318
	
l12416:	
;rf297L.c: 318: pBuff[byte_ctr] = SPI_RW(0);
	movf	(RF_Read_Buff@byte_ctr),w
	addwf	(RF_Read_Buff@pBuff),w
	movwf	(??_RF_Read_Buff+0)+0
	movf	0+(??_RF_Read_Buff+0)+0,w
	movwf	fsr0
	movlw	(0)
	fcall	_SPI_RW
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	317
	
l12418:	
	incf	(RF_Read_Buff@byte_ctr),f
	
l12420:	
	movf	(RF_Read_Buff@length),w
	subwf	(RF_Read_Buff@byte_ctr),w
	skipc
	goto	u2651
	goto	u2650
u2651:
	goto	l12416
u2650:
	
l3385:	
	line	320
;rf297L.c: 319: }
;rf297L.c: 320: RE2=1;
	bsf	(74/8),(74)&7
	line	321
	
l3386:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Read_Buff
	__end_of_RF_Read_Buff:
;; =============== function _RF_Read_Buff ends ============

	signat	_RF_Read_Buff,12408
	global	_RF_Write_Buff
psect	text1887,local,class=CODE,delta=2
global __ptext1887
__ptext1887:

;; *************** function _RF_Write_Buff *****************
;; Defined at:
;;		line 324 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;  reg_addr        1    wreg     unsigned char 
;;  pBuff           2    0[BANK0 ] PTR unsigned char 
;;		 -> RX2_ADDRESS_DEF(3), TX2_ADDRESS_DEF(3), RF_Init@Dem_cal2_data(3), RF_Init@Dem_cal_data(1), 
;;		 -> RF_Init@RF_cal2_data(6), RF_Init@RF_cal_data(3), RF_Init@BB_cal_data(5), RF_ADDRESS(5), 
;;		 -> TX_ADDRESS_DEF(5), 
;;  length          1    2[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg_addr        1    5[COMMON] unsigned char 
;;  i               1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       3       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       3       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_SPI_RW
;; This function is called by:
;;		_RF_ADDSSet
;;		_RF_Init
;;		_RF_Init4
;; This function uses a non-reentrant model
;;
psect	text1887
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	324
	global	__size_of_RF_Write_Buff
	__size_of_RF_Write_Buff	equ	__end_of_RF_Write_Buff-_RF_Write_Buff
	
_RF_Write_Buff:	
	opt	stack 3
; Regs used in _RF_Write_Buff: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;RF_Write_Buff@reg_addr stored from wreg
	line	326
	movwf	(RF_Write_Buff@reg_addr)
	
l12398:	
;rf297L.c: 325: unsigned char i;
;rf297L.c: 326: RE2=0;
	bcf	(74/8),(74)&7
	line	327
	
l12400:	
;rf297L.c: 327: SPI_RW(reg_addr);
	movf	(RF_Write_Buff@reg_addr),w
	fcall	_SPI_RW
	line	328
	
l12402:	
;rf297L.c: 328: for(i=0;i<length;i++)
	clrf	(RF_Write_Buff@i)
	goto	l12408
	line	330
	
l12404:	
;rf297L.c: 329: {
;rf297L.c: 330: SPI_RW(pBuff[i]);
	movf	(RF_Write_Buff@i),w
	addwf	(RF_Write_Buff@pBuff),w
	movwf	fsr0
	movf	(RF_Write_Buff@pBuff+1),w
	skipnc
	incf	(RF_Write_Buff@pBuff+1),w
	movwf	btemp+1
	fcall	stringtab
	fcall	_SPI_RW
	line	328
	
l12406:	
	incf	(RF_Write_Buff@i),f
	
l12408:	
	movf	(RF_Write_Buff@length),w
	subwf	(RF_Write_Buff@i),w
	skipc
	goto	u2641
	goto	u2640
u2641:
	goto	l12404
u2640:
	
l3391:	
	line	332
;rf297L.c: 331: }
;rf297L.c: 332: RE2=1;
	bsf	(74/8),(74)&7
	line	333
	
l3392:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Write_Buff
	__end_of_RF_Write_Buff:
;; =============== function _RF_Write_Buff ends ============

	signat	_RF_Write_Buff,12408
	global	_RF_WriteReg
psect	text1888,local,class=CODE,delta=2
global __ptext1888
__ptext1888:

;; *************** function _RF_WriteReg *****************
;; Defined at:
;;		line 336 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;  reg_addr        1    wreg     unsigned char 
;;  write_data      1    5[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  reg_addr        1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_SPI_RW
;; This function is called by:
;;		_RF_ADDSSet
;;		_RF_Init
;;		_RF_Init3
;;		_RF_Init4
;;		_RF_ClearFIFO
;;		_RF_ClearStatus
;;		_RF_Set_RxMode
;;		_RF_Set_RxMode1
;; This function uses a non-reentrant model
;;
psect	text1888
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	336
	global	__size_of_RF_WriteReg
	__size_of_RF_WriteReg	equ	__end_of_RF_WriteReg-_RF_WriteReg
	
_RF_WriteReg:	
	opt	stack 3
; Regs used in _RF_WriteReg: [wreg+status,2+status,0+pclath+cstack]
;RF_WriteReg@reg_addr stored from wreg
	movwf	(RF_WriteReg@reg_addr)
	line	337
	
l12392:	
;rf297L.c: 337: RE2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(74/8),(74)&7
	line	338
	
l12394:	
;rf297L.c: 338: SPI_RW(reg_addr);
	movf	(RF_WriteReg@reg_addr),w
	fcall	_SPI_RW
	line	339
;rf297L.c: 339: SPI_RW(write_data);
	movf	(RF_WriteReg@write_data),w
	fcall	_SPI_RW
	line	340
	
l12396:	
;rf297L.c: 340: RE2=1;
	bsf	(74/8),(74)&7
	line	341
	
l3395:	
	return
	opt stack 0
GLOBAL	__end_of_RF_WriteReg
	__end_of_RF_WriteReg:
;; =============== function _RF_WriteReg ends ============

	signat	_RF_WriteReg,8312
	global	_LED_ALLOFF
psect	text1889,local,class=CODE,delta=2
global __ptext1889
__ptext1889:

;; *************** function _LED_ALLOFF *****************
;; Defined at:
;;		line 190 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\Key.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_SetRunEn
;;		_PWM_LED1
;;		_PWM_LED2
;; This function is called by:
;;		_main
;;		_Key_Handle
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1889
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\Key.c"
	line	190
	global	__size_of_LED_ALLOFF
	__size_of_LED_ALLOFF	equ	__end_of_LED_ALLOFF-_LED_ALLOFF
	
_LED_ALLOFF:	
	opt	stack 4
; Regs used in _LED_ALLOFF: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	191
	
l12382:	
;Key.c: 196: Chg_Type=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_LED_ON_Sat)
	line	197
	
l12384:	
;Key.c: 197: SetRunEn(0,0,0);
	clrf	(?_SetRunEn)
	clrf	0+(?_SetRunEn)+01h
	clrf	1+(?_SetRunEn)+01h
	movlw	(0)
	fcall	_SetRunEn
	line	198
	
l12386:	
;Key.c: 198: SetRunEn(1,0,0);
	clrf	(?_SetRunEn)
	clrf	0+(?_SetRunEn)+01h
	clrf	1+(?_SetRunEn)+01h
	movlw	(01h)
	fcall	_SetRunEn
	line	200
	
l12388:	
;Key.c: 200: PWM_LED1(0);
	movlw	(0)
	fcall	_PWM_LED1
	line	201
	
l12390:	
;Key.c: 201: PWM_LED2(0);
	movlw	(0)
	fcall	_PWM_LED2
	line	206
	
l6234:	
	return
	opt stack 0
GLOBAL	__end_of_LED_ALLOFF
	__end_of_LED_ALLOFF:
;; =============== function _LED_ALLOFF ends ============

	signat	_LED_ALLOFF,88
	global	_PWM_12SetVol
psect	text1890,local,class=CODE,delta=2
global __ptext1890
__ptext1890:

;; *************** function _PWM_12SetVol *****************
;; Defined at:
;;		line 235 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\main.c"
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
;;		_CCP1_set_duty_cycle
;;		_CCP2_set_duty_cycle
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1890
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\main.c"
	line	235
	global	__size_of_PWM_12SetVol
	__size_of_PWM_12SetVol	equ	__end_of_PWM_12SetVol-_PWM_12SetVol
	
_PWM_12SetVol:	
	opt	stack 4
; Regs used in _PWM_12SetVol: [wreg+status,2+status,0+pclath+cstack]
	line	236
	
l12380:	
;main.c: 236: CCP1_set_duty_cycle(PWM_CH_LED2);
	movf	(_PWM_CH_LED2),w
	movwf	(?_CCP1_set_duty_cycle)
	clrf	(?_CCP1_set_duty_cycle+1)
	fcall	_CCP1_set_duty_cycle
	line	237
;main.c: 237: CCP2_set_duty_cycle(PWM_CH_LED1);
	movf	(_PWM_CH_LED1),w
	movwf	(?_CCP2_set_duty_cycle)
	clrf	(?_CCP2_set_duty_cycle+1)
	fcall	_CCP2_set_duty_cycle
	line	238
	
l761:	
	return
	opt stack 0
GLOBAL	__end_of_PWM_12SetVol
	__end_of_PWM_12SetVol:
;; =============== function _PWM_12SetVol ends ============

	signat	_PWM_12SetVol,88
	global	___lbdiv
psect	text1891,local,class=CODE,delta=2
global __ptext1891
__ptext1891:

;; *************** function ___lbdiv *****************
;; Defined at:
;;		line 5 in file "D:\Work\file\PAN\PAN2416\编译器\CMS_IDE_V1.41.03_CRC_PANCHIP\data\sources\lbdiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    4[COMMON] unsigned char 
;;  quotient        1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
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
;;      Locals:         3       0       0
;;      Temps:          0       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_IIC_RACK
;; This function uses a non-reentrant model
;;
psect	text1891
	file	"D:\Work\file\PAN\PAN2416\编译器\CMS_IDE_V1.41.03_CRC_PANCHIP\data\sources\lbdiv.c"
	line	5
	global	__size_of___lbdiv
	__size_of___lbdiv	equ	__end_of___lbdiv-___lbdiv
	
___lbdiv:	
	opt	stack 0
; Regs used in ___lbdiv: [wreg+status,2+status,0]
;___lbdiv@dividend stored from wreg
	line	9
	movwf	(___lbdiv@dividend)
	
l12356:	
	clrf	(___lbdiv@quotient)
	line	10
	
l12358:	
	movf	(___lbdiv@divisor),w
	skipz
	goto	u2600
	goto	l12376
u2600:
	line	11
	
l12360:	
	clrf	(___lbdiv@counter)
	incf	(___lbdiv@counter),f
	line	12
	goto	l12364
	
l9112:	
	line	13
	clrc
	rlf	(___lbdiv@divisor),f
	line	14
	
l12362:	
	incf	(___lbdiv@counter),f
	line	12
	
l12364:	
	btfss	(___lbdiv@divisor),(7)&7
	goto	u2611
	goto	u2610
u2611:
	goto	l9112
u2610:
	line	16
	
l9114:	
	line	17
	clrc
	rlf	(___lbdiv@quotient),f
	line	18
	
l12366:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),w
	skipc
	goto	u2621
	goto	u2620
u2621:
	goto	l12372
u2620:
	line	19
	
l12368:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),f
	line	20
	
l12370:	
	bsf	(___lbdiv@quotient)+(0/8),(0)&7
	line	22
	
l12372:	
	clrc
	rrf	(___lbdiv@divisor),f
	line	23
	
l12374:	
	decfsz	(___lbdiv@counter),f
	goto	u2631
	goto	u2630
u2631:
	goto	l9114
u2630:
	line	25
	
l12376:	
	movf	(___lbdiv@quotient),w
	line	26
	
l9117:	
	return
	opt stack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
;; =============== function ___lbdiv ends ============

	signat	___lbdiv,8313
	global	___lwdiv
psect	text1892,local,class=CODE,delta=2
global __ptext1892
__ptext1892:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "D:\Work\file\PAN\PAN2416\编译器\CMS_IDE_V1.41.03_CRC_PANCHIP\data\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    3[COMMON] unsigned int 
;;  dividend        2    5[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    0[BANK0 ] unsigned int 
;;  counter         1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    3[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         4       0       0
;;      Locals:         0       3       0
;;      Temps:          0       0       0
;;      Totals:         4       3       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Convert_Duty_Cycle1
;;		_Convert_Duty_Cycle2
;; This function uses a non-reentrant model
;;
psect	text1892
	file	"D:\Work\file\PAN\PAN2416\编译器\CMS_IDE_V1.41.03_CRC_PANCHIP\data\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 3
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l12330:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l12332:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u2561
	goto	u2560
u2561:
	goto	l12352
u2560:
	line	11
	
l12334:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	12
	goto	l12338
	line	13
	
l12336:	
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	line	14
	incf	(___lwdiv@counter),f
	line	12
	
l12338:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2571
	goto	u2570
u2571:
	goto	l12336
u2570:
	line	17
	
l12340:	
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	line	18
	
l12342:	
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u2585
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u2585:
	skipc
	goto	u2581
	goto	u2580
u2581:
	goto	l12348
u2580:
	line	19
	
l12344:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l12346:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	22
	
l12348:	
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	line	23
	
l12350:	
	decfsz	(___lwdiv@counter),f
	goto	u2591
	goto	u2590
u2591:
	goto	l12340
u2590:
	line	25
	
l12352:	
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	26
	
l9097:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text1893,local,class=CODE,delta=2
global __ptext1893
__ptext1893:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "D:\Work\file\PAN\PAN2416\编译器\CMS_IDE_V1.41.03_CRC_PANCHIP\data\sources\wmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    3[COMMON] unsigned int 
;;  multiplicand    2    5[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    0[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    3[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         4       0       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         4       2       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Convert_Duty_Cycle1
;;		_Convert_Duty_Cycle2
;; This function uses a non-reentrant model
;;
psect	text1893
	file	"D:\Work\file\PAN\PAN2416\编译器\CMS_IDE_V1.41.03_CRC_PANCHIP\data\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 3
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l12314:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	line	7
	
l12316:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u2541
	goto	u2540
u2541:
	goto	l12320
u2540:
	line	8
	
l12318:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	line	9
	
l12320:	
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	line	10
	
l12322:	
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	line	11
	
l12324:	
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u2551
	goto	u2550
u2551:
	goto	l12316
u2550:
	line	12
	
l12326:	
	movf	(___wmul@product+1),w
	movwf	(?___wmul+1)
	movf	(___wmul@product),w
	movwf	(?___wmul)
	line	13
	
l9087:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_iic_delay_us
psect	text1894,local,class=CODE,delta=2
global __ptext1894
__ptext1894:

;; *************** function _iic_delay_us *****************
;; Defined at:
;;		line 6 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\iic.c"
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
;;		_IIC_START1
;;		_IIC_STOP1
;;		_IIC_Wait_ACK1
;;		_IIC_ACK1
;;		_IIC_NACK1
;;		_I2C_SendByte1
;;		_I2C_ReadByte1
;; This function uses a non-reentrant model
;;
psect	text1894
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\iic.c"
	line	6
	global	__size_of_iic_delay_us
	__size_of_iic_delay_us	equ	__end_of_iic_delay_us-_iic_delay_us
	
_iic_delay_us:	
	opt	stack 1
; Regs used in _iic_delay_us: [wreg+status,2+status,0]
;iic_delay_us@delay stored from wreg
	movwf	(iic_delay_us@delay)
	line	7
	
l12310:	
;iic.c: 7: while(delay--);
	
l12312:	
	decf	(iic_delay_us@delay),f
	movf	((iic_delay_us@delay)),w
	xorlw	0FFh
	skipz
	goto	u2531
	goto	u2530
u2531:
	goto	l12312
u2530:
	line	8
	
l9040:	
	return
	opt stack 0
GLOBAL	__end_of_iic_delay_us
	__end_of_iic_delay_us:
;; =============== function _iic_delay_us ends ============

	signat	_iic_delay_us,4216
	global	_Data_Check
psect	text1895,local,class=CODE,delta=2
global __ptext1895
__ptext1895:

;; *************** function _Data_Check *****************
;; Defined at:
;;		line 138 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    4[BANK0 ] unsigned char 
;;  j               1    3[BANK0 ] unsigned char 
;;  temp            1    2[BANK0 ] unsigned char 
;;  p               1    1[BANK0 ] unsigned char 
;;  k               1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       5       0
;;      Temps:          3       0       0
;;      Totals:         3       5       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Delete_One_RemoteAddr
;;		_Remote_Pairing
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1895
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
	line	138
	global	__size_of_Data_Check
	__size_of_Data_Check	equ	__end_of_Data_Check-_Data_Check
	
_Data_Check:	
	opt	stack 4
; Regs used in _Data_Check: [wreg-fsr0h+status,2+status,0]
	line	141
	
l12270:	
;recive.c: 139: unsigned char i;
;recive.c: 140: unsigned char j;
;recive.c: 141: unsigned char p = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(Data_Check@p)
	line	142
	
l12272:	
;recive.c: 142: unsigned char k = 3;
	movlw	(03h)
	movwf	(Data_Check@k)
	line	143
	
l12274:	
	line	144
	
l12276:	
;recive.c: 144: for(i = 0; i < 4; i++)
	clrf	(Data_Check@i)
	line	146
	
l12282:	
;recive.c: 145: {
;recive.c: 146: temp = 0;
	clrf	(Data_Check@temp)
	line	147
;recive.c: 147: for(j = 0;j < 4; j++)
	clrf	(Data_Check@j)
	line	149
	
l12288:	
;recive.c: 148: {
;recive.c: 149: if(rf_buf[k + j] == addr_buf[p])
	movf	(Data_Check@p),w
	addlw	_addr_buf&0ffh
	movwf	fsr
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_Data_Check+0)+0
	movlw	(_rf_buf)&0ffh
	addwf	(Data_Check@j),w
	movwf	(??_Data_Check+1)+0
	movf	(Data_Check@k),w
	addwf	0+(??_Data_Check+1)+0,w
	movwf	(??_Data_Check+2)+0
	movf	0+(??_Data_Check+2)+0,w
	movwf	fsr0
	movf	indf,w
	xorwf	(??_Data_Check+0)+0,w
	skipz
	goto	u2481
	goto	u2480
u2481:
	goto	l8350
u2480:
	line	151
	
l12290:	
;recive.c: 150: {
;recive.c: 151: temp++;
	incf	(Data_Check@temp),f
	line	152
	
l8350:	
	line	153
;recive.c: 152: }
;recive.c: 153: p++;
	incf	(Data_Check@p),f
	line	147
	incf	(Data_Check@j),f
	
l12292:	
	movlw	(04h)
	subwf	(Data_Check@j),w
	skipc
	goto	u2491
	goto	u2490
u2491:
	goto	l12288
u2490:
	line	155
	
l12294:	
;recive.c: 154: }
;recive.c: 155: if(temp == 4)
	movf	(Data_Check@temp),w
	xorlw	04h
	skipz
	goto	u2501
	goto	u2500
u2501:
	goto	l12300
u2500:
	line	157
	
l12296:	
;recive.c: 156: {
;recive.c: 157: return i;
	movf	(Data_Check@i),w
	goto	l8352
	line	159
	
l12300:	
;recive.c: 158: }
;recive.c: 159: if(i == 3)
	movf	(Data_Check@i),w
	xorlw	03h
	skipz
	goto	u2511
	goto	u2510
u2511:
	goto	l12306
u2510:
	line	161
	
l12302:	
;recive.c: 160: {
;recive.c: 161: return 0xFF;
	movlw	(0FFh)
	goto	l8352
	line	144
	
l12306:	
	incf	(Data_Check@i),f
	
l12308:	
	movlw	(04h)
	subwf	(Data_Check@i),w
	skipc
	goto	u2521
	goto	u2520
u2521:
	goto	l12282
u2520:
	line	165
	
l8352:	
	return
	opt stack 0
GLOBAL	__end_of_Data_Check
	__end_of_Data_Check:
;; =============== function _Data_Check ends ============

	signat	_Data_Check,89
	global	_UpdateCRC
psect	text1896,local,class=CODE,delta=2
global __ptext1896
__ptext1896:

;; *************** function _UpdateCRC *****************
;; Defined at:
;;		line 53 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
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
psect	text1896
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\recive.c"
	line	53
	global	__size_of_UpdateCRC
	__size_of_UpdateCRC	equ	__end_of_UpdateCRC-_UpdateCRC
	
_UpdateCRC:	
	opt	stack 4
; Regs used in _UpdateCRC: [wreg-fsr0h+status,2+status,0+btemp+1]
;UpdateCRC@CRC_input stored from wreg
	movwf	(UpdateCRC@CRC_input)
	line	54
	
l12242:	
;recive.c: 54: unsigned char i,k = 0;
	clrf	(UpdateCRC@k)
	line	55
	
l12244:	
;recive.c: 55: unsigned short CRC_acc=0x5555;
	movlw	low(05555h)
	movwf	(UpdateCRC@CRC_acc)
	movlw	high(05555h)
	movwf	((UpdateCRC@CRC_acc))+1
	line	57
;recive.c: 57: while (len--)
	goto	l12264
	line	59
	
l12246:	
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
	
l12248:	
	incf	(UpdateCRC@k),f
	line	61
	
l12250:	
;recive.c: 61: for (i = 0; i < 8; i++)
	clrf	(UpdateCRC@i)
	line	62
	
l8316:	
	line	63
;recive.c: 62: {
;recive.c: 63: if ((CRC_acc & 0x8000) == 0x8000)
	btfss	(UpdateCRC@CRC_acc+1),(15)&7
	goto	u2451
	goto	u2450
u2451:
	goto	l12260
u2450:
	line	65
	
l12256:	
;recive.c: 64: {
;recive.c: 65: CRC_acc = CRC_acc << 1;
	clrc
	rlf	(UpdateCRC@CRC_acc),f
	rlf	(UpdateCRC@CRC_acc+1),f
	line	66
	
l12258:	
;recive.c: 66: CRC_acc ^= 0x1021;
	movlw	low(01021h)
	xorwf	(UpdateCRC@CRC_acc),f
	movlw	high(01021h)
	xorwf	(UpdateCRC@CRC_acc+1),f
	line	67
;recive.c: 67: }
	goto	l8319
	line	70
	
l12260:	
;recive.c: 68: else
;recive.c: 69: {
;recive.c: 70: CRC_acc = CRC_acc << 1;
	clrc
	rlf	(UpdateCRC@CRC_acc),f
	rlf	(UpdateCRC@CRC_acc+1),f
	line	71
	
l8319:	
	line	61
	incf	(UpdateCRC@i),f
	
l12262:	
	movlw	(08h)
	subwf	(UpdateCRC@i),w
	skipc
	goto	u2461
	goto	u2460
u2461:
	goto	l8316
u2460:
	line	57
	
l12264:	
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
	goto	u2471
	goto	u2470
u2471:
	goto	l12246
u2470:
	line	74
	
l12266:	
;recive.c: 71: }
;recive.c: 72: }
;recive.c: 73: }
;recive.c: 74: return CRC_acc;
	movf	(UpdateCRC@CRC_acc+1),w
	movwf	(?_UpdateCRC+1)
	movf	(UpdateCRC@CRC_acc),w
	movwf	(?_UpdateCRC)
	line	75
	
l8321:	
	return
	opt stack 0
GLOBAL	__end_of_UpdateCRC
	__end_of_UpdateCRC:
;; =============== function _UpdateCRC ends ============

	signat	_UpdateCRC,8314
	global	_BufferRun
psect	text1897,local,class=CODE,delta=2
global __ptext1897
__ptext1897:

;; *************** function _BufferRun *****************
;; Defined at:
;;		line 12 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\Buffer.C"
;; Parameters:    Size  Location     Type
;;  BufNo           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  BufNo           1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          4       0       0
;;      Totals:         4       1       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_BufRuning
;; This function uses a non-reentrant model
;;
psect	text1897
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\Buffer.C"
	line	12
	global	__size_of_BufferRun
	__size_of_BufferRun	equ	__end_of_BufferRun-_BufferRun
	
_BufferRun:	
	opt	stack 3
; Regs used in _BufferRun: [wreg-fsr0h+status,2+status,0]
;BufferRun@BufNo stored from wreg
	line	18
	movwf	(BufferRun@BufNo)
	
l12208:	
;Buffer.C: 18: if( RunParam_Reg.GoalValing [BufNo] > RunParam_Reg.GoalVal[BufNo] )
	movf	(BufferRun@BufNo),w
	addlw	_RunParam_Reg+02h&0ffh
	movwf	fsr
	movf	indf,w
	movwf	(??_BufferRun+0)+0
	movf	(BufferRun@BufNo),w
	addlw	_RunParam_Reg&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_BufferRun+1)+0
	movf	(??_BufferRun+0)+0,w
	subwf	(??_BufferRun+1)+0,w
	skipnc
	goto	u2421
	goto	u2420
u2421:
	goto	l12226
u2420:
	line	20
	
l12210:	
;Buffer.C: 19: {
;Buffer.C: 20: if( RunParam_Reg.GoalValing [BufNo]-RunParam_Reg.pixel[BufNo] <= RunParam_Reg.GoalVal[BufNo])
	movf	(BufferRun@BufNo),w
	addlw	_RunParam_Reg+02h&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_BufferRun+0)+0
	clrf	(??_BufferRun+0)+0+1
	movf	(BufferRun@BufNo),w
	addlw	_RunParam_Reg+08h&0ffh
	movwf	fsr0
	movf	1+(??_BufferRun+0)+0,w
	movwf	(??_BufferRun+2)+0+1
	movf	indf,w
	subwf	0+(??_BufferRun+0)+0,w
	movwf	(??_BufferRun+2)+0
	skipc
	decf	(??_BufferRun+2)+0+1,f
	movf	(BufferRun@BufNo),w
	addlw	_RunParam_Reg&0ffh
	movwf	fsr0
	movf	1+(??_BufferRun+2)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u2435
	movf	0+(??_BufferRun+2)+0,w
	subwf	indf,w
u2435:

	skipc
	goto	u2431
	goto	u2430
u2431:
	goto	l12220
u2430:
	line	21
	
l12212:	
;Buffer.C: 21: {RunParam_Reg.GoalValing [BufNo] = RunParam_Reg.GoalVal[BufNo]; return 0;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(BufferRun@BufNo),w
	addlw	_RunParam_Reg&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_BufferRun+0)+0
	movf	(BufferRun@BufNo),w
	addlw	_RunParam_Reg+02h&0ffh
	movwf	fsr0
	movf	(??_BufferRun+0)+0,w
	movwf	indf
	
l12214:	
	movlw	(0)
	goto	l6984
	line	23
	
l12220:	
;Buffer.C: 22: else
;Buffer.C: 23: {RunParam_Reg.GoalValing [BufNo] -= RunParam_Reg.pixel[BufNo];return 1;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(BufferRun@BufNo),w
	addlw	_RunParam_Reg+08h&0ffh
	movwf	fsr
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_BufferRun+0)+0
	movf	(BufferRun@BufNo),w
	addlw	_RunParam_Reg+02h&0ffh
	movwf	fsr0
	movf	(??_BufferRun+0)+0,w
	subwf	indf,f
	
l12222:	
	movlw	(01h)
	goto	l6984
	line	28
	
l12226:	
;Buffer.C: 26: else
;Buffer.C: 27: {
;Buffer.C: 28: if(RunParam_Reg.GoalValing [BufNo]+RunParam_Reg.pixel[BufNo] >= RunParam_Reg.GoalVal[BufNo])
	movf	(BufferRun@BufNo),w
	addlw	_RunParam_Reg+08h&0ffh
	movwf	fsr
	movf	indf,w
	movwf	(??_BufferRun+0)+0
	movf	(BufferRun@BufNo),w
	addlw	_RunParam_Reg+02h&0ffh
	movwf	fsr0
	movf	indf,w
	addwf	(??_BufferRun+0)+0,w
	movwf	(??_BufferRun+1)+0
	clrf	(??_BufferRun+1)+0+1
	rlf	1+(??_BufferRun+1)+0,f
	
	movf	(BufferRun@BufNo),w
	addlw	_RunParam_Reg&0ffh
	movwf	fsr0
	movf	1+(??_BufferRun+1)+0,w
	xorlw	80h
	movwf	(??_BufferRun+3)+0
	movlw	80h
	subwf	(??_BufferRun+3)+0,w
	skipz
	goto	u2445
	movf	indf,w
	subwf	0+(??_BufferRun+1)+0,w
u2445:

	skipc
	goto	u2441
	goto	u2440
u2441:
	goto	l12236
u2440:
	goto	l12212
	line	31
	
l12236:	
;Buffer.C: 30: else
;Buffer.C: 31: {RunParam_Reg.GoalValing [BufNo] += RunParam_Reg.pixel[BufNo]; return 1;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(BufferRun@BufNo),w
	addlw	_RunParam_Reg+08h&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_BufferRun+0)+0
	movf	(BufferRun@BufNo),w
	addlw	_RunParam_Reg+02h&0ffh
	movwf	fsr0
	movf	(??_BufferRun+0)+0,w
	addwf	indf,f
	goto	l12222
	line	33
	
l6984:	
	return
	opt stack 0
GLOBAL	__end_of_BufferRun
	__end_of_BufferRun:
;; =============== function _BufferRun ends ============

	signat	_BufferRun,4217
	global	_GerBuff_RunSAT
psect	text1898,local,class=CODE,delta=2
global __ptext1898
__ptext1898:

;; *************** function _GerBuff_RunSAT *****************
;; Defined at:
;;		line 107 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\Buffer.C"
;; Parameters:    Size  Location     Type
;;  BufNo           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  BufNo           1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
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
;;		_Key_Handle
;; This function uses a non-reentrant model
;;
psect	text1898
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\Buffer.C"
	line	107
	global	__size_of_GerBuff_RunSAT
	__size_of_GerBuff_RunSAT	equ	__end_of_GerBuff_RunSAT-_GerBuff_RunSAT
	
_GerBuff_RunSAT:	
	opt	stack 5
; Regs used in _GerBuff_RunSAT: [wreg-fsr0h+status,2+status,0]
;GerBuff_RunSAT@BufNo stored from wreg
	movwf	(GerBuff_RunSAT@BufNo)
	line	108
	
l12204:	
;Buffer.C: 108: return RunParam_Reg.RunSAT[BufNo];
	movf	(GerBuff_RunSAT@BufNo),w
	addlw	_RunParam_Reg+0Ah&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	line	110
	
l7010:	
	return
	opt stack 0
GLOBAL	__end_of_GerBuff_RunSAT
	__end_of_GerBuff_RunSAT:
;; =============== function _GerBuff_RunSAT ends ============

	signat	_GerBuff_RunSAT,4217
	global	_BufSetRun
psect	text1899,local,class=CODE,delta=2
global __ptext1899
__ptext1899:

;; *************** function _BufSetRun *****************
;; Defined at:
;;		line 68 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\Buffer.C"
;; Parameters:    Size  Location     Type
;;  BufNo           1    wreg     unsigned char 
;;  Deg             1    3[COMMON] unsigned char 
;;  SPD             1    4[COMMON] unsigned char 
;;  PIX             1    5[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  BufNo           1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         3       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Key_Handle
;;		_LED_Dimming
;; This function uses a non-reentrant model
;;
psect	text1899
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\Buffer.C"
	line	68
	global	__size_of_BufSetRun
	__size_of_BufSetRun	equ	__end_of_BufSetRun-_BufSetRun
	
_BufSetRun:	
	opt	stack 4
; Regs used in _BufSetRun: [wreg-fsr0h+status,2+status,0]
;BufSetRun@BufNo stored from wreg
	movwf	(BufSetRun@BufNo)
	line	69
	
l12196:	
;Buffer.C: 69: if(BufNo>=2) return;
	movlw	(02h)
	subwf	(BufSetRun@BufNo),w
	skipc
	goto	u2401
	goto	u2400
u2401:
	goto	l12200
u2400:
	goto	l7000
	line	71
	
l12200:	
;Buffer.C: 71: if(SPD)
	movf	(BufSetRun@SPD),w
	skipz
	goto	u2410
	goto	l7000
u2410:
	line	73
	
l12202:	
;Buffer.C: 72: {
;Buffer.C: 73: RunParam_Reg.GoalVal [BufNo]=Deg;
	movf	(BufSetRun@BufNo),w
	addlw	_RunParam_Reg&0ffh
	movwf	fsr0
	movf	(BufSetRun@Deg),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	line	74
;Buffer.C: 74: RunParam_Reg.GapTime [BufNo]=SPD;
	movf	(BufSetRun@BufNo),w
	addlw	_RunParam_Reg+04h&0ffh
	movwf	fsr0
	movf	(BufSetRun@SPD),w
	movwf	indf
	line	75
;Buffer.C: 75: RunParam_Reg.pixel [BufNo]=PIX;
	movf	(BufSetRun@BufNo),w
	addlw	_RunParam_Reg+08h&0ffh
	movwf	fsr0
	movf	(BufSetRun@PIX),w
	movwf	indf
	line	76
;Buffer.C: 76: RunParam_Reg.RunSAT [BufNo]=1;
	movf	(BufSetRun@BufNo),w
	addlw	_RunParam_Reg+0Ah&0ffh
	movwf	fsr0
	clrf	indf
	incf	indf,f
	line	82
	
l7000:	
	return
	opt stack 0
GLOBAL	__end_of_BufSetRun
	__end_of_BufSetRun:
;; =============== function _BufSetRun ends ============

	signat	_BufSetRun,16504
	global	_GetChgLV
psect	text1900,local,class=CODE,delta=2
global __ptext1900
__ptext1900:

;; *************** function _GetChgLV *****************
;; Defined at:
;;		line 158 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\Key.c"
;; Parameters:    Size  Location     Type
;;  vol             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  vol             1    4[COMMON] unsigned char 
;;  i               1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          1       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Key_Handle
;; This function uses a non-reentrant model
;;
psect	text1900
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\Key.c"
	line	158
	global	__size_of_GetChgLV
	__size_of_GetChgLV	equ	__end_of_GetChgLV-_GetChgLV
	
_GetChgLV:	
	opt	stack 5
; Regs used in _GetChgLV: [wreg-fsr0h+status,2+status,0+pclath]
;GetChgLV@vol stored from wreg
	movwf	(GetChgLV@vol)
	line	159
	
l12176:	
;Key.c: 159: unsigned char i=0;
	clrf	(GetChgLV@i)
	line	160
;Key.c: 160: for(i=0;i<5;i++)
	clrf	(GetChgLV@i)
	line	162
	
l12182:	
;Key.c: 161: {
;Key.c: 162: if(vol>ChgLV_FW[1+i]) return i;
	movf	(GetChgLV@i),w
	addlw	low((_ChgLV_FW-__stringbase)+01h)
	movwf	fsr0
	fcall	stringdir
	movwf	(??_GetChgLV+0)+0
	movf	(GetChgLV@vol),w
	subwf	(??_GetChgLV+0)+0,w
	skipnc
	goto	u2381
	goto	u2380
u2381:
	goto	l12188
u2380:
	
l12184:	
	movf	(GetChgLV@i),w
	goto	l6231
	line	160
	
l12188:	
	incf	(GetChgLV@i),f
	
l12190:	
	movlw	(05h)
	subwf	(GetChgLV@i),w
	skipc
	goto	u2391
	goto	u2390
u2391:
	goto	l12182
u2390:
	line	165
	
l12192:	
;Key.c: 163: }
;Key.c: 165: return 5;
	movlw	(05h)
	line	166
	
l6231:	
	return
	opt stack 0
GLOBAL	__end_of_GetChgLV
	__end_of_GetChgLV:
;; =============== function _GetChgLV ends ============

	signat	_GetChgLV,4217
	global	_IIC_delay
psect	text1901,local,class=CODE,delta=2
global __ptext1901
__ptext1901:

;; *************** function _IIC_delay *****************
;; Defined at:
;;		line 14 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
;; Parameters:    Size  Location     Type
;;  DLAtime         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  DLAtime         1    3[COMMON] unsigned char 
;;  j               1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  5368[COMMON] int 
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
;;		_IIC_Init
;;		_IIC_start
;;		_IIC_stop
;;		_IIC_RACK
;;		_IIC_WACK
;;		_IIC_Wbyte
;;		_IIC_Rbyte
;; This function uses a non-reentrant model
;;
psect	text1901
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\I2C_Base.c"
	line	14
	global	__size_of_IIC_delay
	__size_of_IIC_delay	equ	__end_of_IIC_delay-_IIC_delay
	
_IIC_delay:	
	opt	stack 0
; Regs used in _IIC_delay: [wreg+status,2+status,0]
;IIC_delay@DLAtime stored from wreg
	line	16
	movwf	(IIC_delay@DLAtime)
	
l12170:	
;I2C_Base.c: 15: unsigned char j;
;I2C_Base.c: 16: for(j=0;j<DLAtime;j++);
	clrf	(IIC_delay@j)
	goto	l12174
	
l12172:	
	incf	(IIC_delay@j),f
	
l12174:	
	movf	(IIC_delay@DLAtime),w
	subwf	(IIC_delay@j),w
	skipc
	goto	u2371
	goto	u2370
u2371:
	goto	l12172
u2370:
	line	17
	
l5372:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_delay
	__end_of_IIC_delay:
;; =============== function _IIC_delay ends ============

	signat	_IIC_delay,4218
	global	_SPI_RW
psect	text1902,local,class=CODE,delta=2
global __ptext1902
__ptext1902:

;; *************** function _SPI_RW *****************
;; Defined at:
;;		line 369 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
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
psect	text1902
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	369
	global	__size_of_SPI_RW
	__size_of_SPI_RW	equ	__end_of_SPI_RW-_SPI_RW
	
_SPI_RW:	
	opt	stack 3
; Regs used in _SPI_RW: [wreg+status,2+status,0]
;SPI_RW@read_reg_addr stored from wreg
	line	371
	movwf	(SPI_RW@read_reg_addr)
	
l12152:	
;rf297L.c: 370: unsigned char i;
;rf297L.c: 371: for(i = 0; i < 8; i++)
	clrf	(SPI_RW@i)
	line	372
	
l3404:	
	line	373
;rf297L.c: 372: {
;rf297L.c: 373: RE1=0;
	bcf	(73/8),(73)&7
	line	374
;rf297L.c: 374: if(read_reg_addr & 0x80)
	btfss	(SPI_RW@read_reg_addr),(7)&7
	goto	u2341
	goto	u2340
u2341:
	goto	l3406
u2340:
	line	376
	
l12158:	
;rf297L.c: 375: {
;rf297L.c: 376: RA5=1;
	bsf	(45/8),(45)&7
	line	377
;rf297L.c: 377: }
	goto	l3407
	line	378
	
l3406:	
	line	380
;rf297L.c: 378: else
;rf297L.c: 379: {
;rf297L.c: 380: RA5=0;
	bcf	(45/8),(45)&7
	line	381
	
l3407:	
	line	382
;rf297L.c: 381: }
;rf297L.c: 382: read_reg_addr = read_reg_addr << 1;
	clrc
	rlf	(SPI_RW@read_reg_addr),f
	line	383
;rf297L.c: 383: RE1=1;
	bsf	(73/8),(73)&7
	line	384
;rf297L.c: 384: if( RA4 )
	btfss	(44/8),(44)&7
	goto	u2351
	goto	u2350
u2351:
	goto	l12162
u2350:
	line	386
	
l12160:	
;rf297L.c: 385: {
;rf297L.c: 386: read_reg_addr = read_reg_addr | 0x01;
	bsf	(SPI_RW@read_reg_addr)+(0/8),(0)&7
	line	371
	
l12162:	
	incf	(SPI_RW@i),f
	
l12164:	
	movlw	(08h)
	subwf	(SPI_RW@i),w
	skipc
	goto	u2361
	goto	u2360
u2361:
	goto	l3404
u2360:
	
l3405:	
	line	389
;rf297L.c: 387: }
;rf297L.c: 388: }
;rf297L.c: 389: RE1=0;
	bcf	(73/8),(73)&7
	line	390
	
l12166:	
;rf297L.c: 390: return read_reg_addr;
	movf	(SPI_RW@read_reg_addr),w
	line	391
	
l3409:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_RW
	__end_of_SPI_RW:
;; =============== function _SPI_RW ends ============

	signat	_SPI_RW,4217
	global	_SPI_init
psect	text1903,local,class=CODE,delta=2
global __ptext1903
__ptext1903:

;; *************** function _SPI_init *****************
;; Defined at:
;;		line 354 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/20
;;		Unchanged: FFE9F/0
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
psect	text1903
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\rf297L.c"
	line	354
	global	__size_of_SPI_init
	__size_of_SPI_init	equ	__end_of_SPI_init-_SPI_init
	
_SPI_init:	
	opt	stack 4
; Regs used in _SPI_init: []
	line	356
	
l12150:	
;rf297L.c: 356: TRISE2 =0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1098/8)^080h,(1098)&7
	line	357
;rf297L.c: 357: TRISE1=0;
	bcf	(1097/8)^080h,(1097)&7
	line	358
;rf297L.c: 358: TRISA5=0;
	bcf	(1069/8)^080h,(1069)&7
	line	359
;rf297L.c: 359: TRISA7 = 0;
	bcf	(1071/8)^080h,(1071)&7
	line	361
;rf297L.c: 361: TRISA3 = 1;
	bsf	(1067/8)^080h,(1067)&7
	line	362
;rf297L.c: 362: TRISA4=1;
	bsf	(1068/8)^080h,(1068)&7
	line	363
	
l3401:	
	return
	opt stack 0
GLOBAL	__end_of_SPI_init
	__end_of_SPI_init:
;; =============== function _SPI_init ends ============

	signat	_SPI_init,88
	global	_PWM_LED2
psect	text1904,local,class=CODE,delta=2
global __ptext1904
__ptext1904:

;; *************** function _PWM_LED2 *****************
;; Defined at:
;;		line 229 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\main.c"
;; Parameters:    Size  Location     Type
;;  PWM             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  PWM             1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
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
;;		_LEDCon_Chg
;;		_Key_HandRunning
;;		_LED_ALLOFF
;;		_Key_Handle
;;		_Buffer_VaryFun
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1904
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\main.c"
	line	229
	global	__size_of_PWM_LED2
	__size_of_PWM_LED2	equ	__end_of_PWM_LED2-_PWM_LED2
	
_PWM_LED2:	
	opt	stack 4
; Regs used in _PWM_LED2: [wreg]
;PWM_LED2@PWM stored from wreg
	movwf	(PWM_LED2@PWM)
	line	230
	
l12126:	
;main.c: 230: PWM_CH_LED2=PWM;
	movf	(PWM_LED2@PWM),w
	movwf	(_PWM_CH_LED2)
	line	231
	
l758:	
	return
	opt stack 0
GLOBAL	__end_of_PWM_LED2
	__end_of_PWM_LED2:
;; =============== function _PWM_LED2 ends ============

	signat	_PWM_LED2,4216
	global	_PWM_LED1
psect	text1905,local,class=CODE,delta=2
global __ptext1905
__ptext1905:

;; *************** function _PWM_LED1 *****************
;; Defined at:
;;		line 223 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\main.c"
;; Parameters:    Size  Location     Type
;;  PWM             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  PWM             1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
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
;;		_LEDCon_Chg
;;		_Key_HandRunning
;;		_LED_ALLOFF
;;		_Key_Handle
;;		_Buffer_VaryFun
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1905
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\main.c"
	line	223
	global	__size_of_PWM_LED1
	__size_of_PWM_LED1	equ	__end_of_PWM_LED1-_PWM_LED1
	
_PWM_LED1:	
	opt	stack 4
; Regs used in _PWM_LED1: [wreg]
;PWM_LED1@PWM stored from wreg
	movwf	(PWM_LED1@PWM)
	line	224
	
l12124:	
;main.c: 224: PWM_CH_LED1=PWM;
	movf	(PWM_LED1@PWM),w
	movwf	(_PWM_CH_LED1)
	line	225
	
l755:	
	return
	opt stack 0
GLOBAL	__end_of_PWM_LED1
	__end_of_PWM_LED1:
;; =============== function _PWM_LED1 ends ============

	signat	_PWM_LED1,4216
	global	_getClock
psect	text1906,local,class=CODE,delta=2
global __ptext1906
__ptext1906:

;; *************** function _getClock *****************
;; Defined at:
;;		line 13 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\userClock.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp            1    3[COMMON] unsigned char 
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1906
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\userClock.c"
	line	13
	global	__size_of_getClock
	__size_of_getClock	equ	__end_of_getClock-_getClock
	
_getClock:	
	opt	stack 5
; Regs used in _getClock: [wreg+status,2+status,0]
	line	14
	
l12116:	
	line	15
;userClock.c: 15: clk_flag = 0;
	clrf	(_clk_flag)
	line	17
	
l12118:	
;userClock.c: 17: if(clk_count >= 1)
	movf	(_clk_count),w	;volatile
	skipz
	goto	u2310
	goto	l8414
u2310:
	line	19
	
l12120:	
;userClock.c: 18: {
;userClock.c: 19: clk_count -= 1;
	decf	(_clk_count),f	;volatile
	line	20
	
l12122:	
;userClock.c: 20: temp = dClkCnt0;
	movf	(_dClkCnt0),w
	movwf	(getClock@temp)
	line	21
;userClock.c: 21: clk_flag = temp ^ (++dClkCnt0);
	incf	(_dClkCnt0),f
	movf	((_dClkCnt0)),w
	xorwf	(getClock@temp),w
	movwf	(_clk_flag)
	line	23
	
l8414:	
	return
	opt stack 0
GLOBAL	__end_of_getClock
	__end_of_getClock:
;; =============== function _getClock ends ============

	signat	_getClock,88
	global	_WDT_clear
psect	text1907,local,class=CODE,delta=2
global __ptext1907
__ptext1907:

;; *************** function _WDT_clear *****************
;; Defined at:
;;		line 19 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\WDT.c"
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
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
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
;;		_EP_IsADDCfg
;;		_EP_SetADDCfg
;;		_EP_GetONOFFStep
;;		_EP_SetONOFFStep
;;		_EP_GetRFAdd
;;		_EP_SetRFAdd
;;		_AT24C02_Write_Msg
;;		_AT24C02_Read_Msg
;;		_Pair_LED
;;		_Key_Handle
;; This function uses a non-reentrant model
;;
psect	text1907
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\WDT.c"
	line	19
	global	__size_of_WDT_clear
	__size_of_WDT_clear	equ	__end_of_WDT_clear-_WDT_clear
	
_WDT_clear:	
	opt	stack 3
; Regs used in _WDT_clear: []
	line	20
	
l12114:	
# 20 "D:\Work\project\遥控+接收主程序\双信道接收2\src\WDT.c"
CLRWDT ;#
psect	text1907
	line	21
	
l2665:	
	return
	opt stack 0
GLOBAL	__end_of_WDT_clear
	__end_of_WDT_clear:
;; =============== function _WDT_clear ends ============

	signat	_WDT_clear,88
	global	_WDT_enable
psect	text1908,local,class=CODE,delta=2
global __ptext1908
__ptext1908:

;; *************** function _WDT_enable *****************
;; Defined at:
;;		line 11 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\WDT.c"
;; Parameters:    Size  Location     Type
;;  WDT_DIVIDE_R    1    wreg     enum E551
;; Auto vars:     Size  Location     Type
;;  WDT_DIVIDE_R    1    3[COMMON] enum E551
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
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
psect	text1908
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\WDT.c"
	line	11
	global	__size_of_WDT_enable
	__size_of_WDT_enable	equ	__end_of_WDT_enable-_WDT_enable
	
_WDT_enable:	
	opt	stack 5
; Regs used in _WDT_enable: [wreg+status,2+status,0]
;WDT_enable@WDT_DIVIDE_RATIO stored from wreg
	movwf	(WDT_enable@WDT_DIVIDE_RATIO)
	line	12
	
l12108:	
;WDT.c: 12: OPTION_REG &= 0xf0;
	movlw	(0F0h)
	bsf	status, 5	;RP0=1, select bank1
	andwf	(129)^080h,f	;volatile
	line	13
;WDT.c: 13: OPTION_REG |= WDT_DIVIDE_RATIO;
	movf	(WDT_enable@WDT_DIVIDE_RATIO),w
	iorwf	(129)^080h,f	;volatile
	line	14
	
l12110:	
;WDT.c: 14: WDTCON |= 0x01;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(261)^0100h+(0/8),(0)&7	;volatile
	line	15
	
l12112:	
# 15 "D:\Work\project\遥控+接收主程序\双信道接收2\src\WDT.c"
CLRWDT ;#
psect	text1908
	line	16
	
l2662:	
	return
	opt stack 0
GLOBAL	__end_of_WDT_enable
	__end_of_WDT_enable:
;; =============== function _WDT_enable ends ============

	signat	_WDT_enable,4216
	global	_Timer1_start
psect	text1909,local,class=CODE,delta=2
global __ptext1909
__ptext1909:

;; *************** function _Timer1_start *****************
;; Defined at:
;;		line 37 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\timer1.c"
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
;;		On entry : 160/20
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
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
psect	text1909
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\timer1.c"
	line	37
	global	__size_of_Timer1_start
	__size_of_Timer1_start	equ	__end_of_Timer1_start-_Timer1_start
	
_Timer1_start:	
	opt	stack 5
; Regs used in _Timer1_start: [wreg]
	line	39
	
l12102:	
;timer1.c: 39: TMR1L = (unsigned char)((64556));
	movlw	(02Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(14)	;volatile
	line	40
;timer1.c: 40: TMR1H = (unsigned char)((64556)>>8);
	movlw	(0FCh)
	movwf	(15)	;volatile
	line	41
	
l12104:	
;timer1.c: 41: PIR1 &= ~(0x01);
	bcf	(12)+(0/8),(0)&7	;volatile
	line	42
	
l12106:	
;timer1.c: 42: T1CON |= 0x01;
	bsf	(16)+(0/8),(0)&7	;volatile
	line	43
	
l2032:	
	return
	opt stack 0
GLOBAL	__end_of_Timer1_start
	__end_of_Timer1_start:
;; =============== function _Timer1_start ends ============

	signat	_Timer1_start,8312
	global	_Timer1_Init
psect	text1910,local,class=CODE,delta=2
global __ptext1910
__ptext1910:

;; *************** function _Timer1_Init *****************
;; Defined at:
;;		line 23 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\timer1.c"
;; Parameters:    Size  Location     Type
;;  TIMER1_DIVID    1    wreg     enum E560
;; Auto vars:     Size  Location     Type
;;  TIMER1_DIVID    1    3[COMMON] enum E560
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/20
;;		Unchanged: FFE9F/0
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
psect	text1910
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\timer1.c"
	line	23
	global	__size_of_Timer1_Init
	__size_of_Timer1_Init	equ	__end_of_Timer1_Init-_Timer1_Init
	
_Timer1_Init:	
	opt	stack 5
; Regs used in _Timer1_Init: [wreg+status,2+status,0]
;Timer1_Init@TIMER1_DIVIDER stored from wreg
	movwf	(Timer1_Init@TIMER1_DIVIDER)
	line	24
	
l12094:	
;timer1.c: 24: T1CON = 0x00;
	clrf	(16)	;volatile
	line	25
	
l12096:	
;timer1.c: 25: T1CON |= TIMER1_DIVIDER;
	movf	(Timer1_Init@TIMER1_DIVIDER),w
	iorwf	(16),f	;volatile
	line	26
	
l12098:	
;timer1.c: 26: INTCON |= (0x40);
	bsf	(11)+(6/8),(6)&7	;volatile
	line	27
	
l12100:	
;timer1.c: 27: PIE1 |= 0x01;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(140)^080h+(0/8),(0)&7	;volatile
	line	28
	
l2029:	
	return
	opt stack 0
GLOBAL	__end_of_Timer1_Init
	__end_of_Timer1_Init:
;; =============== function _Timer1_Init ends ============

	signat	_Timer1_Init,4216
	global	_Enable_Interrupt
psect	text1911,local,class=CODE,delta=2
global __ptext1911
__ptext1911:

;; *************** function _Enable_Interrupt *****************
;; Defined at:
;;		line 37 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\system.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
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
psect	text1911
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\system.c"
	line	37
	global	__size_of_Enable_Interrupt
	__size_of_Enable_Interrupt	equ	__end_of_Enable_Interrupt-_Enable_Interrupt
	
_Enable_Interrupt:	
	opt	stack 5
; Regs used in _Enable_Interrupt: []
	line	38
	
l12092:	
;system.c: 38: INTCON |= 0x80;
	bsf	(11)+(7/8),(7)&7	;volatile
	line	39
	
l1395:	
	return
	opt stack 0
GLOBAL	__end_of_Enable_Interrupt
	__end_of_Enable_Interrupt:
;; =============== function _Enable_Interrupt ends ============

	signat	_Enable_Interrupt,88
	global	_SetRunEn
psect	text1912,local,class=CODE,delta=2
global __ptext1912
__ptext1912:

;; *************** function _SetRunEn *****************
;; Defined at:
;;		line 89 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\Buffer.C"
;; Parameters:    Size  Location     Type
;;  BufNo           1    wreg     unsigned char 
;;  RunEn           1    3[COMMON] unsigned char 
;;  MID             2    4[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  BufNo           1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         3       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_LEDCon_Chg
;;		_LED_ALLOFF
;;		_Key_Handle
;;		_recive_task
;; This function uses a non-reentrant model
;;
psect	text1912
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\Buffer.C"
	line	89
	global	__size_of_SetRunEn
	__size_of_SetRunEn	equ	__end_of_SetRunEn-_SetRunEn
	
_SetRunEn:	
	opt	stack 4
; Regs used in _SetRunEn: [wreg-fsr0h+status,2+status,0]
;SetRunEn@BufNo stored from wreg
	movwf	(SetRunEn@BufNo)
	line	90
	
l12090:	
;Buffer.C: 90: RunParam_Reg.GoalVal[BufNo]=MID;
	movf	(SetRunEn@BufNo),w
	addlw	_RunParam_Reg&0ffh
	movwf	fsr0
	movf	(SetRunEn@MID),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	line	91
;Buffer.C: 91: RunParam_Reg.GoalValing [BufNo]=MID;
	movf	(SetRunEn@BufNo),w
	addlw	_RunParam_Reg+02h&0ffh
	movwf	fsr0
	movf	(SetRunEn@MID),w
	movwf	indf
	line	92
;Buffer.C: 92: RunParam_Reg.RunEN [BufNo]=RunEn;
	movf	(SetRunEn@BufNo),w
	addlw	_RunParam_Reg+0Ch&0ffh
	movwf	fsr0
	movf	(SetRunEn@RunEn),w
	movwf	indf
	line	93
;Buffer.C: 93: RunParam_Reg.TallyTimeing [BufNo]=0;
	movf	(SetRunEn@BufNo),w
	addlw	_RunParam_Reg+06h&0ffh
	movwf	fsr0
	clrf	indf
	line	94
	
l7004:	
	return
	opt stack 0
GLOBAL	__end_of_SetRunEn
	__end_of_SetRunEn:
;; =============== function _SetRunEn ends ============

	signat	_SetRunEn,12408
	global	_IIC_Init1
psect	text1913,local,class=CODE,delta=2
global __ptext1913
__ptext1913:

;; *************** function _IIC_Init1 *****************
;; Defined at:
;;		line 11 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\iic.c"
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
psect	text1913
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\iic.c"
	line	11
	global	__size_of_IIC_Init1
	__size_of_IIC_Init1	equ	__end_of_IIC_Init1-_IIC_Init1
	
_IIC_Init1:	
	opt	stack 5
; Regs used in _IIC_Init1: []
	line	12
	
l12088:	
;iic.c: 12: OPTION_REG &= ~0x80;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(129)^080h+(7/8),(7)&7	;volatile
	line	14
;iic.c: 14: RB6=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7
	line	15
;iic.c: 15: RB7=1;
	bsf	(55/8),(55)&7
	line	16
	
l9043:	
	return
	opt stack 0
GLOBAL	__end_of_IIC_Init1
	__end_of_IIC_Init1:
;; =============== function _IIC_Init1 ends ============

	signat	_IIC_Init1,88
	global	_CCP2_set_duty_cycle
psect	text1914,local,class=CODE,delta=2
global __ptext1914
__ptext1914:

;; *************** function _CCP2_set_duty_cycle *****************
;; Defined at:
;;		line 67 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\PWM.c"
;; Parameters:    Size  Location     Type
;;  duty_cycle      2    3[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               1    0[BANK0 ] unsigned char 
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
;;      Locals:         0       1       0
;;      Temps:          2       0       0
;;      Totals:         4       1       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_PWM_12SetVol
;;		_Pair_LED
;;		_Key_Handle
;; This function uses a non-reentrant model
;;
psect	text1914
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\PWM.c"
	line	67
	global	__size_of_CCP2_set_duty_cycle
	__size_of_CCP2_set_duty_cycle	equ	__end_of_CCP2_set_duty_cycle-_CCP2_set_duty_cycle
	
_CCP2_set_duty_cycle:	
	opt	stack 3
; Regs used in _CCP2_set_duty_cycle: [wreg+status,2+status,0]
	line	69
	
l12076:	
	line	70
	
l12078:	
;PWM.c: 70: i=CCP2CON;
	movf	(29),w	;volatile
	movwf	(CCP2_set_duty_cycle@i)
	line	71
	
l12080:	
;PWM.c: 71: i&=0xCF;
	movlw	(0CFh)
	andwf	(CCP2_set_duty_cycle@i),f
	line	72
	
l12082:	
;PWM.c: 72: i|= (duty_cycle<<4)&0x70;
	swapf	(CCP2_set_duty_cycle@duty_cycle),w
	andlw	(0ffh shl 4) & 0ffh
	andlw	070h
	iorwf	(CCP2_set_duty_cycle@i),f
	line	73
	
l12084:	
;PWM.c: 73: CCP2CON=i;
	movf	(CCP2_set_duty_cycle@i),w
	movwf	(29)	;volatile
	line	74
	
l12086:	
;PWM.c: 74: CCPR2L = duty_cycle>>2;
	movf	(CCP2_set_duty_cycle@duty_cycle+1),w
	movwf	(??_CCP2_set_duty_cycle+0)+0+1
	movf	(CCP2_set_duty_cycle@duty_cycle),w
	movwf	(??_CCP2_set_duty_cycle+0)+0
	clrc
	rrf	(??_CCP2_set_duty_cycle+0)+1,f
	rrf	(??_CCP2_set_duty_cycle+0)+0,f
	clrc
	rrf	(??_CCP2_set_duty_cycle+0)+1,f
	rrf	(??_CCP2_set_duty_cycle+0)+0,f
	movf	0+(??_CCP2_set_duty_cycle+0)+0,w
	movwf	(27)	;volatile
	line	75
	
l7639:	
	return
	opt stack 0
GLOBAL	__end_of_CCP2_set_duty_cycle
	__end_of_CCP2_set_duty_cycle:
;; =============== function _CCP2_set_duty_cycle ends ============

	signat	_CCP2_set_duty_cycle,4216
	global	_CCP1_set_duty_cycle
psect	text1915,local,class=CODE,delta=2
global __ptext1915
__ptext1915:

;; *************** function _CCP1_set_duty_cycle *****************
;; Defined at:
;;		line 52 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\PWM.c"
;; Parameters:    Size  Location     Type
;;  duty_cycle      2    3[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         0       1       0
;;      Temps:          2       0       0
;;      Totals:         4       1       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_PWM_12SetVol
;;		_Pair_LED
;;		_Key_Handle
;; This function uses a non-reentrant model
;;
psect	text1915
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\PWM.c"
	line	52
	global	__size_of_CCP1_set_duty_cycle
	__size_of_CCP1_set_duty_cycle	equ	__end_of_CCP1_set_duty_cycle-_CCP1_set_duty_cycle
	
_CCP1_set_duty_cycle:	
	opt	stack 3
; Regs used in _CCP1_set_duty_cycle: [wreg+status,2+status,0]
	line	53
	
l12064:	
	line	54
	
l12066:	
;PWM.c: 54: i=CCP1CON;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(23),w	;volatile
	movwf	(CCP1_set_duty_cycle@i)
	line	55
	
l12068:	
;PWM.c: 55: i&=0xCF;
	movlw	(0CFh)
	andwf	(CCP1_set_duty_cycle@i),f
	line	56
	
l12070:	
;PWM.c: 56: i|= (duty_cycle<<4)&0x70;
	swapf	(CCP1_set_duty_cycle@duty_cycle),w
	andlw	(0ffh shl 4) & 0ffh
	andlw	070h
	iorwf	(CCP1_set_duty_cycle@i),f
	line	57
	
l12072:	
;PWM.c: 57: CCP1CON=i;
	movf	(CCP1_set_duty_cycle@i),w
	movwf	(23)	;volatile
	line	58
	
l12074:	
;PWM.c: 58: CCPR1L = duty_cycle>>2;
	movf	(CCP1_set_duty_cycle@duty_cycle+1),w
	movwf	(??_CCP1_set_duty_cycle+0)+0+1
	movf	(CCP1_set_duty_cycle@duty_cycle),w
	movwf	(??_CCP1_set_duty_cycle+0)+0
	clrc
	rrf	(??_CCP1_set_duty_cycle+0)+1,f
	rrf	(??_CCP1_set_duty_cycle+0)+0,f
	clrc
	rrf	(??_CCP1_set_duty_cycle+0)+1,f
	rrf	(??_CCP1_set_duty_cycle+0)+0,f
	movf	0+(??_CCP1_set_duty_cycle+0)+0,w
	movwf	(21)	;volatile
	line	59
	
l7636:	
	return
	opt stack 0
GLOBAL	__end_of_CCP1_set_duty_cycle
	__end_of_CCP1_set_duty_cycle:
;; =============== function _CCP1_set_duty_cycle ends ============

	signat	_CCP1_set_duty_cycle,4216
	global	_CCPX_Init
psect	text1916,local,class=CODE,delta=2
global __ptext1916
__ptext1916:

;; *************** function _CCPX_Init *****************
;; Defined at:
;;		line 15 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\PWM.c"
;; Parameters:    Size  Location     Type
;;  PWM_DIV         1    wreg     enum E551
;;  T_nums          1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  PWM_DIV         1    4[COMMON] enum E551
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
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
psect	text1916
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\PWM.c"
	line	15
	global	__size_of_CCPX_Init
	__size_of_CCPX_Init	equ	__end_of_CCPX_Init-_CCPX_Init
	
_CCPX_Init:	
	opt	stack 5
; Regs used in _CCPX_Init: [wreg+status,2+status,0]
;CCPX_Init@PWM_DIV stored from wreg
	movwf	(CCPX_Init@PWM_DIV)
	line	16
	
l12034:	
;PWM.c: 16: T2CON = 0x00;
	clrf	(18)	;volatile
	line	19
	
l12036:	
;PWM.c: 19: TRISC |= 0x04;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(135)^080h+(2/8),(2)&7	;volatile
	line	20
	
l12038:	
;PWM.c: 20: CCP1CON &= ~0x3f;
	movlw	(0C0h)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(23),f	;volatile
	line	21
	
l12040:	
;PWM.c: 21: CCP1CON |= 0x0f;
	movlw	(0Fh)
	iorwf	(23),f	;volatile
	line	22
	
l12042:	
;PWM.c: 22: CCP1CON &=~ 0x30;
	movlw	(0CFh)
	andwf	(23),f	;volatile
	line	23
	
l12044:	
;PWM.c: 23: CCPR1L = 0x00;
	clrf	(21)	;volatile
	line	26
	
l12046:	
;PWM.c: 26: TRISC |= 0x02;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(135)^080h+(1/8),(1)&7	;volatile
	line	27
;PWM.c: 27: CCP2CON &= ~0x3f;
	movlw	(0C0h)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(29),f	;volatile
	line	28
;PWM.c: 28: CCP2CON |= 0x0f;
	movlw	(0Fh)
	iorwf	(29),f	;volatile
	line	29
;PWM.c: 29: CCP2CON &=~ 0x30;
	movlw	(0CFh)
	andwf	(29),f	;volatile
	line	30
	
l12048:	
;PWM.c: 30: CCPR2L = 0x00;
	clrf	(27)	;volatile
	line	33
	
l12050:	
;PWM.c: 33: PR2 = T_nums;
	movf	(CCPX_Init@T_nums),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	34
	
l12052:	
;PWM.c: 34: PIR1 &= ~0x02;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(12)+(1/8),(1)&7	;volatile
	line	35
	
l12054:	
;PWM.c: 35: T2CON &= ~0x7f;
	movlw	(080h)
	andwf	(18),f	;volatile
	line	36
	
l12056:	
;PWM.c: 36: T2CON |= PWM_DIV;
	movf	(CCPX_Init@PWM_DIV),w
	iorwf	(18),f	;volatile
	line	40
	
l12058:	
;PWM.c: 40: T2CON |= 0x04;
	bsf	(18)+(2/8),(2)&7	;volatile
	line	42
	
l12060:	
;PWM.c: 42: TRISC &= ~0x02;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(135)^080h+(1/8),(1)&7	;volatile
	line	43
	
l12062:	
;PWM.c: 43: TRISC &= ~0x04;
	bcf	(135)^080h+(2/8),(2)&7	;volatile
	line	44
	
l7633:	
	return
	opt stack 0
GLOBAL	__end_of_CCPX_Init
	__end_of_CCPX_Init:
;; =============== function _CCPX_Init ends ============

	signat	_CCPX_Init,8312
	global	_soft_delay_ms
psect	text1917,local,class=CODE,delta=2
global __ptext1917
__ptext1917:

;; *************** function _soft_delay_ms *****************
;; Defined at:
;;		line 10 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\delay.c"
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
;;		On entry : 0/20
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
;;		_AT24C02_Write_Msg
;;		_AT24C02_Read_Msg
;;		_Pair_LED
;;		_Key_Handle
;; This function uses a non-reentrant model
;;
psect	text1917
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\delay.c"
	line	10
	global	__size_of_soft_delay_ms
	__size_of_soft_delay_ms	equ	__end_of_soft_delay_ms-_soft_delay_ms
	
_soft_delay_ms:	
	opt	stack 3
; Regs used in _soft_delay_ms: [wreg+status,2+status,0]
	line	14
	
l12008:	
;delay.c: 12: volatile unsigned int i;
;delay.c: 13: volatile unsigned char j,k;
;delay.c: 14: for(i=0;i<ms;i++){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(soft_delay_ms@i)	;volatile
	clrf	(soft_delay_ms@i+1)	;volatile
	goto	l12032
	line	15
	
l12010:	
;delay.c: 15: for(j=0;j<10;j++){
	clrf	(soft_delay_ms@j)	;volatile
	
l12012:	
	movlw	(0Ah)
	subwf	(soft_delay_ms@j),w	;volatile
	skipc
	goto	u2281
	goto	u2280
u2281:
	goto	l12016
u2280:
	goto	l12030
	line	16
	
l12016:	
;delay.c: 16: for(k=0;k<32;k++);
	clrf	(soft_delay_ms@k)	;volatile
	
l12018:	
	movlw	(020h)
	subwf	(soft_delay_ms@k),w	;volatile
	skipc
	goto	u2291
	goto	u2290
u2291:
	goto	l12022
u2290:
	goto	l12026
	
l12022:	
	incf	(soft_delay_ms@k),f	;volatile
	goto	l12018
	line	15
	
l12026:	
	incf	(soft_delay_ms@j),f	;volatile
	goto	l12012
	line	14
	
l12030:	
	incf	(soft_delay_ms@i),f	;volatile
	skipnz
	incf	(soft_delay_ms@i+1),f	;volatile
	
l12032:	
	movf	(soft_delay_ms@ms+1),w
	subwf	(soft_delay_ms@i+1),w	;volatile
	skipz
	goto	u2305
	movf	(soft_delay_ms@ms),w
	subwf	(soft_delay_ms@i),w	;volatile
u2305:
	skipc
	goto	u2301
	goto	u2300
u2301:
	goto	l12010
u2300:
	line	19
	
l4039:	
	return
	opt stack 0
GLOBAL	__end_of_soft_delay_ms
	__end_of_soft_delay_ms:
;; =============== function _soft_delay_ms ends ============

	signat	_soft_delay_ms,4216
	global	_system_set_CPU_frequency
psect	text1918,local,class=CODE,delta=2
global __ptext1918
__ptext1918:

;; *************** function _system_set_CPU_frequency *****************
;; Defined at:
;;		line 18 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\system.c"
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
psect	text1918
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\system.c"
	line	18
	global	__size_of_system_set_CPU_frequency
	__size_of_system_set_CPU_frequency	equ	__end_of_system_set_CPU_frequency-_system_set_CPU_frequency
	
_system_set_CPU_frequency:	
	opt	stack 5
; Regs used in _system_set_CPU_frequency: [wreg+status,2]
;system_set_CPU_frequency@CPU_Frequency stored from wreg
	movwf	(system_set_CPU_frequency@CPU_Frequency)
	line	19
	
l12004:	
;system.c: 19: OSCCON = CPU_Frequency;
	movf	(system_set_CPU_frequency@CPU_Frequency),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h
	line	20
	
l12006:	
;system.c: 20: OSCTUNE = 0X00;
	clrf	(144)^080h	;volatile
	line	21
	
l1386:	
	return
	opt stack 0
GLOBAL	__end_of_system_set_CPU_frequency
	__end_of_system_set_CPU_frequency:
;; =============== function _system_set_CPU_frequency ends ============

	signat	_system_set_CPU_frequency,4216
	global	_ISR
psect	text1919,local,class=CODE,delta=2
global __ptext1919
__ptext1919:

;; *************** function _ISR *****************
;; Defined at:
;;		line 47 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\system.c"
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
psect	text1919
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\system.c"
	line	47
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
psect	text1919
	line	52
	
i1l12128:	
;system.c: 48: unsigned char inside_intterrupt_enable,peripheral_intterrupt_enable;
;system.c: 49: unsigned char inside_intterrupt_touch,peripheral_intterrupt_touch;
;system.c: 52: inside_intterrupt_enable = INTCON & 0x38;
	movf	(11),w
	line	53
;system.c: 53: peripheral_intterrupt_enable = PIE1 & 0x43;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(140)^080h,w
	line	54
;system.c: 54: inside_intterrupt_touch = INTCON & 0x07;
	movf	(11),w
	line	55
;system.c: 55: peripheral_intterrupt_touch = PIR1 & 0x43;
	bcf	status, 5	;RP0=0, select bank0
	movf	(12),w
	movwf	(ISR@peripheral_intterrupt_touch)
	
i1l12130:	
	movlw	(043h)
	andwf	(ISR@peripheral_intterrupt_touch),f
	line	70
	
i1l12132:	
;system.c: 70: if(peripheral_intterrupt_touch & TIMER1_ISR_TOUCH) {
	btfss	(ISR@peripheral_intterrupt_touch),(0)&7
	goto	u232_21
	goto	u232_20
u232_21:
	goto	i1l1402
u232_20:
	line	71
	
i1l12134:	
;system.c: 71: TIMER1_ISR();
	fcall	_TIMER1_ISR
	line	81
	
i1l1402:	
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
psect	text1920,local,class=CODE,delta=2
global __ptext1920
__ptext1920:

;; *************** function _TIMER1_ISR *****************
;; Defined at:
;;		line 58 in file "D:\Work\project\遥控+接收主程序\双信道接收2\src\timer1.c"
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
psect	text1920
	file	"D:\Work\project\遥控+接收主程序\双信道接收2\src\timer1.c"
	line	58
	global	__size_of_TIMER1_ISR
	__size_of_TIMER1_ISR	equ	__end_of_TIMER1_ISR-_TIMER1_ISR
	
_TIMER1_ISR:	
	opt	stack 0
; Regs used in _TIMER1_ISR: [wreg+status,2+status,0]
	line	59
	
i1l12136:	
;timer1.c: 59: T1CON &= ~(0x01);
	bcf	(16)+(0/8),(0)&7	;volatile
	line	60
	
i1l12138:	
;timer1.c: 60: TMR1L = (unsigned char)((64556));
	movlw	(02Ch)
	movwf	(14)	;volatile
	line	61
;timer1.c: 61: TMR1H = (unsigned char)((64556)>>8);
	movlw	(0FCh)
	movwf	(15)	;volatile
	line	65
	
i1l12140:	
;timer1.c: 65: clk_count ++;
	incf	(_clk_count),f	;volatile
	line	67
	
i1l12142:	
;timer1.c: 67: if(Time1s_cot)
	movf	(_Time1s_cot+1),w
	iorwf	(_Time1s_cot),w
	skipnz
	goto	u233_21
	goto	u233_20
u233_21:
	goto	i1l12146
u233_20:
	line	69
	
i1l12144:	
;timer1.c: 68: {
;timer1.c: 69: Time1s_cot--;
	movlw	low(01h)
	subwf	(_Time1s_cot),f
	movlw	high(01h)
	skipc
	decf	(_Time1s_cot+1),f
	subwf	(_Time1s_cot+1),f
	line	72
	
i1l12146:	
;timer1.c: 70: }
;timer1.c: 72: PIR1 &= ~(0x01);
	bcf	(12)+(0/8),(0)&7	;volatile
	line	73
	
i1l12148:	
;timer1.c: 73: T1CON |= 0x01;
	bsf	(16)+(0/8),(0)&7	;volatile
	line	74
	
i1l2039:	
	return
	opt stack 0
GLOBAL	__end_of_TIMER1_ISR
	__end_of_TIMER1_ISR:
;; =============== function _TIMER1_ISR ends ============

	signat	_TIMER1_ISR,88
psect	text1921,local,class=CODE,delta=2
global __ptext1921
__ptext1921:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
