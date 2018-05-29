.data
	a: .word 1, 2, 3, 4, 5
	
	e: .word 0,0,0,0,0,0	
	o: .word 0,0,0,0,0,0
 
 .text
 
  	 ldr r0, =a
  	 ldr r8, =e
 	 ldr r9, =o
 	 mov r1, #5
 	
loop:ldr r2, [r0]
 	 and r3, r2, #1
 	 cmp r3, #0
 	 beq even
 odd:str r2, [r9]
 	 add r9, r9, #4
 	 b   end
 	 
even:str r2, [r8]
	 add r8, r8, #4
	 
	 
 end:add r0, r0, #4
 	 sub r1, r1, #1
	 cmp r1, #0
	 bne loop	
	 
	 swi 0x11
 	
 .end
