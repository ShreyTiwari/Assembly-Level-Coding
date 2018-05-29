.data
	a: .byte 8
	b: .byte 5
	
.text

	ldr r0, =a
	ldr r1, =b
	ldrb r0, [r0]
	ldrb r1, [r1]
	add r2, r0, r1
	swi 0x11

.end
