.include "m8535def.inc"
.def  aux =  r16
.def  aux2 = r17
.def  aux3 = r18
.def  aux1 = r19

rjmp main 
.org $004
rjmp tono ;timer 2
.org $008
rjmp cseg ;timer1
rjmp cuenta ;timer 0

main:
   ;interrupciones 
   ldi aux, low (RAMEND)
   out spl, aux 
   ldi aux, high(RAMEND)
   out sph, aux
   
   ;puertos
   ser aux
   out ddrc, aux ; salida
   out portb, aux

   ;timer counters
   ldi aux, 6
   out TCCR0, aux
   ldi aux, 1
   out TIMSK, aux
   ldi aux, 4
   out TCCR1B, aux
   ldi aux, 2
   out TCCR2, aux
   sei
   ldi aux3, 250
   out TCNT0, aux3

loop: nop
   nop
   rjmp loop

tono:
   ;ldi aux1, 115
   ;out tcnt2, aux1
   ser aux
   in r17, pinc
   eor r17, aux
   out portc, r17
   reti

cseg:
   ldi aux2, 1
   out timsk, aux2
   clr aux2
   out portc, aux2 
   reti

cuenta:
   ldi aux3, 250
   out tcnt0, aux3
   ldi aux3, $b5
   out tcnt1l, aux3
   ldi aux3, $b3
   out tcnt1h, aux3
   ldi aux3, $45
   out timsk, aux3
   reti
