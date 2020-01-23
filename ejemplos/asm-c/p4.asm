.include"m8535def.inc"
.def aux = r16
.def data = r17
.def datb = r18
.def datc = r19

ser aux
out ddra,aux
out portb, aux
out ddrc, aux
clr datc


loop:
	in datb,pinb
	cpi datb,0
	breq loop
	in data, pina
	add data, datb
	out porta, data
	inc datc
	out portc, datc

aki:
	in datb,pinb
	cpi datb,0
	brne aki
	rjmp loop
