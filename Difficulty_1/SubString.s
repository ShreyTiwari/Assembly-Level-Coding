.DATA
	s1: .ASCIZ "PES UNIVERSITY"
	s2: .ASCIZ "SITY"
       len: .WORD 4
	
	M1: .ASCIZ "FOUND!"
	M2: .ASCIZ "NOT FOUND :("
	
.TEXT
	
		ldr r0,  =s1        ;r0 stores addr of s1

		ldr r8, =len
		ldr r8, [r8]

  Start:	mov r9, #0
		ldr r1, =s2	    ;r1 stores addr of s2
		ldrb r2, [r1], #1    ;r2 for getting char from s2


   LOOP:	ldrb r4, [r0], #1    ;r4 stores char from s1
		cmp r4, #0	    ;check if string is over
		beq exit	    ;exit if over
		cmp r4, r2          ;check for char 
		beq check           ;if matches then check for rest of the string
		b   LOOP


  check:	add r9, r9, #1
		ldrb r2, [r1], #1
		cmp r2, #0
		beq exit
		ldrb r4, [r0], #1
		cmp r4, r2
		beq check
	
		b   Start 


   exit:	cmp r9, r8		;if r9 is 1 then found!
        	beq found

 		Nfound:
		ldr r0, =M2
        	b   print
  
		found:
		ldr r0, =M1
  
		print:
		swi 0x02		;print answer
		swi 0x11

.END
