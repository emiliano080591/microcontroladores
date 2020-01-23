.include "m8535def.inc"

.def aux=r16
.def dato=r19

ser aux
;out ddrb,aux
out ddrA,aux

ldi r17,low (RAMEND)
ldi r18,high(RAMEND)
out spl,r17
out sph,r18

ldi aux, $0A
mov r12,aux ;diez


ldi r20,$3f ; cero
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
	  add zl,dato
	  ld dato,z
	  out porta,dato
	  rjmp contador


contador: rcall tiempo
          cp aux,r12
		  breq main
		  ;ldi dato,$00
		  mov dato,aux
		  inc aux
		  rjmp deco

; funcion que controla el tiempo 


tiempo:	 ldi dato,$A7
		 mov r13, dato
WGLOOP0: ldi dato,$02
		 mov r14, dato
WGLOOP1: ldi dato,$F6
		 mov r15, dato
WGLOOP2: dec r15
		 brne WGLOOP2
		 dec r14
		 brne WGLOOP1
		 dec r13
		 brne WGLOOP0
		 ret

