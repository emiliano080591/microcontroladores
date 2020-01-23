.include "m8535def.inc"

.def R16 = NUM
.def R17 = CONT

ser NUM 
out DDRA, NUM
out DDRC, NUM
out PORTA, NUM
out PORTB, NUM

ld CONT, $060  

PRUEBA:
	cpi CONT,$06F
	brsh FIN
	tst CONT
	ldi NUM, 15
	out PORTb, r19
	out PORTA, NUM
	add CONT, 1
	brmi RESTA
	brpl PRUEBA
RESTA
   sbi NUM, 1
   rjmp PRUEBA

FIN
	NOP
	RJMP FIN
