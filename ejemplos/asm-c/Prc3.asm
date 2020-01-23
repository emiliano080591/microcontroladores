	.include "m8535def.inc"
	.def aux = R16
	.def dato = R17
	
	ser aux
	out DDRC, aux
	out PORTB, aux
	ldi R20, $77
	ldi R21, $41
	ldi R22, $6e
	ldi R23, $6b
	ldi R24, $59
	ldi R25, $3b
	ldi R26, $3f
	ldi R27, $71
	ldi R28, $7f
	ldi R29, $7b
	clr zh
otro:
	ldi zl, 20
	in dato, PINB
	cpi dato, 10
	brsh ponE
	add zl, dato
	ld dato, z
ponlo:
	out PORTC, dato
	rjmp otro
ponE:
	ldi dato, $3d
	rjmp ponlo
