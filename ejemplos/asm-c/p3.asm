.include "m8535def.inc"
	.def cta=r18
	.def nvcs=r19
	.def aux=r16
	ldi aux,low(ramend)
	out spl,aux
	
	ldi aux,high(ramend)
	out sph,aux
	ser aux
	out ddra,aux
	out portb,aux
	clr cta
	
nvo:
	in nvcs,pinb
	out porta, cta
nret:
	rcall delay
	dec nvcs
	brne nret
	inc cta
	rjmp nvo
delay:
	ldi r17,0
	ldi aux,0
et1:
	dec r17
	brne et1
	dec aux
	brne et1
	ret
