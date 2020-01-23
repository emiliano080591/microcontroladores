		.include "m8535def.inc"
	.def aux=r18
	.def cuenta=r16
	.def deco=r17
	ldi aux, low(RAMEND)
	out spl,aux
	ldi aux,high(RAMEND)
	out sph,aux

	ser aux 
	out ddrc,aux
	out portb,aux
	ldi r20,119
	ldi r21,0b01000001
	ldi r22,$6e
	ldi r23,$6b
	ldi r24,$59
	ldi r25,$3b
	ldi r26,$3f
	ldi r27,$71
	ldi r28,$7f
	ldi r29,$7b
uno:
	clr cuenta
dos:
	rcall decodifica
	out portc,deco
	rcall delay
	inc cuenta
	cpi cuenta,10
	brne dos
	rjmp uno 
decodifica:
	clr zh
	ldi zl,20
	add zl,cuenta
	ld deco,z
	ret
delay:
	ldi r17,$a7
WGLOOP0: ldi r18,$02
WGLOOP1: ldi r19,$f8
WGLOOP2: dec r19
		 brne WGLOOP2
		 dec r18
		 brne WGLOOP1
		 dec r17
		 brne WGLOOP0
	nop 
	ret
