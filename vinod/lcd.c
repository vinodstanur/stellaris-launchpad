/*16x2 lcd with stellaris launchpad...
/----------------------------------------/
CONNECTION TIPS:
RS: PF1
EN:PF2
DATA: PD0 - PD3 to d4 to d7 in lcd respectively
VDD (POWER): connect 5v supply to LCD from the launchpad itself (one of the 3 connection near the switch)
R/W: Ground it
Remaining LCD pins (d0 to d4): Leave it as it is ie floating
VEE of LCD: Pull down using 1K resistor (connect to ground using 1K resistor)
/---------------------------------------/
Author: Vinod S
website: http://blog.vinu.co.in
*/


#include "inc/lm4f120h5qr.h"
#include "inc/hw_gpio.h"
#include "inc/hw_memmap.h"
#include "inc/hw_sysctl.h"
#include "inc/hw_types.h"
#include "driverlib/gpio.h"
#include "driverlib/rom.h"
#include "driverlib/sysctl.h"

volatile unsigned long ulLoop;

void setup()
{
//clock setup 
	ROM_SysCtlClockSet(SYSCTL_SYSDIV_8|SYSCTL_USE_PLL|SYSCTL_XTAL_16MHZ|SYSCTL_OSC_MAIN);
	SYSCTL_RCGC2_R |= SYSCTL_RCGC2_GPIOD;
	SYSCTL_RCGC2_R |= SYSCTL_RCGC2_GPIOF;
//lcd connections init
	ulLoop = SYSCTL_RCGC2_R;
	GPIO_PORTD_DIR_R = 0xff;
	GPIO_PORTD_DEN_R = 0xff;
	GPIO_PORTF_DIR_R = 0xff;
	GPIO_PORTF_DEN_R = 0xff;
}


#define RS(X)     GPIO_PORTF_DATA_R = ((GPIO_PORTF_DATA_R & ~(1<<1)) | (X<<1))
#define EN(X)     GPIO_PORTF_DATA_R = ((GPIO_PORTF_DATA_R & ~(1<<2)) | (X<<2))
#define LCD_STROBE do{EN(1);EN(0);}while(0)
#define databits GPIO_PORTD_DATA_R  // P1.7 - D7, ....., P1.4 - D4
#define LINE1 cmd(0x80)
#define LINE2 cmd(0xc0)

  
void data(unsigned char c)
{
    RS(1);
    SysCtlDelay(400);  
    databits = c >>4;
    LCD_STROBE;
    databits = c;
    LCD_STROBE;
}
 
void cmd(unsigned char c)
{
    RS(0);
    SysCtlDelay(400); 
    databits = c >>4;
    LCD_STROBE;
    databits = c;
    LCD_STROBE;
}
 
void pseudo_8bit_cmd(unsigned char c)
{
    RS(0);
    SysCtlDelay(15000);
    databits = (c);
    LCD_STROBE;
}
void clear(void)
{
    cmd(0x01);
    SysCtlDelay(30000);
}
 
void lcd_init()
{
    pseudo_8bit_cmd(0x30); //this command is like 8 bit mode command
    pseudo_8bit_cmd(0x30); //lcd expect 8bit mode commands at first
    pseudo_8bit_cmd(0x30); //for more details, check any 16x2 lcd spec
    pseudo_8bit_cmd(0x20);
    cmd(0x28);             //4 bit mode command started, set two line
    cmd(0x0c);             // Make cursorinvisible
    clear();               // Clear screen
    cmd(0x6);              // Set entry Mode(auto increment of cursor)
}
 
void string(char *p)
{
    while(*p) data(*p++);
}
 
int main()
{
	while(1) {
		setup();
		lcd_init();
		LINE1;
		string("Stellaris |====>");
		LINE2;
		string("|====> Launchpad");
		SysCtlDelay(50000);
		RS(0);
		while(1);
	}
}
