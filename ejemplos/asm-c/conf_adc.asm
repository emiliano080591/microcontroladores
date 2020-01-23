.include "m8535def.inc"
.def ADH = r16
.def ADL = r17
.def aux = r18
rjmp main
.org $00E
rjmp conv
main: ldi aux, low(RAMEND)
	  out spl,aux
	  ldi aux,high(RAMEND)
	  out sph,aux
	  clr aux
	  out ADMUX,aux
	  ldi aux,$ED
	  out ADCSRA,aux
	  ser aux
	  out DDRB,aux
	  out DDRC,aux
	  sei

uno: out PORTB,ADH
	 out PORTC,ADL
	 rjmp uno

conv: in ADL,ADCL
	  in ADH,ADCH
	  reti
