.include "m8535def.inc"
.def row=r16
.def col=r17
.def aux=r18
.def cont=r19
.def speed=r20

rjmp main
.org $009
rjmp change

main:
    ldi row, low(RAMEND)
    out spl, row
    ldi row, high(RAMEND)
    out sph, row
    ser row
    out ddrc, row
    out ddra, row
    ldi row, 3
    out tccr0, row
    ldi row, 1
    out timsk, row
    ldi ZL, low(mat<<1)
    ldi ZH, high(mat<<1)
    lpm row, z+
    ldi col, $01
    ldi aux, $00
    ldi cont, $00
    sei
loop:
    out portc, row
    out porta, col
    rjmp loop
change:
    inc cont
    cpi cont, 2
    brlo return
    clr cont
    inc aux
    cpi aux, 8
    brsh restart
    ldi row, $00
    out portc, row
    lsl col
    lpm row, z+
    reti
 restart:
    clr aux
    ldi col, $01
    ldi ZL, low(mat<<1)
    ldi ZH, high(mat<<1)
    ldi row, $00
    out portc, row
    lpm row, z+
    reti
return:
	reti
mat:
    .db $00, $81, $C3, $E7, $E7, $C3, $81, $00 










