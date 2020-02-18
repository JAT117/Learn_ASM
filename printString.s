main:
	MOV R0, #1
	LDR R1, =message
	SWI 0x69
	SWI 0x11

message: .asciz "Hello There!\n"
