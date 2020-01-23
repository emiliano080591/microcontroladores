    .include"m8535def.inc"
    .def aux = r16
    .def aux2 = r17
    .def aux3 = r18

    rjmp main
    .org $004
    rjmp tono
    .org $008
    rjmp Cseg
    rjmp cuenta  

main:   ldi aux, low(RAMEND)
        out spl, aux
        ldi aux, high(RAMEND)
        out sph, aux
        ser aux
        out ddrc, aux
        ldi aux, 1
        out portb, aux
        ldi aux, 6
        out tccr0, aux
        ldi aux, 2
        out tccr2, aux
        ldi aux, 4
        out tccr1b, aux
        ldi aux, 1
        out timsk, aux
        sei
        ldi aux, 250
        out tcnt0, aux

loop:   nop
        nop
        rjmp loop

tono:   ldi aux2, 113
        out tcnt2, aux2
        ser aux
        in r17, pinc
        eor r17, aux
        out portc, r17
        reti

Cseg:   ldi aux2, 1
        out timsk, aux2
        reti 

cuenta: ldi aux2, 250
        out tcnt0, aux3
        ldi aux3, $b5
        out tcnt1l, aux3
        ldi aux3, $b3
        out tcnt1h, aux3
        ldi aux3, $45
        out timsk, aux3
        reti
        rjmp main

      


    
            
