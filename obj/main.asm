;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _INOV
	.globl _dec200mv
	.globl _inc200mv
	.globl _volt12
	.globl _volt9
	.globl _volt5
	.globl _EEROM_INIT
	.globl _TIM4_ClearFlag
	.globl _TIM4_GetFlagStatus
	.globl _TIM4_SetCounter
	.globl _TIM4_Cmd
	.globl _TIM4_TimeBaseInit
	.globl _GPIO_ReadInputPin
	.globl _GPIO_Init
	.globl _GPIO_DeInit
	.globl _FLASH_SetProgrammingTime
	.globl _FLASH_ReadByte
	.globl _FLASH_ProgramByte
	.globl _FLASH_DeInit
	.globl _FLASH_Unlock
	.globl _CLK_HSIPrescalerConfig
	.globl _dem2
	.globl _dem1
	.globl _changed
	.globl _t1
	.globl _t
	.globl _eep1
	.globl _eepselect
	.globl _eepdata
	.globl _delay_ms
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_eepdata::
	.ds 1
_eepselect::
	.ds 1
_eep1::
	.ds 1
_t::
	.ds 1
_t1::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_changed::
	.ds 2
_dem1::
	.ds 2
_dem2::
	.ds 1
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

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
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ; reset
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	main.c: 23: void delay_ms(uint16_t u16Delay)
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
	sub	sp, #2
;	main.c: 25: while (u16Delay) {
	ldw	y, (0x05, sp)
	ldw	(0x01, sp), y
00104$:
	ldw	x, (0x01, sp)
	jreq	00107$
;	main.c: 26: TIM4_SetCounter(0);
	push	#0x00
	call	_TIM4_SetCounter
	pop	a
;	main.c: 27: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	push	#0x01
	call	_TIM4_ClearFlag
	pop	a
;	main.c: 28: while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
00101$:
	push	#0x01
	call	_TIM4_GetFlagStatus
	addw	sp, #1
	tnz	a
	jreq	00101$
;	main.c: 30: --u16Delay;
	ldw	x, (0x01, sp)
	decw	x
	ldw	(0x01, sp), x
	jra	00104$
00107$:
;	main.c: 32: }
	addw	sp, #2
	ret
;	main.c: 33: void EEROM_INIT(void){
;	-----------------------------------------
;	 function EEROM_INIT
;	-----------------------------------------
_EEROM_INIT:
;	main.c: 34: FLASH_DeInit();
	call	_FLASH_DeInit
;	main.c: 35: FLASH_Unlock(FLASH_MEMTYPE_DATA);
	push	#0xf7
	call	_FLASH_Unlock
	pop	a
;	main.c: 36: FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
	push	#0x00
	call	_FLASH_SetProgrammingTime
	pop	a
;	main.c: 37: }
	ret
;	main.c: 38: void volt5(void){
;	-----------------------------------------
;	 function volt5
;	-----------------------------------------
_volt5:
;	main.c: 39: GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);	//d+ = 0.6v
	push	#0x00
	push	#0x20
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 40: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_LOW_FAST);	//d- = 0v
	push	#0xe0
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 41: GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);	//led 3 on
	push	#0xf0
	push	#0x08
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 42: GPIO_Init(GPIOD, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST);	//led 1 off
	push	#0xe0
	push	#0x02
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 43: GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);	//led 4 off
	push	#0xe0
	push	#0x10
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 44: EEROM_INIT();
	call	_EEROM_INIT
;	main.c: 45: FLASH_ProgramByte(0X4000, 0X25);		//0x4000 address is the first eeprom address
	push	#0x25
	push	#0x00
	push	#0x40
	clrw	x
	pushw	x
	call	_FLASH_ProgramByte
	addw	sp, #5
;	main.c: 46: delay_ms(20);
	push	#0x14
	push	#0x00
	call	_delay_ms
	addw	sp, #2
;	main.c: 47: FLASH_ProgramByte(0X4001, 0X00);		//0x4001 address is the second eeprom address
	push	#0x00
	push	#0x01
	push	#0x40
	clrw	x
	pushw	x
	call	_FLASH_ProgramByte
	addw	sp, #5
