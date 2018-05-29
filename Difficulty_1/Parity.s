.DATA
	a: .word 1
	
	m1: .ASCIZ "EVEN"
	m2: .ASCIZ "ODD"

.TEXT
	
	ldr r0, =a
	ldr r0,[r0]
	mov r9, #0
	
	mov r1, #31

LOOP:	ANDs r8, r0,#1
	bne Incr 
   L:	mov r0, r0, LSR #1
	subs r1, r1, #1
	bne LOOP
	b   exit	
	
Incr:	add r9,r9,#1
	b   L

exit:	ANDs r8,r9, #1
	bne l
	ldr r0, =m1
	b p
   l:	ldr r0, =m2
   p:	swi 0x02
   	swi 0x11 
.END
