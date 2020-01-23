.include "m8535def.inc"
.def cont=R16
.def num=R17

I: ldi num, low(RAMEND)
	out SPL, num
	ldi num, high(RAMEND)
	out SPH, num
	ldi R20, $3F
	ldi R21, $06
	ldi R22, $5b
	ldi R23, $4F
	ldi R24, $66
	ldi R25, $6d
	ldi R26, $7d
	ldi R27, $27
	ldi R28, $7F
	ldi R29, $6F
	ser num
	out DDRB, num
dos:clr cont
uno:rcall deco
	out PORTB, num
	rcall delay
	inc cont 
	cpi cont, $0A
	brne uno
	rjmp dos
deco:ldi ZL, 20
	add ZL, cont
	ld num, Z
	ret
delay:Push R17
	ldi R17, $A7
Lo0: ldi R18, 2
Lo1: ldi R19, $F8
Lo2: dec R19
	brne Lo2
	dec R18
	brne Lo1
	dec R17
	brne Lo0
	pop R17
	ret 
