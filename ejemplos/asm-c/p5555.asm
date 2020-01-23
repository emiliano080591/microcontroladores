.include "m8535def.inc"
.macro ldb;macro
	ldi r16 ,@1
	mov @0,r16
.endm
.def aux = r16
.def col = r17

ldi aux,low(ramend)
out spl, aux
ldi aux, high(ramend)
out sph,aux
ser aux
out ddra, aux
out ddrc, aux
ldb r0,$37
ldb r1,$37
ldb r2,$3f
ldb r3,$39
ldb r4,$6d
ldb r5,$79

clr zh
uno: 	clr zl
	ldi col,1
dos:
    com col
	out portc,col
	com col
	ld aux,z+
	out porta,aux
	rcall delay
	out porta, zh
	lsl col
	cpi col,$40
	breq uno
	rjmp dos


delay:
	push r17
	push R18
	
    ldi  r17, 6
    ldi  r18, 19
    ldi  r19, 174
	L1: dec  r19
	    brne L1
	    dec  r18
	    brne L1
	    dec  r17
	    brne L1
	    pop R18 ;//Devolvemos a R18 el valor que tenia
		pop R17 ;//Devolvemos a R17 el valor que tenia
	    rjmp PC+1
