//C5 AS D+
//C6 AS D-
//D1 AS LED1
//D3 AS LED2
//C3 AS LED3
//C4 AS LED4

//D4 AS BUT1
//D5 AS BUT2
//D6 AS BUT3
#include "stm8s.h"
#include "stm8s_flash.h"
unsigned char eepdata;      
unsigned char eepselect;    //select between normal 5volt and INOV 5volt
unsigned char eep1;
int changed = 0;
int  dem1 = 0;
char dem2 = 0x00;
char t;
char t1;
void delay_ms(uint16_t u16Delay);

void delay_ms(uint16_t u16Delay)
{	
	while (u16Delay) {
		TIM4_SetCounter(0);
		TIM4_ClearFlag(TIM4_FLAG_UPDATE);
		while (TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET) {
		}
		--u16Delay;
	}
}
void EEROM_INIT(void){
	FLASH_DeInit();
	FLASH_Unlock(FLASH_MEMTYPE_DATA);
	FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
}
void volt5(void){
	GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);	//d+ = 0.6v
	GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_LOW_FAST);	//d- = 0v
	GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);	//led 3 on
	GPIO_Init(GPIOD, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST);	//led 1 off
	GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);	//led 4 off
	EEROM_INIT();
	FLASH_ProgramByte(0X4000, 0X25);		//0x4000 address is the first eeprom address
	delay_ms(20);
	FLASH_ProgramByte(0X4001, 0X00);		//0x4001 address is the second eeprom address

}
void volt9(void){
	GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);	//d+ = 3.3v
	GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);	//d- = 0.6v
	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);	//led 2 on
	GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);	//led 4 off
	GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);	//led 3 off
	EEROM_INIT();
	FLASH_ProgramByte(0X4000, 0X45);		//0x4000 address is the first eeprom address
	delay_ms(20);
	FLASH_ProgramByte(0X4001, 0X00);		//0x4000 address is the first eeprom address

}
void volt12(void){
	GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);	//d+ = 0.6v
	GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);	//d- = 0.6v
	GPIO_Init(GPIOD, GPIO_PIN_1, GPIO_MODE_OUT_PP_HIGH_FAST);	//led 1 on
	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);	//led 2 off
	EEROM_INIT();
	FLASH_ProgramByte(0X4000, 0X60);		//0x4000 address is the first eeprom address
	delay_ms(20);
	FLASH_ProgramByte(0X4001, 0X00);
}
void inc200mv(){        //3.3v to 0.6v -> increase 200mv 
	GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);	//d+ = 3.3v
    delay_ms(20);
    GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);	//d+ = 0.6v
    delay_ms(20);
}
void dec200mv(){        //0.6v to 3.3v -> decrease 200mv 
    GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);	//d- = 0.6v
    delay_ms(20);
    GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST);	//d+ = 3.3v
    delay_ms(20);    
}
void INOV(void){
	// //----------go to 5volt mode first
	// GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);	//d+ = 0.6v
	// GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_LOW_FAST);	//d- = 0v
	// //--------------------
	delay_ms(500);
	GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);	//d+ = 0.6v
	GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST);	//d- = 3.3v
	GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_HIGH_FAST);	//led 4 on
	GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);	//led 3 off

	if(changed == 0){           //the first time controller run
        EEROM_INIT();
		FLASH_ProgramByte(0X4001, 0X01);		//0x4000 address is the first eeprom address
        delay_ms(20);   //delay20ms
        FLASH_ProgramByte(0X4000, 0X25);		//0x4000 address is the first eeprom address
        delay_ms(500);   //delay 0.5s button delay
        while(GPIO_ReadInputPin(GPIOD,GPIO_PIN_4)!=0){          // out loop if RA2 = 0 (press mode button)
            if(GPIO_ReadInputPin(GPIOD,GPIO_PIN_5)==0){         // increase 0,2V if we press button 2
                inc200mv();
                dem2 ++;                           
                t = 0x25 + dem2;                
                FLASH_ProgramByte(0X4000, t);		//0x4000 address is the first eeprom address
                delay_ms(500);   //delay 0.5s         //button delay
            }            
            if(GPIO_ReadInputPin(GPIOD,GPIO_PIN_6)==0){         // decrease 0,2V if we press button 3
                dec200mv();
                dem2 --;                            
                t1 = 0x25 + dem2;
                FLASH_ProgramByte(0X4000, t1);		//0x4000 address is the first eeprom address
                delay_ms(500);   //delay 0.5s         //button delay
            }       
        }
        volt5();
    }
	if(changed == 1){
        //select INOV mode--------------------------------

        EEROM_INIT();
		FLASH_ProgramByte(0X4001, 0X01);		//0x4000 address is the first eeprom address
        delay_ms(20);   //delay20ms    
		eep1 = FLASH_ReadByte(0x4000);    		
        if(eep1 >= 0x25){    //if we increase voltage
				
            for(int i = 0x00; i<= eep1-0x25 ;i++){
                inc200mv();				
                delay_ms(500);   // must delay 0.5s to run properly
            }
            dem2 = eep1 -0x25;
        }
        if(eep1 < 0x25){    //if we decrease voltage
            for(int i = 0x00; i <= 0x25 - eep1; i++){
                dec200mv();
                delay_ms(500);   // must delay 0.5s to run properly
            }
            dem2 = 0x25 - eep1;
        }
        delay_ms(500);   //delay 0.5s button delay
        while(GPIO_ReadInputPin(GPIOD,GPIO_PIN_4)!=0){          // out loop if RA2 = 0 (press mode button)
            if(GPIO_ReadInputPin(GPIOD,GPIO_PIN_5)==0){         // increase 0,2V if we press button 2
                inc200mv();
                dem2 ++;                           
                t = 0x25 + dem2;                
                FLASH_ProgramByte(0X4000, t);		//0x4000 address is the first eeprom address
                delay_ms(500);   //delay 0.5s         //button delay
            }            
            if(GPIO_ReadInputPin(GPIOD,GPIO_PIN_6)==0){         // decrease 0,2V if we press button 3
                dec200mv();
                dem2 --;                            
                t1 = 0x25 + dem2;
                FLASH_ProgramByte(0X4000, t1);		//0x4000 address is the first eeprom address
                delay_ms(500);   //delay 0.5s         //button delay
            }       
        }
        volt5();       
    } 

}
void main(void)
{	
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 125 - 1);
	TIM4_Cmd(ENABLE);
	GPIO_DeInit(GPIOD);
	GPIO_DeInit(GPIOC);
	GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);		//d+ floating	
	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_IN_PU_NO_IT);		//button 1
	GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_IN_PU_NO_IT);		//button 2
	GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);		//button 3
	//-------------------------HANDSHAKE-----------------
	GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_LOW_FAST);	//d- low
	delay_ms(20);
	GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);		//d- floating
	delay_ms(1500);	
	GPIO_Init(GPIOC, GPIO_PIN_6, GPIO_MODE_OUT_PP_LOW_FAST);	//d- low
	delay_ms(200);
	//---------------------------------------------------

	//-------------------
	EEROM_INIT();
	eepdata = FLASH_ReadByte(0x4000);		//read eeprom at 0x4000 address
	delay_ms(20);
	eepselect = FLASH_ReadByte(0x4001);		//read eeprom at 0x4001 address
	//-------------------
	if(eepdata == 0x60){                            //go to 12 volts from the second time run
        dem1 = 3;
    }
    if(eepdata == 0x25 && eepselect == 0x00 ){      //go to 5 volts from the second time run
        dem1 = 0;
    }
    if(eepdata == 0x45){                            //go to 9 volts from the second time run
        dem1 = 2;
    }
    if(eepdata == 0x25 && eepselect == 0x01){       //go to INOV mode then go to changed = 0
        dem1 = 1;
		changed = 0;
    }
    if(eepdata != 0x25 && eepselect == 0x01){       //go to INOV mode then go to changed = 1
        dem1 = 1;
        changed = 1;            //when we impact increase or decrease button, go to changed = 1
    }
    while(1) {
		dem1++;
		switch(dem1){
			case 1: volt5(); break;
			case 2: INOV(); break;
			//5volt
			case 3: volt9(); break;
			case 4: volt12(); dem1 = 0; break;
		}
		delay_ms(500);
		while(GPIO_ReadInputPin(GPIOD,GPIO_PIN_4)!=0){

		}
    }
}
