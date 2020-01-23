.include "m8535def.inc"
.def dato=R16
.def aux=R17
.def rolr=R21
.def vacio=R22
.def comparar=R23

ldi aux,low(RAMEND)
out SPL,aux
ldi aux,high(RAMEND)
out SPH,aux
ser aux
clr vacio
ldi comparar,$40
out ddra,aux
out ddrd,aux
out PORTC,aux

ldi aux,$89
sts $60,aux
ldi aux,$89
sts $61,aux
ldi aux,$C0
sts $62,aux
ldi aux,$C7
sts $63,aux
ldi aux,$88
sts $64,aux
ldi aux,$89
sts $65,aux


clr ZH
ldi rolr,$01

uno: clr dato
	
dos:rcall deco
	out PORTA,aux
	out PORTD,rolr
	rcall delay
	out porta,vacio
	LSL rolr
	cp comparar,rolr
	breq cargar
pregunta:	in aux,PINC
	andi aux,$80
	brmi tres
	inc dato
	cpi dato,6
	brne dos
	rjmp uno
tres: dec dato
	brmi cuatro
	rjmp dos
cuatro: ldi dato,5
	rjmp dos
deco: ldi ZL,$60
	add ZL,dato
	ld aux,Z
	ret
delay:
    ldi  r18, 5
    ldi  r19, 239
L1: dec  r19
    brne L1
    dec  r18
    brne L1
	ret

cargar:
	ldi rolr,$01
	rjmp pregunta
