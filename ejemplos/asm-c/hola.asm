.include "m8535def.inc"
.def aux
I: ldi R16, lau(RAMEND)
out SPL, R16
ldi R16,high(RAMEND)
out SPH,R16
Se R16
out DDRA,R16
out DDRB,R16
ldi R16,$40
mov $25,R16
mov R0,R16
ldi R16,$76
mov R4,R16
ldi R16,$56
mov R3,R16
ldi R16, $30
mov R2,R16
ldi R16,$5F
mov R1,R16

clr ZH
uno: ldi R16,$20
     ldi ZL, 5
dos: out PORTA,Z16
     ldi R17, Z
out PORTB, R17,z
OUT portb,R17
rcall delay 
out PORTB,RH
dec ZL
lsr R16
brec dos
rjmp uno

delay:

  ldi  R18, 21
    ldi  R19, 75
    ldi  R20, 189
L1: dec  R20
    brne L1
    dec  R19
    brne L1
    dec  R18
    brne L1
    nop
ref
