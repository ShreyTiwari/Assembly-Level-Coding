.data 
	text:   .asciz "PES UNIVERSITY"
	search: .asciz "shrey"
	a:      .asciz "Found!"
	b:      .asciz "Not Found!"


.text
ldr r0, =search
ldr r1, =text
ldrb r3,[r0],#1
mov r7,#0
loop1:
	ldrb r2,[r1],#1
	mov r11,r1
	cmp r3,r2
	beq loop2
	cmp r2,#0
	bne loop1
	b loop5

loop2:
	ldrb r2,[r11],#1
	ldrb r3,[r0],#1
	cmp r3 ,#0
	beq loop3
	cmp r3,r2
	beq loop2
	bne loop4

loop3:
	add r7,r7,#1

loop4:
	ldr r0,=search
	ldrb r3,[r0],#1
	b loop1

loop6:
	ldr r0,=a
	swi 0x02
	swi 0x11
	
loop7:
	ldr r0,=b
	swi 0x02
	swi 0x11

loop5:
	cmp R7,#0
	beq loop7
	bne loop6
	swi 0x11
.end 
