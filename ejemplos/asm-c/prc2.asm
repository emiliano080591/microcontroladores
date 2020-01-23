.include "m8535def.inc"

.def aux=r16
.def dato=r20

ser aux
out ddrb,aux
out porta,aux


ldi aux, $00
mov r13,aux ;cero
ldi aux, $09
mov r14,aux ;nueve
ldi aux, $3f
mov r15,aux ;0

ldi r21,$6
ldi r22,$5b
ldi r23,$4f
ldi r24,$66
ldi r25,$6d
ldi r26,$7d
ldi r27,$27
ldi r28,$7f
ldi r29,$6f

main: ldi dato,$00
	  ldi aux,$00

deco: ldi zl,20
	  andi dato,$0f
	  cp dato,r13
	  breq cero
	  add zl,dato
	  ld dato,z
	  out portb,dato
	  rjmp contador


cero:ldi zl,15
	 add zl,dato
	 ld dato,z
	 out portb,dato
	 rjmp contador



contador: 
		  rcall tiempo
          cp aux,r14
		  breq main
		  inc aux
		  rjmp deco

; funcion que controla el tiempo 


tiempo:	 ldi r17,$A7
WGLOOP0: ldi r18,$02
WGLOOP1: ldi r19,$F6
WGLOOP2: dec r19
		 brne WGLOOP2
		 dec r18
		 brne WGLOOP1
		 dec r17
		 brne WGLOOP0
		 ret




