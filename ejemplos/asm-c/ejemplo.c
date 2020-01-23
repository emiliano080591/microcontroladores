#include <avr/io.h>
#define step1 8
#define step2 9
#define step3 2
#define step4 1

void config_io(void){
	DDRC=0x0f;
	DDRD=0b1111101;
	PORTD=_BV(PD2);
}

void retardo(void){
	int i;
	for (i=0; i<25000; i++);
}

void secuencia(void){
	PORTC=step1;
	retardo();
	PORTC=step2;
	retardo();
	PORTC=step3;
	retardo();
	PORTC=step4;
	retardo();
}

void secuencia2(void){
	PORTC=step4;
	retardo();
	PORTC=step3;
	retardo();
	PORTC=step2;
	retardo();
	PORTC=step1;
	retardo();
}

int main(void)
{
	config_io();
	while(1){
		switch(PIND){
			case(4):
				secuencia();
				break;
			case(0):
				secuencia2();
				break;
		}
	}
}
