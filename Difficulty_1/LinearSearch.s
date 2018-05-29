.Text

	 mov R0, #5
	 ldr R1, =a
	 ldr R2, =b
	 ldr R2, [R2]
	 ldr R8, =m1
	 ldr R9, =m2
Loop:	 ldr R3, [R1], #4
	 cmp R2, R3
	 Beq Found
	 subs R0, R0, #1
	 Bne Loop
	 
NotFound:mov R0,R9
	 swi 0x02
	 swi 0x11
	 
Found:	 mov R0,R8
	 swi 0x02
	 swi 0x11

.Data 

	a: .word 1,3,12,4,20
	b: .word 20

	m1: .ASCIZ "Element Found!"
	m2: .ASCIZ "Element Not Found :("
