                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_gpio
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _GPIO_Init
                                     12 	.globl _GPIO_Write
                                     13 	.globl _GPIO_WriteHigh
                                     14 	.globl _GPIO_WriteLow
                                     15 	.globl _GPIO_WriteReverse
                                     16 	.globl _GPIO_ReadOutputData
                                     17 	.globl _GPIO_ReadInputData
                                     18 	.globl _GPIO_ReadInputPin
                                     19 	.globl _GPIO_ExternalPullUpConfig
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area DATA
                                     24 ;--------------------------------------------------------
                                     25 ; ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area INITIALIZED
                                     28 ;--------------------------------------------------------
                                     29 ; absolute external ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area DABS (ABS)
                                     32 ;--------------------------------------------------------
                                     33 ; global & static initialisations
                                     34 ;--------------------------------------------------------
                                     35 	.area HOME
                                     36 	.area GSINIT
                                     37 	.area GSFINAL
                                     38 	.area GSINIT
                                     39 ;--------------------------------------------------------
                                     40 ; Home
                                     41 ;--------------------------------------------------------
                                     42 	.area HOME
                                     43 	.area HOME
                                     44 ;--------------------------------------------------------
                                     45 ; code
                                     46 ;--------------------------------------------------------
                                     47 	.area CODE
                                     48 ;	lib/stm8s_gpio.c: 13: void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
                                     49 ;	-----------------------------------------
                                     50 ;	 function GPIO_Init
                                     51 ;	-----------------------------------------
      0089C8                         52 _GPIO_Init:
      0089C8 52 07            [ 2]   53 	sub	sp, #7
                                     54 ;	lib/stm8s_gpio.c: 16: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      0089CA 16 0A            [ 2]   55 	ldw	y, (0x0a, sp)
      0089CC 17 06            [ 2]   56 	ldw	(0x06, sp), y
      0089CE 1E 06            [ 2]   57 	ldw	x, (0x06, sp)
      0089D0 7F               [ 1]   58 	clr	(x)
                                     59 ;	lib/stm8s_gpio.c: 17: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      0089D1 1E 06            [ 2]   60 	ldw	x, (0x06, sp)
      0089D3 5C               [ 2]   61 	incw	x
      0089D4 5C               [ 2]   62 	incw	x
      0089D5 1F 04            [ 2]   63 	ldw	(0x04, sp), x
      0089D7 1E 04            [ 2]   64 	ldw	x, (0x04, sp)
      0089D9 7F               [ 1]   65 	clr	(x)
                                     66 ;	lib/stm8s_gpio.c: 18: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      0089DA 1E 06            [ 2]   67 	ldw	x, (0x06, sp)
      0089DC 1C 00 03         [ 2]   68 	addw	x, #0x0003
      0089DF 1F 02            [ 2]   69 	ldw	(0x02, sp), x
      0089E1 1E 02            [ 2]   70 	ldw	x, (0x02, sp)
      0089E3 7F               [ 1]   71 	clr	(x)
                                     72 ;	lib/stm8s_gpio.c: 19: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      0089E4 16 06            [ 2]   73 	ldw	y, (0x06, sp)
      0089E6 72 A9 00 04      [ 2]   74 	addw	y, #0x0004
      0089EA 90 7F            [ 1]   75 	clr	(y)
                                     76 ;	lib/stm8s_gpio.c: 22: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin)); /* Reset corresponding bit to GPIO_Pin in CR2 register */
      0089EC 90 F6            [ 1]   77 	ld	a, (y)
      0089EE 88               [ 1]   78 	push	a
      0089EF 7B 0D            [ 1]   79 	ld	a, (0x0d, sp)
      0089F1 43               [ 1]   80 	cpl	a
      0089F2 6B 02            [ 1]   81 	ld	(0x02, sp), a
      0089F4 84               [ 1]   82 	pop	a
      0089F5 14 01            [ 1]   83 	and	a, (0x01, sp)
      0089F7 90 F7            [ 1]   84 	ld	(y), a
                                     85 ;	lib/stm8s_gpio.c: 27: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
      0089F9 0D 0D            [ 1]   86 	tnz	(0x0d, sp)
      0089FB 2A 22            [ 1]   87 	jrpl	00105$
                                     88 ;	lib/stm8s_gpio.c: 29: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
      0089FD 7B 0D            [ 1]   89 	ld	a, (0x0d, sp)
      0089FF A5 10            [ 1]   90 	bcp	a, #0x10
      008A01 27 0A            [ 1]   91 	jreq	00102$
                                     92 ;	lib/stm8s_gpio.c: 31: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      008A03 1E 06            [ 2]   93 	ldw	x, (0x06, sp)
      008A05 F6               [ 1]   94 	ld	a, (x)
      008A06 1A 0C            [ 1]   95 	or	a, (0x0c, sp)
      008A08 1E 06            [ 2]   96 	ldw	x, (0x06, sp)
      008A0A F7               [ 1]   97 	ld	(x), a
      008A0B 20 08            [ 2]   98 	jra	00103$
      008A0D                         99 00102$:
                                    100 ;	lib/stm8s_gpio.c: 35: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
      008A0D 1E 06            [ 2]  101 	ldw	x, (0x06, sp)
      008A0F F6               [ 1]  102 	ld	a, (x)
      008A10 14 01            [ 1]  103 	and	a, (0x01, sp)
      008A12 1E 06            [ 2]  104 	ldw	x, (0x06, sp)
      008A14 F7               [ 1]  105 	ld	(x), a
      008A15                        106 00103$:
                                    107 ;	lib/stm8s_gpio.c: 38: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      008A15 1E 04            [ 2]  108 	ldw	x, (0x04, sp)
      008A17 F6               [ 1]  109 	ld	a, (x)
      008A18 1A 0C            [ 1]  110 	or	a, (0x0c, sp)
      008A1A 1E 04            [ 2]  111 	ldw	x, (0x04, sp)
      008A1C F7               [ 1]  112 	ld	(x), a
      008A1D 20 08            [ 2]  113 	jra	00106$
      008A1F                        114 00105$:
                                    115 ;	lib/stm8s_gpio.c: 43: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
      008A1F 1E 04            [ 2]  116 	ldw	x, (0x04, sp)
      008A21 F6               [ 1]  117 	ld	a, (x)
      008A22 14 01            [ 1]  118 	and	a, (0x01, sp)
      008A24 1E 04            [ 2]  119 	ldw	x, (0x04, sp)
      008A26 F7               [ 1]  120 	ld	(x), a
      008A27                        121 00106$:
                                    122 ;	lib/stm8s_gpio.c: 48: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
      008A27 7B 0D            [ 1]  123 	ld	a, (0x0d, sp)
      008A29 A5 40            [ 1]  124 	bcp	a, #0x40
      008A2B 27 0A            [ 1]  125 	jreq	00108$
                                    126 ;	lib/stm8s_gpio.c: 50: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008A2D 1E 02            [ 2]  127 	ldw	x, (0x02, sp)
      008A2F F6               [ 1]  128 	ld	a, (x)
      008A30 1A 0C            [ 1]  129 	or	a, (0x0c, sp)
      008A32 1E 02            [ 2]  130 	ldw	x, (0x02, sp)
      008A34 F7               [ 1]  131 	ld	(x), a
      008A35 20 08            [ 2]  132 	jra	00109$
      008A37                        133 00108$:
                                    134 ;	lib/stm8s_gpio.c: 54: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      008A37 1E 02            [ 2]  135 	ldw	x, (0x02, sp)
      008A39 F6               [ 1]  136 	ld	a, (x)
      008A3A 14 01            [ 1]  137 	and	a, (0x01, sp)
      008A3C 1E 02            [ 2]  138 	ldw	x, (0x02, sp)
      008A3E F7               [ 1]  139 	ld	(x), a
      008A3F                        140 00109$:
                                    141 ;	lib/stm8s_gpio.c: 59: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
      008A3F 7B 0D            [ 1]  142 	ld	a, (0x0d, sp)
      008A41 A5 20            [ 1]  143 	bcp	a, #0x20
      008A43 27 08            [ 1]  144 	jreq	00111$
                                    145 ;	lib/stm8s_gpio.c: 61: GPIOx->CR2 |= (uint8_t)GPIO_Pin;
      008A45 90 F6            [ 1]  146 	ld	a, (y)
      008A47 1A 0C            [ 1]  147 	or	a, (0x0c, sp)
      008A49 90 F7            [ 1]  148 	ld	(y), a
      008A4B 20 06            [ 2]  149 	jra	00113$
      008A4D                        150 00111$:
                                    151 ;	lib/stm8s_gpio.c: 65: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      008A4D 90 F6            [ 1]  152 	ld	a, (y)
      008A4F 14 01            [ 1]  153 	and	a, (0x01, sp)
      008A51 90 F7            [ 1]  154 	ld	(y), a
      008A53                        155 00113$:
      008A53 5B 07            [ 2]  156 	addw	sp, #7
      008A55 81               [ 4]  157 	ret
                                    158 ;	lib/stm8s_gpio.c: 69: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
                                    159 ;	-----------------------------------------
                                    160 ;	 function GPIO_Write
                                    161 ;	-----------------------------------------
      008A56                        162 _GPIO_Write:
                                    163 ;	lib/stm8s_gpio.c: 71: GPIOx->ODR = PortVal;
      008A56 1E 03            [ 2]  164 	ldw	x, (0x03, sp)
      008A58 7B 05            [ 1]  165 	ld	a, (0x05, sp)
      008A5A F7               [ 1]  166 	ld	(x), a
      008A5B 81               [ 4]  167 	ret
                                    168 ;	lib/stm8s_gpio.c: 74: void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    169 ;	-----------------------------------------
                                    170 ;	 function GPIO_WriteHigh
                                    171 ;	-----------------------------------------
      008A5C                        172 _GPIO_WriteHigh:
                                    173 ;	lib/stm8s_gpio.c: 76: GPIOx->ODR |= (uint8_t)PortPins;
      008A5C 1E 03            [ 2]  174 	ldw	x, (0x03, sp)
      008A5E F6               [ 1]  175 	ld	a, (x)
      008A5F 1A 05            [ 1]  176 	or	a, (0x05, sp)
      008A61 F7               [ 1]  177 	ld	(x), a
      008A62 81               [ 4]  178 	ret
                                    179 ;	lib/stm8s_gpio.c: 79: void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    180 ;	-----------------------------------------
                                    181 ;	 function GPIO_WriteLow
                                    182 ;	-----------------------------------------
      008A63                        183 _GPIO_WriteLow:
      008A63 88               [ 1]  184 	push	a
                                    185 ;	lib/stm8s_gpio.c: 81: GPIOx->ODR &= (uint8_t)(~PortPins);
      008A64 1E 04            [ 2]  186 	ldw	x, (0x04, sp)
      008A66 F6               [ 1]  187 	ld	a, (x)
      008A67 6B 01            [ 1]  188 	ld	(0x01, sp), a
      008A69 7B 06            [ 1]  189 	ld	a, (0x06, sp)
      008A6B 43               [ 1]  190 	cpl	a
      008A6C 14 01            [ 1]  191 	and	a, (0x01, sp)
      008A6E F7               [ 1]  192 	ld	(x), a
      008A6F 84               [ 1]  193 	pop	a
      008A70 81               [ 4]  194 	ret
                                    195 ;	lib/stm8s_gpio.c: 84: void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    196 ;	-----------------------------------------
                                    197 ;	 function GPIO_WriteReverse
                                    198 ;	-----------------------------------------
      008A71                        199 _GPIO_WriteReverse:
                                    200 ;	lib/stm8s_gpio.c: 86: GPIOx->ODR ^= (uint8_t)PortPins;
      008A71 1E 03            [ 2]  201 	ldw	x, (0x03, sp)
      008A73 F6               [ 1]  202 	ld	a, (x)
      008A74 18 05            [ 1]  203 	xor	a, (0x05, sp)
      008A76 F7               [ 1]  204 	ld	(x), a
      008A77 81               [ 4]  205 	ret
                                    206 ;	lib/stm8s_gpio.c: 89: uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
                                    207 ;	-----------------------------------------
                                    208 ;	 function GPIO_ReadOutputData
                                    209 ;	-----------------------------------------
      008A78                        210 _GPIO_ReadOutputData:
                                    211 ;	lib/stm8s_gpio.c: 91: return ((uint8_t)GPIOx->ODR);
      008A78 1E 03            [ 2]  212 	ldw	x, (0x03, sp)
      008A7A F6               [ 1]  213 	ld	a, (x)
      008A7B 81               [ 4]  214 	ret
                                    215 ;	lib/stm8s_gpio.c: 94: uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
                                    216 ;	-----------------------------------------
                                    217 ;	 function GPIO_ReadInputData
                                    218 ;	-----------------------------------------
      008A7C                        219 _GPIO_ReadInputData:
                                    220 ;	lib/stm8s_gpio.c: 96: return ((uint8_t)GPIOx->IDR);
      008A7C 1E 03            [ 2]  221 	ldw	x, (0x03, sp)
      008A7E E6 01            [ 1]  222 	ld	a, (0x1, x)
      008A80 81               [ 4]  223 	ret
                                    224 ;	lib/stm8s_gpio.c: 99: BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    225 ;	-----------------------------------------
                                    226 ;	 function GPIO_ReadInputPin
                                    227 ;	-----------------------------------------
      008A81                        228 _GPIO_ReadInputPin:
                                    229 ;	lib/stm8s_gpio.c: 101: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
      008A81 1E 03            [ 2]  230 	ldw	x, (0x03, sp)
      008A83 E6 01            [ 1]  231 	ld	a, (0x1, x)
      008A85 14 05            [ 1]  232 	and	a, (0x05, sp)
      008A87 81               [ 4]  233 	ret
                                    234 ;	lib/stm8s_gpio.c: 104: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
                                    235 ;	-----------------------------------------
                                    236 ;	 function GPIO_ExternalPullUpConfig
                                    237 ;	-----------------------------------------
      008A88                        238 _GPIO_ExternalPullUpConfig:
      008A88 88               [ 1]  239 	push	a
                                    240 ;	lib/stm8s_gpio.c: 108: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008A89 1E 04            [ 2]  241 	ldw	x, (0x04, sp)
      008A8B 1C 00 03         [ 2]  242 	addw	x, #0x0003
                                    243 ;	lib/stm8s_gpio.c: 106: if (NewState != DISABLE) /* External Pull-Up Set*/
      008A8E 0D 07            [ 1]  244 	tnz	(0x07, sp)
      008A90 27 06            [ 1]  245 	jreq	00102$
                                    246 ;	lib/stm8s_gpio.c: 108: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008A92 F6               [ 1]  247 	ld	a, (x)
      008A93 1A 06            [ 1]  248 	or	a, (0x06, sp)
      008A95 F7               [ 1]  249 	ld	(x), a
      008A96 20 09            [ 2]  250 	jra	00104$
      008A98                        251 00102$:
                                    252 ;	lib/stm8s_gpio.c: 111: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      008A98 F6               [ 1]  253 	ld	a, (x)
      008A99 6B 01            [ 1]  254 	ld	(0x01, sp), a
      008A9B 7B 06            [ 1]  255 	ld	a, (0x06, sp)
      008A9D 43               [ 1]  256 	cpl	a
      008A9E 14 01            [ 1]  257 	and	a, (0x01, sp)
      008AA0 F7               [ 1]  258 	ld	(x), a
      008AA1                        259 00104$:
      008AA1 84               [ 1]  260 	pop	a
      008AA2 81               [ 4]  261 	ret
                                    262 	.area CODE
                                    263 	.area INITIALIZER
                                    264 	.area CABS (ABS)
