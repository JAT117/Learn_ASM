main:

         MOV R0, #11   @g = 11
         MOV R1, #22   @h = 22
         MOV R2, #05   @i = 5
         MOV R3, #04   @j = 4
         
         BL leaf_example @ branch at label ....


         MOV R0, #01    @special instruction: stdout code = 1
         SWI 0x6B       @software interrupt SWI, print data from R1
         SWI 0x11       @software interrupt SWI: halt/exit


leaf_example:
	  ADD R9,R0,R1      @temp1 = g + h
	  ADD R10,R2,R3     @temp2 = i + j
	  SUB R11,R9,R10    @f = temp1 - temp2
	  MOV R1, R11       @ move result to R1
	  BX LR             @ go back to the caller
===================================================================================	
	Total Point: 100

Problem:

	Write an assembly program that implements a function 'who_is_the_biggest'. Read three integer values (A,B, C) 
       from memory/file in your main_function (global), pass them as parameterss, and 
       print one out of the following three messages to your screen:
		message_A: A > B and A > C
                message_B: B > C and B > A
                message_C: C > A and C > B    

Submission:

1. source code =>
	 a. name: program_01_UNTID.s
         b. each line should have comments describing the corresponding action
2. readme file =>
	a. mention which Simulator you have used while testing the code.
        b. add three sample output by using different values for the input parameters