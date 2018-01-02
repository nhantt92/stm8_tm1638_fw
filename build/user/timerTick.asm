;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Mac OS X x86_64)
;--------------------------------------------------------
	.module timerTick
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM4_ClearFlag
	.globl _TIM4_GetCounter
	.globl _TIM4_ITConfig
	.globl _TIM4_Cmd
	.globl _TIM4_TimeBaseInit
	.globl _TIM4_DeInit
	.globl _CLK_PeripheralClockConfig
	.globl _timeTickUs
	.globl _timeTickMs
	.globl _timeBack
	.globl _timeGet
	.globl _TIMER_Init
	.globl _TIMER_Inc
	.globl _TIMER_InitTime
	.globl _TIMER_CheckTimeUS
	.globl _TIMER_CheckTimeMS
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_timeGet::
	.ds 2
_timeBack::
	.ds 2
_timeTickMs::
	.ds 4
_timeTickUs::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	user/timerTick.c: 18: void TIMER_Init(void)
;	-----------------------------------------
;	 function TIMER_Init
;	-----------------------------------------
_TIMER_Init:
;	user/timerTick.c: 20: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
	push	#0x01
	push	#0x04
	call	_CLK_PeripheralClockConfig
	popw	x
;	user/timerTick.c: 21: TIM4_DeInit(); 
	call	_TIM4_DeInit
;	user/timerTick.c: 23: TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
	push	#0xc8
	push	#0x04
	call	_TIM4_TimeBaseInit
	popw	x
;	user/timerTick.c: 24: TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
	push	#0x01
	call	_TIM4_ClearFlag
	pop	a
;	user/timerTick.c: 25: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
	push	#0x01
	push	#0x01
	call	_TIM4_ITConfig
	popw	x
;	user/timerTick.c: 26: TIM4_Cmd(ENABLE);    // Enable TIM4 
	push	#0x01
	call	_TIM4_Cmd
	pop	a
;	user/timerTick.c: 27: timeTickMs = 0;
	clrw	x
	ldw	_timeTickMs+2, x
	ldw	_timeTickMs+0, x
;	user/timerTick.c: 28: timeTickUs = 0;
	clr	_timeTickUs+0
	ret
;	user/timerTick.c: 31: void TIMER_Inc(void)
;	-----------------------------------------
;	 function TIMER_Inc
;	-----------------------------------------
_TIMER_Inc:
;	user/timerTick.c: 33: timeTickUs++;
	inc	_timeTickUs+0
;	user/timerTick.c: 34: if(timeTickUs%5 == 0){
	clrw	x
	ld	a, _timeTickUs+0
	ld	xl, a
	ld	a, #0x05
	div	x, a
	tnz	a
	jreq	00109$
	ret
00109$:
;	user/timerTick.c: 35: timeTickMs++;
	ldw	x, _timeTickMs+2
	addw	x, #0x0001
	ld	a, _timeTickMs+1
	adc	a, #0x00
	ld	yl, a
	ld	a, _timeTickMs+0
	adc	a, #0x00
	ld	yh, a
	ldw	_timeTickMs+2, x
	ldw	_timeTickMs+0, y
	ret
;	user/timerTick.c: 39: void TIMER_InitTime(TIME *pTime)
;	-----------------------------------------
;	 function TIMER_InitTime
;	-----------------------------------------
_TIMER_InitTime:
;	user/timerTick.c: 41: pTime->timeMS = timeTickMs;
	ldw	x, (0x03, sp)
	incw	x
	incw	x
	ldw	y, _timeTickMs+2
	ldw	(0x2, x), y
	ldw	y, _timeTickMs+0
	ldw	(x), y
	ret
;	user/timerTick.c: 44: uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
;	-----------------------------------------
;	 function TIMER_CheckTimeUS
;	-----------------------------------------
_TIMER_CheckTimeUS:
	sub	sp, #4
;	user/timerTick.c: 46: timeGet = TIM4_GetCounter();
	call	_TIM4_GetCounter
	clrw	x
	ld	xl, a
	ldw	_timeGet+0, x
;	user/timerTick.c: 47: if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
	ldw	y, (0x07, sp)
	ldw	(0x03, sp), y
	ldw	x, (0x03, sp)
	ldw	x, (x)
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	cpw	x, _timeGet+0
	jrnc	00105$
	ldw	x, _timeGet+0
	subw	x, (0x01, sp)
	cpw	x, (0x09, sp)
	jrnc	00101$
00105$:
	ldw	x, (0x01, sp)
	cpw	x, _timeGet+0
	jrule	00102$
	ldw	x, _timeGet+0
	addw	x, #0x00c9
	subw	x, (0x01, sp)
	cpw	x, (0x09, sp)
	jrc	00102$
00101$:
;	user/timerTick.c: 48: pTime->timeUS = timeGet;
	ldw	x, (0x03, sp)
	ldw	y, _timeGet+0
	ldw	(x), y
;	user/timerTick.c: 49: return 0;
	clr	a
	jra	00106$
00102$:
;	user/timerTick.c: 51: return 1;
	ld	a, #0x01
00106$:
	addw	sp, #4
	ret
;	user/timerTick.c: 54: uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
;	-----------------------------------------
;	 function TIMER_CheckTimeMS
;	-----------------------------------------
_TIMER_CheckTimeMS:
	sub	sp, #11
;	user/timerTick.c: 56: if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
	ldw	x, (0x0e, sp)
	incw	x
	incw	x
	ldw	(0x0a, sp), x
	ldw	x, (0x0a, sp)
	ld	a, (0x3, x)
	ld	(0x09, sp), a
	ld	a, (0x2, x)
	ld	(0x08, sp), a
	ldw	x, (x)
	ldw	(0x06, sp), x
	ldw	x, _timeTickMs+2
	subw	x, (0x08, sp)
	ld	a, _timeTickMs+1
	sbc	a, (0x07, sp)
	push	a
	ld	a, _timeTickMs+0
	sbc	a, (0x07, sp)
	ld	(0x03, sp), a
	pop	a
	push	a
	cpw	x, (0x13, sp)
	pop	a
	sbc	a, (0x11, sp)
	ld	a, (0x02, sp)
	sbc	a, (0x10, sp)
	clr	a
	rlc	a
	ld	(0x01, sp), a
	ldw	x, (0x08, sp)
	cpw	x, _timeTickMs+2
	ld	a, (0x07, sp)
	sbc	a, _timeTickMs+1
	ld	a, (0x06, sp)
	sbc	a, _timeTickMs+0
	jrnc	00105$
	tnz	(0x01, sp)
	jreq	00101$
00105$:
	ldw	x, _timeTickMs+2
	cpw	x, (0x08, sp)
	ld	a, _timeTickMs+1
	sbc	a, (0x07, sp)
	ld	a, _timeTickMs+0
	sbc	a, (0x06, sp)
	jrnc	00102$
	tnz	(0x01, sp)
	jrne	00102$
00101$:
;	user/timerTick.c: 57: pTime->timeMS = timeTickMs;
	ldw	x, (0x0a, sp)
	ldw	y, _timeTickMs+2
	ldw	(0x2, x), y
	ldw	y, _timeTickMs+0
	ldw	(x), y
;	user/timerTick.c: 58: return 0;
	clr	a
	jra	00106$
00102$:
;	user/timerTick.c: 60: return 1;
	ld	a, #0x01
00106$:
	addw	sp, #11
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
