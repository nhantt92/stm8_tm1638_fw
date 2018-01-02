;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Mac OS X x86_64)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _delay
	.globl _TIM4_UPD_OVF_IRQHandler
	.globl _clock_setup
	.globl _setLed
	.globl _displayNumber
	.globl _configDisplay
	.globl _TM1638_Init
	.globl _TIMER_InitTime
	.globl _TIMER_Inc
	.globl _TIMER_Init
	.globl _TIM4_ClearITPendingBit
	.globl _CLK_GetFlagStatus
	.globl _CLK_SYSCLKConfig
	.globl _CLK_HSIPrescalerConfig
	.globl _CLK_ClockSwitchConfig
	.globl _CLK_PeripheralClockConfig
	.globl _CLK_ClockSwitchCmd
	.globl _CLK_LSICmd
	.globl _CLK_HSICmd
	.globl _CLK_HSECmd
	.globl _CLK_DeInit
	.globl _tick
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_tick::
	.ds 6
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int 0x0000 ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int _TIM4_UPD_OVF_IRQHandler ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	user/main.c: 24: void clock_setup(void)
;	-----------------------------------------
;	 function clock_setup
;	-----------------------------------------
_clock_setup:
;	user/main.c: 26: CLK_DeInit();
	call	_CLK_DeInit
;	user/main.c: 27: CLK_HSECmd(DISABLE);
	push	#0x00
	call	_CLK_HSECmd
	pop	a
;	user/main.c: 28: CLK_LSICmd(DISABLE);
	push	#0x00
	call	_CLK_LSICmd
	pop	a
;	user/main.c: 29: CLK_HSICmd(ENABLE);
	push	#0x01
	call	_CLK_HSICmd
	pop	a
;	user/main.c: 30: while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
00101$:
	push	#0x02
	push	#0x01
	call	_CLK_GetFlagStatus
	popw	x
	tnz	a
	jreq	00101$
;	user/main.c: 31: CLK_ClockSwitchCmd(ENABLE);
	push	#0x01
	call	_CLK_ClockSwitchCmd
	pop	a
;	user/main.c: 32: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	push	#0x00
	call	_CLK_HSIPrescalerConfig
	pop	a
;	user/main.c: 33: CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);
	push	#0x81
	call	_CLK_SYSCLKConfig
	pop	a
;	user/main.c: 34: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	push	#0x01
	push	#0x00
	push	#0xe1
	push	#0x01
	call	_CLK_ClockSwitchConfig
	addw	sp, #4
;	user/main.c: 35: CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
	push	#0x01
	push	#0x01
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 36: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
	push	#0x01
	push	#0x00
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 37: CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	push	#0x00
	push	#0x13
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 38: CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	push	#0x00
	push	#0x12
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 39: CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	push	#0x00
	push	#0x03
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 40: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	push	#0x00
	push	#0x07
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 41: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
	push	#0x00
	push	#0x05
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/main.c: 42: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
	push	#0x01
	push	#0x04
	call	_CLK_PeripheralClockConfig
	popw	x
	ret
;	user/main.c: 45: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
;	-----------------------------------------
;	 function TIM4_UPD_OVF_IRQHandler
;	-----------------------------------------
_TIM4_UPD_OVF_IRQHandler:
	div	x, a
;	user/main.c: 47: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
	push	#0x01
	call	_TIM4_ClearITPendingBit
	pop	a
;	user/main.c: 48: TIMER_Inc();
	call	_TIMER_Inc
	iret
;	user/main.c: 71: void delay(uint16_t x)
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	pushw	x
;	user/main.c: 73: while(x--);
	ldw	x, (0x05, sp)
00101$:
	ldw	(0x01, sp), x
	decw	x
	ldw	y, (0x01, sp)
	jrne	00101$
	popw	x
	ret
;	user/main.c: 76: void main() 
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	user/main.c: 79: clock_setup();
	call	_clock_setup
;	user/main.c: 80: TM1638_Init(GPIOC, GPIO_PIN_4, GPIO_PIN_5, GPIO_PIN_6);
	push	#0x40
	push	#0x20
	push	#0x10
	push	#0x0a
	push	#0x50
	call	_TM1638_Init
	addw	sp, #5
;	user/main.c: 81: configDisplay(1, 0x07);
	push	#0x07
	push	#0x01
	call	_configDisplay
	popw	x
;	user/main.c: 83: TIMER_Init();
	call	_TIMER_Init
;	user/main.c: 85: enableInterrupts();
	rim
;	user/main.c: 86: TIMER_InitTime(&tick);
	ldw	x, #_tick+0
	pushw	x
	call	_TIMER_InitTime
	popw	x
;	user/main.c: 88: for(i = 0; i < 8; i++)
	clr	a
00108$:
;	user/main.c: 90: displayNumber(i, i, FALSE);
	push	a
	push	#0x00
	push	a
	push	a
	call	_displayNumber
	addw	sp, #3
	pop	a
;	user/main.c: 88: for(i = 0; i < 8; i++)
	inc	a
	cp	a, #0x08
	jrc	00108$
;	user/main.c: 92: for(i = 0; i < 8; i++)
	clr	a
00110$:
;	user/main.c: 94: setLed(0, i);
	push	a
	push	a
	push	#0x00
	call	_setLed
	popw	x
	pop	a
;	user/main.c: 92: for(i = 0; i < 8; i++)
	inc	a
	cp	a, #0x08
	jrc	00110$
;	user/main.c: 98: for(i = 0; i < 8; i++)
00121$:
	clr	a
00112$:
;	user/main.c: 100: setLed(1, i);
	push	a
	push	a
	push	#0x01
	call	_setLed
	popw	x
	push	#0x50
	push	#0xc3
	call	_delay
	popw	x
	pop	a
;	user/main.c: 98: for(i = 0; i < 8; i++)
	inc	a
	cp	a, #0x08
	jrc	00112$
;	user/main.c: 103: for(i = 0; i < 8; i++)
	clr	a
00114$:
;	user/main.c: 105: setLed(0, i);
	push	a
	push	a
	push	#0x00
	call	_setLed
	popw	x
	push	#0x50
	push	#0xc3
	call	_delay
	popw	x
	pop	a
;	user/main.c: 103: for(i = 0; i < 8; i++)
	inc	a
	cp	a, #0x08
	jrc	00114$
	jra	00121$
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
