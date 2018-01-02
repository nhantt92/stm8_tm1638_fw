;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module tm1638
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _tm_dat
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
	.globl _TM1638_SendData
	.globl _TM1638_SendIntData
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_tm1638::
	.ds 7
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
;	user/tm1638.c: 20: void TM1638_Init(GPIO_TypeDef* displayPort, GPIO_Pin_TypeDef StbPin, GPIO_Pin_TypeDef ClkPin, GPIO_Pin_TypeDef DataPin)
;	-----------------------------------------
;	 function TM1638_Init
;	-----------------------------------------
_TM1638_Init:
	sub	sp, #10
;	user/tm1638.c: 23: tm1638.displayPort = displayPort;
	ldw	x, #_tm1638+0
	ldw	y, (0x0d, sp)
	ldw	(x), y
;	user/tm1638.c: 24: tm1638.StbPin = StbPin;
	ldw	x, #_tm1638+0
	ldw	(0x07, sp), x
	ldw	x, (0x07, sp)
	incw	x
	incw	x
	ldw	(0x03, sp), x
	ldw	x, (0x03, sp)
	ld	a, (0x0f, sp)
	ld	(x), a
;	user/tm1638.c: 25: tm1638.ClkPin = ClkPin;
	ldw	x, (0x07, sp)
	addw	x, #0x0003
	ldw	(0x09, sp), x
	ldw	x, (0x09, sp)
	ld	a, (0x10, sp)
	ld	(x), a
;	user/tm1638.c: 26: tm1638.DataPin = DataPin;
	ldw	x, (0x07, sp)
	ld	a, (0x11, sp)
	ld	(0x0004, x), a
;	user/tm1638.c: 27: tm1638.intensity = 4;
	ldw	x, (0x07, sp)
	addw	x, #0x0005
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	ld	a, #0x04
	ld	(x), a
;	user/tm1638.c: 28: tm1638.active = TRUE;
	ldw	x, (0x07, sp)
	addw	x, #0x0006
	ldw	(0x05, sp), x
	ldw	x, (0x05, sp)
	ld	a, #0x01
	ld	(x), a
;	user/tm1638.c: 29: GPIO_Init(tm1638.displayPort, tm1638.StbPin | tm1638.ClkPin | tm1638.DataPin, GPIO_MODE_OUT_OD_HIZ_FAST);
	ld	a, (0x0f, sp)
	or	a, (0x10, sp)
	or	a, (0x11, sp)
	ldw	x, (0x07, sp)
	ldw	x, (x)
	push	#0xb0
	push	a
	pushw	x
	call	_GPIO_Init
	addw	sp, #4
