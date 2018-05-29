.DATA
	a: .ASCIZ "12345"
	z: .ASCIZ "0"
	
.TEXT

	ldr r0, =a
	ldr r1, =z
	ldrb r1,[r1]
	mov r9, #0
	
LOOP:ldrb r2, [r0], #1
	 cmp r2, #0
	 beq exit
	 sub r2, r2, r1
	 add r9, r9, r2
	 b LOOP
	 
exit:swi 0x11

.END
