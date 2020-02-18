.text
.global _main

main:
	@ load in a,b,c
	LDR r3, =a
	LDR r3,[r3] 
	LDR r4, =b
	LDR r4, [r4]
	LDR r5, =c
	LDR r5, [r5]
	 
	CMP r3, r4 @compare a and b
	BGE  a_greater_b
	BLT  b_greater_a
	B error
	
	a_greater_b:  
	CMP r3,r5  @compare a and c
	BGE a_greater_all
	BLT c_greater_all
	B error
	
	b_greater_a:
	CMP r4, r5  @compare c and b
	BGE b_greater_all
	BLT c_greater_all
	B error
	
	a_greater_all: 
	LDR r1, =MessageA @load MessageA
	B EXIT 
	
	b_greater_all: @ load MessageB
	LDR r1, =MessageB
	B EXIT 
	
	c_greater_all: @load MessageC
	LDR r1, =MessageC
	B EXIT 
	
	error:
	LDR r1, =MessageError @ load MessageError
	B EXIT 
	
	EXIT:
	@ print out result 
	MOV r0, #1
	SWI 0x69
	SWI 0x11

.data
	MessageA: .asciz "message_A: A > B and A > C"
	MessageB: .asciz "message_B: B > C and B > A"
	MessageC: .asciz "message_C: C > B and C > A"
	MessageError: .asciz "error"
	a:		  .word 12
	b: 		  .word 13
	c:		  .word 115

	
