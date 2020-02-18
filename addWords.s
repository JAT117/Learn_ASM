@File: addWords.s
	.global _start

_start:
	LDR R2, =num1
	LDR R2, [R2] 
        LDR R3, =num2
	LDR R3, [R3]
	ADD R4, R2, R3
        LDR R5, =sumRes
        STR R4, [R5]
        
        LDR R1, =sumRes
        LDR R1, [R1]
    MOV R0, #1
    SWI 0x6B
    SWI 0x11

.data
num1: .word 537
num2: .word -273
sumRes: .word 0

.end
        
