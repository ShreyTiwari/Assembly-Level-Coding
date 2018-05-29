.DATA
	a: .word 1234
	l: .word 4
		
.TEXT

	ldr r1,=a
	ldr r2,[r1]
	mov r9,#0
	mov r5,#0
	ldr r4, =l
	ldr r4,[r4]

loop2:	add r9,r9,r5
	sub r4,r4,#1
	cmp r4,#0
	beq exit
loop1:	sub r2,r2,#10
	add r3,r3,#1
	cmp r2,#10
	bgt loop1
	blt loop
		
loop:	mov r5, r2		
	mov r2,r3
	mov r3,#0
	b   loop2
		
exit:	add r9, r9, r2	
	swi 0x11

.END
