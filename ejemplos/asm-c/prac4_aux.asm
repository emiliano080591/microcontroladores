.include"m8535def.inc"
.def aux = R18
.def cuenta  = R16
.def deco = R17
ldi aux, low(RAMEND)
out spl, aux
ldi aux, high(RAMEND)
out sph, aux
ser aux
out DDRC, aux
out portb, aux
ldi R20, 119
ldi R21, 0b01000001
ldi R22, $6e
ldi R23, $6b
ldi R24, $59
ldi R25, $3b
ldi R26, $3f
ldi R27, $71
ldi R28, $7f
ldi R29, $7b

uno: clr cuenta

dos: rcall decodifica
	out portc, deco
	in aux, pinb
	andi aux, 3
	inc aux
otro: 
	rcall delay 
	dec aux
	brne otro
	inc cuenta
	cpi cuenta, 10
	brne dos
	rjmp uno
decodifica: 
	clr zh
	ldi zl, 20
	add zl, cuenta
	ld deco, z
	ret
delay:
	push aux


ldi r17, $09
WGLOOP0: ldi aux,$BC
WGLOOP1: ldi r19, $C4
WGLOOP2: dec r19
	brne WGLOOP2
	dec aux
	brne WGLOOP1
	dec r17
	brne WGLOOP0
	nop
	pop aux
	ret
