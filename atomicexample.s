

//atomic swap test or set the lock value of a register being accessed

again:
	LDXR X9,[X19, #0]   // loads contents
	STXR X22,X10,[X19] // X10 holds the status (free or not free)
	CBNZ X10, again // if free, write to the memory location
	ADD X22, XZR, X9 // X22 = loaded value

//lock

	ADDI X11, XZR, #1 // copy locked value
again:
	LDXR X9, [X19, #0] // read lock
	CBNZ X9, again // check if not zero
	STXR X11, X10, [X19] // attempt to store
	BNEZ X10, again // branch if fails

//unlock

STUR XZR, [X19, #0] // unlock register