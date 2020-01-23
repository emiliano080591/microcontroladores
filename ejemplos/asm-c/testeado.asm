.include"m8535def.inc"
	ser r16
	ser r17
	out DDRB, r17
	out DDRD, r16
	out DDRA, r17
	out DDRC, r16
 	ldi r16,$ff
	ldi r17,$ff
	out porta,r17
	out portc,r16
	out portb,r17
	out portd,r16
loop:
	rjmp loop;
