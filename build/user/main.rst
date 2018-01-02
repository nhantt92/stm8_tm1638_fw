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
                                     11 	.globl _NUMBER_FONT
                                     12 	.globl _main
                                     13 	.globl _clock_setup
                                     14 	.globl _TM1638_SendIntData
                                     15 	.globl _TM1638_Init
                                     16 	.globl _CLK_GetFlagStatus
                                     17 	.globl _CLK_SYSCLKConfig
                                     18 	.globl _CLK_HSIPrescalerConfig
                                     19 	.globl _CLK_ClockSwitchConfig
                                     20 	.globl _CLK_PeripheralClockConfig
                                     21 	.globl _CLK_ClockSwitchCmd
                                     22 	.globl _CLK_LSICmd
                                     23 	.globl _CLK_HSICmd
                                     24 	.globl _CLK_HSECmd
                                     25 	.globl _CLK_DeInit
                                     26 ;--------------------------------------------------------
                                     27 ; ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area DATA
                                     30 ;--------------------------------------------------------
                                     31 ; ram data
                                     32 ;--------------------------------------------------------
                                     33 	.area INITIALIZED
                                     34 ;--------------------------------------------------------
                                     35 ; Stack segment in internal ram 
                                     36 ;--------------------------------------------------------
                                     37 	.area	SSEG
      000008                         38 __start__stack:
      000008                         39 	.ds	1
                                     40 
                                     41 ;--------------------------------------------------------
                                     42 ; absolute external ram data
                                     43 ;--------------------------------------------------------
                                     44 	.area DABS (ABS)
                                     45 ;--------------------------------------------------------
                                     46 ; interrupt vector 
                                     47 ;--------------------------------------------------------
                                     48 	.area HOME
      008000                         49 __interrupt_vect:
      008000 82 00 80 83             50 	int s_GSINIT ;reset
      008004 82 00 00 00             51 	int 0x0000 ;trap
      008008 82 00 00 00             52 	int 0x0000 ;int0
      00800C 82 00 00 00             53 	int 0x0000 ;int1
      008010 82 00 00 00             54 	int 0x0000 ;int2
      008014 82 00 00 00             55 	int 0x0000 ;int3
      008018 82 00 00 00             56 	int 0x0000 ;int4
      00801C 82 00 00 00             57 	int 0x0000 ;int5
      008020 82 00 00 00             58 	int 0x0000 ;int6
      008024 82 00 00 00             59 	int 0x0000 ;int7
      008028 82 00 00 00             60 	int 0x0000 ;int8
      00802C 82 00 00 00             61 	int 0x0000 ;int9
      008030 82 00 00 00             62 	int 0x0000 ;int10
      008034 82 00 00 00             63 	int 0x0000 ;int11
      008038 82 00 00 00             64 	int 0x0000 ;int12
      00803C 82 00 00 00             65 	int 0x0000 ;int13
      008040 82 00 00 00             66 	int 0x0000 ;int14
      008044 82 00 00 00             67 	int 0x0000 ;int15
      008048 82 00 00 00             68 	int 0x0000 ;int16
      00804C 82 00 00 00             69 	int 0x0000 ;int17
      008050 82 00 00 00             70 	int 0x0000 ;int18
      008054 82 00 00 00             71 	int 0x0000 ;int19
      008058 82 00 00 00             72 	int 0x0000 ;int20
      00805C 82 00 00 00             73 	int 0x0000 ;int21
      008060 82 00 00 00             74 	int 0x0000 ;int22
      008064 82 00 00 00             75 	int 0x0000 ;int23
      008068 82 00 00 00             76 	int 0x0000 ;int24
      00806C 82 00 00 00             77 	int 0x0000 ;int25
      008070 82 00 00 00             78 	int 0x0000 ;int26
      008074 82 00 00 00             79 	int 0x0000 ;int27
      008078 82 00 00 00             80 	int 0x0000 ;int28
      00807C 82 00 00 00             81 	int 0x0000 ;int29
                                     82 ;--------------------------------------------------------
                                     83 ; global & static initialisations
                                     84 ;--------------------------------------------------------
                                     85 	.area HOME
                                     86 	.area GSINIT
                                     87 	.area GSFINAL
                                     88 	.area GSINIT
      008083                         89 __sdcc_gs_init_startup:
      008083                         90 __sdcc_init_data:
                                     91 ; stm8_genXINIT() start
      008083 AE 00 07         [ 2]   92 	ldw x, #l_DATA
      008086 27 07            [ 1]   93 	jreq	00002$
      008088                         94 00001$:
      008088 72 4F 00 00      [ 1]   95 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]   96 	decw x
      00808D 26 F9            [ 1]   97 	jrne	00001$
      00808F                         98 00002$:
      00808F AE 00 00         [ 2]   99 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  100 	jreq	00004$
      008094                        101 00003$:
      008094 D6 89 9F         [ 1]  102 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 07         [ 1]  103 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  104 	decw	x
      00809B 26 F7            [ 1]  105 	jrne	00003$
      00809D                        106 00004$:
                                    107 ; stm8_genXINIT() end
                                    108 	.area GSFINAL
      00809D CC 80 80         [ 2]  109 	jp	__sdcc_program_startup
                                    110 ;--------------------------------------------------------
                                    111 ; Home
                                    112 ;--------------------------------------------------------
                                    113 	.area HOME
                                    114 	.area HOME
      008080                        115 __sdcc_program_startup:
      008080 CC 81 20         [ 2]  116 	jp	_main
                                    117 ;	return from main will return to caller
                                    118 ;--------------------------------------------------------
                                    119 ; code
                                    120 ;--------------------------------------------------------
                                    121 	.area CODE
                                    122 ;	user/main.c: 22: void clock_setup(void)
                                    123 ;	-----------------------------------------
                                    124 ;	 function clock_setup
                                    125 ;	-----------------------------------------
      0080A0                        126 _clock_setup:
                                    127 ;	user/main.c: 24: CLK_DeInit();
      0080A0 CD 84 DF         [ 4]  128 	call	_CLK_DeInit
                                    129 ;	user/main.c: 25: CLK_HSECmd(DISABLE);
      0080A3 4B 00            [ 1]  130 	push	#0x00
      0080A5 CD 85 2B         [ 4]  131 	call	_CLK_HSECmd
      0080A8 84               [ 1]  132 	pop	a
                                    133 ;	user/main.c: 26: CLK_LSICmd(DISABLE);
      0080A9 4B 00            [ 1]  134 	push	#0x00
      0080AB CD 85 47         [ 4]  135 	call	_CLK_LSICmd
      0080AE 84               [ 1]  136 	pop	a
                                    137 ;	user/main.c: 27: CLK_HSICmd(ENABLE);
      0080AF 4B 01            [ 1]  138 	push	#0x01
      0080B1 CD 85 39         [ 4]  139 	call	_CLK_HSICmd
      0080B4 84               [ 1]  140 	pop	a
                                    141 ;	user/main.c: 28: while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
      0080B5                        142 00101$:
      0080B5 4B 02            [ 1]  143 	push	#0x02
      0080B7 4B 01            [ 1]  144 	push	#0x01
      0080B9 CD 87 DD         [ 4]  145 	call	_CLK_GetFlagStatus
      0080BC 85               [ 2]  146 	popw	x
      0080BD 4D               [ 1]  147 	tnz	a
      0080BE 27 F5            [ 1]  148 	jreq	00101$
                                    149 ;	user/main.c: 29: CLK_ClockSwitchCmd(ENABLE);
      0080C0 4B 01            [ 1]  150 	push	#0x01
      0080C2 CD 85 69         [ 4]  151 	call	_CLK_ClockSwitchCmd
      0080C5 84               [ 1]  152 	pop	a
                                    153 ;	user/main.c: 30: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      0080C6 4B 00            [ 1]  154 	push	#0x00
      0080C8 CD 86 AC         [ 4]  155 	call	_CLK_HSIPrescalerConfig
      0080CB 84               [ 1]  156 	pop	a
                                    157 ;	user/main.c: 31: CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);
      0080CC 4B 81            [ 1]  158 	push	#0x81
      0080CE CD 87 23         [ 4]  159 	call	_CLK_SYSCLKConfig
      0080D1 84               [ 1]  160 	pop	a
                                    161 ;	user/main.c: 32: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
      0080D2 4B 01            [ 1]  162 	push	#0x01
      0080D4 4B 00            [ 1]  163 	push	#0x00
      0080D6 4B E1            [ 1]  164 	push	#0xe1
      0080D8 4B 01            [ 1]  165 	push	#0x01
      0080DA CD 85 E7         [ 4]  166 	call	_CLK_ClockSwitchConfig
      0080DD 5B 04            [ 2]  167 	addw	sp, #4
                                    168 ;	user/main.c: 33: CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
      0080DF 4B 01            [ 1]  169 	push	#0x01
      0080E1 4B 01            [ 1]  170 	push	#0x01
      0080E3 CD 85 91         [ 4]  171 	call	_CLK_PeripheralClockConfig
      0080E6 85               [ 2]  172 	popw	x
                                    173 ;	user/main.c: 34: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
      0080E7 4B 01            [ 1]  174 	push	#0x01
      0080E9 4B 00            [ 1]  175 	push	#0x00
      0080EB CD 85 91         [ 4]  176 	call	_CLK_PeripheralClockConfig
      0080EE 85               [ 2]  177 	popw	x
                                    178 ;	user/main.c: 35: CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
      0080EF 4B 00            [ 1]  179 	push	#0x00
      0080F1 4B 13            [ 1]  180 	push	#0x13
      0080F3 CD 85 91         [ 4]  181 	call	_CLK_PeripheralClockConfig
      0080F6 85               [ 2]  182 	popw	x
                                    183 ;	user/main.c: 36: CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
      0080F7 4B 00            [ 1]  184 	push	#0x00
      0080F9 4B 12            [ 1]  185 	push	#0x12
      0080FB CD 85 91         [ 4]  186 	call	_CLK_PeripheralClockConfig
      0080FE 85               [ 2]  187 	popw	x
                                    188 ;	user/main.c: 37: CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
      0080FF 4B 00            [ 1]  189 	push	#0x00
      008101 4B 03            [ 1]  190 	push	#0x03
      008103 CD 85 91         [ 4]  191 	call	_CLK_PeripheralClockConfig
      008106 85               [ 2]  192 	popw	x
                                    193 ;	user/main.c: 38: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
      008107 4B 00            [ 1]  194 	push	#0x00
      008109 4B 07            [ 1]  195 	push	#0x07
      00810B CD 85 91         [ 4]  196 	call	_CLK_PeripheralClockConfig
      00810E 85               [ 2]  197 	popw	x
                                    198 ;	user/main.c: 39: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
      00810F 4B 00            [ 1]  199 	push	#0x00
      008111 4B 05            [ 1]  200 	push	#0x05
      008113 CD 85 91         [ 4]  201 	call	_CLK_PeripheralClockConfig
      008116 85               [ 2]  202 	popw	x
                                    203 ;	user/main.c: 40: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
      008117 4B 01            [ 1]  204 	push	#0x01
      008119 4B 04            [ 1]  205 	push	#0x04
      00811B CD 85 91         [ 4]  206 	call	_CLK_PeripheralClockConfig
      00811E 85               [ 2]  207 	popw	x
      00811F 81               [ 4]  208 	ret
                                    209 ;	user/main.c: 68: void main() 
                                    210 ;	-----------------------------------------
                                    211 ;	 function main
                                    212 ;	-----------------------------------------
      008120                        213 _main:
                                    214 ;	user/main.c: 71: clock_setup();
      008120 CD 80 A0         [ 4]  215 	call	_clock_setup
                                    216 ;	user/main.c: 72: TM1638_Init(GPIOC, GPIO_PIN_4, GPIO_PIN_5, GPIO_PIN_6);
      008123 4B 40            [ 1]  217 	push	#0x40
      008125 4B 20            [ 1]  218 	push	#0x20
      008127 4B 10            [ 1]  219 	push	#0x10
      008129 4B 0A            [ 1]  220 	push	#0x0a
      00812B 4B 50            [ 1]  221 	push	#0x50
      00812D CD 81 50         [ 4]  222 	call	_TM1638_Init
      008130 5B 05            [ 2]  223 	addw	sp, #5
                                    224 ;	user/main.c: 78: TM1638_SendIntData(1, 2);
      008132 4B 02            [ 1]  225 	push	#0x02
      008134 4B 00            [ 1]  226 	push	#0x00
      008136 4B 01            [ 1]  227 	push	#0x01
      008138 CD 84 94         [ 4]  228 	call	_TM1638_SendIntData
      00813B 5B 03            [ 2]  229 	addw	sp, #3
                                    230 ;	user/main.c: 79: while(1) 
      00813D                        231 00102$:
      00813D 20 FE            [ 2]  232 	jra	00102$
      00813F 81               [ 4]  233 	ret
                                    234 	.area CODE
      008140                        235 _NUMBER_FONT:
      008140 3F                     236 	.db #0x3f	; 63
      008141 06                     237 	.db #0x06	; 6
      008142 5B                     238 	.db #0x5b	; 91
      008143 4F                     239 	.db #0x4f	; 79	'O'
      008144 66                     240 	.db #0x66	; 102	'f'
      008145 6D                     241 	.db #0x6d	; 109	'm'
      008146 7D                     242 	.db #0x7d	; 125
      008147 07                     243 	.db #0x07	; 7
      008148 7F                     244 	.db #0x7f	; 127
      008149 6F                     245 	.db #0x6f	; 111	'o'
      00814A 77                     246 	.db #0x77	; 119	'w'
      00814B 7C                     247 	.db #0x7c	; 124
      00814C 39                     248 	.db #0x39	; 57	'9'
      00814D 5E                     249 	.db #0x5e	; 94
      00814E 79                     250 	.db #0x79	; 121	'y'
      00814F 71                     251 	.db #0x71	; 113	'q'
                                    252 	.area INITIALIZER
                                    253 	.area CABS (ABS)
