.include "m8535def.inc"
	ldi R16, low(RAMEND)
	ldi R17, high(RAMEND)
	out SPL, R16
	out SPH, R17
	ldi R18,20
	ldi R20, $20
	mov R21, R18
	clr R18
	clr R17
loop: 
	inc R18
	dec R17
	rjmp loop

