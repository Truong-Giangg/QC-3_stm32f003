;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module stm8s_flash
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _FLASH_Unlock
	.globl _FLASH_Lock
	.globl _FLASH_DeInit
	.globl _FLASH_ITConfig
	.globl _FLASH_EraseByte
	.globl _FLASH_ProgramByte
	.globl _FLASH_ReadByte
	.globl _FLASH_ProgramWord
	.globl _FLASH_ProgramOptionByte
	.globl _FLASH_EraseOptionByte
	.globl _FLASH_ReadOptionByte
	.globl _FLASH_SetLowPowerMode
	.globl _FLASH_SetProgrammingTime
	.globl _FLASH_GetLowPowerMode
	.globl _FLASH_GetProgrammingTime
	.globl _FLASH_GetBootSize
	.globl _FLASH_GetFlagStatus
	.globl _FLASH_WaitForLastOperation
	.globl _FLASH_EraseBlock
	.globl _FLASH_ProgramBlock
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	lib/src/stm8s_flash.c: 87: void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
;	-----------------------------------------
;	 function FLASH_Unlock
;	-----------------------------------------
_FLASH_Unlock:
;	lib/src/stm8s_flash.c: 93: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
	ld	a, (0x03, sp)
	cp	a, #0xfd
	jrne	00102$
;	lib/src/stm8s_flash.c: 95: FLASH->PUKR = FLASH_RASS_KEY1;
	mov	0x5062+0, #0x56
;	lib/src/stm8s_flash.c: 96: FLASH->PUKR = FLASH_RASS_KEY2;
	mov	0x5062+0, #0xae
	ret
00102$:
;	lib/src/stm8s_flash.c: 101: FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
	mov	0x5064+0, #0xae
;	lib/src/stm8s_flash.c: 102: FLASH->DUKR = FLASH_RASS_KEY1;
	mov	0x5064+0, #0x56
;	lib/src/stm8s_flash.c: 104: }
	ret
;	lib/src/stm8s_flash.c: 112: void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
;	-----------------------------------------
;	 function FLASH_Lock
;	-----------------------------------------
_FLASH_Lock:
;	lib/src/stm8s_flash.c: 118: FLASH->IAPSR &= (uint8_t)FLASH_MemType;
	ld	a, 0x505f
	and	a, (0x03, sp)
	ld	0x505f, a
;	lib/src/stm8s_flash.c: 119: }
	ret
;	lib/src/stm8s_flash.c: 126: void FLASH_DeInit(void)
;	-----------------------------------------
;	 function FLASH_DeInit
;	-----------------------------------------
_FLASH_DeInit:
;	lib/src/stm8s_flash.c: 128: FLASH->CR1 = FLASH_CR1_RESET_VALUE;
	mov	0x505a+0, #0x00
;	lib/src/stm8s_flash.c: 129: FLASH->CR2 = FLASH_CR2_RESET_VALUE;
	mov	0x505b+0, #0x00
;	lib/src/stm8s_flash.c: 130: FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
	mov	0x505c+0, #0xff
;	lib/src/stm8s_flash.c: 131: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
	bres	20575, #3
;	lib/src/stm8s_flash.c: 132: FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
	bres	20575, #1
;	lib/src/stm8s_flash.c: 133: (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
	ld	a, 0x505f
;	lib/src/stm8s_flash.c: 134: }
	ret
;	lib/src/stm8s_flash.c: 142: void FLASH_ITConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function FLASH_ITConfig
;	-----------------------------------------
_FLASH_ITConfig:
;	lib/src/stm8s_flash.c: 149: FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
	ld	a, 0x505a
;	lib/src/stm8s_flash.c: 147: if(NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/src/stm8s_flash.c: 149: FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
	or	a, #0x02
	ld	0x505a, a
	ret
00102$:
;	lib/src/stm8s_flash.c: 153: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
	and	a, #0xfd
	ld	0x505a, a
;	lib/src/stm8s_flash.c: 155: }
	ret
;	lib/src/stm8s_flash.c: 164: void FLASH_EraseByte(uint32_t Address)
;	-----------------------------------------
;	 function FLASH_EraseByte
;	-----------------------------------------
_FLASH_EraseByte:
;	lib/src/stm8s_flash.c: 170: *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE;
	ldw	x, (0x05, sp)
	clr	(x)
;	lib/src/stm8s_flash.c: 171: }
	ret
