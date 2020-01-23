.include "8535def.inc"
	.def aux = R16
	.def dat = R17
	
	ser aux
	out DDRA, aux
	out DDRC, aux
	out PORTD, aux
aqui: in dat, PIND
	out PORTA, dat
	com dat
	inc dat
	out PORTC, dat
	rjmp aqui	
