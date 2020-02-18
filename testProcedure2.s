main:

         MOV R2, #1   @g = 1
         MOV R3, #22   @h = 22
         
         BL leaf_example @ branch at label ....


         MOV R0, #01    @special instruction: stdout code = 1
         SWI 0x6B       @software interrupt SWI, print data from R1
         SWI 0x11       @software interrupt SWI: halt/exit


leaf_example:
          SUBS R4, R2, R3
		  BLE less_or_equal 
          MOV R1, R2
          B exit
less_or_equal:  MOV R1, R3        @ move result to R1
exit:	  BX LR             @ go back to the caller
	