;	lib/src/stm8s_flash.c: 181: void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
;	-----------------------------------------
;	 function FLASH_ProgramByte
;	-----------------------------------------
_FLASH_ProgramByte:
;	lib/src/stm8s_flash.c: 185: *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
	ldw	x, (0x05, sp)
	ld	a, (0x07, sp)
	ld	(x), a
;	lib/src/stm8s_flash.c: 186: }
	ret
;	lib/src/stm8s_flash.c: 195: uint8_t FLASH_ReadByte(uint32_t Address)
;	-----------------------------------------
;	 function FLASH_ReadByte
;	-----------------------------------------
_FLASH_ReadByte:
;	lib/src/stm8s_flash.c: 201: return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
	ldw	x, (0x05, sp)
	ld	a, (x)
;	lib/src/stm8s_flash.c: 202: }
	ret
;	lib/src/stm8s_flash.c: 212: void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
;	-----------------------------------------
;	 function FLASH_ProgramWord
;	-----------------------------------------
_FLASH_ProgramWord:
	sub	sp, #2
;	lib/src/stm8s_flash.c: 218: FLASH->CR2 |= FLASH_CR2_WPRG;
	bset	20571, #6
;	lib/src/stm8s_flash.c: 219: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
	bres	20572, #6
;	lib/src/stm8s_flash.c: 222: *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
	ldw	y, (0x07, sp)
	ldw	x, sp
	addw	x, #9
	ld	a, (x)
	ld	(y), a
;	lib/src/stm8s_flash.c: 224: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1);
	ldw	x, y
	incw	x
	ldw	(0x01, sp), x
	ldw	x, sp
	addw	x, #9
	ld	a, (0x1, x)
	ldw	x, (0x01, sp)
	ld	(x), a
;	lib/src/stm8s_flash.c: 226: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2);
	ldw	x, y
	incw	x
	incw	x
	ldw	(0x01, sp), x
	ldw	x, sp
	addw	x, #9
	ld	a, (0x2, x)
	ldw	x, (0x01, sp)
	ld	(x), a
;	lib/src/stm8s_flash.c: 228: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3);
	addw	y, #0x0003
	ldw	x, sp
	addw	x, #9
	ld	a, (0x3, x)
	ld	(y), a
;	lib/src/stm8s_flash.c: 229: }
	addw	sp, #2
	ret
;	lib/src/stm8s_flash.c: 237: void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
;	-----------------------------------------
;	 function FLASH_ProgramOptionByte
;	-----------------------------------------
_FLASH_ProgramOptionByte:
	sub	sp, #2
;	lib/src/stm8s_flash.c: 243: FLASH->CR2 |= FLASH_CR2_OPT;
	bset	20571, #7
;	lib/src/stm8s_flash.c: 244: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
	bres	20572, #7
;	lib/src/stm8s_flash.c: 247: if(Address == 0x4800)
	ldw	x, (0x05, sp)
;	lib/src/stm8s_flash.c: 250: *((NEAR uint8_t*)Address) = Data;
	ldw	y, (0x05, sp)
	ldw	(0x01, sp), y
;	lib/src/stm8s_flash.c: 247: if(Address == 0x4800)
	cpw	x, #0x4800
	jrne	00102$
;	lib/src/stm8s_flash.c: 250: *((NEAR uint8_t*)Address) = Data;
	ldw	x, (0x01, sp)
	ld	a, (0x07, sp)
	ld	(x), a
	jra	00103$
00102$:
;	lib/src/stm8s_flash.c: 255: *((NEAR uint8_t*)Address) = Data;
	ldw	y, (0x01, sp)
	ld	a, (0x07, sp)
	ld	(y), a
;	lib/src/stm8s_flash.c: 256: *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
	incw	x
	ldw	(0x01, sp), x
	ld	a, (0x07, sp)
	cpl	a
	ldw	x, (0x01, sp)
	ld	(x), a
00103$:
;	lib/src/stm8s_flash.c: 258: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
	push	#0xfd
	call	_FLASH_WaitForLastOperation
	pop	a
;	lib/src/stm8s_flash.c: 261: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
	bres	20571, #7
;	lib/src/stm8s_flash.c: 262: FLASH->NCR2 |= FLASH_NCR2_NOPT;
	bset	20572, #7
;	lib/src/stm8s_flash.c: 263: }
	addw	sp, #2
	ret
