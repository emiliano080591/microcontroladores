# 1 "../practica.c"
# 1 "C:\\OHM\\workspace\\microcontroladores\\practica-10\\codigo-c\\default//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "../practica.c"
# 25 "../practica.c"
# 1 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/io.h" 1 3
# 99 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/io.h" 3
# 1 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/sfr_defs.h" 1 3
# 126 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/sfr_defs.h" 3
# 1 "c:/winavr-20100110/lib/gcc/../../avr/include/inttypes.h" 1 3
# 37 "c:/winavr-20100110/lib/gcc/../../avr/include/inttypes.h" 3
# 1 "c:/winavr-20100110/lib/gcc/../../avr/include/stdint.h" 1 3
# 121 "c:/winavr-20100110/lib/gcc/../../avr/include/stdint.h" 3
typedef int int8_t __attribute__((__mode__(__QI__)));
typedef unsigned int uint8_t __attribute__((__mode__(__QI__)));
typedef int int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int uint16_t __attribute__ ((__mode__ (__HI__)));
typedef int int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int uint32_t __attribute__ ((__mode__ (__SI__)));

typedef int int64_t __attribute__((__mode__(__DI__)));
typedef unsigned int uint64_t __attribute__((__mode__(__DI__)));
# 142 "c:/winavr-20100110/lib/gcc/../../avr/include/stdint.h" 3
typedef int16_t intptr_t;




typedef uint16_t uintptr_t;
# 159 "c:/winavr-20100110/lib/gcc/../../avr/include/stdint.h" 3
typedef int8_t int_least8_t;




typedef uint8_t uint_least8_t;




typedef int16_t int_least16_t;




typedef uint16_t uint_least16_t;




typedef int32_t int_least32_t;




typedef uint32_t uint_least32_t;







typedef int64_t int_least64_t;






typedef uint64_t uint_least64_t;
# 213 "c:/winavr-20100110/lib/gcc/../../avr/include/stdint.h" 3
typedef int8_t int_fast8_t;




typedef uint8_t uint_fast8_t;




typedef int16_t int_fast16_t;




typedef uint16_t uint_fast16_t;




typedef int32_t int_fast32_t;




typedef uint32_t uint_fast32_t;







typedef int64_t int_fast64_t;






typedef uint64_t uint_fast64_t;
# 273 "c:/winavr-20100110/lib/gcc/../../avr/include/stdint.h" 3
typedef int64_t intmax_t;




typedef uint64_t uintmax_t;
# 38 "c:/winavr-20100110/lib/gcc/../../avr/include/inttypes.h" 2 3
# 77 "c:/winavr-20100110/lib/gcc/../../avr/include/inttypes.h" 3
typedef int32_t int_farptr_t;



typedef uint32_t uint_farptr_t;
# 127 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/sfr_defs.h" 2 3
# 100 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/io.h" 2 3
# 284 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/io.h" 3
# 1 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/iom8535.h" 1 3
# 285 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/io.h" 2 3
# 408 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/io.h" 3
# 1 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/portpins.h" 1 3
# 409 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/io.h" 2 3

# 1 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/common.h" 1 3
# 411 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/io.h" 2 3

# 1 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/version.h" 1 3
# 413 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/io.h" 2 3


# 1 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/fuse.h" 1 3
# 248 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/fuse.h" 3
typedef struct
{
    unsigned char low;
    unsigned char high;
} __fuse_t;
# 416 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/io.h" 2 3


