long long int leaf_example(long long int g,long long int h,long long int i,long long int k)
{

long long int f;
	f = (g+h) - (i+j)
	return f;
}

X0 g
X1 h
X2 i
X3 j

X9 and X10 are temp registers
X31 is the stack pointer (SP), which we will push

SUBI SP, SP, #24	// since a byte is 8 bits, 3 doublewords are 24 bits long
STUR X10, [SP, #16]	// store X10 for later use
STUR X9, [SP, #8]	// store staCk pointer for later use
STUR X19, [SP, #0]  // 

ADD X9, X0, X1
ADD X10, X2, X3
SUB X19, X9, X10

ADD X0, X19, XZR

LDUR X19, [SP, #0] //Restore Registers
LDUR X9, [SP, #8] 
LDUR X10, [SP, #16]
ADDI SP, SP, #24 // Adjust Stack to release regiter

BR LR // Break