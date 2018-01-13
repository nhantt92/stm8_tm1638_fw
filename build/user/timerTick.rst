                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module timerTick
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM4_ClearFlag
                                     12 	.globl _TIM4_GetCounter
                                     13 	.globl _TIM4_ITConfig
                                     14 	.globl _TIM4_Cmd
                                     15 	.globl _TIM4_TimeBaseInit
                                     16 	.globl _TIM4_DeInit
                                     17 	.globl _CLK_PeripheralClockConfig
                                     18 	.globl _timeTickUs
                                     19 	.globl _timeTickMs
                                     20 	.globl _timeBack
                                     21 	.globl _timeGet
                                     22 	.globl _TIMER_Init
                                     23 	.globl _TIMER_Inc
                                     24 	.globl _TIMER_InitTime
                                     25 	.globl _TIMER_CheckTimeUS
                                     26 	.globl _TIMER_CheckTimeMS
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DATA
      000007                         31 _timeGet::
      000007                         32 	.ds 2
      000009                         33 _timeBack::
      000009                         34 	.ds 2
      00000B                         35 _timeTickMs::
      00000B                         36 	.ds 4
      00000F                         37 _timeTickUs::
      00000F                         38 	.ds 1
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area INITIALIZED
                                     43 ;--------------------------------------------------------
                                     44 ; absolute external ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area DABS (ABS)
                                     47 ;--------------------------------------------------------
                                     48 ; global & static initialisations
                                     49 ;--------------------------------------------------------
                                     50 	.area HOME
                                     51 	.area GSINIT
                                     52 	.area GSFINAL
                                     53 	.area GSINIT
                                     54 ;--------------------------------------------------------
                                     55 ; Home
                                     56 ;--------------------------------------------------------
                                     57 	.area HOME
                                     58 	.area HOME
                                     59 ;--------------------------------------------------------
                                     60 ; code
                                     61 ;--------------------------------------------------------
                                     62 	.area CODE
                                     63 ;	user/timerTick.c: 18: void TIMER_Init(void)
                                     64 ;	-----------------------------------------
                                     65 ;	 function TIMER_Init
                                     66 ;	-----------------------------------------
      008210                         67 _TIMER_Init:
                                     68 ;	user/timerTick.c: 20: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
      008210 4B 01            [ 1]   69 	push	#0x01
      008212 4B 04            [ 1]   70 	push	#0x04
      008214 CD 87 1D         [ 4]   71 	call	_CLK_PeripheralClockConfig
      008217 85               [ 2]   72 	popw	x
                                     73 ;	user/timerTick.c: 21: TIM4_DeInit(); 
      008218 CD 8A D2         [ 4]   74 	call	_TIM4_DeInit
                                     75 ;	user/timerTick.c: 23: TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
      00821B 4B C8            [ 1]   76 	push	#0xc8
      00821D 4B 04            [ 1]   77 	push	#0x04
      00821F CD 8A EB         [ 4]   78 	call	_TIM4_TimeBaseInit
      008222 85               [ 2]   79 	popw	x
                                     80 ;	user/timerTick.c: 24: TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
      008223 4B 01            [ 1]   81 	push	#0x01
      008225 CD 8B 1B         [ 4]   82 	call	_TIM4_ClearFlag
      008228 84               [ 1]   83 	pop	a
                                     84 ;	user/timerTick.c: 25: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      008229 4B 01            [ 1]   85 	push	#0x01
      00822B 4B 01            [ 1]   86 	push	#0x01
      00822D CD 8A FD         [ 4]   87 	call	_TIM4_ITConfig
      008230 85               [ 2]   88 	popw	x
                                     89 ;	user/timerTick.c: 26: TIM4_Cmd(ENABLE);    // Enable TIM4 
      008231 4B 01            [ 1]   90 	push	#0x01
      008233 CD 8A F8         [ 4]   91 	call	_TIM4_Cmd
      008236 84               [ 1]   92 	pop	a
                                     93 ;	user/timerTick.c: 27: timeTickMs = 0;
      008237 5F               [ 1]   94 	clrw	x
      008238 CF 00 0D         [ 2]   95 	ldw	_timeTickMs+2, x
      00823B CF 00 0B         [ 2]   96 	ldw	_timeTickMs+0, x
                                     97 ;	user/timerTick.c: 28: timeTickUs = 0;
      00823E 72 5F 00 0F      [ 1]   98 	clr	_timeTickUs+0
      008242 81               [ 4]   99 	ret
                                    100 ;	user/timerTick.c: 31: void TIMER_Inc(void)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIMER_Inc
                                    103 ;	-----------------------------------------
      008243                        104 _TIMER_Inc:
                                    105 ;	user/timerTick.c: 33: timeTickUs++;
      008243 72 5C 00 0F      [ 1]  106 	inc	_timeTickUs+0
                                    107 ;	user/timerTick.c: 34: if(timeTickUs%5 == 0){
      008247 5F               [ 1]  108 	clrw	x
      008248 C6 00 0F         [ 1]  109 	ld	a, _timeTickUs+0
      00824B 97               [ 1]  110 	ld	xl, a
      00824C A6 05            [ 1]  111 	ld	a, #0x05
      00824E 62               [ 2]  112 	div	x, a
      00824F 4D               [ 1]  113 	tnz	a
      008250 27 01            [ 1]  114 	jreq	00109$
      008252 81               [ 4]  115 	ret
      008253                        116 00109$:
                                    117 ;	user/timerTick.c: 35: timeTickMs++;
      008253 CE 00 0D         [ 2]  118 	ldw	x, _timeTickMs+2
      008256 1C 00 01         [ 2]  119 	addw	x, #0x0001
      008259 C6 00 0C         [ 1]  120 	ld	a, _timeTickMs+1
      00825C A9 00            [ 1]  121 	adc	a, #0x00
      00825E 90 97            [ 1]  122 	ld	yl, a
      008260 C6 00 0B         [ 1]  123 	ld	a, _timeTickMs+0
      008263 A9 00            [ 1]  124 	adc	a, #0x00
      008265 90 95            [ 1]  125 	ld	yh, a
      008267 CF 00 0D         [ 2]  126 	ldw	_timeTickMs+2, x
      00826A 90 CF 00 0B      [ 2]  127 	ldw	_timeTickMs+0, y
      00826E 81               [ 4]  128 	ret
                                    129 ;	user/timerTick.c: 39: void TIMER_InitTime(TIME *pTime)
                                    130 ;	-----------------------------------------
                                    131 ;	 function TIMER_InitTime
                                    132 ;	-----------------------------------------
      00826F                        133 _TIMER_InitTime:
                                    134 ;	user/timerTick.c: 41: pTime->timeMS = timeTickMs;
      00826F 1E 03            [ 2]  135 	ldw	x, (0x03, sp)
      008271 5C               [ 2]  136 	incw	x
      008272 5C               [ 2]  137 	incw	x
      008273 90 CE 00 0D      [ 2]  138 	ldw	y, _timeTickMs+2
      008277 EF 02            [ 2]  139 	ldw	(0x2, x), y
      008279 90 CE 00 0B      [ 2]  140 	ldw	y, _timeTickMs+0
      00827D FF               [ 2]  141 	ldw	(x), y
      00827E 81               [ 4]  142 	ret
                                    143 ;	user/timerTick.c: 44: uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
                                    144 ;	-----------------------------------------
                                    145 ;	 function TIMER_CheckTimeUS
                                    146 ;	-----------------------------------------
      00827F                        147 _TIMER_CheckTimeUS:
      00827F 52 04            [ 2]  148 	sub	sp, #4
                                    149 ;	user/timerTick.c: 46: timeGet = TIM4_GetCounter();
      008281 CD 8B 08         [ 4]  150 	call	_TIM4_GetCounter
      008284 5F               [ 1]  151 	clrw	x
      008285 97               [ 1]  152 	ld	xl, a
      008286 CF 00 07         [ 2]  153 	ldw	_timeGet+0, x
                                    154 ;	user/timerTick.c: 47: if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
      008289 16 07            [ 2]  155 	ldw	y, (0x07, sp)
      00828B 17 01            [ 2]  156 	ldw	(0x01, sp), y
      00828D 1E 01            [ 2]  157 	ldw	x, (0x01, sp)
      00828F FE               [ 2]  158 	ldw	x, (x)
      008290 1F 03            [ 2]  159 	ldw	(0x03, sp), x
      008292 1E 03            [ 2]  160 	ldw	x, (0x03, sp)
      008294 C3 00 07         [ 2]  161 	cpw	x, _timeGet+0
      008297 24 0A            [ 1]  162 	jrnc	00105$
      008299 CE 00 07         [ 2]  163 	ldw	x, _timeGet+0
      00829C 72 F0 03         [ 2]  164 	subw	x, (0x03, sp)
      00829F 13 09            [ 2]  165 	cpw	x, (0x09, sp)
      0082A1 24 14            [ 1]  166 	jrnc	00101$
      0082A3                        167 00105$:
      0082A3 1E 03            [ 2]  168 	ldw	x, (0x03, sp)
      0082A5 C3 00 07         [ 2]  169 	cpw	x, _timeGet+0
      0082A8 23 17            [ 2]  170 	jrule	00102$
      0082AA CE 00 07         [ 2]  171 	ldw	x, _timeGet+0
      0082AD 1C 00 C9         [ 2]  172 	addw	x, #0x00c9
      0082B0 72 F0 03         [ 2]  173 	subw	x, (0x03, sp)
      0082B3 13 09            [ 2]  174 	cpw	x, (0x09, sp)
      0082B5 25 0A            [ 1]  175 	jrc	00102$
      0082B7                        176 00101$:
                                    177 ;	user/timerTick.c: 48: pTime->timeUS = timeGet;
      0082B7 1E 01            [ 2]  178 	ldw	x, (0x01, sp)
      0082B9 90 CE 00 07      [ 2]  179 	ldw	y, _timeGet+0
      0082BD FF               [ 2]  180 	ldw	(x), y
                                    181 ;	user/timerTick.c: 49: return 0;
      0082BE 4F               [ 1]  182 	clr	a
      0082BF 20 02            [ 2]  183 	jra	00106$
      0082C1                        184 00102$:
                                    185 ;	user/timerTick.c: 51: return 1;
      0082C1 A6 01            [ 1]  186 	ld	a, #0x01
      0082C3                        187 00106$:
      0082C3 5B 04            [ 2]  188 	addw	sp, #4
      0082C5 81               [ 4]  189 	ret
                                    190 ;	user/timerTick.c: 54: uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
                                    191 ;	-----------------------------------------
                                    192 ;	 function TIMER_CheckTimeMS
                                    193 ;	-----------------------------------------
      0082C6                        194 _TIMER_CheckTimeMS:
      0082C6 52 0B            [ 2]  195 	sub	sp, #11
                                    196 ;	user/timerTick.c: 56: if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
      0082C8 1E 0E            [ 2]  197 	ldw	x, (0x0e, sp)
      0082CA 5C               [ 2]  198 	incw	x
      0082CB 5C               [ 2]  199 	incw	x
      0082CC 1F 0A            [ 2]  200 	ldw	(0x0a, sp), x
      0082CE 1E 0A            [ 2]  201 	ldw	x, (0x0a, sp)
      0082D0 E6 03            [ 1]  202 	ld	a, (0x3, x)
      0082D2 6B 04            [ 1]  203 	ld	(0x04, sp), a
      0082D4 E6 02            [ 1]  204 	ld	a, (0x2, x)
      0082D6 6B 03            [ 1]  205 	ld	(0x03, sp), a
      0082D8 FE               [ 2]  206 	ldw	x, (x)
      0082D9 1F 01            [ 2]  207 	ldw	(0x01, sp), x
      0082DB CE 00 0D         [ 2]  208 	ldw	x, _timeTickMs+2
      0082DE 72 F0 03         [ 2]  209 	subw	x, (0x03, sp)
      0082E1 C6 00 0C         [ 1]  210 	ld	a, _timeTickMs+1
      0082E4 12 02            [ 1]  211 	sbc	a, (0x02, sp)
      0082E6 88               [ 1]  212 	push	a
      0082E7 C6 00 0B         [ 1]  213 	ld	a, _timeTickMs+0
      0082EA 12 02            [ 1]  214 	sbc	a, (0x02, sp)
      0082EC 6B 07            [ 1]  215 	ld	(0x07, sp), a
      0082EE 84               [ 1]  216 	pop	a
      0082EF 88               [ 1]  217 	push	a
      0082F0 13 13            [ 2]  218 	cpw	x, (0x13, sp)
      0082F2 84               [ 1]  219 	pop	a
      0082F3 12 11            [ 1]  220 	sbc	a, (0x11, sp)
      0082F5 7B 06            [ 1]  221 	ld	a, (0x06, sp)
      0082F7 12 10            [ 1]  222 	sbc	a, (0x10, sp)
      0082F9 4F               [ 1]  223 	clr	a
      0082FA 49               [ 1]  224 	rlc	a
      0082FB 6B 05            [ 1]  225 	ld	(0x05, sp), a
      0082FD 1E 03            [ 2]  226 	ldw	x, (0x03, sp)
      0082FF C3 00 0D         [ 2]  227 	cpw	x, _timeTickMs+2
      008302 7B 02            [ 1]  228 	ld	a, (0x02, sp)
      008304 C2 00 0C         [ 1]  229 	sbc	a, _timeTickMs+1
      008307 7B 01            [ 1]  230 	ld	a, (0x01, sp)
      008309 C2 00 0B         [ 1]  231 	sbc	a, _timeTickMs+0
      00830C 24 04            [ 1]  232 	jrnc	00105$
      00830E 0D 05            [ 1]  233 	tnz	(0x05, sp)
      008310 27 15            [ 1]  234 	jreq	00101$
      008312                        235 00105$:
      008312 CE 00 0D         [ 2]  236 	ldw	x, _timeTickMs+2
      008315 13 03            [ 2]  237 	cpw	x, (0x03, sp)
      008317 C6 00 0C         [ 1]  238 	ld	a, _timeTickMs+1
      00831A 12 02            [ 1]  239 	sbc	a, (0x02, sp)
      00831C C6 00 0B         [ 1]  240 	ld	a, _timeTickMs+0
      00831F 12 01            [ 1]  241 	sbc	a, (0x01, sp)
      008321 24 14            [ 1]  242 	jrnc	00102$
      008323 0D 05            [ 1]  243 	tnz	(0x05, sp)
      008325 26 10            [ 1]  244 	jrne	00102$
      008327                        245 00101$:
                                    246 ;	user/timerTick.c: 57: pTime->timeMS = timeTickMs;
      008327 1E 0A            [ 2]  247 	ldw	x, (0x0a, sp)
      008329 90 CE 00 0D      [ 2]  248 	ldw	y, _timeTickMs+2
      00832D EF 02            [ 2]  249 	ldw	(0x2, x), y
      00832F 90 CE 00 0B      [ 2]  250 	ldw	y, _timeTickMs+0
      008333 FF               [ 2]  251 	ldw	(x), y
                                    252 ;	user/timerTick.c: 58: return 0;
      008334 4F               [ 1]  253 	clr	a
      008335 20 02            [ 2]  254 	jra	00106$
      008337                        255 00102$:
                                    256 ;	user/timerTick.c: 60: return 1;
      008337 A6 01            [ 1]  257 	ld	a, #0x01
      008339                        258 00106$:
      008339 5B 0B            [ 2]  259 	addw	sp, #11
      00833B 81               [ 4]  260 	ret
                                    261 	.area CODE
                                    262 	.area INITIALIZER
                                    263 	.area CABS (ABS)
