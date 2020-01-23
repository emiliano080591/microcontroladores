#include "UART_routines.h"
#include <avr/io.h>


//****************************************************************************
// Inicializa el USART0.
//****************************************************************************
void usart_init(void)
{
     /* Configurar baud rate   */
	UCSR0A=0X00;
    //Valores calculados desde codevision para un baudrate de 9600
    UBRR0H=0x00;
    UBRR0L=0x67;
	/* Habilitar módulos Receptor y Transmisor  */
	UCSR0B = (1<<RXEN0)|(1<<TXEN0);
    /* Configurar modo de operación Asíncrono y formato de frame a
     * 8 bits de datos, 1 bit de stop y sin bit de paridad.  */
    UCSR0C = (1<<UCSZ01)|(1<<UCSZ00);
}

void usart_init_Master(void){
	// USART0 initialization
	// Communication Parameters: 8 Data, 1 Stop, No Parity
	// USART0 Receiver: On
	// USART0 Transmitter: On
	// USART0 Mode: Sync. Master UCPOL=1
	// USART0 Baud Rate: 9600
	PORTE=0x00;
	DDRE=0x04;//Salida de Señal de Reloj por PE2
	UCSR0A=0x00;
	UCSR0B=0x18;
	UCSR0C=0x47;
	UBRR0H=0x03;
	UBRR0L=0x40;
	
}

void usart_init_Slave(void){
	// USART0 initialization
	// Communication Parameters: 8 Data, 1 Stop, No Parity
	// USART0 Receiver: On
	// USART0 Transmitter: On
	// USART0 Mode: Sync. Slave UCPOL=1
	UCSR0A=0x00;
	UCSR0B=0x18;
	UCSR0C=0x47;
}

//****************************************************************************
// Transmite el byte por el USART
//****************************************************************************
unsigned char usart_put(unsigned char dato)
{
      /* Esperar a que haya espacio en el buffer de transmisión */
      while ((UCSR0A & (1<<UDRE0)) == 0 );

      /* Colocar dato en el buffer de transmisión */
      UDR0 = dato;
      return dato;
}

//****************************************************************************
// Recibe un byte de dato del USART
//****************************************************************************
unsigned char usart_get(void)
{
   /* Esperar a que haya al menos un dato en el buffer de recepción */
   while ((UCSR0A & (1<<RXC0)) == 0 );
   
   /* Leer y retornar el dato menos reciente del buffer de recepción */
   return UDR0;


}

//***************************************************
//Function to transmit a String
//***************************************************

void transmitString(char *cadena,int longitud)
{
	unsigned char i;
	for(i=0;(i<longitud);i++)
	
	{usart_put(cadena[i]);
	}
	usart_put(0x0A);
	usart_put(0x0D);
	
}

