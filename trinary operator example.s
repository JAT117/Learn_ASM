;y = (a>=b) ? (c+d)*a : (b-d)

	cmp Ax Bx
	JGE TRUE
	JMP ELSE

TRUE:
	mov Cx, c ; Cx <- c
	mov Dx, d ; Dx <- d
	add Cx, Dx; Dx <- (c+d)
	mov Ax, a ; Ax <- a
	mul Cx, Ax; Cx <- (c+d)*a
	mov y, Cx ; y <-(c+d)*a

ELSE:
	mov Bx, b ; Bx <- b
	mov Dx, d ; Dx <- d
	sub Bx, Dx; Bx <- (b-d)
	mov y,    ;y= (b-d)