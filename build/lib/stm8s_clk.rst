                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_clk
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _CLKPrescTable
                                     12 	.globl _HSIDivFactor
                                     13 	.globl _CLK_DeInit
                                     14 	.globl _CLK_FastHaltWakeUpCmd
                                     15 	.globl _CLK_HSECmd
                                     16 	.globl _CLK_HSICmd
                                     17 	.globl _CLK_LSICmd
                                     18 	.globl _CLK_CCOCmd
                                     19 	.globl _CLK_ClockSwitchCmd
                                     20 	.globl _CLK_SlowActiveHaltWakeUpCmd
                                     21 	.globl _CLK_PeripheralClockConfig
                                     22 	.globl _CLK_ClockSwitchConfig
                                     23 	.globl _CLK_HSIPrescalerConfig
                                     24 	.globl _CLK_CCOConfig
                                     25 	.globl _CLK_ITConfig
                                     26 	.globl _CLK_SYSCLKConfig
                                     27 	.globl _CLK_SWIMConfig
                                     28 	.globl _CLK_ClockSecuritySystemEnable
                                     29 	.globl _CLK_GetSYSCLKSource
                                     30 	.globl _CLK_GetClockFreq
                                     31 	.globl _CLK_AdjustHSICalibrationValue
                                     32 	.globl _CLK_SYSCLKEmergencyClear
                                     33 	.globl _CLK_GetFlagStatus
                                     34 	.globl _CLK_GetITStatus
                                     35 	.globl _CLK_ClearITPendingBit
                                     36 ;--------------------------------------------------------
                                     37 ; ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area DATA
                                     40 ;--------------------------------------------------------
                                     41 ; ram data
                                     42 ;--------------------------------------------------------
                                     43 	.area INITIALIZED
                                     44 ;--------------------------------------------------------
                                     45 ; absolute external ram data
                                     46 ;--------------------------------------------------------
                                     47 	.area DABS (ABS)
                                     48 ;--------------------------------------------------------
                                     49 ; global & static initialisations
                                     50 ;--------------------------------------------------------
                                     51 	.area HOME
                                     52 	.area GSINIT
                                     53 	.area GSFINAL
                                     54 	.area GSINIT
                                     55 ;--------------------------------------------------------
                                     56 ; Home
                                     57 ;--------------------------------------------------------
                                     58 	.area HOME
                                     59 	.area HOME
                                     60 ;--------------------------------------------------------
                                     61 ; code
                                     62 ;--------------------------------------------------------
                                     63 	.area CODE
                                     64 ;	lib/stm8s_clk.c: 72: void CLK_DeInit(void)
                                     65 ;	-----------------------------------------
                                     66 ;	 function CLK_DeInit
                                     67 ;	-----------------------------------------
      0084DF                         68 _CLK_DeInit:
                                     69 ;	lib/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      0084DF 35 01 50 C0      [ 1]   70 	mov	0x50c0+0, #0x01
                                     71 ;	lib/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      0084E3 35 00 50 C1      [ 1]   72 	mov	0x50c1+0, #0x00
                                     73 ;	lib/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      0084E7 35 E1 50 C4      [ 1]   74 	mov	0x50c4+0, #0xe1
                                     75 ;	lib/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      0084EB 35 00 50 C5      [ 1]   76 	mov	0x50c5+0, #0x00
                                     77 ;	lib/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      0084EF 35 18 50 C6      [ 1]   78 	mov	0x50c6+0, #0x18
                                     79 ;	lib/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      0084F3 35 FF 50 C7      [ 1]   80 	mov	0x50c7+0, #0xff
                                     81 ;	lib/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      0084F7 35 FF 50 CA      [ 1]   82 	mov	0x50ca+0, #0xff
                                     83 ;	lib/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      0084FB 35 00 50 C8      [ 1]   84 	mov	0x50c8+0, #0x00
                                     85 ;	lib/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      0084FF 35 00 50 C9      [ 1]   86 	mov	0x50c9+0, #0x00
                                     87 ;	lib/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      008503                         88 00101$:
      008503 AE 50 C9         [ 2]   89 	ldw	x, #0x50c9
      008506 F6               [ 1]   90 	ld	a, (x)
      008507 44               [ 1]   91 	srl	a
      008508 25 F9            [ 1]   92 	jrc	00101$
                                     93 ;	lib/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      00850A 35 00 50 C9      [ 1]   94 	mov	0x50c9+0, #0x00
                                     95 ;	lib/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      00850E 35 00 50 CC      [ 1]   96 	mov	0x50cc+0, #0x00
                                     97 ;	lib/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      008512 35 00 50 CD      [ 1]   98 	mov	0x50cd+0, #0x00
      008516 81               [ 4]   99 	ret
                                    100 ;	lib/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function CLK_FastHaltWakeUpCmd
                                    103 ;	-----------------------------------------
      008517                        104 _CLK_FastHaltWakeUpCmd:
                                    105 ;	lib/stm8s_clk.c: 102: if (NewState != DISABLE)
      008517 0D 03            [ 1]  106 	tnz	(0x03, sp)
      008519 27 08            [ 1]  107 	jreq	00102$
                                    108 ;	lib/stm8s_clk.c: 105: CLK->ICKR |= CLK_ICKR_FHWU;
      00851B AE 50 C0         [ 2]  109 	ldw	x, #0x50c0
      00851E F6               [ 1]  110 	ld	a, (x)
      00851F AA 04            [ 1]  111 	or	a, #0x04
      008521 F7               [ 1]  112 	ld	(x), a
      008522 81               [ 4]  113 	ret
      008523                        114 00102$:
                                    115 ;	lib/stm8s_clk.c: 110: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      008523 AE 50 C0         [ 2]  116 	ldw	x, #0x50c0
      008526 F6               [ 1]  117 	ld	a, (x)
      008527 A4 FB            [ 1]  118 	and	a, #0xfb
      008529 F7               [ 1]  119 	ld	(x), a
      00852A 81               [ 4]  120 	ret
                                    121 ;	lib/stm8s_clk.c: 119: void CLK_HSECmd(FunctionalState NewState)
                                    122 ;	-----------------------------------------
                                    123 ;	 function CLK_HSECmd
                                    124 ;	-----------------------------------------
      00852B                        125 _CLK_HSECmd:
                                    126 ;	lib/stm8s_clk.c: 122: if (NewState != DISABLE)
      00852B 0D 03            [ 1]  127 	tnz	(0x03, sp)
      00852D 27 05            [ 1]  128 	jreq	00102$
                                    129 ;	lib/stm8s_clk.c: 125: CLK->ECKR |= CLK_ECKR_HSEEN;
      00852F 72 10 50 C1      [ 1]  130 	bset	0x50c1, #0
      008533 81               [ 4]  131 	ret
      008534                        132 00102$:
                                    133 ;	lib/stm8s_clk.c: 130: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      008534 72 11 50 C1      [ 1]  134 	bres	0x50c1, #0
      008538 81               [ 4]  135 	ret
                                    136 ;	lib/stm8s_clk.c: 139: void CLK_HSICmd(FunctionalState NewState)
                                    137 ;	-----------------------------------------
                                    138 ;	 function CLK_HSICmd
                                    139 ;	-----------------------------------------
      008539                        140 _CLK_HSICmd:
                                    141 ;	lib/stm8s_clk.c: 142: if (NewState != DISABLE)
      008539 0D 03            [ 1]  142 	tnz	(0x03, sp)
      00853B 27 05            [ 1]  143 	jreq	00102$
                                    144 ;	lib/stm8s_clk.c: 145: CLK->ICKR |= CLK_ICKR_HSIEN;
      00853D 72 10 50 C0      [ 1]  145 	bset	0x50c0, #0
      008541 81               [ 4]  146 	ret
      008542                        147 00102$:
                                    148 ;	lib/stm8s_clk.c: 150: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      008542 72 11 50 C0      [ 1]  149 	bres	0x50c0, #0
      008546 81               [ 4]  150 	ret
                                    151 ;	lib/stm8s_clk.c: 160: void CLK_LSICmd(FunctionalState NewState)
                                    152 ;	-----------------------------------------
                                    153 ;	 function CLK_LSICmd
                                    154 ;	-----------------------------------------
      008547                        155 _CLK_LSICmd:
                                    156 ;	lib/stm8s_clk.c: 163: if (NewState != DISABLE)
      008547 0D 03            [ 1]  157 	tnz	(0x03, sp)
      008549 27 08            [ 1]  158 	jreq	00102$
                                    159 ;	lib/stm8s_clk.c: 166: CLK->ICKR |= CLK_ICKR_LSIEN;
      00854B AE 50 C0         [ 2]  160 	ldw	x, #0x50c0
      00854E F6               [ 1]  161 	ld	a, (x)
      00854F AA 08            [ 1]  162 	or	a, #0x08
      008551 F7               [ 1]  163 	ld	(x), a
      008552 81               [ 4]  164 	ret
      008553                        165 00102$:
                                    166 ;	lib/stm8s_clk.c: 171: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      008553 AE 50 C0         [ 2]  167 	ldw	x, #0x50c0
      008556 F6               [ 1]  168 	ld	a, (x)
      008557 A4 F7            [ 1]  169 	and	a, #0xf7
      008559 F7               [ 1]  170 	ld	(x), a
      00855A 81               [ 4]  171 	ret
                                    172 ;	lib/stm8s_clk.c: 181: void CLK_CCOCmd(FunctionalState NewState)
                                    173 ;	-----------------------------------------
                                    174 ;	 function CLK_CCOCmd
                                    175 ;	-----------------------------------------
      00855B                        176 _CLK_CCOCmd:
                                    177 ;	lib/stm8s_clk.c: 184: if (NewState != DISABLE)
      00855B 0D 03            [ 1]  178 	tnz	(0x03, sp)
      00855D 27 05            [ 1]  179 	jreq	00102$
                                    180 ;	lib/stm8s_clk.c: 187: CLK->CCOR |= CLK_CCOR_CCOEN;
      00855F 72 10 50 C9      [ 1]  181 	bset	0x50c9, #0
      008563 81               [ 4]  182 	ret
      008564                        183 00102$:
                                    184 ;	lib/stm8s_clk.c: 192: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      008564 72 11 50 C9      [ 1]  185 	bres	0x50c9, #0
      008568 81               [ 4]  186 	ret
                                    187 ;	lib/stm8s_clk.c: 203: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    188 ;	-----------------------------------------
                                    189 ;	 function CLK_ClockSwitchCmd
                                    190 ;	-----------------------------------------
      008569                        191 _CLK_ClockSwitchCmd:
                                    192 ;	lib/stm8s_clk.c: 206: if (NewState != DISABLE )
      008569 0D 03            [ 1]  193 	tnz	(0x03, sp)
      00856B 27 08            [ 1]  194 	jreq	00102$
                                    195 ;	lib/stm8s_clk.c: 209: CLK->SWCR |= CLK_SWCR_SWEN;
      00856D AE 50 C5         [ 2]  196 	ldw	x, #0x50c5
      008570 F6               [ 1]  197 	ld	a, (x)
      008571 AA 02            [ 1]  198 	or	a, #0x02
      008573 F7               [ 1]  199 	ld	(x), a
      008574 81               [ 4]  200 	ret
      008575                        201 00102$:
                                    202 ;	lib/stm8s_clk.c: 214: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      008575 AE 50 C5         [ 2]  203 	ldw	x, #0x50c5
      008578 F6               [ 1]  204 	ld	a, (x)
      008579 A4 FD            [ 1]  205 	and	a, #0xfd
      00857B F7               [ 1]  206 	ld	(x), a
      00857C 81               [ 4]  207 	ret
                                    208 ;	lib/stm8s_clk.c: 226: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    209 ;	-----------------------------------------
                                    210 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    211 ;	-----------------------------------------
      00857D                        212 _CLK_SlowActiveHaltWakeUpCmd:
                                    213 ;	lib/stm8s_clk.c: 229: if (NewState != DISABLE)
      00857D 0D 03            [ 1]  214 	tnz	(0x03, sp)
      00857F 27 08            [ 1]  215 	jreq	00102$
                                    216 ;	lib/stm8s_clk.c: 232: CLK->ICKR |= CLK_ICKR_SWUAH;
      008581 AE 50 C0         [ 2]  217 	ldw	x, #0x50c0
      008584 F6               [ 1]  218 	ld	a, (x)
      008585 AA 20            [ 1]  219 	or	a, #0x20
      008587 F7               [ 1]  220 	ld	(x), a
      008588 81               [ 4]  221 	ret
      008589                        222 00102$:
                                    223 ;	lib/stm8s_clk.c: 237: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      008589 AE 50 C0         [ 2]  224 	ldw	x, #0x50c0
      00858C F6               [ 1]  225 	ld	a, (x)
      00858D A4 DF            [ 1]  226 	and	a, #0xdf
      00858F F7               [ 1]  227 	ld	(x), a
      008590 81               [ 4]  228 	ret
                                    229 ;	lib/stm8s_clk.c: 249: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    230 ;	-----------------------------------------
                                    231 ;	 function CLK_PeripheralClockConfig
                                    232 ;	-----------------------------------------
      008591                        233 _CLK_PeripheralClockConfig:
      008591 89               [ 2]  234 	pushw	x
                                    235 ;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008592 7B 05            [ 1]  236 	ld	a, (0x05, sp)
      008594 A4 0F            [ 1]  237 	and	a, #0x0f
      008596 88               [ 1]  238 	push	a
      008597 A6 01            [ 1]  239 	ld	a, #0x01
      008599 6B 03            [ 1]  240 	ld	(0x03, sp), a
      00859B 84               [ 1]  241 	pop	a
      00859C 4D               [ 1]  242 	tnz	a
      00859D 27 05            [ 1]  243 	jreq	00125$
      00859F                        244 00124$:
      00859F 08 02            [ 1]  245 	sll	(0x02, sp)
      0085A1 4A               [ 1]  246 	dec	a
      0085A2 26 FB            [ 1]  247 	jrne	00124$
      0085A4                        248 00125$:
                                    249 ;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      0085A4 7B 02            [ 1]  250 	ld	a, (0x02, sp)
      0085A6 43               [ 1]  251 	cpl	a
      0085A7 6B 01            [ 1]  252 	ld	(0x01, sp), a
                                    253 ;	lib/stm8s_clk.c: 252: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      0085A9 7B 05            [ 1]  254 	ld	a, (0x05, sp)
      0085AB A5 10            [ 1]  255 	bcp	a, #0x10
      0085AD 26 1C            [ 1]  256 	jrne	00108$
                                    257 ;	lib/stm8s_clk.c: 254: if (NewState != DISABLE)
      0085AF 0D 06            [ 1]  258 	tnz	(0x06, sp)
      0085B1 27 0C            [ 1]  259 	jreq	00102$
                                    260 ;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0085B3 AE 50 C7         [ 2]  261 	ldw	x, #0x50c7
      0085B6 F6               [ 1]  262 	ld	a, (x)
      0085B7 1A 02            [ 1]  263 	or	a, (0x02, sp)
      0085B9 AE 50 C7         [ 2]  264 	ldw	x, #0x50c7
      0085BC F7               [ 1]  265 	ld	(x), a
      0085BD 20 26            [ 2]  266 	jra	00110$
      0085BF                        267 00102$:
                                    268 ;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      0085BF AE 50 C7         [ 2]  269 	ldw	x, #0x50c7
      0085C2 F6               [ 1]  270 	ld	a, (x)
      0085C3 14 01            [ 1]  271 	and	a, (0x01, sp)
      0085C5 AE 50 C7         [ 2]  272 	ldw	x, #0x50c7
      0085C8 F7               [ 1]  273 	ld	(x), a
      0085C9 20 1A            [ 2]  274 	jra	00110$
      0085CB                        275 00108$:
                                    276 ;	lib/stm8s_clk.c: 267: if (NewState != DISABLE)
      0085CB 0D 06            [ 1]  277 	tnz	(0x06, sp)
      0085CD 27 0C            [ 1]  278 	jreq	00105$
                                    279 ;	lib/stm8s_clk.c: 270: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0085CF AE 50 CA         [ 2]  280 	ldw	x, #0x50ca
      0085D2 F6               [ 1]  281 	ld	a, (x)
      0085D3 1A 02            [ 1]  282 	or	a, (0x02, sp)
      0085D5 AE 50 CA         [ 2]  283 	ldw	x, #0x50ca
      0085D8 F7               [ 1]  284 	ld	(x), a
      0085D9 20 0A            [ 2]  285 	jra	00110$
      0085DB                        286 00105$:
                                    287 ;	lib/stm8s_clk.c: 275: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      0085DB AE 50 CA         [ 2]  288 	ldw	x, #0x50ca
      0085DE F6               [ 1]  289 	ld	a, (x)
      0085DF 14 01            [ 1]  290 	and	a, (0x01, sp)
      0085E1 AE 50 CA         [ 2]  291 	ldw	x, #0x50ca
      0085E4 F7               [ 1]  292 	ld	(x), a
      0085E5                        293 00110$:
      0085E5 85               [ 2]  294 	popw	x
      0085E6 81               [ 4]  295 	ret
                                    296 ;	lib/stm8s_clk.c: 292: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    297 ;	-----------------------------------------
                                    298 ;	 function CLK_ClockSwitchConfig
                                    299 ;	-----------------------------------------
      0085E7                        300 _CLK_ClockSwitchConfig:
      0085E7 89               [ 2]  301 	pushw	x
                                    302 ;	lib/stm8s_clk.c: 299: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      0085E8 AE 50 C3         [ 2]  303 	ldw	x, #0x50c3
      0085EB F6               [ 1]  304 	ld	a, (x)
      0085EC 6B 01            [ 1]  305 	ld	(0x01, sp), a
                                    306 ;	lib/stm8s_clk.c: 302: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      0085EE 7B 05            [ 1]  307 	ld	a, (0x05, sp)
      0085F0 A1 01            [ 1]  308 	cp	a, #0x01
      0085F2 26 40            [ 1]  309 	jrne	00122$
                                    310 ;	lib/stm8s_clk.c: 305: CLK->SWCR |= CLK_SWCR_SWEN;
      0085F4 AE 50 C5         [ 2]  311 	ldw	x, #0x50c5
      0085F7 F6               [ 1]  312 	ld	a, (x)
      0085F8 AA 02            [ 1]  313 	or	a, #0x02
      0085FA F7               [ 1]  314 	ld	(x), a
                                    315 ;	lib/stm8s_clk.c: 308: if (ITState != DISABLE)
      0085FB 0D 07            [ 1]  316 	tnz	(0x07, sp)
      0085FD 27 09            [ 1]  317 	jreq	00102$
                                    318 ;	lib/stm8s_clk.c: 310: CLK->SWCR |= CLK_SWCR_SWIEN;
      0085FF AE 50 C5         [ 2]  319 	ldw	x, #0x50c5
      008602 F6               [ 1]  320 	ld	a, (x)
      008603 AA 04            [ 1]  321 	or	a, #0x04
      008605 F7               [ 1]  322 	ld	(x), a
      008606 20 07            [ 2]  323 	jra	00103$
      008608                        324 00102$:
                                    325 ;	lib/stm8s_clk.c: 314: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      008608 AE 50 C5         [ 2]  326 	ldw	x, #0x50c5
      00860B F6               [ 1]  327 	ld	a, (x)
      00860C A4 FB            [ 1]  328 	and	a, #0xfb
      00860E F7               [ 1]  329 	ld	(x), a
      00860F                        330 00103$:
                                    331 ;	lib/stm8s_clk.c: 318: CLK->SWR = (uint8_t)CLK_NewClock;
      00860F AE 50 C4         [ 2]  332 	ldw	x, #0x50c4
      008612 7B 06            [ 1]  333 	ld	a, (0x06, sp)
      008614 F7               [ 1]  334 	ld	(x), a
                                    335 ;	lib/stm8s_clk.c: 321: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      008615 AE FF FF         [ 2]  336 	ldw	x, #0xffff
      008618                        337 00105$:
      008618 90 AE 50 C5      [ 2]  338 	ldw	y, #0x50c5
      00861C 90 F6            [ 1]  339 	ld	a, (y)
      00861E 44               [ 1]  340 	srl	a
      00861F 24 06            [ 1]  341 	jrnc	00107$
      008621 5D               [ 2]  342 	tnzw	x
      008622 27 03            [ 1]  343 	jreq	00107$
                                    344 ;	lib/stm8s_clk.c: 323: DownCounter--;
      008624 5A               [ 2]  345 	decw	x
      008625 20 F1            [ 2]  346 	jra	00105$
      008627                        347 00107$:
                                    348 ;	lib/stm8s_clk.c: 326: if(DownCounter != 0)
      008627 5D               [ 2]  349 	tnzw	x
      008628 27 06            [ 1]  350 	jreq	00109$
                                    351 ;	lib/stm8s_clk.c: 328: Swif = SUCCESS;
      00862A A6 01            [ 1]  352 	ld	a, #0x01
      00862C 6B 02            [ 1]  353 	ld	(0x02, sp), a
      00862E 20 43            [ 2]  354 	jra	00123$
      008630                        355 00109$:
                                    356 ;	lib/stm8s_clk.c: 332: Swif = ERROR;
      008630 0F 02            [ 1]  357 	clr	(0x02, sp)
      008632 20 3F            [ 2]  358 	jra	00123$
      008634                        359 00122$:
                                    360 ;	lib/stm8s_clk.c: 338: if (ITState != DISABLE)
      008634 0D 07            [ 1]  361 	tnz	(0x07, sp)
      008636 27 09            [ 1]  362 	jreq	00112$
                                    363 ;	lib/stm8s_clk.c: 340: CLK->SWCR |= CLK_SWCR_SWIEN;
      008638 AE 50 C5         [ 2]  364 	ldw	x, #0x50c5
      00863B F6               [ 1]  365 	ld	a, (x)
      00863C AA 04            [ 1]  366 	or	a, #0x04
      00863E F7               [ 1]  367 	ld	(x), a
      00863F 20 07            [ 2]  368 	jra	00113$
      008641                        369 00112$:
                                    370 ;	lib/stm8s_clk.c: 344: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      008641 AE 50 C5         [ 2]  371 	ldw	x, #0x50c5
      008644 F6               [ 1]  372 	ld	a, (x)
      008645 A4 FB            [ 1]  373 	and	a, #0xfb
      008647 F7               [ 1]  374 	ld	(x), a
      008648                        375 00113$:
                                    376 ;	lib/stm8s_clk.c: 348: CLK->SWR = (uint8_t)CLK_NewClock;
      008648 AE 50 C4         [ 2]  377 	ldw	x, #0x50c4
      00864B 7B 06            [ 1]  378 	ld	a, (0x06, sp)
      00864D F7               [ 1]  379 	ld	(x), a
                                    380 ;	lib/stm8s_clk.c: 351: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      00864E AE FF FF         [ 2]  381 	ldw	x, #0xffff
      008651                        382 00115$:
      008651 90 AE 50 C5      [ 2]  383 	ldw	y, #0x50c5
      008655 90 F6            [ 1]  384 	ld	a, (y)
      008657 A5 08            [ 1]  385 	bcp	a, #0x08
      008659 27 06            [ 1]  386 	jreq	00117$
      00865B 5D               [ 2]  387 	tnzw	x
      00865C 27 03            [ 1]  388 	jreq	00117$
                                    389 ;	lib/stm8s_clk.c: 353: DownCounter--;
      00865E 5A               [ 2]  390 	decw	x
      00865F 20 F0            [ 2]  391 	jra	00115$
      008661                        392 00117$:
                                    393 ;	lib/stm8s_clk.c: 356: if(DownCounter != 0)
      008661 5D               [ 2]  394 	tnzw	x
      008662 27 0D            [ 1]  395 	jreq	00119$
                                    396 ;	lib/stm8s_clk.c: 359: CLK->SWCR |= CLK_SWCR_SWEN;
      008664 AE 50 C5         [ 2]  397 	ldw	x, #0x50c5
      008667 F6               [ 1]  398 	ld	a, (x)
      008668 AA 02            [ 1]  399 	or	a, #0x02
      00866A F7               [ 1]  400 	ld	(x), a
                                    401 ;	lib/stm8s_clk.c: 360: Swif = SUCCESS;
      00866B A6 01            [ 1]  402 	ld	a, #0x01
      00866D 6B 02            [ 1]  403 	ld	(0x02, sp), a
      00866F 20 02            [ 2]  404 	jra	00123$
      008671                        405 00119$:
                                    406 ;	lib/stm8s_clk.c: 364: Swif = ERROR;
      008671 0F 02            [ 1]  407 	clr	(0x02, sp)
      008673                        408 00123$:
                                    409 ;	lib/stm8s_clk.c: 367: if(Swif != ERROR)
      008673 0D 02            [ 1]  410 	tnz	(0x02, sp)
      008675 27 31            [ 1]  411 	jreq	00136$
                                    412 ;	lib/stm8s_clk.c: 370: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      008677 0D 08            [ 1]  413 	tnz	(0x08, sp)
      008679 26 0C            [ 1]  414 	jrne	00132$
      00867B 7B 01            [ 1]  415 	ld	a, (0x01, sp)
      00867D A1 E1            [ 1]  416 	cp	a, #0xe1
      00867F 26 06            [ 1]  417 	jrne	00132$
                                    418 ;	lib/stm8s_clk.c: 372: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      008681 72 11 50 C0      [ 1]  419 	bres	0x50c0, #0
      008685 20 21            [ 2]  420 	jra	00136$
      008687                        421 00132$:
                                    422 ;	lib/stm8s_clk.c: 374: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      008687 0D 08            [ 1]  423 	tnz	(0x08, sp)
      008689 26 0F            [ 1]  424 	jrne	00128$
      00868B 7B 01            [ 1]  425 	ld	a, (0x01, sp)
      00868D A1 D2            [ 1]  426 	cp	a, #0xd2
      00868F 26 09            [ 1]  427 	jrne	00128$
                                    428 ;	lib/stm8s_clk.c: 376: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      008691 AE 50 C0         [ 2]  429 	ldw	x, #0x50c0
      008694 F6               [ 1]  430 	ld	a, (x)
      008695 A4 F7            [ 1]  431 	and	a, #0xf7
      008697 F7               [ 1]  432 	ld	(x), a
      008698 20 0E            [ 2]  433 	jra	00136$
      00869A                        434 00128$:
                                    435 ;	lib/stm8s_clk.c: 378: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      00869A 0D 08            [ 1]  436 	tnz	(0x08, sp)
      00869C 26 0A            [ 1]  437 	jrne	00136$
      00869E 7B 01            [ 1]  438 	ld	a, (0x01, sp)
      0086A0 A1 B4            [ 1]  439 	cp	a, #0xb4
      0086A2 26 04            [ 1]  440 	jrne	00136$
                                    441 ;	lib/stm8s_clk.c: 380: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      0086A4 72 11 50 C1      [ 1]  442 	bres	0x50c1, #0
      0086A8                        443 00136$:
                                    444 ;	lib/stm8s_clk.c: 383: return(Swif);
      0086A8 7B 02            [ 1]  445 	ld	a, (0x02, sp)
      0086AA 85               [ 2]  446 	popw	x
      0086AB 81               [ 4]  447 	ret
                                    448 ;	lib/stm8s_clk.c: 392: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    449 ;	-----------------------------------------
                                    450 ;	 function CLK_HSIPrescalerConfig
                                    451 ;	-----------------------------------------
      0086AC                        452 _CLK_HSIPrescalerConfig:
                                    453 ;	lib/stm8s_clk.c: 396: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0086AC AE 50 C6         [ 2]  454 	ldw	x, #0x50c6
      0086AF F6               [ 1]  455 	ld	a, (x)
      0086B0 A4 E7            [ 1]  456 	and	a, #0xe7
      0086B2 F7               [ 1]  457 	ld	(x), a
                                    458 ;	lib/stm8s_clk.c: 399: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      0086B3 AE 50 C6         [ 2]  459 	ldw	x, #0x50c6
      0086B6 F6               [ 1]  460 	ld	a, (x)
      0086B7 1A 03            [ 1]  461 	or	a, (0x03, sp)
      0086B9 AE 50 C6         [ 2]  462 	ldw	x, #0x50c6
      0086BC F7               [ 1]  463 	ld	(x), a
      0086BD 81               [ 4]  464 	ret
                                    465 ;	lib/stm8s_clk.c: 411: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    466 ;	-----------------------------------------
                                    467 ;	 function CLK_CCOConfig
                                    468 ;	-----------------------------------------
      0086BE                        469 _CLK_CCOConfig:
                                    470 ;	lib/stm8s_clk.c: 415: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      0086BE AE 50 C9         [ 2]  471 	ldw	x, #0x50c9
      0086C1 F6               [ 1]  472 	ld	a, (x)
      0086C2 A4 E1            [ 1]  473 	and	a, #0xe1
      0086C4 F7               [ 1]  474 	ld	(x), a
                                    475 ;	lib/stm8s_clk.c: 418: CLK->CCOR |= (uint8_t)CLK_CCO;
      0086C5 AE 50 C9         [ 2]  476 	ldw	x, #0x50c9
      0086C8 F6               [ 1]  477 	ld	a, (x)
      0086C9 1A 03            [ 1]  478 	or	a, (0x03, sp)
      0086CB AE 50 C9         [ 2]  479 	ldw	x, #0x50c9
      0086CE F7               [ 1]  480 	ld	(x), a
                                    481 ;	lib/stm8s_clk.c: 421: CLK->CCOR |= CLK_CCOR_CCOEN;
      0086CF 72 10 50 C9      [ 1]  482 	bset	0x50c9, #0
      0086D3 81               [ 4]  483 	ret
                                    484 ;	lib/stm8s_clk.c: 432: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    485 ;	-----------------------------------------
                                    486 ;	 function CLK_ITConfig
                                    487 ;	-----------------------------------------
      0086D4                        488 _CLK_ITConfig:
      0086D4 88               [ 1]  489 	push	a
                                    490 ;	lib/stm8s_clk.c: 436: switch (CLK_IT)
      0086D5 7B 04            [ 1]  491 	ld	a, (0x04, sp)
      0086D7 A1 0C            [ 1]  492 	cp	a, #0x0c
      0086D9 26 06            [ 1]  493 	jrne	00135$
      0086DB A6 01            [ 1]  494 	ld	a, #0x01
      0086DD 6B 01            [ 1]  495 	ld	(0x01, sp), a
      0086DF 20 02            [ 2]  496 	jra	00136$
      0086E1                        497 00135$:
      0086E1 0F 01            [ 1]  498 	clr	(0x01, sp)
      0086E3                        499 00136$:
      0086E3 7B 04            [ 1]  500 	ld	a, (0x04, sp)
      0086E5 A1 1C            [ 1]  501 	cp	a, #0x1c
      0086E7 26 03            [ 1]  502 	jrne	00138$
      0086E9 A6 01            [ 1]  503 	ld	a, #0x01
      0086EB 21                     504 	.byte 0x21
      0086EC                        505 00138$:
      0086EC 4F               [ 1]  506 	clr	a
      0086ED                        507 00139$:
                                    508 ;	lib/stm8s_clk.c: 434: if (NewState != DISABLE)
      0086ED 0D 05            [ 1]  509 	tnz	(0x05, sp)
      0086EF 27 19            [ 1]  510 	jreq	00110$
                                    511 ;	lib/stm8s_clk.c: 436: switch (CLK_IT)
      0086F1 0D 01            [ 1]  512 	tnz	(0x01, sp)
      0086F3 26 0C            [ 1]  513 	jrne	00102$
      0086F5 4D               [ 1]  514 	tnz	a
      0086F6 27 29            [ 1]  515 	jreq	00112$
                                    516 ;	lib/stm8s_clk.c: 439: CLK->SWCR |= CLK_SWCR_SWIEN;
      0086F8 AE 50 C5         [ 2]  517 	ldw	x, #0x50c5
      0086FB F6               [ 1]  518 	ld	a, (x)
      0086FC AA 04            [ 1]  519 	or	a, #0x04
      0086FE F7               [ 1]  520 	ld	(x), a
                                    521 ;	lib/stm8s_clk.c: 440: break;
      0086FF 20 20            [ 2]  522 	jra	00112$
                                    523 ;	lib/stm8s_clk.c: 441: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      008701                        524 00102$:
                                    525 ;	lib/stm8s_clk.c: 442: CLK->CSSR |= CLK_CSSR_CSSDIE;
      008701 AE 50 C8         [ 2]  526 	ldw	x, #0x50c8
      008704 F6               [ 1]  527 	ld	a, (x)
      008705 AA 04            [ 1]  528 	or	a, #0x04
      008707 F7               [ 1]  529 	ld	(x), a
                                    530 ;	lib/stm8s_clk.c: 443: break;
      008708 20 17            [ 2]  531 	jra	00112$
                                    532 ;	lib/stm8s_clk.c: 446: }
      00870A                        533 00110$:
                                    534 ;	lib/stm8s_clk.c: 450: switch (CLK_IT)
      00870A 0D 01            [ 1]  535 	tnz	(0x01, sp)
      00870C 26 0C            [ 1]  536 	jrne	00106$
      00870E 4D               [ 1]  537 	tnz	a
      00870F 27 10            [ 1]  538 	jreq	00112$
                                    539 ;	lib/stm8s_clk.c: 453: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      008711 AE 50 C5         [ 2]  540 	ldw	x, #0x50c5
      008714 F6               [ 1]  541 	ld	a, (x)
      008715 A4 FB            [ 1]  542 	and	a, #0xfb
      008717 F7               [ 1]  543 	ld	(x), a
                                    544 ;	lib/stm8s_clk.c: 454: break;
      008718 20 07            [ 2]  545 	jra	00112$
                                    546 ;	lib/stm8s_clk.c: 455: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      00871A                        547 00106$:
                                    548 ;	lib/stm8s_clk.c: 456: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      00871A AE 50 C8         [ 2]  549 	ldw	x, #0x50c8
      00871D F6               [ 1]  550 	ld	a, (x)
      00871E A4 FB            [ 1]  551 	and	a, #0xfb
      008720 F7               [ 1]  552 	ld	(x), a
                                    553 ;	lib/stm8s_clk.c: 460: }
      008721                        554 00112$:
      008721 84               [ 1]  555 	pop	a
      008722 81               [ 4]  556 	ret
                                    557 ;	lib/stm8s_clk.c: 469: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    558 ;	-----------------------------------------
                                    559 ;	 function CLK_SYSCLKConfig
                                    560 ;	-----------------------------------------
      008723                        561 _CLK_SYSCLKConfig:
      008723 89               [ 2]  562 	pushw	x
                                    563 ;	lib/stm8s_clk.c: 472: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      008724 0D 05            [ 1]  564 	tnz	(0x05, sp)
      008726 2B 19            [ 1]  565 	jrmi	00102$
                                    566 ;	lib/stm8s_clk.c: 474: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008728 AE 50 C6         [ 2]  567 	ldw	x, #0x50c6
      00872B F6               [ 1]  568 	ld	a, (x)
      00872C A4 E7            [ 1]  569 	and	a, #0xe7
      00872E F7               [ 1]  570 	ld	(x), a
                                    571 ;	lib/stm8s_clk.c: 475: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      00872F AE 50 C6         [ 2]  572 	ldw	x, #0x50c6
      008732 F6               [ 1]  573 	ld	a, (x)
      008733 6B 02            [ 1]  574 	ld	(0x02, sp), a
      008735 7B 05            [ 1]  575 	ld	a, (0x05, sp)
      008737 A4 18            [ 1]  576 	and	a, #0x18
      008739 1A 02            [ 1]  577 	or	a, (0x02, sp)
      00873B AE 50 C6         [ 2]  578 	ldw	x, #0x50c6
      00873E F7               [ 1]  579 	ld	(x), a
      00873F 20 17            [ 2]  580 	jra	00104$
      008741                        581 00102$:
                                    582 ;	lib/stm8s_clk.c: 479: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      008741 AE 50 C6         [ 2]  583 	ldw	x, #0x50c6
      008744 F6               [ 1]  584 	ld	a, (x)
      008745 A4 F8            [ 1]  585 	and	a, #0xf8
      008747 F7               [ 1]  586 	ld	(x), a
                                    587 ;	lib/stm8s_clk.c: 480: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      008748 AE 50 C6         [ 2]  588 	ldw	x, #0x50c6
      00874B F6               [ 1]  589 	ld	a, (x)
      00874C 6B 01            [ 1]  590 	ld	(0x01, sp), a
      00874E 7B 05            [ 1]  591 	ld	a, (0x05, sp)
      008750 A4 07            [ 1]  592 	and	a, #0x07
      008752 1A 01            [ 1]  593 	or	a, (0x01, sp)
      008754 AE 50 C6         [ 2]  594 	ldw	x, #0x50c6
      008757 F7               [ 1]  595 	ld	(x), a
      008758                        596 00104$:
      008758 85               [ 2]  597 	popw	x
      008759 81               [ 4]  598 	ret
                                    599 ;	lib/stm8s_clk.c: 490: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    600 ;	-----------------------------------------
                                    601 ;	 function CLK_SWIMConfig
                                    602 ;	-----------------------------------------
      00875A                        603 _CLK_SWIMConfig:
                                    604 ;	lib/stm8s_clk.c: 493: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      00875A 0D 03            [ 1]  605 	tnz	(0x03, sp)
      00875C 27 05            [ 1]  606 	jreq	00102$
                                    607 ;	lib/stm8s_clk.c: 496: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      00875E 72 10 50 CD      [ 1]  608 	bset	0x50cd, #0
      008762 81               [ 4]  609 	ret
      008763                        610 00102$:
                                    611 ;	lib/stm8s_clk.c: 501: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      008763 72 11 50 CD      [ 1]  612 	bres	0x50cd, #0
      008767 81               [ 4]  613 	ret
                                    614 ;	lib/stm8s_clk.c: 512: void CLK_ClockSecuritySystemEnable(void)
                                    615 ;	-----------------------------------------
                                    616 ;	 function CLK_ClockSecuritySystemEnable
                                    617 ;	-----------------------------------------
      008768                        618 _CLK_ClockSecuritySystemEnable:
                                    619 ;	lib/stm8s_clk.c: 515: CLK->CSSR |= CLK_CSSR_CSSEN;
      008768 72 10 50 C8      [ 1]  620 	bset	0x50c8, #0
      00876C 81               [ 4]  621 	ret
                                    622 ;	lib/stm8s_clk.c: 524: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    623 ;	-----------------------------------------
                                    624 ;	 function CLK_GetSYSCLKSource
                                    625 ;	-----------------------------------------
      00876D                        626 _CLK_GetSYSCLKSource:
                                    627 ;	lib/stm8s_clk.c: 526: return((CLK_Source_TypeDef)CLK->CMSR);
      00876D AE 50 C3         [ 2]  628 	ldw	x, #0x50c3
      008770 F6               [ 1]  629 	ld	a, (x)
      008771 81               [ 4]  630 	ret
                                    631 ;	lib/stm8s_clk.c: 534: uint32_t CLK_GetClockFreq(void)
                                    632 ;	-----------------------------------------
                                    633 ;	 function CLK_GetClockFreq
                                    634 ;	-----------------------------------------
      008772                        635 _CLK_GetClockFreq:
      008772 52 07            [ 2]  636 	sub	sp, #7
                                    637 ;	lib/stm8s_clk.c: 541: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      008774 AE 50 C3         [ 2]  638 	ldw	x, #0x50c3
      008777 F6               [ 1]  639 	ld	a, (x)
      008778 6B 01            [ 1]  640 	ld	(0x01, sp), a
                                    641 ;	lib/stm8s_clk.c: 543: if (clocksource == CLK_SOURCE_HSI)
      00877A 7B 01            [ 1]  642 	ld	a, (0x01, sp)
      00877C A1 E1            [ 1]  643 	cp	a, #0xe1
      00877E 26 2C            [ 1]  644 	jrne	00105$
                                    645 ;	lib/stm8s_clk.c: 545: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      008780 AE 50 C6         [ 2]  646 	ldw	x, #0x50c6
      008783 F6               [ 1]  647 	ld	a, (x)
      008784 A4 18            [ 1]  648 	and	a, #0x18
                                    649 ;	lib/stm8s_clk.c: 546: tmp = (uint8_t)(tmp >> 3);
      008786 44               [ 1]  650 	srl	a
      008787 44               [ 1]  651 	srl	a
      008788 44               [ 1]  652 	srl	a
                                    653 ;	lib/stm8s_clk.c: 547: presc = HSIDivFactor[tmp];
      008789 AE 88 5F         [ 2]  654 	ldw	x, #_HSIDivFactor+0
      00878C 1F 06            [ 2]  655 	ldw	(0x06, sp), x
      00878E 5F               [ 1]  656 	clrw	x
      00878F 97               [ 1]  657 	ld	xl, a
      008790 72 FB 06         [ 2]  658 	addw	x, (0x06, sp)
      008793 F6               [ 1]  659 	ld	a, (x)
                                    660 ;	lib/stm8s_clk.c: 548: clockfrequency = HSI_VALUE / presc;
      008794 5F               [ 1]  661 	clrw	x
      008795 97               [ 1]  662 	ld	xl, a
      008796 90 5F            [ 1]  663 	clrw	y
      008798 89               [ 2]  664 	pushw	x
      008799 90 89            [ 2]  665 	pushw	y
      00879B 4B 00            [ 1]  666 	push	#0x00
      00879D 4B 24            [ 1]  667 	push	#0x24
      00879F 4B F4            [ 1]  668 	push	#0xf4
      0087A1 4B 00            [ 1]  669 	push	#0x00
      0087A3 CD 89 46         [ 4]  670 	call	__divulong
      0087A6 5B 08            [ 2]  671 	addw	sp, #8
      0087A8 1F 04            [ 2]  672 	ldw	(0x04, sp), x
      0087AA 20 1A            [ 2]  673 	jra	00106$
      0087AC                        674 00105$:
                                    675 ;	lib/stm8s_clk.c: 550: else if ( clocksource == CLK_SOURCE_LSI)
      0087AC 7B 01            [ 1]  676 	ld	a, (0x01, sp)
      0087AE A1 D2            [ 1]  677 	cp	a, #0xd2
      0087B0 26 0B            [ 1]  678 	jrne	00102$
                                    679 ;	lib/stm8s_clk.c: 552: clockfrequency = LSI_VALUE;
      0087B2 AE F4 00         [ 2]  680 	ldw	x, #0xf400
      0087B5 1F 04            [ 2]  681 	ldw	(0x04, sp), x
      0087B7 90 AE 00 01      [ 2]  682 	ldw	y, #0x0001
      0087BB 20 09            [ 2]  683 	jra	00106$
      0087BD                        684 00102$:
                                    685 ;	lib/stm8s_clk.c: 556: clockfrequency = HSE_VALUE;
      0087BD AE 24 00         [ 2]  686 	ldw	x, #0x2400
      0087C0 1F 04            [ 2]  687 	ldw	(0x04, sp), x
      0087C2 90 AE 00 F4      [ 2]  688 	ldw	y, #0x00f4
      0087C6                        689 00106$:
                                    690 ;	lib/stm8s_clk.c: 559: return((uint32_t)clockfrequency);
      0087C6 1E 04            [ 2]  691 	ldw	x, (0x04, sp)
      0087C8 5B 07            [ 2]  692 	addw	sp, #7
      0087CA 81               [ 4]  693 	ret
                                    694 ;	lib/stm8s_clk.c: 569: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    695 ;	-----------------------------------------
                                    696 ;	 function CLK_AdjustHSICalibrationValue
                                    697 ;	-----------------------------------------
      0087CB                        698 _CLK_AdjustHSICalibrationValue:
                                    699 ;	lib/stm8s_clk.c: 573: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      0087CB AE 50 CC         [ 2]  700 	ldw	x, #0x50cc
      0087CE F6               [ 1]  701 	ld	a, (x)
      0087CF A4 F8            [ 1]  702 	and	a, #0xf8
      0087D1 1A 03            [ 1]  703 	or	a, (0x03, sp)
      0087D3 AE 50 CC         [ 2]  704 	ldw	x, #0x50cc
      0087D6 F7               [ 1]  705 	ld	(x), a
      0087D7 81               [ 4]  706 	ret
                                    707 ;	lib/stm8s_clk.c: 585: void CLK_SYSCLKEmergencyClear(void)
                                    708 ;	-----------------------------------------
                                    709 ;	 function CLK_SYSCLKEmergencyClear
                                    710 ;	-----------------------------------------
      0087D8                        711 _CLK_SYSCLKEmergencyClear:
                                    712 ;	lib/stm8s_clk.c: 587: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      0087D8 72 11 50 C5      [ 1]  713 	bres	0x50c5, #0
      0087DC 81               [ 4]  714 	ret
                                    715 ;	lib/stm8s_clk.c: 597: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    716 ;	-----------------------------------------
                                    717 ;	 function CLK_GetFlagStatus
                                    718 ;	-----------------------------------------
      0087DD                        719 _CLK_GetFlagStatus:
      0087DD 88               [ 1]  720 	push	a
                                    721 ;	lib/stm8s_clk.c: 604: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      0087DE 4F               [ 1]  722 	clr	a
      0087DF 97               [ 1]  723 	ld	xl, a
      0087E0 7B 04            [ 1]  724 	ld	a, (0x04, sp)
      0087E2 95               [ 1]  725 	ld	xh, a
                                    726 ;	lib/stm8s_clk.c: 607: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      0087E3 A3 01 00         [ 2]  727 	cpw	x, #0x0100
      0087E6 26 06            [ 1]  728 	jrne	00111$
                                    729 ;	lib/stm8s_clk.c: 609: tmpreg = CLK->ICKR;
      0087E8 AE 50 C0         [ 2]  730 	ldw	x, #0x50c0
      0087EB F6               [ 1]  731 	ld	a, (x)
      0087EC 20 25            [ 2]  732 	jra	00112$
      0087EE                        733 00111$:
                                    734 ;	lib/stm8s_clk.c: 611: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      0087EE A3 02 00         [ 2]  735 	cpw	x, #0x0200
      0087F1 26 06            [ 1]  736 	jrne	00108$
                                    737 ;	lib/stm8s_clk.c: 613: tmpreg = CLK->ECKR;
      0087F3 AE 50 C1         [ 2]  738 	ldw	x, #0x50c1
      0087F6 F6               [ 1]  739 	ld	a, (x)
      0087F7 20 1A            [ 2]  740 	jra	00112$
      0087F9                        741 00108$:
                                    742 ;	lib/stm8s_clk.c: 615: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      0087F9 A3 03 00         [ 2]  743 	cpw	x, #0x0300
      0087FC 26 06            [ 1]  744 	jrne	00105$
                                    745 ;	lib/stm8s_clk.c: 617: tmpreg = CLK->SWCR;
      0087FE AE 50 C5         [ 2]  746 	ldw	x, #0x50c5
      008801 F6               [ 1]  747 	ld	a, (x)
      008802 20 0F            [ 2]  748 	jra	00112$
      008804                        749 00105$:
                                    750 ;	lib/stm8s_clk.c: 619: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      008804 A3 04 00         [ 2]  751 	cpw	x, #0x0400
      008807 26 06            [ 1]  752 	jrne	00102$
                                    753 ;	lib/stm8s_clk.c: 621: tmpreg = CLK->CSSR;
      008809 AE 50 C8         [ 2]  754 	ldw	x, #0x50c8
      00880C F6               [ 1]  755 	ld	a, (x)
      00880D 20 04            [ 2]  756 	jra	00112$
      00880F                        757 00102$:
                                    758 ;	lib/stm8s_clk.c: 625: tmpreg = CLK->CCOR;
      00880F AE 50 C9         [ 2]  759 	ldw	x, #0x50c9
      008812 F6               [ 1]  760 	ld	a, (x)
      008813                        761 00112$:
                                    762 ;	lib/stm8s_clk.c: 628: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      008813 88               [ 1]  763 	push	a
      008814 7B 06            [ 1]  764 	ld	a, (0x06, sp)
      008816 6B 02            [ 1]  765 	ld	(0x02, sp), a
      008818 84               [ 1]  766 	pop	a
      008819 14 01            [ 1]  767 	and	a, (0x01, sp)
      00881B 4D               [ 1]  768 	tnz	a
      00881C 27 03            [ 1]  769 	jreq	00114$
                                    770 ;	lib/stm8s_clk.c: 630: bitstatus = SET;
      00881E A6 01            [ 1]  771 	ld	a, #0x01
                                    772 ;	lib/stm8s_clk.c: 634: bitstatus = RESET;
      008820 21                     773 	.byte 0x21
      008821                        774 00114$:
      008821 4F               [ 1]  775 	clr	a
      008822                        776 00115$:
                                    777 ;	lib/stm8s_clk.c: 638: return((FlagStatus)bitstatus);
      008822 5B 01            [ 2]  778 	addw	sp, #1
      008824 81               [ 4]  779 	ret
                                    780 ;	lib/stm8s_clk.c: 647: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    781 ;	-----------------------------------------
                                    782 ;	 function CLK_GetITStatus
                                    783 ;	-----------------------------------------
      008825                        784 _CLK_GetITStatus:
                                    785 ;	lib/stm8s_clk.c: 651: if (CLK_IT == CLK_IT_SWIF)
      008825 7B 03            [ 1]  786 	ld	a, (0x03, sp)
      008827 A1 1C            [ 1]  787 	cp	a, #0x1c
      008829 26 0F            [ 1]  788 	jrne	00108$
                                    789 ;	lib/stm8s_clk.c: 654: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      00882B AE 50 C5         [ 2]  790 	ldw	x, #0x50c5
      00882E F6               [ 1]  791 	ld	a, (x)
      00882F 14 03            [ 1]  792 	and	a, (0x03, sp)
      008831 A1 0C            [ 1]  793 	cp	a, #0x0c
      008833 26 03            [ 1]  794 	jrne	00102$
                                    795 ;	lib/stm8s_clk.c: 656: bitstatus = SET;
      008835 A6 01            [ 1]  796 	ld	a, #0x01
      008837 81               [ 4]  797 	ret
      008838                        798 00102$:
                                    799 ;	lib/stm8s_clk.c: 660: bitstatus = RESET;
      008838 4F               [ 1]  800 	clr	a
      008839 81               [ 4]  801 	ret
      00883A                        802 00108$:
                                    803 ;	lib/stm8s_clk.c: 666: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      00883A AE 50 C8         [ 2]  804 	ldw	x, #0x50c8
      00883D F6               [ 1]  805 	ld	a, (x)
      00883E 14 03            [ 1]  806 	and	a, (0x03, sp)
      008840 A1 0C            [ 1]  807 	cp	a, #0x0c
      008842 26 03            [ 1]  808 	jrne	00105$
                                    809 ;	lib/stm8s_clk.c: 668: bitstatus = SET;
      008844 A6 01            [ 1]  810 	ld	a, #0x01
      008846 81               [ 4]  811 	ret
      008847                        812 00105$:
                                    813 ;	lib/stm8s_clk.c: 672: bitstatus = RESET;
      008847 4F               [ 1]  814 	clr	a
                                    815 ;	lib/stm8s_clk.c: 677: return bitstatus;
      008848 81               [ 4]  816 	ret
                                    817 ;	lib/stm8s_clk.c: 686: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    818 ;	-----------------------------------------
                                    819 ;	 function CLK_ClearITPendingBit
                                    820 ;	-----------------------------------------
      008849                        821 _CLK_ClearITPendingBit:
                                    822 ;	lib/stm8s_clk.c: 689: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      008849 7B 03            [ 1]  823 	ld	a, (0x03, sp)
      00884B A1 0C            [ 1]  824 	cp	a, #0x0c
      00884D 26 08            [ 1]  825 	jrne	00102$
                                    826 ;	lib/stm8s_clk.c: 692: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      00884F AE 50 C8         [ 2]  827 	ldw	x, #0x50c8
      008852 F6               [ 1]  828 	ld	a, (x)
      008853 A4 F7            [ 1]  829 	and	a, #0xf7
      008855 F7               [ 1]  830 	ld	(x), a
      008856 81               [ 4]  831 	ret
      008857                        832 00102$:
                                    833 ;	lib/stm8s_clk.c: 697: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      008857 AE 50 C5         [ 2]  834 	ldw	x, #0x50c5
      00885A F6               [ 1]  835 	ld	a, (x)
      00885B A4 F7            [ 1]  836 	and	a, #0xf7
      00885D F7               [ 1]  837 	ld	(x), a
      00885E 81               [ 4]  838 	ret
                                    839 	.area CODE
      00885F                        840 _HSIDivFactor:
      00885F 01                     841 	.db #0x01	; 1
      008860 02                     842 	.db #0x02	; 2
      008861 04                     843 	.db #0x04	; 4
      008862 08                     844 	.db #0x08	; 8
      008863                        845 _CLKPrescTable:
      008863 01                     846 	.db #0x01	; 1
      008864 02                     847 	.db #0x02	; 2
      008865 04                     848 	.db #0x04	; 4
      008866 08                     849 	.db #0x08	; 8
      008867 0A                     850 	.db #0x0a	; 10
      008868 10                     851 	.db #0x10	; 16
      008869 14                     852 	.db #0x14	; 20
      00886A 28                     853 	.db #0x28	; 40
                                    854 	.area INITIALIZER
                                    855 	.area CABS (ABS)