;	lib/src/stm8s_flash.c: 270: void FLASH_EraseOptionByte(uint16_t Address)
;	-----------------------------------------
;	 function FLASH_EraseOptionByte
;	-----------------------------------------
_FLASH_EraseOptionByte:
;	lib/src/stm8s_flash.c: 276: FLASH->CR2 |= FLASH_CR2_OPT;
	bset	20571, #7
;	lib/src/stm8s_flash.c: 277: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
	bres	20572, #7
;	lib/src/stm8s_flash.c: 280: if(Address == 0x4800)
	ldw	y, (0x03, sp)
;	lib/src/stm8s_flash.c: 283: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
	ldw	x, (0x03, sp)
;	lib/src/stm8s_flash.c: 280: if(Address == 0x4800)
	cpw	y, #0x4800
	jrne	00102$
;	lib/src/stm8s_flash.c: 283: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
	clr	(x)
	jra	00103$
00102$:
;	lib/src/stm8s_flash.c: 288: *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
	clr	(x)
;	lib/src/stm8s_flash.c: 289: *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
	ldw	x, (0x03, sp)
	incw	x
	ld	a, #0xff
	ld	(x), a
00103$:
;	lib/src/stm8s_flash.c: 291: FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
	push	#0xfd
	call	_FLASH_WaitForLastOperation
	pop	a
;	lib/src/stm8s_flash.c: 294: FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
	bres	20571, #7
;	lib/src/stm8s_flash.c: 295: FLASH->NCR2 |= FLASH_NCR2_NOPT;
	bset	20572, #7
;	lib/src/stm8s_flash.c: 296: }
	ret
;	lib/src/stm8s_flash.c: 303: uint16_t FLASH_ReadOptionByte(uint16_t Address)
;	-----------------------------------------
;	 function FLASH_ReadOptionByte
;	-----------------------------------------
_FLASH_ReadOptionByte:
	sub	sp, #3
;	lib/src/stm8s_flash.c: 311: value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
	ldw	x, (0x06, sp)
	ld	a, (x)
	ld	(0x03, sp), a
;	lib/src/stm8s_flash.c: 312: value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
	ld	a, (0x1, x)
	ld	(0x01, sp), a
;	lib/src/stm8s_flash.c: 315: if(Address == 0x4800)
	ldw	y, (0x06, sp)
;	lib/src/stm8s_flash.c: 317: res_value =	 value_optbyte;
	clrw	x
	ld	a, (0x03, sp)
	ld	xl, a
;	lib/src/stm8s_flash.c: 315: if(Address == 0x4800)
	cpw	y, #0x4800
	jreq	00106$
;	lib/src/stm8s_flash.c: 317: res_value =	 value_optbyte;
;	lib/src/stm8s_flash.c: 321: if(value_optbyte == (uint8_t)(~value_optbyte_complement))
	ld	a, (0x01, sp)
	cpl	a
	cp	a, (0x03, sp)
	jrne	00102$
;	lib/src/stm8s_flash.c: 323: res_value = (uint16_t)((uint16_t)value_optbyte << 8);
	clr	a
	rlwa	x
	ldw	(0x02, sp), x
;	lib/src/stm8s_flash.c: 324: res_value = res_value | (uint16_t)value_optbyte_complement;
	ld	a, (0x01, sp)
	clrw	x
	or	a, (0x03, sp)
	rlwa	x
	or	a, (0x02, sp)
	ld	xh, a
;	lib/src/stm8s_flash.c: 328: res_value = FLASH_OPTIONBYTE_ERROR;
	.byte 0xbc
00102$:
	ldw	x, #0x5555
00106$:
;	lib/src/stm8s_flash.c: 331: return(res_value);
;	lib/src/stm8s_flash.c: 332: }
	addw	sp, #3
	ret
;	lib/src/stm8s_flash.c: 340: void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
;	-----------------------------------------
;	 function FLASH_SetLowPowerMode
;	-----------------------------------------
_FLASH_SetLowPowerMode:
;	lib/src/stm8s_flash.c: 346: FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT));
	ld	a, 0x505a
	and	a, #0xf3
	ld	0x505a, a
;	lib/src/stm8s_flash.c: 349: FLASH->CR1 |= (uint8_t)FLASH_LPMode;
	ld	a, 0x505a
	or	a, (0x03, sp)
	ld	0x505a, a
;	lib/src/stm8s_flash.c: 350: }
	ret
