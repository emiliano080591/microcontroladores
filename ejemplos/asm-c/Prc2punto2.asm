.include "m8535def.inc"

	.def aux = R16
	ldi aux, $f0
	out DDRA, aux
	swap aux
	out PORTA, aux

lee: in aux, PINA
	swap aux
	ori aux, $0f
	out PORTA, aux
	rjmp lee