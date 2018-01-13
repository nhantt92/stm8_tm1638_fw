                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _delay
                                     13 	.globl _TIM4_UPD_OVF_IRQHandler
                                     14 	.globl _clock_setup
                                     15 	.globl _setLed
                                     16 	.globl _getKey
                                     17 	.globl _displayNumber
                                     18 	.globl _configDisplay
                                     19 	.globl _TM1638_Init
                                     20 	.globl _TIMER_CheckTimeMS
                                     21 	.globl _TIMER_InitTime
                                     22 	.globl _TIMER_Inc
                                     23 	.globl _TIMER_Init
                                     24 	.globl _TIM4_ClearITPendingBit
                                     25 	.globl _CLK_GetFlagStatus
                                     26 	.globl _CLK_SYSCLKConfig
                                     27 	.globl _CLK_HSIPrescalerConfig
                                     28 	.globl _CLK_ClockSwitchConfig
                                     29 	.globl _CLK_PeripheralClockConfig
                                     30 	.globl _CLK_ClockSwitchCmd
                                     31 	.globl _CLK_LSICmd
                                     32 	.globl _CLK_HSICmd
                                     33 	.globl _CLK_HSECmd
                                     34 	.globl _CLK_DeInit
                                     35 	.globl _tick
                                     36 ;--------------------------------------------------------
                                     37 ; ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area DATA
      000001                         40 _tick::
      000001                         41 	.ds 6
                                     42 ;--------------------------------------------------------
                                     43 ; ram data
                                     44 ;--------------------------------------------------------
                                     45 	.area INITIALIZED
                                     46 ;--------------------------------------------------------
                                     47 ; Stack segment in internal ram 
                                     48 ;--------------------------------------------------------
                                     49 	.area	SSEG
      000018                         50 __start__stack:
      000018                         51 	.ds	1
                                     52 
                                     53 ;--------------------------------------------------------
                                     54 ; absolute external ram data
                                     55 ;--------------------------------------------------------
                                     56 	.area DABS (ABS)
                                     57 ;--------------------------------------------------------
                                     58 ; interrupt vector 
                                     59 ;--------------------------------------------------------
                                     60 	.area HOME
      008000                         61 __interrupt_vect:
      008000 82 00 80 83             62 	int s_GSINIT ;reset
      008004 82 00 00 00             63 	int 0x0000 ;trap
      008008 82 00 00 00             64 	int 0x0000 ;int0
      00800C 82 00 00 00             65 	int 0x0000 ;int1
      008010 82 00 00 00             66 	int 0x0000 ;int2
      008014 82 00 00 00             67 	int 0x0000 ;int3
      008018 82 00 00 00             68 	int 0x0000 ;int4
      00801C 82 00 00 00             69 	int 0x0000 ;int5
      008020 82 00 00 00             70 	int 0x0000 ;int6
      008024 82 00 00 00             71 	int 0x0000 ;int7
      008028 82 00 00 00             72 	int 0x0000 ;int8
      00802C 82 00 00 00             73 	int 0x0000 ;int9
      008030 82 00 00 00             74 	int 0x0000 ;int10
      008034 82 00 00 00             75 	int 0x0000 ;int11
      008038 82 00 00 00             76 	int 0x0000 ;int12
      00803C 82 00 00 00             77 	int 0x0000 ;int13
      008040 82 00 00 00             78 	int 0x0000 ;int14
      008044 82 00 00 00             79 	int 0x0000 ;int15
      008048 82 00 00 00             80 	int 0x0000 ;int16
      00804C 82 00 00 00             81 	int 0x0000 ;int17
      008050 82 00 00 00             82 	int 0x0000 ;int18
      008054 82 00 00 00             83 	int 0x0000 ;int19
      008058 82 00 00 00             84 	int 0x0000 ;int20
      00805C 82 00 00 00             85 	int 0x0000 ;int21
      008060 82 00 00 00             86 	int 0x0000 ;int22
      008064 82 00 81 20             87 	int _TIM4_UPD_OVF_IRQHandler ;int23
      008068 82 00 00 00             88 	int 0x0000 ;int24
      00806C 82 00 00 00             89 	int 0x0000 ;int25
      008070 82 00 00 00             90 	int 0x0000 ;int26
      008074 82 00 00 00             91 	int 0x0000 ;int27
      008078 82 00 00 00             92 	int 0x0000 ;int28
      00807C 82 00 00 00             93 	int 0x0000 ;int29
                                     94 ;--------------------------------------------------------
                                     95 ; global & static initialisations
                                     96 ;--------------------------------------------------------
                                     97 	.area HOME
                                     98 	.area GSINIT
                                     99 	.area GSFINAL
                                    100 	.area GSINIT
      008083                        101 __sdcc_gs_init_startup:
      008083                        102 __sdcc_init_data:
                                    103 ; stm8_genXINIT() start
      008083 AE 00 17         [ 2]  104 	ldw x, #l_DATA
      008086 27 07            [ 1]  105 	jreq	00002$
      008088                        106 00001$:
      008088 72 4F 00 00      [ 1]  107 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  108 	decw x
      00808D 26 F9            [ 1]  109 	jrne	00001$
      00808F                        110 00002$:
      00808F AE 00 00         [ 2]  111 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  112 	jreq	00004$
      008094                        113 00003$:
      008094 D6 8B 84         [ 1]  114 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 17         [ 1]  115 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  116 	decw	x
      00809B 26 F7            [ 1]  117 	jrne	00003$
      00809D                        118 00004$:
                                    119 ; stm8_genXINIT() end
                                    120 	.area GSFINAL
      00809D CC 80 80         [ 2]  121 	jp	__sdcc_program_startup
                                    122 ;--------------------------------------------------------
                                    123 ; Home
                                    124 ;--------------------------------------------------------
                                    125 	.area HOME
                                    126 	.area HOME
      008080                        127 __sdcc_program_startup:
      008080 CC 81 37         [ 2]  128 	jp	_main
                                    129 ;	return from main will return to caller
                                    130 ;--------------------------------------------------------
                                    131 ; code
                                    132 ;--------------------------------------------------------
                                    133 	.area CODE
                                    134 ;	user/main.c: 24: void clock_setup(void)
                                    135 ;	-----------------------------------------
                                    136 ;	 function clock_setup
                                    137 ;	-----------------------------------------
      0080A0                        138 _clock_setup:
                                    139 ;	user/main.c: 26: CLK_DeInit();
      0080A0 CD 86 6B         [ 4]  140 	call	_CLK_DeInit
                                    141 ;	user/main.c: 27: CLK_HSECmd(DISABLE);
      0080A3 4B 00            [ 1]  142 	push	#0x00
      0080A5 CD 86 B7         [ 4]  143 	call	_CLK_HSECmd
      0080A8 84               [ 1]  144 	pop	a
                                    145 ;	user/main.c: 28: CLK_LSICmd(DISABLE);
      0080A9 4B 00            [ 1]  146 	push	#0x00
      0080AB CD 86 D3         [ 4]  147 	call	_CLK_LSICmd
      0080AE 84               [ 1]  148 	pop	a
                                    149 ;	user/main.c: 29: CLK_HSICmd(ENABLE);
      0080AF 4B 01            [ 1]  150 	push	#0x01
      0080B1 CD 86 C5         [ 4]  151 	call	_CLK_HSICmd
      0080B4 84               [ 1]  152 	pop	a
                                    153 ;	user/main.c: 30: while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
      0080B5                        154 00101$:
      0080B5 4B 02            [ 1]  155 	push	#0x02
      0080B7 4B 01            [ 1]  156 	push	#0x01
      0080B9 CD 89 69         [ 4]  157 	call	_CLK_GetFlagStatus
      0080BC 85               [ 2]  158 	popw	x
      0080BD 4D               [ 1]  159 	tnz	a
      0080BE 27 F5            [ 1]  160 	jreq	00101$
                                    161 ;	user/main.c: 31: CLK_ClockSwitchCmd(ENABLE);
      0080C0 4B 01            [ 1]  162 	push	#0x01
      0080C2 CD 86 F5         [ 4]  163 	call	_CLK_ClockSwitchCmd
      0080C5 84               [ 1]  164 	pop	a
                                    165 ;	user/main.c: 32: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      0080C6 4B 00            [ 1]  166 	push	#0x00
      0080C8 CD 88 38         [ 4]  167 	call	_CLK_HSIPrescalerConfig
      0080CB 84               [ 1]  168 	pop	a
                                    169 ;	user/main.c: 33: CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);
      0080CC 4B 81            [ 1]  170 	push	#0x81
      0080CE CD 88 AF         [ 4]  171 	call	_CLK_SYSCLKConfig
      0080D1 84               [ 1]  172 	pop	a
                                    173 ;	user/main.c: 34: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
      0080D2 4B 01            [ 1]  174 	push	#0x01
      0080D4 4B 00            [ 1]  175 	push	#0x00
      0080D6 4B E1            [ 1]  176 	push	#0xe1
      0080D8 4B 01            [ 1]  177 	push	#0x01
      0080DA CD 87 73         [ 4]  178 	call	_CLK_ClockSwitchConfig
      0080DD 5B 04            [ 2]  179 	addw	sp, #4
                                    180 ;	user/main.c: 35: CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
      0080DF 4B 01            [ 1]  181 	push	#0x01
      0080E1 4B 01            [ 1]  182 	push	#0x01
      0080E3 CD 87 1D         [ 4]  183 	call	_CLK_PeripheralClockConfig
      0080E6 85               [ 2]  184 	popw	x
                                    185 ;	user/main.c: 36: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
      0080E7 4B 01            [ 1]  186 	push	#0x01
      0080E9 4B 00            [ 1]  187 	push	#0x00
      0080EB CD 87 1D         [ 4]  188 	call	_CLK_PeripheralClockConfig
      0080EE 85               [ 2]  189 	popw	x
                                    190 ;	user/main.c: 37: CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
      0080EF 4B 00            [ 1]  191 	push	#0x00
      0080F1 4B 13            [ 1]  192 	push	#0x13
      0080F3 CD 87 1D         [ 4]  193 	call	_CLK_PeripheralClockConfig
      0080F6 85               [ 2]  194 	popw	x
                                    195 ;	user/main.c: 38: CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
      0080F7 4B 00            [ 1]  196 	push	#0x00
      0080F9 4B 12            [ 1]  197 	push	#0x12
      0080FB CD 87 1D         [ 4]  198 	call	_CLK_PeripheralClockConfig
      0080FE 85               [ 2]  199 	popw	x
                                    200 ;	user/main.c: 39: CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
      0080FF 4B 00            [ 1]  201 	push	#0x00
      008101 4B 03            [ 1]  202 	push	#0x03
      008103 CD 87 1D         [ 4]  203 	call	_CLK_PeripheralClockConfig
      008106 85               [ 2]  204 	popw	x
                                    205 ;	user/main.c: 40: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
      008107 4B 00            [ 1]  206 	push	#0x00
      008109 4B 07            [ 1]  207 	push	#0x07
      00810B CD 87 1D         [ 4]  208 	call	_CLK_PeripheralClockConfig
      00810E 85               [ 2]  209 	popw	x
                                    210 ;	user/main.c: 41: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
      00810F 4B 00            [ 1]  211 	push	#0x00
      008111 4B 05            [ 1]  212 	push	#0x05
      008113 CD 87 1D         [ 4]  213 	call	_CLK_PeripheralClockConfig
      008116 85               [ 2]  214 	popw	x
                                    215 ;	user/main.c: 42: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
      008117 4B 01            [ 1]  216 	push	#0x01
      008119 4B 04            [ 1]  217 	push	#0x04
      00811B CD 87 1D         [ 4]  218 	call	_CLK_PeripheralClockConfig
      00811E 85               [ 2]  219 	popw	x
      00811F 81               [ 4]  220 	ret
                                    221 ;	user/main.c: 45: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    222 ;	-----------------------------------------
                                    223 ;	 function TIM4_UPD_OVF_IRQHandler
                                    224 ;	-----------------------------------------
      008120                        225 _TIM4_UPD_OVF_IRQHandler:
      008120 62               [ 2]  226 	div	x, a
                                    227 ;	user/main.c: 47: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
      008121 4B 01            [ 1]  228 	push	#0x01
      008123 CD 8B 23         [ 4]  229 	call	_TIM4_ClearITPendingBit
      008126 84               [ 1]  230 	pop	a
                                    231 ;	user/main.c: 48: TIMER_Inc();
      008127 CD 82 43         [ 4]  232 	call	_TIMER_Inc
      00812A 80               [11]  233 	iret
                                    234 ;	user/main.c: 71: void delay(uint16_t x)
                                    235 ;	-----------------------------------------
                                    236 ;	 function delay
                                    237 ;	-----------------------------------------
      00812B                        238 _delay:
      00812B 89               [ 2]  239 	pushw	x
                                    240 ;	user/main.c: 73: while(x--);
      00812C 1E 05            [ 2]  241 	ldw	x, (0x05, sp)
      00812E                        242 00101$:
      00812E 1F 01            [ 2]  243 	ldw	(0x01, sp), x
      008130 5A               [ 2]  244 	decw	x
      008131 16 01            [ 2]  245 	ldw	y, (0x01, sp)
      008133 26 F9            [ 1]  246 	jrne	00101$
      008135 85               [ 2]  247 	popw	x
      008136 81               [ 4]  248 	ret
                                    249 ;	user/main.c: 76: void main() 
                                    250 ;	-----------------------------------------
                                    251 ;	 function main
                                    252 ;	-----------------------------------------
      008137                        253 _main:
      008137 89               [ 2]  254 	pushw	x
                                    255 ;	user/main.c: 79: clock_setup();
      008138 CD 80 A0         [ 4]  256 	call	_clock_setup
                                    257 ;	user/main.c: 80: TM1638_Init(GPIOC, GPIO_PIN_4, GPIO_PIN_5, GPIO_PIN_6);
      00813B 4B 40            [ 1]  258 	push	#0x40
      00813D 4B 20            [ 1]  259 	push	#0x20
      00813F 4B 10            [ 1]  260 	push	#0x10
      008141 4B 0A            [ 1]  261 	push	#0x0a
      008143 4B 50            [ 1]  262 	push	#0x50
      008145 CD 83 3C         [ 4]  263 	call	_TM1638_Init
      008148 5B 05            [ 2]  264 	addw	sp, #5
                                    265 ;	user/main.c: 81: configDisplay(1, 0x07);
      00814A 4B 07            [ 1]  266 	push	#0x07
      00814C 4B 01            [ 1]  267 	push	#0x01
      00814E CD 85 04         [ 4]  268 	call	_configDisplay
      008151 85               [ 2]  269 	popw	x
                                    270 ;	user/main.c: 83: TIMER_Init();
      008152 CD 82 10         [ 4]  271 	call	_TIMER_Init
                                    272 ;	user/main.c: 85: enableInterrupts();
      008155 9A               [ 1]  273 	rim
                                    274 ;	user/main.c: 86: TIMER_InitTime(&tick);
      008156 AE 00 01         [ 2]  275 	ldw	x, #_tick+0
      008159 1F 01            [ 2]  276 	ldw	(0x01, sp), x
      00815B 1E 01            [ 2]  277 	ldw	x, (0x01, sp)
      00815D 89               [ 2]  278 	pushw	x
      00815E CD 82 6F         [ 4]  279 	call	_TIMER_InitTime
      008161 85               [ 2]  280 	popw	x
                                    281 ;	user/main.c: 87: for(i = 0; i < 8; i++)
      008162 4F               [ 1]  282 	clr	a
      008163                        283 00118$:
                                    284 ;	user/main.c: 89: displayNumber(i, i, FALSE);
      008163 88               [ 1]  285 	push	a
      008164 4B 00            [ 1]  286 	push	#0x00
      008166 88               [ 1]  287 	push	a
      008167 88               [ 1]  288 	push	a
      008168 CD 85 CC         [ 4]  289 	call	_displayNumber
      00816B 5B 03            [ 2]  290 	addw	sp, #3
      00816D 84               [ 1]  291 	pop	a
                                    292 ;	user/main.c: 87: for(i = 0; i < 8; i++)
      00816E 4C               [ 1]  293 	inc	a
      00816F A1 08            [ 1]  294 	cp	a, #0x08
      008171 25 F0            [ 1]  295 	jrc	00118$
                                    296 ;	user/main.c: 91: while(1) 
      008173                        297 00116$:
                                    298 ;	user/main.c: 103: if(TIMER_CheckTimeMS(&tick, 100) == 0)
      008173 16 01            [ 2]  299 	ldw	y, (0x01, sp)
      008175 4B 64            [ 1]  300 	push	#0x64
      008177 5F               [ 1]  301 	clrw	x
      008178 89               [ 2]  302 	pushw	x
      008179 4B 00            [ 1]  303 	push	#0x00
      00817B 90 89            [ 2]  304 	pushw	y
      00817D CD 82 C6         [ 4]  305 	call	_TIMER_CheckTimeMS
      008180 5B 06            [ 2]  306 	addw	sp, #6
      008182 4D               [ 1]  307 	tnz	a
      008183 26 EE            [ 1]  308 	jrne	00116$
                                    309 ;	user/main.c: 105: key = getKey();
      008185 CD 85 EE         [ 4]  310 	call	_getKey
                                    311 ;	user/main.c: 106: switch(key)
      008188 A1 08            [ 1]  312 	cp	a, #0x08
      00818A 23 03            [ 2]  313 	jrule	00152$
      00818C CC 81 FC         [ 2]  314 	jp	00128$
      00818F                        315 00152$:
      00818F 5F               [ 1]  316 	clrw	x
      008190 97               [ 1]  317 	ld	xl, a
      008191 58               [ 2]  318 	sllw	x
      008192 DE 81 96         [ 2]  319 	ldw	x, (#00153$, x)
      008195 FC               [ 2]  320 	jp	(x)
      008196                        321 00153$:
      008196 81 FC                  322 	.dw	#00110$
      008198 81 A8                  323 	.dw	#00102$
      00819A 81 B2                  324 	.dw	#00103$
      00819C 81 BC                  325 	.dw	#00104$
      00819E 81 C6                  326 	.dw	#00105$
      0081A0 81 D0                  327 	.dw	#00106$
      0081A2 81 DB                  328 	.dw	#00107$
      0081A4 81 E6                  329 	.dw	#00108$
      0081A6 81 F1                  330 	.dw	#00109$
                                    331 ;	user/main.c: 108: case 1: setLed(1, 0);
      0081A8                        332 00102$:
      0081A8 4B 00            [ 1]  333 	push	#0x00
      0081AA 4B 01            [ 1]  334 	push	#0x01
      0081AC CD 85 DF         [ 4]  335 	call	_setLed
      0081AF 85               [ 2]  336 	popw	x
                                    337 ;	user/main.c: 109: break;
      0081B0 20 C1            [ 2]  338 	jra	00116$
                                    339 ;	user/main.c: 110: case 2: setLed(1, 1);
      0081B2                        340 00103$:
      0081B2 4B 01            [ 1]  341 	push	#0x01
      0081B4 4B 01            [ 1]  342 	push	#0x01
      0081B6 CD 85 DF         [ 4]  343 	call	_setLed
      0081B9 85               [ 2]  344 	popw	x
                                    345 ;	user/main.c: 111: break;
      0081BA 20 B7            [ 2]  346 	jra	00116$
                                    347 ;	user/main.c: 112: case 3: setLed(1, 2);
      0081BC                        348 00104$:
      0081BC 4B 02            [ 1]  349 	push	#0x02
      0081BE 4B 01            [ 1]  350 	push	#0x01
      0081C0 CD 85 DF         [ 4]  351 	call	_setLed
      0081C3 85               [ 2]  352 	popw	x
                                    353 ;	user/main.c: 113: break;
      0081C4 20 AD            [ 2]  354 	jra	00116$
                                    355 ;	user/main.c: 114: case 4: setLed(1, 3);
      0081C6                        356 00105$:
      0081C6 4B 03            [ 1]  357 	push	#0x03
      0081C8 4B 01            [ 1]  358 	push	#0x01
      0081CA CD 85 DF         [ 4]  359 	call	_setLed
      0081CD 85               [ 2]  360 	popw	x
                                    361 ;	user/main.c: 115: break;
      0081CE 20 A3            [ 2]  362 	jra	00116$
                                    363 ;	user/main.c: 116: case 5: setLed(1, 4);
      0081D0                        364 00106$:
      0081D0 4B 04            [ 1]  365 	push	#0x04
      0081D2 4B 01            [ 1]  366 	push	#0x01
      0081D4 CD 85 DF         [ 4]  367 	call	_setLed
      0081D7 85               [ 2]  368 	popw	x
                                    369 ;	user/main.c: 117: break;
      0081D8 CC 81 73         [ 2]  370 	jp	00116$
                                    371 ;	user/main.c: 118: case 6: setLed(1, 5);
      0081DB                        372 00107$:
      0081DB 4B 05            [ 1]  373 	push	#0x05
      0081DD 4B 01            [ 1]  374 	push	#0x01
      0081DF CD 85 DF         [ 4]  375 	call	_setLed
      0081E2 85               [ 2]  376 	popw	x
                                    377 ;	user/main.c: 119: break;
      0081E3 CC 81 73         [ 2]  378 	jp	00116$
                                    379 ;	user/main.c: 120: case 7: setLed(1, 6);
      0081E6                        380 00108$:
      0081E6 4B 06            [ 1]  381 	push	#0x06
      0081E8 4B 01            [ 1]  382 	push	#0x01
      0081EA CD 85 DF         [ 4]  383 	call	_setLed
      0081ED 85               [ 2]  384 	popw	x
                                    385 ;	user/main.c: 121: break;
      0081EE CC 81 73         [ 2]  386 	jp	00116$
                                    387 ;	user/main.c: 122: case 8: setLed(1, 7);
      0081F1                        388 00109$:
      0081F1 4B 07            [ 1]  389 	push	#0x07
      0081F3 4B 01            [ 1]  390 	push	#0x01
      0081F5 CD 85 DF         [ 4]  391 	call	_setLed
      0081F8 85               [ 2]  392 	popw	x
                                    393 ;	user/main.c: 123: break;
      0081F9 CC 81 73         [ 2]  394 	jp	00116$
                                    395 ;	user/main.c: 124: default:  
      0081FC                        396 00110$:
                                    397 ;	user/main.c: 125: for(i = 0; i < 8; i++)
      0081FC                        398 00128$:
      0081FC 4F               [ 1]  399 	clr	a
      0081FD                        400 00120$:
                                    401 ;	user/main.c: 127: setLed(0, i);
      0081FD 88               [ 1]  402 	push	a
      0081FE 88               [ 1]  403 	push	a
      0081FF 4B 00            [ 1]  404 	push	#0x00
      008201 CD 85 DF         [ 4]  405 	call	_setLed
      008204 85               [ 2]  406 	popw	x
      008205 84               [ 1]  407 	pop	a
                                    408 ;	user/main.c: 125: for(i = 0; i < 8; i++)
      008206 4C               [ 1]  409 	inc	a
      008207 A1 08            [ 1]  410 	cp	a, #0x08
      008209 25 F2            [ 1]  411 	jrc	00120$
                                    412 ;	user/main.c: 130: }
      00820B CC 81 73         [ 2]  413 	jp	00116$
      00820E 85               [ 2]  414 	popw	x
      00820F 81               [ 4]  415 	ret
                                    416 	.area CODE
                                    417 	.area INITIALIZER
                                    418 	.area CABS (ABS)
