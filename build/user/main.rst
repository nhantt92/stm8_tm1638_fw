                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
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
                                     16 	.globl _displayNumber
                                     17 	.globl _configDisplay
                                     18 	.globl _TM1638_Init
                                     19 	.globl _TIMER_InitTime
                                     20 	.globl _TIMER_Inc
                                     21 	.globl _TIMER_Init
                                     22 	.globl _TIM4_ClearITPendingBit
                                     23 	.globl _CLK_GetFlagStatus
                                     24 	.globl _CLK_SYSCLKConfig
                                     25 	.globl _CLK_HSIPrescalerConfig
                                     26 	.globl _CLK_ClockSwitchConfig
                                     27 	.globl _CLK_PeripheralClockConfig
                                     28 	.globl _CLK_ClockSwitchCmd
                                     29 	.globl _CLK_LSICmd
                                     30 	.globl _CLK_HSICmd
                                     31 	.globl _CLK_HSECmd
                                     32 	.globl _CLK_DeInit
                                     33 	.globl _tick
                                     34 ;--------------------------------------------------------
                                     35 ; ram data
                                     36 ;--------------------------------------------------------
                                     37 	.area DATA
      000001                         38 _tick::
      000001                         39 	.ds 6
                                     40 ;--------------------------------------------------------
                                     41 ; ram data
                                     42 ;--------------------------------------------------------
                                     43 	.area INITIALIZED
                                     44 ;--------------------------------------------------------
                                     45 ; Stack segment in internal ram 
                                     46 ;--------------------------------------------------------
                                     47 	.area	SSEG
      000018                         48 __start__stack:
      000018                         49 	.ds	1
                                     50 
                                     51 ;--------------------------------------------------------
                                     52 ; absolute external ram data
                                     53 ;--------------------------------------------------------
                                     54 	.area DABS (ABS)
                                     55 ;--------------------------------------------------------
                                     56 ; interrupt vector 
                                     57 ;--------------------------------------------------------
                                     58 	.area HOME
      008000                         59 __interrupt_vect:
      008000 82 00 80 83             60 	int s_GSINIT ;reset
      008004 82 00 00 00             61 	int 0x0000 ;trap
      008008 82 00 00 00             62 	int 0x0000 ;int0
      00800C 82 00 00 00             63 	int 0x0000 ;int1
      008010 82 00 00 00             64 	int 0x0000 ;int2
      008014 82 00 00 00             65 	int 0x0000 ;int3
      008018 82 00 00 00             66 	int 0x0000 ;int4
      00801C 82 00 00 00             67 	int 0x0000 ;int5
      008020 82 00 00 00             68 	int 0x0000 ;int6
      008024 82 00 00 00             69 	int 0x0000 ;int7
      008028 82 00 00 00             70 	int 0x0000 ;int8
      00802C 82 00 00 00             71 	int 0x0000 ;int9
      008030 82 00 00 00             72 	int 0x0000 ;int10
      008034 82 00 00 00             73 	int 0x0000 ;int11
      008038 82 00 00 00             74 	int 0x0000 ;int12
      00803C 82 00 00 00             75 	int 0x0000 ;int13
      008040 82 00 00 00             76 	int 0x0000 ;int14
      008044 82 00 00 00             77 	int 0x0000 ;int15
      008048 82 00 00 00             78 	int 0x0000 ;int16
      00804C 82 00 00 00             79 	int 0x0000 ;int17
      008050 82 00 00 00             80 	int 0x0000 ;int18
      008054 82 00 00 00             81 	int 0x0000 ;int19
      008058 82 00 00 00             82 	int 0x0000 ;int20
      00805C 82 00 00 00             83 	int 0x0000 ;int21
      008060 82 00 00 00             84 	int 0x0000 ;int22
      008064 82 00 81 20             85 	int _TIM4_UPD_OVF_IRQHandler ;int23
      008068 82 00 00 00             86 	int 0x0000 ;int24
      00806C 82 00 00 00             87 	int 0x0000 ;int25
      008070 82 00 00 00             88 	int 0x0000 ;int26
      008074 82 00 00 00             89 	int 0x0000 ;int27
      008078 82 00 00 00             90 	int 0x0000 ;int28
      00807C 82 00 00 00             91 	int 0x0000 ;int29
                                     92 ;--------------------------------------------------------
                                     93 ; global & static initialisations
                                     94 ;--------------------------------------------------------
                                     95 	.area HOME
                                     96 	.area GSINIT
                                     97 	.area GSFINAL
                                     98 	.area GSINIT
      008083                         99 __sdcc_gs_init_startup:
      008083                        100 __sdcc_init_data:
                                    101 ; stm8_genXINIT() start
      008083 AE 00 17         [ 2]  102 	ldw x, #l_DATA
      008086 27 07            [ 1]  103 	jreq	00002$
      008088                        104 00001$:
      008088 72 4F 00 00      [ 1]  105 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  106 	decw x
      00808D 26 F9            [ 1]  107 	jrne	00001$
      00808F                        108 00002$:
      00808F AE 00 00         [ 2]  109 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  110 	jreq	00004$
      008094                        111 00003$:
      008094 D6 8B 55         [ 1]  112 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 17         [ 1]  113 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  114 	decw	x
      00809B 26 F7            [ 1]  115 	jrne	00003$
      00809D                        116 00004$:
                                    117 ; stm8_genXINIT() end
                                    118 	.area GSFINAL
      00809D CC 80 80         [ 2]  119 	jp	__sdcc_program_startup
                                    120 ;--------------------------------------------------------
                                    121 ; Home
                                    122 ;--------------------------------------------------------
                                    123 	.area HOME
                                    124 	.area HOME
      008080                        125 __sdcc_program_startup:
      008080 CC 81 37         [ 2]  126 	jp	_main
                                    127 ;	return from main will return to caller
                                    128 ;--------------------------------------------------------
                                    129 ; code
                                    130 ;--------------------------------------------------------
                                    131 	.area CODE
                                    132 ;	user/main.c: 24: void clock_setup(void)
                                    133 ;	-----------------------------------------
                                    134 ;	 function clock_setup
                                    135 ;	-----------------------------------------
      0080A0                        136 _clock_setup:
                                    137 ;	user/main.c: 26: CLK_DeInit();
      0080A0 CD 86 3C         [ 4]  138 	call	_CLK_DeInit
                                    139 ;	user/main.c: 27: CLK_HSECmd(DISABLE);
      0080A3 4B 00            [ 1]  140 	push	#0x00
      0080A5 CD 86 88         [ 4]  141 	call	_CLK_HSECmd
      0080A8 84               [ 1]  142 	pop	a
                                    143 ;	user/main.c: 28: CLK_LSICmd(DISABLE);
      0080A9 4B 00            [ 1]  144 	push	#0x00
      0080AB CD 86 A4         [ 4]  145 	call	_CLK_LSICmd
      0080AE 84               [ 1]  146 	pop	a
                                    147 ;	user/main.c: 29: CLK_HSICmd(ENABLE);
      0080AF 4B 01            [ 1]  148 	push	#0x01
      0080B1 CD 86 96         [ 4]  149 	call	_CLK_HSICmd
      0080B4 84               [ 1]  150 	pop	a
                                    151 ;	user/main.c: 30: while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
      0080B5                        152 00101$:
      0080B5 4B 02            [ 1]  153 	push	#0x02
      0080B7 4B 01            [ 1]  154 	push	#0x01
      0080B9 CD 89 3A         [ 4]  155 	call	_CLK_GetFlagStatus
      0080BC 85               [ 2]  156 	popw	x
      0080BD 4D               [ 1]  157 	tnz	a
      0080BE 27 F5            [ 1]  158 	jreq	00101$
                                    159 ;	user/main.c: 31: CLK_ClockSwitchCmd(ENABLE);
      0080C0 4B 01            [ 1]  160 	push	#0x01
      0080C2 CD 86 C6         [ 4]  161 	call	_CLK_ClockSwitchCmd
      0080C5 84               [ 1]  162 	pop	a
                                    163 ;	user/main.c: 32: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      0080C6 4B 00            [ 1]  164 	push	#0x00
      0080C8 CD 88 09         [ 4]  165 	call	_CLK_HSIPrescalerConfig
      0080CB 84               [ 1]  166 	pop	a
                                    167 ;	user/main.c: 33: CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);
      0080CC 4B 81            [ 1]  168 	push	#0x81
      0080CE CD 88 80         [ 4]  169 	call	_CLK_SYSCLKConfig
      0080D1 84               [ 1]  170 	pop	a
                                    171 ;	user/main.c: 34: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
      0080D2 4B 01            [ 1]  172 	push	#0x01
      0080D4 4B 00            [ 1]  173 	push	#0x00
      0080D6 4B E1            [ 1]  174 	push	#0xe1
      0080D8 4B 01            [ 1]  175 	push	#0x01
      0080DA CD 87 44         [ 4]  176 	call	_CLK_ClockSwitchConfig
      0080DD 5B 04            [ 2]  177 	addw	sp, #4
                                    178 ;	user/main.c: 35: CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
      0080DF 4B 01            [ 1]  179 	push	#0x01
      0080E1 4B 01            [ 1]  180 	push	#0x01
      0080E3 CD 86 EE         [ 4]  181 	call	_CLK_PeripheralClockConfig
      0080E6 85               [ 2]  182 	popw	x
                                    183 ;	user/main.c: 36: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
      0080E7 4B 01            [ 1]  184 	push	#0x01
      0080E9 4B 00            [ 1]  185 	push	#0x00
      0080EB CD 86 EE         [ 4]  186 	call	_CLK_PeripheralClockConfig
      0080EE 85               [ 2]  187 	popw	x
                                    188 ;	user/main.c: 37: CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
      0080EF 4B 00            [ 1]  189 	push	#0x00
      0080F1 4B 13            [ 1]  190 	push	#0x13
      0080F3 CD 86 EE         [ 4]  191 	call	_CLK_PeripheralClockConfig
      0080F6 85               [ 2]  192 	popw	x
                                    193 ;	user/main.c: 38: CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
      0080F7 4B 00            [ 1]  194 	push	#0x00
      0080F9 4B 12            [ 1]  195 	push	#0x12
      0080FB CD 86 EE         [ 4]  196 	call	_CLK_PeripheralClockConfig
      0080FE 85               [ 2]  197 	popw	x
                                    198 ;	user/main.c: 39: CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
      0080FF 4B 00            [ 1]  199 	push	#0x00
      008101 4B 03            [ 1]  200 	push	#0x03
      008103 CD 86 EE         [ 4]  201 	call	_CLK_PeripheralClockConfig
      008106 85               [ 2]  202 	popw	x
                                    203 ;	user/main.c: 40: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
      008107 4B 00            [ 1]  204 	push	#0x00
      008109 4B 07            [ 1]  205 	push	#0x07
      00810B CD 86 EE         [ 4]  206 	call	_CLK_PeripheralClockConfig
      00810E 85               [ 2]  207 	popw	x
                                    208 ;	user/main.c: 41: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
      00810F 4B 00            [ 1]  209 	push	#0x00
      008111 4B 05            [ 1]  210 	push	#0x05
      008113 CD 86 EE         [ 4]  211 	call	_CLK_PeripheralClockConfig
      008116 85               [ 2]  212 	popw	x
                                    213 ;	user/main.c: 42: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
      008117 4B 01            [ 1]  214 	push	#0x01
      008119 4B 04            [ 1]  215 	push	#0x04
      00811B CD 86 EE         [ 4]  216 	call	_CLK_PeripheralClockConfig
      00811E 85               [ 2]  217 	popw	x
      00811F 81               [ 4]  218 	ret
                                    219 ;	user/main.c: 45: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    220 ;	-----------------------------------------
                                    221 ;	 function TIM4_UPD_OVF_IRQHandler
                                    222 ;	-----------------------------------------
      008120                        223 _TIM4_UPD_OVF_IRQHandler:
      008120 62               [ 2]  224 	div	x, a
                                    225 ;	user/main.c: 47: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
      008121 4B 01            [ 1]  226 	push	#0x01
      008123 CD 8A F4         [ 4]  227 	call	_TIM4_ClearITPendingBit
      008126 84               [ 1]  228 	pop	a
                                    229 ;	user/main.c: 48: TIMER_Inc();
      008127 CD 81 E1         [ 4]  230 	call	_TIMER_Inc
      00812A 80               [11]  231 	iret
                                    232 ;	user/main.c: 71: void delay(uint16_t x)
                                    233 ;	-----------------------------------------
                                    234 ;	 function delay
                                    235 ;	-----------------------------------------
      00812B                        236 _delay:
      00812B 89               [ 2]  237 	pushw	x
                                    238 ;	user/main.c: 73: while(x--);
      00812C 1E 05            [ 2]  239 	ldw	x, (0x05, sp)
      00812E                        240 00101$:
      00812E 1F 01            [ 2]  241 	ldw	(0x01, sp), x
      008130 5A               [ 2]  242 	decw	x
      008131 16 01            [ 2]  243 	ldw	y, (0x01, sp)
      008133 26 F9            [ 1]  244 	jrne	00101$
      008135 85               [ 2]  245 	popw	x
      008136 81               [ 4]  246 	ret
                                    247 ;	user/main.c: 76: void main() 
                                    248 ;	-----------------------------------------
                                    249 ;	 function main
                                    250 ;	-----------------------------------------
      008137                        251 _main:
                                    252 ;	user/main.c: 79: clock_setup();
      008137 CD 80 A0         [ 4]  253 	call	_clock_setup
                                    254 ;	user/main.c: 80: TM1638_Init(GPIOC, GPIO_PIN_4, GPIO_PIN_5, GPIO_PIN_6);
      00813A 4B 40            [ 1]  255 	push	#0x40
      00813C 4B 20            [ 1]  256 	push	#0x20
      00813E 4B 10            [ 1]  257 	push	#0x10
      008140 4B 0A            [ 1]  258 	push	#0x0a
      008142 4B 50            [ 1]  259 	push	#0x50
      008144 CD 82 DA         [ 4]  260 	call	_TM1638_Init
      008147 5B 05            [ 2]  261 	addw	sp, #5
                                    262 ;	user/main.c: 81: configDisplay(1, 0x07);
      008149 4B 07            [ 1]  263 	push	#0x07
      00814B 4B 01            [ 1]  264 	push	#0x01
      00814D CD 84 DC         [ 4]  265 	call	_configDisplay
      008150 85               [ 2]  266 	popw	x
                                    267 ;	user/main.c: 83: TIMER_Init();
      008151 CD 81 AE         [ 4]  268 	call	_TIMER_Init
                                    269 ;	user/main.c: 85: enableInterrupts();
      008154 9A               [ 1]  270 	rim
                                    271 ;	user/main.c: 86: TIMER_InitTime(&tick);
      008155 AE 00 01         [ 2]  272 	ldw	x, #_tick+0
      008158 89               [ 2]  273 	pushw	x
      008159 CD 82 0D         [ 4]  274 	call	_TIMER_InitTime
      00815C 85               [ 2]  275 	popw	x
                                    276 ;	user/main.c: 88: for(i = 0; i < 8; i++)
      00815D 4F               [ 1]  277 	clr	a
      00815E                        278 00108$:
                                    279 ;	user/main.c: 90: displayNumber(i, i, FALSE);
      00815E 88               [ 1]  280 	push	a
      00815F 4B 00            [ 1]  281 	push	#0x00
      008161 88               [ 1]  282 	push	a
      008162 88               [ 1]  283 	push	a
      008163 CD 85 A4         [ 4]  284 	call	_displayNumber
      008166 5B 03            [ 2]  285 	addw	sp, #3
      008168 84               [ 1]  286 	pop	a
                                    287 ;	user/main.c: 88: for(i = 0; i < 8; i++)
      008169 4C               [ 1]  288 	inc	a
      00816A A1 08            [ 1]  289 	cp	a, #0x08
      00816C 25 F0            [ 1]  290 	jrc	00108$
                                    291 ;	user/main.c: 92: for(i = 0; i < 8; i++)
      00816E 4F               [ 1]  292 	clr	a
      00816F                        293 00110$:
                                    294 ;	user/main.c: 94: setLed(0, i);
      00816F 88               [ 1]  295 	push	a
      008170 88               [ 1]  296 	push	a
      008171 4B 00            [ 1]  297 	push	#0x00
      008173 CD 85 B7         [ 4]  298 	call	_setLed
      008176 85               [ 2]  299 	popw	x
      008177 84               [ 1]  300 	pop	a
                                    301 ;	user/main.c: 92: for(i = 0; i < 8; i++)
      008178 4C               [ 1]  302 	inc	a
      008179 A1 08            [ 1]  303 	cp	a, #0x08
      00817B 25 F2            [ 1]  304 	jrc	00110$
                                    305 ;	user/main.c: 98: for(i = 0; i < 8; i++)
      00817D                        306 00121$:
      00817D 4F               [ 1]  307 	clr	a
      00817E                        308 00112$:
                                    309 ;	user/main.c: 100: setLed(1, i);
      00817E 88               [ 1]  310 	push	a
      00817F 88               [ 1]  311 	push	a
      008180 4B 01            [ 1]  312 	push	#0x01
      008182 CD 85 B7         [ 4]  313 	call	_setLed
      008185 85               [ 2]  314 	popw	x
      008186 4B 50            [ 1]  315 	push	#0x50
      008188 4B C3            [ 1]  316 	push	#0xc3
      00818A CD 81 2B         [ 4]  317 	call	_delay
      00818D 85               [ 2]  318 	popw	x
      00818E 84               [ 1]  319 	pop	a
                                    320 ;	user/main.c: 98: for(i = 0; i < 8; i++)
      00818F 4C               [ 1]  321 	inc	a
      008190 A1 08            [ 1]  322 	cp	a, #0x08
      008192 25 EA            [ 1]  323 	jrc	00112$
                                    324 ;	user/main.c: 103: for(i = 0; i < 8; i++)
      008194 4F               [ 1]  325 	clr	a
      008195                        326 00114$:
                                    327 ;	user/main.c: 105: setLed(0, i);
      008195 88               [ 1]  328 	push	a
      008196 88               [ 1]  329 	push	a
      008197 4B 00            [ 1]  330 	push	#0x00
      008199 CD 85 B7         [ 4]  331 	call	_setLed
      00819C 85               [ 2]  332 	popw	x
      00819D 4B 50            [ 1]  333 	push	#0x50
      00819F 4B C3            [ 1]  334 	push	#0xc3
      0081A1 CD 81 2B         [ 4]  335 	call	_delay
      0081A4 85               [ 2]  336 	popw	x
      0081A5 84               [ 1]  337 	pop	a
                                    338 ;	user/main.c: 103: for(i = 0; i < 8; i++)
      0081A6 4C               [ 1]  339 	inc	a
      0081A7 A1 08            [ 1]  340 	cp	a, #0x08
      0081A9 25 EA            [ 1]  341 	jrc	00114$
      0081AB 20 D0            [ 2]  342 	jra	00121$
      0081AD 81               [ 4]  343 	ret
                                    344 	.area CODE
                                    345 	.area INITIALIZER
                                    346 	.area CABS (ABS)
