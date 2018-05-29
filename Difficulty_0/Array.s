.data
	 n: .word 10, 20, 30, 40, 50
	 l: .word 5
	 s: .word 0
	 
.text

	 ldr r0, =n
	 ldr r1, =l
	 ldr r1, [r1]
	 ldr r9, =s
	 mov r2, #0
	 
loop:ldr r3, [r0]
	 add r2, r2, r3
	 add r0, r0, #4
	 sub r1, r1, #1
	 cmp r1, #0
	 bne loop
	 
	 str r2, [r9]
	 
	 swi 0x11
.end
