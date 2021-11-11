/*
===============================================================================
 Name        : timerLib.h
 Author      : Aness AlQawlaq
 Version     : v3
 Copyright   : Tyndall
 Description : Timer abstraction functions header file
===============================================================================
*/

#include <lpc17xx.h>
#include <stdio.h>

#define TRUE 1
#define FALSE 0

#ifndef TIMERLIB_H_
#define TIMERLIB_H_

#define TIMER0_POWER 1   //TIMER DEFINITIONS
#define I_SRI 0
#define R_SRI 1
#define CLOCKSPEED 100E6
#define TIMER0 2


unsigned int prescaler(unsigned int timerN);  //function to calculate prescaler for 1us
void timer0Disable();  //function to initialise timer
void timer0Init(int delayMS);  //function to initialise timer
void delayMS(int time);  //function to set delay in ms
void timer0Init_uS(int delay_uS);
void delayUS(int time);
void initialiseNVIC_T1(float msBetweenCalls);
void timer1Disable();

#endif /* TIMERLIB_H_ */