;	lib/src/stm8s_flash.c: 358: void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
;	-----------------------------------------
;	 function FLASH_SetProgrammingTime
;	-----------------------------------------
_FLASH_SetProgrammingTime:
;	lib/src/stm8s_flash.c: 363: FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
	ld	a, 0x505a
	and	a, #0xfe
	ld	0x505a, a
;	lib/src/stm8s_flash.c: 364: FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
	ld	a, 0x505a
	or	a, (0x03, sp)
	ld	0x505a, a
;	lib/src/stm8s_flash.c: 365: }
	ret
;	lib/src/stm8s_flash.c: 372: FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
;	-----------------------------------------
;	 function FLASH_GetLowPowerMode
;	-----------------------------------------
_FLASH_GetLowPowerMode:
;	lib/src/stm8s_flash.c: 374: return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
	ld	a, 0x505a
	and	a, #0x0c
;	lib/src/stm8s_flash.c: 375: }
	ret
;	lib/src/stm8s_flash.c: 382: FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
;	-----------------------------------------
;	 function FLASH_GetProgrammingTime
;	-----------------------------------------
_FLASH_GetProgrammingTime:
;	lib/src/stm8s_flash.c: 384: return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
	ld	a, 0x505a
	and	a, #0x01
;	lib/src/stm8s_flash.c: 385: }
	ret
;	lib/src/stm8s_flash.c: 392: uint32_t FLASH_GetBootSize(void)
;	-----------------------------------------
;	 function FLASH_GetBootSize
;	-----------------------------------------
_FLASH_GetBootSize:
	sub	sp, #4
;	lib/src/stm8s_flash.c: 397: temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
	ld	a, 0x505d
	clrw	x
	clr	(0x04, sp)
	sll	(0x04, sp)
	rlc	a
	rlcw	x
	ld	yh, a
	ld	a, (0x04, sp)
	ld	yl, a
;	lib/src/stm8s_flash.c: 400: if(FLASH->FPR == 0xFF)
	ld	a, 0x505d
	inc	a
	jrne	00102$
;	lib/src/stm8s_flash.c: 402: temp += 512;
	addw	y, #0x0200
	ld	a, xl
	adc	a, #0x00
	rlwa	x
	adc	a, #0x00
	ld	xh, a
00102$:
;	lib/src/stm8s_flash.c: 406: return(temp);
	exgw	x, y
;	lib/src/stm8s_flash.c: 407: }
	addw	sp, #4
	ret
;	lib/src/stm8s_flash.c: 417: FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
;	-----------------------------------------
;	 function FLASH_GetFlagStatus
;	-----------------------------------------
_FLASH_GetFlagStatus:
;	lib/src/stm8s_flash.c: 424: if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
	ld	a, 0x505f
	and	a, (0x03, sp)
	jreq	00102$
;	lib/src/stm8s_flash.c: 426: status = SET; /* FLASH_FLAG is set */
	ld	a, #0x01
	ret
00102$:
;	lib/src/stm8s_flash.c: 430: status = RESET; /* FLASH_FLAG is reset*/
	clr	a
;	lib/src/stm8s_flash.c: 434: return status;
;	lib/src/stm8s_flash.c: 435: }
	ret
;	lib/src/stm8s_flash.c: 549: IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
;	-----------------------------------------
;	 function FLASH_WaitForLastOperation
;	-----------------------------------------
_FLASH_WaitForLastOperation:
;	lib/src/stm8s_flash.c: 551: uint8_t flagstatus = 0x00;
	clr	a
;	lib/src/stm8s_flash.c: 577: while((flagstatus == 0x00) && (timeout != 0x00))
	clrw	x
	decw	x
00102$:
	tnz	a
	jrne	00104$
	tnzw	x
	jreq	00104$
;	lib/src/stm8s_flash.c: 579: flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
	ld	a, 0x505f
	and	a, #0x05
;	lib/src/stm8s_flash.c: 580: timeout--;
	decw	x
	jra	00102$
00104$:
;	lib/src/stm8s_flash.c: 584: if(timeout == 0x00 )
	tnzw	x
	jreq	00132$
	ret
00132$:
;	lib/src/stm8s_flash.c: 586: flagstatus = FLASH_STATUS_TIMEOUT;
	ld	a, #0x02
;	lib/src/stm8s_flash.c: 589: return((FLASH_Status_TypeDef)flagstatus);
;	lib/src/stm8s_flash.c: 590: }
	ret
