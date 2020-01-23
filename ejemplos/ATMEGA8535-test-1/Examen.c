/*

Notas:
	- El ATMega48 funciona a 8MHz
	- Se utilizarán 3 display cátodo (se activan con '1' y los segmentos se activan con '0')
	- El puerto B (8 bits) se utiliza para mandar los datos a los displays multiplexados (manda '0's para prender los segmentos)
		=> PORTB = |P|G|F|E|D|C|B|A|
	- El puerto C (7 bits) se utiliza para multiplexar los transistores 2N2222 (utilizados para multiplexar cátodos). La sincronización se hace de derecha a izquierda
		=>PORTC = |X|X|X|X|1|1|1| // Solamente necesitamos los 3 primeros bits menos significativos. Las 'X' son bits que nos importan una mierda :D
			=> PORTD0 := Controla el display 0
			=> PORTD1 := Controla el display 1
			=> PORTD2 := Controla el display 2
	- El puerto D (8 bits) se utiliza para las interrupciones externas y para recibir datos del dip-switch (http://www.electronics-base.com/avr-tutorials/external-interrupts/107-avr-external-interrupts-int0-example)
		=> PORTD = |S|S|S|S|B|B|X|X| // S: Dip-Switch; B = Push Buttons
			=> PORTD2 := Este push button desplaza el punto decimal (INT0)
			=> PORTD3 := Este push button muestra el valor actual del Dip-Switch en el display que tenga el punto decimal (INT1)

Programa (pseudocódigo)
	// Includes
	// Definiciones de registros
		dmx_registro_transistor // Indica el transistor a activar
		dmx_registro_punto // Indica la posición actual del punto decimal
		dmx_registro_valordisplay // Indica el valor del display actual, que se escribe inmediatamente al puerto de salida B
		dmx_registro_dipswitch // Almacena el valor del dip-switch
	// Vectores de interrupción
	inicializarPrograma()
	{
		// Inicializar pila (github.com/stederr/ESCOM => Introducción a los Microcontroladores => Práctica5)
		// Configurar los Data Direction Registers (definir entradas o salidas puertos) => PORTB = salida, PORTC = salida, PORTD = entrada
		// Configurar timer para sincronizar transistores (aparentemente uno de 8 bits es suficiente); esto es indicar su valor inicial, modo de operación y prescaler
		// Configurar interrupciones externas en INT0 e INT1
		// Habilitar interrupciones globales
	}
	ejecutar()
	{
		// Asignar 0b00000001 al registro dmx_registro_transistor
		// Asignar 0b00000001 al registro dmx_registro_punto

		// Asignar símbolo '-' al registro dmx_registro_valordisplay (considerando que se usan display cátodo, por lo que los LEDs encienden con '0')

		// Arrancar timer
	}

	// Interrupciones
	habilitarTransistor() // Este segmento de código se ejecuta cuando el Timer produce una interrupción (alcanza su valor máximo en el registro TimeCounter TNCT)
	{
		// Si el registro dmx_registro_transistor no es igual al registro dmx_registro_punto, entonces asignar '-' al registro dmx_registro_valordisplay
		// Si el registro dmx_registro_transistor es igual al registro dmx_registro_punto, entonces append símbolo '.' al registro dmx_registro_valordisplay (utilizar OR)
		// Escribir el valor del registro dmx_registro_transistor a PORTC (Para habilitar el transistor del display actual)
			// En este punto puede que sea necesario algunos NOPs adicionales para ganar tiempo de recuperación de alimentación del circuito para evitar posible ruido o algún mame por el estilo
		// Escribir el valor del registro dmx_registro_valordisplay a PORTB
		// Desplazar valor del registro dmx_registro_transistor un bit a la izquierda. Considerar que si su valor actual es 0b00000100 entonces tomará el nuevo valor de 0b00000001
	}
	cambiarPosicionPunto() // Se ejecuta cuando se produce la interrupción INT0
	{
		// Desplazar valor del registro dmx_registro_punto un bit a la izquierda. Considerar que si su valor actual es 0b00000100 entonces tomará el nuevo valor de 0b00000001
	}
	leerDatoDipSwitch() // Se ejecuta cuando se produce la interrupción INT1
	{
		// Leer valor del puerto D (solo dip-switch) y asignar valor al registro dmx_registro_dipswitch
		// Si el valor de dmx_registro_dipswitch es 0b00000000, asignar el valor correspondiente (0) a dmx_registro_transistor
		....
		// Si el valor de dmx_registro_dipswitch es 0b00001001, asignar el valor correspondiente (9) a dmx_registro_transistor
		// Si el valor de dmx_registro_dipswitch no es alguno de los anteriores, asignar el valor correspondiente (-) a dmx_registro_transistor
	}

	// Subrutinas (utilizar en condiciones dentro de las interrupciones)
		// Para valores de display (0-9), etc.

*/


/*
	IPN - ESCOM
	Introducción a los Microcontroladores
	Ortega Ortuño Eder - multiaportes.com/microcontroladores
*/

#define F_CPU 8000000
#define PRESCALA 0b00000001
#include <avr/io.h>
#include <avr/interrupt.h>
#include <inttypes.h>

// Los catodos se alimentan con '0' y sus segmentos se encienden con '1'

