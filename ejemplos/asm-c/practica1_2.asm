.include "m8535def.inc"
.def aux = R16
.def dato1 = R17
.def dato2 = R18

ldi aux,low(RAMEND)
out SPL,aux
ldi aux,high(RAMEND)
out SPH,aux
ser aux
out ddra, aux
out ddrc,aux
out PORTB,aux
loop1:
	in dato1,pinb
	mov dato2,dato1
	neg dato2
	out PORTA, dato2
	out PORTC,dato1
	rjmp loop1
