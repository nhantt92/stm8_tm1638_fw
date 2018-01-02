                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
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
      0081AE                         67 _TIMER_Init:
                                     68 ;	user/timerTick.c: 20: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
      0081AE 4B 01            [ 1]   69 	push	#0x01
      0081B0 4B 04            [ 1]   70 	push	#0x04
      0081B2 CD 86 EE         [ 4]   71 	call	_CLK_PeripheralClockConfig
      0081B5 85               [ 2]   72 	popw	x
                                     73 ;	user/timerTick.c: 21: TIM4_DeInit(); 
      0081B6 CD 8A A3         [ 4]   74 	call	_TIM4_DeInit
                                     75 ;	user/timerTick.c: 23: TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
      0081B9 4B C8            [ 1]   76 	push	#0xc8
      0081BB 4B 04            [ 1]   77 	push	#0x04
      0081BD CD 8A BC         [ 4]   78 	call	_TIM4_TimeBaseInit
      0081C0 85               [ 2]   79 	popw	x
                                     80 ;	user/timerTick.c: 24: TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
      0081C1 4B 01            [ 1]   81 	push	#0x01
      0081C3 CD 8A EC         [ 4]   82 	call	_TIM4_ClearFlag
      0081C6 84               [ 1]   83 	pop	a
                                     84 ;	user/timerTick.c: 25: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      0081C7 4B 01            [ 1]   85 	push	#0x01
      0081C9 4B 01            [ 1]   86 	push	#0x01
      0081CB CD 8A CE         [ 4]   87 	call	_TIM4_ITConfig
      0081CE 85               [ 2]   88 	popw	x
                                     89 ;	user/timerTick.c: 26: TIM4_Cmd(ENABLE);    // Enable TIM4 
      0081CF 4B 01            [ 1]   90 	push	#0x01
      0081D1 CD 8A C9         [ 4]   91 	call	_TIM4_Cmd
      0081D4 84               [ 1]   92 	pop	a
                                     93 ;	user/timerTick.c: 27: timeTickMs = 0;
      0081D5 5F               [ 1]   94 	clrw	x
      0081D6 CF 00 0D         [ 2]   95 	ldw	_timeTickMs+2, x
      0081D9 CF 00 0B         [ 2]   96 	ldw	_timeTickMs+0, x
                                     97 ;	user/timerTick.c: 28: timeTickUs = 0;
      0081DC 72 5F 00 0F      [ 1]   98 	clr	_timeTickUs+0
      0081E0 81               [ 4]   99 	ret
                                    100 ;	user/timerTick.c: 31: void TIMER_Inc(void)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIMER_Inc
                                    103 ;	-----------------------------------------
      0081E1                        104 _TIMER_Inc:
                                    105 ;	user/timerTick.c: 33: timeTickUs++;
      0081E1 72 5C 00 0F      [ 1]  106 	inc	_timeTickUs+0
                                    107 ;	user/timerTick.c: 34: if(timeTickUs%5 == 0){
      0081E5 5F               [ 1]  108 	clrw	x
      0081E6 C6 00 0F         [ 1]  109 	ld	a, _timeTickUs+0
      0081E9 97               [ 1]  110 	ld	xl, a
      0081EA A6 05            [ 1]  111 	ld	a, #0x05
      0081EC 62               [ 2]  112 	div	x, a
      0081ED 4D               [ 1]  113 	tnz	a
      0081EE 27 01            [ 1]  114 	jreq	00109$
      0081F0 81               [ 4]  115 	ret
      0081F1                        116 00109$:
                                    117 ;	user/timerTick.c: 35: timeTickMs++;
      0081F1 CE 00 0D         [ 2]  118 	ldw	x, _timeTickMs+2
      0081F4 1C 00 01         [ 2]  119 	addw	x, #0x0001
      0081F7 C6 00 0C         [ 1]  120 	ld	a, _timeTickMs+1
      0081FA A9 00            [ 1]  121 	adc	a, #0x00
      0081FC 90 97            [ 1]  122 	ld	yl, a
      0081FE C6 00 0B         [ 1]  123 	ld	a, _timeTickMs+0
      008201 A9 00            [ 1]  124 	adc	a, #0x00
      008203 90 95            [ 1]  125 	ld	yh, a
      008205 CF 00 0D         [ 2]  126 	ldw	_timeTickMs+2, x
      008208 90 CF 00 0B      [ 2]  127 	ldw	_timeTickMs+0, y
      00820C 81               [ 4]  128 	ret
                                    129 ;	user/timerTick.c: 39: void TIMER_InitTime(TIME *pTime)
                                    130 ;	-----------------------------------------
                                    131 ;	 function TIMER_InitTime
                                    132 ;	-----------------------------------------
      00820D                        133 _TIMER_InitTime:
                                    134 ;	user/timerTick.c: 41: pTime->timeMS = timeTickMs;
      00820D 1E 03            [ 2]  135 	ldw	x, (0x03, sp)
      00820F 5C               [ 2]  136 	incw	x
      008210 5C               [ 2]  137 	incw	x
      008211 90 CE 00 0D      [ 2]  138 	ldw	y, _timeTickMs+2
      008215 EF 02            [ 2]  139 	ldw	(0x2, x), y
      008217 90 CE 00 0B      [ 2]  140 	ldw	y, _timeTickMs+0
      00821B FF               [ 2]  141 	ldw	(x), y
      00821C 81               [ 4]  142 	ret
                                    143 ;	user/timerTick.c: 44: uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
                                    144 ;	-----------------------------------------
                                    145 ;	 function TIMER_CheckTimeUS
                                    146 ;	-----------------------------------------
      00821D                        147 _TIMER_CheckTimeUS:
      00821D 52 04            [ 2]  148 	sub	sp, #4
                                    149 ;	user/timerTick.c: 46: timeGet = TIM4_GetCounter();
      00821F CD 8A D9         [ 4]  150 	call	_TIM4_GetCounter
      008222 5F               [ 1]  151 	clrw	x
      008223 97               [ 1]  152 	ld	xl, a
      008224 CF 00 07         [ 2]  153 	ldw	_timeGet+0, x
                                    154 ;	user/timerTick.c: 47: if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
      008227 16 07            [ 2]  155 	ldw	y, (0x07, sp)
      008229 17 03            [ 2]  156 	ldw	(0x03, sp), y
      00822B 1E 03            [ 2]  157 	ldw	x, (0x03, sp)
      00822D FE               [ 2]  158 	ldw	x, (x)
      00822E 1F 01            [ 2]  159 	ldw	(0x01, sp), x
      008230 1E 01            [ 2]  160 	ldw	x, (0x01, sp)
      008232 C3 00 07         [ 2]  161 	cpw	x, _timeGet+0
      008235 24 0A            [ 1]  162 	jrnc	00105$
      008237 CE 00 07         [ 2]  163 	ldw	x, _timeGet+0
      00823A 72 F0 01         [ 2]  164 	subw	x, (0x01, sp)
      00823D 13 09            [ 2]  165 	cpw	x, (0x09, sp)
      00823F 24 14            [ 1]  166 	jrnc	00101$
      008241                        167 00105$:
      008241 1E 01            [ 2]  168 	ldw	x, (0x01, sp)
      008243 C3 00 07         [ 2]  169 	cpw	x, _timeGet+0
      008246 23 17            [ 2]  170 	jrule	00102$
      008248 CE 00 07         [ 2]  171 	ldw	x, _timeGet+0
      00824B 1C 00 C9         [ 2]  172 	addw	x, #0x00c9
      00824E 72 F0 01         [ 2]  173 	subw	x, (0x01, sp)
      008251 13 09            [ 2]  174 	cpw	x, (0x09, sp)
      008253 25 0A            [ 1]  175 	jrc	00102$
      008255                        176 00101$:
                                    177 ;	user/timerTick.c: 48: pTime->timeUS = timeGet;
      008255 1E 03            [ 2]  178 	ldw	x, (0x03, sp)
      008257 90 CE 00 07      [ 2]  179 	ldw	y, _timeGet+0
      00825B FF               [ 2]  180 	ldw	(x), y
                                    181 ;	user/timerTick.c: 49: return 0;
      00825C 4F               [ 1]  182 	clr	a
      00825D 20 02            [ 2]  183 	jra	00106$
      00825F                        184 00102$:
                                    185 ;	user/timerTick.c: 51: return 1;
      00825F A6 01            [ 1]  186 	ld	a, #0x01
      008261                        187 00106$:
      008261 5B 04            [ 2]  188 	addw	sp, #4
      008263 81               [ 4]  189 	ret
                                    190 ;	user/timerTick.c: 54: uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
                                    191 ;	-----------------------------------------
                                    192 ;	 function TIMER_CheckTimeMS
                                    193 ;	-----------------------------------------
      008264                        194 _TIMER_CheckTimeMS:
      008264 52 0B            [ 2]  195 	sub	sp, #11
                                    196 ;	user/timerTick.c: 56: if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
      008266 1E 0E            [ 2]  197 	ldw	x, (0x0e, sp)
      008268 5C               [ 2]  198 	incw	x
      008269 5C               [ 2]  199 	incw	x
      00826A 1F 0A            [ 2]  200 	ldw	(0x0a, sp), x
      00826C 1E 0A            [ 2]  201 	ldw	x, (0x0a, sp)
      00826E E6 03            [ 1]  202 	ld	a, (0x3, x)
      008270 6B 09            [ 1]  203 	ld	(0x09, sp), a
      008272 E6 02            [ 1]  204 	ld	a, (0x2, x)
      008274 6B 08            [ 1]  205 	ld	(0x08, sp), a
      008276 FE               [ 2]  206 	ldw	x, (x)
      008277 1F 06            [ 2]  207 	ldw	(0x06, sp), x
      008279 CE 00 0D         [ 2]  208 	ldw	x, _timeTickMs+2
      00827C 72 F0 08         [ 2]  209 	subw	x, (0x08, sp)
      00827F C6 00 0C         [ 1]  210 	ld	a, _timeTickMs+1
      008282 12 07            [ 1]  211 	sbc	a, (0x07, sp)
      008284 88               [ 1]  212 	push	a
      008285 C6 00 0B         [ 1]  213 	ld	a, _timeTickMs+0
      008288 12 07            [ 1]  214 	sbc	a, (0x07, sp)
      00828A 6B 03            [ 1]  215 	ld	(0x03, sp), a
      00828C 84               [ 1]  216 	pop	a
      00828D 88               [ 1]  217 	push	a
      00828E 13 13            [ 2]  218 	cpw	x, (0x13, sp)
      008290 84               [ 1]  219 	pop	a
      008291 12 11            [ 1]  220 	sbc	a, (0x11, sp)
      008293 7B 02            [ 1]  221 	ld	a, (0x02, sp)
      008295 12 10            [ 1]  222 	sbc	a, (0x10, sp)
      008297 4F               [ 1]  223 	clr	a
      008298 49               [ 1]  224 	rlc	a
      008299 6B 01            [ 1]  225 	ld	(0x01, sp), a
      00829B 1E 08            [ 2]  226 	ldw	x, (0x08, sp)
      00829D C3 00 0D         [ 2]  227 	cpw	x, _timeTickMs+2
      0082A0 7B 07            [ 1]  228 	ld	a, (0x07, sp)
      0082A2 C2 00 0C         [ 1]  229 	sbc	a, _timeTickMs+1
      0082A5 7B 06            [ 1]  230 	ld	a, (0x06, sp)
      0082A7 C2 00 0B         [ 1]  231 	sbc	a, _timeTickMs+0
      0082AA 24 04            [ 1]  232 	jrnc	00105$
      0082AC 0D 01            [ 1]  233 	tnz	(0x01, sp)
      0082AE 27 15            [ 1]  234 	jreq	00101$
      0082B0                        235 00105$:
      0082B0 CE 00 0D         [ 2]  236 	ldw	x, _timeTickMs+2
      0082B3 13 08            [ 2]  237 	cpw	x, (0x08, sp)
      0082B5 C6 00 0C         [ 1]  238 	ld	a, _timeTickMs+1
      0082B8 12 07            [ 1]  239 	sbc	a, (0x07, sp)
      0082BA C6 00 0B         [ 1]  240 	ld	a, _timeTickMs+0
      0082BD 12 06            [ 1]  241 	sbc	a, (0x06, sp)
      0082BF 24 14            [ 1]  242 	jrnc	00102$
      0082C1 0D 01            [ 1]  243 	tnz	(0x01, sp)
      0082C3 26 10            [ 1]  244 	jrne	00102$
      0082C5                        245 00101$:
                                    246 ;	user/timerTick.c: 57: pTime->timeMS = timeTickMs;
      0082C5 1E 0A            [ 2]  247 	ldw	x, (0x0a, sp)
      0082C7 90 CE 00 0D      [ 2]  248 	ldw	y, _timeTickMs+2
      0082CB EF 02            [ 2]  249 	ldw	(0x2, x), y
      0082CD 90 CE 00 0B      [ 2]  250 	ldw	y, _timeTickMs+0
      0082D1 FF               [ 2]  251 	ldw	(x), y
                                    252 ;	user/timerTick.c: 58: return 0;
      0082D2 4F               [ 1]  253 	clr	a
      0082D3 20 02            [ 2]  254 	jra	00106$
      0082D5                        255 00102$:
                                    256 ;	user/timerTick.c: 60: return 1;
      0082D5 A6 01            [ 1]  257 	ld	a, #0x01
      0082D7                        258 00106$:
      0082D7 5B 0B            [ 2]  259 	addw	sp, #11
      0082D9 81               [ 4]  260 	ret
                                    261 	.area CODE
                                    262 	.area INITIALIZER
                                    263 	.area CABS (ABS)
