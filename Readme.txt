/*Write a C program to find the sum of first n natural numbers.
 The user inputs the value of n. Convert the C program to LEGv8 assembly code. 
Assume the value of n is stored in register X19.
Store the sum in register X20. 
Assume all values are 64-bits. 
printf and scanf function are not required to be converted in to assembly.
Comment your C program and assembly code. (50 Points) */

============================================

#include <stdio.h>


int main()
{
        int sum = 0 ,i, n;

        printf("Enter number integers to be sum\n");
        scanf("%d", &n);

        for(i=1 ; i <= n ; i++)
        {
                sum += i;
        };

        printf("Sum:%d\n", sum);
        return 0;

};
======================================================
 
 N - X19
 SUM - X20
 ALL VALUES ARE 64 BITS
 
	 ADD X19, XZR, #constant //set X19 'n' to what ever
	 ADD X20, X20, XZR // sum = 0
	 ADDI X9, XZR, #1  //i = 1
	
loop:
	 SUB X10, X19, X9  //
	 CBZ X10, EXIT
	 ADD X20, X20, X9  //sum = sum + i
	 ADDI X9,X9,#1		// i = i + 1
	 B loop
EXIT:    

 
 
 //=========================================================================
 
 
 /*  Write a C program to find the largest and smallest of n non-zero positive integers.
The user will input the value of n followed by each of the n values.

 Convert the C program to LEGv8 assembly code. 

Assume the value of n is stored in register X19.

Also assume n values are stored in the memory in a continuous fashion and the
starting address of the n values is stored in register X20.
 
Store the largest number in register X21 and smallest number in register X22. 
Assume all values are 64-bits.

printf and scanf function are not required to be converted in to assembly. 
Comment

your C program and assembly code. (50 Points)*/

#include <stdio.h>

 int main()
 {
 
int i, sum, n;
sum = 0;
scanf()
for()
{
	
	
	
};

 return 0;
  
 };
===========================================
HEX code
0 0000 4 0100 8 1000 c 1100
1 0001 5 0101 9 1001 d 1101
2 0010 6 0110 a 1010 e 1110
3 0011 7 0111 b 1011 f 1111
============================================
LEGv8 Registers
 X0 – X7: procedure arguments/results
• X8: indirect result location register
• X9 – X15: temporaries
• X16 – X17 (IP0 – IP1): may be used by linker as a scratch
register, other times as temporary register
• X18: platform register for platform independent code;
otherwise a temporary register
• X19 – X27: saved
• X28 (SP): stack pointer
• X29 (FP): frame pointer
• X30 (LR): link register (return address)
• XZR (register 31): the constant value 0
 
=========================================================

C code:
f = (g + h) - (i + j);
– f, g, h, i, and j in X19, X20, X21, X22, and X23
• Compiled LEGv8 code:
ADD X9, X20, X21
ADD X10, X22, X23
SUB X19, X9, X10

==================================================

C code:
A[12] = h + A[8];
– h in X21, base address of A in X22
• Compiled LEGv8 code:
– Index 8 requires offset of 64
LDUR X9,[X22,#64] // U for “unscaled”
ADD X9,X21,X9
STUR X9,[X22,#96]
=====================================
Offsets

a[0] = offset 0
a[1] = offset 4
a[2] = offset 8
a[3] = offset 12

ADDI X22, X22, #4 
X22 = X22 + 4
=========================
1.  List at least five LEGv8 instruction formats with an instruction example for each format.

	32 bits registers

	a)R-type register instructions		ADD X9, X10, X11   |32 Opcode 21|20 Rm 16|15 Shamt 10|9 Rn 5|4 Rd 0|
	b)I-type immediate instructions		ADDI X9, X10, #1   |32 Opcode 22|21 ALU_immediate 10|9 Rn 5|4 Rd 0|
	c)D-type data transfer instructions	LDUR X9, [10, #8]  |32 Opcode 21|20 DT_address 12|15 op2 10|9 Rn 5|4 Rt 0|
	d)B-type branch instructions		BL				   |32 Opcode 26|25 BR_address 0|
	e)CB-type conditional instructions	CBNZ X9, Exit	   |32 Opcode 24|21 COND_branch 5|4 Rt 0|
	f)IW-type wide immediate instructions 	MOVK           |32 Opcode 21|20 MOV_immediate 5|4 Rd 0|
