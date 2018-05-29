.data
	 a: .word 5
	 f: .word 0
	
.text

	 ldr r0, =a
	 ldr r1, [r0]
	 cmp r0, #1
	 beq exit
	 mov r2, #1
loop:mul r2, r1, r2
	 sub r1, r1, #1
	 cmp r1, #1
	 bne loop
	 mov r1, r2
exit:str r1, [r0]
	 swi 0x11

.end
