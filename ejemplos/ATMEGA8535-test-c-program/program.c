//#define F_CPU 16000000UL
#define F_CPU 1000000UL

#include <avr/io.h>

#include <avr/interrupt.h>

#include <avr/signal.h>

#include <util/delay.h>

void delay(int);

int main() {

// Configure PORTA as output
    DDRA = 0xFF;
    PORTA = 0xFF;

GICR = (1<<INT0); // Enable INT0 External Interrupt



MCUCR = (1<<ISC01);     // Falling-Edge Triggered INT0

sei(); // Enable Interrupts

for(;;){

// nothing happens.

}

}

SIGNAL(SIG_INTERRUPT0) {

// this function is called when INT0 bit (PD2) is interrupted.

// You can also use INTERRUPT() function instead.

// SIG_INTERRUPT0 -> INT0 (PD2)

// SIG_INTERRUPT1 -> INT1 (PD3)

// While Button is pressed, LED is on

PORTA |= (1<<PA5);  

delay(1000);

PORTA &= ~(1<<PA5);     // Put PortB bit 5 LOW

delay(1000);

}

void delay(int ms) {

ms /= 100;

char i;

for(i = 0; i < ms; i++){

_delay_ms(100);      // max is 262.14 ms / F_CPU in MHz

}

}
