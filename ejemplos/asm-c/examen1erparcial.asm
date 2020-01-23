.include"m8535def.inc"
.def data = r17
.def aux = r16
.def datb = r18
.def cont = r19
.def a = r20
.def b = r21
.def op = r22
.def positivos = r23
.def negativos = r24
.def result = r25


ser aux
clr cont
; salidas
out ddra,aux
out ddrc,aux
; entradas
out portb,aux
out portd,aux


loop:
	; detecta cambio de 0 en B
	in datb,pinb
	cpi datb,0
	breq loop

	; respaldar valor
	mov aux, datb

	; primer nible
	mov a,datb
	andi a,$0F

	; segundo nible
	mov b,datb
	swap b
	andi b,$0F

	; detecta operacion
	in op,pind

	cpi op,0

	breq resta
	;suma
	add a,b
	rjmp signo

resta:
	sub a,b

signo:
	brmi negcase
	inc positivos
	rjmp resultados

negcase:
	inc negativos

resultados:
	out porta,a

	mov result, negativos
	andi result,$0F
	swap result
	or result, positivos

	out portc, result	

aki:
	; detecta cambio de valor en B
	in datb,pinb
	cpse datb, aux
	rjmp loop
	rjmp aki

	;detecta bajada a 0 en B
	;in datb,pinb
	;cpi datb,0
	;brne aki
	;rjmp loop
