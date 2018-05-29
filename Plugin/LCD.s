.Data
	text: .ASCIZ "Hello"
	n:    .word  1000
	
.Text
	
	ldr r2, =text
	mov r0, #0
	mov r1, #2
	
Loop: swi 0x206
	  swi 0x204
	  bl  Delay
	  add r0, r0, #1
	  cmp r0, #30
	  bne Loop
	  
Loop1: swi 0x206
	  swi 0x204
	  bl  Delay
	  sub r0, r0, #1
	  cmp r0, #0
	  bne Loop1
	  b   Loop


Delay:
ldr r5, =n
ldr r5, [r5]
dloop: subs r5, r5, #1
	   bne dloop
mov Pc, Lr
