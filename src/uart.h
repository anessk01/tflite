/*
===============================================================================
 Name        : uart.h
 Author      : Aness AlQawlaq
 Version     : v2
 Copyright   : Tyndall; most of code in UART library is from exploreembedded.com
 Description : UART abstraction functions header file
===============================================================================
*/

#include <lpc17xx.h>
#include <stdio.h>

#define TRUE 1
#define FALSE 0

#ifndef UART_H_
#define UART_H_
#define SBIT_WordLenght    0x00u
#define SBIT_DLAB          0x07u
#define SBIT_FIFO          0x00u
#define SBIT_RxFIFO        0x01u
#define SBIT_TxFIFO        0x02u

#define SBIT_RDR           0x00u
#define SBIT_THRE          0x05u   //UART DEFINITIONS


/****************************************************************************************************/
#define  util_GetBitMask(bit)          (1<<(bit))
#define  util_BitSet(x,bit)            ((x) |=  util_GetBitMask(bit))
#define  util_BitClear(x,bit)          ((x) &= ~util_GetBitMask(bit))
#define  util_BitToggle(x,bit)         ((x) ^=  util_GetBitMask(bit))
#define  util_UpdateBit(x,bit,val)     ((val)? util_BitSet(x,bit): util_BitClear(x,bit))


#define  util_GetBitStatus(x,bit)      (((x)&(util_GetBitMask(bit)))!=0u)
#define  util_IsBitSet(x,bit)          (((x)&(util_GetBitMask(bit)))!=0u)
#define  util_IsBitCleared(x,bit)      (((x)&(util_GetBitMask(bit)))==0u)


#define  util_AreAllBitsSet(x,BitMask) (((x)&(BitMask))==BitMask)
#define  util_AreAnyBitsSet(x,BitMask) (((x)&(BitMask))!=0x00u)
/**************************************************************************************************/


/* Function to initialize the UART0 at specified baud rate */
void uart_init(uint32_t baudrate);

/* Function to transmit a char */
void uart_TxChar(char ch);

/* Function to Receive a char */
char uart_RxChar();

void uart_printf(char *outputStr);

#endif /* UART_H_ */
