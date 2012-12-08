	.syntax unified
	.cpu cortex-m4
	.eabi_attribute 27, 3
	.fpu fpv4-sp-d16
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 18, 4
	.thumb
	.file	"main.c"
	.section	.text.startup.main,"ax",%progbits
	.align	1
	.global	main
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L3
	ldr	r3, [r3, #0]
	push	{r0, r1, r4, lr}
	ldr	r3, [r3, #92]
	ldr	r0, .L3+4
	ldr	r4, .L3+8
	blx	r3
	ldr	r3, .L3+12
	movs	r2, #32
	str	r2, [r3, #0]
	ldr	r3, [r3, #0]
	ldr	r2, .L3+16
	str	r3, [sp, #0]
	movs	r3, #255
	str	r3, [r2, #0]
	str	r3, [r2, #284]
	movs	r3, #0
	str	r3, [sp, #4]
.L2:
	ldr	r3, [r4, #0]
	ldr	r0, .L3+20
	eor	r3, r3, #255
	str	r3, [r4, #0]
	bl	SysCtlDelay
	b	.L2
.L4:
	.align	2
.L3:
	.word	16777284
	.word	62915904
	.word	1073894396
	.word	1074782472
	.word	1073894400
	.word	5000000
	.size	main, .-main
	.ident	"GCC: (Linaro GCC 4.6-2011.10) 4.6.2 20111004 (prerelease)"
