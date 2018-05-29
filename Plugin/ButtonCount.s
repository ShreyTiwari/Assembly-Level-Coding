.Data
	.EQU a,0X80
	.EQU b,0X40
	.EQU c,0X20
	.EQU p,0X10
	.EQU d,0X08
	.EQU e,0X04
	.EQU f,0X02
	.EQU g,0X01

	
	n:   .word a|b|c|d|e|g
		 .word b|c
		 .word a|b|f|d|e
		 .word a|b|c|d|f
		 .word b|c|f|g
		 .word a|c|d|f|g
		 .word a|c|d|f|g|e
		 .word a|b|c
		 .word a|b|c|d|e|g|f
		 .word a|b|c|d|g|f
		 .word a|b|c|f|g|e
		 .word a|b|c|d|e|g|f|p
		 .word a|g|e|d
		 .word a|b|c|d|e|g|p
		 .word a|g|e|d|f
		 .word a|g|e|f
		 

	
	no:  .word 10000
	
.Text
	
	Start:
	
	mov r5, #-1
	ldr r1, =n
	ldr r0, [r1]
	swi 0x200
x:	swi 0x202
	cmp r0, #1
	beq Up
	cmp r0, #2
	beq Down
	bl	Delay
	b	x
	
	Up:	   
	add r5, r5, #1
	cmp r5, #15
	beq Start
	ldr r0, [r1, #4]!
	swi 0x200
	mov r0, #-1
	b	x
	
	Down:
	sub r5, r5, #1
	cmp r5, #-1
	ble Start
	ldr r0, [r1, #-4]!
	swi 0x200
	mov r0, #-1
	b   x 
		   
	Delay: 
	ldr r7, =no
	ldr r7,[r7]
	Dloop: subs r7, r7, #1
		   bne	Dloop
	mov Pc, Lr
		   
		   
		   
		   
		 
