.DATA
	a: .word 5, 2, 3, 2, 1
	r: .word 0, 0, 0, 0, 0

.TEXT

	ldr r0, =a
	ldr r9, =r
	add r9, r9, #16
	
	mov r2, #0
	mov r1, #5
	mov r5, r0
	
START:ldr r8, [r5], #4
	
LOOP:add r2, r2, #1
	 cmp r2, #5
	 beq Reset
	 ldr r7, [r5], #4
	 cmp r7, #-1
	 beq LOOP
	 cmp r8, r7
   movlt r8, r7
	 b   LOOP


Reset:cmp r1, #0
	  beq Exit
	  sub r1, r1, #1
	  mov r2, #0
	  bl  Rep
	  mov r5, r0
	  str r8, [r9]
	  sub r9, r9, #4
	  b   START
	  
 Rep:
 		mov r5, r0
 		mov r3, #5
 		
 	  L:ldr r6, [r5]
 	  	cmp r6, r8
 	  	beq E
 	  	add r5, r5, #4
 	  	sub r3, r3, #1
 	  	bne L
 	  	
 	 E:mov r3, #-1
 	   str r3, [r5]
 	   mov PC, LR
 
	  
Exit:swi 0x11

.END
