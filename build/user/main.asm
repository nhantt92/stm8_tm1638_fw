;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
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
	.globl _getKey
	.globl _displayNumber
	.globl _configDisplay
	.globl _TM1638_Init
	.globl _TIMER_CheckTimeMS
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
	pushw	x
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
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	pushw	x
	call	_TIMER_InitTime
	popw	x
;	user/main.c: 87: for(i = 0; i < 8; i++)
	clr	a
00118$:
;	user/main.c: 89: displayNumber(i, i, FALSE);
	push	a
	push	#0x00
	push	a
	push	a
	call	_displayNumber
	addw	sp, #3
	pop	a
;	user/main.c: 87: for(i = 0; i < 8; i++)
	inc	a
	cp	a, #0x08
	jrc	00118$
;	user/main.c: 91: while(1) 
00116$:
;	user/main.c: 103: if(TIMER_CheckTimeMS(&tick, 100) == 0)
	ldw	y, (0x01, sp)
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	pushw	y
	call	_TIMER_CheckTimeMS
	addw	sp, #6
	tnz	a
	jrne	00116$
;	user/main.c: 105: key = getKey();
	call	_getKey
;	user/main.c: 106: switch(key)
	cp	a, #0x08
	jrule	00152$
	jp	00128$
00152$:
	clrw	x
	ld	xl, a
	sllw	x
	ldw	x, (#00153$, x)
	jp	(x)
00153$:
	.dw	#00110$
	.dw	#00102$
	.dw	#00103$
	.dw	#00104$
	.dw	#00105$
	.dw	#00106$
	.dw	#00107$
	.dw	#00108$
	.dw	#00109$
;	user/main.c: 108: case 1: setLed(1, 0);
00102$:
	push	#0x00
	push	#0x01
	call	_setLed
	popw	x
;	user/main.c: 109: break;
	jra	00116$
;	user/main.c: 110: case 2: setLed(1, 1);
00103$:
	push	#0x01
	push	#0x01
	call	_setLed
	popw	x
;	user/main.c: 111: break;
	jra	00116$
;	user/main.c: 112: case 3: setLed(1, 2);
00104$:
	push	#0x02
	push	#0x01
	call	_setLed
	popw	x
;	user/main.c: 113: break;
	jra	00116$
;	user/main.c: 114: case 4: setLed(1, 3);
00105$:
	push	#0x03
	push	#0x01
	call	_setLed
	popw	x
;	user/main.c: 115: break;
	jra	00116$
;	user/main.c: 116: case 5: setLed(1, 4);
00106$:
	push	#0x04
	push	#0x01
	call	_setLed
	popw	x
;	user/main.c: 117: break;
	jp	00116$
;	user/main.c: 118: case 6: setLed(1, 5);
00107$:
	push	#0x05
	push	#0x01
	call	_setLed
	popw	x
;	user/main.c: 119: break;
	jp	00116$
;	user/main.c: 120: case 7: setLed(1, 6);
00108$:
	push	#0x06
	push	#0x01
	call	_setLed
	popw	x
;	user/main.c: 121: break;
	jp	00116$
;	user/main.c: 122: case 8: setLed(1, 7);
00109$:
	push	#0x07
	push	#0x01
	call	_setLed
	popw	x
;	user/main.c: 123: break;
	jp	00116$
;	user/main.c: 124: default:  
00110$:
;	user/main.c: 125: for(i = 0; i < 8; i++)
00128$:
	clr	a
00120$:
;	user/main.c: 127: setLed(0, i);
	push	a
	push	a
	push	#0x00
	call	_setLed
	popw	x
	pop	a
;	user/main.c: 125: for(i = 0; i < 8; i++)
	inc	a
	cp	a, #0x08
	jrc	00120$
;	user/main.c: 130: }
	jp	00116$
	popw	x
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
