;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module tm1638
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ERROR_DATA
	.globl _NUMBER_FONT
	.globl _GPIO_ReadInputPin
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _tm1638
	.globl _TM1638_Init
	.globl _sendChar
	.globl _configDisplay
	.globl _setDisplayDigit
	.globl _clearDisplayDigit
	.globl _setDisplay
	.globl _clearDisplay
	.globl _displayNumber
	.globl _setLed
	.globl _getKey
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_tm1638::
	.ds 8
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
;	user/tm1638.c: 45: void TM1638_Init(GPIO_TypeDef* displayPort, GPIO_Pin_TypeDef StbPin, GPIO_Pin_TypeDef ClkPin, GPIO_Pin_TypeDef DataPin)
;	-----------------------------------------
;	 function TM1638_Init
;	-----------------------------------------
_TM1638_Init:
	sub	sp, #11
;	user/tm1638.c: 48: tm1638.displayPort = displayPort;
	ldw	x, #_tm1638+0
	ldw	y, (0x0e, sp)
	ldw	(x), y
;	user/tm1638.c: 49: tm1638.StbPin = StbPin;
	ldw	x, #_tm1638+0
	ldw	(0x03, sp), x
	ldw	x, (0x03, sp)
	incw	x
	incw	x
	ldw	(0x0a, sp), x
	ldw	x, (0x0a, sp)
	ld	a, (0x10, sp)
	ld	(x), a
;	user/tm1638.c: 50: tm1638.ClkPin = ClkPin;
	ldw	x, (0x03, sp)
	addw	x, #0x0003
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	ld	a, (0x11, sp)
	ld	(x), a
;	user/tm1638.c: 51: tm1638.DataPin = DataPin;
	ldw	x, (0x03, sp)
	ld	a, (0x12, sp)
	ld	(0x0004, x), a
;	user/tm1638.c: 52: tm1638.intensity = 4;
	ldw	x, (0x03, sp)
	addw	x, #0x0005
	ldw	(0x08, sp), x
	ldw	x, (0x08, sp)
	ld	a, #0x04
	ld	(x), a
;	user/tm1638.c: 53: tm1638.displays = 8;
	ldw	x, (0x03, sp)
	ld	a, #0x08
	ld	(0x0006, x), a
;	user/tm1638.c: 54: tm1638.active = TRUE;
	ldw	x, (0x03, sp)
	addw	x, #0x0007
	ldw	(0x06, sp), x
	ldw	x, (0x06, sp)
	ld	a, #0x01
	ld	(x), a
;	user/tm1638.c: 55: GPIO_Init(tm1638.displayPort, tm1638.StbPin | tm1638.ClkPin | tm1638.DataPin, GPIO_MODE_OUT_OD_HIZ_FAST);
	ld	a, (0x10, sp)
	or	a, (0x11, sp)
	or	a, (0x12, sp)
	ldw	x, (0x03, sp)
	ldw	x, (x)
	push	#0xb0
	push	a
	pushw	x
	call	_GPIO_Init
	addw	sp, #4
