.include "m8535def.inc"
	.def dato=R16
	.def aux=R17
	ser aux
	out DDRC,aux
	out PORTB,aux
	ldi R18,$77
	ldi R19,$41
	ldi R20,$6E
	ldi R21,$6B
	ldi R22,$59
	ldi R23,$3B
	ldi R24,$3F
	ldi R25,$71
	ldi R26,$7F
	ldi R27,$79
	ldi R28,$7D
	ldi R29,$1F
	//ldi R26,$36
	//ldi R27,$4F
	//ldi R28,$3E
	//ldi R29,$BC
	clr zh
otro: ldi zl,18
	  in dato,PINB
	  cpi dato,12
	  brsh ponC
	  add zl,dato
	  ld dato,z
	  out PORTC,dato
	  rjmp otro 
ponC: cpi dato,13
	  brsh ponD
	  ldi dato,$36
	  out PORTC,dato
	  rjmp otro
ponD: cpi dato,14
	  brsh ponE
	  ldi dato,$4F
	  out PORTC,dato
	  rjmp otro
ponE: cpi dato,15
	  brsh ponF
	  ldi dato,$3E
	  out PORTC,dato
	  rjmp otro
ponF: cpi dato,16
	  brsh Error
	  ldi dato,$BC
	  out PORTC,dato
	  rjmp otro
Error: ldi dato,$3E
	  out PORTC,dato
	  rjmp otro;
