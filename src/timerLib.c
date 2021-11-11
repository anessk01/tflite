/*
===============================================================================
 Name        : timerLib.c
 Author      : Aness AlQawlaq
 Version     : v3
 Copyright   : Tyndall
 Description : Timer abstraction functions
===============================================================================
*/

#include "timerLib.h"
#include "uart.h"

unsigned int prescaler(unsigned int timerN){  //function to calculate prescaler for 1us
	unsigned int timerFreq;
	unsigned int timeFreqBits = (LPC_SC->PCLKSEL0>>timerN) & ((1<<0)|(1<<1));
	if(timeFreqBits == 0x00){
		timerFreq = SystemCoreClock/4;
	}
	else if(timeFreqBits == 0x01){
		timerFreq = SystemCoreClock;
	}
	else if(timeFreqBits == 0x02){
		timerFreq = SystemCoreClock/2;
	}
	else if(timeFreqBits == 0x03){
		timerFreq = SystemCoreClock/8;
	}
	else{
		timerFreq = SystemCoreClock/4;
	}
	return(timerFreq/1000000 -1);
}

void timer0Disable(){  //function to initialise timer
	unsigned int isrMask;
	isrMask = LPC_TIM0->IR;
	LPC_TIM0->IR = isrMask;  //clear interrupt bit
	LPC_SC->PCONP&= ~(1<<TIMER0_POWER);  //power off timer
}


void timer0Init(int delayMS){  //function to initialise timer
	LPC_SC->PCONP|= (1<<TIMER0_POWER);
	LPC_TIM0->MCR|= (1<<I_SRI)|(1<<R_SRI);
	LPC_TIM0->PR = prescaler(TIMER0);
	LPC_TIM0->MR0 = 1000*delayMS;
	LPC_TIM0->TCR|= (1<<0);
	for(int i = 0; i<300; i++);  //min is 250
}

void delayMS(int time){
	timer0Init(time); //5ms delay
	while(LPC_TIM0->IR!=0x1);
	timer0Disable();
}

void timer0Init_uS(int delay_uS){  //function to initialise timer
	LPC_SC->PCONP|= (1<<TIMER0_POWER);
	LPC_TIM0->MCR|= (1<<I_SRI)|(1<<R_SRI);
	LPC_TIM0->PR = prescaler(TIMER0);
	LPC_TIM0->MR0 = delay_uS;
	LPC_TIM0->TCR|= (1<<0);
}

void delayUS(int time){
	timer0Init_uS(time); //5ms delay
	while(LPC_TIM0->IR!=0x1);
	timer0Disable();
}



void initialiseNVIC_T1(float msBetweenCalls){  //enables timer 1 and its interrupt NOT USED IN MAIN CODE, CAN BE UTILISED
	LPC_SC->PCONP|= (1<<2);
	LPC_TIM1->MCR|= (1<<I_SRI)|(1<<R_SRI);
	LPC_TIM1->PR = prescaler(4);
	LPC_TIM1->MR0 = 1000*msBetweenCalls;
	LPC_TIM1->TCR|= (1<<0);
	NVIC_EnableIRQ(TIMER1_IRQn);                          /* Enable Timer1 Interrupt */
}


void timer1Disable(){  //function to initialise timer
	unsigned int isrMask;
	isrMask = LPC_TIM1->IR;
	LPC_TIM1->IR = isrMask;  //clear interrupt bit
	LPC_SC->PCONP&= ~(1<<2);  //power off timer
	NVIC_DisableIRQ(TIMER1_IRQn);
}


