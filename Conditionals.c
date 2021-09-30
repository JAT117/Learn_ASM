//Some C code:

while(save[i] == k)  //(if false then exit)
	i+=1;			 // if true increment i by 1 and loop

// Assign registers for variales
//X22 i
//X24 k
//X25 Save

//LSL #3 => 2^3 = 8  logical shift left 3 spaces

loop:
	LSL X10, X22, #3	// temp register X10 = X22 * #8  (i*8)
	ADD X10, X10, X25   // X10 = X10 + address of save[i]
	LDUR X9, [X10, #0]  // X9 = save[i]
	SUB X11, X9, X24    // X11 = save[i] - 1
	CBNZ X11, Exit      // Exit if save[i] != k
	ADDI X22, X22, #1   // i+=1
	B loop				//branches to loop (recursive branch)

Exit: ...

////////////////////////////////////////////////////////////////////////////////////////////
C code :
	if (i == j) 
		f = g + h;
	else f = g- h;

	//X19 f
	//X20 g
	//X21 h
	//X22 i
	//X23 j

SUB X9, X22, X23
CBNZ X9, Else
ADD X19, X20, X21
B Exit

Else:
	SUB X9, X22, X23

Exit:

////////////////////////////////////////////////////////////////////////////////////////////
	//X19 a
	//X20 b
	//X21 c B.A

	b = a + b
		c[a] = b + 4

	ADD X20, X19, X20   //b = a + b     	ADD X20, X19, X20   //b = a + b
	ADD X9, X20, #4		//X9 = b + 4		ADDI X9, X20, #4   //X9 = b + 4
	LSL X10, X19, X3	//X10 = a*8 		ADDI X11, XZR, #8  //X11 = 0 + 8
	ADD X10, X21, X10	//X10 = c + a*8		MUL X10, X19, X11  //X10 = a * 8
	STUR X9, [X10, #0]	//C					ADD X10, X21, X10  // 
	STUR X9, [X10, #0]  //

////////////////////////////////////////////////////////////////////////////////////////////

Jump uses word address
• Update PC	with concatenation of
• Top 4	bits of	old	PC
• 26 - bit jump address
• 00
• Need	an	extra	control	signal	decoded	from	opcode