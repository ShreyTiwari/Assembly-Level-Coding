.DATA
	a: .word 5, 2, 3, 8, 1, 6, 9, 4, 7, 0
	l: .word 10

.TEXT

    	ldr r0, =a
	mov r2, #-1
	ldr r1, =l
	ldr r1, [r1]
	
START:	sub r1, r1, #1
	mov r5, r0

LOOP:	add r2, r2, #1
	cmp r2, r1
	beq Reset
	ldr r8, [r5], #4
	ldr r9, [r5]
	cmp r8, r9
   	blgt swap
	b   LOOP


swap:	sub r5, r5, #4
	str r9, [r5], #4
	str r8, [r5]
	mov PC, LR


Reset:	mov r2, #-1
      	cmp r1, #1
      	beq Exit
      	b   START
	  
	  
Exit:swi 0x11

.END