# 1 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/lock.h" 1 3
# 419 "c:/winavr-20100110/lib/gcc/../../avr/include/avr/io.h" 2 3
# 26 "../practica.c" 2
# 1 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay.h" 1 3
# 39 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay.h" 3
# 1 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 1 3
# 65 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 3
static inline void _delay_loop_1(uint8_t __count) __attribute__((always_inline));
static inline void _delay_loop_2(uint16_t __count) __attribute__((always_inline));
# 80 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 3
void
_delay_loop_1(uint8_t __count)
{
 __asm__ volatile (
  "1: dec %0" "\n\t"
  "brne 1b"
  : "=r" (__count)
  : "0" (__count)
 );
}
# 102 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay_basic.h" 3
void
_delay_loop_2(uint16_t __count)
{
 __asm__ volatile (
  "1: sbiw %0,1" "\n\t"
  "brne 1b"
  : "=w" (__count)
  : "0" (__count)
 );
}
# 40 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay.h" 2 3
# 79 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay.h" 3
static inline void _delay_us(double __us) __attribute__((always_inline));
static inline void _delay_ms(double __ms) __attribute__((always_inline));
# 109 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay.h" 3
void
_delay_ms(double __ms)
{
 uint16_t __ticks;
 double __tmp = ((4000000UL) / 4e3) * __ms;
 if (__tmp < 1.0)
  __ticks = 1;
 else if (__tmp > 65535)
 {

  __ticks = (uint16_t) (__ms * 10.0);
  while(__ticks)
  {

   _delay_loop_2(((4000000UL) / 4e3) / 10);
   __ticks --;
  }
  return;
 }
 else
  __ticks = (uint16_t)__tmp;
 _delay_loop_2(__ticks);
}
# 147 "c:/winavr-20100110/lib/gcc/../../avr/include/util/delay.h" 3
void
_delay_us(double __us)
{
 uint8_t __ticks;
 double __tmp = ((4000000UL) / 3e6) * __us;
 if (__tmp < 1.0)
  __ticks = 1;
 else if (__tmp > 255)
 {
  _delay_ms(__us / 1000.0);
  return;
 }
 else
  __ticks = (uint8_t)__tmp;
 _delay_loop_1(__ticks);
}
# 27 "../practica.c" 2



unsigned char tecla=0,lectura=0, tecla_anterior=0;
const char tabla7segmentos [16]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x7C,0x39,0x5E,0x79,0x71};
unsigned char aux1=0,aux2=0,aux3=0,aux4=0;

