.text

.equ   nul, 0

start:  LDR   R0, =str          @ r0 = &str
        MOV   R1, #0            @ r1 = strlen 
 
loop:   LDRB  R2, [R0], #1      @ r2 = *(r0++)
        ADD   R1, R1, #1        @ r1 += 1
        CMP   R2, #nul          @ if (r1 != nul)
        BNE   loop              @    goto loop

        SUB   r1, r1, #1        @ r1 -= 1

stop:   

	SWI 0x6B
	SWI 0x11

.data

str:    .asciz "Hello World"
