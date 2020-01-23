//******************************************************
//     **** ADC ROUTINES - SOURCE FILE *****
//******************************************************
//Controller		: ATmega32 (Clock: 8 Mhz-internal)
//Compiler			: AVR-GCC (winAVR with AVRStudio-4)
//Project Version	: DL_1.0
//Author			: CC Dharmani, Chennai (India)
//			  		  www.dharmanitech.com
//Date				: 10 May 2011
//******************************************************

#include <avr/io.h>
#include "ADC_routines.h"


//******************************************************
//Purpose : Initialize the ADC
//Conversion time: 52uS
//******************************************************
void ADC_init(void)
{
  ADCSRA = 0x00; //disable adc
  ADMUX  = 0x40;  //select adc input 0, ref:AVCC
  ADCSRA = 0x82; //prescaler:4, single conversion mode
  ADC_ENABLE;
}


//********************************************************************
//Purpose : Do an Analog to Digital Conversion
//Paramtr :	none
//return  : intger temperature value
//********************************************************************
unsigned int ADC_read(void)
{
    char i;
    unsigned int ADC_temp, ADCH_temp;
    unsigned int ADC_var = 0;
    
            
    for(i=0;i<8;i++)             // do the ADC conversion 8 times for better accuracy 
    {
	 	ADC_START_CONVERSION;
        while(!(ADCSRA & 0x10)); // wait for conversion done, ADIF flag active
        ADCSRA|=(1<<ADIF);
		
        ADC_temp = ADCL;         // read out ADCL register
        ADCH_temp = ADCH;        // read out ADCH register        
		ADC_temp +=(ADCH_temp << 8);
        ADC_var += ADC_temp;      // accumulate result (8 samples) for later averaging
    }

    ADC_var = ADC_var >> 3;       // average the 8 samples

	if(ADC_var > 1023) ADC_var = 1023;
	
    return ADC_var;
}


//********************************************************************
//Purpose : Read voltage from ADC channels
//Paramtr : unsigned char ADC channel number
//returns : None (modifies the global string 'voltage')
//********************************************************************
float readVoltage(unsigned char channel)
{
   unsigned int value;
   float volt;

   adc_setChannel(channel);
   
   value = ADC_read();

   volt = (float)(value * 5.0)/ 1024.0;
   return volt; 
}  


void adc_setChannel(unsigned char channel)
{
	switch(channel)
	{
		case 0x00:
		ADMUX= 0x40;
		ADCSRB&=~(1<<MUX5);
		break;
		
		case 0x01:
		ADMUX= 0x41;
		ADCSRB&=~(1<<MUX5);
		break;
		
		case 0x02:
		ADMUX= 0x42;
		ADCSRB&=~(1<<MUX5);
		break;
		
		case 0x03:
		ADMUX= 0x43;
		ADCSRB&=~(1<<MUX5);
		break;
		
		case 0x04:
		ADMUX= 0x44;
		ADCSRB&=~(1<<MUX5);
		break;
		
		case 0x05:
		ADMUX= 0x45;
		ADCSRB&=~(1<<MUX5);
		break;
		
		case 0x06:
		ADMUX= 0x46;
		ADCSRB&=~(1<<MUX5);
		break;
		
		case 0x07:
		ADMUX= 0x47;
		ADCSRB&=~(1<<MUX5);
		break;
		
		case 0x08:
		ADMUX= 0x40;
		ADCSRB|=(1<<MUX5);
		break;
		
		case 0x09:
		ADMUX= 0x41;
		ADCSRB|=(1<<MUX5);
		break;
		
		case 0x0A:
		ADMUX= 0x42;
		ADCSRB|=(1<<MUX5);
		break;
		
		case 0x0B:
		ADMUX= 0x43;
		ADCSRB|=(1<<MUX5);
		break;
		
		case 0x0C:
		ADMUX= 0x44;
		ADCSRB|=(1<<MUX5);
		break;
		
		case 0x0D:
		ADMUX= 0x45;
		ADCSRB|=(1<<MUX5);
		break;
		
		case 0x0E:
		ADMUX= 0x46;
		ADCSRB|=(1<<MUX5);
		break;
		
		case 0x0F:
		ADMUX= 0x47;
		ADCSRB|=(1<<MUX5);
		break;
		
	}		
}