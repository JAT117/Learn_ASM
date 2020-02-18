    .data
	.type	v, %object
	.size	v, 3
                           //v array
v:
	.xword	1, 2, 3        // 64-bit values


	.text
	.global	main
	.arch armv8-a+fp+simd
	.type	main, %function

main:
	ADRP X0, v            // Load the array address to X0
	ADD X0, X0, :lo12:v   // End address
	LDUR X1, [X0, #0]     // Load the first value
	LDUR X2, [X0, #8]     // Load the second value
	ADD X1, X1, X2        // ADD first and second value
	LDUR X2, [X0, #16]    // Load the third value
	ADD X1, X1, X2        // Find the final sum
                   
