//this is prog2.s (attempt)

//Write  an  ARMv8  assembly  program to  find  
//the  sum,  mean,  median,  and  range  of  
//n numbers. I am trying to work backwards from mean, median, and range
//I am trying to creat an array (v[0] to v[n]) but that is what stumps me.
//I also know that when i have the array i need to have the user inputs written into the //addresses and after all that sort them. I just dont have enough time to learn all this

//Required registers
//X19 n
//X20 sum
//X21 mean
//X22 median
//X23 range
//X0 v array
//X15 is constant 50
//X16 i
   
    .data
	.type	v, %object
	.size	v, n           // how do we input 'n' numbers
                           //v array
v:
	.xword	n              // 'n' number of 64-bit values

	.text
	.global	main
	.arch armv8-a+fp+simd
	.type	main, %function

                         //Need to input n here
                         //Set up variables
main:

    MOV X16, XZR		 //i = 0
    MOV X20, XZR		 //sum = 0
    MUL X0, X0, X19		 //v = v[n]
   
   
    SUBS XZR, X16, X20 // if i > n
    B.LE exit

    
    SUBS XZR, X16, X20    // if i > n
    B.LE exit
    ADRP X0, v            // Load the array address to X0
	ADD X0, X0, :lo12:v   // End address

    SUBS XZR, X16, X20 // if i > n
    B.LE exit
    
                                       // sort the array
    LDUR X9,[X10,#0]  // X9 = v[i]     // Load v[i] into X9
    LDUR X11,[X10,#8] // X11 = v[i+1]  //load v[i+1] into X11
    STUR X11,[X10,#0] // v[k] = X11 (v[i+1])  
    STUR X9,[X10,#8]  // v[k+1] = X9 (v[i])
    BR LR             // return to calling routine
    
    ADD X16, XZR  
                       // i = 0

Loop1:                 // this is some code used to fine the min and max of the array
                       // but Im not sure how to use it to get range by finding v[n] - v[i]  

	SUB X9, X19, X16   // Check if n = i
	CBZ X9, Exit       // if zero continue
	STUR X1 [X0, #0]
	ADD X20, X20, X12
    ADDI X21,X21,#1   //increment i

Loop2: 	
	ADD  X20,X20,X21  //sum = sum + i
	SUBS X9,X19,X21   //compare n and i
	B.EQ exit         //if i = n exit
	ADDI X21,X21,#1   //increment i
	B    Loop2         //loop
    
    UDIV X21, X20, X21 //mean = sum / n
    
    SUB X23,          //range = v[last] - v[first]
    UDIV X22, X23, #1 //median - range / 2

exit: