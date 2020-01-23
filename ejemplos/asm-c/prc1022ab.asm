.include"m8535def.inc"
.def aux = r16
.def aux2 = r17
.equ  step1 = 8
.equ  step2 = 4
.equ  step3 = 2
.equ  step4 = 1
	rjmp main
	rjmp secuencia2
config_io:
	ldi aux,$0f
	out	DDRC,aux
	ldi aux,0b11111011
	out DDRD,aux
	ldi aux,4
	out	PORTD,aux
	ldi aux,2
	out MCUCR,aux
	ldi aux,0b0100_0000
	out GICR,aux
	sei
	ret
retardo:
	clr aux
	clr aux2
loop:
	dec aux
	brne loop
	dec aux2
	brne loop
	ret
secuencia1:
	ldi aux,step1
	out	PORTC,aux
	rcall retardo
	ldi aux,step2
	out	PORTC,aux
	rcall retardo
	ldi aux,step3
	out	PORTC,aux
	rcall retardo
	ldi aux,step4
	out	PORTC,aux
	rcall retardo
	ret
secuencia2:
	ldi aux,step4
	out	PORTC,aux
	rcall retardo
	ldi aux,step3
	out	PORTC,aux
	rcall retardo
	ldi aux,step2
	out	PORTC,aux
	rcall retardo
	ldi aux,step1
	out	PORTC,aux
	rcall retardo
	reti
main:
	ldi aux,low(RAMEND)
	out spl, aux
	ldi aux,high(RAMEND)
	out sph,aux
	rcall config_io
while:
	rcall secuencia1
	rjmp while


