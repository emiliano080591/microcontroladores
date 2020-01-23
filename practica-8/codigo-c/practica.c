#define F_CPU 4000000UL
#include <avr/io.h>
#include <util/delay.h>

// Declare your global variables here

unsigned char tecla = 0, lectura = 0, tecla_anterior = 0;
const char tabla7segmentos[16] = {
  0x3f,
  0x06,
  0x5b,
  0x4f,
  0x66,
  0x6d,
  0x7c,
  0x07,
  0x7f,
  0x6f,
  0x77,
  0x7C,
  0x39,
  0x5E,
  0x79,
  0x71
};
unsigned char aux1 = 0, aux2 = 0, aux3 = 0, aux4 = 0;

int main(void) {
  //INICIALIZAMOS LOS PUERTOS COMO SALIDAS
  DDRA = 0xFF;
  DDRC = 0xFF;

  char PORT[8] = {
    1,
    2,
    4,
    8,
    16,
    32,
    64,
    128
  }; //valores de pines del  PORTC

  //codigo de NOMBRE en hexadecimal
  static int LETRAS[5][8] = { // 6 letras 8 filas
    {
      255, // 11111111
      255, // 11111111
      192, // 11000000
      248, // 11111000
      248, // 11111000
      192, // 11000000
      255, // 11111111
      255 //  11111111
    },
    {
255, 192, 254, 255, 3, 3, 255, 255
    },
    {
      255, 255, 192, 192, 192, 192, 255, 255
    },
    {
     60,  // 00111100
      126, // 01111110
      195, // 11000011
      195, // 11000011
      195, // 11000011
      195, // 11000011
      126, // 01111110
      60   // 00111100
    },
    {
     195, 231, 231, 219, 219, 195, 195, 195
    },
  };

  char LET[] = {
    0,
    1,
    2,
    3,
    4
  }; ///el orden de como se ejecutara cada linea de arreglos

  while (1) {
    for (int m = 0; m < sizeof LET; m++) {

      for (int n = 0; n < 100; n++) //EJECUTAR 200 VECES
      {
        for (int j = 0; j < 8; j++) {
          PORTA = PORT[j]; // FILA
          PORTC = ~LETRAS[3][j]; //MOSTRAR LA MITAD DEL CARACTER  (COLUMNA)
		  _delay_us(500);

        }
      }
    }
  }
}
