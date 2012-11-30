SOURCE = temperature_sensor.c
obj1 = temperature_sensor.o

make all:
	arm-none-eabi-gcc $(SOURCE) uartstdio.c startup_gcc.c -g -mthumb -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -Os -ffunction-sections -fdata-sections -MD -std=c99 -Wall -pedantic -DPART_LM4F120H5QR -c -I /home/vinod/stellaris/  -DTARGET_IS_BLIZZARD_RA1
	
	arm-none-eabi-ld -T blinky.ld --entry ResetISR -o a.out $(obj1) startup_gcc.o uartstdio.o --gc-sections -L /home/vinod/stellaris/driverlib/gcc-cm4f/ -ldriver-cm4f 
	
	arm-none-eabi-objcopy -O binary a.out a.bin

prog:
	sudo lm4flash a.bin
