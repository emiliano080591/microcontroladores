	.include"m8535def.inc"
	.def aux=r16
	.def aux2=r17
	.def aux3=r18
	.def aux1=r19
	rjmp main
	.org $004
	rjmp tono ; timer2 ovf (8bits)
	.org $008
	rjmp cseg ; timer1 ovf (16 bits)
	rjmp cuenta ; timer0 ovf (8 bita)
main:	
	ldi aux,low(RAMEND)
	out spl,aux
	ldi aux,high(RAMEND)
	out sph,aux
	ser aux
	out ddrc,aux
	out portb,aux
	ldi aux,6 ; 0000 0110 flanco de bajada en T0
	out tccr0,aux
	ldi aux,1 ;0000 0001 TOIE0 =1
	out timsk,aux
	ldi aux,4 ; 0000 0100 preescala t1 = ck/256
	out tccr1b,aux
	ldi aux,4 ;0000 0010 preescala t2 = ck/8
	out tccr2,aux
	sei
	ldi aux3,251
	out tcnt0,aux3      
	rcall primer ;verificar si es la primer vez que corre el prog
	;rcall EEPROM_read
	mov r0,r16

loop:
	rcall muestra; decodificar r0 y mandarlo a los displays
	nop
	rjmp loop

tono:
	;ldi aux1,115
	;out tcnt2,aux1
	
	ser aux
	out portc,aux2
	reti

cseg:
	ldi aux2,1
	out timsk,aux2
	clr aux2
	out portc,aux2
	reti

cuenta:
	inc r0
	mov r16,r0
	clr r17
	clr r18
	rcall EEPROM_write
	ldi aux3,251
	out tcnt0,aux3
	ldi aux3,$b5 ;1011 0101
	out tcnt1l,aux3
	ldi aux3,$b3
	out tcnt1h,aux3 ;$b3b5 (46005) => TCNT1
	ldi aux3,$45;     01000101
	out timsk,aux3
	reti
EEPROM_write:
	sbic EECR,EEWE
	rjmp EEPROM_write
	out EEARH, r18
	out EEARL, r17
	out EEDR,r16
	sbi EECR,EEMWE
	sbi EECR,EEWE
	ret
EEPROM_read:
	sbic EECR,EEWE
	rjmp EEPROM_read
	out EEARH, r18
	out EEARL, r17
	sbi EECR,EERE
	in r16,EEDR
	ret
primer:
	clr r18
	clr r17
	rcall EEPROM_read
	cpi r16,$FF
	breq nuevo
	ret
nuevo:
	clr r16
	rcall EEPROM_write
	ret
muestra:
	;es una subrutina que decodifica
	;a r0 y lo muestra en displays
	ret 



