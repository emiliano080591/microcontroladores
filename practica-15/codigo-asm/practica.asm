.include "m8535def.inc"
.def  d= r16
.org $000
rjmp main 
.org INT0addr
rjmp cgrg2
.org INT1addr
rjmp cgrg3

main: 
   ldi d, $40
   mov r0, d 
   mov r5, d
   ldi d, $76
   mov r4, d
   ldi d, $5c
   mov r3, d
   ldi d, $30
   mov r2, d
   ldi d, $5f
   mov r1, d

I: ldi d, low (RAMEND)
   out spl, d 
   ldi d, high(RAMEND)
   out sph, d
   ser d
   out ddrc, d 
   out ddra, d

   out portd,d
   
   ldi d, $0F
   out MCUCR, d
   ldi d, $C0
   out GICR, d
   sei

   clr zh
barrer: ldi zl , 5
		ldi d, $20

sigue: 
		out portc, d 
		ld r17,z
		out porta,r17
		rcall delay 
		out porta, zh
	
		in d, pinc 
		lsr d
		dec zl 
		brpl sigue
		rjmp barrer

cgrg2:
		ldi d, $40
   		mov r0, d 
   		mov r5, d
   		ldi d, $76
  		mov r1, d
   		ldi d, $5c
   		mov r2, d
   		ldi d, $30
   		mov r3, d
   		ldi d, $5f
   		mov r4, d
   		reti

cgrg3:
		ldi d, $3f
   		mov r5, d 
   		ldi d, $38
   		mov r4, d
   		ldi d, $38
   		mov r3, d
   		ldi d, $79
   		mov r2, d
   		ldi d, $76
   		mov r1, d
		ldi d, $40
   		reti



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

