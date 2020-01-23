.include "m8535def.inc"

	ldi R16, $5A
	ldi R17, $79
	mov R18, R16
	mov R19, R17

	loop:	nop
			inc R16
			dec R17
			rjmp loop