;	main.c: 49: }
	ret
;	main.c: 50: void volt9(void){
;	-----------------------------------------
;	 function volt9
;	-----------------------------------------
_volt9:
;	main.c: 51: GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);	//d+ = 3.3v
	push	#0xf0
	push	#0x20
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 52: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);	//d- = 0.6v
	push	#0x00
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 53: GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);	//led 2 on
	push	#0xf0
	push	#0x08
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 54: GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);	//led 4 off
	push	#0xe0
	push	#0x10
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 55: GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);	//led 3 off
	push	#0xe0
	push	#0x08
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 56: EEROM_INIT();
	call	_EEROM_INIT
;	main.c: 57: FLASH_ProgramByte(0X4000, 0X45);		//0x4000 address is the first eeprom address
	push	#0x45
	push	#0x00
	push	#0x40
	clrw	x
	pushw	x
	call	_FLASH_ProgramByte
	addw	sp, #5
;	main.c: 58: delay_ms(20);
	push	#0x14
	push	#0x00
	call	_delay_ms
	addw	sp, #2
;	main.c: 59: FLASH_ProgramByte(0X4001, 0X00);		//0x4000 address is the first eeprom address
	push	#0x00
	push	#0x01
	push	#0x40
	clrw	x
	pushw	x
	call	_FLASH_ProgramByte
	addw	sp, #5
;	main.c: 61: }
	ret
;	main.c: 62: void volt12(void){
;	-----------------------------------------
;	 function volt12
;	-----------------------------------------
_volt12:
;	main.c: 63: GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);	//d+ = 0.6v
	push	#0x00
	push	#0x20
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 64: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);	//d- = 0.6v
	push	#0x00
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 65: GPIO_Init(GPIOD, GPIO_PIN_1, GPIO_MODE_OUT_PP_HIGH_FAST);	//led 1 on
	push	#0xf0
	push	#0x02
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 66: GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);	//led 2 off
	push	#0xe0
	push	#0x08
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 67: EEROM_INIT();
	call	_EEROM_INIT
;	main.c: 68: FLASH_ProgramByte(0X4000, 0X60);		//0x4000 address is the first eeprom address
	push	#0x60
	push	#0x00
	push	#0x40
	clrw	x
	pushw	x
	call	_FLASH_ProgramByte
	addw	sp, #5
;	main.c: 69: delay_ms(20);
	push	#0x14
	push	#0x00
	call	_delay_ms
	addw	sp, #2
;	main.c: 70: FLASH_ProgramByte(0X4001, 0X00);
	push	#0x00
	push	#0x01
	push	#0x40
	clrw	x
	pushw	x
	call	_FLASH_ProgramByte
	addw	sp, #5
;	main.c: 71: }
	ret
;	main.c: 72: void inc200mv(){        //3.3v to 0.6v -> increase 200mv 
;	-----------------------------------------
;	 function inc200mv
;	-----------------------------------------
_inc200mv:
;	main.c: 73: GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);	//d+ = 3.3v
	push	#0xf0
	push	#0x20
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 74: delay_ms(20);
	push	#0x14
	push	#0x00
	call	_delay_ms
	addw	sp, #2
;	main.c: 75: GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);	//d+ = 0.6v
	push	#0x00
	push	#0x20
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 76: delay_ms(20);
	push	#0x14
	push	#0x00
	call	_delay_ms
	addw	sp, #2
;	main.c: 77: }
	ret
;	main.c: 78: void dec200mv(){        //0.6v to 3.3v -> decrease 200mv 
;	-----------------------------------------
;	 function dec200mv
;	-----------------------------------------
_dec200mv:
;	main.c: 79: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);	//d- = 0.6v
	push	#0x00
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 80: delay_ms(20);
	push	#0x14
	push	#0x00
	call	_delay_ms
	addw	sp, #2
;	main.c: 81: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST);	//d+ = 3.3v
	push	#0xf0
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 82: delay_ms(20);    
	push	#0x14
	push	#0x00
	call	_delay_ms
	addw	sp, #2
;	main.c: 83: }
	ret