;	user/tm1638.c: 30: Set(tm1638.StbPin);
	ldw	x, (0x03, sp)
	ld	a, (x)
	ldw	x, (0x07, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/tm1638.c: 31: Set(tm1638.ClkPin);
	ldw	x, (0x09, sp)
	ld	a, (x)
	ldw	x, (0x07, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/tm1638.c: 32: writeCmd(0x40); // send cmd write data
	push	#0x40
	call	_writeCmd
	pop	a
;	user/tm1638.c: 33: writeCmd(0x80|tm1638.active ? 8 : 0| tm1638.intensity); //display and brightness = 4
	ldw	x, (0x05, sp)
	ld	a, (x)
	or	a, #0x80
	tnz	a
	jreq	00106$
	ld	a, #0x08
	jra	00107$
00106$:
	ldw	x, (0x01, sp)
	ld	a, (x)
00107$:
	push	a
	call	_writeCmd
	pop	a
;	user/tm1638.c: 34: Reset(tm1638.StbPin);
	ldw	x, (0x03, sp)
	ld	a, (x)
	ldw	x, (0x07, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/tm1638.c: 35: writeByte(0xC0);
	push	#0xc0
	call	_writeByte
	pop	a
;	user/tm1638.c: 36: for(i = 0; i < 16; i++)
	clr	a
00102$:
;	user/tm1638.c: 37: writeByte(0x00);
	push	a
	push	#0x00
	call	_writeByte
	pop	a
	pop	a
;	user/tm1638.c: 36: for(i = 0; i < 16; i++)
	inc	a
	cp	a, #0x10
	jrc	00102$
;	user/tm1638.c: 38: Set(tm1638.StbPin);
	ldw	x, (0x03, sp)
	ld	a, (x)
	ldw	x, (0x07, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #13
	ret
;	user/tm1638.c: 41: static void writeByte(uint8_t byte)
;	-----------------------------------------
;	 function writeByte
;	-----------------------------------------
_writeByte:
	sub	sp, #5
;	user/tm1638.c: 44: for(i = 0; i < 8; i++)
	ldw	x, #_tm1638+0
	ldw	(0x04, sp), x
	ldw	x, (0x04, sp)
	addw	x, #0x0003
	ldw	(0x02, sp), x
	clr	(0x01, sp)
00105$:
;	user/tm1638.c: 46: Reset(tm1638.ClkPin); //input Data at rising edge of the clock
	ldw	x, (0x02, sp)
	ld	a, (x)
	ldw	x, (0x04, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
	ldw	x, (0x04, sp)
	ldw	x, (x)
;	user/tm1638.c: 47: if(byte&0x01) Set(tm1638.DataPin);
	ldw	y, (0x04, sp)
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
;	user/tm1638.c: 48: else Reset(tm1638.DataPin);
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
00103$:
;	user/tm1638.c: 49: byte>>=1;
	srl	(0x08, sp)
;	user/tm1638.c: 50: Set(tm1638.ClkPin);
	ldw	x, (0x02, sp)
	ld	a, (x)
	ldw	x, (0x04, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/tm1638.c: 44: for(i = 0; i < 8; i++)
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x08
	jrc	00105$
	addw	sp, #5
	ret
;	user/tm1638.c: 54: static uint8_t readByte(void)
;	-----------------------------------------
;	 function readByte
;	-----------------------------------------
_readByte:
	sub	sp, #8
;	user/tm1638.c: 57: uint8_t temp = 0x00;
	clr	(0x01, sp)
;	user/tm1638.c: 58: GPIO_Init(tm1638.displayPort, tm1638.DataPin, GPIO_MODE_IN_PU_NO_IT);
	ldw	x, #_tm1638+0
	ldw	(0x07, sp), x
	ldw	x, (0x07, sp)
	addw	x, #0x0004
	ldw	(0x05, sp), x
	ldw	x, (0x05, sp)
	ld	a, (x)
	ldw	x, (0x07, sp)
	ldw	x, (x)
	push	#0x40
	push	a
	pushw	x
	call	_GPIO_Init
	addw	sp, #4
;	user/tm1638.c: 59: Set(tm1638.DataPin);
	ldw	x, (0x05, sp)
	ld	a, (x)
	ldw	x, (0x07, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/tm1638.c: 60: for(i = 0; i < 8; i++)
	ldw	x, (0x07, sp)
	addw	x, #0x0003
	ldw	(0x03, sp), x
	clr	(0x02, sp)
00104$:
;	user/tm1638.c: 62: Set(tm1638.ClkPin); //Output Data at falling edge of the clock
	ldw	x, (0x03, sp)
	ld	a, (x)
	ldw	x, (0x07, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/tm1638.c: 63: temp>>=1;
	srl	(0x01, sp)
;	user/tm1638.c: 64: if(Get(tm1638.DataPin)) temp |= 0x80;
	ldw	x, (0x05, sp)
	ld	a, (x)
	push	a
	push	#0x0a
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	tnz	a
	jreq	00102$
	ld	a, (0x01, sp)
	or	a, #0x80
	ld	(0x01, sp), a
00102$:
;	user/tm1638.c: 65: Reset(tm1638.ClkPin);
	ldw	x, (0x03, sp)
	ld	a, (x)
	ldw	x, (0x07, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/tm1638.c: 60: for(i = 0; i < 8; i++)
	inc	(0x02, sp)
	ld	a, (0x02, sp)
	cp	a, #0x08
	jrc	00104$
;	user/tm1638.c: 67: return temp;
	ld	a, (0x01, sp)
	addw	sp, #8
	ret
;	user/tm1638.c: 70: static void writeCmd(uint8_t cmd)
;	-----------------------------------------
;	 function writeCmd
;	-----------------------------------------
_writeCmd:
	pushw	x
;	user/tm1638.c: 72: Set(tm1638.StbPin); 
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
;	user/tm1638.c: 73: Reset(tm1638.StbPin); // falling edge STB is an instruction
	ld	a, (x)
	ldw	x, (0x01, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/tm1638.c: 74: writeByte(cmd); // Send command
	ld	a, (0x05, sp)
	push	a
	call	_writeByte
	pop	a
	popw	x
	ret
;	user/tm1638.c: 78: static void writeData(uint8_t addr, uint8_t data)
;	-----------------------------------------
;	 function writeData
;	-----------------------------------------
_writeData:
;	user/tm1638.c: 80: writeCmd(0x44); //Setting Data (B7B6: 01): Normal Mode, Fixed addr, Write data
	push	#0x44
	call	_writeCmd
	pop	a
;	user/tm1638.c: 81: writeCmd(0xC0|addr); //Setting Address (B7B6: 11): Display addr: 00H-0FH
	ld	a, (0x03, sp)
	or	a, #0xc0
	push	a
	call	_writeCmd
	pop	a
;	user/tm1638.c: 82: writeByte(data); // Send Data
	ld	a, (0x04, sp)
	push	a
	call	_writeByte
	pop	a
	ret
;	user/tm1638.c: 86: void sendChar(uint8_t pos, uint8_t data, bool dot)
;	-----------------------------------------
;	 function sendChar
;	-----------------------------------------
_sendChar:
;	user/tm1638.c: 88: writeData(pos << 1, data | dot ? 0x80: 0x00);
	ld	a, (0x04, sp)
	or	a, (0x05, sp)
	tnz	a
	jreq	00103$
	ld	a, #0x80
	.byte 0x21
00103$:
	clr	a
00104$:
	exg	a, xl
	ld	a, (0x03, sp)
	exg	a, xl
	sllw	x
	push	a
	ld	a, xl
	push	a
	call	_writeData
	popw	x
	ret
;	user/tm1638.c: 91: void configDisplay(bool active, uint8_t intensity)
;	-----------------------------------------
;	 function configDisplay
;	-----------------------------------------
_configDisplay:
	sub	sp, #4
;	user/tm1638.c: 93: tm1638.intensity = intensity;
	ldw	x, #_tm1638+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	addw	x, #0x0005
	ld	a, (0x08, sp)
	ld	(x), a
;	user/tm1638.c: 94: tm1638.active = active;
	ldw	y, (0x01, sp)
	addw	y, #0x0006
	ld	a, (0x07, sp)
	ld	(y), a
;	user/tm1638.c: 95: writeCmd(0x80|tm1638.active ? 8 : 0 | tm1638.intensity); //Display control (B7B6: 10): B3: 1: enable, 0: disable; B2B1B0: 0-7: brighness
	ld	a, (0x07, sp)
	or	a, #0x80
	tnz	a
	jreq	00103$
	ld	a, #0x08
	jra	00104$
00103$:
	ld	a, (x)
00104$:
	push	a
	call	_writeCmd
	pop	a
;	user/tm1638.c: 96: Reset(tm1638.StbPin);
	ldw	x, (0x01, sp)
	incw	x
	incw	x
	ldw	(0x03, sp), x
	ldw	x, (0x03, sp)
	ld	a, (x)
	ldw	x, (0x01, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/tm1638.c: 97: Reset(tm1638.ClkPin);
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
;	user/tm1638.c: 98: Set(tm1638.ClkPin);
	ld	a, (x)
	ldw	x, (0x01, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/tm1638.c: 99: Set(tm1638.StbPin);
	ldw	x, (0x03, sp)
	ld	a, (x)
	ldw	x, (0x01, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #7
	ret
;	user/tm1638.c: 102: void setDisplayDigit(uint8_t digit, uint8_t pos, bool dot, const uint8_t numberFont[])
;	-----------------------------------------
;	 function setDisplayDigit
;	-----------------------------------------
_setDisplayDigit:
;	user/tm1638.c: 104: sendChar(pos, numberFont[digit & 0xF], dot);
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
;	user/tm1638.c: 107: void clearDisplayDigit(uint8_t pos, bool dot)
;	-----------------------------------------
;	 function clearDisplayDigit
;	-----------------------------------------
_clearDisplayDigit:
;	user/tm1638.c: 109: sendChar(pos, 0, dot);
	ld	a, (0x04, sp)
	push	a
	push	#0x00
	ld	a, (0x05, sp)
	push	a
	call	_sendChar
	addw	sp, #3
	ret
;	user/tm1638.c: 112: void setDisplay(const uint8_t values[], uint8_t size)
;	-----------------------------------------
;	 function setDisplay
;	-----------------------------------------
_setDisplay:
;	user/tm1638.c: 115: for(i = 0; i<size; i++) 
	clr	a
00103$:
	cp	a, (0x05, sp)
	jrc	00116$
	ret
00116$:
;	user/tm1638.c: 116: sendChar(i, values[i], 0);
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
;	user/tm1638.c: 115: for(i = 0; i<size; i++) 
	inc	a
	jra	00103$
	ret
;	user/tm1638.c: 119: void clearDisplay(void)
;	-----------------------------------------
;	 function clearDisplay
;	-----------------------------------------
_clearDisplay:
;	user/tm1638.c: 122: for(i = 0; i < 8; i++)
	clr	a
00102$:
;	user/tm1638.c: 123: writeData(i << 1, 0);
	ld	xl, a
	sllw	x
	push	a
	push	#0x00
	pushw	x
	addw	sp, #1
	call	_writeData
	popw	x
	pop	a
;	user/tm1638.c: 122: for(i = 0; i < 8; i++)
	inc	a
	cp	a, #0x08
	jrc	00102$
	ret
;	user/tm1638.c: 147: void TM1638_SendData(uint8_t i, char *str)
;	-----------------------------------------
;	 function TM1638_SendData
;	-----------------------------------------
_TM1638_SendData:
	sub	sp, #16
	ldw	x, #_tm_dat+0
	ldw	(0x0c, sp), x
	ldw	x, #_tm_dat+28
	ldw	(0x0f, sp), x
	ld	a, (0x13, sp)
	ld	(0x0e, sp), a
00115$:
;	user/tm1638.c: 151: for(; i<8; i++)
	ld	a, (0x0e, sp)
	cp	a, #0x08
	jrc	00148$
	jp	00117$
00148$:
;	user/tm1638.c: 153: k = 0;
	clr	(0x02, sp)
;	user/tm1638.c: 154: for(j = 0; j < 14; j++)
	ldw	y, (0x14, sp)
	ldw	(0x0a, sp), y
	clr	(0x03, sp)
00112$:
;	user/tm1638.c: 156: if(*str == tm_dat[0][j])
	ldw	x, (0x0a, sp)
	ld	a, (x)
	ld	yl, a
	ld	a, (0x03, sp)
	sll	a
	ld	(0x09, sp), a
	clrw	x
	ld	a, (0x09, sp)
	ld	xl, a
	addw	x, (0x0c, sp)
	ldw	x, (x)
	ldw	(0x07, sp), x
	clr	a
	ld	yh, a
	ldw	x, y
	cpw	x, (0x07, sp)
	jrne	00113$
;	user/tm1638.c: 158: chr = tm_dat[1][j];
	clrw	x
	ld	a, (0x09, sp)
	ld	xl, a
	addw	x, (0x0f, sp)
	ldw	x, (x)
	ld	a, xl
	ld	(0x01, sp), a
;	user/tm1638.c: 159: k = 1;
	ld	a, #0x01
	ld	(0x02, sp), a
;	user/tm1638.c: 160: break;
	jra	00103$
00113$:
;	user/tm1638.c: 154: for(j = 0; j < 14; j++)
	inc	(0x03, sp)
	ld	a, (0x03, sp)
	cp	a, #0x0e
	jrc	00112$
00103$:
;	user/tm1638.c: 163: if(k == 0)
	tnz	(0x02, sp)
	jrne	00105$
;	user/tm1638.c: 165: chr = 0x00;
	clr	(0x01, sp)
00105$:
;	user/tm1638.c: 167: if(*(str+1)=='.'){
	ldw	x, (0x14, sp)
	incw	x
	ldw	(0x05, sp), x
	ldw	x, (0x05, sp)
	ld	a, (x)
	ld	xl, a
;	user/tm1638.c: 169: writeData(i*2,chr);
	ld	a, (0x0e, sp)
	sll	a
	ld	(0x04, sp), a
;	user/tm1638.c: 167: if(*(str+1)=='.'){
	ld	a, xl
	cp	a, #0x2e
	jrne	00107$
;	user/tm1638.c: 168: chr|=0x80;
	ld	a, (0x01, sp)
	or	a, #0x80
	ld	(0x01, sp), a
;	user/tm1638.c: 169: writeData(i*2,chr);
	ld	a, (0x01, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	call	_writeData
	popw	x
;	user/tm1638.c: 170: str++;
	ldw	y, (0x05, sp)
	ldw	(0x14, sp), y
	jra	00108$
00107$:
;	user/tm1638.c: 172: writeData(i*2,chr);
	ld	a, (0x01, sp)
	push	a
	ld	a, (0x05, sp)
	push	a
	call	_writeData
	popw	x
00108$:
;	user/tm1638.c: 174: str++;
	ldw	x, (0x14, sp)
	incw	x
	ldw	(0x14, sp), x
;	user/tm1638.c: 175: if(*str=='\0')break;
	ldw	x, (0x14, sp)
	ld	a, (x)
	tnz	a
	jreq	00117$
;	user/tm1638.c: 151: for(; i<8; i++)
	inc	(0x0e, sp)
	jp	00115$
00117$:
	addw	sp, #16
	ret
;	user/tm1638.c: 179: void TM1638_SendIntData(uint8_t i, int num)
;	-----------------------------------------
;	 function TM1638_SendIntData
;	-----------------------------------------
_TM1638_SendIntData:
	push	a
;	user/tm1638.c: 182: a = num + '0';
	ld	a, (0x06, sp)
	add	a, #0x30
	ld	(0x01, sp), a
;	user/tm1638.c: 183: TM1638_SendData(i,&a);
	ldw	x, sp
	incw	x
	pushw	x
	ld	a, (0x06, sp)
	push	a
	call	_TM1638_SendData
	addw	sp, #4
	ret
	.area CODE
_tm_dat:
	.dw #0x0030
	.dw #0x0031
	.dw #0x0032
	.dw #0x0033
	.dw #0x0034
	.dw #0x0035
	.dw #0x0036
	.dw #0x0037
	.dw #0x0038
	.dw #0x0039
	.dw #0x002e
	.dw #0x002d
	.dw #0x005f
	.dw #0x0020
	.dw #0x003f
	.dw #0x0006
	.dw #0x005b
	.dw #0x004f
	.dw #0x0066
	.dw #0x006d
	.dw #0x007d
	.dw #0x0007
	.dw #0x007f
	.dw #0x006f
	.dw #0x0080
	.dw #0x0040
	.dw #0x0008
	.dw #0x0000
	.area INITIALIZER
	.area CABS (ABS)
