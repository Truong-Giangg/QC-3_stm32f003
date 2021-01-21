                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _INOV
                                     13 	.globl _dec200mv
                                     14 	.globl _inc200mv
                                     15 	.globl _volt12
                                     16 	.globl _volt9
                                     17 	.globl _volt5
                                     18 	.globl _EEROM_INIT
                                     19 	.globl _TIM4_ClearFlag
                                     20 	.globl _TIM4_GetFlagStatus
                                     21 	.globl _TIM4_SetCounter
                                     22 	.globl _TIM4_Cmd
                                     23 	.globl _TIM4_TimeBaseInit
                                     24 	.globl _GPIO_ReadInputPin
                                     25 	.globl _GPIO_Init
                                     26 	.globl _GPIO_DeInit
                                     27 	.globl _FLASH_SetProgrammingTime
                                     28 	.globl _FLASH_ReadByte
                                     29 	.globl _FLASH_ProgramByte
                                     30 	.globl _FLASH_DeInit
                                     31 	.globl _FLASH_Unlock
                                     32 	.globl _CLK_HSIPrescalerConfig
                                     33 	.globl _dem2
                                     34 	.globl _dem1
                                     35 	.globl _changed
                                     36 	.globl _t1
                                     37 	.globl _t
                                     38 	.globl _eep1
                                     39 	.globl _eepselect
                                     40 	.globl _eepdata
                                     41 	.globl _delay_ms
                                     42 ;--------------------------------------------------------
                                     43 ; ram data
                                     44 ;--------------------------------------------------------
                                     45 	.area DATA
      000001                         46 _eepdata::
      000001                         47 	.ds 1
      000002                         48 _eepselect::
      000002                         49 	.ds 1
      000003                         50 _eep1::
      000003                         51 	.ds 1
      000004                         52 _t::
      000004                         53 	.ds 1
      000005                         54 _t1::
      000005                         55 	.ds 1
                                     56 ;--------------------------------------------------------
                                     57 ; ram data
                                     58 ;--------------------------------------------------------
                                     59 	.area INITIALIZED
      000006                         60 _changed::
      000006                         61 	.ds 2
      000008                         62 _dem1::
      000008                         63 	.ds 2
      00000A                         64 _dem2::
      00000A                         65 	.ds 1
                                     66 ;--------------------------------------------------------
                                     67 ; Stack segment in internal ram 
                                     68 ;--------------------------------------------------------
                                     69 	.area	SSEG
      FFFFFF                         70 __start__stack:
      FFFFFF                         71 	.ds	1
                                     72 
                                     73 ;--------------------------------------------------------
                                     74 ; absolute external ram data
                                     75 ;--------------------------------------------------------
                                     76 	.area DABS (ABS)
                                     77 
                                     78 ; default segment ordering for linker
                                     79 	.area HOME
                                     80 	.area GSINIT
                                     81 	.area GSFINAL
                                     82 	.area CONST
                                     83 	.area INITIALIZER
                                     84 	.area CODE
                                     85 
                                     86 ;--------------------------------------------------------
                                     87 ; interrupt vector 
                                     88 ;--------------------------------------------------------
                                     89 	.area HOME
      008000                         90 __interrupt_vect:
      008000 82 00 80 07             91 	int s_GSINIT ; reset
                                     92 ;--------------------------------------------------------
                                     93 ; global & static initialisations
                                     94 ;--------------------------------------------------------
                                     95 	.area HOME
                                     96 	.area GSINIT
                                     97 	.area GSFINAL
                                     98 	.area GSINIT
      008007                         99 __sdcc_gs_init_startup:
      008007                        100 __sdcc_init_data:
                                    101 ; stm8_genXINIT() start
      008007 AE 00 05         [ 2]  102 	ldw x, #l_DATA
      00800A 27 07            [ 1]  103 	jreq	00002$
      00800C                        104 00001$:
      00800C 72 4F 00 00      [ 1]  105 	clr (s_DATA - 1, x)
      008010 5A               [ 2]  106 	decw x
      008011 26 F9            [ 1]  107 	jrne	00001$
      008013                        108 00002$:
      008013 AE 00 05         [ 2]  109 	ldw	x, #l_INITIALIZER
      008016 27 09            [ 1]  110 	jreq	00004$
      008018                        111 00003$:
      008018 D6 80 2F         [ 1]  112 	ld	a, (s_INITIALIZER - 1, x)
      00801B D7 00 05         [ 1]  113 	ld	(s_INITIALIZED - 1, x), a
      00801E 5A               [ 2]  114 	decw	x
      00801F 26 F7            [ 1]  115 	jrne	00003$
      008021                        116 00004$:
                                    117 ; stm8_genXINIT() end
                                    118 	.area GSFINAL
      008021 CC 80 04         [ 2]  119 	jp	__sdcc_program_startup
                                    120 ;--------------------------------------------------------
                                    121 ; Home
                                    122 ;--------------------------------------------------------
                                    123 	.area HOME
                                    124 	.area HOME
      008004                        125 __sdcc_program_startup:
      008004 CC 84 20         [ 2]  126 	jp	_main
                                    127 ;	return from main will return to caller
                                    128 ;--------------------------------------------------------
                                    129 ; code
                                    130 ;--------------------------------------------------------
                                    131 	.area CODE
                                    132 ;	main.c: 23: void delay_ms(uint16_t u16Delay)
                                    133 ;	-----------------------------------------
                                    134 ;	 function delay_ms
                                    135 ;	-----------------------------------------
      008035                        136 _delay_ms:
      008035 52 02            [ 2]  137 	sub	sp, #2
                                    138 ;	main.c: 25: while (u16Delay) {
      008037 16 05            [ 2]  139 	ldw	y, (0x05, sp)
      008039 17 01            [ 2]  140 	ldw	(0x01, sp), y
      00803B                        141 00104$:
      00803B 1E 01            [ 2]  142 	ldw	x, (0x01, sp)
      00803D 27 1D            [ 1]  143 	jreq	00107$
                                    144 ;	main.c: 26: TIM4_SetCounter(0);
      00803F 4B 00            [ 1]  145 	push	#0x00
      008041 CD 87 29         [ 4]  146 	call	_TIM4_SetCounter
      008044 84               [ 1]  147 	pop	a
                                    148 ;	main.c: 27: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
      008045 4B 01            [ 1]  149 	push	#0x01
      008047 CD 87 4B         [ 4]  150 	call	_TIM4_ClearFlag
      00804A 84               [ 1]  151 	pop	a
                                    152 ;	main.c: 28: while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
      00804B                        153 00101$:
      00804B 4B 01            [ 1]  154 	push	#0x01
      00804D CD 87 3F         [ 4]  155 	call	_TIM4_GetFlagStatus
      008050 5B 01            [ 2]  156 	addw	sp, #1
      008052 4D               [ 1]  157 	tnz	a
      008053 27 F6            [ 1]  158 	jreq	00101$
                                    159 ;	main.c: 30: --u16Delay;
      008055 1E 01            [ 2]  160 	ldw	x, (0x01, sp)
      008057 5A               [ 2]  161 	decw	x
      008058 1F 01            [ 2]  162 	ldw	(0x01, sp), x
      00805A 20 DF            [ 2]  163 	jra	00104$
      00805C                        164 00107$:
                                    165 ;	main.c: 32: }
      00805C 5B 02            [ 2]  166 	addw	sp, #2
      00805E 81               [ 4]  167 	ret
                                    168 ;	main.c: 33: void EEROM_INIT(void){
                                    169 ;	-----------------------------------------
                                    170 ;	 function EEROM_INIT
                                    171 ;	-----------------------------------------
      00805F                        172 _EEROM_INIT:
                                    173 ;	main.c: 34: FLASH_DeInit();
      00805F CD 8A D8         [ 4]  174 	call	_FLASH_DeInit
                                    175 ;	main.c: 35: FLASH_Unlock(FLASH_MEMTYPE_DATA);
      008062 4B F7            [ 1]  176 	push	#0xf7
      008064 CD 8A B7         [ 4]  177 	call	_FLASH_Unlock
      008067 84               [ 1]  178 	pop	a
                                    179 ;	main.c: 36: FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
      008068 4B 00            [ 1]  180 	push	#0x00
      00806A CD 8B F8         [ 4]  181 	call	_FLASH_SetProgrammingTime
      00806D 84               [ 1]  182 	pop	a
                                    183 ;	main.c: 37: }
      00806E 81               [ 4]  184 	ret
                                    185 ;	main.c: 38: void volt5(void){
                                    186 ;	-----------------------------------------
                                    187 ;	 function volt5
                                    188 ;	-----------------------------------------
      00806F                        189 _volt5:
                                    190 ;	main.c: 39: GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);	//d+ = 0.6v
      00806F 4B 00            [ 1]  191 	push	#0x00
      008071 4B 20            [ 1]  192 	push	#0x20
      008073 4B 0A            [ 1]  193 	push	#0x0a
      008075 4B 50            [ 1]  194 	push	#0x50
      008077 CD 85 B0         [ 4]  195 	call	_GPIO_Init
      00807A 5B 04            [ 2]  196 	addw	sp, #4
                                    197 ;	main.c: 40: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_LOW_FAST);	//d- = 0v
      00807C 4B E0            [ 1]  198 	push	#0xe0
      00807E 4B 40            [ 1]  199 	push	#0x40
      008080 4B 0A            [ 1]  200 	push	#0x0a
      008082 4B 50            [ 1]  201 	push	#0x50
      008084 CD 85 B0         [ 4]  202 	call	_GPIO_Init
      008087 5B 04            [ 2]  203 	addw	sp, #4
                                    204 ;	main.c: 41: GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);	//led 3 on
      008089 4B F0            [ 1]  205 	push	#0xf0
      00808B 4B 08            [ 1]  206 	push	#0x08
      00808D 4B 0A            [ 1]  207 	push	#0x0a
      00808F 4B 50            [ 1]  208 	push	#0x50
      008091 CD 85 B0         [ 4]  209 	call	_GPIO_Init
      008094 5B 04            [ 2]  210 	addw	sp, #4
                                    211 ;	main.c: 42: GPIO_Init(GPIOD, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST);	//led 1 off
      008096 4B E0            [ 1]  212 	push	#0xe0
      008098 4B 02            [ 1]  213 	push	#0x02
      00809A 4B 0F            [ 1]  214 	push	#0x0f
      00809C 4B 50            [ 1]  215 	push	#0x50
      00809E CD 85 B0         [ 4]  216 	call	_GPIO_Init
      0080A1 5B 04            [ 2]  217 	addw	sp, #4
                                    218 ;	main.c: 43: GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);	//led 4 off
      0080A3 4B E0            [ 1]  219 	push	#0xe0
      0080A5 4B 10            [ 1]  220 	push	#0x10
      0080A7 4B 0A            [ 1]  221 	push	#0x0a
      0080A9 4B 50            [ 1]  222 	push	#0x50
      0080AB CD 85 B0         [ 4]  223 	call	_GPIO_Init
      0080AE 5B 04            [ 2]  224 	addw	sp, #4
                                    225 ;	main.c: 44: EEROM_INIT();
      0080B0 CD 80 5F         [ 4]  226 	call	_EEROM_INIT
                                    227 ;	main.c: 45: FLASH_ProgramByte(0X4000, 0X25);		//0x4000 address is the first eeprom address
      0080B3 4B 25            [ 1]  228 	push	#0x25
      0080B5 4B 00            [ 1]  229 	push	#0x00
      0080B7 4B 40            [ 1]  230 	push	#0x40
      0080B9 5F               [ 1]  231 	clrw	x
      0080BA 89               [ 2]  232 	pushw	x
      0080BB CD 8B 07         [ 4]  233 	call	_FLASH_ProgramByte
      0080BE 5B 05            [ 2]  234 	addw	sp, #5
                                    235 ;	main.c: 46: delay_ms(20);
      0080C0 4B 14            [ 1]  236 	push	#0x14
      0080C2 4B 00            [ 1]  237 	push	#0x00
      0080C4 CD 80 35         [ 4]  238 	call	_delay_ms
      0080C7 5B 02            [ 2]  239 	addw	sp, #2
                                    240 ;	main.c: 47: FLASH_ProgramByte(0X4001, 0X00);		//0x4001 address is the second eeprom address
      0080C9 4B 00            [ 1]  241 	push	#0x00
      0080CB 4B 01            [ 1]  242 	push	#0x01
      0080CD 4B 40            [ 1]  243 	push	#0x40
      0080CF 5F               [ 1]  244 	clrw	x
      0080D0 89               [ 2]  245 	pushw	x
      0080D1 CD 8B 07         [ 4]  246 	call	_FLASH_ProgramByte
      0080D4 5B 05            [ 2]  247 	addw	sp, #5
                                    248 ;	main.c: 49: }
      0080D6 81               [ 4]  249 	ret
                                    250 ;	main.c: 50: void volt9(void){
                                    251 ;	-----------------------------------------
                                    252 ;	 function volt9
                                    253 ;	-----------------------------------------
      0080D7                        254 _volt9:
                                    255 ;	main.c: 51: GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);	//d+ = 3.3v
      0080D7 4B F0            [ 1]  256 	push	#0xf0
      0080D9 4B 20            [ 1]  257 	push	#0x20
      0080DB 4B 0A            [ 1]  258 	push	#0x0a
      0080DD 4B 50            [ 1]  259 	push	#0x50
      0080DF CD 85 B0         [ 4]  260 	call	_GPIO_Init
      0080E2 5B 04            [ 2]  261 	addw	sp, #4
                                    262 ;	main.c: 52: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);	//d- = 0.6v
      0080E4 4B 00            [ 1]  263 	push	#0x00
      0080E6 4B 40            [ 1]  264 	push	#0x40
      0080E8 4B 0A            [ 1]  265 	push	#0x0a
      0080EA 4B 50            [ 1]  266 	push	#0x50
      0080EC CD 85 B0         [ 4]  267 	call	_GPIO_Init
      0080EF 5B 04            [ 2]  268 	addw	sp, #4
                                    269 ;	main.c: 53: GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);	//led 2 on
      0080F1 4B F0            [ 1]  270 	push	#0xf0
      0080F3 4B 08            [ 1]  271 	push	#0x08
      0080F5 4B 0F            [ 1]  272 	push	#0x0f
      0080F7 4B 50            [ 1]  273 	push	#0x50
      0080F9 CD 85 B0         [ 4]  274 	call	_GPIO_Init
      0080FC 5B 04            [ 2]  275 	addw	sp, #4
                                    276 ;	main.c: 54: GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);	//led 4 off
      0080FE 4B E0            [ 1]  277 	push	#0xe0
      008100 4B 10            [ 1]  278 	push	#0x10
      008102 4B 0A            [ 1]  279 	push	#0x0a
      008104 4B 50            [ 1]  280 	push	#0x50
      008106 CD 85 B0         [ 4]  281 	call	_GPIO_Init
      008109 5B 04            [ 2]  282 	addw	sp, #4
                                    283 ;	main.c: 55: GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);	//led 3 off
      00810B 4B E0            [ 1]  284 	push	#0xe0
      00810D 4B 08            [ 1]  285 	push	#0x08
      00810F 4B 0A            [ 1]  286 	push	#0x0a
      008111 4B 50            [ 1]  287 	push	#0x50
      008113 CD 85 B0         [ 4]  288 	call	_GPIO_Init
      008116 5B 04            [ 2]  289 	addw	sp, #4
                                    290 ;	main.c: 56: EEROM_INIT();
      008118 CD 80 5F         [ 4]  291 	call	_EEROM_INIT
                                    292 ;	main.c: 57: FLASH_ProgramByte(0X4000, 0X45);		//0x4000 address is the first eeprom address
      00811B 4B 45            [ 1]  293 	push	#0x45
      00811D 4B 00            [ 1]  294 	push	#0x00
      00811F 4B 40            [ 1]  295 	push	#0x40
      008121 5F               [ 1]  296 	clrw	x
      008122 89               [ 2]  297 	pushw	x
      008123 CD 8B 07         [ 4]  298 	call	_FLASH_ProgramByte
      008126 5B 05            [ 2]  299 	addw	sp, #5
                                    300 ;	main.c: 58: delay_ms(20);
      008128 4B 14            [ 1]  301 	push	#0x14
      00812A 4B 00            [ 1]  302 	push	#0x00
      00812C CD 80 35         [ 4]  303 	call	_delay_ms
      00812F 5B 02            [ 2]  304 	addw	sp, #2
                                    305 ;	main.c: 59: FLASH_ProgramByte(0X4001, 0X00);		//0x4000 address is the first eeprom address
      008131 4B 00            [ 1]  306 	push	#0x00
      008133 4B 01            [ 1]  307 	push	#0x01
      008135 4B 40            [ 1]  308 	push	#0x40
      008137 5F               [ 1]  309 	clrw	x
      008138 89               [ 2]  310 	pushw	x
      008139 CD 8B 07         [ 4]  311 	call	_FLASH_ProgramByte
      00813C 5B 05            [ 2]  312 	addw	sp, #5
                                    313 ;	main.c: 61: }
      00813E 81               [ 4]  314 	ret
                                    315 ;	main.c: 62: void volt12(void){
                                    316 ;	-----------------------------------------
                                    317 ;	 function volt12
                                    318 ;	-----------------------------------------
      00813F                        319 _volt12:
                                    320 ;	main.c: 63: GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);	//d+ = 0.6v
      00813F 4B 00            [ 1]  321 	push	#0x00
      008141 4B 20            [ 1]  322 	push	#0x20
      008143 4B 0A            [ 1]  323 	push	#0x0a
      008145 4B 50            [ 1]  324 	push	#0x50
      008147 CD 85 B0         [ 4]  325 	call	_GPIO_Init
      00814A 5B 04            [ 2]  326 	addw	sp, #4
                                    327 ;	main.c: 64: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);	//d- = 0.6v
      00814C 4B 00            [ 1]  328 	push	#0x00
      00814E 4B 40            [ 1]  329 	push	#0x40
      008150 4B 0A            [ 1]  330 	push	#0x0a
      008152 4B 50            [ 1]  331 	push	#0x50
      008154 CD 85 B0         [ 4]  332 	call	_GPIO_Init
      008157 5B 04            [ 2]  333 	addw	sp, #4
                                    334 ;	main.c: 65: GPIO_Init(GPIOD, GPIO_PIN_1, GPIO_MODE_OUT_PP_HIGH_FAST);	//led 1 on
      008159 4B F0            [ 1]  335 	push	#0xf0
      00815B 4B 02            [ 1]  336 	push	#0x02
      00815D 4B 0F            [ 1]  337 	push	#0x0f
      00815F 4B 50            [ 1]  338 	push	#0x50
      008161 CD 85 B0         [ 4]  339 	call	_GPIO_Init
      008164 5B 04            [ 2]  340 	addw	sp, #4
                                    341 ;	main.c: 66: GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);	//led 2 off
      008166 4B E0            [ 1]  342 	push	#0xe0
      008168 4B 08            [ 1]  343 	push	#0x08
      00816A 4B 0F            [ 1]  344 	push	#0x0f
      00816C 4B 50            [ 1]  345 	push	#0x50
      00816E CD 85 B0         [ 4]  346 	call	_GPIO_Init
      008171 5B 04            [ 2]  347 	addw	sp, #4
                                    348 ;	main.c: 67: EEROM_INIT();
      008173 CD 80 5F         [ 4]  349 	call	_EEROM_INIT
                                    350 ;	main.c: 68: FLASH_ProgramByte(0X4000, 0X60);		//0x4000 address is the first eeprom address
      008176 4B 60            [ 1]  351 	push	#0x60
      008178 4B 00            [ 1]  352 	push	#0x00
      00817A 4B 40            [ 1]  353 	push	#0x40
      00817C 5F               [ 1]  354 	clrw	x
      00817D 89               [ 2]  355 	pushw	x
      00817E CD 8B 07         [ 4]  356 	call	_FLASH_ProgramByte
      008181 5B 05            [ 2]  357 	addw	sp, #5
                                    358 ;	main.c: 69: delay_ms(20);
      008183 4B 14            [ 1]  359 	push	#0x14
      008185 4B 00            [ 1]  360 	push	#0x00
      008187 CD 80 35         [ 4]  361 	call	_delay_ms
      00818A 5B 02            [ 2]  362 	addw	sp, #2
                                    363 ;	main.c: 70: FLASH_ProgramByte(0X4001, 0X00);
      00818C 4B 00            [ 1]  364 	push	#0x00
      00818E 4B 01            [ 1]  365 	push	#0x01
      008190 4B 40            [ 1]  366 	push	#0x40
      008192 5F               [ 1]  367 	clrw	x
      008193 89               [ 2]  368 	pushw	x
      008194 CD 8B 07         [ 4]  369 	call	_FLASH_ProgramByte
      008197 5B 05            [ 2]  370 	addw	sp, #5
                                    371 ;	main.c: 71: }
      008199 81               [ 4]  372 	ret
                                    373 ;	main.c: 72: void inc200mv(){        //3.3v to 0.6v -> increase 200mv 
                                    374 ;	-----------------------------------------
                                    375 ;	 function inc200mv
                                    376 ;	-----------------------------------------
      00819A                        377 _inc200mv:
                                    378 ;	main.c: 73: GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);	//d+ = 3.3v
      00819A 4B F0            [ 1]  379 	push	#0xf0
      00819C 4B 20            [ 1]  380 	push	#0x20
      00819E 4B 0A            [ 1]  381 	push	#0x0a
      0081A0 4B 50            [ 1]  382 	push	#0x50
      0081A2 CD 85 B0         [ 4]  383 	call	_GPIO_Init
      0081A5 5B 04            [ 2]  384 	addw	sp, #4
                                    385 ;	main.c: 74: delay_ms(20);
      0081A7 4B 14            [ 1]  386 	push	#0x14
      0081A9 4B 00            [ 1]  387 	push	#0x00
      0081AB CD 80 35         [ 4]  388 	call	_delay_ms
      0081AE 5B 02            [ 2]  389 	addw	sp, #2
                                    390 ;	main.c: 75: GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);	//d+ = 0.6v
      0081B0 4B 00            [ 1]  391 	push	#0x00
      0081B2 4B 20            [ 1]  392 	push	#0x20
      0081B4 4B 0A            [ 1]  393 	push	#0x0a
      0081B6 4B 50            [ 1]  394 	push	#0x50
      0081B8 CD 85 B0         [ 4]  395 	call	_GPIO_Init
      0081BB 5B 04            [ 2]  396 	addw	sp, #4
                                    397 ;	main.c: 76: delay_ms(20);
      0081BD 4B 14            [ 1]  398 	push	#0x14
      0081BF 4B 00            [ 1]  399 	push	#0x00
      0081C1 CD 80 35         [ 4]  400 	call	_delay_ms
      0081C4 5B 02            [ 2]  401 	addw	sp, #2
                                    402 ;	main.c: 77: }
      0081C6 81               [ 4]  403 	ret
                                    404 ;	main.c: 78: void dec200mv(){        //0.6v to 3.3v -> decrease 200mv 
                                    405 ;	-----------------------------------------
                                    406 ;	 function dec200mv
                                    407 ;	-----------------------------------------
      0081C7                        408 _dec200mv:
                                    409 ;	main.c: 79: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);	//d- = 0.6v
      0081C7 4B 00            [ 1]  410 	push	#0x00
      0081C9 4B 40            [ 1]  411 	push	#0x40
      0081CB 4B 0A            [ 1]  412 	push	#0x0a
      0081CD 4B 50            [ 1]  413 	push	#0x50
      0081CF CD 85 B0         [ 4]  414 	call	_GPIO_Init
      0081D2 5B 04            [ 2]  415 	addw	sp, #4
                                    416 ;	main.c: 80: delay_ms(20);
      0081D4 4B 14            [ 1]  417 	push	#0x14
      0081D6 4B 00            [ 1]  418 	push	#0x00
      0081D8 CD 80 35         [ 4]  419 	call	_delay_ms
      0081DB 5B 02            [ 2]  420 	addw	sp, #2
                                    421 ;	main.c: 81: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST);	//d+ = 3.3v
      0081DD 4B F0            [ 1]  422 	push	#0xf0
      0081DF 4B 40            [ 1]  423 	push	#0x40
      0081E1 4B 0A            [ 1]  424 	push	#0x0a
      0081E3 4B 50            [ 1]  425 	push	#0x50
      0081E5 CD 85 B0         [ 4]  426 	call	_GPIO_Init
      0081E8 5B 04            [ 2]  427 	addw	sp, #4
                                    428 ;	main.c: 82: delay_ms(20);    
      0081EA 4B 14            [ 1]  429 	push	#0x14
      0081EC 4B 00            [ 1]  430 	push	#0x00
      0081EE CD 80 35         [ 4]  431 	call	_delay_ms
      0081F1 5B 02            [ 2]  432 	addw	sp, #2
                                    433 ;	main.c: 83: }
      0081F3 81               [ 4]  434 	ret
                                    435 ;	main.c: 84: void INOV(void){
                                    436 ;	-----------------------------------------
                                    437 ;	 function INOV
                                    438 ;	-----------------------------------------
      0081F4                        439 _INOV:
      0081F4 52 04            [ 2]  440 	sub	sp, #4
                                    441 ;	main.c: 86: GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);	//d+ = 0.6v
      0081F6 4B 00            [ 1]  442 	push	#0x00
      0081F8 4B 20            [ 1]  443 	push	#0x20
      0081FA 4B 0A            [ 1]  444 	push	#0x0a
      0081FC 4B 50            [ 1]  445 	push	#0x50
      0081FE CD 85 B0         [ 4]  446 	call	_GPIO_Init
      008201 5B 04            [ 2]  447 	addw	sp, #4
                                    448 ;	main.c: 87: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_LOW_FAST);	//d- = 0v
      008203 4B E0            [ 1]  449 	push	#0xe0
      008205 4B 40            [ 1]  450 	push	#0x40
      008207 4B 0A            [ 1]  451 	push	#0x0a
      008209 4B 50            [ 1]  452 	push	#0x50
      00820B CD 85 B0         [ 4]  453 	call	_GPIO_Init
      00820E 5B 04            [ 2]  454 	addw	sp, #4
                                    455 ;	main.c: 89: delay_ms(500);
      008210 4B F4            [ 1]  456 	push	#0xf4
      008212 4B 01            [ 1]  457 	push	#0x01
      008214 CD 80 35         [ 4]  458 	call	_delay_ms
      008217 5B 02            [ 2]  459 	addw	sp, #2
                                    460 ;	main.c: 90: GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);	//d+ = 0.6v
      008219 4B 00            [ 1]  461 	push	#0x00
      00821B 4B 20            [ 1]  462 	push	#0x20
      00821D 4B 0A            [ 1]  463 	push	#0x0a
      00821F 4B 50            [ 1]  464 	push	#0x50
      008221 CD 85 B0         [ 4]  465 	call	_GPIO_Init
      008224 5B 04            [ 2]  466 	addw	sp, #4
                                    467 ;	main.c: 91: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST);	//d- = 3.3v
      008226 4B F0            [ 1]  468 	push	#0xf0
      008228 4B 40            [ 1]  469 	push	#0x40
      00822A 4B 0A            [ 1]  470 	push	#0x0a
      00822C 4B 50            [ 1]  471 	push	#0x50
      00822E CD 85 B0         [ 4]  472 	call	_GPIO_Init
      008231 5B 04            [ 2]  473 	addw	sp, #4
                                    474 ;	main.c: 92: GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_HIGH_FAST);	//led 4 on
      008233 4B F0            [ 1]  475 	push	#0xf0
      008235 4B 10            [ 1]  476 	push	#0x10
      008237 4B 0A            [ 1]  477 	push	#0x0a
      008239 4B 50            [ 1]  478 	push	#0x50
      00823B CD 85 B0         [ 4]  479 	call	_GPIO_Init
      00823E 5B 04            [ 2]  480 	addw	sp, #4
                                    481 ;	main.c: 93: GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);	//led 3 off
      008240 4B E0            [ 1]  482 	push	#0xe0
      008242 4B 08            [ 1]  483 	push	#0x08
      008244 4B 0A            [ 1]  484 	push	#0x0a
      008246 4B 50            [ 1]  485 	push	#0x50
      008248 CD 85 B0         [ 4]  486 	call	_GPIO_Init
      00824B 5B 04            [ 2]  487 	addw	sp, #4
                                    488 ;	main.c: 95: if(changed == 0){           //the first time controller run
      00824D CE 00 06         [ 2]  489 	ldw	x, _changed+0
      008250 27 03            [ 1]  490 	jreq	00215$
      008252 CC 82 FF         [ 2]  491 	jp	00109$
      008255                        492 00215$:
                                    493 ;	main.c: 96: EEROM_INIT();
      008255 CD 80 5F         [ 4]  494 	call	_EEROM_INIT
                                    495 ;	main.c: 97: FLASH_ProgramByte(0X4001, 0X01);		//0x4000 address is the first eeprom address
      008258 4B 01            [ 1]  496 	push	#0x01
      00825A 4B 01            [ 1]  497 	push	#0x01
      00825C 4B 40            [ 1]  498 	push	#0x40
      00825E 5F               [ 1]  499 	clrw	x
      00825F 89               [ 2]  500 	pushw	x
      008260 CD 8B 07         [ 4]  501 	call	_FLASH_ProgramByte
      008263 5B 05            [ 2]  502 	addw	sp, #5
                                    503 ;	main.c: 98: delay_ms(20);   //delay20ms
      008265 4B 14            [ 1]  504 	push	#0x14
      008267 4B 00            [ 1]  505 	push	#0x00
      008269 CD 80 35         [ 4]  506 	call	_delay_ms
      00826C 5B 02            [ 2]  507 	addw	sp, #2
                                    508 ;	main.c: 99: FLASH_ProgramByte(0X4000, 0X25);		//0x4000 address is the first eeprom address
      00826E 4B 25            [ 1]  509 	push	#0x25
      008270 4B 00            [ 1]  510 	push	#0x00
      008272 4B 40            [ 1]  511 	push	#0x40
      008274 5F               [ 1]  512 	clrw	x
      008275 89               [ 2]  513 	pushw	x
      008276 CD 8B 07         [ 4]  514 	call	_FLASH_ProgramByte
      008279 5B 05            [ 2]  515 	addw	sp, #5
                                    516 ;	main.c: 100: delay_ms(500);   //delay 0.5s button delay
      00827B 4B F4            [ 1]  517 	push	#0xf4
      00827D 4B 01            [ 1]  518 	push	#0x01
      00827F CD 80 35         [ 4]  519 	call	_delay_ms
      008282 5B 02            [ 2]  520 	addw	sp, #2
                                    521 ;	main.c: 101: while(GPIO_ReadInputPin(GPIOD,GPIO_PIN_4)!=0){          // out loop if RA2 = 0 (press mode button)
      008284                        522 00105$:
      008284 4B 10            [ 1]  523 	push	#0x10
      008286 4B 0F            [ 1]  524 	push	#0x0f
      008288 4B 50            [ 1]  525 	push	#0x50
      00828A CD 86 50         [ 4]  526 	call	_GPIO_ReadInputPin
      00828D 5B 03            [ 2]  527 	addw	sp, #3
      00828F 4D               [ 1]  528 	tnz	a
      008290 27 6A            [ 1]  529 	jreq	00107$
                                    530 ;	main.c: 102: if(GPIO_ReadInputPin(GPIOD,GPIO_PIN_5)==0){         // increase 0,2V if we press button 2
      008292 4B 20            [ 1]  531 	push	#0x20
      008294 4B 0F            [ 1]  532 	push	#0x0f
      008296 4B 50            [ 1]  533 	push	#0x50
      008298 CD 86 50         [ 4]  534 	call	_GPIO_ReadInputPin
      00829B 5B 03            [ 2]  535 	addw	sp, #3
      00829D 4D               [ 1]  536 	tnz	a
      00829E 26 26            [ 1]  537 	jrne	00102$
                                    538 ;	main.c: 103: inc200mv();
      0082A0 CD 81 9A         [ 4]  539 	call	_inc200mv
                                    540 ;	main.c: 104: dem2 ++;                           
      0082A3 72 5C 00 0A      [ 1]  541 	inc	_dem2+0
                                    542 ;	main.c: 105: t = 0x25 + dem2;                
      0082A7 C6 00 0A         [ 1]  543 	ld	a, _dem2+0
      0082AA AB 25            [ 1]  544 	add	a, #0x25
      0082AC C7 00 04         [ 1]  545 	ld	_t+0, a
                                    546 ;	main.c: 106: FLASH_ProgramByte(0X4000, t);		//0x4000 address is the first eeprom address
      0082AF 3B 00 04         [ 1]  547 	push	_t+0
      0082B2 4B 00            [ 1]  548 	push	#0x00
      0082B4 4B 40            [ 1]  549 	push	#0x40
      0082B6 5F               [ 1]  550 	clrw	x
      0082B7 89               [ 2]  551 	pushw	x
      0082B8 CD 8B 07         [ 4]  552 	call	_FLASH_ProgramByte
      0082BB 5B 05            [ 2]  553 	addw	sp, #5
                                    554 ;	main.c: 107: delay_ms(500);   //delay 0.5s         //button delay
      0082BD 4B F4            [ 1]  555 	push	#0xf4
      0082BF 4B 01            [ 1]  556 	push	#0x01
      0082C1 CD 80 35         [ 4]  557 	call	_delay_ms
      0082C4 5B 02            [ 2]  558 	addw	sp, #2
      0082C6                        559 00102$:
                                    560 ;	main.c: 109: if(GPIO_ReadInputPin(GPIOD,GPIO_PIN_6)==0){         // decrease 0,2V if we press button 3
      0082C6 4B 40            [ 1]  561 	push	#0x40
      0082C8 4B 0F            [ 1]  562 	push	#0x0f
      0082CA 4B 50            [ 1]  563 	push	#0x50
      0082CC CD 86 50         [ 4]  564 	call	_GPIO_ReadInputPin
      0082CF 5B 03            [ 2]  565 	addw	sp, #3
      0082D1 4D               [ 1]  566 	tnz	a
      0082D2 26 B0            [ 1]  567 	jrne	00105$
                                    568 ;	main.c: 110: dec200mv();
      0082D4 CD 81 C7         [ 4]  569 	call	_dec200mv
                                    570 ;	main.c: 111: dem2 --;                            
      0082D7 72 5A 00 0A      [ 1]  571 	dec	_dem2+0
                                    572 ;	main.c: 112: t1 = 0x25 + dem2;
      0082DB C6 00 0A         [ 1]  573 	ld	a, _dem2+0
      0082DE AB 25            [ 1]  574 	add	a, #0x25
      0082E0 C7 00 05         [ 1]  575 	ld	_t1+0, a
                                    576 ;	main.c: 113: FLASH_ProgramByte(0X4000, t1);		//0x4000 address is the first eeprom address
      0082E3 3B 00 05         [ 1]  577 	push	_t1+0
      0082E6 4B 00            [ 1]  578 	push	#0x00
      0082E8 4B 40            [ 1]  579 	push	#0x40
      0082EA 5F               [ 1]  580 	clrw	x
      0082EB 89               [ 2]  581 	pushw	x
      0082EC CD 8B 07         [ 4]  582 	call	_FLASH_ProgramByte
      0082EF 5B 05            [ 2]  583 	addw	sp, #5
                                    584 ;	main.c: 114: delay_ms(500);   //delay 0.5s         //button delay
      0082F1 4B F4            [ 1]  585 	push	#0xf4
      0082F3 4B 01            [ 1]  586 	push	#0x01
      0082F5 CD 80 35         [ 4]  587 	call	_delay_ms
      0082F8 5B 02            [ 2]  588 	addw	sp, #2
      0082FA 20 88            [ 2]  589 	jra	00105$
      0082FC                        590 00107$:
                                    591 ;	main.c: 117: volt5();
      0082FC CD 80 6F         [ 4]  592 	call	_volt5
      0082FF                        593 00109$:
                                    594 ;	main.c: 119: if(changed == 1){
      0082FF CE 00 06         [ 2]  595 	ldw	x, _changed+0
      008302 5A               [ 2]  596 	decw	x
      008303 27 03            [ 1]  597 	jreq	00221$
      008305 CC 84 1D         [ 2]  598 	jp	00131$
      008308                        599 00221$:
                                    600 ;	main.c: 124: EEROM_INIT();
      008308 CD 80 5F         [ 4]  601 	call	_EEROM_INIT
                                    602 ;	main.c: 125: FLASH_ProgramByte(0X4001, 0X01);		//0x4000 address is the first eeprom address
      00830B 4B 01            [ 1]  603 	push	#0x01
      00830D 4B 01            [ 1]  604 	push	#0x01
      00830F 4B 40            [ 1]  605 	push	#0x40
      008311 5F               [ 1]  606 	clrw	x
      008312 89               [ 2]  607 	pushw	x
      008313 CD 8B 07         [ 4]  608 	call	_FLASH_ProgramByte
      008316 5B 05            [ 2]  609 	addw	sp, #5
                                    610 ;	main.c: 126: delay_ms(20);   //delay20ms    
      008318 4B 14            [ 1]  611 	push	#0x14
      00831A 4B 00            [ 1]  612 	push	#0x00
      00831C CD 80 35         [ 4]  613 	call	_delay_ms
      00831F 5B 02            [ 2]  614 	addw	sp, #2
                                    615 ;	main.c: 127: eep1 = FLASH_ReadByte(0x4000);    		
      008321 4B 00            [ 1]  616 	push	#0x00
      008323 4B 40            [ 1]  617 	push	#0x40
      008325 5F               [ 1]  618 	clrw	x
      008326 89               [ 2]  619 	pushw	x
      008327 CD 8B 0D         [ 4]  620 	call	_FLASH_ReadByte
      00832A 5B 04            [ 2]  621 	addw	sp, #4
                                    622 ;	main.c: 128: if(eep1 >= 0x25){    //if we increase voltage
      00832C C7 00 03         [ 1]  623 	ld	_eep1+0, a
      00832F A1 25            [ 1]  624 	cp	a, #0x25
      008331 25 2A            [ 1]  625 	jrc	00112$
                                    626 ;	main.c: 130: for(int i = 0x00; i<= eep1-0x25 ;i++){
      008333 5F               [ 1]  627 	clrw	x
      008334 1F 03            [ 2]  628 	ldw	(0x03, sp), x
      008336                        629 00126$:
      008336 C6 00 03         [ 1]  630 	ld	a, _eep1+0
      008339 5F               [ 1]  631 	clrw	x
      00833A 97               [ 1]  632 	ld	xl, a
      00833B 1D 00 25         [ 2]  633 	subw	x, #0x0025
      00833E 13 03            [ 2]  634 	cpw	x, (0x03, sp)
      008340 2F 13            [ 1]  635 	jrslt	00110$
                                    636 ;	main.c: 131: inc200mv();				
      008342 CD 81 9A         [ 4]  637 	call	_inc200mv
                                    638 ;	main.c: 132: delay_ms(500);   //delay 20ms
      008345 4B F4            [ 1]  639 	push	#0xf4
      008347 4B 01            [ 1]  640 	push	#0x01
      008349 CD 80 35         [ 4]  641 	call	_delay_ms
      00834C 5B 02            [ 2]  642 	addw	sp, #2
                                    643 ;	main.c: 130: for(int i = 0x00; i<= eep1-0x25 ;i++){
      00834E 1E 03            [ 2]  644 	ldw	x, (0x03, sp)
      008350 5C               [ 1]  645 	incw	x
      008351 1F 03            [ 2]  646 	ldw	(0x03, sp), x
      008353 20 E1            [ 2]  647 	jra	00126$
      008355                        648 00110$:
                                    649 ;	main.c: 134: dem2 = eep1 -0x25;
      008355 C6 00 03         [ 1]  650 	ld	a, _eep1+0
      008358 A0 25            [ 1]  651 	sub	a, #0x25
      00835A C7 00 0A         [ 1]  652 	ld	_dem2+0, a
      00835D                        653 00112$:
                                    654 ;	main.c: 136: if(eep1 < 0x25){    //if we decrease voltage
      00835D C6 00 03         [ 1]  655 	ld	a, _eep1+0
      008360 A1 25            [ 1]  656 	cp	a, #0x25
      008362 24 33            [ 1]  657 	jrnc	00115$
                                    658 ;	main.c: 137: for(int i = 0x00; i <= 0x25 - eep1; i++){
      008364 5F               [ 1]  659 	clrw	x
      008365 1F 03            [ 2]  660 	ldw	(0x03, sp), x
      008367                        661 00129$:
      008367 C6 00 03         [ 1]  662 	ld	a, _eep1+0
      00836A 6B 02            [ 1]  663 	ld	(0x02, sp), a
      00836C 0F 01            [ 1]  664 	clr	(0x01, sp)
      00836E AE 00 25         [ 2]  665 	ldw	x, #0x0025
      008371 72 F0 01         [ 2]  666 	subw	x, (0x01, sp)
      008374 13 03            [ 2]  667 	cpw	x, (0x03, sp)
      008376 2F 13            [ 1]  668 	jrslt	00113$
                                    669 ;	main.c: 138: dec200mv();
      008378 CD 81 C7         [ 4]  670 	call	_dec200mv
                                    671 ;	main.c: 139: delay_ms(500);   //delay 20ms
      00837B 4B F4            [ 1]  672 	push	#0xf4
      00837D 4B 01            [ 1]  673 	push	#0x01
      00837F CD 80 35         [ 4]  674 	call	_delay_ms
      008382 5B 02            [ 2]  675 	addw	sp, #2
                                    676 ;	main.c: 137: for(int i = 0x00; i <= 0x25 - eep1; i++){
      008384 1E 03            [ 2]  677 	ldw	x, (0x03, sp)
      008386 5C               [ 1]  678 	incw	x
      008387 1F 03            [ 2]  679 	ldw	(0x03, sp), x
      008389 20 DC            [ 2]  680 	jra	00129$
      00838B                        681 00113$:
                                    682 ;	main.c: 141: dem2 = 0x25 - eep1;
      00838B C6 00 03         [ 1]  683 	ld	a, _eep1+0
      00838E 6B 04            [ 1]  684 	ld	(0x04, sp), a
      008390 A6 25            [ 1]  685 	ld	a, #0x25
      008392 10 04            [ 1]  686 	sub	a, (0x04, sp)
      008394 C7 00 0A         [ 1]  687 	ld	_dem2+0, a
      008397                        688 00115$:
                                    689 ;	main.c: 143: delay_ms(500);   //delay 0.5s button delay
      008397 4B F4            [ 1]  690 	push	#0xf4
      008399 4B 01            [ 1]  691 	push	#0x01
      00839B CD 80 35         [ 4]  692 	call	_delay_ms
      00839E 5B 02            [ 2]  693 	addw	sp, #2
                                    694 ;	main.c: 144: while(GPIO_ReadInputPin(GPIOD,GPIO_PIN_4)!=0){          // out loop if RA2 = 0 (press mode button)
      0083A0                        695 00120$:
      0083A0 4B 10            [ 1]  696 	push	#0x10
      0083A2 4B 0F            [ 1]  697 	push	#0x0f
      0083A4 4B 50            [ 1]  698 	push	#0x50
      0083A6 CD 86 50         [ 4]  699 	call	_GPIO_ReadInputPin
      0083A9 5B 03            [ 2]  700 	addw	sp, #3
      0083AB 4D               [ 1]  701 	tnz	a
      0083AC 27 6A            [ 1]  702 	jreq	00122$
                                    703 ;	main.c: 145: if(GPIO_ReadInputPin(GPIOD,GPIO_PIN_5)==0){         // increase 0,2V if we press button 2
      0083AE 4B 20            [ 1]  704 	push	#0x20
      0083B0 4B 0F            [ 1]  705 	push	#0x0f
      0083B2 4B 50            [ 1]  706 	push	#0x50
      0083B4 CD 86 50         [ 4]  707 	call	_GPIO_ReadInputPin
      0083B7 5B 03            [ 2]  708 	addw	sp, #3
      0083B9 4D               [ 1]  709 	tnz	a
      0083BA 26 26            [ 1]  710 	jrne	00117$
                                    711 ;	main.c: 146: inc200mv();
      0083BC CD 81 9A         [ 4]  712 	call	_inc200mv
                                    713 ;	main.c: 147: dem2 ++;                           
      0083BF 72 5C 00 0A      [ 1]  714 	inc	_dem2+0
                                    715 ;	main.c: 148: t = 0x25 + dem2;                
      0083C3 C6 00 0A         [ 1]  716 	ld	a, _dem2+0
      0083C6 AB 25            [ 1]  717 	add	a, #0x25
      0083C8 C7 00 04         [ 1]  718 	ld	_t+0, a
                                    719 ;	main.c: 149: FLASH_ProgramByte(0X4000, t);		//0x4000 address is the first eeprom address
      0083CB 3B 00 04         [ 1]  720 	push	_t+0
      0083CE 4B 00            [ 1]  721 	push	#0x00
      0083D0 4B 40            [ 1]  722 	push	#0x40
      0083D2 5F               [ 1]  723 	clrw	x
      0083D3 89               [ 2]  724 	pushw	x
      0083D4 CD 8B 07         [ 4]  725 	call	_FLASH_ProgramByte
      0083D7 5B 05            [ 2]  726 	addw	sp, #5
                                    727 ;	main.c: 150: delay_ms(500);   //delay 0.5s         //button delay
      0083D9 4B F4            [ 1]  728 	push	#0xf4
      0083DB 4B 01            [ 1]  729 	push	#0x01
      0083DD CD 80 35         [ 4]  730 	call	_delay_ms
      0083E0 5B 02            [ 2]  731 	addw	sp, #2
      0083E2                        732 00117$:
                                    733 ;	main.c: 152: if(GPIO_ReadInputPin(GPIOD,GPIO_PIN_6)==0){         // decrease 0,2V if we press button 3
      0083E2 4B 40            [ 1]  734 	push	#0x40
      0083E4 4B 0F            [ 1]  735 	push	#0x0f
      0083E6 4B 50            [ 1]  736 	push	#0x50
      0083E8 CD 86 50         [ 4]  737 	call	_GPIO_ReadInputPin
      0083EB 5B 03            [ 2]  738 	addw	sp, #3
      0083ED 4D               [ 1]  739 	tnz	a
      0083EE 26 B0            [ 1]  740 	jrne	00120$
                                    741 ;	main.c: 153: dec200mv();
      0083F0 CD 81 C7         [ 4]  742 	call	_dec200mv
                                    743 ;	main.c: 154: dem2 --;                            
      0083F3 72 5A 00 0A      [ 1]  744 	dec	_dem2+0
                                    745 ;	main.c: 155: t1 = 0x25 + dem2;
      0083F7 C6 00 0A         [ 1]  746 	ld	a, _dem2+0
      0083FA AB 25            [ 1]  747 	add	a, #0x25
      0083FC C7 00 05         [ 1]  748 	ld	_t1+0, a
                                    749 ;	main.c: 156: FLASH_ProgramByte(0X4000, t1);		//0x4000 address is the first eeprom address
      0083FF 3B 00 05         [ 1]  750 	push	_t1+0
      008402 4B 00            [ 1]  751 	push	#0x00
      008404 4B 40            [ 1]  752 	push	#0x40
      008406 5F               [ 1]  753 	clrw	x
      008407 89               [ 2]  754 	pushw	x
      008408 CD 8B 07         [ 4]  755 	call	_FLASH_ProgramByte
      00840B 5B 05            [ 2]  756 	addw	sp, #5
                                    757 ;	main.c: 157: delay_ms(500);   //delay 0.5s         //button delay
      00840D 4B F4            [ 1]  758 	push	#0xf4
      00840F 4B 01            [ 1]  759 	push	#0x01
      008411 CD 80 35         [ 4]  760 	call	_delay_ms
      008414 5B 02            [ 2]  761 	addw	sp, #2
      008416 20 88            [ 2]  762 	jra	00120$
      008418                        763 00122$:
                                    764 ;	main.c: 160: volt5();       
      008418 5B 04            [ 2]  765 	addw	sp, #4
      00841A CC 80 6F         [ 2]  766 	jp	_volt5
      00841D                        767 00131$:
                                    768 ;	main.c: 163: }
      00841D 5B 04            [ 2]  769 	addw	sp, #4
      00841F 81               [ 4]  770 	ret
                                    771 ;	main.c: 164: void main(void)
                                    772 ;	-----------------------------------------
                                    773 ;	 function main
                                    774 ;	-----------------------------------------
      008420                        775 _main:
                                    776 ;	main.c: 166: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      008420 4B 00            [ 1]  777 	push	#0x00
      008422 CD 89 25         [ 4]  778 	call	_CLK_HSIPrescalerConfig
      008425 84               [ 1]  779 	pop	a
                                    780 ;	main.c: 167: TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
      008426 4B 7C            [ 1]  781 	push	#0x7c
      008428 4B 07            [ 1]  782 	push	#0x07
      00842A CD 86 8C         [ 4]  783 	call	_TIM4_TimeBaseInit
      00842D 5B 02            [ 2]  784 	addw	sp, #2
                                    785 ;	main.c: 168: TIM4_Cmd(ENABLE);
      00842F 4B 01            [ 1]  786 	push	#0x01
      008431 CD 86 99         [ 4]  787 	call	_TIM4_Cmd
      008434 84               [ 1]  788 	pop	a
                                    789 ;	main.c: 169: GPIO_DeInit(GPIOD);
      008435 4B 0F            [ 1]  790 	push	#0x0f
      008437 4B 50            [ 1]  791 	push	#0x50
      008439 CD 85 A1         [ 4]  792 	call	_GPIO_DeInit
      00843C 5B 02            [ 2]  793 	addw	sp, #2
                                    794 ;	main.c: 170: GPIO_DeInit(GPIOC);
      00843E 4B 0A            [ 1]  795 	push	#0x0a
      008440 4B 50            [ 1]  796 	push	#0x50
      008442 CD 85 A1         [ 4]  797 	call	_GPIO_DeInit
      008445 5B 02            [ 2]  798 	addw	sp, #2
                                    799 ;	main.c: 171: GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);		//d+ floating	
      008447 4B 00            [ 1]  800 	push	#0x00
      008449 4B 20            [ 1]  801 	push	#0x20
      00844B 4B 0A            [ 1]  802 	push	#0x0a
      00844D 4B 50            [ 1]  803 	push	#0x50
      00844F CD 85 B0         [ 4]  804 	call	_GPIO_Init
      008452 5B 04            [ 2]  805 	addw	sp, #4
                                    806 ;	main.c: 172: GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_IN_PU_NO_IT);		//button 1
      008454 4B 40            [ 1]  807 	push	#0x40
      008456 4B 10            [ 1]  808 	push	#0x10
      008458 4B 0F            [ 1]  809 	push	#0x0f
      00845A 4B 50            [ 1]  810 	push	#0x50
      00845C CD 85 B0         [ 4]  811 	call	_GPIO_Init
      00845F 5B 04            [ 2]  812 	addw	sp, #4
                                    813 ;	main.c: 173: GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_IN_PU_NO_IT);		//button 2
      008461 4B 40            [ 1]  814 	push	#0x40
      008463 4B 20            [ 1]  815 	push	#0x20
      008465 4B 0F            [ 1]  816 	push	#0x0f
      008467 4B 50            [ 1]  817 	push	#0x50
      008469 CD 85 B0         [ 4]  818 	call	_GPIO_Init
      00846C 5B 04            [ 2]  819 	addw	sp, #4
                                    820 ;	main.c: 174: GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);		//button 3
      00846E 4B 40            [ 1]  821 	push	#0x40
      008470 4B 40            [ 1]  822 	push	#0x40
      008472 4B 0F            [ 1]  823 	push	#0x0f
      008474 4B 50            [ 1]  824 	push	#0x50
      008476 CD 85 B0         [ 4]  825 	call	_GPIO_Init
      008479 5B 04            [ 2]  826 	addw	sp, #4
                                    827 ;	main.c: 176: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_LOW_FAST);	//d- low
      00847B 4B E0            [ 1]  828 	push	#0xe0
      00847D 4B 40            [ 1]  829 	push	#0x40
      00847F 4B 0A            [ 1]  830 	push	#0x0a
      008481 4B 50            [ 1]  831 	push	#0x50
      008483 CD 85 B0         [ 4]  832 	call	_GPIO_Init
      008486 5B 04            [ 2]  833 	addw	sp, #4
                                    834 ;	main.c: 177: delay_ms(20);
      008488 4B 14            [ 1]  835 	push	#0x14
      00848A 4B 00            [ 1]  836 	push	#0x00
      00848C CD 80 35         [ 4]  837 	call	_delay_ms
      00848F 5B 02            [ 2]  838 	addw	sp, #2
                                    839 ;	main.c: 178: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);		//d- floating
      008491 4B 00            [ 1]  840 	push	#0x00
      008493 4B 40            [ 1]  841 	push	#0x40
      008495 4B 0A            [ 1]  842 	push	#0x0a
      008497 4B 50            [ 1]  843 	push	#0x50
      008499 CD 85 B0         [ 4]  844 	call	_GPIO_Init
      00849C 5B 04            [ 2]  845 	addw	sp, #4
                                    846 ;	main.c: 179: delay_ms(1500);	
      00849E 4B DC            [ 1]  847 	push	#0xdc
      0084A0 4B 05            [ 1]  848 	push	#0x05
      0084A2 CD 80 35         [ 4]  849 	call	_delay_ms
      0084A5 5B 02            [ 2]  850 	addw	sp, #2
                                    851 ;	main.c: 180: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_LOW_FAST);	//d- low
      0084A7 4B E0            [ 1]  852 	push	#0xe0
      0084A9 4B 40            [ 1]  853 	push	#0x40
      0084AB 4B 0A            [ 1]  854 	push	#0x0a
      0084AD 4B 50            [ 1]  855 	push	#0x50
      0084AF CD 85 B0         [ 4]  856 	call	_GPIO_Init
      0084B2 5B 04            [ 2]  857 	addw	sp, #4
                                    858 ;	main.c: 181: delay_ms(200);
      0084B4 4B C8            [ 1]  859 	push	#0xc8
      0084B6 4B 00            [ 1]  860 	push	#0x00
      0084B8 CD 80 35         [ 4]  861 	call	_delay_ms
      0084BB 5B 02            [ 2]  862 	addw	sp, #2
                                    863 ;	main.c: 185: EEROM_INIT();
      0084BD CD 80 5F         [ 4]  864 	call	_EEROM_INIT
                                    865 ;	main.c: 186: eepdata = FLASH_ReadByte(0x4000);		//read eeprom at 0x4000 address
      0084C0 4B 00            [ 1]  866 	push	#0x00
      0084C2 4B 40            [ 1]  867 	push	#0x40
      0084C4 5F               [ 1]  868 	clrw	x
      0084C5 89               [ 2]  869 	pushw	x
      0084C6 CD 8B 0D         [ 4]  870 	call	_FLASH_ReadByte
      0084C9 5B 04            [ 2]  871 	addw	sp, #4
      0084CB C7 00 01         [ 1]  872 	ld	_eepdata+0, a
                                    873 ;	main.c: 187: delay_ms(20);
      0084CE 4B 14            [ 1]  874 	push	#0x14
      0084D0 4B 00            [ 1]  875 	push	#0x00
      0084D2 CD 80 35         [ 4]  876 	call	_delay_ms
      0084D5 5B 02            [ 2]  877 	addw	sp, #2
                                    878 ;	main.c: 188: eepselect = FLASH_ReadByte(0x4001);		//read eeprom at 0x4001 address
      0084D7 4B 01            [ 1]  879 	push	#0x01
      0084D9 4B 40            [ 1]  880 	push	#0x40
      0084DB 5F               [ 1]  881 	clrw	x
      0084DC 89               [ 2]  882 	pushw	x
      0084DD CD 8B 0D         [ 4]  883 	call	_FLASH_ReadByte
      0084E0 5B 04            [ 2]  884 	addw	sp, #4
      0084E2 C7 00 02         [ 1]  885 	ld	_eepselect+0, a
                                    886 ;	main.c: 190: if(eepdata == 0x60){                            //go to 12 volts from the second time run
      0084E5 C6 00 01         [ 1]  887 	ld	a, _eepdata+0
      0084E8 A1 60            [ 1]  888 	cp	a, #0x60
      0084EA 26 06            [ 1]  889 	jrne	00102$
                                    890 ;	main.c: 191: dem1 = 3;
      0084EC AE 00 03         [ 2]  891 	ldw	x, #0x0003
      0084EF CF 00 08         [ 2]  892 	ldw	_dem1+0, x
      0084F2                        893 00102$:
                                    894 ;	main.c: 193: if(eepdata == 0x25 && eepselect == 0x00 ){      //go to 5 volts from the second time run
      0084F2 C6 00 01         [ 1]  895 	ld	a, _eepdata+0
      0084F5 A0 25            [ 1]  896 	sub	a, #0x25
      0084F7 26 05            [ 1]  897 	jrne	00206$
      0084F9 4C               [ 1]  898 	inc	a
      0084FA 90 97            [ 1]  899 	ld	yl, a
      0084FC 20 03            [ 2]  900 	jra	00207$
      0084FE                        901 00206$:
      0084FE 4F               [ 1]  902 	clr	a
      0084FF 90 97            [ 1]  903 	ld	yl, a
      008501                        904 00207$:
      008501 90 9F            [ 1]  905 	ld	a, yl
      008503 4D               [ 1]  906 	tnz	a
      008504 27 0A            [ 1]  907 	jreq	00104$
      008506 72 5D 00 02      [ 1]  908 	tnz	_eepselect+0
      00850A 26 04            [ 1]  909 	jrne	00104$
                                    910 ;	main.c: 194: dem1 = 0;
      00850C 5F               [ 1]  911 	clrw	x
      00850D CF 00 08         [ 2]  912 	ldw	_dem1+0, x
      008510                        913 00104$:
                                    914 ;	main.c: 196: if(eepdata == 0x45){                            //go to 9 volts from the second time run
      008510 C6 00 01         [ 1]  915 	ld	a, _eepdata+0
      008513 A1 45            [ 1]  916 	cp	a, #0x45
      008515 26 06            [ 1]  917 	jrne	00107$
                                    918 ;	main.c: 197: dem1 = 2;
      008517 AE 00 02         [ 2]  919 	ldw	x, #0x0002
      00851A CF 00 08         [ 2]  920 	ldw	_dem1+0, x
      00851D                        921 00107$:
                                    922 ;	main.c: 199: if(eepdata == 0x25 && eepselect == 0x01){       //go to INOV mode then go to changed = 0
      00851D C6 00 02         [ 1]  923 	ld	a, _eepselect+0
      008520 4A               [ 1]  924 	dec	a
      008521 26 03            [ 1]  925 	jrne	00214$
      008523 A6 01            [ 1]  926 	ld	a, #0x01
      008525 21                     927 	.byte 0x21
      008526                        928 00214$:
      008526 4F               [ 1]  929 	clr	a
      008527                        930 00215$:
      008527 61               [ 1]  931 	exg	a, yl
      008528 4D               [ 1]  932 	tnz	a
      008529 61               [ 1]  933 	exg	a, yl
      00852A 27 0D            [ 1]  934 	jreq	00109$
      00852C 4D               [ 1]  935 	tnz	a
      00852D 27 0A            [ 1]  936 	jreq	00109$
                                    937 ;	main.c: 200: dem1 = 1;
      00852F AE 00 01         [ 2]  938 	ldw	x, #0x0001
      008532 CF 00 08         [ 2]  939 	ldw	_dem1+0, x
                                    940 ;	main.c: 201: changed = 0;
      008535 5F               [ 1]  941 	clrw	x
      008536 CF 00 06         [ 2]  942 	ldw	_changed+0, x
      008539                        943 00109$:
                                    944 ;	main.c: 203: if(eepdata != 0x25 && eepselect == 0x01){       //go to INOV mode then go to changed = 1
      008539 61               [ 1]  945 	exg	a, yl
      00853A 4D               [ 1]  946 	tnz	a
      00853B 61               [ 1]  947 	exg	a, yl
      00853C 26 0F            [ 1]  948 	jrne	00123$
      00853E 4D               [ 1]  949 	tnz	a
      00853F 27 0C            [ 1]  950 	jreq	00123$
                                    951 ;	main.c: 204: dem1 = 1;
      008541 AE 00 01         [ 2]  952 	ldw	x, #0x0001
      008544 CF 00 08         [ 2]  953 	ldw	_dem1+0, x
                                    954 ;	main.c: 205: changed = 1;            //when we impact increase or decrease button, go to changed = 1
      008547 AE 00 01         [ 2]  955 	ldw	x, #0x0001
      00854A CF 00 06         [ 2]  956 	ldw	_changed+0, x
                                    957 ;	main.c: 207: while(1) {
      00854D                        958 00123$:
                                    959 ;	main.c: 208: dem1++;
      00854D CE 00 08         [ 2]  960 	ldw	x, _dem1+0
      008550 5C               [ 1]  961 	incw	x
                                    962 ;	main.c: 209: switch(dem1){
      008551 CF 00 08         [ 2]  963 	ldw	_dem1+0, x
      008554 5A               [ 2]  964 	decw	x
      008555 27 1A            [ 1]  965 	jreq	00114$
      008557 CE 00 08         [ 2]  966 	ldw	x, _dem1+0
      00855A A3 00 02         [ 2]  967 	cpw	x, #0x0002
      00855D 27 17            [ 1]  968 	jreq	00115$
      00855F CE 00 08         [ 2]  969 	ldw	x, _dem1+0
      008562 A3 00 03         [ 2]  970 	cpw	x, #0x0003
      008565 27 14            [ 1]  971 	jreq	00116$
      008567 CE 00 08         [ 2]  972 	ldw	x, _dem1+0
      00856A A3 00 04         [ 2]  973 	cpw	x, #0x0004
      00856D 27 11            [ 1]  974 	jreq	00117$
      00856F 20 16            [ 2]  975 	jra	00118$
                                    976 ;	main.c: 210: case 1: volt5(); break;
      008571                        977 00114$:
      008571 CD 80 6F         [ 4]  978 	call	_volt5
      008574 20 11            [ 2]  979 	jra	00118$
                                    980 ;	main.c: 211: case 2: INOV(); break;
      008576                        981 00115$:
      008576 CD 81 F4         [ 4]  982 	call	_INOV
      008579 20 0C            [ 2]  983 	jra	00118$
                                    984 ;	main.c: 213: case 3: volt9(); break;
      00857B                        985 00116$:
      00857B CD 80 D7         [ 4]  986 	call	_volt9
      00857E 20 07            [ 2]  987 	jra	00118$
                                    988 ;	main.c: 214: case 4: volt12(); dem1 = 0; break;
      008580                        989 00117$:
      008580 CD 81 3F         [ 4]  990 	call	_volt12
      008583 5F               [ 1]  991 	clrw	x
      008584 CF 00 08         [ 2]  992 	ldw	_dem1+0, x
                                    993 ;	main.c: 215: }
      008587                        994 00118$:
                                    995 ;	main.c: 216: delay_ms(500);
      008587 4B F4            [ 1]  996 	push	#0xf4
      008589 4B 01            [ 1]  997 	push	#0x01
      00858B CD 80 35         [ 4]  998 	call	_delay_ms
      00858E 5B 02            [ 2]  999 	addw	sp, #2
                                   1000 ;	main.c: 217: while(GPIO_ReadInputPin(GPIOD,GPIO_PIN_4)!=0){
      008590                       1001 00119$:
      008590 4B 10            [ 1] 1002 	push	#0x10
      008592 4B 0F            [ 1] 1003 	push	#0x0f
      008594 4B 50            [ 1] 1004 	push	#0x50
      008596 CD 86 50         [ 4] 1005 	call	_GPIO_ReadInputPin
      008599 5B 03            [ 2] 1006 	addw	sp, #3
      00859B 4D               [ 1] 1007 	tnz	a
      00859C 27 AF            [ 1] 1008 	jreq	00123$
      00859E 20 F0            [ 2] 1009 	jra	00119$
                                   1010 ;	main.c: 221: }
      0085A0 81               [ 4] 1011 	ret
                                   1012 	.area CODE
                                   1013 	.area CONST
                                   1014 	.area INITIALIZER
      008030                       1015 __xinit__changed:
      008030 00 00                 1016 	.dw #0x0000
      008032                       1017 __xinit__dem1:
      008032 00 00                 1018 	.dw #0x0000
      008034                       1019 __xinit__dem2:
      008034 00                    1020 	.db #0x00	; 0
                                   1021 	.area CABS (ABS)
