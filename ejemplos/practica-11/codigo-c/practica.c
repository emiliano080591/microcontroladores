
#ifndef F_CPU
#define F_CPU 4000000UL // Clock speed
#endif

#define D0 eS_PORTC0
#define D1 eS_PORTC1
#define D2 eS_PORTC2
#define D3 eS_PORTC3
#define D4 eS_PORTC4
#define D5 eS_PORTC5
#define D6 eS_PORTC6
#define D7 eS_PORTC7
#define RS eS_PORTA6
#define EN eS_PORTA7

#include <avr/io.h>
#include <util/delay.h>
#include "lcd.h"
int main(void)
{
    DDRA = 0xFF;
	DDRC = 0xFF;
	int i;
	Lcd8_Init();
	while(1)
	{
		Lcd8_Set_Cursor(1,1);
		Lcd8_Write_String("ESCOMIO LCD");
		for(i=0;i<15;i++)
		{
			_delay_ms(100);
			Lcd8_Shift_Left();
		}
		for(i=0;i<15;i++)
		{
			_delay_ms(100);
			Lcd8_Shift_Right();
		}
		Lcd8_Clear();
	}

	}
