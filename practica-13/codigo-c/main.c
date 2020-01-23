/*
 * LCD.c
 *
 * Created: 26/11/2019 10:19:36 p. m.
 * Author : Thebl
 */ 

#define F_CPU 16000000UL		//freq 16 MHz
#include <avr/io.h>
#include <util/delay.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

#include "lcd.h"

void init();

int main(void)
{
DDRA = 0xFF;
PORTA = 0b00010000;
char key_press;
int i=0,a=0,l1=0,l2=0;
char operator='b';
char n1[16],n2[16];
init();
while (1)
{
key_press = kbrd_read();
if (key_press  != 0)
{
lcd_gotoxy(i,0);
lcd_putc(key_press);
lcd_putc('_');
n1[i] = key_press;
i++;
if ((key_press == '+'|| key_press =='-'||key_press =='x'||key_press =='/'))
{
a = 0;
operator = key_press;
}
n2[a] = key_press;
a++;
}
if (key_press == '=')
{
// lcd_clrscr();
l2 = a-2;
l1 = i-l2-2;
float operator1,operator2,resultado;
char num1[16],num2[16],res[16],res1[16];

for (i=0;i<l1;i++)
{
num1[i] = n1[i];
}
for (i=0;i<l2;i++)
{
num2[i] = n2[i+1];
}
_delay_ms(5);
operator1 = atof(num1);
operator2 = atof(num2);

switch(operator){
case '+': resultado=operator1+operator2;break;
case '-': resultado=operator1-operator2; break;
case 'x': resultado=operator1*operator2; break;
case '/': resultado=operator1/operator2; break;
}
sprintf(res,"%.2f",resultado);
lcd_gotoxy(0,1);
lcd_puts(res);
}


}



}


void init(){
int i;
lcd_init(LCD_DISP_ON); //INICIALIZA LA LDC, EL PUERTO AL QUE ESTÁ CONECTADO PUERTO D
kbrd_init(); //INICIA TECLADO
lcd_home(); //ENVIAR EL PUNTERO A LA POSICION INICIAL
lcd_clrscr();
for (i=0;i<16;i++)
{
lcd_gotoxy(i,0);
_delay_ms(5);
lcd_puts(" ");
}
// IMPRIME EN PANTALLA LCD
_delay_ms(5);
lcd_clrscr();//LIMPIAR LA PANTALLA (CLEAR SCREEN)
}

