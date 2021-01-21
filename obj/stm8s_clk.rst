                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_clk
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _CLKPrescTable
                                     12 	.globl _HSIDivExp
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
                                     48 
                                     49 ; default segment ordering for linker
                                     50 	.area HOME
                                     51 	.area GSINIT
                                     52 	.area GSFINAL
                                     53 	.area CONST
                                     54 	.area INITIALIZER
                                     55 	.area CODE
                                     56 
                                     57 ;--------------------------------------------------------
                                     58 ; global & static initialisations
                                     59 ;--------------------------------------------------------
                                     60 	.area HOME
                                     61 	.area GSINIT
                                     62 	.area GSFINAL
                                     63 	.area GSINIT
                                     64 ;--------------------------------------------------------
                                     65 ; Home
                                     66 ;--------------------------------------------------------
                                     67 	.area HOME
                                     68 	.area HOME
                                     69 ;--------------------------------------------------------
                                     70 ; code
                                     71 ;--------------------------------------------------------
                                     72 	.area CODE
                                     73 ;	lib/src/stm8s_clk.c: 72: void CLK_DeInit(void)
                                     74 ;	-----------------------------------------
                                     75 ;	 function CLK_DeInit
                                     76 ;	-----------------------------------------
      008774                         77 _CLK_DeInit:
                                     78 ;	lib/src/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      008774 35 01 50 C0      [ 1]   79 	mov	0x50c0+0, #0x01
                                     80 ;	lib/src/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      008778 35 00 50 C1      [ 1]   81 	mov	0x50c1+0, #0x00
                                     82 ;	lib/src/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      00877C 35 E1 50 C4      [ 1]   83 	mov	0x50c4+0, #0xe1
                                     84 ;	lib/src/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      008780 35 00 50 C5      [ 1]   85 	mov	0x50c5+0, #0x00
                                     86 ;	lib/src/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      008784 35 18 50 C6      [ 1]   87 	mov	0x50c6+0, #0x18
                                     88 ;	lib/src/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      008788 35 FF 50 C7      [ 1]   89 	mov	0x50c7+0, #0xff
                                     90 ;	lib/src/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      00878C 35 FF 50 CA      [ 1]   91 	mov	0x50ca+0, #0xff
                                     92 ;	lib/src/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      008790 35 00 50 C8      [ 1]   93 	mov	0x50c8+0, #0x00
                                     94 ;	lib/src/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008794 35 00 50 C9      [ 1]   95 	mov	0x50c9+0, #0x00
                                     96 ;	lib/src/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      008798                         97 00101$:
      008798 C6 50 C9         [ 1]   98 	ld	a, 0x50c9
      00879B 44               [ 1]   99 	srl	a
      00879C 25 FA            [ 1]  100 	jrc	00101$
                                    101 ;	lib/src/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      00879E 35 00 50 C9      [ 1]  102 	mov	0x50c9+0, #0x00
                                    103 ;	lib/src/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      0087A2 35 00 50 CC      [ 1]  104 	mov	0x50cc+0, #0x00
                                    105 ;	lib/src/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      0087A6 35 00 50 CD      [ 1]  106 	mov	0x50cd+0, #0x00
                                    107 ;	lib/src/stm8s_clk.c: 88: }
      0087AA 81               [ 4]  108 	ret
                                    109 ;	lib/src/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    110 ;	-----------------------------------------
                                    111 ;	 function CLK_FastHaltWakeUpCmd
                                    112 ;	-----------------------------------------
      0087AB                        113 _CLK_FastHaltWakeUpCmd:
                                    114 ;	lib/src/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      0087AB C6 50 C0         [ 1]  115 	ld	a, 0x50c0
                                    116 ;	lib/src/stm8s_clk.c: 104: if (NewState != DISABLE)
      0087AE 0D 03            [ 1]  117 	tnz	(0x03, sp)
      0087B0 27 06            [ 1]  118 	jreq	00102$
                                    119 ;	lib/src/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      0087B2 AA 04            [ 1]  120 	or	a, #0x04
      0087B4 C7 50 C0         [ 1]  121 	ld	0x50c0, a
      0087B7 81               [ 4]  122 	ret
      0087B8                        123 00102$:
                                    124 ;	lib/src/stm8s_clk.c: 112: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      0087B8 A4 FB            [ 1]  125 	and	a, #0xfb
      0087BA C7 50 C0         [ 1]  126 	ld	0x50c0, a
                                    127 ;	lib/src/stm8s_clk.c: 114: }
      0087BD 81               [ 4]  128 	ret
                                    129 ;	lib/src/stm8s_clk.c: 121: void CLK_HSECmd(FunctionalState NewState)
                                    130 ;	-----------------------------------------
                                    131 ;	 function CLK_HSECmd
                                    132 ;	-----------------------------------------
      0087BE                        133 _CLK_HSECmd:
                                    134 ;	lib/src/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      0087BE C6 50 C1         [ 1]  135 	ld	a, 0x50c1
                                    136 ;	lib/src/stm8s_clk.c: 126: if (NewState != DISABLE)
      0087C1 0D 03            [ 1]  137 	tnz	(0x03, sp)
      0087C3 27 06            [ 1]  138 	jreq	00102$
                                    139 ;	lib/src/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      0087C5 AA 01            [ 1]  140 	or	a, #0x01
      0087C7 C7 50 C1         [ 1]  141 	ld	0x50c1, a
      0087CA 81               [ 4]  142 	ret
      0087CB                        143 00102$:
                                    144 ;	lib/src/stm8s_clk.c: 134: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      0087CB A4 FE            [ 1]  145 	and	a, #0xfe
      0087CD C7 50 C1         [ 1]  146 	ld	0x50c1, a
                                    147 ;	lib/src/stm8s_clk.c: 136: }
      0087D0 81               [ 4]  148 	ret
                                    149 ;	lib/src/stm8s_clk.c: 143: void CLK_HSICmd(FunctionalState NewState)
                                    150 ;	-----------------------------------------
                                    151 ;	 function CLK_HSICmd
                                    152 ;	-----------------------------------------
      0087D1                        153 _CLK_HSICmd:
                                    154 ;	lib/src/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      0087D1 C6 50 C0         [ 1]  155 	ld	a, 0x50c0
                                    156 ;	lib/src/stm8s_clk.c: 148: if (NewState != DISABLE)
      0087D4 0D 03            [ 1]  157 	tnz	(0x03, sp)
      0087D6 27 06            [ 1]  158 	jreq	00102$
                                    159 ;	lib/src/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      0087D8 AA 01            [ 1]  160 	or	a, #0x01
      0087DA C7 50 C0         [ 1]  161 	ld	0x50c0, a
      0087DD 81               [ 4]  162 	ret
      0087DE                        163 00102$:
                                    164 ;	lib/src/stm8s_clk.c: 156: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      0087DE A4 FE            [ 1]  165 	and	a, #0xfe
      0087E0 C7 50 C0         [ 1]  166 	ld	0x50c0, a
                                    167 ;	lib/src/stm8s_clk.c: 158: }
      0087E3 81               [ 4]  168 	ret
                                    169 ;	lib/src/stm8s_clk.c: 166: void CLK_LSICmd(FunctionalState NewState)
                                    170 ;	-----------------------------------------
                                    171 ;	 function CLK_LSICmd
                                    172 ;	-----------------------------------------
      0087E4                        173 _CLK_LSICmd:
                                    174 ;	lib/src/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      0087E4 C6 50 C0         [ 1]  175 	ld	a, 0x50c0
                                    176 ;	lib/src/stm8s_clk.c: 171: if (NewState != DISABLE)
      0087E7 0D 03            [ 1]  177 	tnz	(0x03, sp)
      0087E9 27 06            [ 1]  178 	jreq	00102$
                                    179 ;	lib/src/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      0087EB AA 08            [ 1]  180 	or	a, #0x08
      0087ED C7 50 C0         [ 1]  181 	ld	0x50c0, a
      0087F0 81               [ 4]  182 	ret
      0087F1                        183 00102$:
                                    184 ;	lib/src/stm8s_clk.c: 179: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      0087F1 A4 F7            [ 1]  185 	and	a, #0xf7
      0087F3 C7 50 C0         [ 1]  186 	ld	0x50c0, a
                                    187 ;	lib/src/stm8s_clk.c: 181: }
      0087F6 81               [ 4]  188 	ret
                                    189 ;	lib/src/stm8s_clk.c: 189: void CLK_CCOCmd(FunctionalState NewState)
                                    190 ;	-----------------------------------------
                                    191 ;	 function CLK_CCOCmd
                                    192 ;	-----------------------------------------
      0087F7                        193 _CLK_CCOCmd:
                                    194 ;	lib/src/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      0087F7 C6 50 C9         [ 1]  195 	ld	a, 0x50c9
                                    196 ;	lib/src/stm8s_clk.c: 194: if (NewState != DISABLE)
      0087FA 0D 03            [ 1]  197 	tnz	(0x03, sp)
      0087FC 27 06            [ 1]  198 	jreq	00102$
                                    199 ;	lib/src/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      0087FE AA 01            [ 1]  200 	or	a, #0x01
      008800 C7 50 C9         [ 1]  201 	ld	0x50c9, a
      008803 81               [ 4]  202 	ret
      008804                        203 00102$:
                                    204 ;	lib/src/stm8s_clk.c: 202: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      008804 A4 FE            [ 1]  205 	and	a, #0xfe
      008806 C7 50 C9         [ 1]  206 	ld	0x50c9, a
                                    207 ;	lib/src/stm8s_clk.c: 204: }
      008809 81               [ 4]  208 	ret
                                    209 ;	lib/src/stm8s_clk.c: 213: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    210 ;	-----------------------------------------
                                    211 ;	 function CLK_ClockSwitchCmd
                                    212 ;	-----------------------------------------
      00880A                        213 _CLK_ClockSwitchCmd:
                                    214 ;	lib/src/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      00880A C6 50 C5         [ 1]  215 	ld	a, 0x50c5
                                    216 ;	lib/src/stm8s_clk.c: 218: if (NewState != DISABLE )
      00880D 0D 03            [ 1]  217 	tnz	(0x03, sp)
      00880F 27 06            [ 1]  218 	jreq	00102$
                                    219 ;	lib/src/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      008811 AA 02            [ 1]  220 	or	a, #0x02
      008813 C7 50 C5         [ 1]  221 	ld	0x50c5, a
      008816 81               [ 4]  222 	ret
      008817                        223 00102$:
                                    224 ;	lib/src/stm8s_clk.c: 226: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      008817 A4 FD            [ 1]  225 	and	a, #0xfd
      008819 C7 50 C5         [ 1]  226 	ld	0x50c5, a
                                    227 ;	lib/src/stm8s_clk.c: 228: }
      00881C 81               [ 4]  228 	ret
                                    229 ;	lib/src/stm8s_clk.c: 238: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    230 ;	-----------------------------------------
                                    231 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    232 ;	-----------------------------------------
      00881D                        233 _CLK_SlowActiveHaltWakeUpCmd:
                                    234 ;	lib/src/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      00881D C6 50 C0         [ 1]  235 	ld	a, 0x50c0
                                    236 ;	lib/src/stm8s_clk.c: 243: if (NewState != DISABLE)
      008820 0D 03            [ 1]  237 	tnz	(0x03, sp)
      008822 27 06            [ 1]  238 	jreq	00102$
                                    239 ;	lib/src/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      008824 AA 20            [ 1]  240 	or	a, #0x20
      008826 C7 50 C0         [ 1]  241 	ld	0x50c0, a
      008829 81               [ 4]  242 	ret
      00882A                        243 00102$:
                                    244 ;	lib/src/stm8s_clk.c: 251: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      00882A A4 DF            [ 1]  245 	and	a, #0xdf
      00882C C7 50 C0         [ 1]  246 	ld	0x50c0, a
                                    247 ;	lib/src/stm8s_clk.c: 253: }
      00882F 81               [ 4]  248 	ret
                                    249 ;	lib/src/stm8s_clk.c: 263: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    250 ;	-----------------------------------------
                                    251 ;	 function CLK_PeripheralClockConfig
                                    252 ;	-----------------------------------------
      008830                        253 _CLK_PeripheralClockConfig:
      008830 52 02            [ 2]  254 	sub	sp, #2
                                    255 ;	lib/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008832 7B 05            [ 1]  256 	ld	a, (0x05, sp)
      008834 A4 0F            [ 1]  257 	and	a, #0x0f
      008836 88               [ 1]  258 	push	a
      008837 A6 01            [ 1]  259 	ld	a, #0x01
      008839 6B 02            [ 1]  260 	ld	(0x02, sp), a
      00883B 84               [ 1]  261 	pop	a
      00883C 4D               [ 1]  262 	tnz	a
      00883D 27 05            [ 1]  263 	jreq	00128$
      00883F                        264 00127$:
      00883F 08 01            [ 1]  265 	sll	(0x01, sp)
      008841 4A               [ 1]  266 	dec	a
      008842 26 FB            [ 1]  267 	jrne	00127$
      008844                        268 00128$:
                                    269 ;	lib/src/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008844 7B 01            [ 1]  270 	ld	a, (0x01, sp)
      008846 43               [ 1]  271 	cpl	a
      008847 6B 02            [ 1]  272 	ld	(0x02, sp), a
                                    273 ;	lib/src/stm8s_clk.c: 269: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      008849 7B 05            [ 1]  274 	ld	a, (0x05, sp)
      00884B A5 10            [ 1]  275 	bcp	a, #0x10
      00884D 26 15            [ 1]  276 	jrne	00108$
                                    277 ;	lib/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00884F C6 50 C7         [ 1]  278 	ld	a, 0x50c7
                                    279 ;	lib/src/stm8s_clk.c: 271: if (NewState != DISABLE)
      008852 0D 06            [ 1]  280 	tnz	(0x06, sp)
      008854 27 07            [ 1]  281 	jreq	00102$
                                    282 ;	lib/src/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008856 1A 01            [ 1]  283 	or	a, (0x01, sp)
      008858 C7 50 C7         [ 1]  284 	ld	0x50c7, a
      00885B 20 1A            [ 2]  285 	jra	00110$
      00885D                        286 00102$:
                                    287 ;	lib/src/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      00885D 14 02            [ 1]  288 	and	a, (0x02, sp)
      00885F C7 50 C7         [ 1]  289 	ld	0x50c7, a
      008862 20 13            [ 2]  290 	jra	00110$
      008864                        291 00108$:
                                    292 ;	lib/src/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008864 C6 50 CA         [ 1]  293 	ld	a, 0x50ca
                                    294 ;	lib/src/stm8s_clk.c: 284: if (NewState != DISABLE)
      008867 0D 06            [ 1]  295 	tnz	(0x06, sp)
      008869 27 07            [ 1]  296 	jreq	00105$
                                    297 ;	lib/src/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00886B 1A 01            [ 1]  298 	or	a, (0x01, sp)
      00886D C7 50 CA         [ 1]  299 	ld	0x50ca, a
      008870 20 05            [ 2]  300 	jra	00110$
      008872                        301 00105$:
                                    302 ;	lib/src/stm8s_clk.c: 292: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008872 14 02            [ 1]  303 	and	a, (0x02, sp)
      008874 C7 50 CA         [ 1]  304 	ld	0x50ca, a
      008877                        305 00110$:
                                    306 ;	lib/src/stm8s_clk.c: 295: }
      008877 5B 02            [ 2]  307 	addw	sp, #2
      008879 81               [ 4]  308 	ret
                                    309 ;	lib/src/stm8s_clk.c: 309: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    310 ;	-----------------------------------------
                                    311 ;	 function CLK_ClockSwitchConfig
                                    312 ;	-----------------------------------------
      00887A                        313 _CLK_ClockSwitchConfig:
                                    314 ;	lib/src/stm8s_clk.c: 322: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      00887A C6 50 C3         [ 1]  315 	ld	a, 0x50c3
      00887D 90 97            [ 1]  316 	ld	yl, a
                                    317 ;	lib/src/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      00887F C6 50 C5         [ 1]  318 	ld	a, 0x50c5
                                    319 ;	lib/src/stm8s_clk.c: 325: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      008882 88               [ 1]  320 	push	a
      008883 7B 04            [ 1]  321 	ld	a, (0x04, sp)
      008885 4A               [ 1]  322 	dec	a
      008886 84               [ 1]  323 	pop	a
      008887 26 37            [ 1]  324 	jrne	00122$
                                    325 ;	lib/src/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      008889 AA 02            [ 1]  326 	or	a, #0x02
      00888B C7 50 C5         [ 1]  327 	ld	0x50c5, a
      00888E C6 50 C5         [ 1]  328 	ld	a, 0x50c5
                                    329 ;	lib/src/stm8s_clk.c: 331: if (ITState != DISABLE)
      008891 0D 05            [ 1]  330 	tnz	(0x05, sp)
      008893 27 07            [ 1]  331 	jreq	00102$
                                    332 ;	lib/src/stm8s_clk.c: 333: CLK->SWCR |= CLK_SWCR_SWIEN;
      008895 AA 04            [ 1]  333 	or	a, #0x04
      008897 C7 50 C5         [ 1]  334 	ld	0x50c5, a
      00889A 20 05            [ 2]  335 	jra	00103$
      00889C                        336 00102$:
                                    337 ;	lib/src/stm8s_clk.c: 337: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      00889C A4 FB            [ 1]  338 	and	a, #0xfb
      00889E C7 50 C5         [ 1]  339 	ld	0x50c5, a
      0088A1                        340 00103$:
                                    341 ;	lib/src/stm8s_clk.c: 341: CLK->SWR = (uint8_t)CLK_NewClock;
      0088A1 AE 50 C4         [ 2]  342 	ldw	x, #0x50c4
      0088A4 7B 04            [ 1]  343 	ld	a, (0x04, sp)
      0088A6 F7               [ 1]  344 	ld	(x), a
                                    345 ;	lib/src/stm8s_clk.c: 344: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      0088A7 5F               [ 1]  346 	clrw	x
      0088A8 5A               [ 2]  347 	decw	x
      0088A9                        348 00105$:
      0088A9 C6 50 C5         [ 1]  349 	ld	a, 0x50c5
      0088AC 44               [ 1]  350 	srl	a
      0088AD 24 06            [ 1]  351 	jrnc	00107$
      0088AF 5D               [ 2]  352 	tnzw	x
      0088B0 27 03            [ 1]  353 	jreq	00107$
                                    354 ;	lib/src/stm8s_clk.c: 346: DownCounter--;
      0088B2 5A               [ 2]  355 	decw	x
      0088B3 20 F4            [ 2]  356 	jra	00105$
      0088B5                        357 00107$:
                                    358 ;	lib/src/stm8s_clk.c: 349: if(DownCounter != 0)
      0088B5 5D               [ 2]  359 	tnzw	x
      0088B6 27 05            [ 1]  360 	jreq	00109$
                                    361 ;	lib/src/stm8s_clk.c: 351: Swif = SUCCESS;
      0088B8 A6 01            [ 1]  362 	ld	a, #0x01
      0088BA 97               [ 1]  363 	ld	xl, a
      0088BB 20 34            [ 2]  364 	jra	00123$
      0088BD                        365 00109$:
                                    366 ;	lib/src/stm8s_clk.c: 355: Swif = ERROR;
      0088BD 5F               [ 1]  367 	clrw	x
      0088BE 20 31            [ 2]  368 	jra	00123$
      0088C0                        369 00122$:
                                    370 ;	lib/src/stm8s_clk.c: 361: if (ITState != DISABLE)
      0088C0 0D 05            [ 1]  371 	tnz	(0x05, sp)
      0088C2 27 07            [ 1]  372 	jreq	00112$
                                    373 ;	lib/src/stm8s_clk.c: 363: CLK->SWCR |= CLK_SWCR_SWIEN;
      0088C4 AA 04            [ 1]  374 	or	a, #0x04
      0088C6 C7 50 C5         [ 1]  375 	ld	0x50c5, a
      0088C9 20 05            [ 2]  376 	jra	00113$
      0088CB                        377 00112$:
                                    378 ;	lib/src/stm8s_clk.c: 367: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      0088CB A4 FB            [ 1]  379 	and	a, #0xfb
      0088CD C7 50 C5         [ 1]  380 	ld	0x50c5, a
      0088D0                        381 00113$:
                                    382 ;	lib/src/stm8s_clk.c: 371: CLK->SWR = (uint8_t)CLK_NewClock;
      0088D0 AE 50 C4         [ 2]  383 	ldw	x, #0x50c4
      0088D3 7B 04            [ 1]  384 	ld	a, (0x04, sp)
      0088D5 F7               [ 1]  385 	ld	(x), a
                                    386 ;	lib/src/stm8s_clk.c: 374: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      0088D6 5F               [ 1]  387 	clrw	x
      0088D7 5A               [ 2]  388 	decw	x
      0088D8                        389 00115$:
      0088D8 C6 50 C5         [ 1]  390 	ld	a, 0x50c5
      0088DB A5 08            [ 1]  391 	bcp	a, #0x08
      0088DD 27 06            [ 1]  392 	jreq	00117$
      0088DF 5D               [ 2]  393 	tnzw	x
      0088E0 27 03            [ 1]  394 	jreq	00117$
                                    395 ;	lib/src/stm8s_clk.c: 376: DownCounter--;
      0088E2 5A               [ 2]  396 	decw	x
      0088E3 20 F3            [ 2]  397 	jra	00115$
      0088E5                        398 00117$:
                                    399 ;	lib/src/stm8s_clk.c: 379: if(DownCounter != 0)
      0088E5 5D               [ 2]  400 	tnzw	x
      0088E6 27 08            [ 1]  401 	jreq	00119$
                                    402 ;	lib/src/stm8s_clk.c: 382: CLK->SWCR |= CLK_SWCR_SWEN;
      0088E8 72 12 50 C5      [ 1]  403 	bset	20677, #1
                                    404 ;	lib/src/stm8s_clk.c: 383: Swif = SUCCESS;
      0088EC A6 01            [ 1]  405 	ld	a, #0x01
      0088EE 97               [ 1]  406 	ld	xl, a
                                    407 ;	lib/src/stm8s_clk.c: 387: Swif = ERROR;
      0088EF 21                     408 	.byte 0x21
      0088F0                        409 00119$:
      0088F0 5F               [ 1]  410 	clrw	x
      0088F1                        411 00123$:
                                    412 ;	lib/src/stm8s_clk.c: 390: if(Swif != ERROR)
      0088F1 9F               [ 1]  413 	ld	a, xl
      0088F2 4D               [ 1]  414 	tnz	a
      0088F3 27 2E            [ 1]  415 	jreq	00136$
                                    416 ;	lib/src/stm8s_clk.c: 393: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      0088F5 0D 06            [ 1]  417 	tnz	(0x06, sp)
      0088F7 26 0C            [ 1]  418 	jrne	00132$
      0088F9 90 9F            [ 1]  419 	ld	a, yl
      0088FB A1 E1            [ 1]  420 	cp	a, #0xe1
      0088FD 26 06            [ 1]  421 	jrne	00132$
                                    422 ;	lib/src/stm8s_clk.c: 395: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      0088FF 72 11 50 C0      [ 1]  423 	bres	20672, #0
      008903 20 1E            [ 2]  424 	jra	00136$
      008905                        425 00132$:
                                    426 ;	lib/src/stm8s_clk.c: 397: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      008905 0D 06            [ 1]  427 	tnz	(0x06, sp)
      008907 26 0C            [ 1]  428 	jrne	00128$
      008909 90 9F            [ 1]  429 	ld	a, yl
      00890B A1 D2            [ 1]  430 	cp	a, #0xd2
      00890D 26 06            [ 1]  431 	jrne	00128$
                                    432 ;	lib/src/stm8s_clk.c: 399: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      00890F 72 17 50 C0      [ 1]  433 	bres	20672, #3
      008913 20 0E            [ 2]  434 	jra	00136$
      008915                        435 00128$:
                                    436 ;	lib/src/stm8s_clk.c: 401: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      008915 0D 06            [ 1]  437 	tnz	(0x06, sp)
      008917 26 0A            [ 1]  438 	jrne	00136$
      008919 90 9F            [ 1]  439 	ld	a, yl
      00891B A1 B4            [ 1]  440 	cp	a, #0xb4
      00891D 26 04            [ 1]  441 	jrne	00136$
                                    442 ;	lib/src/stm8s_clk.c: 403: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      00891F 72 11 50 C1      [ 1]  443 	bres	20673, #0
      008923                        444 00136$:
                                    445 ;	lib/src/stm8s_clk.c: 406: return(Swif);
      008923 9F               [ 1]  446 	ld	a, xl
                                    447 ;	lib/src/stm8s_clk.c: 407: }
      008924 81               [ 4]  448 	ret
                                    449 ;	lib/src/stm8s_clk.c: 415: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    450 ;	-----------------------------------------
                                    451 ;	 function CLK_HSIPrescalerConfig
                                    452 ;	-----------------------------------------
      008925                        453 _CLK_HSIPrescalerConfig:
                                    454 ;	lib/src/stm8s_clk.c: 421: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008925 C6 50 C6         [ 1]  455 	ld	a, 0x50c6
      008928 A4 E7            [ 1]  456 	and	a, #0xe7
      00892A C7 50 C6         [ 1]  457 	ld	0x50c6, a
                                    458 ;	lib/src/stm8s_clk.c: 424: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      00892D C6 50 C6         [ 1]  459 	ld	a, 0x50c6
      008930 1A 03            [ 1]  460 	or	a, (0x03, sp)
      008932 C7 50 C6         [ 1]  461 	ld	0x50c6, a
                                    462 ;	lib/src/stm8s_clk.c: 425: }
      008935 81               [ 4]  463 	ret
                                    464 ;	lib/src/stm8s_clk.c: 436: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    465 ;	-----------------------------------------
                                    466 ;	 function CLK_CCOConfig
                                    467 ;	-----------------------------------------
      008936                        468 _CLK_CCOConfig:
                                    469 ;	lib/src/stm8s_clk.c: 442: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      008936 C6 50 C9         [ 1]  470 	ld	a, 0x50c9
      008939 A4 E1            [ 1]  471 	and	a, #0xe1
      00893B C7 50 C9         [ 1]  472 	ld	0x50c9, a
                                    473 ;	lib/src/stm8s_clk.c: 445: CLK->CCOR |= (uint8_t)CLK_CCO;
      00893E C6 50 C9         [ 1]  474 	ld	a, 0x50c9
      008941 1A 03            [ 1]  475 	or	a, (0x03, sp)
      008943 C7 50 C9         [ 1]  476 	ld	0x50c9, a
                                    477 ;	lib/src/stm8s_clk.c: 448: CLK->CCOR |= CLK_CCOR_CCOEN;
      008946 72 10 50 C9      [ 1]  478 	bset	20681, #0
                                    479 ;	lib/src/stm8s_clk.c: 449: }
      00894A 81               [ 4]  480 	ret
                                    481 ;	lib/src/stm8s_clk.c: 459: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    482 ;	-----------------------------------------
                                    483 ;	 function CLK_ITConfig
                                    484 ;	-----------------------------------------
      00894B                        485 _CLK_ITConfig:
      00894B 88               [ 1]  486 	push	a
                                    487 ;	lib/src/stm8s_clk.c: 467: switch (CLK_IT)
      00894C 7B 04            [ 1]  488 	ld	a, (0x04, sp)
      00894E A0 0C            [ 1]  489 	sub	a, #0x0c
      008950 26 04            [ 1]  490 	jrne	00140$
      008952 4C               [ 1]  491 	inc	a
      008953 6B 01            [ 1]  492 	ld	(0x01, sp), a
      008955 C5                     493 	.byte 0xc5
      008956                        494 00140$:
      008956 0F 01            [ 1]  495 	clr	(0x01, sp)
      008958                        496 00141$:
      008958 7B 04            [ 1]  497 	ld	a, (0x04, sp)
      00895A A0 1C            [ 1]  498 	sub	a, #0x1c
      00895C 26 02            [ 1]  499 	jrne	00143$
      00895E 4C               [ 1]  500 	inc	a
      00895F 21                     501 	.byte 0x21
      008960                        502 00143$:
      008960 4F               [ 1]  503 	clr	a
      008961                        504 00144$:
                                    505 ;	lib/src/stm8s_clk.c: 465: if (NewState != DISABLE)
      008961 0D 05            [ 1]  506 	tnz	(0x05, sp)
      008963 27 13            [ 1]  507 	jreq	00110$
                                    508 ;	lib/src/stm8s_clk.c: 467: switch (CLK_IT)
      008965 0D 01            [ 1]  509 	tnz	(0x01, sp)
      008967 26 09            [ 1]  510 	jrne	00102$
      008969 4D               [ 1]  511 	tnz	a
      00896A 27 1D            [ 1]  512 	jreq	00112$
                                    513 ;	lib/src/stm8s_clk.c: 470: CLK->SWCR |= CLK_SWCR_SWIEN;
      00896C 72 14 50 C5      [ 1]  514 	bset	20677, #2
                                    515 ;	lib/src/stm8s_clk.c: 471: break;
      008970 20 17            [ 2]  516 	jra	00112$
                                    517 ;	lib/src/stm8s_clk.c: 472: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      008972                        518 00102$:
                                    519 ;	lib/src/stm8s_clk.c: 473: CLK->CSSR |= CLK_CSSR_CSSDIE;
      008972 72 14 50 C8      [ 1]  520 	bset	20680, #2
                                    521 ;	lib/src/stm8s_clk.c: 474: break;
      008976 20 11            [ 2]  522 	jra	00112$
                                    523 ;	lib/src/stm8s_clk.c: 477: }
      008978                        524 00110$:
                                    525 ;	lib/src/stm8s_clk.c: 481: switch (CLK_IT)
      008978 0D 01            [ 1]  526 	tnz	(0x01, sp)
      00897A 26 09            [ 1]  527 	jrne	00106$
      00897C 4D               [ 1]  528 	tnz	a
      00897D 27 0A            [ 1]  529 	jreq	00112$
                                    530 ;	lib/src/stm8s_clk.c: 484: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      00897F 72 15 50 C5      [ 1]  531 	bres	20677, #2
                                    532 ;	lib/src/stm8s_clk.c: 485: break;
      008983 20 04            [ 2]  533 	jra	00112$
                                    534 ;	lib/src/stm8s_clk.c: 486: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      008985                        535 00106$:
                                    536 ;	lib/src/stm8s_clk.c: 487: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      008985 72 15 50 C8      [ 1]  537 	bres	20680, #2
                                    538 ;	lib/src/stm8s_clk.c: 491: }
      008989                        539 00112$:
                                    540 ;	lib/src/stm8s_clk.c: 493: }
      008989 84               [ 1]  541 	pop	a
      00898A 81               [ 4]  542 	ret
                                    543 ;	lib/src/stm8s_clk.c: 500: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    544 ;	-----------------------------------------
                                    545 ;	 function CLK_SYSCLKConfig
                                    546 ;	-----------------------------------------
      00898B                        547 _CLK_SYSCLKConfig:
      00898B 88               [ 1]  548 	push	a
                                    549 ;	lib/src/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      00898C C6 50 C6         [ 1]  550 	ld	a, 0x50c6
                                    551 ;	lib/src/stm8s_clk.c: 505: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      00898F 0D 04            [ 1]  552 	tnz	(0x04, sp)
      008991 2B 15            [ 1]  553 	jrmi	00102$
                                    554 ;	lib/src/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008993 A4 E7            [ 1]  555 	and	a, #0xe7
      008995 C7 50 C6         [ 1]  556 	ld	0x50c6, a
                                    557 ;	lib/src/stm8s_clk.c: 508: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      008998 C6 50 C6         [ 1]  558 	ld	a, 0x50c6
      00899B 6B 01            [ 1]  559 	ld	(0x01, sp), a
      00899D 7B 04            [ 1]  560 	ld	a, (0x04, sp)
      00899F A4 18            [ 1]  561 	and	a, #0x18
      0089A1 1A 01            [ 1]  562 	or	a, (0x01, sp)
      0089A3 C7 50 C6         [ 1]  563 	ld	0x50c6, a
      0089A6 20 13            [ 2]  564 	jra	00104$
      0089A8                        565 00102$:
                                    566 ;	lib/src/stm8s_clk.c: 512: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      0089A8 A4 F8            [ 1]  567 	and	a, #0xf8
      0089AA C7 50 C6         [ 1]  568 	ld	0x50c6, a
                                    569 ;	lib/src/stm8s_clk.c: 513: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      0089AD C6 50 C6         [ 1]  570 	ld	a, 0x50c6
      0089B0 6B 01            [ 1]  571 	ld	(0x01, sp), a
      0089B2 7B 04            [ 1]  572 	ld	a, (0x04, sp)
      0089B4 A4 07            [ 1]  573 	and	a, #0x07
      0089B6 1A 01            [ 1]  574 	or	a, (0x01, sp)
      0089B8 C7 50 C6         [ 1]  575 	ld	0x50c6, a
      0089BB                        576 00104$:
                                    577 ;	lib/src/stm8s_clk.c: 515: }
      0089BB 84               [ 1]  578 	pop	a
      0089BC 81               [ 4]  579 	ret
                                    580 ;	lib/src/stm8s_clk.c: 523: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    581 ;	-----------------------------------------
                                    582 ;	 function CLK_SWIMConfig
                                    583 ;	-----------------------------------------
      0089BD                        584 _CLK_SWIMConfig:
                                    585 ;	lib/src/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      0089BD C6 50 CD         [ 1]  586 	ld	a, 0x50cd
                                    587 ;	lib/src/stm8s_clk.c: 528: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      0089C0 0D 03            [ 1]  588 	tnz	(0x03, sp)
      0089C2 27 06            [ 1]  589 	jreq	00102$
                                    590 ;	lib/src/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      0089C4 AA 01            [ 1]  591 	or	a, #0x01
      0089C6 C7 50 CD         [ 1]  592 	ld	0x50cd, a
      0089C9 81               [ 4]  593 	ret
      0089CA                        594 00102$:
                                    595 ;	lib/src/stm8s_clk.c: 536: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      0089CA A4 FE            [ 1]  596 	and	a, #0xfe
      0089CC C7 50 CD         [ 1]  597 	ld	0x50cd, a
                                    598 ;	lib/src/stm8s_clk.c: 538: }
      0089CF 81               [ 4]  599 	ret
                                    600 ;	lib/src/stm8s_clk.c: 547: void CLK_ClockSecuritySystemEnable(void)
                                    601 ;	-----------------------------------------
                                    602 ;	 function CLK_ClockSecuritySystemEnable
                                    603 ;	-----------------------------------------
      0089D0                        604 _CLK_ClockSecuritySystemEnable:
                                    605 ;	lib/src/stm8s_clk.c: 550: CLK->CSSR |= CLK_CSSR_CSSEN;
      0089D0 72 10 50 C8      [ 1]  606 	bset	20680, #0
                                    607 ;	lib/src/stm8s_clk.c: 551: }
      0089D4 81               [ 4]  608 	ret
                                    609 ;	lib/src/stm8s_clk.c: 559: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    610 ;	-----------------------------------------
                                    611 ;	 function CLK_GetSYSCLKSource
                                    612 ;	-----------------------------------------
      0089D5                        613 _CLK_GetSYSCLKSource:
                                    614 ;	lib/src/stm8s_clk.c: 561: return((CLK_Source_TypeDef)CLK->CMSR);
      0089D5 C6 50 C3         [ 1]  615 	ld	a, 0x50c3
                                    616 ;	lib/src/stm8s_clk.c: 562: }
      0089D8 81               [ 4]  617 	ret
                                    618 ;	lib/src/stm8s_clk.c: 569: uint32_t CLK_GetClockFreq(void)
                                    619 ;	-----------------------------------------
                                    620 ;	 function CLK_GetClockFreq
                                    621 ;	-----------------------------------------
      0089D9                        622 _CLK_GetClockFreq:
      0089D9 52 04            [ 2]  623 	sub	sp, #4
                                    624 ;	lib/src/stm8s_clk.c: 576: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      0089DB C6 50 C3         [ 1]  625 	ld	a, 0x50c3
                                    626 ;	lib/src/stm8s_clk.c: 578: if (clocksource == CLK_SOURCE_HSI)
      0089DE 6B 04            [ 1]  627 	ld	(0x04, sp), a
      0089E0 A1 E1            [ 1]  628 	cp	a, #0xe1
      0089E2 26 26            [ 1]  629 	jrne	00105$
                                    630 ;	lib/src/stm8s_clk.c: 580: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      0089E4 C6 50 C6         [ 1]  631 	ld	a, 0x50c6
      0089E7 A4 18            [ 1]  632 	and	a, #0x18
                                    633 ;	lib/src/stm8s_clk.c: 581: tmp = (uint8_t)(tmp >> 3);
      0089E9 44               [ 1]  634 	srl	a
      0089EA 44               [ 1]  635 	srl	a
      0089EB 44               [ 1]  636 	srl	a
                                    637 ;	lib/src/stm8s_clk.c: 582: clockfrequency = HSI_VALUE >> HSIDivExp[tmp];
      0089EC 5F               [ 1]  638 	clrw	x
      0089ED 97               [ 1]  639 	ld	xl, a
      0089EE 1C 80 24         [ 2]  640 	addw	x, #(_HSIDivExp + 0)
      0089F1 F6               [ 1]  641 	ld	a, (x)
      0089F2 5F               [ 1]  642 	clrw	x
      0089F3 02               [ 1]  643 	rlwa	x
      0089F4 A6 24            [ 1]  644 	ld	a, #0x24
      0089F6 01               [ 1]  645 	rrwa	x
      0089F7 90 AE 00 F4      [ 2]  646 	ldw	y, #0x00f4
      0089FB 4D               [ 1]  647 	tnz	a
      0089FC 27 06            [ 1]  648 	jreq	00123$
      0089FE                        649 00122$:
      0089FE 90 54            [ 2]  650 	srlw	y
      008A00 56               [ 2]  651 	rrcw	x
      008A01 4A               [ 1]  652 	dec	a
      008A02 26 FA            [ 1]  653 	jrne	00122$
      008A04                        654 00123$:
      008A04 1F 03            [ 2]  655 	ldw	(0x03, sp), x
      008A06 17 01            [ 2]  656 	ldw	(0x01, sp), y
      008A08 20 1C            [ 2]  657 	jra	00106$
      008A0A                        658 00105$:
                                    659 ;	lib/src/stm8s_clk.c: 584: else if ( clocksource == CLK_SOURCE_LSI)
      008A0A 7B 04            [ 1]  660 	ld	a, (0x04, sp)
      008A0C A1 D2            [ 1]  661 	cp	a, #0xd2
      008A0E 26 0C            [ 1]  662 	jrne	00102$
                                    663 ;	lib/src/stm8s_clk.c: 586: clockfrequency = LSI_VALUE;
      008A10 AE F4 00         [ 2]  664 	ldw	x, #0xf400
      008A13 1F 03            [ 2]  665 	ldw	(0x03, sp), x
      008A15 AE 00 01         [ 2]  666 	ldw	x, #0x0001
      008A18 1F 01            [ 2]  667 	ldw	(0x01, sp), x
      008A1A 20 0A            [ 2]  668 	jra	00106$
      008A1C                        669 00102$:
                                    670 ;	lib/src/stm8s_clk.c: 590: clockfrequency = HSE_VALUE;
      008A1C AE 24 00         [ 2]  671 	ldw	x, #0x2400
      008A1F 1F 03            [ 2]  672 	ldw	(0x03, sp), x
      008A21 AE 00 F4         [ 2]  673 	ldw	x, #0x00f4
      008A24 1F 01            [ 2]  674 	ldw	(0x01, sp), x
      008A26                        675 00106$:
                                    676 ;	lib/src/stm8s_clk.c: 593: return((uint32_t)clockfrequency);
      008A26 1E 03            [ 2]  677 	ldw	x, (0x03, sp)
      008A28 16 01            [ 2]  678 	ldw	y, (0x01, sp)
                                    679 ;	lib/src/stm8s_clk.c: 594: }
      008A2A 5B 04            [ 2]  680 	addw	sp, #4
      008A2C 81               [ 4]  681 	ret
                                    682 ;	lib/src/stm8s_clk.c: 603: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    683 ;	-----------------------------------------
                                    684 ;	 function CLK_AdjustHSICalibrationValue
                                    685 ;	-----------------------------------------
      008A2D                        686 _CLK_AdjustHSICalibrationValue:
                                    687 ;	lib/src/stm8s_clk.c: 609: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      008A2D C6 50 CC         [ 1]  688 	ld	a, 0x50cc
      008A30 A4 F8            [ 1]  689 	and	a, #0xf8
      008A32 1A 03            [ 1]  690 	or	a, (0x03, sp)
      008A34 C7 50 CC         [ 1]  691 	ld	0x50cc, a
                                    692 ;	lib/src/stm8s_clk.c: 610: }
      008A37 81               [ 4]  693 	ret
                                    694 ;	lib/src/stm8s_clk.c: 621: void CLK_SYSCLKEmergencyClear(void)
                                    695 ;	-----------------------------------------
                                    696 ;	 function CLK_SYSCLKEmergencyClear
                                    697 ;	-----------------------------------------
      008A38                        698 _CLK_SYSCLKEmergencyClear:
                                    699 ;	lib/src/stm8s_clk.c: 623: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      008A38 72 11 50 C5      [ 1]  700 	bres	20677, #0
                                    701 ;	lib/src/stm8s_clk.c: 624: }
      008A3C 81               [ 4]  702 	ret
                                    703 ;	lib/src/stm8s_clk.c: 633: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    704 ;	-----------------------------------------
                                    705 ;	 function CLK_GetFlagStatus
                                    706 ;	-----------------------------------------
      008A3D                        707 _CLK_GetFlagStatus:
      008A3D 52 02            [ 2]  708 	sub	sp, #2
                                    709 ;	lib/src/stm8s_clk.c: 643: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      008A3F 1E 05            [ 2]  710 	ldw	x, (0x05, sp)
      008A41 4F               [ 1]  711 	clr	a
      008A42 97               [ 1]  712 	ld	xl, a
                                    713 ;	lib/src/stm8s_clk.c: 646: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      008A43 1F 01            [ 2]  714 	ldw	(0x01, sp), x
      008A45 A3 01 00         [ 2]  715 	cpw	x, #0x0100
      008A48 26 05            [ 1]  716 	jrne	00111$
                                    717 ;	lib/src/stm8s_clk.c: 648: tmpreg = CLK->ICKR;
      008A4A C6 50 C0         [ 1]  718 	ld	a, 0x50c0
      008A4D 20 27            [ 2]  719 	jra	00112$
      008A4F                        720 00111$:
                                    721 ;	lib/src/stm8s_clk.c: 650: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      008A4F 1E 01            [ 2]  722 	ldw	x, (0x01, sp)
      008A51 A3 02 00         [ 2]  723 	cpw	x, #0x0200
      008A54 26 05            [ 1]  724 	jrne	00108$
                                    725 ;	lib/src/stm8s_clk.c: 652: tmpreg = CLK->ECKR;
      008A56 C6 50 C1         [ 1]  726 	ld	a, 0x50c1
      008A59 20 1B            [ 2]  727 	jra	00112$
      008A5B                        728 00108$:
                                    729 ;	lib/src/stm8s_clk.c: 654: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      008A5B 1E 01            [ 2]  730 	ldw	x, (0x01, sp)
      008A5D A3 03 00         [ 2]  731 	cpw	x, #0x0300
      008A60 26 05            [ 1]  732 	jrne	00105$
                                    733 ;	lib/src/stm8s_clk.c: 656: tmpreg = CLK->SWCR;
      008A62 C6 50 C5         [ 1]  734 	ld	a, 0x50c5
      008A65 20 0F            [ 2]  735 	jra	00112$
      008A67                        736 00105$:
                                    737 ;	lib/src/stm8s_clk.c: 658: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      008A67 1E 01            [ 2]  738 	ldw	x, (0x01, sp)
      008A69 A3 04 00         [ 2]  739 	cpw	x, #0x0400
      008A6C 26 05            [ 1]  740 	jrne	00102$
                                    741 ;	lib/src/stm8s_clk.c: 660: tmpreg = CLK->CSSR;
      008A6E C6 50 C8         [ 1]  742 	ld	a, 0x50c8
      008A71 20 03            [ 2]  743 	jra	00112$
      008A73                        744 00102$:
                                    745 ;	lib/src/stm8s_clk.c: 664: tmpreg = CLK->CCOR;
      008A73 C6 50 C9         [ 1]  746 	ld	a, 0x50c9
      008A76                        747 00112$:
                                    748 ;	lib/src/stm8s_clk.c: 667: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      008A76 88               [ 1]  749 	push	a
      008A77 7B 07            [ 1]  750 	ld	a, (0x07, sp)
      008A79 6B 03            [ 1]  751 	ld	(0x03, sp), a
      008A7B 84               [ 1]  752 	pop	a
      008A7C 14 02            [ 1]  753 	and	a, (0x02, sp)
      008A7E 27 03            [ 1]  754 	jreq	00114$
                                    755 ;	lib/src/stm8s_clk.c: 669: bitstatus = SET;
      008A80 A6 01            [ 1]  756 	ld	a, #0x01
                                    757 ;	lib/src/stm8s_clk.c: 673: bitstatus = RESET;
      008A82 21                     758 	.byte 0x21
      008A83                        759 00114$:
      008A83 4F               [ 1]  760 	clr	a
      008A84                        761 00115$:
                                    762 ;	lib/src/stm8s_clk.c: 677: return((FlagStatus)bitstatus);
                                    763 ;	lib/src/stm8s_clk.c: 678: }
      008A84 5B 02            [ 2]  764 	addw	sp, #2
      008A86 81               [ 4]  765 	ret
                                    766 ;	lib/src/stm8s_clk.c: 686: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    767 ;	-----------------------------------------
                                    768 ;	 function CLK_GetITStatus
                                    769 ;	-----------------------------------------
      008A87                        770 _CLK_GetITStatus:
                                    771 ;	lib/src/stm8s_clk.c: 693: if (CLK_IT == CLK_IT_SWIF)
      008A87 7B 03            [ 1]  772 	ld	a, (0x03, sp)
      008A89 A1 1C            [ 1]  773 	cp	a, #0x1c
      008A8B 26 0D            [ 1]  774 	jrne	00108$
                                    775 ;	lib/src/stm8s_clk.c: 696: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      008A8D C6 50 C5         [ 1]  776 	ld	a, 0x50c5
      008A90 14 03            [ 1]  777 	and	a, (0x03, sp)
                                    778 ;	lib/src/stm8s_clk.c: 698: bitstatus = SET;
      008A92 A0 0C            [ 1]  779 	sub	a, #0x0c
      008A94 26 02            [ 1]  780 	jrne	00102$
      008A96 4C               [ 1]  781 	inc	a
      008A97 81               [ 4]  782 	ret
      008A98                        783 00102$:
                                    784 ;	lib/src/stm8s_clk.c: 702: bitstatus = RESET;
      008A98 4F               [ 1]  785 	clr	a
      008A99 81               [ 4]  786 	ret
      008A9A                        787 00108$:
                                    788 ;	lib/src/stm8s_clk.c: 708: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      008A9A C6 50 C8         [ 1]  789 	ld	a, 0x50c8
      008A9D 14 03            [ 1]  790 	and	a, (0x03, sp)
                                    791 ;	lib/src/stm8s_clk.c: 710: bitstatus = SET;
      008A9F A0 0C            [ 1]  792 	sub	a, #0x0c
      008AA1 26 02            [ 1]  793 	jrne	00105$
      008AA3 4C               [ 1]  794 	inc	a
      008AA4 81               [ 4]  795 	ret
      008AA5                        796 00105$:
                                    797 ;	lib/src/stm8s_clk.c: 714: bitstatus = RESET;
      008AA5 4F               [ 1]  798 	clr	a
                                    799 ;	lib/src/stm8s_clk.c: 719: return bitstatus;
                                    800 ;	lib/src/stm8s_clk.c: 720: }
      008AA6 81               [ 4]  801 	ret
                                    802 ;	lib/src/stm8s_clk.c: 728: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    803 ;	-----------------------------------------
                                    804 ;	 function CLK_ClearITPendingBit
                                    805 ;	-----------------------------------------
      008AA7                        806 _CLK_ClearITPendingBit:
                                    807 ;	lib/src/stm8s_clk.c: 733: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      008AA7 7B 03            [ 1]  808 	ld	a, (0x03, sp)
      008AA9 A1 0C            [ 1]  809 	cp	a, #0x0c
      008AAB 26 05            [ 1]  810 	jrne	00102$
                                    811 ;	lib/src/stm8s_clk.c: 736: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      008AAD 72 17 50 C8      [ 1]  812 	bres	20680, #3
      008AB1 81               [ 4]  813 	ret
      008AB2                        814 00102$:
                                    815 ;	lib/src/stm8s_clk.c: 741: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      008AB2 72 17 50 C5      [ 1]  816 	bres	20677, #3
                                    817 ;	lib/src/stm8s_clk.c: 744: }
      008AB6 81               [ 4]  818 	ret
                                    819 	.area CODE
                                    820 	.area CONST
      008024                        821 _HSIDivExp:
      008024 00                     822 	.db #0x00	; 0
      008025 01                     823 	.db #0x01	; 1
      008026 02                     824 	.db #0x02	; 2
      008027 03                     825 	.db #0x03	; 3
      008028                        826 _CLKPrescTable:
      008028 01                     827 	.db #0x01	; 1
      008029 02                     828 	.db #0x02	; 2
      00802A 04                     829 	.db #0x04	; 4
      00802B 08                     830 	.db #0x08	; 8
      00802C 0A                     831 	.db #0x0a	; 10
      00802D 10                     832 	.db #0x10	; 16
      00802E 14                     833 	.db #0x14	; 20
      00802F 28                     834 	.db #0x28	; 40
                                    835 	.area INITIALIZER
                                    836 	.area CABS (ABS)
