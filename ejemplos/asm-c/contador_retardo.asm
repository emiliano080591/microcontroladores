
.include "m8535def.inc"
.def dato = R16
.def aux = R17
.def aux2 = r18
ldi aux, low(RAMEND)
out SPL, aux
ldi aux, high(RAMEND)
out SPH, aux
ser aux
out DDRD, aux
out PORTC, aux

ldi aux, $3f
STS $60, aux
ldi aux, 6
sts $61, aux
ldi aux, $5b
sts $62, aux
ldi aux, $4f
sts $63, aux
ldi aux, $66
sts $64, aux
ldi aux, $6d
sts $65, aux
ldi aux, $7d
sts $66, aux
ldi aux, $27
sts $67, aux
ldi aux, $7f
sts $68, aux
ldi aux, $6f
sts $69, aux
clr ZH

uno:
    clr dato
dos:
    rcall deco
    out PORTD, aux
    rcall delay
    in aux, PINC
    andi aux, $80
    brmi tres
    inc dato
    cpi dato, 10
    brne dos
    rjmp uno
tres:
    dec dato
    brmi cuatro
    rjmp dos
cuatro:
    ldi dato, 9
    rjmp dos
deco:
    ldi ZL, $60
    add ZL, dato
    ld aux, Z
    ret

    
    ; funcion que controla el tiempo 
    
    
    delay:
		 
		 ldi aux2,$A7
		 mov r13, aux2
WGLOOP0: ldi aux2,$02
		 mov r14, aux2
WGLOOP1: ldi aux2,$F6
		 mov r15, aux2
WGLOOP2: dec r15
		 brne WGLOOP2
		 dec r14
		 brne WGLOOP1
		 dec r13
		 brne WGLOOP0
		 ret
