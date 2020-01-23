;http://solocodigo.com/39593/teclado-matricial-y-display-7-segmentos-atmel-avr/
;Código decodificador de teclado matricial
;Implementado por David Valencia Pesqueira en UPIITA-IPN 2009
;Profesor: Dr. Antonio Hernández Zavala
;GRUPO 4BM3
;
;   El siguiente programa decodifica un teclado matricial
;   de 16 teclas. Éste tipo de algoritmo está diseñado para
;   detectar sólo una tecla a la vez, ya que para detectar
;   más de una se requieren diodos por cada interruptor en la
;   construcción del teclado matricial y éso ya queda fuera
;   del enfoque didáctico de éste programa.
;
;   Para más información sobre la construcción de teclados
;   matriciales con diodos visitar:
;   http://www.dribin.org/dave/keyboard/one_html/
;
;Historial
;v0.1 - Pruebas de las resistencias Pull-UP --- OK
;v0.2 - Probando la salida del tempscan
;v0.3 - Nueva estructura de tempscan -- OK
;v0.4 - Salida por tira de leds en PORTA -- OK
;
;Hardware en un ATMEL ATMega 8535
;El teclado está conectado de la siguiente manera:
;
;          COLUMNAS
;              0    1   2   3
;   
;   FILAS   0  X    X   X   X  PC4
;
;           1  X    X   X   X  PC5
;
;           2  X    X   X   X  PC6
;
;           3  X    X   X   X  PC7
;           
;              PC0  PC1 PC2 PC3
;
;######################################################
;CABECERA
.include "m8535def.inc"
 
;######################################################
;Vector de Interrupciones
.org 0x00
    rjmp reset ;interrupción de Reset
;
;######################################################
;Variables Globales
;La variable tempscan se acomoda de la siguiente forma
 
;tempscan = [fila3,fila2,fila1,fila0,col3,col2,col1,col0]
;Son "banderas" que se prenden para indicar en qué fila
; y qué columna se halla la tecla.
 
 
.def tempscan=r17
.def temp=r16
 
;Rutina Principal
reset:
    ;inicializar pila
    cli
    ldi temp,low(ramend)
    out spl,temp
    ldi temp,high(ramend)
    out sph,temp
    sei
    rjmp init
 
init:
    ;Inicializar Puertos
    ;Este código emplea el puerto C, con los bits 0 al 3 para las columnas
    ;y los bits 4 al 7 para las filas.
    ;Inicia con las filas como salidas con ceros y las columnas como entradas
    ;que se mantienen en un nivel alto mientras no estén conectadas
    ;Para lograr esto, se habilitan las "resistencias pull-up" que conectan
    ;el pin deseado hacia VCC.
    ;Para hacerlo se declaran los pines como entradas (DDRC=0) pero
    ;enviamos 0xFF al registro PORTC para activarlas.
 
    ;Declarando al nibble alto como salida y al bajo como entrada
    ldi temp,0b11110000
    out DDRC,temp
    ;Activando las resistencias pull-up en la parte baja
    ldi temp,0x0F
    out PORTC,temp
    ;Si se presiona una tecla, el "0" de alguna fila será
    ;detectado por las columnas, y entonces comienza el
    ;proceso de decodificación.
 
    ldi temp,0b10000000
    out DDRD,temp
    ;Puerto D como salida para cuando detecta tecla
    ser temp
    out DDRA,temp
    ;Nibble bajo del puerto A como salida
    clr temp
    out PORTA,temp
 
    clr tempscan ;Borra el resultado del escaneo
 
    rjmp begin
 
begin:
    clr temp
    out PORTD,temp
    ;Probar si algun botón fue presionado
    in temp,PINC
    cpi temp,0x0F ;Si hay algun cero en las columnas, buscar la tecla
    brne antirrebotes
rjmp begin
 
