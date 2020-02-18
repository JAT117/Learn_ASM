;x=(a-b)^3 + (a+b)

assembly code:
	mov Ax, A ; Ax <- a
	mov Bx, B ; Bx <- b
	sub Ax, Bx; Ax <- (a-b)
	mul Ax, Ax; Ax <- (a-b)*(a-b)
	mov Dx, Ax; Dx <- Ax
	mul Dx, Ax; Dx <- (a-b)^3
	mov Ax, A ; Ax <- a
	mov Bx, B ; Bx <- b	
	add Ax, Bx; Ax <- (a+b)
	add Dx, Ax; Dx <- (a-b)^3 + (a+b)
	move x, Dx; x=(a-b)^3 + (a+b)
	
	