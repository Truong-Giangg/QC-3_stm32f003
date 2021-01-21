                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_tim4
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM4_DeInit
                                     12 	.globl _TIM4_TimeBaseInit
                                     13 	.globl _TIM4_Cmd
                                     14 	.globl _TIM4_ITConfig
                                     15 	.globl _TIM4_UpdateDisableConfig
                                     16 	.globl _TIM4_UpdateRequestConfig
                                     17 	.globl _TIM4_SelectOnePulseMode
                                     18 	.globl _TIM4_PrescalerConfig
                                     19 	.globl _TIM4_ARRPreloadConfig
                                     20 	.globl _TIM4_GenerateEvent
                                     21 	.globl _TIM4_SetCounter
                                     22 	.globl _TIM4_SetAutoreload
                                     23 	.globl _TIM4_GetCounter
                                     24 	.globl _TIM4_GetPrescaler
                                     25 	.globl _TIM4_GetFlagStatus
                                     26 	.globl _TIM4_ClearFlag
                                     27 	.globl _TIM4_GetITStatus
                                     28 	.globl _TIM4_ClearITPendingBit
                                     29 ;--------------------------------------------------------
                                     30 ; ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DATA
                                     33 ;--------------------------------------------------------
                                     34 ; ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area INITIALIZED
                                     37 ;--------------------------------------------------------
                                     38 ; absolute external ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area DABS (ABS)
                                     41 
                                     42 ; default segment ordering for linker
                                     43 	.area HOME
                                     44 	.area GSINIT
                                     45 	.area GSFINAL
                                     46 	.area CONST
                                     47 	.area INITIALIZER
                                     48 	.area CODE
                                     49 
                                     50 ;--------------------------------------------------------
                                     51 ; global & static initialisations
                                     52 ;--------------------------------------------------------
                                     53 	.area HOME
                                     54 	.area GSINIT
                                     55 	.area GSFINAL
                                     56 	.area GSINIT
                                     57 ;--------------------------------------------------------
                                     58 ; Home
                                     59 ;--------------------------------------------------------
                                     60 	.area HOME
                                     61 	.area HOME
                                     62 ;--------------------------------------------------------
                                     63 ; code
                                     64 ;--------------------------------------------------------
                                     65 	.area CODE
                                     66 ;	lib/src/stm8s_tim4.c: 49: void TIM4_DeInit(void)
                                     67 ;	-----------------------------------------
                                     68 ;	 function TIM4_DeInit
                                     69 ;	-----------------------------------------
      008673                         70 _TIM4_DeInit:
                                     71 ;	lib/src/stm8s_tim4.c: 51: TIM4->CR1 = TIM4_CR1_RESET_VALUE;
      008673 35 00 53 40      [ 1]   72 	mov	0x5340+0, #0x00
                                     73 ;	lib/src/stm8s_tim4.c: 52: TIM4->IER = TIM4_IER_RESET_VALUE;
      008677 35 00 53 43      [ 1]   74 	mov	0x5343+0, #0x00
                                     75 ;	lib/src/stm8s_tim4.c: 53: TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
      00867B 35 00 53 46      [ 1]   76 	mov	0x5346+0, #0x00
                                     77 ;	lib/src/stm8s_tim4.c: 54: TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
      00867F 35 00 53 47      [ 1]   78 	mov	0x5347+0, #0x00
                                     79 ;	lib/src/stm8s_tim4.c: 55: TIM4->ARR = TIM4_ARR_RESET_VALUE;
      008683 35 FF 53 48      [ 1]   80 	mov	0x5348+0, #0xff
                                     81 ;	lib/src/stm8s_tim4.c: 56: TIM4->SR1 = TIM4_SR1_RESET_VALUE;
      008687 35 00 53 44      [ 1]   82 	mov	0x5344+0, #0x00
                                     83 ;	lib/src/stm8s_tim4.c: 57: }
      00868B 81               [ 4]   84 	ret
                                     85 ;	lib/src/stm8s_tim4.c: 65: void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
                                     86 ;	-----------------------------------------
                                     87 ;	 function TIM4_TimeBaseInit
                                     88 ;	-----------------------------------------
      00868C                         89 _TIM4_TimeBaseInit:
                                     90 ;	lib/src/stm8s_tim4.c: 70: TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
      00868C AE 53 47         [ 2]   91 	ldw	x, #0x5347
      00868F 7B 03            [ 1]   92 	ld	a, (0x03, sp)
      008691 F7               [ 1]   93 	ld	(x), a
                                     94 ;	lib/src/stm8s_tim4.c: 72: TIM4->ARR = (uint8_t)(TIM4_Period);
      008692 AE 53 48         [ 2]   95 	ldw	x, #0x5348
      008695 7B 04            [ 1]   96 	ld	a, (0x04, sp)
      008697 F7               [ 1]   97 	ld	(x), a
                                     98 ;	lib/src/stm8s_tim4.c: 73: }
      008698 81               [ 4]   99 	ret
                                    100 ;	lib/src/stm8s_tim4.c: 81: void TIM4_Cmd(FunctionalState NewState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIM4_Cmd
                                    103 ;	-----------------------------------------
      008699                        104 _TIM4_Cmd:
                                    105 ;	lib/src/stm8s_tim4.c: 89: TIM4->CR1 |= TIM4_CR1_CEN;
      008699 C6 53 40         [ 1]  106 	ld	a, 0x5340
                                    107 ;	lib/src/stm8s_tim4.c: 87: if (NewState != DISABLE)
      00869C 0D 03            [ 1]  108 	tnz	(0x03, sp)
      00869E 27 06            [ 1]  109 	jreq	00102$
                                    110 ;	lib/src/stm8s_tim4.c: 89: TIM4->CR1 |= TIM4_CR1_CEN;
      0086A0 AA 01            [ 1]  111 	or	a, #0x01
      0086A2 C7 53 40         [ 1]  112 	ld	0x5340, a
      0086A5 81               [ 4]  113 	ret
      0086A6                        114 00102$:
                                    115 ;	lib/src/stm8s_tim4.c: 93: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
      0086A6 A4 FE            [ 1]  116 	and	a, #0xfe
      0086A8 C7 53 40         [ 1]  117 	ld	0x5340, a
                                    118 ;	lib/src/stm8s_tim4.c: 95: }
      0086AB 81               [ 4]  119 	ret
                                    120 ;	lib/src/stm8s_tim4.c: 107: void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
                                    121 ;	-----------------------------------------
                                    122 ;	 function TIM4_ITConfig
                                    123 ;	-----------------------------------------
      0086AC                        124 _TIM4_ITConfig:
      0086AC 88               [ 1]  125 	push	a
                                    126 ;	lib/src/stm8s_tim4.c: 116: TIM4->IER |= (uint8_t)TIM4_IT;
      0086AD C6 53 43         [ 1]  127 	ld	a, 0x5343
                                    128 ;	lib/src/stm8s_tim4.c: 113: if (NewState != DISABLE)
      0086B0 0D 05            [ 1]  129 	tnz	(0x05, sp)
      0086B2 27 07            [ 1]  130 	jreq	00102$
                                    131 ;	lib/src/stm8s_tim4.c: 116: TIM4->IER |= (uint8_t)TIM4_IT;
      0086B4 1A 04            [ 1]  132 	or	a, (0x04, sp)
      0086B6 C7 53 43         [ 1]  133 	ld	0x5343, a
      0086B9 20 0C            [ 2]  134 	jra	00104$
      0086BB                        135 00102$:
                                    136 ;	lib/src/stm8s_tim4.c: 121: TIM4->IER &= (uint8_t)(~TIM4_IT);
      0086BB 88               [ 1]  137 	push	a
      0086BC 7B 05            [ 1]  138 	ld	a, (0x05, sp)
      0086BE 43               [ 1]  139 	cpl	a
      0086BF 6B 02            [ 1]  140 	ld	(0x02, sp), a
      0086C1 84               [ 1]  141 	pop	a
      0086C2 14 01            [ 1]  142 	and	a, (0x01, sp)
      0086C4 C7 53 43         [ 1]  143 	ld	0x5343, a
      0086C7                        144 00104$:
                                    145 ;	lib/src/stm8s_tim4.c: 123: }
      0086C7 84               [ 1]  146 	pop	a
      0086C8 81               [ 4]  147 	ret
                                    148 ;	lib/src/stm8s_tim4.c: 131: void TIM4_UpdateDisableConfig(FunctionalState NewState)
                                    149 ;	-----------------------------------------
                                    150 ;	 function TIM4_UpdateDisableConfig
                                    151 ;	-----------------------------------------
      0086C9                        152 _TIM4_UpdateDisableConfig:
                                    153 ;	lib/src/stm8s_tim4.c: 139: TIM4->CR1 |= TIM4_CR1_UDIS;
      0086C9 C6 53 40         [ 1]  154 	ld	a, 0x5340
                                    155 ;	lib/src/stm8s_tim4.c: 137: if (NewState != DISABLE)
      0086CC 0D 03            [ 1]  156 	tnz	(0x03, sp)
      0086CE 27 06            [ 1]  157 	jreq	00102$
                                    158 ;	lib/src/stm8s_tim4.c: 139: TIM4->CR1 |= TIM4_CR1_UDIS;
      0086D0 AA 02            [ 1]  159 	or	a, #0x02
      0086D2 C7 53 40         [ 1]  160 	ld	0x5340, a
      0086D5 81               [ 4]  161 	ret
      0086D6                        162 00102$:
                                    163 ;	lib/src/stm8s_tim4.c: 143: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
      0086D6 A4 FD            [ 1]  164 	and	a, #0xfd
      0086D8 C7 53 40         [ 1]  165 	ld	0x5340, a
                                    166 ;	lib/src/stm8s_tim4.c: 145: }
      0086DB 81               [ 4]  167 	ret
                                    168 ;	lib/src/stm8s_tim4.c: 155: void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
                                    169 ;	-----------------------------------------
                                    170 ;	 function TIM4_UpdateRequestConfig
                                    171 ;	-----------------------------------------
      0086DC                        172 _TIM4_UpdateRequestConfig:
                                    173 ;	lib/src/stm8s_tim4.c: 163: TIM4->CR1 |= TIM4_CR1_URS;
      0086DC C6 53 40         [ 1]  174 	ld	a, 0x5340
                                    175 ;	lib/src/stm8s_tim4.c: 161: if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
      0086DF 0D 03            [ 1]  176 	tnz	(0x03, sp)
      0086E1 27 06            [ 1]  177 	jreq	00102$
                                    178 ;	lib/src/stm8s_tim4.c: 163: TIM4->CR1 |= TIM4_CR1_URS;
      0086E3 AA 04            [ 1]  179 	or	a, #0x04
      0086E5 C7 53 40         [ 1]  180 	ld	0x5340, a
      0086E8 81               [ 4]  181 	ret
      0086E9                        182 00102$:
                                    183 ;	lib/src/stm8s_tim4.c: 167: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
      0086E9 A4 FB            [ 1]  184 	and	a, #0xfb
      0086EB C7 53 40         [ 1]  185 	ld	0x5340, a
                                    186 ;	lib/src/stm8s_tim4.c: 169: }
      0086EE 81               [ 4]  187 	ret
                                    188 ;	lib/src/stm8s_tim4.c: 179: void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
                                    189 ;	-----------------------------------------
                                    190 ;	 function TIM4_SelectOnePulseMode
                                    191 ;	-----------------------------------------
      0086EF                        192 _TIM4_SelectOnePulseMode:
                                    193 ;	lib/src/stm8s_tim4.c: 187: TIM4->CR1 |= TIM4_CR1_OPM;
      0086EF C6 53 40         [ 1]  194 	ld	a, 0x5340
                                    195 ;	lib/src/stm8s_tim4.c: 185: if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
      0086F2 0D 03            [ 1]  196 	tnz	(0x03, sp)
      0086F4 27 06            [ 1]  197 	jreq	00102$
                                    198 ;	lib/src/stm8s_tim4.c: 187: TIM4->CR1 |= TIM4_CR1_OPM;
      0086F6 AA 08            [ 1]  199 	or	a, #0x08
      0086F8 C7 53 40         [ 1]  200 	ld	0x5340, a
      0086FB 81               [ 4]  201 	ret
      0086FC                        202 00102$:
                                    203 ;	lib/src/stm8s_tim4.c: 191: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
      0086FC A4 F7            [ 1]  204 	and	a, #0xf7
      0086FE C7 53 40         [ 1]  205 	ld	0x5340, a
                                    206 ;	lib/src/stm8s_tim4.c: 193: }
      008701 81               [ 4]  207 	ret
                                    208 ;	lib/src/stm8s_tim4.c: 215: void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
                                    209 ;	-----------------------------------------
                                    210 ;	 function TIM4_PrescalerConfig
                                    211 ;	-----------------------------------------
      008702                        212 _TIM4_PrescalerConfig:
                                    213 ;	lib/src/stm8s_tim4.c: 222: TIM4->PSCR = (uint8_t)Prescaler;
      008702 AE 53 47         [ 2]  214 	ldw	x, #0x5347
      008705 7B 03            [ 1]  215 	ld	a, (0x03, sp)
      008707 F7               [ 1]  216 	ld	(x), a
                                    217 ;	lib/src/stm8s_tim4.c: 225: TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
      008708 AE 53 45         [ 2]  218 	ldw	x, #0x5345
      00870B 7B 04            [ 1]  219 	ld	a, (0x04, sp)
      00870D F7               [ 1]  220 	ld	(x), a
                                    221 ;	lib/src/stm8s_tim4.c: 226: }
      00870E 81               [ 4]  222 	ret
                                    223 ;	lib/src/stm8s_tim4.c: 234: void TIM4_ARRPreloadConfig(FunctionalState NewState)
                                    224 ;	-----------------------------------------
                                    225 ;	 function TIM4_ARRPreloadConfig
                                    226 ;	-----------------------------------------
      00870F                        227 _TIM4_ARRPreloadConfig:
                                    228 ;	lib/src/stm8s_tim4.c: 242: TIM4->CR1 |= TIM4_CR1_ARPE;
      00870F C6 53 40         [ 1]  229 	ld	a, 0x5340
                                    230 ;	lib/src/stm8s_tim4.c: 240: if (NewState != DISABLE)
      008712 0D 03            [ 1]  231 	tnz	(0x03, sp)
      008714 27 06            [ 1]  232 	jreq	00102$
                                    233 ;	lib/src/stm8s_tim4.c: 242: TIM4->CR1 |= TIM4_CR1_ARPE;
      008716 AA 80            [ 1]  234 	or	a, #0x80
      008718 C7 53 40         [ 1]  235 	ld	0x5340, a
      00871B 81               [ 4]  236 	ret
      00871C                        237 00102$:
                                    238 ;	lib/src/stm8s_tim4.c: 246: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
      00871C A4 7F            [ 1]  239 	and	a, #0x7f
      00871E C7 53 40         [ 1]  240 	ld	0x5340, a
                                    241 ;	lib/src/stm8s_tim4.c: 248: }
      008721 81               [ 4]  242 	ret
                                    243 ;	lib/src/stm8s_tim4.c: 257: void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
                                    244 ;	-----------------------------------------
                                    245 ;	 function TIM4_GenerateEvent
                                    246 ;	-----------------------------------------
      008722                        247 _TIM4_GenerateEvent:
                                    248 ;	lib/src/stm8s_tim4.c: 263: TIM4->EGR = (uint8_t)(TIM4_EventSource);
      008722 AE 53 45         [ 2]  249 	ldw	x, #0x5345
      008725 7B 03            [ 1]  250 	ld	a, (0x03, sp)
      008727 F7               [ 1]  251 	ld	(x), a
                                    252 ;	lib/src/stm8s_tim4.c: 264: }
      008728 81               [ 4]  253 	ret
                                    254 ;	lib/src/stm8s_tim4.c: 272: void TIM4_SetCounter(uint8_t Counter)
                                    255 ;	-----------------------------------------
                                    256 ;	 function TIM4_SetCounter
                                    257 ;	-----------------------------------------
      008729                        258 _TIM4_SetCounter:
                                    259 ;	lib/src/stm8s_tim4.c: 275: TIM4->CNTR = (uint8_t)(Counter);
      008729 AE 53 46         [ 2]  260 	ldw	x, #0x5346
      00872C 7B 03            [ 1]  261 	ld	a, (0x03, sp)
      00872E F7               [ 1]  262 	ld	(x), a
                                    263 ;	lib/src/stm8s_tim4.c: 276: }
      00872F 81               [ 4]  264 	ret
                                    265 ;	lib/src/stm8s_tim4.c: 284: void TIM4_SetAutoreload(uint8_t Autoreload)
                                    266 ;	-----------------------------------------
                                    267 ;	 function TIM4_SetAutoreload
                                    268 ;	-----------------------------------------
      008730                        269 _TIM4_SetAutoreload:
                                    270 ;	lib/src/stm8s_tim4.c: 287: TIM4->ARR = (uint8_t)(Autoreload);
      008730 AE 53 48         [ 2]  271 	ldw	x, #0x5348
      008733 7B 03            [ 1]  272 	ld	a, (0x03, sp)
      008735 F7               [ 1]  273 	ld	(x), a
                                    274 ;	lib/src/stm8s_tim4.c: 288: }
      008736 81               [ 4]  275 	ret
                                    276 ;	lib/src/stm8s_tim4.c: 295: uint8_t TIM4_GetCounter(void)
                                    277 ;	-----------------------------------------
                                    278 ;	 function TIM4_GetCounter
                                    279 ;	-----------------------------------------
      008737                        280 _TIM4_GetCounter:
                                    281 ;	lib/src/stm8s_tim4.c: 298: return (uint8_t)(TIM4->CNTR);
      008737 C6 53 46         [ 1]  282 	ld	a, 0x5346
                                    283 ;	lib/src/stm8s_tim4.c: 299: }
      00873A 81               [ 4]  284 	ret
                                    285 ;	lib/src/stm8s_tim4.c: 306: TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
                                    286 ;	-----------------------------------------
                                    287 ;	 function TIM4_GetPrescaler
                                    288 ;	-----------------------------------------
      00873B                        289 _TIM4_GetPrescaler:
                                    290 ;	lib/src/stm8s_tim4.c: 309: return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
      00873B C6 53 47         [ 1]  291 	ld	a, 0x5347
                                    292 ;	lib/src/stm8s_tim4.c: 310: }
      00873E 81               [ 4]  293 	ret
                                    294 ;	lib/src/stm8s_tim4.c: 319: FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
                                    295 ;	-----------------------------------------
                                    296 ;	 function TIM4_GetFlagStatus
                                    297 ;	-----------------------------------------
      00873F                        298 _TIM4_GetFlagStatus:
                                    299 ;	lib/src/stm8s_tim4.c: 326: if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
      00873F C6 53 44         [ 1]  300 	ld	a, 0x5344
      008742 14 03            [ 1]  301 	and	a, (0x03, sp)
      008744 27 03            [ 1]  302 	jreq	00102$
                                    303 ;	lib/src/stm8s_tim4.c: 328: bitstatus = SET;
      008746 A6 01            [ 1]  304 	ld	a, #0x01
      008748 81               [ 4]  305 	ret
      008749                        306 00102$:
                                    307 ;	lib/src/stm8s_tim4.c: 332: bitstatus = RESET;
      008749 4F               [ 1]  308 	clr	a
                                    309 ;	lib/src/stm8s_tim4.c: 334: return ((FlagStatus)bitstatus);
                                    310 ;	lib/src/stm8s_tim4.c: 335: }
      00874A 81               [ 4]  311 	ret
                                    312 ;	lib/src/stm8s_tim4.c: 344: void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
                                    313 ;	-----------------------------------------
                                    314 ;	 function TIM4_ClearFlag
                                    315 ;	-----------------------------------------
      00874B                        316 _TIM4_ClearFlag:
                                    317 ;	lib/src/stm8s_tim4.c: 350: TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
      00874B 7B 03            [ 1]  318 	ld	a, (0x03, sp)
      00874D 43               [ 1]  319 	cpl	a
      00874E C7 53 44         [ 1]  320 	ld	0x5344, a
                                    321 ;	lib/src/stm8s_tim4.c: 351: }
      008751 81               [ 4]  322 	ret
                                    323 ;	lib/src/stm8s_tim4.c: 360: ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
                                    324 ;	-----------------------------------------
                                    325 ;	 function TIM4_GetITStatus
                                    326 ;	-----------------------------------------
      008752                        327 _TIM4_GetITStatus:
      008752 88               [ 1]  328 	push	a
                                    329 ;	lib/src/stm8s_tim4.c: 369: itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
      008753 C6 53 44         [ 1]  330 	ld	a, 0x5344
      008756 14 04            [ 1]  331 	and	a, (0x04, sp)
      008758 6B 01            [ 1]  332 	ld	(0x01, sp), a
                                    333 ;	lib/src/stm8s_tim4.c: 371: itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
      00875A C6 53 43         [ 1]  334 	ld	a, 0x5343
      00875D 14 04            [ 1]  335 	and	a, (0x04, sp)
                                    336 ;	lib/src/stm8s_tim4.c: 373: if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
      00875F 0D 01            [ 1]  337 	tnz	(0x01, sp)
      008761 27 06            [ 1]  338 	jreq	00102$
      008763 4D               [ 1]  339 	tnz	a
      008764 27 03            [ 1]  340 	jreq	00102$
                                    341 ;	lib/src/stm8s_tim4.c: 375: bitstatus = (ITStatus)SET;
      008766 A6 01            [ 1]  342 	ld	a, #0x01
                                    343 ;	lib/src/stm8s_tim4.c: 379: bitstatus = (ITStatus)RESET;
      008768 21                     344 	.byte 0x21
      008769                        345 00102$:
      008769 4F               [ 1]  346 	clr	a
      00876A                        347 00103$:
                                    348 ;	lib/src/stm8s_tim4.c: 381: return ((ITStatus)bitstatus);
                                    349 ;	lib/src/stm8s_tim4.c: 382: }
      00876A 5B 01            [ 2]  350 	addw	sp, #1
      00876C 81               [ 4]  351 	ret
                                    352 ;	lib/src/stm8s_tim4.c: 391: void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
                                    353 ;	-----------------------------------------
                                    354 ;	 function TIM4_ClearITPendingBit
                                    355 ;	-----------------------------------------
      00876D                        356 _TIM4_ClearITPendingBit:
                                    357 ;	lib/src/stm8s_tim4.c: 397: TIM4->SR1 = (uint8_t)(~TIM4_IT);
      00876D 7B 03            [ 1]  358 	ld	a, (0x03, sp)
      00876F 43               [ 1]  359 	cpl	a
      008770 C7 53 44         [ 1]  360 	ld	0x5344, a
                                    361 ;	lib/src/stm8s_tim4.c: 398: }
      008773 81               [ 4]  362 	ret
                                    363 	.area CODE
                                    364 	.area CONST
                                    365 	.area INITIALIZER
                                    366 	.area CABS (ABS)
