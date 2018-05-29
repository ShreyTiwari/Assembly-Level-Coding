.data
	 a: .word 20
	 r: .word 0

.text

	 ldr r0, =a
	 ldr r1, [r0]
	 ldr r9, =r
	 and r1, r1, #1
	 cmp r1, #0
	 beq even
	 mov r2, #0
	 b   exit
	 
even:mov r2, #1

exit:str r2, [r9]
	 swi 0x11

.end
