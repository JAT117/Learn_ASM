	.data
	.type	v1, %object
	.size	v1, 9     		//v1 array
	.type	v2, %object
    .size	v2, 9     		//v2 array
v1:
	.xword 7, 1, 8, 9, 5, 6, 1, 1, 1
v2:
	.xword 0, 0, 0, 0, 0, 0, 0, 0, 0

	.text
	.global	main
	.arch armv8-a+fp+simd
	.type	main, %function

main:
	ADRP X0, v1           	// Load the v1 array address to X0
	ADD X0, X0, :lo12:v1 	// End address
	ADRP X1, v2            	// Load the v2 array address to X1
	ADD X1, X1, :lo12:v2   	// End address
	MOV X19, XZR		 	// Setting value of sum for determinant.
	MOV X20, XZR			// Setting value of sum for determinant.


// this code part perform the transpose matrix from array v1 to array v2:
	MOV X9, XZR 			// setting i=0 to loop on rows
	MOV X11, XZR
	ADD X11, X11, #3		// Storing 3 in X11 (for 3 rows and coloumns)
    
ROW:
	CMP X9, X11				// comparing i and X11
	B.GE end				// if 3 rows are completed than exit from function
	MOV X10, XZR			//Setting j=0 to loop on columns
    
COLOUMN:
	CMP X10, X11			// comparing i and X11
	B.GE EndRow				// if 3 coloumns are completed than branch EndRow
	MUL X12, X9, X11 		// X12 = i * 3 (size of row)
	ADD X12, X12, X10 		// X12 = i * size(row) + j
	LSL X12, X12, #3 		// X12 = byte offset of [i][j]
	ADD X12, X0, X12 		// X12 = byte address of a[i][j]
	LDUR X21, [X12,#0]		// load a[i][j] to X21 register
	MUL X12, X10, X11 		// X12 = j * 3 (size of row)
	ADD X12, X12, X9 		// X12 = j * size(row) + i
	LSL X12, X12, #3 		// X12 = byte offset of [j][i]
	ADD X12, X1, X12 		// X12 = byte address of a[j][i]
	STUR X21, [X12,#0] 		// Swaping: store a[i][j] in b[j][i]
	ADD X10, X10, #1		// increase j for next loop
	B COLOUMN				// branch back to COLOUMN for remaning coloumn elemnts
    
EndRow:
	ADD X9, X9, #1			// increase i for next loop
	B ROW					// branch back to ROW for remaning row elemnts
end:


// this code part is to calculate determinent of given matrix:
	MOV X2,X0				//Storing array v1 starting address in temp X2
	BL DETER				// calling determinent function for input matrix
	MOV X19, X3				// storing result to X19 from tempory register X3


// this code part is to calculate determinent of transpose matrix:

	MOV X2, X1				//Storing array v2 starting address in temp X2
	BL DETER				// calling determinent function	for transpose matrix
	MOV X20, X3				// storing result to X20 from tempory register X3

	B EXIT					// branching to exit


//this code part is determinant function to calculate the determinant:
DETER:
	LDUR X10, [X2, #0]		// next 9 lines is to
	LDUR X11, [X2, #8]		// load all the matrix
	LDUR X12, [X2, #16]		// elments to 9 temporary
	LDUR X13, [X2, #24]		// registers from X10 to X18
	LDUR X14, [X2, #32]
	LDUR X15, [X2, #40]
	LDUR X16, [X2, #48]
	LDUR X17, [X2, #56]
	LDUR X18, [X2, #64]

	MUL X5, X14, X18		// Calculating first chunk and store in X5
	MUL X6, X15, X17
	SUB X5, X5, X6
	MUL X5, X10, X5

	MUL X6, X13, X18		// Calculating second chunk and store in X6
	MUL X7, X15, X16
	SUB X6, X6, X7
	MUL X6, X11, X6

	MUL X7, X13, X17		// Calculating third chunk and store in X7
	MUL X8, X14, X16
	SUB X7, X7, X8
	MUL X7, X12, X7

	SUB X5, X5, X6			// subtracting X5 and X6
	ADD X3, X5, X7			// adding X5 and X7
	BR X30					// return to caller

EXIT:
