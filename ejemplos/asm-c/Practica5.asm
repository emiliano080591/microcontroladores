	.include"m8535def.inc"
	.def col = r17
	.def dato = r18
	ldi dato, low(RAMEND)
	out spl, dato
	ldi dato, high(RAMEND)
	out sph, dato
	ser dato
	out ddrc, dato
	out ddrb, dato
	ldi dato, $40
	mov r0, dato
	ldi dato, 6
	mov r1, dato
	ldi dato, $38
	mov r2, dato
	ldi dato, $3f
	mov r3, dato
	ldi dato, $73
	mov r4, dato
	ldi dato, $40
	mov r5, dato
	clr zh
uno: 
	clr zl
	ldi col, 1
dos:
	com col
	out portc, col
	com col
	ld dato, z+
	out portb, dato
	rcall delay
	out portb, zh
	lsl col
	brcc dos
	rjmp uno
delay:
	ldi r19, $1f
WGLOOP0: ldi r20, $2a
WGLOOP1: dec r20
		 brne WGLOOP1
		 dec r19
		 brne WGLOOP0
		 nop

	ret
