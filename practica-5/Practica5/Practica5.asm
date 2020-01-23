.include "m8535def.inc"
.def aux = R16
.macro pulse
	sbi PORTA,0
	ldi aux,@0
loop1:
	rcall delay
	dec aux
	brne loop1
	cbi PORTA,0
	ldi aux,@1
loop2:
	rcall delay
	dec aux
	brne loop2
	rjmp otro
.endm

main:
	ldi aux, LOW(RAMEND)
	out SPL,aux
	ldi aux, HIGH(RAMEND)
	out SPH,aux
	ser aux
	out DDRA,aux
	out PORTD,aux

otro:
	sbis PIND,5
	rjmp cero
	sbis PIND,6
	rjmp uno
	sbis PIND,7
	rjmp dos
	rjmp otro

cero:
	pulse 2,38

uno:
	pulse 3,37

dos:
	pulse 4,36

delay:
	ldi R17,$A6
	loop0:
		dec R17
	brne loop0
	nop
	nop
	ret
