;
; p7.asm
;
; Created: 18/10/2018 05:13:52 p. m.
; Author : Carlos
;.include"m8535def.inc"
.def aux = r16
.def col = r17

.macro ldb
	ldi aux,@1
	mov @0,aux
.endm

reset:
	rjmp main; vector de reset
	rjmp boton;verctor INT0
	.org $008
	rjmp t1;vector del timer1
	rjmp pulsos;vector timer0
main:
	ldi aux,low(ramend)
	out spl,aux
	ldi aux,high(ramend)
	out sph,aux
	rcall config_io
	clr col
	out porta, col
	clr zh
	clr zl

uno:nop
	nop
	rjmp uno

config_io:
	ser aux
	out ddra,aux
	out portd,aux
	ldi aux,$40		; 0100 0000  ; para habilitar INT0
	out gicr,aux    ; registro de control de interrupciones generales 
	ldi aux,6
	out tccr0,aux	; external clock en t0
	ldi aux,4
	out tccr1b,aux	; preescala ck/256  ; timer counter1, registro 
	ldi aux,$b3
	out tcnt1h, aux
	ldi aux, $b5
	out tcnt1l,aux
	ldi r18,253		; inicializamos contador para para contar solo 3 pulsos
	out tcnt0,aux;
	ldi aux,$0A		; 0000 1010
	out mcucr,aux
	sei
	ret

pulsos:
	ldi col, $02
	out porta, col
	ldi r18,253		; inicializamos contador para para contar solo 3 pulsos
	out tcnt0,r18;
	ldi aux,0
	out timsk,aux	; toie0, deshabilitamos interrupciones de t0 y t1
	reti

boton:
	ldi r18,253		; inicializamos contador para para contar solo 3 pulsos
	out tcnt0,r18;
	ldi aux,5
	out timsk,aux	; toie0, habilitamos interrupciones de t0 y t1
	ldi col,$01
	out porta, col
	;hasta aqui hemos prendido el led y habilitado las interrupciones
	reti

t1:
	clr col
	out porta,col
	ldi aux,0
	out timsk,aux	; toie0, deshabilitamos interrupciones de t0 y t1
	reti

