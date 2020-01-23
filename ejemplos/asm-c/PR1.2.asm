.include "m8535def.inc"

	ser R16
	out DDRA, R16
	out DDRC, R16
	out PORTD, R16

ciclo:	in R17, PIND
		out PORTA, R17
		com R17
		out PORTC, R17
		rjmp ciclo