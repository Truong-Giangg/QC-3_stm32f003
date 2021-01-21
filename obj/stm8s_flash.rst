                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_flash
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _FLASH_Unlock
                                     12 	.globl _FLASH_Lock
                                     13 	.globl _FLASH_DeInit
                                     14 	.globl _FLASH_ITConfig
                                     15 	.globl _FLASH_EraseByte
                                     16 	.globl _FLASH_ProgramByte
                                     17 	.globl _FLASH_ReadByte
                                     18 	.globl _FLASH_ProgramWord
                                     19 	.globl _FLASH_ProgramOptionByte
                                     20 	.globl _FLASH_EraseOptionByte
                                     21 	.globl _FLASH_ReadOptionByte
                                     22 	.globl _FLASH_SetLowPowerMode
                                     23 	.globl _FLASH_SetProgrammingTime
                                     24 	.globl _FLASH_GetLowPowerMode
                                     25 	.globl _FLASH_GetProgrammingTime
                                     26 	.globl _FLASH_GetBootSize
                                     27 	.globl _FLASH_GetFlagStatus
                                     28 	.globl _FLASH_WaitForLastOperation
                                     29 	.globl _FLASH_EraseBlock
                                     30 	.globl _FLASH_ProgramBlock
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area DATA
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area INITIALIZED
                                     39 ;--------------------------------------------------------
                                     40 ; absolute external ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area DABS (ABS)
                                     43 
                                     44 ; default segment ordering for linker
                                     45 	.area HOME
                                     46 	.area GSINIT
                                     47 	.area GSFINAL
                                     48 	.area CONST
                                     49 	.area INITIALIZER
                                     50 	.area CODE
                                     51 
                                     52 ;--------------------------------------------------------
                                     53 ; global & static initialisations
                                     54 ;--------------------------------------------------------
                                     55 	.area HOME
                                     56 	.area GSINIT
                                     57 	.area GSFINAL
                                     58 	.area GSINIT
                                     59 ;--------------------------------------------------------
                                     60 ; Home
                                     61 ;--------------------------------------------------------
                                     62 	.area HOME
                                     63 	.area HOME
                                     64 ;--------------------------------------------------------
                                     65 ; code
                                     66 ;--------------------------------------------------------
                                     67 	.area CODE
                                     68 ;	lib/src/stm8s_flash.c: 87: void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
                                     69 ;	-----------------------------------------
                                     70 ;	 function FLASH_Unlock
                                     71 ;	-----------------------------------------
      008AB7                         72 _FLASH_Unlock:
                                     73 ;	lib/src/stm8s_flash.c: 93: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      008AB7 7B 03            [ 1]   74 	ld	a, (0x03, sp)
      008AB9 A1 FD            [ 1]   75 	cp	a, #0xfd
      008ABB 26 09            [ 1]   76 	jrne	00102$
                                     77 ;	lib/src/stm8s_flash.c: 95: FLASH->PUKR = FLASH_RASS_KEY1;
      008ABD 35 56 50 62      [ 1]   78 	mov	0x5062+0, #0x56
                                     79 ;	lib/src/stm8s_flash.c: 96: FLASH->PUKR = FLASH_RASS_KEY2;
      008AC1 35 AE 50 62      [ 1]   80 	mov	0x5062+0, #0xae
      008AC5 81               [ 4]   81 	ret
      008AC6                         82 00102$:
                                     83 ;	lib/src/stm8s_flash.c: 101: FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
      008AC6 35 AE 50 64      [ 1]   84 	mov	0x5064+0, #0xae
                                     85 ;	lib/src/stm8s_flash.c: 102: FLASH->DUKR = FLASH_RASS_KEY1;
      008ACA 35 56 50 64      [ 1]   86 	mov	0x5064+0, #0x56
                                     87 ;	lib/src/stm8s_flash.c: 104: }
      008ACE 81               [ 4]   88 	ret
                                     89 ;	lib/src/stm8s_flash.c: 112: void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
                                     90 ;	-----------------------------------------
                                     91 ;	 function FLASH_Lock
                                     92 ;	-----------------------------------------
      008ACF                         93 _FLASH_Lock:
                                     94 ;	lib/src/stm8s_flash.c: 118: FLASH->IAPSR &= (uint8_t)FLASH_MemType;
      008ACF C6 50 5F         [ 1]   95 	ld	a, 0x505f
      008AD2 14 03            [ 1]   96 	and	a, (0x03, sp)
      008AD4 C7 50 5F         [ 1]   97 	ld	0x505f, a
                                     98 ;	lib/src/stm8s_flash.c: 119: }
      008AD7 81               [ 4]   99 	ret
                                    100 ;	lib/src/stm8s_flash.c: 126: void FLASH_DeInit(void)
                                    101 ;	-----------------------------------------
                                    102 ;	 function FLASH_DeInit
                                    103 ;	-----------------------------------------
      008AD8                        104 _FLASH_DeInit:
                                    105 ;	lib/src/stm8s_flash.c: 128: FLASH->CR1 = FLASH_CR1_RESET_VALUE;
      008AD8 35 00 50 5A      [ 1]  106 	mov	0x505a+0, #0x00
                                    107 ;	lib/src/stm8s_flash.c: 129: FLASH->CR2 = FLASH_CR2_RESET_VALUE;
      008ADC 35 00 50 5B      [ 1]  108 	mov	0x505b+0, #0x00
                                    109 ;	lib/src/stm8s_flash.c: 130: FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
      008AE0 35 FF 50 5C      [ 1]  110 	mov	0x505c+0, #0xff
                                    111 ;	lib/src/stm8s_flash.c: 131: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
      008AE4 72 17 50 5F      [ 1]  112 	bres	20575, #3
                                    113 ;	lib/src/stm8s_flash.c: 132: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
      008AE8 72 13 50 5F      [ 1]  114 	bres	20575, #1
                                    115 ;	lib/src/stm8s_flash.c: 133: (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
      008AEC C6 50 5F         [ 1]  116 	ld	a, 0x505f
                                    117 ;	lib/src/stm8s_flash.c: 134: }
      008AEF 81               [ 4]  118 	ret
                                    119 ;	lib/src/stm8s_flash.c: 142: void FLASH_ITConfig(FunctionalState NewState)
                                    120 ;	-----------------------------------------
                                    121 ;	 function FLASH_ITConfig
                                    122 ;	-----------------------------------------
      008AF0                        123 _FLASH_ITConfig:
                                    124 ;	lib/src/stm8s_flash.c: 149: FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
      008AF0 C6 50 5A         [ 1]  125 	ld	a, 0x505a
                                    126 ;	lib/src/stm8s_flash.c: 147: if(NewState != DISABLE)
      008AF3 0D 03            [ 1]  127 	tnz	(0x03, sp)
      008AF5 27 06            [ 1]  128 	jreq	00102$
                                    129 ;	lib/src/stm8s_flash.c: 149: FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
      008AF7 AA 02            [ 1]  130 	or	a, #0x02
      008AF9 C7 50 5A         [ 1]  131 	ld	0x505a, a
      008AFC 81               [ 4]  132 	ret
      008AFD                        133 00102$:
                                    134 ;	lib/src/stm8s_flash.c: 153: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
      008AFD A4 FD            [ 1]  135 	and	a, #0xfd
      008AFF C7 50 5A         [ 1]  136 	ld	0x505a, a
                                    137 ;	lib/src/stm8s_flash.c: 155: }
      008B02 81               [ 4]  138 	ret
                                    139 ;	lib/src/stm8s_flash.c: 164: void FLASH_EraseByte(uint32_t Address)
                                    140 ;	-----------------------------------------
                                    141 ;	 function FLASH_EraseByte
                                    142 ;	-----------------------------------------
      008B03                        143 _FLASH_EraseByte:
                                    144 ;	lib/src/stm8s_flash.c: 170: *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE;
      008B03 1E 05            [ 2]  145 	ldw	x, (0x05, sp)
      008B05 7F               [ 1]  146 	clr	(x)
                                    147 ;	lib/src/stm8s_flash.c: 171: }
      008B06 81               [ 4]  148 	ret
                                    149 ;	lib/src/stm8s_flash.c: 181: void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
                                    150 ;	-----------------------------------------
                                    151 ;	 function FLASH_ProgramByte
                                    152 ;	-----------------------------------------
      008B07                        153 _FLASH_ProgramByte:
                                    154 ;	lib/src/stm8s_flash.c: 185: *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
      008B07 1E 05            [ 2]  155 	ldw	x, (0x05, sp)
      008B09 7B 07            [ 1]  156 	ld	a, (0x07, sp)
      008B0B F7               [ 1]  157 	ld	(x), a
                                    158 ;	lib/src/stm8s_flash.c: 186: }
      008B0C 81               [ 4]  159 	ret
                                    160 ;	lib/src/stm8s_flash.c: 195: uint8_t FLASH_ReadByte(uint32_t Address)
                                    161 ;	-----------------------------------------
                                    162 ;	 function FLASH_ReadByte
                                    163 ;	-----------------------------------------
      008B0D                        164 _FLASH_ReadByte:
                                    165 ;	lib/src/stm8s_flash.c: 201: return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
      008B0D 1E 05            [ 2]  166 	ldw	x, (0x05, sp)
      008B0F F6               [ 1]  167 	ld	a, (x)
                                    168 ;	lib/src/stm8s_flash.c: 202: }
      008B10 81               [ 4]  169 	ret
                                    170 ;	lib/src/stm8s_flash.c: 212: void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
                                    171 ;	-----------------------------------------
                                    172 ;	 function FLASH_ProgramWord
                                    173 ;	-----------------------------------------
      008B11                        174 _FLASH_ProgramWord:
      008B11 52 02            [ 2]  175 	sub	sp, #2
                                    176 ;	lib/src/stm8s_flash.c: 218: FLASH->CR2 |= FLASH_CR2_WPRG;
      008B13 72 1C 50 5B      [ 1]  177 	bset	20571, #6
                                    178 ;	lib/src/stm8s_flash.c: 219: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
      008B17 72 1D 50 5C      [ 1]  179 	bres	20572, #6
                                    180 ;	lib/src/stm8s_flash.c: 222: *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
      008B1B 16 07            [ 2]  181 	ldw	y, (0x07, sp)
      008B1D 96               [ 1]  182 	ldw	x, sp
      008B1E 1C 00 09         [ 2]  183 	addw	x, #9
      008B21 F6               [ 1]  184 	ld	a, (x)
      008B22 90 F7            [ 1]  185 	ld	(y), a
                                    186 ;	lib/src/stm8s_flash.c: 224: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1);
      008B24 93               [ 1]  187 	ldw	x, y
      008B25 5C               [ 1]  188 	incw	x
      008B26 1F 01            [ 2]  189 	ldw	(0x01, sp), x
      008B28 96               [ 1]  190 	ldw	x, sp
      008B29 1C 00 09         [ 2]  191 	addw	x, #9
      008B2C E6 01            [ 1]  192 	ld	a, (0x1, x)
      008B2E 1E 01            [ 2]  193 	ldw	x, (0x01, sp)
      008B30 F7               [ 1]  194 	ld	(x), a
                                    195 ;	lib/src/stm8s_flash.c: 226: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2);
      008B31 93               [ 1]  196 	ldw	x, y
      008B32 5C               [ 1]  197 	incw	x
      008B33 5C               [ 1]  198 	incw	x
      008B34 1F 01            [ 2]  199 	ldw	(0x01, sp), x
      008B36 96               [ 1]  200 	ldw	x, sp
      008B37 1C 00 09         [ 2]  201 	addw	x, #9
      008B3A E6 02            [ 1]  202 	ld	a, (0x2, x)
      008B3C 1E 01            [ 2]  203 	ldw	x, (0x01, sp)
      008B3E F7               [ 1]  204 	ld	(x), a
                                    205 ;	lib/src/stm8s_flash.c: 228: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3);
      008B3F 72 A9 00 03      [ 2]  206 	addw	y, #0x0003
      008B43 96               [ 1]  207 	ldw	x, sp
      008B44 1C 00 09         [ 2]  208 	addw	x, #9
      008B47 E6 03            [ 1]  209 	ld	a, (0x3, x)
      008B49 90 F7            [ 1]  210 	ld	(y), a
                                    211 ;	lib/src/stm8s_flash.c: 229: }
      008B4B 5B 02            [ 2]  212 	addw	sp, #2
      008B4D 81               [ 4]  213 	ret
                                    214 ;	lib/src/stm8s_flash.c: 237: void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
                                    215 ;	-----------------------------------------
                                    216 ;	 function FLASH_ProgramOptionByte
                                    217 ;	-----------------------------------------
      008B4E                        218 _FLASH_ProgramOptionByte:
      008B4E 52 02            [ 2]  219 	sub	sp, #2
                                    220 ;	lib/src/stm8s_flash.c: 243: FLASH->CR2 |= FLASH_CR2_OPT;
      008B50 72 1E 50 5B      [ 1]  221 	bset	20571, #7
                                    222 ;	lib/src/stm8s_flash.c: 244: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
      008B54 72 1F 50 5C      [ 1]  223 	bres	20572, #7
                                    224 ;	lib/src/stm8s_flash.c: 247: if(Address == 0x4800)
      008B58 1E 05            [ 2]  225 	ldw	x, (0x05, sp)
                                    226 ;	lib/src/stm8s_flash.c: 250: *((NEAR uint8_t*)Address) = Data;
      008B5A 16 05            [ 2]  227 	ldw	y, (0x05, sp)
      008B5C 17 01            [ 2]  228 	ldw	(0x01, sp), y
                                    229 ;	lib/src/stm8s_flash.c: 247: if(Address == 0x4800)
      008B5E A3 48 00         [ 2]  230 	cpw	x, #0x4800
      008B61 26 07            [ 1]  231 	jrne	00102$
                                    232 ;	lib/src/stm8s_flash.c: 250: *((NEAR uint8_t*)Address) = Data;
      008B63 1E 01            [ 2]  233 	ldw	x, (0x01, sp)
      008B65 7B 07            [ 1]  234 	ld	a, (0x07, sp)
      008B67 F7               [ 1]  235 	ld	(x), a
      008B68 20 0F            [ 2]  236 	jra	00103$
      008B6A                        237 00102$:
                                    238 ;	lib/src/stm8s_flash.c: 255: *((NEAR uint8_t*)Address) = Data;
      008B6A 16 01            [ 2]  239 	ldw	y, (0x01, sp)
      008B6C 7B 07            [ 1]  240 	ld	a, (0x07, sp)
      008B6E 90 F7            [ 1]  241 	ld	(y), a
                                    242 ;	lib/src/stm8s_flash.c: 256: *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
      008B70 5C               [ 1]  243 	incw	x
      008B71 1F 01            [ 2]  244 	ldw	(0x01, sp), x
      008B73 7B 07            [ 1]  245 	ld	a, (0x07, sp)
      008B75 43               [ 1]  246 	cpl	a
      008B76 1E 01            [ 2]  247 	ldw	x, (0x01, sp)
      008B78 F7               [ 1]  248 	ld	(x), a
      008B79                        249 00103$:
                                    250 ;	lib/src/stm8s_flash.c: 258: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
      008B79 4B FD            [ 1]  251 	push	#0xfd
      008B7B CD 8C 48         [ 4]  252 	call	_FLASH_WaitForLastOperation
      008B7E 84               [ 1]  253 	pop	a
                                    254 ;	lib/src/stm8s_flash.c: 261: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
      008B7F 72 1F 50 5B      [ 1]  255 	bres	20571, #7
                                    256 ;	lib/src/stm8s_flash.c: 262: FLASH->NCR2 |= FLASH_NCR2_NOPT;
      008B83 72 1E 50 5C      [ 1]  257 	bset	20572, #7
                                    258 ;	lib/src/stm8s_flash.c: 263: }
      008B87 5B 02            [ 2]  259 	addw	sp, #2
      008B89 81               [ 4]  260 	ret
                                    261 ;	lib/src/stm8s_flash.c: 270: void FLASH_EraseOptionByte(uint16_t Address)
                                    262 ;	-----------------------------------------
                                    263 ;	 function FLASH_EraseOptionByte
                                    264 ;	-----------------------------------------
      008B8A                        265 _FLASH_EraseOptionByte:
                                    266 ;	lib/src/stm8s_flash.c: 276: FLASH->CR2 |= FLASH_CR2_OPT;
      008B8A 72 1E 50 5B      [ 1]  267 	bset	20571, #7
                                    268 ;	lib/src/stm8s_flash.c: 277: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
      008B8E 72 1F 50 5C      [ 1]  269 	bres	20572, #7
                                    270 ;	lib/src/stm8s_flash.c: 280: if(Address == 0x4800)
      008B92 16 03            [ 2]  271 	ldw	y, (0x03, sp)
                                    272 ;	lib/src/stm8s_flash.c: 283: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      008B94 1E 03            [ 2]  273 	ldw	x, (0x03, sp)
                                    274 ;	lib/src/stm8s_flash.c: 280: if(Address == 0x4800)
      008B96 90 A3 48 00      [ 2]  275 	cpw	y, #0x4800
      008B9A 26 03            [ 1]  276 	jrne	00102$
                                    277 ;	lib/src/stm8s_flash.c: 283: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      008B9C 7F               [ 1]  278 	clr	(x)
      008B9D 20 07            [ 2]  279 	jra	00103$
      008B9F                        280 00102$:
                                    281 ;	lib/src/stm8s_flash.c: 288: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
      008B9F 7F               [ 1]  282 	clr	(x)
                                    283 ;	lib/src/stm8s_flash.c: 289: *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
      008BA0 1E 03            [ 2]  284 	ldw	x, (0x03, sp)
      008BA2 5C               [ 1]  285 	incw	x
      008BA3 A6 FF            [ 1]  286 	ld	a, #0xff
      008BA5 F7               [ 1]  287 	ld	(x), a
      008BA6                        288 00103$:
                                    289 ;	lib/src/stm8s_flash.c: 291: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
      008BA6 4B FD            [ 1]  290 	push	#0xfd
      008BA8 CD 8C 48         [ 4]  291 	call	_FLASH_WaitForLastOperation
      008BAB 84               [ 1]  292 	pop	a
                                    293 ;	lib/src/stm8s_flash.c: 294: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
      008BAC 72 1F 50 5B      [ 1]  294 	bres	20571, #7
                                    295 ;	lib/src/stm8s_flash.c: 295: FLASH->NCR2 |= FLASH_NCR2_NOPT;
      008BB0 72 1E 50 5C      [ 1]  296 	bset	20572, #7
                                    297 ;	lib/src/stm8s_flash.c: 296: }
      008BB4 81               [ 4]  298 	ret
                                    299 ;	lib/src/stm8s_flash.c: 303: uint16_t FLASH_ReadOptionByte(uint16_t Address)
                                    300 ;	-----------------------------------------
                                    301 ;	 function FLASH_ReadOptionByte
                                    302 ;	-----------------------------------------
      008BB5                        303 _FLASH_ReadOptionByte:
      008BB5 52 03            [ 2]  304 	sub	sp, #3
                                    305 ;	lib/src/stm8s_flash.c: 311: value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
      008BB7 1E 06            [ 2]  306 	ldw	x, (0x06, sp)
      008BB9 F6               [ 1]  307 	ld	a, (x)
      008BBA 6B 03            [ 1]  308 	ld	(0x03, sp), a
                                    309 ;	lib/src/stm8s_flash.c: 312: value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
      008BBC E6 01            [ 1]  310 	ld	a, (0x1, x)
      008BBE 6B 01            [ 1]  311 	ld	(0x01, sp), a
                                    312 ;	lib/src/stm8s_flash.c: 315: if(Address == 0x4800)
      008BC0 16 06            [ 2]  313 	ldw	y, (0x06, sp)
                                    314 ;	lib/src/stm8s_flash.c: 317: res_value =	 value_optbyte;
      008BC2 5F               [ 1]  315 	clrw	x
      008BC3 7B 03            [ 1]  316 	ld	a, (0x03, sp)
      008BC5 97               [ 1]  317 	ld	xl, a
                                    318 ;	lib/src/stm8s_flash.c: 315: if(Address == 0x4800)
      008BC6 90 A3 48 00      [ 2]  319 	cpw	y, #0x4800
      008BCA 27 18            [ 1]  320 	jreq	00106$
                                    321 ;	lib/src/stm8s_flash.c: 317: res_value =	 value_optbyte;
                                    322 ;	lib/src/stm8s_flash.c: 321: if(value_optbyte == (uint8_t)(~value_optbyte_complement))
      008BCC 7B 01            [ 1]  323 	ld	a, (0x01, sp)
      008BCE 43               [ 1]  324 	cpl	a
      008BCF 11 03            [ 1]  325 	cp	a, (0x03, sp)
      008BD1 26 0E            [ 1]  326 	jrne	00102$
                                    327 ;	lib/src/stm8s_flash.c: 323: res_value = (uint16_t)((uint16_t)value_optbyte << 8);
      008BD3 4F               [ 1]  328 	clr	a
      008BD4 02               [ 1]  329 	rlwa	x
      008BD5 1F 02            [ 2]  330 	ldw	(0x02, sp), x
                                    331 ;	lib/src/stm8s_flash.c: 324: res_value = res_value | (uint16_t)value_optbyte_complement;
      008BD7 7B 01            [ 1]  332 	ld	a, (0x01, sp)
      008BD9 5F               [ 1]  333 	clrw	x
      008BDA 1A 03            [ 1]  334 	or	a, (0x03, sp)
      008BDC 02               [ 1]  335 	rlwa	x
      008BDD 1A 02            [ 1]  336 	or	a, (0x02, sp)
      008BDF 95               [ 1]  337 	ld	xh, a
                                    338 ;	lib/src/stm8s_flash.c: 328: res_value = FLASH_OPTIONBYTE_ERROR;
      008BE0 BC                     339 	.byte 0xbc
      008BE1                        340 00102$:
      008BE1 AE 55 55         [ 2]  341 	ldw	x, #0x5555
      008BE4                        342 00106$:
                                    343 ;	lib/src/stm8s_flash.c: 331: return(res_value);
                                    344 ;	lib/src/stm8s_flash.c: 332: }
      008BE4 5B 03            [ 2]  345 	addw	sp, #3
      008BE6 81               [ 4]  346 	ret
                                    347 ;	lib/src/stm8s_flash.c: 340: void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
                                    348 ;	-----------------------------------------
                                    349 ;	 function FLASH_SetLowPowerMode
                                    350 ;	-----------------------------------------
      008BE7                        351 _FLASH_SetLowPowerMode:
                                    352 ;	lib/src/stm8s_flash.c: 346: FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT));
      008BE7 C6 50 5A         [ 1]  353 	ld	a, 0x505a
      008BEA A4 F3            [ 1]  354 	and	a, #0xf3
      008BEC C7 50 5A         [ 1]  355 	ld	0x505a, a
                                    356 ;	lib/src/stm8s_flash.c: 349: FLASH->CR1 |= (uint8_t)FLASH_LPMode;
      008BEF C6 50 5A         [ 1]  357 	ld	a, 0x505a
      008BF2 1A 03            [ 1]  358 	or	a, (0x03, sp)
      008BF4 C7 50 5A         [ 1]  359 	ld	0x505a, a
                                    360 ;	lib/src/stm8s_flash.c: 350: }
      008BF7 81               [ 4]  361 	ret
                                    362 ;	lib/src/stm8s_flash.c: 358: void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
                                    363 ;	-----------------------------------------
                                    364 ;	 function FLASH_SetProgrammingTime
                                    365 ;	-----------------------------------------
      008BF8                        366 _FLASH_SetProgrammingTime:
                                    367 ;	lib/src/stm8s_flash.c: 363: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
      008BF8 C6 50 5A         [ 1]  368 	ld	a, 0x505a
      008BFB A4 FE            [ 1]  369 	and	a, #0xfe
      008BFD C7 50 5A         [ 1]  370 	ld	0x505a, a
                                    371 ;	lib/src/stm8s_flash.c: 364: FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
      008C00 C6 50 5A         [ 1]  372 	ld	a, 0x505a
      008C03 1A 03            [ 1]  373 	or	a, (0x03, sp)
      008C05 C7 50 5A         [ 1]  374 	ld	0x505a, a
                                    375 ;	lib/src/stm8s_flash.c: 365: }
      008C08 81               [ 4]  376 	ret
                                    377 ;	lib/src/stm8s_flash.c: 372: FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
                                    378 ;	-----------------------------------------
                                    379 ;	 function FLASH_GetLowPowerMode
                                    380 ;	-----------------------------------------
      008C09                        381 _FLASH_GetLowPowerMode:
                                    382 ;	lib/src/stm8s_flash.c: 374: return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
      008C09 C6 50 5A         [ 1]  383 	ld	a, 0x505a
      008C0C A4 0C            [ 1]  384 	and	a, #0x0c
                                    385 ;	lib/src/stm8s_flash.c: 375: }
      008C0E 81               [ 4]  386 	ret
                                    387 ;	lib/src/stm8s_flash.c: 382: FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
                                    388 ;	-----------------------------------------
                                    389 ;	 function FLASH_GetProgrammingTime
                                    390 ;	-----------------------------------------
      008C0F                        391 _FLASH_GetProgrammingTime:
                                    392 ;	lib/src/stm8s_flash.c: 384: return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
      008C0F C6 50 5A         [ 1]  393 	ld	a, 0x505a
      008C12 A4 01            [ 1]  394 	and	a, #0x01
                                    395 ;	lib/src/stm8s_flash.c: 385: }
      008C14 81               [ 4]  396 	ret
                                    397 ;	lib/src/stm8s_flash.c: 392: uint32_t FLASH_GetBootSize(void)
                                    398 ;	-----------------------------------------
                                    399 ;	 function FLASH_GetBootSize
                                    400 ;	-----------------------------------------
      008C15                        401 _FLASH_GetBootSize:
      008C15 52 04            [ 2]  402 	sub	sp, #4
                                    403 ;	lib/src/stm8s_flash.c: 397: temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
      008C17 C6 50 5D         [ 1]  404 	ld	a, 0x505d
      008C1A 5F               [ 1]  405 	clrw	x
      008C1B 0F 04            [ 1]  406 	clr	(0x04, sp)
      008C1D 08 04            [ 1]  407 	sll	(0x04, sp)
      008C1F 49               [ 1]  408 	rlc	a
      008C20 59               [ 2]  409 	rlcw	x
      008C21 90 95            [ 1]  410 	ld	yh, a
      008C23 7B 04            [ 1]  411 	ld	a, (0x04, sp)
      008C25 90 97            [ 1]  412 	ld	yl, a
                                    413 ;	lib/src/stm8s_flash.c: 400: if(FLASH->FPR == 0xFF)
      008C27 C6 50 5D         [ 1]  414 	ld	a, 0x505d
      008C2A 4C               [ 1]  415 	inc	a
      008C2B 26 0B            [ 1]  416 	jrne	00102$
                                    417 ;	lib/src/stm8s_flash.c: 402: temp += 512;
      008C2D 72 A9 02 00      [ 2]  418 	addw	y, #0x0200
      008C31 9F               [ 1]  419 	ld	a, xl
      008C32 A9 00            [ 1]  420 	adc	a, #0x00
      008C34 02               [ 1]  421 	rlwa	x
      008C35 A9 00            [ 1]  422 	adc	a, #0x00
      008C37 95               [ 1]  423 	ld	xh, a
      008C38                        424 00102$:
                                    425 ;	lib/src/stm8s_flash.c: 406: return(temp);
      008C38 51               [ 1]  426 	exgw	x, y
                                    427 ;	lib/src/stm8s_flash.c: 407: }
      008C39 5B 04            [ 2]  428 	addw	sp, #4
      008C3B 81               [ 4]  429 	ret
                                    430 ;	lib/src/stm8s_flash.c: 417: FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
                                    431 ;	-----------------------------------------
                                    432 ;	 function FLASH_GetFlagStatus
                                    433 ;	-----------------------------------------
      008C3C                        434 _FLASH_GetFlagStatus:
                                    435 ;	lib/src/stm8s_flash.c: 424: if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
      008C3C C6 50 5F         [ 1]  436 	ld	a, 0x505f
      008C3F 14 03            [ 1]  437 	and	a, (0x03, sp)
      008C41 27 03            [ 1]  438 	jreq	00102$
                                    439 ;	lib/src/stm8s_flash.c: 426: status = SET; /* FLASH_FLAG is set */
      008C43 A6 01            [ 1]  440 	ld	a, #0x01
      008C45 81               [ 4]  441 	ret
      008C46                        442 00102$:
                                    443 ;	lib/src/stm8s_flash.c: 430: status = RESET; /* FLASH_FLAG is reset*/
      008C46 4F               [ 1]  444 	clr	a
                                    445 ;	lib/src/stm8s_flash.c: 434: return status;
                                    446 ;	lib/src/stm8s_flash.c: 435: }
      008C47 81               [ 4]  447 	ret
                                    448 ;	lib/src/stm8s_flash.c: 549: IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
                                    449 ;	-----------------------------------------
                                    450 ;	 function FLASH_WaitForLastOperation
                                    451 ;	-----------------------------------------
      008C48                        452 _FLASH_WaitForLastOperation:
                                    453 ;	lib/src/stm8s_flash.c: 551: uint8_t flagstatus = 0x00;
      008C48 4F               [ 1]  454 	clr	a
                                    455 ;	lib/src/stm8s_flash.c: 577: while((flagstatus == 0x00) && (timeout != 0x00))
      008C49 5F               [ 1]  456 	clrw	x
      008C4A 5A               [ 2]  457 	decw	x
      008C4B                        458 00102$:
      008C4B 4D               [ 1]  459 	tnz	a
      008C4C 26 0B            [ 1]  460 	jrne	00104$
      008C4E 5D               [ 2]  461 	tnzw	x
      008C4F 27 08            [ 1]  462 	jreq	00104$
                                    463 ;	lib/src/stm8s_flash.c: 579: flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
      008C51 C6 50 5F         [ 1]  464 	ld	a, 0x505f
      008C54 A4 05            [ 1]  465 	and	a, #0x05
                                    466 ;	lib/src/stm8s_flash.c: 580: timeout--;
      008C56 5A               [ 2]  467 	decw	x
      008C57 20 F2            [ 2]  468 	jra	00102$
      008C59                        469 00104$:
                                    470 ;	lib/src/stm8s_flash.c: 584: if(timeout == 0x00 )
      008C59 5D               [ 2]  471 	tnzw	x
      008C5A 27 01            [ 1]  472 	jreq	00132$
      008C5C 81               [ 4]  473 	ret
      008C5D                        474 00132$:
                                    475 ;	lib/src/stm8s_flash.c: 586: flagstatus = FLASH_STATUS_TIMEOUT;
      008C5D A6 02            [ 1]  476 	ld	a, #0x02
                                    477 ;	lib/src/stm8s_flash.c: 589: return((FLASH_Status_TypeDef)flagstatus);
                                    478 ;	lib/src/stm8s_flash.c: 590: }
      008C5F 81               [ 4]  479 	ret
                                    480 ;	lib/src/stm8s_flash.c: 599: IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
                                    481 ;	-----------------------------------------
                                    482 ;	 function FLASH_EraseBlock
                                    483 ;	-----------------------------------------
      008C60                        484 _FLASH_EraseBlock:
      008C60 52 06            [ 2]  485 	sub	sp, #6
                                    486 ;	lib/src/stm8s_flash.c: 612: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      008C62 7B 0B            [ 1]  487 	ld	a, (0x0b, sp)
      008C64 A1 FD            [ 1]  488 	cp	a, #0xfd
      008C66 26 0A            [ 1]  489 	jrne	00102$
                                    490 ;	lib/src/stm8s_flash.c: 615: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
      008C68 AE 80 00         [ 2]  491 	ldw	x, #0x8000
      008C6B 1F 03            [ 2]  492 	ldw	(0x03, sp), x
      008C6D 5F               [ 1]  493 	clrw	x
      008C6E 1F 01            [ 2]  494 	ldw	(0x01, sp), x
      008C70 20 08            [ 2]  495 	jra	00103$
      008C72                        496 00102$:
                                    497 ;	lib/src/stm8s_flash.c: 620: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
      008C72 AE 40 00         [ 2]  498 	ldw	x, #0x4000
      008C75 1F 03            [ 2]  499 	ldw	(0x03, sp), x
      008C77 5F               [ 1]  500 	clrw	x
      008C78 1F 01            [ 2]  501 	ldw	(0x01, sp), x
      008C7A                        502 00103$:
                                    503 ;	lib/src/stm8s_flash.c: 628: pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
      008C7A 1E 09            [ 2]  504 	ldw	x, (0x09, sp)
      008C7C 58               [ 2]  505 	sllw	x
      008C7D 58               [ 2]  506 	sllw	x
      008C7E 58               [ 2]  507 	sllw	x
      008C7F 58               [ 2]  508 	sllw	x
      008C80 58               [ 2]  509 	sllw	x
      008C81 58               [ 2]  510 	sllw	x
      008C82 1F 05            [ 2]  511 	ldw	(0x05, sp), x
      008C84 72 FB 03         [ 2]  512 	addw	x, (0x03, sp)
                                    513 ;	lib/src/stm8s_flash.c: 632: FLASH->CR2 |= FLASH_CR2_ERASE;
      008C87 72 1A 50 5B      [ 1]  514 	bset	20571, #5
                                    515 ;	lib/src/stm8s_flash.c: 633: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
      008C8B 72 1B 50 5C      [ 1]  516 	bres	20572, #5
                                    517 ;	lib/src/stm8s_flash.c: 637: *pwFlash = (uint32_t)0;
      008C8F 6F 03            [ 1]  518 	clr	(0x3, x)
      008C91 6F 02            [ 1]  519 	clr	(0x2, x)
      008C93 6F 01            [ 1]  520 	clr	(0x1, x)
      008C95 7F               [ 1]  521 	clr	(x)
                                    522 ;	lib/src/stm8s_flash.c: 645: }
      008C96 5B 06            [ 2]  523 	addw	sp, #6
      008C98 81               [ 4]  524 	ret
                                    525 ;	lib/src/stm8s_flash.c: 656: IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
                                    526 ;	-----------------------------------------
                                    527 ;	 function FLASH_ProgramBlock
                                    528 ;	-----------------------------------------
      008C99                        529 _FLASH_ProgramBlock:
      008C99 52 08            [ 2]  530 	sub	sp, #8
                                    531 ;	lib/src/stm8s_flash.c: 665: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
      008C9B 7B 0D            [ 1]  532 	ld	a, (0x0d, sp)
      008C9D A1 FD            [ 1]  533 	cp	a, #0xfd
      008C9F 26 08            [ 1]  534 	jrne	00102$
                                    535 ;	lib/src/stm8s_flash.c: 668: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
      008CA1 AE 80 00         [ 2]  536 	ldw	x, #0x8000
      008CA4 1F 03            [ 2]  537 	ldw	(0x03, sp), x
      008CA6 5F               [ 1]  538 	clrw	x
      008CA7 20 06            [ 2]  539 	jra	00103$
      008CA9                        540 00102$:
                                    541 ;	lib/src/stm8s_flash.c: 673: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
      008CA9 AE 40 00         [ 2]  542 	ldw	x, #0x4000
      008CAC 1F 03            [ 2]  543 	ldw	(0x03, sp), x
      008CAE 5F               [ 1]  544 	clrw	x
      008CAF                        545 00103$:
                                    546 ;	lib/src/stm8s_flash.c: 677: startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
      008CAF 16 0B            [ 2]  547 	ldw	y, (0x0b, sp)
      008CB1 17 07            [ 2]  548 	ldw	(0x07, sp), y
      008CB3 90 5F            [ 1]  549 	clrw	y
      008CB5 17 05            [ 2]  550 	ldw	(0x05, sp), y
      008CB7 16 07            [ 2]  551 	ldw	y, (0x07, sp)
      008CB9 A6 06            [ 1]  552 	ld	a, #0x06
      008CBB                        553 00131$:
      008CBB 90 58            [ 2]  554 	sllw	y
      008CBD 09 06            [ 1]  555 	rlc	(0x06, sp)
      008CBF 09 05            [ 1]  556 	rlc	(0x05, sp)
      008CC1 4A               [ 1]  557 	dec	a
      008CC2 26 F7            [ 1]  558 	jrne	00131$
      008CC4 72 F9 03         [ 2]  559 	addw	y, (0x03, sp)
      008CC7 9F               [ 1]  560 	ld	a, xl
      008CC8 19 06            [ 1]  561 	adc	a, (0x06, sp)
      008CCA 02               [ 1]  562 	rlwa	x
      008CCB 19 05            [ 1]  563 	adc	a, (0x05, sp)
      008CCD 95               [ 1]  564 	ld	xh, a
      008CCE 17 03            [ 2]  565 	ldw	(0x03, sp), y
      008CD0 1F 01            [ 2]  566 	ldw	(0x01, sp), x
                                    567 ;	lib/src/stm8s_flash.c: 683: FLASH->CR2 |= FLASH_CR2_PRG;
      008CD2 C6 50 5B         [ 1]  568 	ld	a, 0x505b
                                    569 ;	lib/src/stm8s_flash.c: 680: if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
      008CD5 0D 0E            [ 1]  570 	tnz	(0x0e, sp)
      008CD7 26 0B            [ 1]  571 	jrne	00105$
                                    572 ;	lib/src/stm8s_flash.c: 683: FLASH->CR2 |= FLASH_CR2_PRG;
      008CD9 AA 01            [ 1]  573 	or	a, #0x01
      008CDB C7 50 5B         [ 1]  574 	ld	0x505b, a
                                    575 ;	lib/src/stm8s_flash.c: 684: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
      008CDE 72 11 50 5C      [ 1]  576 	bres	20572, #0
      008CE2 20 09            [ 2]  577 	jra	00114$
      008CE4                        578 00105$:
                                    579 ;	lib/src/stm8s_flash.c: 689: FLASH->CR2 |= FLASH_CR2_FPRG;
      008CE4 AA 10            [ 1]  580 	or	a, #0x10
      008CE6 C7 50 5B         [ 1]  581 	ld	0x505b, a
                                    582 ;	lib/src/stm8s_flash.c: 690: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
      008CE9 72 19 50 5C      [ 1]  583 	bres	20572, #4
                                    584 ;	lib/src/stm8s_flash.c: 694: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
      008CED                        585 00114$:
      008CED 90 5F            [ 1]  586 	clrw	y
      008CEF                        587 00108$:
                                    588 ;	lib/src/stm8s_flash.c: 696: *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
      008CEF 1E 03            [ 2]  589 	ldw	x, (0x03, sp)
      008CF1 1F 05            [ 2]  590 	ldw	(0x05, sp), x
      008CF3 93               [ 1]  591 	ldw	x, y
      008CF4 72 FB 05         [ 2]  592 	addw	x, (0x05, sp)
      008CF7 1F 07            [ 2]  593 	ldw	(0x07, sp), x
      008CF9 93               [ 1]  594 	ldw	x, y
      008CFA 72 FB 0F         [ 2]  595 	addw	x, (0x0f, sp)
      008CFD F6               [ 1]  596 	ld	a, (x)
      008CFE 1E 07            [ 2]  597 	ldw	x, (0x07, sp)
      008D00 F7               [ 1]  598 	ld	(x), a
                                    599 ;	lib/src/stm8s_flash.c: 694: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
      008D01 90 5C            [ 1]  600 	incw	y
      008D03 90 A3 00 40      [ 2]  601 	cpw	y, #0x0040
      008D07 25 E6            [ 1]  602 	jrc	00108$
                                    603 ;	lib/src/stm8s_flash.c: 698: }
      008D09 5B 08            [ 2]  604 	addw	sp, #8
      008D0B 81               [ 4]  605 	ret
                                    606 	.area CODE
                                    607 	.area CONST
                                    608 	.area INITIALIZER
                                    609 	.area CABS (ABS)
