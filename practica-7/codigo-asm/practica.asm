
.include "m8535def.inc"
.def aux=r16
.def cont=r17

rjmp main
.org $009
rjmp sube

main:
	ldi aux, low(RAMEND)
	out spl, aux
	ldi aux, high(RAMEND)
	out sph, aux
	ser aux
	out ddrc, aux
	ldi aux, 5
	out tccr0, aux
	ldi aux, 1
	out timsk, aux
	sei
load:
	ldi R20, $3F; 0  es 1111 110  
	ldi R21, $06
	ldi R22, $5B
	ldi R23, $4F
	ldi R24, $66
	ldi R25, $6D
	ldi R26, $7D
	ldi R27, $27
	ldi R28, $7F
	ldi R29, $6F 
	clr ZH
	clr cont
loop:
	ldi ZL, 20
	add ZL, cont
	ld aux, Z
	out PORTC, aux
	rjmp loop
sube:
	inc cont
	cpi cont, 10
	breq a_dece
	reti
a_dece:
	clr cont
	reti