// Variables globales
volatile static uint8_t dmx_select_transistor, dmx_select_punto, dmx_valor_display, dmx_valor_tmp, dmx_valor_dipswitch;

void setValor(unsigned char simbolo, uint8_t tmp)
{
	uint8_t aux = 0;

	switch(simbolo)
	{
		case '0':
			aux = 0x3f;
			break;
		case '1':
			aux = 0x30;
			break;
		case '2':
			aux = 0x5b;
			break;
		case '3':
			aux = 0x4f;
			break;
		case '4':
			aux = 0x66;
			break;
		case '5':
			aux = 0x6d;
			break;
		case '6':
			aux = 0x7d;
			break;
		case '7':
			aux = 0x07;
			break;
		case '8':
			aux = 0x7f;
			break;
		case '9':
			aux = 0x6f;
			break;
		case '-':
			aux = 0x40;
			break;
	}

	if(tmp == 0)
		dmx_valor_display = aux;
	else if(tmp == 1)
		dmx_valor_tmp = aux;
}
void desplazarTransistor()
{
	if(dmx_select_transistor == 0b00000100)
		dmx_select_transistor = 0b00000001;
	else
		dmx_select_transistor = dmx_select_transistor << 1;
}
void desplazarPunto()
{
	if(dmx_select_punto == 0b00000100)
		dmx_select_punto = 0b00000001;
	else
		dmx_select_punto = dmx_select_punto << 1;
}
void init()
{
	DDRB = DDRC = 0xFF;
	DDRD = 0x00;

	sei();

	// Configurando interrupciones externas (en ese orden se colocan los registros, de lo contrario ocurre un salto desconocido en el flujo del programa)
	EICRA = 0b00001111; // INT1: interrupcion se activa en rising-edge (11) - INT0: idem
	EIMSK = 0b00000011; // Habilitar INT0 e INT1

	// Configurando timer 0 (8 bits)
	TCNT0 = 0x00; // Contador
	TIMSK0 = 0b00000001; // Indica que la interrupcion se hara al desbordarse el contador
	TCCR0B = PRESCALA; // Seleccionar prescaler o detener contador

	// Inicializando registros auxiliares
	dmx_valor_display = dmx_valor_tmp = 0b00000000;
	dmx_select_transistor = dmx_select_punto = 0b00000001;
	setValor('-', 0);
}
int main()
{
	init();

	while(1)
	{
		// Hacemos algunas instrucciones a lo pendejo para mantener ocupado el bucle infinito y evitar que la interrupcion del Timer0 ocurra antes del overflow 
		__asm__ __volatile__("nop");
		__asm__ __volatile__("nop");
	}

	return 0;
}

// Rutinas de Servicio de Interrupción
ISR(TIMER0_OVF_vect) // Cuando el timer se desborda (Habilitar transistor: un nuevo display debe ser habilitado y actualizado su valor)
{
	// Detenemos el contador porque seguira ejecutandose aun cuando exista una interrupcion
	TCCR0B = 0x00;
	TCNT0 = 0;

	if(dmx_select_transistor == dmx_select_punto)
	{
		dmx_valor_display = dmx_valor_tmp;
		dmx_valor_display |= 0b10000000; // Le habilitamos el punto decimal al valor actual
	}
	else
		setValor('-', 0);
	
	PORTC = ~dmx_select_transistor; // Se niegan la salidan para trabajar con catodos
	// Tal vez sea buena idea añadir un pequeño delay aqui para darle chance de recuperarse al circuito y evitar que se traslapen datos
	PORTB = dmx_valor_display; // No es necesario negar el valor del display ya que se consideran los valores como catodos

	// Seleccionar el primer transistor nuevamente si alcanza la cantidad de displays
	desplazarTransistor();

	// Reanudamos el contador al final de la interrupcion
	TCCR0B = PRESCALA;
}
ISR(INT0_vect) // Interrupción al oprimir el push button 1: desplazar el punto al siguiente display
{
	// Detenemos el contador
	TCCR0B = 0x00;

	desplazarPunto();

	// Reanudamos el contador
	TCCR0B = PRESCALA;
}
ISR(INT1_vect) // Interrupción al oprimir el push button 2: leer dato del dip-switch
{
	// Detenemos el contador
	TCCR0B = 0x00;

	dmx_valor_dipswitch = PIND;

	dmx_valor_dipswitch &= 11110000; // Nos importan un carajo los pines LOW (que tienen conectados dos de ellos a los push button), asi que limpiamos su valor para que no interfieran con el switch

	switch(dmx_valor_dipswitch)
	{
		case 0b00000000:
			setValor('0', 1);
			break;
		case 0b00010000:
			setValor('1', 1);
			break;
		case 0b00100000:
			setValor('2', 1);
			break;
		case 0b00110000:
			setValor('3', 1);
			break;
		case 0b01000000:
			setValor('4', 1);
			break;
		case 0b01010000:
			setValor('5', 1);
			break;
		case 0b01100000:
			setValor('6', 1);
			break;
		case 0b01110000:
			setValor('7', 1);
			break;
		case 0b10000000:
			setValor('8', 1);
			break;
		case 0b10010000:
			setValor('9', 1);
			break;
		default:
			setValor('-', 1);
			break;
	}

	// Reanudamos el contador
	TCCR0B = PRESCALA;
}
