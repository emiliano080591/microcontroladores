.include"8535def.inc"

.def aux=r16
.def aux2=r17
.macro tiempo
ldi aux, @0

loop:
	rcall delayms
	dec aux
	brne loop
	.endm
	ldi aux, low(RAMEND)
	out spl, aux
	ldi aux, high(RAMEND)
	out sph, aux
	ser aux
	out ddra, aux
	out portd, aux

chkr:
	sbis pind,7
	rjmp cero
	sbis pind,6
	rjmp cys
	sbis pind,5
	rjmp nta
	clr aux
	out porta, aux
	rjmp chkr

cero:
 	ser aux2
	in aux, pina
	eor aux, aux2
	out porta, aux
	tiempo 2
	clr aux2
	out porta, aux2
	tiempo 38
	rjmp chkr 
cys:
	ser aux2
	in aux, pina
	eor aux, aux2
	out porta, aux
	tiempo 3
	clr aux2
	out porta, aux2
	tiempo 37
	rjmp chkr

nta:
	ser aux2
	in aux, pina
	eor aux, aux2
	out porta, aux
	tiempo 4
	clr aux2
	out porta, aux2
	tiempo 36
	rjmp chkr

delayms:
; Delay 4 000 000 cycles
; 500ms at 8.0 MHz


	ldi R17,$A6
	loop0:
		dec R17
	brne loop0
	nop
	nop
	ret


;    ldi  r18, 21
;    ldi  r19, 75
;    ldi  r20, 191
;L1: dec  r20
;    brne L1
;    dec  r19
;    brne L1
;    dec  r18
;    brne L1
;    nop

