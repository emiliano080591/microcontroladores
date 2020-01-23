/*
 * PRA10.asm
 *
 *  Created: 04/06/2018 22:02:58
 *   Author: Itzel
 */ 

.include "m8535def.inc"
.def aux = r16
.def display1 = r17 ; para el display izquierdo
.def display2 = r18 ; para el display derecho
.def e1 = r23
.def e2 = r24
.def dato = r25 ; dato eeprom
.def a1 = r14
.def a2 = r15
.def aux_dato = r20

reset:
    rjmp main
    .org $008
    rjmp para; timer 1, el de los 5 segundos
    rjmp premia_cliente ;timer 0, el que cuenta clientes

main:
    ldi aux, low(ramend) ; iniciar apundador de pila
    out spl, aux
    ldi aux, high(ramend)
    out sph, aux
	rcall carga_cod ; cargar codificación de números en registros
    rcall config_io ; configurar timers
	rcall carga_en_display_e ; Leer de la EEPROM para poner en display
	clr zh
	clr zl
    ldi aux, $01
    out ddra, aux ; usamos el puerto A, pin 0 como salida para el led
    ldi aux, $01
    out portb, aux ; se activa el pull up del pin 0 del puerto B, que es la entrada externa para el timer0
	ser aux
	out ddrc, aux
	out ddrd, aux

loop:
	nop
	rjmp loop

carga_cod:
	ldi aux, $77 ; 0
	mov r0, aux
	ldi aux, $41 ; 1
	mov r1, aux
	ldi aux, $6e ; 2
	mov r2, aux
	ldi aux, $6b ; 3
	mov r3, aux
	ldi aux, $59 ; 4
	mov r4, aux
	ldi aux, $3b ; 5
	mov r5, aux
	ldi aux, $3f ; 6
	mov r6, aux
	ldi aux, $71 ; 7
	mov r7, aux
	ldi aux, $7f ; 8
	mov r8, aux
	ldi aux, $7b ; 9
	mov r9, aux
	ret

config_io:
    ldi aux, 6 ; detecta entrada externa en flanco de baja
    out tccr0, aux
    ldi aux, 0 ; no empezar aún el contador de los 5 segundos
    out tccr1b, aux
    ldi aux, 0b00000101 ; activar interrupciones de desbordamiento para los timers 0 y 1
    out timsk, aux
	ldi r21, 251 ; Empezar en 251 y llegar al 256 en el timer 0 para contar 5 clientes
	ldi r19, 0b11101100 ; parte alta para que el timer 1 empieze en 60535 y llegue a $ffff,durando 5 seg, contando cada 1024 ciclos 
    ldi r20, 0b11101101; parte baja
	out tcnt1l, r20 ; se le asigna el valor inicial al timer1
    out tcnt1h, r19
	out tcnt0, r21; asignar el valor de inicio al contador de clientes (timer0)
    sei

    ret

carga_en_display_e:
	rcall leer_EEPROM
	rcall ajustar_dato
	rcall cargar_displays
	ret

ajustar_dato:
	cpi dato, 100
	brsh ajuste
	ret
ajuste:
	ldi dato, $00
	ret

cargar_displays: ; carga dato en los displays
	mov aux_dato, dato
	ldi aux, 0
	mov a1, aux
	mov a2, aux
	ldi aux, 10
display_1:
	sbc dato, aux
	inc a1
	cpi dato, 0
	brge display_1
	brlt display_2
	breq disp2_cero
disp2_cero:
	ldi aux, 0
	mov a2, aux ; en caso de que tenga cero
	ldi aux, 10
	rjmp manda_displays
display_2:
	add dato, aux
	dec a1
	mov a2, dato
manda_displays:
	ldi zl, $00
	add zl, a2
	ld display2, z
	out portc, display1
	ldi zl, $00
	add zl, a1
	ld display1, z
	out portd, display2
	mov dato, aux_dato
	ret 

escribe_EEPROM:
	 ;Wait for completion of previous write
	sbic EECR,EEWE
	rjmp escribe_EEPROM  
	ldi e1, $00
	ldi e2, $01
	out EEARH, e1
	out EEARL, e2
	; Escribir el dato
	out EEDR, dato
	; Write logical one to EEMWE
	sbi EECR,EEMWE
	; Start eeprom write by setting EEWE
	sbi EECR,EEWE
	ret

leer_EEPROM:
	; Wait for completion of previous write
	sbic EECR,EEWE
	rjmp leer_EEPROM
	ldi e1, $00
	ldi e2, $01
	out EEARH, e1
	out EEARL, e2
	; Start eeprom read by writing EERE
	sbi EECR,EERE
	; Read data from Data Register
	in dato,EEDR
	ret

premia_cliente:
	out tcnt0, r21; reiniciar el timer0 a 251 (conteo de clientes)
    ldi aux, 5 ; para los 5 segundos, contar cada 1024 ciclos
    out tccr1b, aux
	ldi r19, 0b11101100 ; parte alta para que el timer 1 empieze en 60535 y llegue a $ffff,durando 5 seg, contando cada 1024 ciclos 
    ldi r20, 0b11101101; parte baja
    out tcnt1l, r20 ; se le asigna el valor inicial al timer1
    out tcnt1h, r19
	ldi aux, $01
	out porta, aux ; se enciende el led
	inc dato
	rcall ajustar_dato
	rcall cargar_displays
	rcall escribe_EEPROM
	reti

para:
	ldi aux, 0 ; detenemos el timer1 de los 5 segundos
    out tccr1b, aux
    out porta, aux ; se apaga el led
	
	reti



