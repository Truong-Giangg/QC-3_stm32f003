                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_gpio
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _GPIO_DeInit
                                     12 	.globl _GPIO_Init
                                     13 	.globl _GPIO_Write
                                     14 	.globl _GPIO_WriteHigh
                                     15 	.globl _GPIO_WriteLow
                                     16 	.globl _GPIO_WriteReverse
                                     17 	.globl _GPIO_ReadOutputData
                                     18 	.globl _GPIO_ReadInputData
                                     19 	.globl _GPIO_ReadInputPin
                                     20 	.globl _GPIO_ExternalPullUpConfig
                                     21 ;--------------------------------------------------------
                                     22 ; ram data
                                     23 ;--------------------------------------------------------
                                     24 	.area DATA
                                     25 ;--------------------------------------------------------
                                     26 ; ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area INITIALIZED
                                     29 ;--------------------------------------------------------
                                     30 ; absolute external ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DABS (ABS)
                                     33 
                                     34 ; default segment ordering for linker
                                     35 	.area HOME
                                     36 	.area GSINIT
                                     37 	.area GSFINAL
                                     38 	.area CONST
                                     39 	.area INITIALIZER
                                     40 	.area CODE
                                     41 
                                     42 ;--------------------------------------------------------
                                     43 ; global & static initialisations
                                     44 ;--------------------------------------------------------
                                     45 	.area HOME
                                     46 	.area GSINIT
                                     47 	.area GSFINAL
                                     48 	.area GSINIT
                                     49 ;--------------------------------------------------------
                                     50 ; Home
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
                                     53 	.area HOME
                                     54 ;--------------------------------------------------------
                                     55 ; code
                                     56 ;--------------------------------------------------------
                                     57 	.area CODE
                                     58 ;	lib/src/stm8s_gpio.c: 53: void GPIO_DeInit(GPIO_TypeDef* GPIOx)
                                     59 ;	-----------------------------------------
                                     60 ;	 function GPIO_DeInit
                                     61 ;	-----------------------------------------
      0085A1                         62 _GPIO_DeInit:
                                     63 ;	lib/src/stm8s_gpio.c: 55: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      0085A1 16 03            [ 2]   64 	ldw	y, (0x03, sp)
      0085A3 90 7F            [ 1]   65 	clr	(y)
                                     66 ;	lib/src/stm8s_gpio.c: 56: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      0085A5 93               [ 1]   67 	ldw	x, y
      0085A6 5C               [ 1]   68 	incw	x
      0085A7 5C               [ 1]   69 	incw	x
      0085A8 7F               [ 1]   70 	clr	(x)
                                     71 ;	lib/src/stm8s_gpio.c: 57: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      0085A9 93               [ 1]   72 	ldw	x, y
      0085AA 6F 03            [ 1]   73 	clr	(0x0003, x)
                                     74 ;	lib/src/stm8s_gpio.c: 58: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      0085AC 93               [ 1]   75 	ldw	x, y
      0085AD 6F 04            [ 1]   76 	clr	(0x0004, x)
                                     77 ;	lib/src/stm8s_gpio.c: 59: }
      0085AF 81               [ 4]   78 	ret
                                     79 ;	lib/src/stm8s_gpio.c: 71: void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
                                     80 ;	-----------------------------------------
                                     81 ;	 function GPIO_Init
                                     82 ;	-----------------------------------------
      0085B0                         83 _GPIO_Init:
      0085B0 52 05            [ 2]   84 	sub	sp, #5
                                     85 ;	lib/src/stm8s_gpio.c: 81: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      0085B2 16 08            [ 2]   86 	ldw	y, (0x08, sp)
      0085B4 93               [ 1]   87 	ldw	x, y
      0085B5 1C 00 04         [ 2]   88 	addw	x, #0x0004
      0085B8 1F 01            [ 2]   89 	ldw	(0x01, sp), x
      0085BA F6               [ 1]   90 	ld	a, (x)
      0085BB 88               [ 1]   91 	push	a
      0085BC 7B 0B            [ 1]   92 	ld	a, (0x0b, sp)
      0085BE 43               [ 1]   93 	cpl	a
      0085BF 6B 04            [ 1]   94 	ld	(0x04, sp), a
      0085C1 84               [ 1]   95 	pop	a
      0085C2 14 03            [ 1]   96 	and	a, (0x03, sp)
      0085C4 1E 01            [ 2]   97 	ldw	x, (0x01, sp)
      0085C6 F7               [ 1]   98 	ld	(x), a
                                     99 ;	lib/src/stm8s_gpio.c: 98: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      0085C7 93               [ 1]  100 	ldw	x, y
      0085C8 5C               [ 1]  101 	incw	x
      0085C9 5C               [ 1]  102 	incw	x
      0085CA 1F 04            [ 2]  103 	ldw	(0x04, sp), x
                                    104 ;	lib/src/stm8s_gpio.c: 87: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
      0085CC 0D 0B            [ 1]  105 	tnz	(0x0b, sp)
      0085CE 2A 1E            [ 1]  106 	jrpl	00105$
                                    107 ;	lib/src/stm8s_gpio.c: 91: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      0085D0 90 F6            [ 1]  108 	ld	a, (y)
                                    109 ;	lib/src/stm8s_gpio.c: 89: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
      0085D2 88               [ 1]  110 	push	a
      0085D3 7B 0C            [ 1]  111 	ld	a, (0x0c, sp)
      0085D5 A5 10            [ 1]  112 	bcp	a, #0x10
      0085D7 84               [ 1]  113 	pop	a
      0085D8 27 06            [ 1]  114 	jreq	00102$
                                    115 ;	lib/src/stm8s_gpio.c: 91: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      0085DA 1A 0A            [ 1]  116 	or	a, (0x0a, sp)
      0085DC 90 F7            [ 1]  117 	ld	(y), a
      0085DE 20 04            [ 2]  118 	jra	00103$
      0085E0                        119 00102$:
                                    120 ;	lib/src/stm8s_gpio.c: 95: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
      0085E0 14 03            [ 1]  121 	and	a, (0x03, sp)
      0085E2 90 F7            [ 1]  122 	ld	(y), a
      0085E4                        123 00103$:
                                    124 ;	lib/src/stm8s_gpio.c: 98: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      0085E4 1E 04            [ 2]  125 	ldw	x, (0x04, sp)
      0085E6 F6               [ 1]  126 	ld	a, (x)
      0085E7 1A 0A            [ 1]  127 	or	a, (0x0a, sp)
      0085E9 1E 04            [ 2]  128 	ldw	x, (0x04, sp)
      0085EB F7               [ 1]  129 	ld	(x), a
      0085EC 20 08            [ 2]  130 	jra	00106$
      0085EE                        131 00105$:
                                    132 ;	lib/src/stm8s_gpio.c: 103: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
      0085EE 1E 04            [ 2]  133 	ldw	x, (0x04, sp)
      0085F0 F6               [ 1]  134 	ld	a, (x)
      0085F1 14 03            [ 1]  135 	and	a, (0x03, sp)
      0085F3 1E 04            [ 2]  136 	ldw	x, (0x04, sp)
      0085F5 F7               [ 1]  137 	ld	(x), a
      0085F6                        138 00106$:
                                    139 ;	lib/src/stm8s_gpio.c: 112: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      0085F6 93               [ 1]  140 	ldw	x, y
      0085F7 1C 00 03         [ 2]  141 	addw	x, #0x0003
      0085FA F6               [ 1]  142 	ld	a, (x)
                                    143 ;	lib/src/stm8s_gpio.c: 110: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
      0085FB 88               [ 1]  144 	push	a
      0085FC 7B 0C            [ 1]  145 	ld	a, (0x0c, sp)
      0085FE A5 40            [ 1]  146 	bcp	a, #0x40
      008600 84               [ 1]  147 	pop	a
      008601 27 05            [ 1]  148 	jreq	00108$
                                    149 ;	lib/src/stm8s_gpio.c: 112: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008603 1A 0A            [ 1]  150 	or	a, (0x0a, sp)
      008605 F7               [ 1]  151 	ld	(x), a
      008606 20 03            [ 2]  152 	jra	00109$
      008608                        153 00108$:
                                    154 ;	lib/src/stm8s_gpio.c: 116: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      008608 14 03            [ 1]  155 	and	a, (0x03, sp)
      00860A F7               [ 1]  156 	ld	(x), a
      00860B                        157 00109$:
                                    158 ;	lib/src/stm8s_gpio.c: 81: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      00860B 1E 01            [ 2]  159 	ldw	x, (0x01, sp)
      00860D F6               [ 1]  160 	ld	a, (x)
                                    161 ;	lib/src/stm8s_gpio.c: 123: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
      00860E 88               [ 1]  162 	push	a
      00860F 7B 0C            [ 1]  163 	ld	a, (0x0c, sp)
      008611 A5 20            [ 1]  164 	bcp	a, #0x20
      008613 84               [ 1]  165 	pop	a
      008614 27 07            [ 1]  166 	jreq	00111$
                                    167 ;	lib/src/stm8s_gpio.c: 125: GPIOx->CR2 |= (uint8_t)GPIO_Pin;
      008616 1A 0A            [ 1]  168 	or	a, (0x0a, sp)
      008618 1E 01            [ 2]  169 	ldw	x, (0x01, sp)
      00861A F7               [ 1]  170 	ld	(x), a
      00861B 20 05            [ 2]  171 	jra	00113$
      00861D                        172 00111$:
                                    173 ;	lib/src/stm8s_gpio.c: 129: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      00861D 14 03            [ 1]  174 	and	a, (0x03, sp)
      00861F 1E 01            [ 2]  175 	ldw	x, (0x01, sp)
      008621 F7               [ 1]  176 	ld	(x), a
      008622                        177 00113$:
                                    178 ;	lib/src/stm8s_gpio.c: 131: }
      008622 5B 05            [ 2]  179 	addw	sp, #5
      008624 81               [ 4]  180 	ret
                                    181 ;	lib/src/stm8s_gpio.c: 141: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
                                    182 ;	-----------------------------------------
                                    183 ;	 function GPIO_Write
                                    184 ;	-----------------------------------------
      008625                        185 _GPIO_Write:
                                    186 ;	lib/src/stm8s_gpio.c: 143: GPIOx->ODR = PortVal;
      008625 1E 03            [ 2]  187 	ldw	x, (0x03, sp)
      008627 7B 05            [ 1]  188 	ld	a, (0x05, sp)
      008629 F7               [ 1]  189 	ld	(x), a
                                    190 ;	lib/src/stm8s_gpio.c: 144: }
      00862A 81               [ 4]  191 	ret
                                    192 ;	lib/src/stm8s_gpio.c: 154: void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    193 ;	-----------------------------------------
                                    194 ;	 function GPIO_WriteHigh
                                    195 ;	-----------------------------------------
      00862B                        196 _GPIO_WriteHigh:
                                    197 ;	lib/src/stm8s_gpio.c: 156: GPIOx->ODR |= (uint8_t)PortPins;
      00862B 1E 03            [ 2]  198 	ldw	x, (0x03, sp)
      00862D F6               [ 1]  199 	ld	a, (x)
      00862E 1A 05            [ 1]  200 	or	a, (0x05, sp)
      008630 F7               [ 1]  201 	ld	(x), a
                                    202 ;	lib/src/stm8s_gpio.c: 157: }
      008631 81               [ 4]  203 	ret
                                    204 ;	lib/src/stm8s_gpio.c: 167: void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    205 ;	-----------------------------------------
                                    206 ;	 function GPIO_WriteLow
                                    207 ;	-----------------------------------------
      008632                        208 _GPIO_WriteLow:
      008632 88               [ 1]  209 	push	a
                                    210 ;	lib/src/stm8s_gpio.c: 169: GPIOx->ODR &= (uint8_t)(~PortPins);
      008633 1E 04            [ 2]  211 	ldw	x, (0x04, sp)
      008635 F6               [ 1]  212 	ld	a, (x)
      008636 6B 01            [ 1]  213 	ld	(0x01, sp), a
      008638 7B 06            [ 1]  214 	ld	a, (0x06, sp)
      00863A 43               [ 1]  215 	cpl	a
      00863B 14 01            [ 1]  216 	and	a, (0x01, sp)
      00863D F7               [ 1]  217 	ld	(x), a
                                    218 ;	lib/src/stm8s_gpio.c: 170: }
      00863E 84               [ 1]  219 	pop	a
      00863F 81               [ 4]  220 	ret
                                    221 ;	lib/src/stm8s_gpio.c: 180: void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    222 ;	-----------------------------------------
                                    223 ;	 function GPIO_WriteReverse
                                    224 ;	-----------------------------------------
      008640                        225 _GPIO_WriteReverse:
                                    226 ;	lib/src/stm8s_gpio.c: 182: GPIOx->ODR ^= (uint8_t)PortPins;
      008640 1E 03            [ 2]  227 	ldw	x, (0x03, sp)
      008642 F6               [ 1]  228 	ld	a, (x)
      008643 18 05            [ 1]  229 	xor	a, (0x05, sp)
      008645 F7               [ 1]  230 	ld	(x), a
                                    231 ;	lib/src/stm8s_gpio.c: 183: }
      008646 81               [ 4]  232 	ret
                                    233 ;	lib/src/stm8s_gpio.c: 191: uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
                                    234 ;	-----------------------------------------
                                    235 ;	 function GPIO_ReadOutputData
                                    236 ;	-----------------------------------------
      008647                        237 _GPIO_ReadOutputData:
                                    238 ;	lib/src/stm8s_gpio.c: 193: return ((uint8_t)GPIOx->ODR);
      008647 1E 03            [ 2]  239 	ldw	x, (0x03, sp)
      008649 F6               [ 1]  240 	ld	a, (x)
                                    241 ;	lib/src/stm8s_gpio.c: 194: }
      00864A 81               [ 4]  242 	ret
                                    243 ;	lib/src/stm8s_gpio.c: 202: uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
                                    244 ;	-----------------------------------------
                                    245 ;	 function GPIO_ReadInputData
                                    246 ;	-----------------------------------------
      00864B                        247 _GPIO_ReadInputData:
                                    248 ;	lib/src/stm8s_gpio.c: 204: return ((uint8_t)GPIOx->IDR);
      00864B 1E 03            [ 2]  249 	ldw	x, (0x03, sp)
      00864D E6 01            [ 1]  250 	ld	a, (0x1, x)
                                    251 ;	lib/src/stm8s_gpio.c: 205: }
      00864F 81               [ 4]  252 	ret
                                    253 ;	lib/src/stm8s_gpio.c: 213: BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    254 ;	-----------------------------------------
                                    255 ;	 function GPIO_ReadInputPin
                                    256 ;	-----------------------------------------
      008650                        257 _GPIO_ReadInputPin:
                                    258 ;	lib/src/stm8s_gpio.c: 215: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
      008650 1E 03            [ 2]  259 	ldw	x, (0x03, sp)
      008652 E6 01            [ 1]  260 	ld	a, (0x1, x)
      008654 14 05            [ 1]  261 	and	a, (0x05, sp)
                                    262 ;	lib/src/stm8s_gpio.c: 216: }
      008656 81               [ 4]  263 	ret
                                    264 ;	lib/src/stm8s_gpio.c: 225: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
                                    265 ;	-----------------------------------------
                                    266 ;	 function GPIO_ExternalPullUpConfig
                                    267 ;	-----------------------------------------
      008657                        268 _GPIO_ExternalPullUpConfig:
      008657 88               [ 1]  269 	push	a
                                    270 ;	lib/src/stm8s_gpio.c: 233: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008658 1E 04            [ 2]  271 	ldw	x, (0x04, sp)
      00865A 1C 00 03         [ 2]  272 	addw	x, #0x0003
      00865D F6               [ 1]  273 	ld	a, (x)
                                    274 ;	lib/src/stm8s_gpio.c: 231: if (NewState != DISABLE) /* External Pull-Up Set*/
      00865E 0D 07            [ 1]  275 	tnz	(0x07, sp)
      008660 27 05            [ 1]  276 	jreq	00102$
                                    277 ;	lib/src/stm8s_gpio.c: 233: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008662 1A 06            [ 1]  278 	or	a, (0x06, sp)
      008664 F7               [ 1]  279 	ld	(x), a
      008665 20 0A            [ 2]  280 	jra	00104$
      008667                        281 00102$:
                                    282 ;	lib/src/stm8s_gpio.c: 236: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      008667 88               [ 1]  283 	push	a
      008668 7B 07            [ 1]  284 	ld	a, (0x07, sp)
      00866A 43               [ 1]  285 	cpl	a
      00866B 6B 02            [ 1]  286 	ld	(0x02, sp), a
      00866D 84               [ 1]  287 	pop	a
      00866E 14 01            [ 1]  288 	and	a, (0x01, sp)
      008670 F7               [ 1]  289 	ld	(x), a
      008671                        290 00104$:
                                    291 ;	lib/src/stm8s_gpio.c: 238: }
      008671 84               [ 1]  292 	pop	a
      008672 81               [ 4]  293 	ret
                                    294 	.area CODE
                                    295 	.area CONST
                                    296 	.area INITIALIZER
                                    297 	.area CABS (ABS)
