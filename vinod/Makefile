SOURCE = main

blinky.bin:$(SOURCE).c
		arm-none-eabi-gcc startup_gcc.c $(SOURCE).c -mthumb -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -fgnu89-inline -Os -ffunction-sections -fdata-sections -MD -std=c99 -Wall -pedantic -DPART_LM4F120H5QR -c -g -I/home/vinod/stellaris -I./ -DTARGET_IS_BLIZZARD_RA1
		arm-none-eabi-gcc $(SOURCE).c -mthumb -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -fgnu89-inline -Os -ffunction-sections -fdata-sections -MD -std=c99 -Wall -pedantic -DPART_LM4F120H5QR -S -I/home/vinod/stellaris -I./ -DTARGET_IS_BLIZZARD_RA1
	arm-none-eabi-ld -T blinky.ld --entry ResetISR -o a.out $(SOURCE).o startup_gcc.o -L/home/vinod/stellaris/driverlib/gcc-cm4f/ -ldriver-cm4f --gc-sections
	arm-none-eabi-objcopy -O binary a.out blinky.bin
	
prog:blinky.bin
	sudo lm4flash blinky.bin

clean:
	rm *.o *.bin *.out *.d *.s
