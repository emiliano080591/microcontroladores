.include "m8535def.inc"
.def aux= r28
.def dato= r29

ser aux
	out DDRA,  aux
	out portb, aux

ldi aux, $3f
mov r12,aux ;0
ldi aux, 6
mov r13,aux ;1
ldi aux, $5b
mov r14,aux ;2
ldi aux, $4f
mov r15,aux ;3

ldi r16,$66 ;4
ldi r17,$6d ;5
ldi r18,$7d ;6
ldi r19,$27 ;7
ldi r20,$7f ;8
ldi r21,$6f ;9
ldi r22,$77 ;A
ldi r23,$7c ;B
ldi r24,$39 ;C
ldi r25,$7e ;D
ldi r26,$79 ;E
ldi r27,$71 ;F

otro: in dato, pinb
	  andi dato, $30
	  brne decimal
	  in dato, pinb
	  andi dato, $41
	  brne hexadecimal
	  rjmp deco

decimal: in dato, pinb
		 ldi aux,$30
		 sub dato,aux
		 rjmp deco

hexadecimal: in dato, pinb
		 ldi aux,$37
		 sub dato,aux
		 rjmp deco

deco: 
	  ldi zl,12
	  andi dato,$0f
	  add zl,dato
	  ld dato,z
	  out porta,dato
	  rjmp otro