=========================

 a->X19 
 b->X20 
 c->X21 
 64 ->X9
 
 //assume #8 X15
 
 

ADD X20, X19, x20    ; b = a + b;
MUL X10 , X19 , X15 ; c[a] = b + 4
ADD X10, X10, X21
ADDI X20, X20, #4
STUR X20 [X10,#0]

//LDUR floating point register load


==========================================
I) ADD X1, X2, X3
This instruction performs addition operation between two registers contents. Where,
X2 and X3 are source registers and X1 is the destination register. After the execution,
X1 = X2 + X3

II) ADDI X1, X2, #20
This instruction performs addition between one register content and an immediate
value. Where, X2 is the source registers, 20 is the immediate value and X1 is the
destination register. After the execution, X1 = X2 + 20

III) SUB X1, X2, X3
This instruction performs subtraction operation between two registers contents.
Where, X2 and X3 are source registers and X1 is the destination register. After the
execution, X1 = X2 - X3

IV) LDUR X1, [X2, #40]
This instruction performs loading of data from memory to register. Where, X2 is the
base address, 40 is the offset and X1 is the destination register. After the execution,
X1 = Memory [X2 + 40]

=============================================
 a X19
 b X20
 c X21

a = a + b;
c[a] = b + 2;
c[b-2] = a;
a = c[b] + b;

ADD X19, X19, X20   //a = a + b;

ADDI X15, XZR, #8	// Storing X15 = 8

					// c[a] = b + 2;
ADDI X9, X20, #2	// X19 = X20 + 2   -> X19 = b + 2
MUL X10, X19, X15	// X10 = X19 * 8   -> X10 = [b+2] * 8
ADD X10, X21, X10	// X10 = X21 + X10 -> X10 = c + [b+2]*8
STUR X9, [X10, #0]	// M[X10+0] = X9   -> 

					//c[b-2] = a;
SUBI X10, X20, #2	
MUL X11, X10, X15
ADD X11, X21, X11
STUR X19, [X11, #0]

					//a = c[b] + b;
MUL X12, X20, X15	
ADD X12, X21, X12
LDUR X13, [X12, #0]
ADD X19, X13, X20

=======================================
Harvard Architecture has seperate data and instruction busses 
allowing transfers to be performed simultaneously on both busses


Von Neumann architecture has only one bus used for both 
data transfers and instruction fetches so they must be scheduled. 


=========================================
Compiling If Statements in LEGv8

if(i == j) f = g + h;
else f = g -h

variables to be stored in extended (64 bit) registers:

f->X19
g->X20
h->X21
i->X22
j->X23

	SUB X9,X22,X23  ; X9 = X22 - X23,stores i - j in temporart register X9
	CBNZ X9, Else   ; Checks if X9 is != 0, if X9 is not equal to 0 jumt tp Else branch 
	ADD X19,X20,X21 ; If X9 is equal to 0, f = g + h
	B Exit		; jump to Branch called exit
  Else: SUB X9, X22, X23
  Exit: ...
================================
Compiling Loop Statements

While(save[i] == k) 
i += 1;

i -> X22, K -> X24, Save -> X25

Loop: LSL X10,X22, #3  	  ;Logical Shift Left i 
      ADD X10, X10, X25   ;
      LUDR X9, [X10, #0]
      SUB X11,X9,X24
      CBNZ X11, Exit
      ADDI X22, X22, #1
      B    Loop
Exit: ....

================================
A very good resource
http://www.cs.columbia.edu/~martha/courses/3827/sp10/slides/8_MIPS_ISA.pdf

