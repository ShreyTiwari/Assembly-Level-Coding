.DATA
	a: .word 1,2
	   .word 3,4
	b: .word 5,6
	   .word 7,8
	s1:.word 0,0
	   .word 0,0
	s2:.word 0,0
	   .word 0,0
	   
.TEXT

	ldr r0, =s1
	ldr r1, =a
	ldr r2, =b
	
	mov r9, #4

LOOP1:	ldr r3,[r1],#4
	ldr r4,[r2],#4
	add r5, r4,r3
	str r5,[r0],#4
	subs r9,r9,#1
	bne LOOP1
	
	ldr r0, =s2
	ldr r1, =a
	ldr r2, =b
	
	mov r9, #4
	 
LOOP2:	ldr r3,[r1],#4
	ldr r4,[r2],#4
	sub r5, r4,r3
	str r5,[r0],#4
	subs r9,r9,#1
	bne LOOP2
	 
swi 0x11 

.END
