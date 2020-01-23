;
; raiz00.asm
;
; Created: 26/11/2019 05:39:59 p. m.
; Author : Yair
;


; Replace with your application code
.include"m8535def.inc"
.def cont1=R15
.def dato = R16
.def cont = R17
.def sum = R18
.def aux = R19

ser dato
ser cont
ser sum

out portb,dato
out ddra,dato
out ddrc,dato

//Ldi R19,20

Ldi R20,$3F
Ldi R21,$06
Ldi R22,$5b
Ldi R23,$4f
Ldi R24,$66
Ldi R25,$6d
Ldi R26,$7d
Ldi R27,$27
Ldi R28,$7f
Ldi R29,$6f


Ldi R16,$01
Mov R0,R16

Ldi R16,$03
Mov R1,R16

Ldi R16,$05
Mov R2,R16

Ldi R16,$07
Mov R3,R16

Ldi R16,$09
Mov R4,R16

Ldi R16,$0b
Mov R5,R16

Ldi R16,$0d
Mov R6,R16

Ldi R16,$0f 
Mov R7,R16

Ldi R16,$11
Mov R8,R16

Ldi R16,$13
Mov R9,R16

Ldi R16,$15
Mov R10,R16

Ldi R16,$17
Mov R11,R16

Ldi R16,$19
Mov R12,R16

Ldi R16,$1b
Mov R13,R16

Ldi R16,$1d
Mov R14,R16

//------------------------------------------------------
leer:
clr ZH
clr ZL
clr dato
clr aux

Ldi sum,$01
Ldi cont,$01

in dato,pinb

rjmp suma1

//------------------------------------------------------
suma1:

cp sum,dato //compara los registros
BRSH suma2 //si sum es igual o mayor a dato salta a suma2

Ldi ZL,0
add ZL,cont
ld aux,z
add sum,aux
inc cont
clr aux
rjmp suma1


//---------------------------------------------------
suma2:

cp sum,dato //compara los registros
BREQ imprime// si sum y dato son iguales salta a imprime
DEC cont
rjmp imprime



//-----------------------------------------------
imprime:
clr ZH
clr ZL
clr dato

cpi cont,$0A //compara si cont es mayor o igual a A0
BRSH imprime2// salta a imprime 2 si se cumple

//imprime en puertos

Ldi ZL,20
Ld dato,z
com dato
out porta,dato

clr ZH
clr ZL
clr dato

Ldi ZL,20
add ZL,cont
Ld dato,z
com dato
out portc,dato

clr ZH
clr ZL
clr dato
rjmp leer

//---------------------------------------------------------------
imprime2:

Ldi ZL,21
Ld dato,z
com dato
out porta,dato

clr ZH
clr ZL
clr dato

cpi cont,$0A
BREQ cero

cpi cont,$0B
BREQ uno

cpi cont,$0C
BREQ dos

cpi cont,$0D
BREQ tres

cpi cont,$0E
BREQ cuatro

cpi cont,$0F
BREQ cinco


cero:
Ldi ZL,20
Ld dato,z
com dato
out portc,dato
com dato
rjmp leer


uno:
Ldi ZL,21
Ld dato,z
com dato
out portc,dato
com dato
rjmp leer

dos:
Ldi ZL,22
Ld dato,z
com dato
out portc,dato
com dato
rjmp leer

tres:
Ldi ZL,23
Ld dato,z
com dato
out portc,dato
com dato
rjmp leer

cuatro:
Ldi ZL,24
Ld dato,z
com dato
out portc,dato
com dato
rjmp leer

cinco:
Ldi ZL,25
Ld dato,z
com dato
out portc,dato
com dato
rjmp leer
