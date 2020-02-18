	.text
	.global	main		// header for main function
	.arch armv8-a+fp+simd
	.type	main, %function



main:
	BL summation		// Calling summation function
	ADD X21, X21, #1	// Add 1 to result to account for x^0
	B exit
	
	.global series 		// header for summation function
	.arch armv8-a+fp+simd
	.type summation, %function

summation:
	SUB SP, SP, #16		// Sub SP with 16 to push two registers contents
	STUR X30, [SP, #8]	// Push return address onto stack (LR is in X30)
	STUR X20, [SP, #0]	// Push a onto stack (a is in X20)
	SUBS XZR, X20, #0	// Compare a and 0
	B.GT L1
	MOV X21, #0			// If a == 0, return 0
	ADD SP, SP, #16		// Add SP with 16 to pop two registers contents
	BR X30				// Return
L1:
	SUB X20, X20, #1	// a - 1
	BL summation		// Calling summation function agian
	LDUR X20, [SP, #0]	// Pop value of a
	LDUR X30, [SP, #8]	// Pop return address
	ADD SP, SP, #16		// Add SP with 16 to pop two registers contents
	MUL X21, X19, X21	// x * summation(x, a - 1)
	ADD X21, X19, X21	// x + x * summation(x, a - 1)
	BR X30			// Return to caller
exit:

