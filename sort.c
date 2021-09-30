void sort(long long int v[], size_t int n)
{

	size_t, j;
	for (i = 0; i < n; i++)

	{
		for (j = i - 1; j >= 0 and v[j] >= v[j + i]; j++)
		{
			swap(v, j);
		}
	}

}

//X0 v
//X9-13 are temps
//X1 n
//X19 i
//X20 j

//there are two nested for loops for a sort

//MOV is a pseudoinstruction 
	
	MOV X19, XZR // i=0
for1tst:
	CMP X19, X1			// compare X19 ≥ X1 (i to n)  
	B.GE exit1			// go to exit1 if X19 ≥ X1 (i ≥ n)

	// body of inner for-loop here
	SUBI X20, X19, #1
		
for2tst:
	CMP X20, XZR			// compare X20 < 0 (j < 0)?
	B.LT exit2			// go to exit2 if X20 < 0 (j < 0)
	LSL X10, X20, #3		//reg X10 = j*8
	ADD X11, X0, X10	    //reg X11 = v[j+1]

	LDUR X12, [X11, #0]  // reg X12 = v[j]
	LDUR X13, [X11, #8]  // reg X13 = v[j+1]
	CMP X12, X13		    // compare X12 to X13
	B.LE exit2
	MOV X0, X21			// first swap parameter is v
	MOV X1, X20			// second swap parameter is j
	BL swap				// call swap
	SUBI X20, X20, #1	// j-=1
	B for2tst
	
exit2:
	ADDI X19, X19, #1		// i+=1
	B for1tst 
	
exit1:



