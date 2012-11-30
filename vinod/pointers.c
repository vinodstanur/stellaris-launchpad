#include "inc/lm4f120h5qr.h"
#include "inc/hw_gpio.h"
#include "inc/hw_memmap.h"
#include "inc/hw_sysctl.h"
#include "inc/hw_types.h"
#include "driverlib/gpio.h"
#include "driverlib/rom.h"
#include "driverlib/sysctl.h"
#include "buttons.h"

void delay(volatile unsigned int i)
{
	while(i--);
}

int main(void)
{
    volatile unsigned long ulLoop;
    ROM_SysCtlClockSet(SYSCTL_SYSDIV_2|SYSCTL_USE_PLL|SYSCTL_XTAL_16MHZ|SYSCTL_OSC_MAIN);
	SYSCTL_RCGC2_R = SYSCTL_RCGC2_GPIOF;
    ulLoop = SYSCTL_RCGC2_R;
	GPIO_PORTF_PUR_R = (1<<0)|(1<<4);
	GPIO_PORTF_DIR_R = (1<<1)|(1<<2)|(1<<3);
	GPIO_PORTF_DEN_R = (1<<0)|(1<<1)|(1<<2)|(1<<3)|(1<<4);
    volatile unsigned int count = 0;

	while(1) {
		if(*((volatile unsigned long *)((volatile unsigned long)GPIO_PORTF_DATA_BITS_R + (1<<6)))){
			*((volatile unsigned long *)((volatile unsigned long)GPIO_PORTF_DATA_BITS_R + (1<<5)))=255;
			*((volatile unsigned long *)((volatile unsigned long)GPIO_PORTF_DATA_BITS_R + (1<<3)))=255;
		}
		else {
			*((volatile unsigned long *)((volatile unsigned long)GPIO_PORTF_DATA_BITS_R + (1<<5)))=0;
			*((unsigned long *)((volatile unsigned long)GPIO_PORTF_DATA_BITS_R + (1<<3)))=0;
		}
		//delay(100000);
		//ROM_SysCtlDelay(1);
	}
}
