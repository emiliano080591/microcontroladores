//**************************************************************
//******** FUNCTIONS FOR SERIAL COMMUNICATION USING UART *******
//**************************************************************
//Controller		: ATmega32 (Clock: 8 Mhz-internal)
//Compiler			: AVR-GCC (winAVR with AVRStudio-4)
//Project Version	: DL_1.0
//Author			: CC Dharmani, Chennai (India)
//			  		  www.dharmanitech.com
//Date				: 10 May 2011
//**************************************************************

#ifndef _UART_ROUTINES_H_
#define _UART_ROUTINES_H_

#include <avr/io.h>


/* Definiciones de funciones */
void usart_init(void);
void usart_init_Master(void);
void usart_init_Slave(void);
unsigned char usart_put(unsigned char);
unsigned char usart_get(void);
void transmitString(char*,int);


#endif