antirrebotes:
;Esta rutina espera un corto periodo de tiempo mientras el interruptor
;se estabiliza para evitar que el micro detecte la misma tecla varias
;veces al igual que posible ruido.
    ;Vuelve a leer las entradas
    ser temp
    out PORTD,temp
    rcall delay
    in temp,PINC
    cpi temp,0x0F
    ;Si detecta el cero de nuevo, procesa la detección
    brne deteccion
    ;Si fue un falso contacto, vuelve a empezar
    rjmp begin
;FIN DE ANTIRREBOTES
 
deteccion:
    clr tempscan
    ;inicializamos el código de escaneo temporal
    ldi tempscan,0x00
    ;Buscar las columnas
    colscan:
        sbis pinc,0 ;prueba la columna 0
        ldi tempscan,0x01
        sbis pinc,1 ;prueba la columna 1
        ldi tempscan,0x02
        sbis pinc,2 ;prueba la columna 2
        ldi tempscan,0x04
        sbis pinc,3 ;prueba la columna 3
        ldi tempscan,0x08
 
    
    cpi tempscan,0x00 ;si no halló la columna, repetir
    breq init
 
    ;Ahora que se encontró la columna, tienen que invertirse 
    ;los sentidos del nibble bajo y el alto para buscar la
    ;fila
    rcall invertir
    ;Ahora invertidos, buscaremos si alguna fila está
    ;baja
    in temp,PINC
    cpi temp,0xF0 ;Si hay algun cero en las columnas, buscar la tecla
    brne filadetectada
    rjmp init ;Si no hay fila con cero, devuelve los puertos
    ;a su estado original y reinicia el programa
    
    filadetectada:
    ;Buscar la fila
    filascan:
        ldi temp,0x10
 
        sbis pinc,4 ;Prueba la fila 0
        rjmp col0
        sbis pinc,5 ;Prueba la fila 1
        rjmp col1
        sbis pinc,6 ;Prueba la fila 2
        rjmp col2
        sbis pinc,7 ;Prueba la fila 3
        rjmp col3
        rjmp init ;Si no halla la fila, reinicia
 
        ;A continuación se escribirá el valor correspondiente
        ;a la fila, se usa el comando ROL para multiplicar por 2
        ;pero se limpia antes la bandera de acarreo para evitar
        ;que se sume y entregue valores erróneos.
        col0:
            add tempscan,temp
            rjmp fincol
 
        col1:
            ldi temp,0x20
            add tempscan,temp
            rjmp fincol
        
        col2:
            ldi temp,0x40
            add tempscan,temp
            rjmp fincol
 
        col3:
            ldi temp,0x80
            add tempscan,temp
            rjmp fincol
    
    fincol:
 
    ;Toca procesar el código temporal para sacarlo
    ;por los leds, en este caso sale en 4 leds en puertoA
    out PORTA,tempscan
    clr tempscan
    rcall desinvertir ;devolver los puertos al estado original
    rjmp begin
 
;Subrutinas
 
delay:
    cli
    ;Respaldar variables globales en la pila
    push r16
    push r17
    ;Inicia secuencia de retraso
    loop0: ldi r17,0x04
    loop1: ldi r16,0xFF
    loop2: dec r16
        brne loop2
        dec r17
        brne loop1
    sei
    ;Restaurar las variables desde la pila
    pop r17
    pop r16
ret
 
invertir: ;Inversión de los pines
    ldi temp,0b00001111
    out DDRC,temp
    ;Activando las resistencias pull-up en la parte alta
    ldi temp,0xF0
    out PORTC,temp
    ;Ahora la parte alta es entrada con pullup y la parte
    ;baja son salidas con ceros
ret
 
desinvertir: ;Devolver los pines al estado inicial
    ldi temp,0b11110000
    out DDRC,temp
    ;Activando las resistencias pull-up en la parte alta
    ldi temp,0x0F
    out PORTC,temp
    ;Ahora la parte baja es entrada con pullup y la parte
    ;alta son salidas con ceros
ret
 
;FIN DEL PROGRAMA TECLADO MATRICIAL
