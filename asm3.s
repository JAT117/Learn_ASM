@Program 2
@John Todd
@jat0307

.equ nul, 0			@assembler directive
.text
.global main

main:
	LDR R0,=X
	LDR R0,[R0]		@Load Data for X
	LDR R1,=Y
	LDR R1,[R1]		@Load Data for Y
    MOV R2, #1		@ is X

LOOP: 
    SUB R0, R0, R2	@ r = r-x
    CMP R0, R3		@ if r0 <= r3
    BGE RES1		@ jump to res1 is r0 >= r3
    B RES2			@ jump to res2 if r0  < r3

RES1:
    MOV R1, R1, LSL #0 @lsl once
    MOV R2, R2, LSR #1 @lrl once
    SUB R7, R7, #1
    CMP R7, R3
    BGT LOOP
    B EXIT	

RES2:
    ADD R0, R0, R2
    MOV R0, R0, LSL #0
    MOV R2, R2, LSR #1
    SUB R7, R7, #1
    CMP R7, R3
    BGT LOOP
    B EXIT

EXIT:
	 
    SWI 0x6B  			@ Print integer in register r1 to stdout
    LDR R8,=MessageA
    SWI 0X69
    SWI 0x6B  			@ Print integer in register r1 to stdout
    LDR R8,=MessageB
    SWI 0X69
    SWI 0x6B  			@ Print integer in register r1 to stdout
    LDR R8,=MessageC
    SWI 0X69
    SWI 0x6B  			@ Print integer in register r1 to stdout
    LDR R8,=MessageD
    SWI 0X69
    SWI 0x6B  			@ Print integer in register r1 to stdout
    LDR R8,=MessageE
    SWI 0X69
	MOV r0, #1
	SWI 0x11

.data

X: .word 15	 
Y: .word 6
	
	MessageA: .asciz "DIV "
	MessageB: .asciz " = "
	MessageC: .asciz "(Q = "
	MessageD: .asciz ", R = "
	MessageE: .asciz ")"
.end
