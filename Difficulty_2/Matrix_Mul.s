.Data

    ;NOTE: Program prints result in row major manner.

    m: .word 3      ; just for reference
    n: .word 3
    c: .word 3

    m1: .word 1, 2, 3
        .word 1, 2, 3
        .word 1, 2, 3
    
    m2: .word 1, 0, 0
        .word 0, 1, 0
        .word 0, 0, 1
    
    m3: .word 0, 0, 0
        .word 0, 0, 0
        .word 0, 0, 0

.Text

    ;High Level Code

	;for(int i = 0; i < m; ++i)
	;	for(int j = 0; j < c; ++j)
	;	{
	;		sum = 0;
	;		for(int k = 0; k < n; ++k) sum = sum + m1[i][k] * m2[k][j];
	;	    m3[i][j] = sum;
	;	}	

    ;R10 -> sum
    ;R5 -> i
    ;R6 -> j
    ;R7 -> k
    ;R0 -> Matrix 1
    ;R1 -> Matrix 2
    
    ldr r8, =m3    ;R8 -> Res Loc
    ldr r2, =m     ;R2 -> m
    ldr r2, [r2]
    ldr r3, =n     ;R3 -> n
    ldr r3, [r3]
    ldr r4, =c     ;R4 -> c
    ldr r4, [r4]

For1:   cmp R5, R2
        beq exit
        mov r6, #0
        b  For2
   f:   add r5, r5, #1
        b   For1

For2:   cmp r6, r4
        beq f
        mov r10, #0
        mov r7,  #0    
        Bl  For3
        str r10, [r8], #4
        add r6, r6, #1
        b   For2

For3:   cmp r7, r3
        moveq Pc, Lr

        mov r11, #4
        mul r13, r5, r3
        add r13, r13, r7
        mul r13, r11, r13
        ldr r0, =m1
        add r0, r0, r13
        ldr r11, [r0]

        mov r12, #4
        mul r12, r3, r12
        mul r12, r7, r12
        mov r13, #4
        mul r13, r6, r13
        add r13, r12, r13
        ldr r1,  =m2 
        add r1, r1, r13
        ldr r12, [r1]

        mul r9, r11, r12
        add r10, r10, r9
        add r7, r7, #1
        b   For3 

exit: swi 0x11

.End