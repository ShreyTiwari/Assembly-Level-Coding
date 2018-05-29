.Data
	.EQU a,0X80
	.EQU b,0X40
	.EQU c,0X20
	.EQU p,0X10
	.EQU d,0X08
	.EQU e,0X04
	.EQU f,0X02
	.EQU g,0X01

	
   n:    .word a|b|c|d|e|g
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
	
	Start: mov r5, #-1
	       ldr r1, =n
	
	Loop1:
	ldr r0, [r1], #4
	swi 0x200
	bl  Delay
	add r5, r5, #1
	cmp r5, #15
      subeq r1, r1, #4
	beq Loop2
	b   Loop1
	
	Loop2:
	ldr r0, [r1, #-4]!
	swi 0x200
	bl  Delay
	sub r5, r5, #1
	cmp r5, #1
	beq Start
	b   Loop2
	
	
	Delay: 
	ldr r7, =no
	ldr r7,[r7]
	Dloop: subs r7, r7, #1
	       bne  Dloop
	mov Pc, Lr
	
.End
	
	
	
	
	
	
	
	 
