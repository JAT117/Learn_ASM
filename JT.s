
main:

MOV R2, #1	@Register R aka remainder
MOV R3, #0	@Register Q aka quotient
MOV R4, #3	@Register X aka Divisor
MOV R5, #4	@Register Y aka dividend
MOV R6, #0	@Loop Counter

LOOP:
	MOV R2,R5 @Move Y into R
	SUB R2,R2,R4  @R=R-X
	@If R>=0 Then goto one function
	@Else goto a different function

	CMP R2, #0		@ if r0 <= r3
	BGE GreaterThanZero		@ jump to res1 is r0 >= r3
	B LessThanZero


GreaterThanZero:
	MOV R3, R3, LSL #0 @lsl once
	ADD R6, R6, #1
	CMP R6,#33 @if the counter is greater then 33 break
	BGE EXIT
	B LOOP

LessThanZero:
	ADD R2,R2,R4
	MOV R3, R3, LSL #0 @lsl once
	CMP R7, R3
	ADD R6, R6, #1
	CMP R6, #33   @If the counter is greater then 33 break
	BGE EXIT
	B LOOP
    
EXIT:

Dark City
Fire in the Sky
Communion
Under the skin
Ghosts on mars
the man who fell to earth
Battle beyond the stars
Starman
Lifeforce
Galaxy Quest
Liquid Sky
Five million years to earth
Dune
Krull

 






