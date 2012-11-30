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
	.file	"lcd.c"
	.section	.text.setup,"ax",%progbits
	.align	1
	.global	setup
	.thumb
	.thumb_func
	.type	setup, %function
setup:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	ldr	r3, .L2
	ldr	r0, .L2+4
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #92]
	blx	r3
	ldr	r3, .L2+8
	ldr	r2, [r3, #0]
	orr	r2, r2, #8
	str	r2, [r3, #0]
	ldr	r2, [r3, #0]
	orr	r2, r2, #32
	str	r2, [r3, #0]
	ldr	r2, [r3, #0]
	ldr	r3, .L2+12
	str	r2, [r3, #0]
	ldr	r2, .L2+16
	movs	r3, #255
	str	r3, [r2, #0]
	str	r3, [r2, #284]
	ldr	r2, .L2+20
	str	r3, [r2, #0]
	str	r3, [r2, #284]
	pop	{r3, pc}
.L3:
	.align	2
.L2:
	.word	16777284
	.word	62915904
	.word	1074782472
	.word	ulLoop
	.word	1073771520
	.word	1073894400
	.size	setup, .-setup
	.section	.text.data,"ax",%progbits
	.align	1
	.global	data
	.thumb
	.thumb_func
	.type	data, %function
data:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	ldr	r4, .L5
	ldr	r3, [r4, #0]
	orr	r3, r3, #2
	mov	r5, r0
	str	r3, [r4, #0]
	mov	r0, #400
	bl	SysCtlDelay
	ldr	r3, .L5+4
	lsrs	r2, r5, #4
	str	r2, [r3, #0]
	ldr	r2, [r4, #0]
	orr	r2, r2, #4
	str	r2, [r4, #0]
	ldr	r2, [r4, #0]
	bic	r2, r2, #4
	str	r2, [r4, #0]
	str	r5, [r3, #0]
	ldr	r3, [r4, #0]
	orr	r3, r3, #4
	str	r3, [r4, #0]
	ldr	r3, [r4, #0]
	bic	r3, r3, #4
	str	r3, [r4, #0]
	pop	{r3, r4, r5, pc}
.L6:
	.align	2
.L5:
	.word	1073894396
	.word	1073771516
	.size	data, .-data
	.section	.text.cmd,"ax",%progbits
	.align	1
	.global	cmd
	.thumb
	.thumb_func
	.type	cmd, %function
cmd:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	ldr	r4, .L8
	ldr	r3, [r4, #0]
	bic	r3, r3, #2
	mov	r5, r0
	str	r3, [r4, #0]
	mov	r0, #400
	bl	SysCtlDelay
	ldr	r3, .L8+4
	lsrs	r2, r5, #4
	str	r2, [r3, #0]
	ldr	r2, [r4, #0]
	orr	r2, r2, #4
	str	r2, [r4, #0]
	ldr	r2, [r4, #0]
	bic	r2, r2, #4
	str	r2, [r4, #0]
	str	r5, [r3, #0]
	ldr	r3, [r4, #0]
	orr	r3, r3, #4
	str	r3, [r4, #0]
	ldr	r3, [r4, #0]
	bic	r3, r3, #4
	str	r3, [r4, #0]
	pop	{r3, r4, r5, pc}
.L9:
	.align	2
.L8:
	.word	1073894396
	.word	1073771516
	.size	cmd, .-cmd
	.section	.text.pseudo_8bit_cmd,"ax",%progbits
	.align	1
	.global	pseudo_8bit_cmd
	.thumb
	.thumb_func
	.type	pseudo_8bit_cmd, %function
pseudo_8bit_cmd:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	ldr	r4, .L11
	ldr	r3, [r4, #0]
	bic	r3, r3, #2
	mov	r5, r0
	str	r3, [r4, #0]
	movw	r0, #15000
	bl	SysCtlDelay
	ldr	r3, .L11+4
	str	r5, [r3, #0]
	ldr	r3, [r4, #0]
	orr	r3, r3, #4
	str	r3, [r4, #0]
	ldr	r3, [r4, #0]
	bic	r3, r3, #4
	str	r3, [r4, #0]
	pop	{r3, r4, r5, pc}
.L12:
	.align	2
.L11:
	.word	1073894396
	.word	1073771516
	.size	pseudo_8bit_cmd, .-pseudo_8bit_cmd
	.section	.text.clear,"ax",%progbits
	.align	1
	.global	clear
	.thumb
	.thumb_func
	.type	clear, %function
clear:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	movs	r0, #1
	bl	cmd
	movw	r0, #30000
	pop	{r3, lr}
	b	SysCtlDelay
	.size	clear, .-clear
	.section	.text.lcd_init,"ax",%progbits
	.align	1
	.global	lcd_init
	.thumb
	.thumb_func
	.type	lcd_init, %function
lcd_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	movs	r0, #48
	bl	pseudo_8bit_cmd
	movs	r0, #48
	bl	pseudo_8bit_cmd
	movs	r0, #48
	bl	pseudo_8bit_cmd
	movs	r0, #32
	bl	pseudo_8bit_cmd
	movs	r0, #40
	bl	cmd
	movs	r0, #12
	bl	cmd
	bl	clear
	movs	r0, #6
	pop	{r3, lr}
	b	cmd
	.size	lcd_init, .-lcd_init
	.section	.text.string,"ax",%progbits
	.align	1
	.global	string
	.thumb
	.thumb_func
	.type	string, %function
string:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	b	.L16
.L17:
	bl	data
.L16:
	ldrb	r0, [r4], #1	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L17
	pop	{r4, pc}
	.size	string, .-string
	.section	.text.startup.main,"ax",%progbits
	.align	1
	.global	main
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	bl	setup
	bl	lcd_init
	movs	r0, #128
	bl	cmd
	ldr	r0, .L20
	bl	string
	movs	r0, #192
	bl	cmd
	ldr	r0, .L20+4
	bl	string
	movw	r0, #50000
	bl	SysCtlDelay
	ldr	r3, .L20+8
	ldr	r2, [r3, #0]
	bic	r2, r2, #2
	str	r2, [r3, #0]
.L19:
	b	.L19
.L21:
	.align	2
.L20:
	.word	.LC0
	.word	.LC1
	.word	1073894396
	.size	main, .-main
	.comm	ulLoop,4,4
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"Stellaris |====>\000"
.LC1:
	.ascii	"|====> Launchpad\000"
	.ident	"GCC: (Linaro GCC 4.6-2011.10) 4.6.2 20111004 (prerelease)"
