.include "m8535def.inc"

.def datoB = R16
.def datoD = R17
.def aux = R18


ser aux 
out DDRA, aux
out DDRC, aux
out PORTB, aux
out PORTD, aux

UNO:
in datoB, PINB
in datoD, PIND
swap datoB
com datoD
swap  datoD
out PORTA, datoB
out PORTC, datoD
rjmp UNO


