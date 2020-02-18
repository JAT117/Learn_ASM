

	.data
	A: .word 5					 		 @ data section sets in values for A, B, C
	B: .word 6
	C: .word 7
	message_A: .asciz"A > B and A > C"	@ and message strings for conditionals
	message_B: .asciz"B > C and B > A"
	message_C: .asciz"C > A and C > B"

	.global main
	@.arch armv8-a+fp+simd		@Using the ARMv8 instruction set
	.type main, %function

main:
	LDR R3,=A
	LDR R3,[R3]					@Load Data for A

	LDR R4,=B
	LDR R4,[R4]					@Load Data for B

	LDR R5,=C
	LDR R5,[R5]					@Load Data for C

	CMP R3, R4       			@is A > B ?
	BLE IF1        				@if not true jump to IF1

	CMP R3, R5   				@is A > C ?
	BLE IF1        				@if not true jump to IF1

	MOV R0, #Stdout 			@print message_A if passed both conditions
	LDR R1, =message_A
	SWI SWI_PrStr
	BL end

IF1:
	CMP R4, R3    				@is B > A ?
	BLE IF2		   				@Break if not true

	CMP R4,R5   				@is B > C ?
	BLE IF2    					@Break if not true

	MOV R0, #Stdout
	LDR R1, =message_b
	SWI SWI_PrStr
	BL end

IF2:
	MOV R0, #Stdout
	LDR R1, =message_C			@Prints message_C because other two conditional are not true
	SWI SWI_PrStr
	BL end

end:							@ends the program