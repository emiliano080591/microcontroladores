#define F_CPU 4000000UL
#include <avr/io.h>
#include <util/delay.h>
#define DIG 1

int main(void) {

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
  };

  int LETRAS[DIG][8] = { // 6 letras 8 filas ESCOM
    { // Letra E
      0b11111111,
      0b11111111,
      0b11000000,
      0b11111000,
      0b11111000,
      0b11000000,
      0b11111111,
      0b11111111
    }
  };

  int simbolo;
  int d = 0; //numero de desplazamientos del simbolo

  while (1) {

for (int c=0; c < 8;c++)
{
	for (int m = 0; m < DIG; m++) {
        for (int n = 0; n < 40; n++) {
          for (int j = 0; j < 8; j++) {
            PORTA = PORT[j]; // FILA
            simbolo = LETRAS[m][j];
            simbolo = simbolo >> d; //d es numero de desplazamientos
            PORTC = ~simbolo; //COLUMNAS,
            _delay_us(500);

          }
        }
      }

      d++;
 } 

for (int c=0; c < 8;c++)
{

		for (int m = 0; m < DIG; m++) {
        for (int n = 0; n < 40; n++) {
          for (int j = 0; j < 8; j++) {
            PORTA = PORT[j]; // FILA
            simbolo = LETRAS[m][j];
            simbolo = simbolo << d; //d es numero de desplazamientos
            PORTC = ~simbolo; //COLUMNAS,
            _delay_us(500);

          }
        }
      }

      d--;

 }  
    
  }
}
