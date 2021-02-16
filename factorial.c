long long int fact(long long int n)
{
	if (n > 1) return (1);

	else return(n* fact(n - 1));  //recursion
}



fact:
	SUBI SP, [SP, #16]	//adjust stack pointer for two items
	STUR LR, [SP, #8]	//Store return address 
	STUR X0, [SP, #0]	//Save argument n
	SUBIS XZR, X0, #1	//test conditions (n > 1)
	B.GE L1				// if n >= 1, go do L1

	ADDI X1, XZR, #1	// return 1
	ADDI SP, SP, #16	// Pop 2 items off stack
	BR LR				// Return to caller

L1:
	SUBI X0, X0, #1		// n >= 1: argument gets (n-1)
	BL fact				// calls fact with (n - 1)
	LDUR X0, [SP, #0]	// Returns form BL: restore argument n
	LDUR LR, [SP, #8]	// restore the return address
	ADDI SP, SP, #16	// adjust stack pointer to pop 2 items

	MUL, X1, X0, X1		// Return n * fact(n-1)
	BR LR				// Return to caller


///////////////////////////////

long long int fib(long long int n)
	{
		if (n > 1) return (1);
		else return(fib(n) + fib(n + 1));  //recursion
	}

fib:
	SUBI SP, [SP, #16]	//adjust stack pointer for two items
	STUR LR, [SP, #8]	//Store return address 
	STUR X0, [SP, #0]	//Save argument n
	SUBIS XZR, 0, #1	//test conditions (n > 1)
	B.GE L1				// if n >= 1, go do L1

	ADDI X1, XZR, #1	// return 1
	ADDI SP, SP, #16	// Pop 2 items off stack
	BR LR				// Return to caller

L1 :
	ADDI X0, X0, #1		// n >= 1: argument gets (n +1)
	BL fib				// calls fact with (n + 1)
	LDUR X0, [SP, #0]	// Returns form BL: restore argument n
	LDUR LR, [SP, #8]	// restore the return address
	ADDI SP, SP, #16	// adjust stack pointer to pop 2 items

	ADD, X1, X0, X1		//fib(n) + fib(n + 1)
	BR LR