	.include"m8535def.inc"
	.def aux = r16
	.def col = r17
reset: rjmp scrll1
	   .org $0008
	   rjmp corre
	   rjmp barre
scrll1:
	   ldi aux, low(RAMEND)
	   out spl, aux
	   ldi aux, high(RAMEND)
	   out spl, aux
	   rcall config_io
	   rcall carga_msg
	   clr zh
	   clr zl
	   ldi col, 1
	   out portc, col
	   ld aux, z
	   out porta, aux
uno: 
 	   rjmp uno

config_io:
	   ser aux
	   out ddra, aux
	   out ddrc, aux
	   ldi aux, 3
	   out tccr0, aux
	   ldi aux, 2
	   out tccr1b, aux
	   ldi aux, $05
	   out timsk, aux
	   ldi r18, 194
	   sei
	   ret
carga_msg:
	   ldi aux, $40
	   mov r0, aux
	   ldi aux, $5c
	   mov r1, aux
	   ldi aux, $58
	   mov r2, aux
	   ldi aux, $10
	   mov r3, aux
	   ldi aux, $54
	   mov r4, aux
	   ldi aux, $58
	   mov r5, aux
	   ldi aux, $7b
	   mov r6, aux
	   ldi aux, $78
	   mov r7, aux
	   ldi aux, $10
	   mov r8, aux
	   ldi aux, $30
	   mov r9, aux
	   ldi aux, $5c
	   mov r10, aux
	   ldi aux, $73
	   mov r11, aux
	   ldi aux, $40
	   mov r12, aux
	   ret

barre: 
	   out tcnt0, r18
	   out porta, zh
	   inc zl
	   lsl col
	   brne dos
	   ldi col, 1
	   clr zl

dos:
	   out portc, col
	   ld aux, z
	   out porta, aux
	   reti
corre:
	   mov r13, r12
	   mov r12, r11
	   mov r11, r10
	   mov r10, r9
	   mov r9, r8
	   mov r8, r7
	   mov r7, r6
	   mov r6, r5
	   mov r5, r4
	   mov r4, r3
	   mov r3, r2
	   mov r2, r1
	   mov r1, r0
	   mov r0, r13
	   reti
