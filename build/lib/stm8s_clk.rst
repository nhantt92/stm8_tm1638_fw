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
      00866B                         68 _CLK_DeInit:
                                     69 ;	lib/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      00866B 35 01 50 C0      [ 1]   70 	mov	0x50c0+0, #0x01
                                     71 ;	lib/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      00866F 35 00 50 C1      [ 1]   72 	mov	0x50c1+0, #0x00
                                     73 ;	lib/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      008673 35 E1 50 C4      [ 1]   74 	mov	0x50c4+0, #0xe1
                                     75 ;	lib/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      008677 35 00 50 C5      [ 1]   76 	mov	0x50c5+0, #0x00
                                     77 ;	lib/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      00867B 35 18 50 C6      [ 1]   78 	mov	0x50c6+0, #0x18
                                     79 ;	lib/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      00867F 35 FF 50 C7      [ 1]   80 	mov	0x50c7+0, #0xff
                                     81 ;	lib/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      008683 35 FF 50 CA      [ 1]   82 	mov	0x50ca+0, #0xff
                                     83 ;	lib/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      008687 35 00 50 C8      [ 1]   84 	mov	0x50c8+0, #0x00
                                     85 ;	lib/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      00868B 35 00 50 C9      [ 1]   86 	mov	0x50c9+0, #0x00
                                     87 ;	lib/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      00868F                         88 00101$:
      00868F AE 50 C9         [ 2]   89 	ldw	x, #0x50c9
      008692 F6               [ 1]   90 	ld	a, (x)
      008693 44               [ 1]   91 	srl	a
      008694 25 F9            [ 1]   92 	jrc	00101$
                                     93 ;	lib/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008696 35 00 50 C9      [ 1]   94 	mov	0x50c9+0, #0x00
                                     95 ;	lib/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      00869A 35 00 50 CC      [ 1]   96 	mov	0x50cc+0, #0x00
                                     97 ;	lib/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      00869E 35 00 50 CD      [ 1]   98 	mov	0x50cd+0, #0x00
      0086A2 81               [ 4]   99 	ret
                                    100 ;	lib/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function CLK_FastHaltWakeUpCmd
                                    103 ;	-----------------------------------------
      0086A3                        104 _CLK_FastHaltWakeUpCmd:
                                    105 ;	lib/stm8s_clk.c: 102: if (NewState != DISABLE)
      0086A3 0D 03            [ 1]  106 	tnz	(0x03, sp)
      0086A5 27 08            [ 1]  107 	jreq	00102$
                                    108 ;	lib/stm8s_clk.c: 105: CLK->ICKR |= CLK_ICKR_FHWU;
      0086A7 AE 50 C0         [ 2]  109 	ldw	x, #0x50c0
      0086AA F6               [ 1]  110 	ld	a, (x)
      0086AB AA 04            [ 1]  111 	or	a, #0x04
      0086AD F7               [ 1]  112 	ld	(x), a
      0086AE 81               [ 4]  113 	ret
      0086AF                        114 00102$:
                                    115 ;	lib/stm8s_clk.c: 110: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      0086AF AE 50 C0         [ 2]  116 	ldw	x, #0x50c0
      0086B2 F6               [ 1]  117 	ld	a, (x)
      0086B3 A4 FB            [ 1]  118 	and	a, #0xfb
      0086B5 F7               [ 1]  119 	ld	(x), a
      0086B6 81               [ 4]  120 	ret
                                    121 ;	lib/stm8s_clk.c: 119: void CLK_HSECmd(FunctionalState NewState)
                                    122 ;	-----------------------------------------
                                    123 ;	 function CLK_HSECmd
                                    124 ;	-----------------------------------------
      0086B7                        125 _CLK_HSECmd:
                                    126 ;	lib/stm8s_clk.c: 122: if (NewState != DISABLE)
      0086B7 0D 03            [ 1]  127 	tnz	(0x03, sp)
      0086B9 27 05            [ 1]  128 	jreq	00102$
                                    129 ;	lib/stm8s_clk.c: 125: CLK->ECKR |= CLK_ECKR_HSEEN;
      0086BB 72 10 50 C1      [ 1]  130 	bset	0x50c1, #0
      0086BF 81               [ 4]  131 	ret
      0086C0                        132 00102$:
                                    133 ;	lib/stm8s_clk.c: 130: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      0086C0 72 11 50 C1      [ 1]  134 	bres	0x50c1, #0
      0086C4 81               [ 4]  135 	ret
                                    136 ;	lib/stm8s_clk.c: 139: void CLK_HSICmd(FunctionalState NewState)
                                    137 ;	-----------------------------------------
                                    138 ;	 function CLK_HSICmd
                                    139 ;	-----------------------------------------
      0086C5                        140 _CLK_HSICmd:
                                    141 ;	lib/stm8s_clk.c: 142: if (NewState != DISABLE)
      0086C5 0D 03            [ 1]  142 	tnz	(0x03, sp)
      0086C7 27 05            [ 1]  143 	jreq	00102$
                                    144 ;	lib/stm8s_clk.c: 145: CLK->ICKR |= CLK_ICKR_HSIEN;
      0086C9 72 10 50 C0      [ 1]  145 	bset	0x50c0, #0
      0086CD 81               [ 4]  146 	ret
      0086CE                        147 00102$:
                                    148 ;	lib/stm8s_clk.c: 150: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      0086CE 72 11 50 C0      [ 1]  149 	bres	0x50c0, #0
      0086D2 81               [ 4]  150 	ret
                                    151 ;	lib/stm8s_clk.c: 160: void CLK_LSICmd(FunctionalState NewState)
                                    152 ;	-----------------------------------------
                                    153 ;	 function CLK_LSICmd
                                    154 ;	-----------------------------------------
      0086D3                        155 _CLK_LSICmd:
                                    156 ;	lib/stm8s_clk.c: 163: if (NewState != DISABLE)
      0086D3 0D 03            [ 1]  157 	tnz	(0x03, sp)
      0086D5 27 08            [ 1]  158 	jreq	00102$
                                    159 ;	lib/stm8s_clk.c: 166: CLK->ICKR |= CLK_ICKR_LSIEN;
      0086D7 AE 50 C0         [ 2]  160 	ldw	x, #0x50c0
      0086DA F6               [ 1]  161 	ld	a, (x)
      0086DB AA 08            [ 1]  162 	or	a, #0x08
      0086DD F7               [ 1]  163 	ld	(x), a
      0086DE 81               [ 4]  164 	ret
      0086DF                        165 00102$:
                                    166 ;	lib/stm8s_clk.c: 171: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      0086DF AE 50 C0         [ 2]  167 	ldw	x, #0x50c0
      0086E2 F6               [ 1]  168 	ld	a, (x)
      0086E3 A4 F7            [ 1]  169 	and	a, #0xf7
      0086E5 F7               [ 1]  170 	ld	(x), a
      0086E6 81               [ 4]  171 	ret
                                    172 ;	lib/stm8s_clk.c: 181: void CLK_CCOCmd(FunctionalState NewState)
                                    173 ;	-----------------------------------------
                                    174 ;	 function CLK_CCOCmd
                                    175 ;	-----------------------------------------
      0086E7                        176 _CLK_CCOCmd:
                                    177 ;	lib/stm8s_clk.c: 184: if (NewState != DISABLE)
      0086E7 0D 03            [ 1]  178 	tnz	(0x03, sp)
      0086E9 27 05            [ 1]  179 	jreq	00102$
                                    180 ;	lib/stm8s_clk.c: 187: CLK->CCOR |= CLK_CCOR_CCOEN;
      0086EB 72 10 50 C9      [ 1]  181 	bset	0x50c9, #0
      0086EF 81               [ 4]  182 	ret
      0086F0                        183 00102$:
                                    184 ;	lib/stm8s_clk.c: 192: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      0086F0 72 11 50 C9      [ 1]  185 	bres	0x50c9, #0
      0086F4 81               [ 4]  186 	ret
                                    187 ;	lib/stm8s_clk.c: 203: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    188 ;	-----------------------------------------
                                    189 ;	 function CLK_ClockSwitchCmd
                                    190 ;	-----------------------------------------
      0086F5                        191 _CLK_ClockSwitchCmd:
                                    192 ;	lib/stm8s_clk.c: 206: if (NewState != DISABLE )
      0086F5 0D 03            [ 1]  193 	tnz	(0x03, sp)
      0086F7 27 08            [ 1]  194 	jreq	00102$
                                    195 ;	lib/stm8s_clk.c: 209: CLK->SWCR |= CLK_SWCR_SWEN;
      0086F9 AE 50 C5         [ 2]  196 	ldw	x, #0x50c5
      0086FC F6               [ 1]  197 	ld	a, (x)
      0086FD AA 02            [ 1]  198 	or	a, #0x02
      0086FF F7               [ 1]  199 	ld	(x), a
      008700 81               [ 4]  200 	ret
      008701                        201 00102$:
                                    202 ;	lib/stm8s_clk.c: 214: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      008701 AE 50 C5         [ 2]  203 	ldw	x, #0x50c5
      008704 F6               [ 1]  204 	ld	a, (x)
      008705 A4 FD            [ 1]  205 	and	a, #0xfd
      008707 F7               [ 1]  206 	ld	(x), a
      008708 81               [ 4]  207 	ret
                                    208 ;	lib/stm8s_clk.c: 226: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    209 ;	-----------------------------------------
                                    210 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    211 ;	-----------------------------------------
      008709                        212 _CLK_SlowActiveHaltWakeUpCmd:
                                    213 ;	lib/stm8s_clk.c: 229: if (NewState != DISABLE)
      008709 0D 03            [ 1]  214 	tnz	(0x03, sp)
      00870B 27 08            [ 1]  215 	jreq	00102$
                                    216 ;	lib/stm8s_clk.c: 232: CLK->ICKR |= CLK_ICKR_SWUAH;
      00870D AE 50 C0         [ 2]  217 	ldw	x, #0x50c0
      008710 F6               [ 1]  218 	ld	a, (x)
      008711 AA 20            [ 1]  219 	or	a, #0x20
      008713 F7               [ 1]  220 	ld	(x), a
      008714 81               [ 4]  221 	ret
      008715                        222 00102$:
                                    223 ;	lib/stm8s_clk.c: 237: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      008715 AE 50 C0         [ 2]  224 	ldw	x, #0x50c0
      008718 F6               [ 1]  225 	ld	a, (x)
      008719 A4 DF            [ 1]  226 	and	a, #0xdf
      00871B F7               [ 1]  227 	ld	(x), a
      00871C 81               [ 4]  228 	ret
                                    229 ;	lib/stm8s_clk.c: 249: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    230 ;	-----------------------------------------
                                    231 ;	 function CLK_PeripheralClockConfig
                                    232 ;	-----------------------------------------
      00871D                        233 _CLK_PeripheralClockConfig:
      00871D 89               [ 2]  234 	pushw	x
                                    235 ;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00871E 7B 05            [ 1]  236 	ld	a, (0x05, sp)
      008720 A4 0F            [ 1]  237 	and	a, #0x0f
      008722 88               [ 1]  238 	push	a
      008723 A6 01            [ 1]  239 	ld	a, #0x01
      008725 6B 02            [ 1]  240 	ld	(0x02, sp), a
      008727 84               [ 1]  241 	pop	a
      008728 4D               [ 1]  242 	tnz	a
      008729 27 05            [ 1]  243 	jreq	00125$
      00872B                        244 00124$:
      00872B 08 01            [ 1]  245 	sll	(0x01, sp)
      00872D 4A               [ 1]  246 	dec	a
      00872E 26 FB            [ 1]  247 	jrne	00124$
      008730                        248 00125$:
                                    249 ;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008730 7B 01            [ 1]  250 	ld	a, (0x01, sp)
      008732 43               [ 1]  251 	cpl	a
      008733 6B 02            [ 1]  252 	ld	(0x02, sp), a
                                    253 ;	lib/stm8s_clk.c: 252: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      008735 7B 05            [ 1]  254 	ld	a, (0x05, sp)
      008737 A5 10            [ 1]  255 	bcp	a, #0x10
      008739 26 1C            [ 1]  256 	jrne	00108$
                                    257 ;	lib/stm8s_clk.c: 254: if (NewState != DISABLE)
      00873B 0D 06            [ 1]  258 	tnz	(0x06, sp)
      00873D 27 0C            [ 1]  259 	jreq	00102$
                                    260 ;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00873F AE 50 C7         [ 2]  261 	ldw	x, #0x50c7
      008742 F6               [ 1]  262 	ld	a, (x)
      008743 1A 01            [ 1]  263 	or	a, (0x01, sp)
      008745 AE 50 C7         [ 2]  264 	ldw	x, #0x50c7
      008748 F7               [ 1]  265 	ld	(x), a
      008749 20 26            [ 2]  266 	jra	00110$
      00874B                        267 00102$:
                                    268 ;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      00874B AE 50 C7         [ 2]  269 	ldw	x, #0x50c7
      00874E F6               [ 1]  270 	ld	a, (x)
      00874F 14 02            [ 1]  271 	and	a, (0x02, sp)
      008751 AE 50 C7         [ 2]  272 	ldw	x, #0x50c7
      008754 F7               [ 1]  273 	ld	(x), a
      008755 20 1A            [ 2]  274 	jra	00110$
      008757                        275 00108$:
                                    276 ;	lib/stm8s_clk.c: 267: if (NewState != DISABLE)
      008757 0D 06            [ 1]  277 	tnz	(0x06, sp)
      008759 27 0C            [ 1]  278 	jreq	00105$
                                    279 ;	lib/stm8s_clk.c: 270: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00875B AE 50 CA         [ 2]  280 	ldw	x, #0x50ca
      00875E F6               [ 1]  281 	ld	a, (x)
      00875F 1A 01            [ 1]  282 	or	a, (0x01, sp)
      008761 AE 50 CA         [ 2]  283 	ldw	x, #0x50ca
      008764 F7               [ 1]  284 	ld	(x), a
      008765 20 0A            [ 2]  285 	jra	00110$
      008767                        286 00105$:
                                    287 ;	lib/stm8s_clk.c: 275: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008767 AE 50 CA         [ 2]  288 	ldw	x, #0x50ca
      00876A F6               [ 1]  289 	ld	a, (x)
      00876B 14 02            [ 1]  290 	and	a, (0x02, sp)
      00876D AE 50 CA         [ 2]  291 	ldw	x, #0x50ca
      008770 F7               [ 1]  292 	ld	(x), a
      008771                        293 00110$:
      008771 85               [ 2]  294 	popw	x
      008772 81               [ 4]  295 	ret
                                    296 ;	lib/stm8s_clk.c: 292: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    297 ;	-----------------------------------------
                                    298 ;	 function CLK_ClockSwitchConfig
                                    299 ;	-----------------------------------------
      008773                        300 _CLK_ClockSwitchConfig:
      008773 89               [ 2]  301 	pushw	x
                                    302 ;	lib/stm8s_clk.c: 299: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      008774 AE 50 C3         [ 2]  303 	ldw	x, #0x50c3
      008777 F6               [ 1]  304 	ld	a, (x)
      008778 6B 01            [ 1]  305 	ld	(0x01, sp), a
                                    306 ;	lib/stm8s_clk.c: 302: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      00877A 7B 05            [ 1]  307 	ld	a, (0x05, sp)
      00877C A1 01            [ 1]  308 	cp	a, #0x01
      00877E 26 40            [ 1]  309 	jrne	00122$
                                    310 ;	lib/stm8s_clk.c: 305: CLK->SWCR |= CLK_SWCR_SWEN;
      008780 AE 50 C5         [ 2]  311 	ldw	x, #0x50c5
      008783 F6               [ 1]  312 	ld	a, (x)
      008784 AA 02            [ 1]  313 	or	a, #0x02
      008786 F7               [ 1]  314 	ld	(x), a
                                    315 ;	lib/stm8s_clk.c: 308: if (ITState != DISABLE)
      008787 0D 07            [ 1]  316 	tnz	(0x07, sp)
      008789 27 09            [ 1]  317 	jreq	00102$
                                    318 ;	lib/stm8s_clk.c: 310: CLK->SWCR |= CLK_SWCR_SWIEN;
      00878B AE 50 C5         [ 2]  319 	ldw	x, #0x50c5
      00878E F6               [ 1]  320 	ld	a, (x)
      00878F AA 04            [ 1]  321 	or	a, #0x04
      008791 F7               [ 1]  322 	ld	(x), a
      008792 20 07            [ 2]  323 	jra	00103$
      008794                        324 00102$:
                                    325 ;	lib/stm8s_clk.c: 314: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      008794 AE 50 C5         [ 2]  326 	ldw	x, #0x50c5
      008797 F6               [ 1]  327 	ld	a, (x)
      008798 A4 FB            [ 1]  328 	and	a, #0xfb
      00879A F7               [ 1]  329 	ld	(x), a
      00879B                        330 00103$:
                                    331 ;	lib/stm8s_clk.c: 318: CLK->SWR = (uint8_t)CLK_NewClock;
      00879B AE 50 C4         [ 2]  332 	ldw	x, #0x50c4
      00879E 7B 06            [ 1]  333 	ld	a, (0x06, sp)
      0087A0 F7               [ 1]  334 	ld	(x), a
                                    335 ;	lib/stm8s_clk.c: 321: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      0087A1 AE FF FF         [ 2]  336 	ldw	x, #0xffff
      0087A4                        337 00105$:
      0087A4 90 AE 50 C5      [ 2]  338 	ldw	y, #0x50c5
      0087A8 90 F6            [ 1]  339 	ld	a, (y)
      0087AA 44               [ 1]  340 	srl	a
      0087AB 24 06            [ 1]  341 	jrnc	00107$
      0087AD 5D               [ 2]  342 	tnzw	x
      0087AE 27 03            [ 1]  343 	jreq	00107$
                                    344 ;	lib/stm8s_clk.c: 323: DownCounter--;
      0087B0 5A               [ 2]  345 	decw	x
      0087B1 20 F1            [ 2]  346 	jra	00105$
      0087B3                        347 00107$:
                                    348 ;	lib/stm8s_clk.c: 326: if(DownCounter != 0)
      0087B3 5D               [ 2]  349 	tnzw	x
      0087B4 27 06            [ 1]  350 	jreq	00109$
                                    351 ;	lib/stm8s_clk.c: 328: Swif = SUCCESS;
      0087B6 A6 01            [ 1]  352 	ld	a, #0x01
      0087B8 6B 02            [ 1]  353 	ld	(0x02, sp), a
      0087BA 20 43            [ 2]  354 	jra	00123$
      0087BC                        355 00109$:
                                    356 ;	lib/stm8s_clk.c: 332: Swif = ERROR;
      0087BC 0F 02            [ 1]  357 	clr	(0x02, sp)
      0087BE 20 3F            [ 2]  358 	jra	00123$
      0087C0                        359 00122$:
                                    360 ;	lib/stm8s_clk.c: 338: if (ITState != DISABLE)
      0087C0 0D 07            [ 1]  361 	tnz	(0x07, sp)
      0087C2 27 09            [ 1]  362 	jreq	00112$
                                    363 ;	lib/stm8s_clk.c: 340: CLK->SWCR |= CLK_SWCR_SWIEN;
      0087C4 AE 50 C5         [ 2]  364 	ldw	x, #0x50c5
      0087C7 F6               [ 1]  365 	ld	a, (x)
      0087C8 AA 04            [ 1]  366 	or	a, #0x04
      0087CA F7               [ 1]  367 	ld	(x), a
      0087CB 20 07            [ 2]  368 	jra	00113$
      0087CD                        369 00112$:
                                    370 ;	lib/stm8s_clk.c: 344: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      0087CD AE 50 C5         [ 2]  371 	ldw	x, #0x50c5
      0087D0 F6               [ 1]  372 	ld	a, (x)
      0087D1 A4 FB            [ 1]  373 	and	a, #0xfb
      0087D3 F7               [ 1]  374 	ld	(x), a
      0087D4                        375 00113$:
                                    376 ;	lib/stm8s_clk.c: 348: CLK->SWR = (uint8_t)CLK_NewClock;
      0087D4 AE 50 C4         [ 2]  377 	ldw	x, #0x50c4
      0087D7 7B 06            [ 1]  378 	ld	a, (0x06, sp)
      0087D9 F7               [ 1]  379 	ld	(x), a
                                    380 ;	lib/stm8s_clk.c: 351: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      0087DA AE FF FF         [ 2]  381 	ldw	x, #0xffff
      0087DD                        382 00115$:
      0087DD 90 AE 50 C5      [ 2]  383 	ldw	y, #0x50c5
      0087E1 90 F6            [ 1]  384 	ld	a, (y)
      0087E3 A5 08            [ 1]  385 	bcp	a, #0x08
      0087E5 27 06            [ 1]  386 	jreq	00117$
      0087E7 5D               [ 2]  387 	tnzw	x
      0087E8 27 03            [ 1]  388 	jreq	00117$
                                    389 ;	lib/stm8s_clk.c: 353: DownCounter--;
      0087EA 5A               [ 2]  390 	decw	x
      0087EB 20 F0            [ 2]  391 	jra	00115$
      0087ED                        392 00117$:
                                    393 ;	lib/stm8s_clk.c: 356: if(DownCounter != 0)
      0087ED 5D               [ 2]  394 	tnzw	x
      0087EE 27 0D            [ 1]  395 	jreq	00119$
                                    396 ;	lib/stm8s_clk.c: 359: CLK->SWCR |= CLK_SWCR_SWEN;
      0087F0 AE 50 C5         [ 2]  397 	ldw	x, #0x50c5
      0087F3 F6               [ 1]  398 	ld	a, (x)
      0087F4 AA 02            [ 1]  399 	or	a, #0x02
      0087F6 F7               [ 1]  400 	ld	(x), a
                                    401 ;	lib/stm8s_clk.c: 360: Swif = SUCCESS;
      0087F7 A6 01            [ 1]  402 	ld	a, #0x01
      0087F9 6B 02            [ 1]  403 	ld	(0x02, sp), a
      0087FB 20 02            [ 2]  404 	jra	00123$
      0087FD                        405 00119$:
                                    406 ;	lib/stm8s_clk.c: 364: Swif = ERROR;
      0087FD 0F 02            [ 1]  407 	clr	(0x02, sp)
      0087FF                        408 00123$:
                                    409 ;	lib/stm8s_clk.c: 367: if(Swif != ERROR)
      0087FF 0D 02            [ 1]  410 	tnz	(0x02, sp)
      008801 27 31            [ 1]  411 	jreq	00136$
                                    412 ;	lib/stm8s_clk.c: 370: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      008803 0D 08            [ 1]  413 	tnz	(0x08, sp)
      008805 26 0C            [ 1]  414 	jrne	00132$
      008807 7B 01            [ 1]  415 	ld	a, (0x01, sp)
      008809 A1 E1            [ 1]  416 	cp	a, #0xe1
      00880B 26 06            [ 1]  417 	jrne	00132$
                                    418 ;	lib/stm8s_clk.c: 372: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      00880D 72 11 50 C0      [ 1]  419 	bres	0x50c0, #0
      008811 20 21            [ 2]  420 	jra	00136$
      008813                        421 00132$:
                                    422 ;	lib/stm8s_clk.c: 374: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      008813 0D 08            [ 1]  423 	tnz	(0x08, sp)
      008815 26 0F            [ 1]  424 	jrne	00128$
      008817 7B 01            [ 1]  425 	ld	a, (0x01, sp)
      008819 A1 D2            [ 1]  426 	cp	a, #0xd2
      00881B 26 09            [ 1]  427 	jrne	00128$
                                    428 ;	lib/stm8s_clk.c: 376: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      00881D AE 50 C0         [ 2]  429 	ldw	x, #0x50c0
      008820 F6               [ 1]  430 	ld	a, (x)
      008821 A4 F7            [ 1]  431 	and	a, #0xf7
      008823 F7               [ 1]  432 	ld	(x), a
      008824 20 0E            [ 2]  433 	jra	00136$
      008826                        434 00128$:
                                    435 ;	lib/stm8s_clk.c: 378: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      008826 0D 08            [ 1]  436 	tnz	(0x08, sp)
      008828 26 0A            [ 1]  437 	jrne	00136$
      00882A 7B 01            [ 1]  438 	ld	a, (0x01, sp)
      00882C A1 B4            [ 1]  439 	cp	a, #0xb4
      00882E 26 04            [ 1]  440 	jrne	00136$
                                    441 ;	lib/stm8s_clk.c: 380: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      008830 72 11 50 C1      [ 1]  442 	bres	0x50c1, #0
      008834                        443 00136$:
                                    444 ;	lib/stm8s_clk.c: 383: return(Swif);
      008834 7B 02            [ 1]  445 	ld	a, (0x02, sp)
      008836 85               [ 2]  446 	popw	x
      008837 81               [ 4]  447 	ret
                                    448 ;	lib/stm8s_clk.c: 392: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    449 ;	-----------------------------------------
                                    450 ;	 function CLK_HSIPrescalerConfig
                                    451 ;	-----------------------------------------
      008838                        452 _CLK_HSIPrescalerConfig:
                                    453 ;	lib/stm8s_clk.c: 396: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008838 AE 50 C6         [ 2]  454 	ldw	x, #0x50c6
      00883B F6               [ 1]  455 	ld	a, (x)
      00883C A4 E7            [ 1]  456 	and	a, #0xe7
      00883E F7               [ 1]  457 	ld	(x), a
                                    458 ;	lib/stm8s_clk.c: 399: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      00883F AE 50 C6         [ 2]  459 	ldw	x, #0x50c6
      008842 F6               [ 1]  460 	ld	a, (x)
      008843 1A 03            [ 1]  461 	or	a, (0x03, sp)
      008845 AE 50 C6         [ 2]  462 	ldw	x, #0x50c6
      008848 F7               [ 1]  463 	ld	(x), a
      008849 81               [ 4]  464 	ret
                                    465 ;	lib/stm8s_clk.c: 411: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    466 ;	-----------------------------------------
                                    467 ;	 function CLK_CCOConfig
                                    468 ;	-----------------------------------------
      00884A                        469 _CLK_CCOConfig:
                                    470 ;	lib/stm8s_clk.c: 415: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      00884A AE 50 C9         [ 2]  471 	ldw	x, #0x50c9
      00884D F6               [ 1]  472 	ld	a, (x)
      00884E A4 E1            [ 1]  473 	and	a, #0xe1
      008850 F7               [ 1]  474 	ld	(x), a
                                    475 ;	lib/stm8s_clk.c: 418: CLK->CCOR |= (uint8_t)CLK_CCO;
      008851 AE 50 C9         [ 2]  476 	ldw	x, #0x50c9
      008854 F6               [ 1]  477 	ld	a, (x)
      008855 1A 03            [ 1]  478 	or	a, (0x03, sp)
      008857 AE 50 C9         [ 2]  479 	ldw	x, #0x50c9
      00885A F7               [ 1]  480 	ld	(x), a
                                    481 ;	lib/stm8s_clk.c: 421: CLK->CCOR |= CLK_CCOR_CCOEN;
      00885B 72 10 50 C9      [ 1]  482 	bset	0x50c9, #0
      00885F 81               [ 4]  483 	ret
                                    484 ;	lib/stm8s_clk.c: 432: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    485 ;	-----------------------------------------
                                    486 ;	 function CLK_ITConfig
                                    487 ;	-----------------------------------------
      008860                        488 _CLK_ITConfig:
      008860 88               [ 1]  489 	push	a
                                    490 ;	lib/stm8s_clk.c: 436: switch (CLK_IT)
      008861 7B 04            [ 1]  491 	ld	a, (0x04, sp)
      008863 A1 0C            [ 1]  492 	cp	a, #0x0c
      008865 26 06            [ 1]  493 	jrne	00135$
      008867 A6 01            [ 1]  494 	ld	a, #0x01
      008869 6B 01            [ 1]  495 	ld	(0x01, sp), a
      00886B 20 02            [ 2]  496 	jra	00136$
      00886D                        497 00135$:
      00886D 0F 01            [ 1]  498 	clr	(0x01, sp)
      00886F                        499 00136$:
      00886F 7B 04            [ 1]  500 	ld	a, (0x04, sp)
      008871 A1 1C            [ 1]  501 	cp	a, #0x1c
      008873 26 03            [ 1]  502 	jrne	00138$
      008875 A6 01            [ 1]  503 	ld	a, #0x01
      008877 21                     504 	.byte 0x21
      008878                        505 00138$:
      008878 4F               [ 1]  506 	clr	a
      008879                        507 00139$:
                                    508 ;	lib/stm8s_clk.c: 434: if (NewState != DISABLE)
      008879 0D 05            [ 1]  509 	tnz	(0x05, sp)
      00887B 27 19            [ 1]  510 	jreq	00110$
                                    511 ;	lib/stm8s_clk.c: 436: switch (CLK_IT)
      00887D 0D 01            [ 1]  512 	tnz	(0x01, sp)
      00887F 26 0C            [ 1]  513 	jrne	00102$
      008881 4D               [ 1]  514 	tnz	a
      008882 27 29            [ 1]  515 	jreq	00112$
                                    516 ;	lib/stm8s_clk.c: 439: CLK->SWCR |= CLK_SWCR_SWIEN;
      008884 AE 50 C5         [ 2]  517 	ldw	x, #0x50c5
      008887 F6               [ 1]  518 	ld	a, (x)
      008888 AA 04            [ 1]  519 	or	a, #0x04
      00888A F7               [ 1]  520 	ld	(x), a
                                    521 ;	lib/stm8s_clk.c: 440: break;
      00888B 20 20            [ 2]  522 	jra	00112$
                                    523 ;	lib/stm8s_clk.c: 441: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      00888D                        524 00102$:
                                    525 ;	lib/stm8s_clk.c: 442: CLK->CSSR |= CLK_CSSR_CSSDIE;
      00888D AE 50 C8         [ 2]  526 	ldw	x, #0x50c8
      008890 F6               [ 1]  527 	ld	a, (x)
      008891 AA 04            [ 1]  528 	or	a, #0x04
      008893 F7               [ 1]  529 	ld	(x), a
                                    530 ;	lib/stm8s_clk.c: 443: break;
      008894 20 17            [ 2]  531 	jra	00112$
                                    532 ;	lib/stm8s_clk.c: 446: }
      008896                        533 00110$:
                                    534 ;	lib/stm8s_clk.c: 450: switch (CLK_IT)
      008896 0D 01            [ 1]  535 	tnz	(0x01, sp)
      008898 26 0C            [ 1]  536 	jrne	00106$
      00889A 4D               [ 1]  537 	tnz	a
      00889B 27 10            [ 1]  538 	jreq	00112$
                                    539 ;	lib/stm8s_clk.c: 453: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      00889D AE 50 C5         [ 2]  540 	ldw	x, #0x50c5
      0088A0 F6               [ 1]  541 	ld	a, (x)
      0088A1 A4 FB            [ 1]  542 	and	a, #0xfb
      0088A3 F7               [ 1]  543 	ld	(x), a
                                    544 ;	lib/stm8s_clk.c: 454: break;
      0088A4 20 07            [ 2]  545 	jra	00112$
                                    546 ;	lib/stm8s_clk.c: 455: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      0088A6                        547 00106$:
                                    548 ;	lib/stm8s_clk.c: 456: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      0088A6 AE 50 C8         [ 2]  549 	ldw	x, #0x50c8
      0088A9 F6               [ 1]  550 	ld	a, (x)
      0088AA A4 FB            [ 1]  551 	and	a, #0xfb
      0088AC F7               [ 1]  552 	ld	(x), a
                                    553 ;	lib/stm8s_clk.c: 460: }
      0088AD                        554 00112$:
      0088AD 84               [ 1]  555 	pop	a
      0088AE 81               [ 4]  556 	ret
                                    557 ;	lib/stm8s_clk.c: 469: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    558 ;	-----------------------------------------
                                    559 ;	 function CLK_SYSCLKConfig
                                    560 ;	-----------------------------------------
      0088AF                        561 _CLK_SYSCLKConfig:
      0088AF 89               [ 2]  562 	pushw	x
                                    563 ;	lib/stm8s_clk.c: 472: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      0088B0 0D 05            [ 1]  564 	tnz	(0x05, sp)
      0088B2 2B 19            [ 1]  565 	jrmi	00102$
                                    566 ;	lib/stm8s_clk.c: 474: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0088B4 AE 50 C6         [ 2]  567 	ldw	x, #0x50c6
      0088B7 F6               [ 1]  568 	ld	a, (x)
      0088B8 A4 E7            [ 1]  569 	and	a, #0xe7
      0088BA F7               [ 1]  570 	ld	(x), a
                                    571 ;	lib/stm8s_clk.c: 475: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      0088BB AE 50 C6         [ 2]  572 	ldw	x, #0x50c6
      0088BE F6               [ 1]  573 	ld	a, (x)
      0088BF 6B 01            [ 1]  574 	ld	(0x01, sp), a
      0088C1 7B 05            [ 1]  575 	ld	a, (0x05, sp)
      0088C3 A4 18            [ 1]  576 	and	a, #0x18
      0088C5 1A 01            [ 1]  577 	or	a, (0x01, sp)
      0088C7 AE 50 C6         [ 2]  578 	ldw	x, #0x50c6
      0088CA F7               [ 1]  579 	ld	(x), a
      0088CB 20 17            [ 2]  580 	jra	00104$
      0088CD                        581 00102$:
                                    582 ;	lib/stm8s_clk.c: 479: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      0088CD AE 50 C6         [ 2]  583 	ldw	x, #0x50c6
      0088D0 F6               [ 1]  584 	ld	a, (x)
      0088D1 A4 F8            [ 1]  585 	and	a, #0xf8
      0088D3 F7               [ 1]  586 	ld	(x), a
                                    587 ;	lib/stm8s_clk.c: 480: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      0088D4 AE 50 C6         [ 2]  588 	ldw	x, #0x50c6
      0088D7 F6               [ 1]  589 	ld	a, (x)
      0088D8 6B 02            [ 1]  590 	ld	(0x02, sp), a
      0088DA 7B 05            [ 1]  591 	ld	a, (0x05, sp)
      0088DC A4 07            [ 1]  592 	and	a, #0x07
      0088DE 1A 02            [ 1]  593 	or	a, (0x02, sp)
      0088E0 AE 50 C6         [ 2]  594 	ldw	x, #0x50c6
      0088E3 F7               [ 1]  595 	ld	(x), a
      0088E4                        596 00104$:
      0088E4 85               [ 2]  597 	popw	x
      0088E5 81               [ 4]  598 	ret
                                    599 ;	lib/stm8s_clk.c: 490: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    600 ;	-----------------------------------------
                                    601 ;	 function CLK_SWIMConfig
                                    602 ;	-----------------------------------------
      0088E6                        603 _CLK_SWIMConfig:
                                    604 ;	lib/stm8s_clk.c: 493: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      0088E6 0D 03            [ 1]  605 	tnz	(0x03, sp)
      0088E8 27 05            [ 1]  606 	jreq	00102$
                                    607 ;	lib/stm8s_clk.c: 496: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      0088EA 72 10 50 CD      [ 1]  608 	bset	0x50cd, #0
      0088EE 81               [ 4]  609 	ret
      0088EF                        610 00102$:
                                    611 ;	lib/stm8s_clk.c: 501: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      0088EF 72 11 50 CD      [ 1]  612 	bres	0x50cd, #0
      0088F3 81               [ 4]  613 	ret
                                    614 ;	lib/stm8s_clk.c: 512: void CLK_ClockSecuritySystemEnable(void)
                                    615 ;	-----------------------------------------
                                    616 ;	 function CLK_ClockSecuritySystemEnable
                                    617 ;	-----------------------------------------
      0088F4                        618 _CLK_ClockSecuritySystemEnable:
                                    619 ;	lib/stm8s_clk.c: 515: CLK->CSSR |= CLK_CSSR_CSSEN;
      0088F4 72 10 50 C8      [ 1]  620 	bset	0x50c8, #0
      0088F8 81               [ 4]  621 	ret
                                    622 ;	lib/stm8s_clk.c: 524: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    623 ;	-----------------------------------------
                                    624 ;	 function CLK_GetSYSCLKSource
                                    625 ;	-----------------------------------------
      0088F9                        626 _CLK_GetSYSCLKSource:
                                    627 ;	lib/stm8s_clk.c: 526: return((CLK_Source_TypeDef)CLK->CMSR);
      0088F9 AE 50 C3         [ 2]  628 	ldw	x, #0x50c3
      0088FC F6               [ 1]  629 	ld	a, (x)
      0088FD 81               [ 4]  630 	ret
                                    631 ;	lib/stm8s_clk.c: 534: uint32_t CLK_GetClockFreq(void)
                                    632 ;	-----------------------------------------
                                    633 ;	 function CLK_GetClockFreq
                                    634 ;	-----------------------------------------
      0088FE                        635 _CLK_GetClockFreq:
      0088FE 52 07            [ 2]  636 	sub	sp, #7
                                    637 ;	lib/stm8s_clk.c: 541: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      008900 AE 50 C3         [ 2]  638 	ldw	x, #0x50c3
      008903 F6               [ 1]  639 	ld	a, (x)
      008904 6B 01            [ 1]  640 	ld	(0x01, sp), a
                                    641 ;	lib/stm8s_clk.c: 543: if (clocksource == CLK_SOURCE_HSI)
      008906 7B 01            [ 1]  642 	ld	a, (0x01, sp)
      008908 A1 E1            [ 1]  643 	cp	a, #0xe1
      00890A 26 2C            [ 1]  644 	jrne	00105$
                                    645 ;	lib/stm8s_clk.c: 545: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      00890C AE 50 C6         [ 2]  646 	ldw	x, #0x50c6
      00890F F6               [ 1]  647 	ld	a, (x)
      008910 A4 18            [ 1]  648 	and	a, #0x18
                                    649 ;	lib/stm8s_clk.c: 546: tmp = (uint8_t)(tmp >> 3);
      008912 44               [ 1]  650 	srl	a
      008913 44               [ 1]  651 	srl	a
      008914 44               [ 1]  652 	srl	a
                                    653 ;	lib/stm8s_clk.c: 547: presc = HSIDivFactor[tmp];
      008915 AE 89 EB         [ 2]  654 	ldw	x, #_HSIDivFactor+0
      008918 1F 06            [ 2]  655 	ldw	(0x06, sp), x
      00891A 5F               [ 1]  656 	clrw	x
      00891B 97               [ 1]  657 	ld	xl, a
      00891C 72 FB 06         [ 2]  658 	addw	x, (0x06, sp)
      00891F F6               [ 1]  659 	ld	a, (x)
                                    660 ;	lib/stm8s_clk.c: 548: clockfrequency = HSI_VALUE / presc;
      008920 5F               [ 1]  661 	clrw	x
      008921 97               [ 1]  662 	ld	xl, a
      008922 90 5F            [ 1]  663 	clrw	y
      008924 89               [ 2]  664 	pushw	x
      008925 90 89            [ 2]  665 	pushw	y
      008927 4B 00            [ 1]  666 	push	#0x00
      008929 4B 24            [ 1]  667 	push	#0x24
      00892B 4B F4            [ 1]  668 	push	#0xf4
      00892D 4B 00            [ 1]  669 	push	#0x00
      00892F CD 8B 2B         [ 4]  670 	call	__divulong
      008932 5B 08            [ 2]  671 	addw	sp, #8
      008934 1F 04            [ 2]  672 	ldw	(0x04, sp), x
      008936 20 1A            [ 2]  673 	jra	00106$
      008938                        674 00105$:
                                    675 ;	lib/stm8s_clk.c: 550: else if ( clocksource == CLK_SOURCE_LSI)
      008938 7B 01            [ 1]  676 	ld	a, (0x01, sp)
      00893A A1 D2            [ 1]  677 	cp	a, #0xd2
      00893C 26 0B            [ 1]  678 	jrne	00102$
                                    679 ;	lib/stm8s_clk.c: 552: clockfrequency = LSI_VALUE;
      00893E AE F4 00         [ 2]  680 	ldw	x, #0xf400
      008941 1F 04            [ 2]  681 	ldw	(0x04, sp), x
      008943 90 AE 00 01      [ 2]  682 	ldw	y, #0x0001
      008947 20 09            [ 2]  683 	jra	00106$
      008949                        684 00102$:
                                    685 ;	lib/stm8s_clk.c: 556: clockfrequency = HSE_VALUE;
      008949 AE 24 00         [ 2]  686 	ldw	x, #0x2400
      00894C 1F 04            [ 2]  687 	ldw	(0x04, sp), x
      00894E 90 AE 00 F4      [ 2]  688 	ldw	y, #0x00f4
      008952                        689 00106$:
                                    690 ;	lib/stm8s_clk.c: 559: return((uint32_t)clockfrequency);
      008952 1E 04            [ 2]  691 	ldw	x, (0x04, sp)
      008954 5B 07            [ 2]  692 	addw	sp, #7
      008956 81               [ 4]  693 	ret
                                    694 ;	lib/stm8s_clk.c: 569: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    695 ;	-----------------------------------------
                                    696 ;	 function CLK_AdjustHSICalibrationValue
                                    697 ;	-----------------------------------------
      008957                        698 _CLK_AdjustHSICalibrationValue:
                                    699 ;	lib/stm8s_clk.c: 573: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      008957 AE 50 CC         [ 2]  700 	ldw	x, #0x50cc
      00895A F6               [ 1]  701 	ld	a, (x)
      00895B A4 F8            [ 1]  702 	and	a, #0xf8
      00895D 1A 03            [ 1]  703 	or	a, (0x03, sp)
      00895F AE 50 CC         [ 2]  704 	ldw	x, #0x50cc
      008962 F7               [ 1]  705 	ld	(x), a
      008963 81               [ 4]  706 	ret
                                    707 ;	lib/stm8s_clk.c: 585: void CLK_SYSCLKEmergencyClear(void)
                                    708 ;	-----------------------------------------
                                    709 ;	 function CLK_SYSCLKEmergencyClear
                                    710 ;	-----------------------------------------
      008964                        711 _CLK_SYSCLKEmergencyClear:
                                    712 ;	lib/stm8s_clk.c: 587: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      008964 72 11 50 C5      [ 1]  713 	bres	0x50c5, #0
      008968 81               [ 4]  714 	ret
                                    715 ;	lib/stm8s_clk.c: 597: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    716 ;	-----------------------------------------
                                    717 ;	 function CLK_GetFlagStatus
                                    718 ;	-----------------------------------------
      008969                        719 _CLK_GetFlagStatus:
      008969 88               [ 1]  720 	push	a
                                    721 ;	lib/stm8s_clk.c: 604: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      00896A 4F               [ 1]  722 	clr	a
      00896B 97               [ 1]  723 	ld	xl, a
      00896C 7B 04            [ 1]  724 	ld	a, (0x04, sp)
      00896E 95               [ 1]  725 	ld	xh, a
                                    726 ;	lib/stm8s_clk.c: 607: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      00896F A3 01 00         [ 2]  727 	cpw	x, #0x0100
      008972 26 06            [ 1]  728 	jrne	00111$
                                    729 ;	lib/stm8s_clk.c: 609: tmpreg = CLK->ICKR;
      008974 AE 50 C0         [ 2]  730 	ldw	x, #0x50c0
      008977 F6               [ 1]  731 	ld	a, (x)
      008978 20 25            [ 2]  732 	jra	00112$
      00897A                        733 00111$:
                                    734 ;	lib/stm8s_clk.c: 611: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      00897A A3 02 00         [ 2]  735 	cpw	x, #0x0200
      00897D 26 06            [ 1]  736 	jrne	00108$
                                    737 ;	lib/stm8s_clk.c: 613: tmpreg = CLK->ECKR;
      00897F AE 50 C1         [ 2]  738 	ldw	x, #0x50c1
      008982 F6               [ 1]  739 	ld	a, (x)
      008983 20 1A            [ 2]  740 	jra	00112$
      008985                        741 00108$:
                                    742 ;	lib/stm8s_clk.c: 615: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      008985 A3 03 00         [ 2]  743 	cpw	x, #0x0300
      008988 26 06            [ 1]  744 	jrne	00105$
                                    745 ;	lib/stm8s_clk.c: 617: tmpreg = CLK->SWCR;
      00898A AE 50 C5         [ 2]  746 	ldw	x, #0x50c5
      00898D F6               [ 1]  747 	ld	a, (x)
      00898E 20 0F            [ 2]  748 	jra	00112$
      008990                        749 00105$:
                                    750 ;	lib/stm8s_clk.c: 619: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      008990 A3 04 00         [ 2]  751 	cpw	x, #0x0400
      008993 26 06            [ 1]  752 	jrne	00102$
                                    753 ;	lib/stm8s_clk.c: 621: tmpreg = CLK->CSSR;
      008995 AE 50 C8         [ 2]  754 	ldw	x, #0x50c8
      008998 F6               [ 1]  755 	ld	a, (x)
      008999 20 04            [ 2]  756 	jra	00112$
      00899B                        757 00102$:
                                    758 ;	lib/stm8s_clk.c: 625: tmpreg = CLK->CCOR;
      00899B AE 50 C9         [ 2]  759 	ldw	x, #0x50c9
      00899E F6               [ 1]  760 	ld	a, (x)
      00899F                        761 00112$:
                                    762 ;	lib/stm8s_clk.c: 628: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      00899F 88               [ 1]  763 	push	a
      0089A0 7B 06            [ 1]  764 	ld	a, (0x06, sp)
      0089A2 6B 02            [ 1]  765 	ld	(0x02, sp), a
      0089A4 84               [ 1]  766 	pop	a
      0089A5 14 01            [ 1]  767 	and	a, (0x01, sp)
      0089A7 4D               [ 1]  768 	tnz	a
      0089A8 27 03            [ 1]  769 	jreq	00114$
                                    770 ;	lib/stm8s_clk.c: 630: bitstatus = SET;
      0089AA A6 01            [ 1]  771 	ld	a, #0x01
                                    772 ;	lib/stm8s_clk.c: 634: bitstatus = RESET;
      0089AC 21                     773 	.byte 0x21
      0089AD                        774 00114$:
      0089AD 4F               [ 1]  775 	clr	a
      0089AE                        776 00115$:
                                    777 ;	lib/stm8s_clk.c: 638: return((FlagStatus)bitstatus);
      0089AE 5B 01            [ 2]  778 	addw	sp, #1
      0089B0 81               [ 4]  779 	ret
                                    780 ;	lib/stm8s_clk.c: 647: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    781 ;	-----------------------------------------
                                    782 ;	 function CLK_GetITStatus
                                    783 ;	-----------------------------------------
      0089B1                        784 _CLK_GetITStatus:
                                    785 ;	lib/stm8s_clk.c: 651: if (CLK_IT == CLK_IT_SWIF)
      0089B1 7B 03            [ 1]  786 	ld	a, (0x03, sp)
      0089B3 A1 1C            [ 1]  787 	cp	a, #0x1c
      0089B5 26 0F            [ 1]  788 	jrne	00108$
                                    789 ;	lib/stm8s_clk.c: 654: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      0089B7 AE 50 C5         [ 2]  790 	ldw	x, #0x50c5
      0089BA F6               [ 1]  791 	ld	a, (x)
      0089BB 14 03            [ 1]  792 	and	a, (0x03, sp)
      0089BD A1 0C            [ 1]  793 	cp	a, #0x0c
      0089BF 26 03            [ 1]  794 	jrne	00102$
                                    795 ;	lib/stm8s_clk.c: 656: bitstatus = SET;
      0089C1 A6 01            [ 1]  796 	ld	a, #0x01
      0089C3 81               [ 4]  797 	ret
      0089C4                        798 00102$:
                                    799 ;	lib/stm8s_clk.c: 660: bitstatus = RESET;
      0089C4 4F               [ 1]  800 	clr	a
      0089C5 81               [ 4]  801 	ret
      0089C6                        802 00108$:
                                    803 ;	lib/stm8s_clk.c: 666: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      0089C6 AE 50 C8         [ 2]  804 	ldw	x, #0x50c8
      0089C9 F6               [ 1]  805 	ld	a, (x)
      0089CA 14 03            [ 1]  806 	and	a, (0x03, sp)
      0089CC A1 0C            [ 1]  807 	cp	a, #0x0c
      0089CE 26 03            [ 1]  808 	jrne	00105$
                                    809 ;	lib/stm8s_clk.c: 668: bitstatus = SET;
      0089D0 A6 01            [ 1]  810 	ld	a, #0x01
      0089D2 81               [ 4]  811 	ret
      0089D3                        812 00105$:
                                    813 ;	lib/stm8s_clk.c: 672: bitstatus = RESET;
      0089D3 4F               [ 1]  814 	clr	a
                                    815 ;	lib/stm8s_clk.c: 677: return bitstatus;
      0089D4 81               [ 4]  816 	ret
                                    817 ;	lib/stm8s_clk.c: 686: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    818 ;	-----------------------------------------
                                    819 ;	 function CLK_ClearITPendingBit
                                    820 ;	-----------------------------------------
      0089D5                        821 _CLK_ClearITPendingBit:
                                    822 ;	lib/stm8s_clk.c: 689: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      0089D5 7B 03            [ 1]  823 	ld	a, (0x03, sp)
      0089D7 A1 0C            [ 1]  824 	cp	a, #0x0c
      0089D9 26 08            [ 1]  825 	jrne	00102$
                                    826 ;	lib/stm8s_clk.c: 692: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      0089DB AE 50 C8         [ 2]  827 	ldw	x, #0x50c8
      0089DE F6               [ 1]  828 	ld	a, (x)
      0089DF A4 F7            [ 1]  829 	and	a, #0xf7
      0089E1 F7               [ 1]  830 	ld	(x), a
      0089E2 81               [ 4]  831 	ret
      0089E3                        832 00102$:
                                    833 ;	lib/stm8s_clk.c: 697: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      0089E3 AE 50 C5         [ 2]  834 	ldw	x, #0x50c5
      0089E6 F6               [ 1]  835 	ld	a, (x)
      0089E7 A4 F7            [ 1]  836 	and	a, #0xf7
      0089E9 F7               [ 1]  837 	ld	(x), a
      0089EA 81               [ 4]  838 	ret
                                    839 	.area CODE
      0089EB                        840 _HSIDivFactor:
      0089EB 01                     841 	.db #0x01	; 1
      0089EC 02                     842 	.db #0x02	; 2
      0089ED 04                     843 	.db #0x04	; 4
      0089EE 08                     844 	.db #0x08	; 8
      0089EF                        845 _CLKPrescTable:
      0089EF 01                     846 	.db #0x01	; 1
      0089F0 02                     847 	.db #0x02	; 2
      0089F1 04                     848 	.db #0x04	; 4
      0089F2 08                     849 	.db #0x08	; 8
      0089F3 0A                     850 	.db #0x0a	; 10
      0089F4 10                     851 	.db #0x10	; 16
      0089F5 14                     852 	.db #0x14	; 20
      0089F6 28                     853 	.db #0x28	; 40
                                    854 	.area INITIALIZER
                                    855 	.area CABS (ABS)