;	user/tm1638.c: 56: Set(tm1638.StbPin);
	ldw	x, (0x0a, sp)
	ld	a, (x)
	ldw	x, (0x03, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/tm1638.c: 57: Set(tm1638.ClkPin);
	ldw	x, (0x01, sp)
	ld	a, (x)
	ldw	x, (0x03, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/tm1638.c: 58: writeCmd(0x40); // send cmd write data
	push	#0x40
	call	_writeCmd
	pop	a
;	user/tm1638.c: 59: writeCmd(0x80|(tm1638.active ? 8 : 0)|tm1638.intensity); //display and brightness = 4
	ldw	x, (0x06, sp)
	ld	a, (x)
	tnz	a
	jreq	00106$
	ld	a, #0x08
	.byte 0x21
00106$:
	clr	a
00107$:
	or	a, #0x80
	ld	(0x05, sp), a
	ldw	x, (0x08, sp)
	ld	a, (x)
	or	a, (0x05, sp)
	push	a
	call	_writeCmd
	pop	a
;	user/tm1638.c: 60: Reset(tm1638.StbPin);
	ldw	x, (0x0a, sp)
	ld	a, (x)
	ldw	x, (0x03, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/tm1638.c: 61: writeByte(0xC0);
	push	#0xc0
	call	_writeByte
	pop	a
;	user/tm1638.c: 62: for(i = 0; i < 16; i++)
	clr	a
00102$:
;	user/tm1638.c: 63: writeByte(0x00);
	push	a
	push	#0x00
	call	_writeByte
	pop	a
	pop	a
;	user/tm1638.c: 62: for(i = 0; i < 16; i++)
	inc	a
	cp	a, #0x10
	jrc	00102$
;	user/tm1638.c: 64: Set(tm1638.StbPin);
	ldw	x, (0x0a, sp)
	ld	a, (x)
	ldw	x, (0x03, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #14
	ret
;	user/tm1638.c: 67: static void writeByte(uint8_t byte)
;	-----------------------------------------
;	 function writeByte
;	-----------------------------------------
_writeByte:
	sub	sp, #5
;	user/tm1638.c: 70: for(i = 0; i < 8; i++)
	ldw	x, #_tm1638+0
	ldw	(0x02, sp), x
	ldw	x, (0x02, sp)
	addw	x, #0x0003
	ldw	(0x04, sp), x
	clr	(0x01, sp)
00105$:
;	user/tm1638.c: 72: Reset(tm1638.ClkPin); //input Data at rising edge of the clock
	ldw	x, (0x04, sp)
	ld	a, (x)
	ldw	x, (0x02, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
	ldw	x, (0x02, sp)
	ldw	x, (x)
;	user/tm1638.c: 73: if(byte&0x01) Set(tm1638.DataPin);
	ldw	y, (0x02, sp)
	ld	a, (0x4, y)
	push	a
	ld	a, (0x09, sp)
	srl	a
	pop	a
	jrnc	00102$
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00103$
00102$:
;	user/tm1638.c: 74: else Reset(tm1638.DataPin);
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
00103$:
;	user/tm1638.c: 75: Set(tm1638.ClkPin);
	ldw	x, (0x04, sp)
	ld	a, (x)
	ldw	x, (0x02, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/tm1638.c: 76: byte>>=1;
	srl	(0x08, sp)
;	user/tm1638.c: 70: for(i = 0; i < 8; i++)
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x08
	jrc	00105$
	addw	sp, #5
	ret
;	user/tm1638.c: 80: static uint8_t readByte(void)
;	-----------------------------------------
;	 function readByte
;	-----------------------------------------
_readByte:
	sub	sp, #8
;	user/tm1638.c: 83: uint8_t temp = 0x00;
	clr	(0x01, sp)
;	user/tm1638.c: 86: for(i = 0; i < 8; i++)
	ldw	x, #_tm1638+0
	ldw	(0x03, sp), x
	ldw	x, (0x03, sp)
	addw	x, #0x0003
	ldw	(0x07, sp), x
	ldw	y, (0x03, sp)
	ldw	(0x05, sp), y
	clr	(0x02, sp)
00104$:
;	user/tm1638.c: 88: temp>>=1;
	srl	(0x01, sp)
;	user/tm1638.c: 89: Set(tm1638.ClkPin); //Output Data at falling edge of the clock
	ldw	x, (0x07, sp)
	ld	a, (x)
	ldw	x, (0x03, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/tm1638.c: 90: if(Get(tm1638.DataPin)) temp |= 0x80;
	ldw	x, (0x05, sp)
	ld	a, (0x4, x)
	ldw	x, (0x03, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_ReadInputPin
	addw	sp, #3
	tnz	a
	jreq	00102$
	ld	a, (0x01, sp)
	or	a, #0x80
	ld	(0x01, sp), a
00102$:
;	user/tm1638.c: 91: Reset(tm1638.ClkPin);
	ldw	x, (0x07, sp)
	ld	a, (x)
	ldw	x, (0x03, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/tm1638.c: 86: for(i = 0; i < 8; i++)
	inc	(0x02, sp)
	ld	a, (0x02, sp)
	cp	a, #0x08
	jrc	00104$
;	user/tm1638.c: 95: return temp;
	ld	a, (0x01, sp)
	addw	sp, #8
	ret
;	user/tm1638.c: 98: static void writeCmd(uint8_t cmd)
;	-----------------------------------------
;	 function writeCmd
;	-----------------------------------------
_writeCmd:
	pushw	x
;	user/tm1638.c: 100: Set(tm1638.StbPin); 
	ldw	x, #_tm1638+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	incw	x
	incw	x
	ld	a, (x)
	ldw	y, (0x01, sp)
	ldw	y, (y)
	pushw	x
	push	a
	pushw	y
	call	_GPIO_WriteHigh
	addw	sp, #3
	popw	x
;	user/tm1638.c: 101: Reset(tm1638.StbPin); // falling edge STB is an instruction
	ld	a, (x)
	ldw	x, (0x01, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/tm1638.c: 102: writeByte(cmd); // Send command
	ld	a, (0x05, sp)
	push	a
	call	_writeByte
	pop	a
	popw	x
	ret
;	user/tm1638.c: 105: static void writeData(uint8_t addr, uint8_t data)
;	-----------------------------------------
;	 function writeData
;	-----------------------------------------
_writeData:
;	user/tm1638.c: 107: writeCmd(0x44); //Setting Data (B7B6: 01): Normal Mode, Fixed addr, Write data
	push	#0x44
	call	_writeCmd
	pop	a
;	user/tm1638.c: 108: writeCmd(0xC0|addr); //Setting Address (B7B6: 11): Display addr: 00H-0FH
	ld	a, (0x03, sp)
	or	a, #0xc0
	push	a
	call	_writeCmd
	pop	a
;	user/tm1638.c: 109: writeByte(data); // Send Data
	ld	a, (0x04, sp)
	push	a
	call	_writeByte
	pop	a
	ret
;	user/tm1638.c: 113: void sendChar(uint8_t pos, uint8_t data, bool dot)
;	-----------------------------------------
;	 function sendChar
;	-----------------------------------------
_sendChar:
;	user/tm1638.c: 115: writeData(pos << 1, data | (dot ? 0x80: 0x00));
	tnz	(0x05, sp)
	jreq	00103$
	ld	a, #0x80
	.byte 0x21
00103$:
	clr	a
00104$:
	or	a, (0x04, sp)
	ld	xl, a
	ld	a, (0x03, sp)
	sll	a
	pushw	x
	addw	sp, #1
	push	a
	call	_writeData
	popw	x
	ret
;	user/tm1638.c: 118: void configDisplay(bool active, uint8_t intensity)
;	-----------------------------------------
;	 function configDisplay
;	-----------------------------------------
_configDisplay:
	sub	sp, #5
;	user/tm1638.c: 120: tm1638.intensity = intensity;
	ldw	x, #_tm1638+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	addw	x, #0x0005
	ld	a, (0x09, sp)
	ld	(x), a
;	user/tm1638.c: 121: tm1638.active = active;
	ldw	y, (0x01, sp)
	addw	y, #0x0007
	ld	a, (0x08, sp)
	ld	(y), a
;	user/tm1638.c: 122: writeCmd(0x80|(tm1638.active ? 8 : 0)| tm1638.intensity); //Display control (B7B6: 10): B3: 1: enable, 0: disable; B2B1B0: 0-7: brighness
	tnz	(0x08, sp)
	jreq	00103$
	ld	a, #0x08
	.byte 0x21
00103$:
	clr	a
00104$:
	or	a, #0x80
	ld	(0x03, sp), a
	ld	a, (x)
	or	a, (0x03, sp)
	push	a
	call	_writeCmd
	pop	a
;	user/tm1638.c: 123: Reset(tm1638.StbPin);
	ldw	x, (0x01, sp)
	incw	x
	incw	x
	ldw	(0x04, sp), x
	ldw	x, (0x04, sp)
	ld	a, (x)
	ldw	x, (0x01, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/tm1638.c: 124: Reset(tm1638.ClkPin);
	ldw	x, (0x01, sp)
	addw	x, #0x0003
	ld	a, (x)
	ldw	y, (0x01, sp)
	ldw	y, (y)
	pushw	x
	push	a
	pushw	y
	call	_GPIO_WriteLow
	addw	sp, #3
	popw	x
;	user/tm1638.c: 125: Set(tm1638.ClkPin);
	ld	a, (x)
	ldw	x, (0x01, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/tm1638.c: 126: Set(tm1638.StbPin);
	ldw	x, (0x04, sp)
	ld	a, (x)
	ldw	x, (0x01, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #8
	ret
;	user/tm1638.c: 129: void setDisplayDigit(uint8_t digit, uint8_t pos, bool dot, const uint8_t numberFont[])
;	-----------------------------------------
;	 function setDisplayDigit
;	-----------------------------------------
_setDisplayDigit:
;	user/tm1638.c: 131: sendChar(pos, numberFont[digit & 0xF], dot);
	ld	a, (0x03, sp)
	and	a, #0x0f
	clrw	x
	ld	xl, a
	addw	x, (0x06, sp)
	ld	a, (x)
	ld	xl, a
	ld	a, (0x05, sp)
	push	a
	ld	a, xl
	push	a
	ld	a, (0x06, sp)
	push	a
	call	_sendChar
	addw	sp, #3
	ret
;	user/tm1638.c: 134: void clearDisplayDigit(uint8_t pos, bool dot)
;	-----------------------------------------
;	 function clearDisplayDigit
;	-----------------------------------------
_clearDisplayDigit:
;	user/tm1638.c: 136: sendChar(pos, 0, dot);
	ld	a, (0x04, sp)
	push	a
	push	#0x00
	ld	a, (0x05, sp)
	push	a
	call	_sendChar
	addw	sp, #3
	ret
;	user/tm1638.c: 139: void setDisplay(const uint8_t values[], uint8_t size)
;	-----------------------------------------
;	 function setDisplay
;	-----------------------------------------
_setDisplay:
;	user/tm1638.c: 142: for(i = 0; i<size; i++) 
	clr	a
00103$:
	cp	a, (0x05, sp)
	jrc	00116$
	ret
00116$:
;	user/tm1638.c: 143: sendChar(i, values[i], 0);
	clrw	x
	ld	xl, a
	addw	x, (0x03, sp)
	push	a
	ld	a, (x)
	ld	xl, a
	pop	a
	push	a
	push	#0x00
	pushw	x
	addw	sp, #1
	push	a
	call	_sendChar
	addw	sp, #3
	pop	a
;	user/tm1638.c: 142: for(i = 0; i<size; i++) 
	inc	a
	jra	00103$
	ret
;	user/tm1638.c: 146: void clearDisplay(void)
;	-----------------------------------------
;	 function clearDisplay
;	-----------------------------------------
_clearDisplay:
;	user/tm1638.c: 149: for(i = 0; i < 8; i++)
	clr	a
00102$:
;	user/tm1638.c: 150: writeData(i << 1, 0);
	ld	xl, a
	sllw	x
	push	a
	push	#0x00
	pushw	x
	addw	sp, #1
	call	_writeData
	popw	x
	pop	a
;	user/tm1638.c: 149: for(i = 0; i < 8; i++)
	inc	a
	cp	a, #0x08
	jrc	00102$
	ret
;	user/tm1638.c: 165: void displayNumber(uint8_t pos, uint8_t number, bool dot)
;	-----------------------------------------
;	 function displayNumber
;	-----------------------------------------
_displayNumber:
;	user/tm1638.c: 167: setDisplayDigit(number, pos, dot, NUMBER_FONT);
	ldw	x, #_NUMBER_FONT+0
	pushw	x
	ld	a, (0x07, sp)
	push	a
	ld	a, (0x06, sp)
	push	a
	ld	a, (0x08, sp)
	push	a
	call	_setDisplayDigit
	addw	sp, #5
	ret
;	user/tm1638.c: 170: void setLed(uint8_t color, uint8_t pos)
;	-----------------------------------------
;	 function setLed
;	-----------------------------------------
_setLed:
;	user/tm1638.c: 172: writeData((pos<<1)+1, color);
	ld	a, (0x04, sp)
	sll	a
	inc	a
	ld	xl, a
	ld	a, (0x03, sp)
	push	a
	ld	a, xl
	push	a
	call	_writeData
	popw	x
	ret
;	user/tm1638.c: 177: uint8_t getKey(void)
;	-----------------------------------------
;	 function getKey
;	-----------------------------------------
_getKey:
	sub	sp, #8
;	user/tm1638.c: 181: uint16_t key2 = 0x00;
	clrw	x
	ldw	(0x04, sp), x
;	user/tm1638.c: 182: writeCmd(0x42);
	push	#0x42
	call	_writeCmd
	pop	a
;	user/tm1638.c: 183: Set(tm1638.DataPin);
	ldw	x, #_tm1638+0
	ldw	(0x06, sp), x
	ldw	y, (0x06, sp)
	ld	a, (0x4, y)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/tm1638.c: 184: for(i = 0; i < 4; i++)
	clr	(0x03, sp)
00105$:
;	user/tm1638.c: 186: key1 = readByte();
	call	_readByte
;	user/tm1638.c: 187: key2|= (key1<<i);
	clrw	x
	ld	xl, a
	ld	a, (0x03, sp)
	jreq	00133$
00132$:
	sllw	x
	dec	a
	jrne	00132$
00133$:
	ld	a, xl
	or	a, (0x05, sp)
	rlwa	x
	or	a, (0x04, sp)
	ld	xh, a
	ldw	(0x04, sp), x
;	user/tm1638.c: 184: for(i = 0; i < 4; i++)
	inc	(0x03, sp)
	ld	a, (0x03, sp)
	cp	a, #0x04
	jrc	00105$
;	user/tm1638.c: 189: key2>>=1;
	ldw	x, (0x04, sp)
	srlw	x
	ldw	(0x01, sp), x
;	user/tm1638.c: 190: for(i = 0; i < 8; i++)
	clr	(0x08, sp)
	clr	a
00107$:
;	user/tm1638.c: 192: if(0x01<<i ==key2) return i+1;
	push	a
	ldw	x, #0x0001
	tnz	a
	jreq	00136$
00135$:
	sllw	x
	dec	a
	jrne	00135$
00136$:
	pop	a
	cpw	x, (0x01, sp)
	jrne	00108$
	ld	a, (0x08, sp)
	inc	a
	jra	00109$
00108$:
;	user/tm1638.c: 190: for(i = 0; i < 8; i++)
	inc	a
	ld	(0x08, sp), a
	cp	a, #0x08
	jrc	00107$
;	user/tm1638.c: 194: return 0;
	clr	a
00109$:
	addw	sp, #8
	ret
	.area CODE
_NUMBER_FONT:
	.db #0x3f	; 63
	.db #0x06	; 6
	.db #0x5b	; 91
	.db #0x4f	; 79	'O'
	.db #0x66	; 102	'f'
	.db #0x6d	; 109	'm'
	.db #0x7d	; 125
	.db #0x07	; 7
	.db #0x7f	; 127
	.db #0x6f	; 111	'o'
	.db #0x77	; 119	'w'
	.db #0x7c	; 124
	.db #0x39	; 57	'9'
	.db #0x5e	; 94
	.db #0x79	; 121	'y'
	.db #0x71	; 113	'q'
_ERROR_DATA:
	.db #0x79	; 121	'y'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x5c	; 92
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area INITIALIZER
	.area CABS (ABS)
