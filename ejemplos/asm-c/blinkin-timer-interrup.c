//#define F_CPU 16000000UL
#define F_CPU 1000000UL

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

// ********************************************************************************
// Interrupt Routines
// ********************************************************************************
// timer1 overflow
ISR(TIMER1_OVF_vect) {
    // XOR PORTA with 0x02 to toggle the LSB
    PORTA=PORTA ^ 0x02;
}
 
// timer0 overflow
ISR(TIMER0_OVF_vect) {
    // XOR PORTA with 0x01 to toggle the second bit up
    PORTA=PORTA ^ 0x01;
}


int main(void){
// Configure PORTA as output
    DDRA = 0xFF;
    PORTA = 0xFF;
    // enable timer overflow interrupt for both Timer0 and Timer1
    TIMSK=(1<<TOIE0) | (1<<TOIE1);
    // set timer0 counter initial value to 0
    TCNT0=0x00;
    // start timer0 with /1024 prescaler
    TCCR0 = (1<<CS02) | (1<<CS00);
    // lets turn on 16 bit timer1 also with /1024
    TCCR1B |= (1 << CS10) | (1 << CS12);
    // enable interrupts
    sei(); 
    while(1) {
    }
}
