.include "m8535def.inc"
.def datoB = R16
.def datoD = R17

ser datoB
ser datoB
out DDRA, datoB
out DDRC, datoB

out PORTB, datoB
out PORTD, datoB

lee: 
	in datoB, PINB
	in datoD, PIND
	cp datoB, datoD
		brmi dos
	out PORTA, datoB
	out PORTC, datoD
	rjmp lee
dos:
	out PORTA, datoD
	out PORTC, datoB
	rjmp lee
