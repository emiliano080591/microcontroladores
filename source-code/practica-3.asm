.include"m8535def.inc";libreria para incluir los comandos del microcontrolador
.def dato = R16 ;Definimos a “ascii” al reg16 por comodidad
.def ascii = R17 ;Definimos a “ascii” al reg17 por comodidad


ser dato
ser ascii

out DDRA, dato
out PORTB, dato

out DDRC, ascii
out PORTD, ascii

ldi r18, $3f;0
ldi r19, $06;1    ;Los primeros numeros (0-9), salidas del display en datoadecimal. //0
ldi r20, $5b;2
ldi r21, $4f;3
ldi r22, $66;4
ldi r23, $6d;5
ldi r24, $7d;6
ldi r25, $27;7
ldi r26, $7f;8
ldi r27, $6f;9

ldi ascii,low(RAMEND);Manejo de la pila, parte baja
out spl,ascii; Activamos el funcionamiento del stack pointer
ldi ascii,high(RAMEND);Manejo de la pila, parte alta
out sph,ascii;Activamos el funcionamiento del stack pointer
ser ascii ;cargamos con 1’s el reg16
out DDRC,ascii;Establecemos los puertos C y A como salidas
out DDRA,ascii;Establecemos
out PORTB,ascii;Indicamos que el puerto B es entrada

dato2ascii:
	in dato, PINB
	subi dato, $30
	cpi dato, $11
	brsh letraascii
letraascii:
	subi dato, $7
	rjmp showascii
showascii:
	out PORTA, dato
	rjmp dato2ascii








