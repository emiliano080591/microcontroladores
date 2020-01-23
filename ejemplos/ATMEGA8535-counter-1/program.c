//#define F_CPU 16000000UL
#define F_CPU 1000000UL

#include <avr/io.h>
#include <util/delay.h>

int main(void){
	DDRA=0xFF; //Defino el Puerto D como salida

	int i;
	int cont[9]={0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x27,0x7F,0x6F}; //Defino los numeros en Hexa del 0 a 9
	while(1){ //Ciclo Infinito
		PORTA=0x3F; //Inicializo el Display en 0
		for(i=0;i<=9;i++){ //Comienzo a cargar Numero por Numero en el Display
			_delay_ms(500);; //Espero 1 segundo para cargar el siguiente Numero
			PORTA=cont[i]; //Imprimo el Numero en el Puerto D
			// arriba no se ve bien pero es cont[ i ], quitan los espacion antes y despues de la i
		}
	}
}
