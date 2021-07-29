
	; HI-TECH C Compiler for PIC10/12/16 MCUs V9.83
	; Copyright (C) 1984-2011 HI-TECH Software
	;Serial no. HCPICP-123456

	; Auto-generated runtime startup code for final link stage.

	;
	; Compiler options:
	;
	; -oFWTRX-PAVTR-SERIALTR-PAN2416AV.cof \
	; -mFWTRX-PAVTR-SERIALTR-PAN2416AV.map --summary=default,-psect,-class \
	; --fill=FFFF --output=intel main.p1 system.p1 timer0.p1 timer1.p1 \
	; timer2.p1 PWM.p1 WDT.p1 rf297L.p1 delay.p1 INT0.p1 key_scan.p1 \
	; PORTB_interrupt.p1 ADC.p1 virtual_timer.p1 recive.p1 iic.p1 e2prom.p1 \
	; uart.p1 --chip=MX5325 -P --runtime=default,+stackcall \
	; --opt=default,+asm,-speed,+space,9 -E+cmscerr.err -D__DEBUG=1 -g \
	; --asmlist --errformat=Error[%n]:	%f	第%l行	%s \
	; --msgformat=Advisory[%n]	%s --warnformat=Warning[%n]:	%f	第%l行	%s
	;


	processor	MX5325

	global	_main,start,_exit,reset_vec
	fnroot	_main
	psect	config,class=CONFIG,delta=2
	psect	idloc,class=IDLOC,delta=2
	psect	code,class=CODE,delta=2
	psect	powerup,class=CODE,delta=2
	psect	reset_vec,class=CODE,delta=2
	psect	maintext,class=CODE,delta=2
	C	set	0
	Z	set	2
	PCL	set	2
	INDF	set	0

	STATUS	equ	3
	PCLATH	equ	0Ah

	psect	eeprom_data,class=EEDATA,delta=2,space=2
	psect	intentry,class=CODE,delta=2
	psect	functab,class=CODE,delta=2
	global	intlevel0,intlevel1,intlevel2, intlevel3, intlevel4, intlevel5
intlevel0:
intlevel1:
intlevel2:
intlevel3:
intlevel4:
intlevel5:
	psect	init,class=CODE,delta=2
	psect	cinit,class=CODE,delta=2
	psect	text,class=CODE,delta=2
	psect	end_init,class=CODE,delta=2
	psect	clrtext,class=CODE,delta=2
	FSR	set	4
	psect	strings,class=CODE,delta=2,reloc=256

	psect	reset_vec
reset_vec:
	; No powerup routine
	global start

; jump to start
	goto	start & 0x7FF | (reset_vec & not 0x7FF)



	psect	init
start
_exit
	psect	end_init
	global start_initialization
	ljmp start_initialization	;jump to C runtime clear & initialization

psect bank0,class=BANK0,space=1
psect bank1,class=BANK1,space=1
psect bank2,class=BANK2,space=1
psect bank3,class=BANK3,space=1
psect ram,class=RAM,space=1
psect abs1,class=ABS1,space=1
psect common,class=COMMON,space=1
psect sfr0,class=SFR0,space=1
psect sfr1,class=SFR1,space=1
psect sfr2,class=SFR2,space=1
psect sfr3,class=SFR3,space=1


	end	start
