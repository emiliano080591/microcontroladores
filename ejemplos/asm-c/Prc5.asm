	.include "m8535def.inc"
	.def col = R17
	.def dato = R18
	.def aux = R19

; ---- Iniciar apuntador de pila ---
	ldi aux, low(RAMEND)
	out spl, aux
	ldi aux, high(RAMEND)
	out sph, aux	
; ----------------------------------
	ser aux
	out DDRB, aux
	out DDRC, aux
	
	ldi aux, 0b00001000
	mov r0, aux
	ldi aux, 0b01111101
	mov r1, aux
	ldi aux, 0b00010110
	mov r2, aux
	ldi aux, 0b01110111
	mov r3, aux
	ldi aux, 0b01011101
	mov r4, aux
	ldi aux, 0b00001000
	mov r5, aux		

	clr zh

uno:	clr zl
	ldi col, 2
dos: 	out PORTC, col
	ld aux, z+
	out PORTB, aux
	rcall delay
	out PORTB, zh
	lsl col
	cpi col, 128
	breq uno
	rjmp dos

delay:
		ldi R18, $1F
WGLOOP0:	ldi R19, $2A
WGLOOP1:	dec R19
		brne WGLOOP1
		dec R18
		brne WGLOOP0
		nop
		ret
