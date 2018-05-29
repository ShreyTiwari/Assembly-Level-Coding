.data
	a: .word 1, -2, -3, 4, 5
	
	n: .word 0,0,0,0,0,0	
	p: .word 0,0,0,0,0,0
 
 .text
 
  	 ldr r0, =a
  	 ldr r8, =n
 	 ldr r9, =p
 	 mov r1, #5
 	
loop:ldr r2, [r0]
 	 cmp r2, #0
 	 bgt pos
 neg:str r2, [r8]
 	 add r8, r8, #4
 	 b   end
 	 
 pos:str r2, [r9]
	 add r9, r9, #4
	 
	 
 end:add r0, r0, #4
 	 sub r1, r1, #1
	 cmp r1, #0
	 bne loop	
	 
	 swi 0x11
 	
 .end
