.DATA
	a: .ASCIZ "PUEUSU"
	b: .ASCIZ "U"
	
.TEXT
	
	ldr r0, =a
	ldr r1, =b
	ldrb r1, [r1]
	mov r9, #0
	
LOOP:	ldrb r2,[r0],#1
	cmp r2, #0
	beq exit
	cmp r2, r1
	beq Incr
	b   LOOP
	 
Incr:	add r9, r9, #1
     	b   LOOP

exit:	swi 0x11 	
	
.END