;	main.c: 84: void INOV(void){
;	-----------------------------------------
;	 function INOV
;	-----------------------------------------
_INOV:
	sub	sp, #4
;	main.c: 86: GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);	//d+ = 0.6v
	push	#0x00
	push	#0x20
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 87: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_LOW_FAST);	//d- = 0v
	push	#0xe0
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 89: delay_ms(500);
	push	#0xf4
	push	#0x01
	call	_delay_ms
	addw	sp, #2
;	main.c: 90: GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);	//d+ = 0.6v
	push	#0x00
	push	#0x20
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 91: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST);	//d- = 3.3v
	push	#0xf0
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 92: GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_HIGH_FAST);	//led 4 on
	push	#0xf0
	push	#0x10
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 93: GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);	//led 3 off
	push	#0xe0
	push	#0x08
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 95: if(changed == 0){           //the first time controller run
	ldw	x, _changed+0
	jreq	00215$
	jp	00109$
00215$:
;	main.c: 96: EEROM_INIT();
	call	_EEROM_INIT
;	main.c: 97: FLASH_ProgramByte(0X4001, 0X01);		//0x4000 address is the first eeprom address
	push	#0x01
	push	#0x01
	push	#0x40
	clrw	x
	pushw	x
	call	_FLASH_ProgramByte
	addw	sp, #5
;	main.c: 98: delay_ms(20);   //delay20ms
	push	#0x14
	push	#0x00
	call	_delay_ms
	addw	sp, #2
;	main.c: 99: FLASH_ProgramByte(0X4000, 0X25);		//0x4000 address is the first eeprom address
	push	#0x25
	push	#0x00
	push	#0x40
	clrw	x
	pushw	x
	call	_FLASH_ProgramByte
	addw	sp, #5
;	main.c: 100: delay_ms(500);   //delay 0.5s button delay
	push	#0xf4
	push	#0x01
	call	_delay_ms
	addw	sp, #2
;	main.c: 101: while(GPIO_ReadInputPin(GPIOD,GPIO_PIN_4)!=0){          // out loop if RA2 = 0 (press mode button)
00105$:
	push	#0x10
	push	#0x0f
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	tnz	a
	jreq	00107$
;	main.c: 102: if(GPIO_ReadInputPin(GPIOD,GPIO_PIN_5)==0){         // increase 0,2V if we press button 2
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	tnz	a
	jrne	00102$
;	main.c: 103: inc200mv();
	call	_inc200mv
;	main.c: 104: dem2 ++;                           
	inc	_dem2+0
;	main.c: 105: t = 0x25 + dem2;                
	ld	a, _dem2+0
	add	a, #0x25
	ld	_t+0, a
;	main.c: 106: FLASH_ProgramByte(0X4000, t);		//0x4000 address is the first eeprom address
	push	_t+0
	push	#0x00
	push	#0x40
	clrw	x
	pushw	x
	call	_FLASH_ProgramByte
	addw	sp, #5
;	main.c: 107: delay_ms(500);   //delay 0.5s         //button delay
	push	#0xf4
	push	#0x01
	call	_delay_ms
	addw	sp, #2
00102$:
;	main.c: 109: if(GPIO_ReadInputPin(GPIOD,GPIO_PIN_6)==0){         // decrease 0,2V if we press button 3
	push	#0x40
	push	#0x0f
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	tnz	a
	jrne	00105$
;	main.c: 110: dec200mv();
	call	_dec200mv
;	main.c: 111: dem2 --;                            
	dec	_dem2+0
;	main.c: 112: t1 = 0x25 + dem2;
	ld	a, _dem2+0
	add	a, #0x25
	ld	_t1+0, a
;	main.c: 113: FLASH_ProgramByte(0X4000, t1);		//0x4000 address is the first eeprom address
	push	_t1+0
	push	#0x00
	push	#0x40
	clrw	x
	pushw	x
	call	_FLASH_ProgramByte
	addw	sp, #5
;	main.c: 114: delay_ms(500);   //delay 0.5s         //button delay
	push	#0xf4
	push	#0x01
	call	_delay_ms
	addw	sp, #2
	jra	00105$
00107$:
;	main.c: 117: volt5();
	call	_volt5
00109$:
;	main.c: 119: if(changed == 1){
	ldw	x, _changed+0
	decw	x
	jreq	00221$
	jp	00131$
00221$:
;	main.c: 124: EEROM_INIT();
	call	_EEROM_INIT
;	main.c: 125: FLASH_ProgramByte(0X4001, 0X01);		//0x4000 address is the first eeprom address
	push	#0x01
	push	#0x01
	push	#0x40
	clrw	x
	pushw	x
	call	_FLASH_ProgramByte
	addw	sp, #5
;	main.c: 126: delay_ms(20);   //delay20ms    
	push	#0x14
	push	#0x00
	call	_delay_ms
	addw	sp, #2
;	main.c: 127: eep1 = FLASH_ReadByte(0x4000);    		
	push	#0x00
	push	#0x40
	clrw	x
	pushw	x
	call	_FLASH_ReadByte
	addw	sp, #4
;	main.c: 128: if(eep1 >= 0x25){    //if we increase voltage
	ld	_eep1+0, a
	cp	a, #0x25
	jrc	00112$
;	main.c: 130: for(int i = 0x00; i<= eep1-0x25 ;i++){
	clrw	x
	ldw	(0x03, sp), x
00126$:
	ld	a, _eep1+0
	clrw	x
	ld	xl, a
	subw	x, #0x0025
	cpw	x, (0x03, sp)
	jrslt	00110$
;	main.c: 131: inc200mv();				
	call	_inc200mv
;	main.c: 132: delay_ms(500);   //delay 20ms
	push	#0xf4
	push	#0x01
	call	_delay_ms
	addw	sp, #2
;	main.c: 130: for(int i = 0x00; i<= eep1-0x25 ;i++){
	ldw	x, (0x03, sp)
	incw	x
	ldw	(0x03, sp), x
	jra	00126$
00110$:
;	main.c: 134: dem2 = eep1 -0x25;
	ld	a, _eep1+0
	sub	a, #0x25
	ld	_dem2+0, a
00112$:
;	main.c: 136: if(eep1 < 0x25){    //if we decrease voltage
	ld	a, _eep1+0
	cp	a, #0x25
	jrnc	00115$
;	main.c: 137: for(int i = 0x00; i <= 0x25 - eep1; i++){
	clrw	x
	ldw	(0x03, sp), x
00129$:
	ld	a, _eep1+0
	ld	(0x02, sp), a
	clr	(0x01, sp)
	ldw	x, #0x0025
	subw	x, (0x01, sp)
	cpw	x, (0x03, sp)
	jrslt	00113$
;	main.c: 138: dec200mv();
	call	_dec200mv
;	main.c: 139: delay_ms(500);   //delay 20ms
	push	#0xf4
	push	#0x01
	call	_delay_ms
	addw	sp, #2
;	main.c: 137: for(int i = 0x00; i <= 0x25 - eep1; i++){
	ldw	x, (0x03, sp)
	incw	x
	ldw	(0x03, sp), x
	jra	00129$
00113$:
;	main.c: 141: dem2 = 0x25 - eep1;
	ld	a, _eep1+0
	ld	(0x04, sp), a
	ld	a, #0x25
	sub	a, (0x04, sp)
	ld	_dem2+0, a
00115$:
;	main.c: 143: delay_ms(500);   //delay 0.5s button delay
	push	#0xf4
	push	#0x01
	call	_delay_ms
	addw	sp, #2
;	main.c: 144: while(GPIO_ReadInputPin(GPIOD,GPIO_PIN_4)!=0){          // out loop if RA2 = 0 (press mode button)
00120$:
	push	#0x10
	push	#0x0f
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	tnz	a
	jreq	00122$
;	main.c: 145: if(GPIO_ReadInputPin(GPIOD,GPIO_PIN_5)==0){         // increase 0,2V if we press button 2
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	tnz	a
	jrne	00117$
;	main.c: 146: inc200mv();
	call	_inc200mv
;	main.c: 147: dem2 ++;                           
	inc	_dem2+0
;	main.c: 148: t = 0x25 + dem2;                
	ld	a, _dem2+0
	add	a, #0x25
	ld	_t+0, a
;	main.c: 149: FLASH_ProgramByte(0X4000, t);		//0x4000 address is the first eeprom address
	push	_t+0
	push	#0x00
	push	#0x40
	clrw	x
	pushw	x
	call	_FLASH_ProgramByte
	addw	sp, #5
;	main.c: 150: delay_ms(500);   //delay 0.5s         //button delay
	push	#0xf4
	push	#0x01
	call	_delay_ms
	addw	sp, #2
00117$:
;	main.c: 152: if(GPIO_ReadInputPin(GPIOD,GPIO_PIN_6)==0){         // decrease 0,2V if we press button 3
	push	#0x40
	push	#0x0f
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	tnz	a
	jrne	00120$
;	main.c: 153: dec200mv();
	call	_dec200mv
;	main.c: 154: dem2 --;                            
	dec	_dem2+0
;	main.c: 155: t1 = 0x25 + dem2;
	ld	a, _dem2+0
	add	a, #0x25
	ld	_t1+0, a
;	main.c: 156: FLASH_ProgramByte(0X4000, t1);		//0x4000 address is the first eeprom address
	push	_t1+0
	push	#0x00
	push	#0x40
	clrw	x
	pushw	x
	call	_FLASH_ProgramByte
	addw	sp, #5
;	main.c: 157: delay_ms(500);   //delay 0.5s         //button delay
	push	#0xf4
	push	#0x01
	call	_delay_ms
	addw	sp, #2
	jra	00120$
00122$:
;	main.c: 160: volt5();       
	addw	sp, #4
	jp	_volt5
00131$:
;	main.c: 163: }
	addw	sp, #4
	ret
;	main.c: 164: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 166: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	push	#0x00
	call	_CLK_HSIPrescalerConfig
	pop	a
;	main.c: 167: TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
	push	#0x7c
	push	#0x07
	call	_TIM4_TimeBaseInit
	addw	sp, #2
;	main.c: 168: TIM4_Cmd(ENABLE);
	push	#0x01
	call	_TIM4_Cmd
	pop	a
;	main.c: 169: GPIO_DeInit(GPIOD);
	push	#0x0f
	push	#0x50
	call	_GPIO_DeInit
	addw	sp, #2
;	main.c: 170: GPIO_DeInit(GPIOC);
	push	#0x0a
	push	#0x50
	call	_GPIO_DeInit
	addw	sp, #2
;	main.c: 171: GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);		//d+ floating	
	push	#0x00
	push	#0x20
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 172: GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_IN_PU_NO_IT);		//button 1
	push	#0x40
	push	#0x10
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 173: GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_IN_PU_NO_IT);		//button 2
	push	#0x40
	push	#0x20
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 174: GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);		//button 3
	push	#0x40
	push	#0x40
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 176: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_LOW_FAST);	//d- low
	push	#0xe0
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 177: delay_ms(20);
	push	#0x14
	push	#0x00
	call	_delay_ms
	addw	sp, #2
;	main.c: 178: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);		//d- floating
	push	#0x00
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 179: delay_ms(1500);	
	push	#0xdc
	push	#0x05
	call	_delay_ms
	addw	sp, #2
;	main.c: 180: GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_LOW_FAST);	//d- low
	push	#0xe0
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	main.c: 181: delay_ms(200);
	push	#0xc8
	push	#0x00
	call	_delay_ms
	addw	sp, #2
;	main.c: 185: EEROM_INIT();
	call	_EEROM_INIT
;	main.c: 186: eepdata = FLASH_ReadByte(0x4000);		//read eeprom at 0x4000 address
	push	#0x00
	push	#0x40
	clrw	x
	pushw	x
	call	_FLASH_ReadByte
	addw	sp, #4
	ld	_eepdata+0, a
;	main.c: 187: delay_ms(20);
	push	#0x14
	push	#0x00
	call	_delay_ms
	addw	sp, #2
;	main.c: 188: eepselect = FLASH_ReadByte(0x4001);		//read eeprom at 0x4001 address
	push	#0x01
	push	#0x40
	clrw	x
	pushw	x
	call	_FLASH_ReadByte
	addw	sp, #4
	ld	_eepselect+0, a
;	main.c: 190: if(eepdata == 0x60){                            //go to 12 volts from the second time run
	ld	a, _eepdata+0
	cp	a, #0x60
	jrne	00102$
;	main.c: 191: dem1 = 3;
	ldw	x, #0x0003
	ldw	_dem1+0, x
00102$:
;	main.c: 193: if(eepdata == 0x25 && eepselect == 0x00 ){      //go to 5 volts from the second time run
	ld	a, _eepdata+0
	sub	a, #0x25
	jrne	00206$
	inc	a
	ld	yl, a
	jra	00207$
00206$:
	clr	a
	ld	yl, a
00207$:
	ld	a, yl
	tnz	a
	jreq	00104$
	tnz	_eepselect+0
	jrne	00104$
;	main.c: 194: dem1 = 0;
	clrw	x
	ldw	_dem1+0, x
00104$:
;	main.c: 196: if(eepdata == 0x45){                            //go to 9 volts from the second time run
	ld	a, _eepdata+0
	cp	a, #0x45
	jrne	00107$
;	main.c: 197: dem1 = 2;
	ldw	x, #0x0002
	ldw	_dem1+0, x
00107$:
;	main.c: 199: if(eepdata == 0x25 && eepselect == 0x01){       //go to INOV mode then go to changed = 0
	ld	a, _eepselect+0
	dec	a
	jrne	00214$
	ld	a, #0x01
	.byte 0x21
00214$:
	clr	a
00215$:
	exg	a, yl
	tnz	a
	exg	a, yl
	jreq	00109$
	tnz	a
	jreq	00109$
;	main.c: 200: dem1 = 1;
	ldw	x, #0x0001
	ldw	_dem1+0, x
;	main.c: 201: changed = 0;
	clrw	x
	ldw	_changed+0, x
00109$:
;	main.c: 203: if(eepdata != 0x25 && eepselect == 0x01){       //go to INOV mode then go to changed = 1
	exg	a, yl
	tnz	a
	exg	a, yl
	jrne	00123$
	tnz	a
	jreq	00123$
;	main.c: 204: dem1 = 1;
	ldw	x, #0x0001
	ldw	_dem1+0, x
;	main.c: 205: changed = 1;            //when we impact increase or decrease button, go to changed = 1
	ldw	x, #0x0001
	ldw	_changed+0, x
;	main.c: 207: while(1) {
00123$:
;	main.c: 208: dem1++;
	ldw	x, _dem1+0
	incw	x
;	main.c: 209: switch(dem1){
	ldw	_dem1+0, x
	decw	x
	jreq	00114$
	ldw	x, _dem1+0
	cpw	x, #0x0002
	jreq	00115$
	ldw	x, _dem1+0
	cpw	x, #0x0003
	jreq	00116$
	ldw	x, _dem1+0
	cpw	x, #0x0004
	jreq	00117$
	jra	00118$
;	main.c: 210: case 1: volt5(); break;
00114$:
	call	_volt5
	jra	00118$
;	main.c: 211: case 2: INOV(); break;
00115$:
	call	_INOV
	jra	00118$
;	main.c: 213: case 3: volt9(); break;
00116$:
	call	_volt9
	jra	00118$
;	main.c: 214: case 4: volt12(); dem1 = 0; break;
00117$:
	call	_volt12
	clrw	x
	ldw	_dem1+0, x
;	main.c: 215: }
00118$:
;	main.c: 216: delay_ms(500);
	push	#0xf4
	push	#0x01
	call	_delay_ms
	addw	sp, #2
;	main.c: 217: while(GPIO_ReadInputPin(GPIOD,GPIO_PIN_4)!=0){
00119$:
	push	#0x10
	push	#0x0f
	push	#0x50
	call	_GPIO_ReadInputPin
	addw	sp, #3
	tnz	a
	jreq	00123$
	jra	00119$
;	main.c: 221: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
__xinit__changed:
	.dw #0x0000
__xinit__dem1:
	.dw #0x0000
__xinit__dem2:
	.db #0x00	; 0
	.area CABS (ABS)