;	lib/src/stm8s_flash.c: 599: IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
;	-----------------------------------------
;	 function FLASH_EraseBlock
;	-----------------------------------------
_FLASH_EraseBlock:
	sub	sp, #6
;	lib/src/stm8s_flash.c: 612: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
	ld	a, (0x0b, sp)
	cp	a, #0xfd
	jrne	00102$
;	lib/src/stm8s_flash.c: 615: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
	ldw	x, #0x8000
	ldw	(0x03, sp), x
	clrw	x
	ldw	(0x01, sp), x
	jra	00103$
00102$:
;	lib/src/stm8s_flash.c: 620: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
	ldw	x, #0x4000
	ldw	(0x03, sp), x
	clrw	x
	ldw	(0x01, sp), x
00103$:
;	lib/src/stm8s_flash.c: 628: pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
	ldw	x, (0x09, sp)
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x05, sp), x
	addw	x, (0x03, sp)
;	lib/src/stm8s_flash.c: 632: FLASH->CR2 |= FLASH_CR2_ERASE;
	bset	20571, #5
;	lib/src/stm8s_flash.c: 633: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
	bres	20572, #5
;	lib/src/stm8s_flash.c: 637: *pwFlash = (uint32_t)0;
	clr	(0x3, x)
	clr	(0x2, x)
	clr	(0x1, x)
	clr	(x)
;	lib/src/stm8s_flash.c: 645: }
	addw	sp, #6
	ret
;	lib/src/stm8s_flash.c: 656: IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
;	-----------------------------------------
;	 function FLASH_ProgramBlock
;	-----------------------------------------
_FLASH_ProgramBlock:
	sub	sp, #8
;	lib/src/stm8s_flash.c: 665: if(FLASH_MemType == FLASH_MEMTYPE_PROG)
	ld	a, (0x0d, sp)
	cp	a, #0xfd
	jrne	00102$
;	lib/src/stm8s_flash.c: 668: startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
	ldw	x, #0x8000
	ldw	(0x03, sp), x
	clrw	x
	jra	00103$
00102$:
;	lib/src/stm8s_flash.c: 673: startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
	ldw	x, #0x4000
	ldw	(0x03, sp), x
	clrw	x
00103$:
;	lib/src/stm8s_flash.c: 677: startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
	ldw	y, (0x0b, sp)
	ldw	(0x07, sp), y
	clrw	y
	ldw	(0x05, sp), y
	ldw	y, (0x07, sp)
	ld	a, #0x06
00131$:
	sllw	y
	rlc	(0x06, sp)
	rlc	(0x05, sp)
	dec	a
	jrne	00131$
	addw	y, (0x03, sp)
	ld	a, xl
	adc	a, (0x06, sp)
	rlwa	x
	adc	a, (0x05, sp)
	ld	xh, a
	ldw	(0x03, sp), y
	ldw	(0x01, sp), x
;	lib/src/stm8s_flash.c: 683: FLASH->CR2 |= FLASH_CR2_PRG;
	ld	a, 0x505b
;	lib/src/stm8s_flash.c: 680: if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
	tnz	(0x0e, sp)
	jrne	00105$
;	lib/src/stm8s_flash.c: 683: FLASH->CR2 |= FLASH_CR2_PRG;
	or	a, #0x01
	ld	0x505b, a
;	lib/src/stm8s_flash.c: 684: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
	bres	20572, #0
	jra	00114$
00105$:
;	lib/src/stm8s_flash.c: 689: FLASH->CR2 |= FLASH_CR2_FPRG;
	or	a, #0x10
	ld	0x505b, a
;	lib/src/stm8s_flash.c: 690: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
	bres	20572, #4
;	lib/src/stm8s_flash.c: 694: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
00114$:
	clrw	y
00108$:
;	lib/src/stm8s_flash.c: 696: *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
	ldw	x, (0x03, sp)
	ldw	(0x05, sp), x
	ldw	x, y
	addw	x, (0x05, sp)
	ldw	(0x07, sp), x
	ldw	x, y
	addw	x, (0x0f, sp)
	ld	a, (x)
	ldw	x, (0x07, sp)
	ld	(x), a
;	lib/src/stm8s_flash.c: 694: for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
	incw	y
	cpw	y, #0x0040
	jrc	00108$
;	lib/src/stm8s_flash.c: 698: }
	addw	sp, #8
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
