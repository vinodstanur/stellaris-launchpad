#####################################
#makefile for launchpad_lcd 
#author: Vinod S
#<vinodstanur@gmail.com>
#blog: http://blog.vinu.co.in
#####################################

#MODIFY THE INCLUDE PATH AND DRIVER PATH, it depends on the path where you extract the stellaris library downloaded from ti

SOURCE		=	lcd
INCLUDE		=	~/stellaris #may be you need to modify this 
DRIVER_PATH	=	~/stellaris/driverlib/gcc-cm4f #may be you need to modify this
DRIVER		=	 driver-cm4f #no need to modify this

################NO NEED TO MODIFY BELOW STUFF##############
lcd.bin:$(SOURCE).c
		arm-none-eabi-gcc startup_gcc.c $(SOURCE).c -mthumb -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -fgnu89-inline -Os -ffunction-sections -fdata-sections -MD -std=c99 -Wall -pedantic -DPART_LM4F120H5QR -c -g -I $(INCLUDE) -I./ -DTARGET_IS_BLIZZARD_RA1
		arm-none-eabi-gcc $(SOURCE).c -mthumb -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -fgnu89-inline -Os -ffunction-sections -fdata-sections -MD -std=c99 -Wall -pedantic -DPART_LM4F120H5QR -S -I $(INCLUDE) -I./ -DTARGET_IS_BLIZZARD_RA1
	arm-none-eabi-ld -T blinky.ld --entry ResetISR -o a.out $(SOURCE).o startup_gcc.o -L $(DRIVER_PATH) -l$(DRIVER) --gc-sections
	arm-none-eabi-objcopy -O binary a.out lcd.bin
	
prog:lcd.bin
	sudo lm4flash lcd.bin

clean:
	rm *.o *.bin *.out *.d *.s
