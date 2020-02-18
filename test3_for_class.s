.equ SWI_Open, 0x66         @open a file 
.equ SWI_Close,0x68         @close a file
.equ SWI_PrStr, 0x69        @ Write a null-ending string 
.equ SWI_PrInt,0x6b         @ Write an Integer 
.equ SWI_RdInt,0x6c         @ Read an Integer from a file 
.equ Stdout, 1				@ Set output target to be Stdout 
.equ SWI_Exit, 0x11         @ Stop execution 

.global _start 

.text

_start:

	LDR r0,=InFileName      @ get Name for input file
	MOV r1, #0              @ mode is input 
	SWI SWI_Open            @ open file for input 
	BCS InputFileError         @ Check Carry-Bit (C): if= 1 then ERROR
	@ Save the file handle in memory: 
	LDR r1,=InFileHandle         @ if OK, load input file handle 
	STR r0,[r1]                 @ save the file handle

        MOV r2, #0
        
	RLoop: 
		LDR r0,=InFileHandle     @ load input file handle 
		LDR r0,[r0] 
		SWI SWI_RdInt           @ read the integer into R0 
		BCS EofReached          @ Check Carry-Bit (C): if= 1 then EOF reached 
		
		@ print the integer to Stdout 
		MOV r1,r0               @ R1 = integer to print 
		MOV R0,#Stdout          @ target is Stdout 
		SWI SWI_PrInt 
        ADD r2, r2, r1
		LDR r1, =NL 
		SWI SWI_PrStr 
		B RLoop           @ keep reading till end of file



InputFileError:
        MOV R0, #Stdout
        LDR R1, = FileOpenInpErrMsg
        SWI SWI_PrStr
        B exit      

EofReached: 
	MOV R0, #Stdout         @ print last message 
	LDR R1, =EndOfFileMsg 
	SWI SWI_PrStr
        
        LDR r4, =sum
        STR r2, [r4] 
        
        LDR R1, =sum_message
        SWI SWI_PrStr 
        MOV R1, R2
        SWI SWI_PrInt
        
@ == Close a file ===============================================

	LDR R0, =InFileHandle   @ get address of file handle 
	LDR R0, [R0]            @ get value at address 
	SWI SWI_Close
	exit:  swi SWI_Exit




.data

Message1: .asciz "Read From File\n"
InFileName: .asciz "series.dat"
FileOpenInpErrMsg: .asciz "Failed to open input file\n"
EndOfFileMsg: .asciz "End of File Reached\n"
ColonSpace: .asciz " : "
NL: .asciz "\n"
sum_message: .ascii "The Summation of the Given Input is: "
sum: .word 0

.align
InFileHandle:       .skip       4 
