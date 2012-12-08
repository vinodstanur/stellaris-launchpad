#include "inc/lm4f120h5qr.h"
#include "inc/hw_gpio.h"
#include "inc/hw_memmap.h"
#include "inc/hw_sysctl.h"
#include "inc/hw_types.h"
#include "driverlib/gpio.h"
#include "driverlib/rom.h"
#include "driverlib/sysctl.h"

int main(void)
{
	float A = 1.23456;
	float B=2.345678;
	B=A+B;
    volatile unsigned long ulLoop;
    ROM_SysCtlClockSet(SYSCTL_SYSDIV_8|SYSCTL_USE_PLL|SYSCTL_XTAL_16MHZ|SYSCTL_OSC_MAIN);
	SYSCTL_RCGC2_R = SYSCTL_RCGC2_GPIOF;
    ulLoop = SYSCTL_RCGC2_R;
	//GPIO_PORTF_PUR_R = (1<<0)|(1<<4);
	GPIO_PORTF_DIR_R = 0xff;
	GPIO_PORTF_DEN_R = 0xff;
    volatile unsigned int count = 0;

	while(1) {
//		if(GPIO_PORTF_DATA_R & 1<<4)
//			GPIO_PORTF_DATA_R = 1<<2;
//		else
//			GPIO_PORTF_DATA_R = 0;
		GPIO_PORTF_DATA_R ^= 0xff;
		SysCtlDelay(5000000);
	}
}
