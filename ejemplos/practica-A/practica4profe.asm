.include "m8535def.inc"
.def  d= r16

rjmp main 

main: 

I: ldi d, low (RAMEND)
   out spl, d 
   ldi d, high(RAMEND)
   out sph, d
   ser d
   out ddrc, d 
   out ddra, d

   out portd,d
   ldi d, 2
   out MCUCR, d
   ldi d, $40
   out GICR, d
   sei


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
barrer: ldi zl , 5
		ldi d, $20

sigue: 
		out portc, d 
		ld r17,z
		out porta,r17
		rcall delay 
		out porta,zh
		in d, pinc 
		lsr d
		dec zl 
		brpl sigue
		rjmp barrer




delay: 
		ldi r17, $0B
WGLOOP0: 
		ldi r18, $D3
WGLOOP1: 
		dec r18
		brne WGLOOP1
		dec r17
		brne WGLOOP0
		ldi r17, $01
WGLOOP2:
		dec r17
		brne WGLOOP2
		nop
		ret

