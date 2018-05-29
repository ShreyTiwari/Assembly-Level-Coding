.data
	 a: .word 10
	 b: .word 20
	 s: .word 0
	 
.text

	 ldr r0, =a
	 ldr r1, =b
	 ldr r2, =s
	 
	 ldr r3, [r0]
	 ldr r4, [r1]
	 add r3, r3, r4
	 
	 str r3, [r2]
	 
	 swi 0x11

.end
