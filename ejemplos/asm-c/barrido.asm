.include "m8535def.inc"
.def  d = r16

rjmp main 
.org $008
rjmp scroll
rjmp barrido

main:

   ;interrupciones 
   ldi d, low (RAMEND)
   out spl, d 
   ldi d, high(RAMEND)
   out sph, d
   
   ;puertos
   ser d
   out ddrc, d ; salida
   out ddra, d

   ;timer counters
   ldi d, 1
   out TCCR0, d
   ldi d,2
   out TCCR1B, d
   ldi d, 5
   out TIMSK, d
   sei
   ;tabla de decodificacion
   ldi d, $40
   mov r0, d 
   mov r5, d
   ldi d, $5f
   mov r4, d
   ldi d, $30
   mov r3, d
   ldi d, $5c
   mov r2, d
   ldi d, $76
   mov r1, d
   clr zh
   ldi zl , 5
   ldi d, $20

loop: nop
   nop
   rjmp loop

scroll:
   mov r6,r5
   mov r5,r4
   mov r4,r3
   mov r3,r2
   mov r2,r1
   mov r1,r0
   mov r0,r6
   reti

barrido:
	out porta,zh
   out portc, d 
   ld r17,z
   out porta,r17
   ;rcall delay 
   ;out porta,zh
   in d, pinc 
   lsr d
   dec zl 
   brmi sigue
   rjmp fin
sigue:
   ldi zl , 5
   ldi d, $20
fin:
   nop
   reti

delay: 
      ldi r19, $0B
WGLOOP0: 
      ldi r18, $D3
WGLOOP1: 
      dec r18
      brne WGLOOP1
      dec r19
      brne WGLOOP0
      ldi r19, $01
WGLOOP2:
      dec r19
      brne WGLOOP2
      nop
      ret
