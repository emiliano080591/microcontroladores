/*
 * punto1.c
 * Author : Jjat
 */ 

#define  F_CPU 16000000
#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
	int a =50;
	DDRA=0xff;
	DDRD=0xff;
    while (1) 
    {
		if (PINA & (1<<PINA2))
		{
			PORTA |= (1<<PORTA4);
			PORTA |= (1<<PORTA5);
			_delay_ms(20);
			PORTA &= ~(1<<PORTA4);
			PORTA &= ~(1<<PORTA5);
			_delay_ms(20);
		}
		if (PINA & (1<<PINA3))
		{
			PORTA |= (1<<PORTA6);
			PORTA |= (1<<PORTA7);
			_delay_ms(20);
			PORTA &= ~(1<<PORTA6);
			PORTA &= ~(1<<PORTA7);
			_delay_ms(20);
		}
		
    }
}

