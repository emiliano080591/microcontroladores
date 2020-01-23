
;	PRACTICA #8 "SERVOMOTOR (USO DE MACROS)"

;Mediante el uso de "MACROS" controlar la posiciòn de un servomotor "SG90", generar los tiempos para la señales de control para la posicion del motor en base a una subrutina de retardo de duracion de 1/2 mseg, y crear las macros necesarias para generar los demas tiempos. utilizar tres lineas de entrada cada una con un boton que mande el servomotor a cada una de las posiciones 0º, 45º y 90º, al mismo tiempo mostrar en displays la posicion del motor



;	0º	th=1.0 ms + tl=19.0 ms
;	45º	th=1.5 ms + tl=18.5 ms
;	90º	th=2.0 ms + tl=18.0 ms
	
	.include "m8535def.inc"
	.def aux = r16
	.def col = r17
	.def jj = r18

.macro pulso
	sbi portb,0
	ldi jj,@0
loop1:
	rcall delay
	dec jj
	brne loop1
	cbi portb,0
	ldi jj,@1
loop2:
	rcall delay
	dec jj
	brne loop2
	;rjmp otro
.endm

	.equ C = $7F
	.equ CU = $66
	.equ CI = $6D
	.equ N = $67

	
.macro ldb
	ldi aux,@1
	mov @0,aux
	.endm

.macro mensaje
	ldb r9,@0 
	ldb r8,@1
.endm


reset:rjmp main
	.org $008
	rjmp corre;vector timer1
	rjmp barre;vector timer0
main:
	ldi aux,low(ramend)
	out spl,aux
	ldi aux,high(ramend)
	out sph,aux
	ser aux
	out ddra,aux
	out ddrb,aux
	out ddrc,aux
	out portd,aux
	ldi aux,3
	out tccr0,aux; preescala ck
	ldi aux,$01
	out timsk,aux; toie0
	ldi aux,2
	out tccr1b,aux; preescala ck/8
	;ldi aux,$01
	ldi aux,$0a; 0000 1010
	out mcucr,aux
	ldi r18,193; para contar 63 4ms
	clr zh
	clr zl
	ld aux,z
	out porta,aux
	sei
	    
otro:
	sbis pind,5
	rjmp cero
	sbis pind,6
	rjmp uno
	sbis pind,7
	rjmp dos
	rjmp otro
cero:
	pulso 2,38
	mensaje C,C
	rcall limpia
	rjmp otro
uno:
	pulso 3,37
	mensaje CU,CI
	rcall limpia
	rjmp otro
dos:
	pulso 4,36
	mensaje N,C
	rcall limpia
	rjmp otro


limpia:
	clr r10
	clr r11
	clr r12
	clr r13
	clr r14
	clr r15
	ret

barre:
	out tcnt0,r18
	out porta,zh
	inc zl
	lsl col
	brne doss; si z = 0
	ldi col,1
	clr zl
doss:
;	com col
	out portc,col
;	com col
	ld aux,z
	out porta,aux
	reti

corre:
	mov r15,r14
	mov r14,r13
	mov r13,r12
	mov r12,r11
	mov r11,r10
	mov r10,r9
	mov r9,r8
	mov r8,r7
	mov r7,r6
	mov r6,r5
	mov r5,r4
	mov r4,r3
	mov r3,r2
	mov r2,r1
	mov r1,r0
	mov r0,r15
	reti



delay:
; ============================= 
;    delay loop generator 
;     500 cycles:
; ----------------------------- 
; delaying 498 cycles:
    ldi  R17, $A6
WGLOOP0:
	dec  R17
    brne WGLOOP0
; ----------------------------- 
; delaying 2 cycles:
    nop
    nop
; ============================= 
	ret




