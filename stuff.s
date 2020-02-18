.global _main

_main:

MOV R0, #12@ is the dividend
MOV R1, #0@ is the quotient
MOV R2, #5@ is the divisor

MOV R3, #0@ check if r0 is r3


MOV R7, #5 @number of loops  

LOOP: 

SUB R0, R0, R2@ r = r-x

CMP R0, R3@ if r0 greater than or equal to r3
BGE RES1@ jump to res1 is r0 >= r3
b RES2@ jump to res2 if r0  < r3

RES1:@ if r >= 0

MOV R1, R1, LSL #1@shift r1, 

MOV R2, R2, LSR #1@shift r2 right


SUB R7, R7, #1@ subtract 1 from loop
CMP R7, R3@ compare if r7 >= r3
BGT LOOP@ jump if value meet
b EXIT

RES2:

ADD R0, R0, R2@ r = r + x
MOV R1, R1, LSL #1@shift r0 left


MOV R2, R2, LSR #1@ shift r2 right


SUB R7, R7, #1@subtract 1 from loop
CMP R7, R3@ compare if r7 >= r3
BGT LOOP@ jump if value meet

b EXIT

EXIT:
