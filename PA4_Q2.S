	.text
	.global main
	.arch armv8-a+fp+simd
	.type main, %function

main:

	BL force		//caling force function
	BL kinetic		//caling kinetic function
	B  Exit

force:				// s registers for IEEE single point
	FMUL S3, S0, S2		// Force = mass * accel
	BR X30			// return to caller

kinetic:
	FMOV  S4, #0.5		// Move 0.5 to S4 register
	FMUL  S9, S1, S1	// Finding V^2
	FMUL  S9, S9, S0	// Calculating v^2 * mass
	FMUL  S4, S4, S9	// Finding final result by multiplying 0.5
	BR X30			// return to caller

Exit:				// exit