int main(void)
{





(*(volatile uint8_t *)((0x1A) + 0x20))=(1<<7) | (1<<6) | (1<<5) | (1<<4) | (1<<3) | (1<<2) | (1<<1) | (1<<0);

(*(volatile uint8_t *)((0x1B) + 0x20))=(0<<7) | (0<<6) | (0<<5) | (0<<4) | (0<<3) | (0<<2) | (0<<1) | (0<<0);



(*(volatile uint8_t *)((0x17) + 0x20))=(1<<7) | (1<<6) | (1<<5) | (1<<4) | (1<<3) | (1<<2) | (1<<1) | (1<<0);

(*(volatile uint8_t *)((0x18) + 0x20))=(0<<7) | (0<<6) | (0<<5) | (0<<4) | (0<<3) | (0<<2) | (0<<1) | (0<<0);



(*(volatile uint8_t *)((0x14) + 0x20))=(0<<7) | (0<<6) | (0<<5) | (0<<4) | (1<<3) | (1<<2) | (1<<1) | (1<<0);

(*(volatile uint8_t *)((0x15) + 0x20))=(1<<7) | (1<<6) | (1<<5) | (1<<4) | (0<<3) | (0<<2) | (0<<1) | (0<<0);



(*(volatile uint8_t *)((0x11) + 0x20))=(0<<7) | (0<<6) | (0<<5) | (0<<4) | (0<<3) | (0<<2) | (0<<1) | (0<<0);

(*(volatile uint8_t *)((0x12) + 0x20))=(0<<7) | (0<<6) | (0<<5) | (0<<4) | (0<<3) | (0<<2) | (0<<1) | (0<<0);






(*(volatile uint8_t *)((0x33) + 0x20))=(0<<6) | (0<<5) | (0<<4) | (0<<3) | (0<<2) | (0<<1) | (0<<0);
(*(volatile uint8_t *)((0x32) + 0x20))=0x00;
(*(volatile uint8_t *)((0x3C) + 0x20))=0x00;
# 84 "../practica.c"
(*(volatile uint8_t *)((0x2F) + 0x20))=(0<<7) | (0<<6) | (0<<5) | (0<<4) | (0<<1) | (0<<0);
(*(volatile uint8_t *)((0x2E) + 0x20))=(0<<7) | (0<<6) | (0<<4) | (0<<3) | (0<<2) | (0<<1) | (0<<0);
(*(volatile uint8_t *)((0x2D) + 0x20))=0x00;
(*(volatile uint8_t *)((0x2C) + 0x20))=0x00;
(*(volatile uint8_t *)((0x27) + 0x20))=0x00;
(*(volatile uint8_t *)((0x26) + 0x20))=0x00;
(*(volatile uint8_t *)((0x2B) + 0x20))=0x00;
(*(volatile uint8_t *)((0x2A) + 0x20))=0x00;
(*(volatile uint8_t *)((0x29) + 0x20))=0x00;
(*(volatile uint8_t *)((0x28) + 0x20))=0x00;






(*(volatile uint8_t *)((0x22) + 0x20))=0<<3;
(*(volatile uint8_t *)((0x25) + 0x20))=(0<<6) | (0<<5) | (0<<4) | (0<<3) | (0<<2) | (0<<1) | (0<<0);
(*(volatile uint8_t *)((0x24) + 0x20))=0x00;
(*(volatile uint8_t *)((0x23) + 0x20))=0x00;


(*(volatile uint8_t *)((0x39) + 0x20))=(0<<7) | (0<<6) | (0<<5) | (0<<4) | (0<<3) | (0<<2) | (0<<1) | (0<<0);





(*(volatile uint8_t *)((0x35) + 0x20))=(0<<3) | (0<<2) | (0<<1) | (0<<0);
(*(volatile uint8_t *)((0x34) + 0x20))=(0<<6);



(*(volatile uint8_t *)((0x0A) + 0x20))=(0<<7) | (0<<6) | (0<<5) | (0<<4) | (0<<3) | (0<<2) | (0<<1) | (0<<0);







(*(volatile uint8_t *)((0x08) + 0x20))=(1<<7) | (0<<6) | (0<<5) | (0<<4) | (0<<3) | (0<<2) | (0<<1) | (0<<0);
(*(volatile uint8_t *)((0x30) + 0x20))=(0<<3);



(*(volatile uint8_t *)((0x06) + 0x20))=(0<<7) | (0<<6) | (0<<5) | (0<<4) | (0<<3) | (0<<2) | (0<<1) | (0<<0);



(*(volatile uint8_t *)((0x0D) + 0x20))=(0<<7) | (0<<6) | (0<<5) | (0<<4) | (0<<3) | (0<<2) | (0<<1) | (0<<0);



(*(volatile uint8_t *)((0x36) + 0x20))=(0<<6) | (0<<5) | (0<<4) | (0<<2) | (0<<0);

while (1)
    {
  (*(volatile uint8_t *)((0x15) + 0x20))=0b11110111;
        lectura=(*(volatile uint8_t *)((0x13) + 0x20))&0b11110000;
        if (lectura==0b11100000)
            tecla=10;
        if (lectura==0b11010000)
            tecla=11;
        if (lectura==0b10110000)
            tecla=12;
        if (lectura==0b01110000)
            tecla=13;


        (*(volatile uint8_t *)((0x15) + 0x20))=0b11111011;
        lectura=(*(volatile uint8_t *)((0x13) + 0x20))&0b11110000;
        if (lectura==0b11100000)
            tecla=9;
        if (lectura==0b11010000)
            tecla=6;
        if (lectura==0b10110000)
            tecla=3;
        if (lectura==0b01110000)
            tecla=14;


        (*(volatile uint8_t *)((0x15) + 0x20))=0b11111101;
        lectura=(*(volatile uint8_t *)((0x13) + 0x20))&0b11110000;
        if (lectura==0b11100000)
            tecla=8;
        if (lectura==0b11010000)
            tecla=5;
        if (lectura==0b10110000)
            tecla=2;
        if (lectura==0b01110000)
            tecla=0;


        (*(volatile uint8_t *)((0x15) + 0x20))=0b11111110;
        lectura=(*(volatile uint8_t *)((0x13) + 0x20))&0b11110000;
        if (lectura==0b11100000)
            tecla=7;
         if (lectura==0b11010000)
            tecla=4;
        if (lectura==0b10110000)
            tecla=1;
        if (lectura==0b01110000)
            tecla=15;


        if(tabla7segmentos[tecla]!=aux1){
        aux4=aux3;
        aux3=aux2;
        aux2=aux1;
        }


  aux1=tabla7segmentos [tecla];
        (*(volatile uint8_t *)((0x18) + 0x20))=~0x01;
        (*(volatile uint8_t *)((0x1B) + 0x20))=aux1;
        _delay_ms(2);
        (*(volatile uint8_t *)((0x18) + 0x20))=~0x02;
        (*(volatile uint8_t *)((0x1B) + 0x20))=aux2;
        _delay_ms(2);
        (*(volatile uint8_t *)((0x18) + 0x20))=~0x04;
        (*(volatile uint8_t *)((0x1B) + 0x20))=aux3;
        _delay_ms(2);
        (*(volatile uint8_t *)((0x18) + 0x20))=~0x08;
        (*(volatile uint8_t *)((0x1B) + 0x20))=aux4;
        _delay_ms(2);



 }
}
