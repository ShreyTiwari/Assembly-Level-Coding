.Data
	n: .word 1,3,4,7,9
	l: .word 5
	a: .word 3
	
	m1: .ASCIZ "Found!"
	m2: .ASCIZ "Not Found :("

.Text

		ldr r1, =a
		ldr r1, [r1]      ;r1 has key
		ldr r2, =n        ;r2 has array
		
		mov r10, #-1
		mov r0, #4
		mov r8, #0    
		ldr r9, =l
		ldr r9, [r9]
		sub r9, r9, #1
		
Loop:	cmp r8, r9
		bgt Exit	
		add r5, r8, r9
		mov r5, r5, LSR #1
		mul r7, r0, r5
		ldr r6, [r2, r7]
		cmp r1, r6
		bgt Up
		blt Low
		beq Print
		
Up:		add r8, r5, #1
		b   Loop

Low:	sub r9, r5, #1
		b   Loop
		
Print:	ldr r0, =m1
		swi 0x02
		swi 0x11
		
Exit:	ldr r0, =m2
		swi 0x02	
		swi 0x11
		
	
.End
