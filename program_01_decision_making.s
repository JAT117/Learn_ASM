.text

.global _main

_main:
        @ load A, B, C at register R2, R3, and R4
	LDR R2, = A
	LDR R2, [R2]
 
    LDR R3, = B
	LDR R3, [R3]

	LDR R4, = C
	LDR R4, [R4]


	SUBS R5, R2, R3  @ R5 = A-B
	BGE label_AC     @ if A>= B goto label_AC 
	
	SUBS R5, R3, R4  @ else B > A => find (B -C)
	BGE label_B 	 @ if B > C goto label_B 
	
	label_C:
		LDR R1, =message_C @ C is the largest
		B Exit
 	label_B:	
		LDR R1, =message_B
		B Exit
	label_AC:
		SUBS R5, R4, R2  @ C - A
		BGE label_C  @ if  C >= A
		LDR R1, = message_A @A is largest
	  Exit:	
		MOV R0, #1
		SWI 0x69
		SWI 0x11	
.data

A: .word 50
B: .word -120
C: .word 200

message_A: .asciz "A > B and A > C "
message_B: .asciz "B > C and B > A"
message_C: .asciz "C > A and C > B"


.end
