.text
.global _main

_main:
        LDR   R0, =eoa          @ r0 = &eoa
        LDR   R1, =arr          @ r1 = &arr
        MOV   R3, #0            @ r3 = 0
loop:   LDRB  R2, [R1], #1      @ r2 = *r1++
        ADD   R3, R2, R3        @ r3 += r2
        CMP   R1, R0            @ if (r1 != r2)
        BNE   loop              @    goto loop


stop:   
	MOV R0, #01
        MOV R1, R3
	SWI 0x6b
        SWI 0x11


.data

arr: .byte 10, 20, 30, 40, 50 @read-only array of bytes
eoa: 			@Address of the end of array + 1
