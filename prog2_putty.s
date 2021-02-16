	.file	"prog2.c"
	.section	.rodata
	.align 4
.LC0:
	.string	"Enter the number of inputs 'n' "
.LC1:
	.string	"%d"
	.align 4
.LC2:
	.string	"Enter the elements one by one "
.LC3:
	.string	"%llu"
.LC4:
	.string	"Sorted array is..."
.LC5:
	.string	"%llu\n"
	.globl	__udivdi3
.LC6:
	.string	"Sum:%llu\n"
.LC7:
	.string	"Mean:%llu\n"
.LC8:
	.string	"Median:%d\n"
.LC9:
	.string	"Range:%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	andl	$-16, %esp
	subl	$464, %esp
	movl	$0, 424(%esp)
	movl	$0, 428(%esp)
	movl	$.LC0, (%esp)
	.cfi_offset 3, -12
	call	puts
	movl	$.LC1, %eax
	leal	440(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__isoc99_scanf
	movl	$.LC2, (%esp)
	call	puts
	movl	$0, 444(%esp)
	jmp	.L2
.L3:
	movl	444(%esp), %eax
	leal	0(,%eax,8), %edx
	leal	24(%esp), %eax
	addl	%eax, %edx
	movl	$.LC3, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__isoc99_scanf
	addl	$1, 444(%esp)
.L2:
	movl	440(%esp), %eax
	cmpl	%eax, 444(%esp)
	jl	.L3
	movl	$0, 444(%esp)
	jmp	.L4
.L9:
	movl	$0, 448(%esp)
	jmp	.L5
.L8:
	movl	448(%esp), %eax
	movl	24(%esp,%eax,8), %ecx
	movl	28(%esp,%eax,8), %ebx
	movl	448(%esp), %eax
	addl	$1, %eax
	movl	28(%esp,%eax,8), %edx
	movl	24(%esp,%eax,8), %eax
	cmpl	%edx, %ebx
	jb	.L6
	cmpl	%edx, %ebx
	ja	.L12
	cmpl	%eax, %ecx
	jbe	.L6
.L12:
	movl	448(%esp), %eax
	movl	28(%esp,%eax,8), %edx
	movl	24(%esp,%eax,8), %eax
	movl	%eax, 460(%esp)
	movl	448(%esp), %eax
	addl	$1, %eax
	movl	28(%esp,%eax,8), %edx
	movl	24(%esp,%eax,8), %eax
	movl	448(%esp), %ecx
	movl	%eax, 24(%esp,%ecx,8)
	movl	%edx, 28(%esp,%ecx,8)
	movl	448(%esp), %eax
	leal	1(%eax), %ecx
	movl	460(%esp), %eax
	movl	%eax, %edx
	sarl	$31, %edx
	movl	%eax, 24(%esp,%ecx,8)
	movl	%edx, 28(%esp,%ecx,8)
.L6:
	addl	$1, 448(%esp)
.L5:
	movl	440(%esp), %eax
	subl	444(%esp), %eax
	subl	$1, %eax
	cmpl	448(%esp), %eax
	jg	.L8
	addl	$1, 444(%esp)
.L4:
	movl	440(%esp), %eax
	cmpl	%eax, 444(%esp)
	jl	.L9
	movl	$.LC4, (%esp)
	call	puts
	movl	$0, 444(%esp)
	jmp	.L10
.L11:
	movl	444(%esp), %eax
	movl	28(%esp,%eax,8), %edx
	movl	24(%esp,%eax,8), %eax
	movl	$.LC5, %ecx
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, (%esp)
	call	printf
	movl	444(%esp), %eax
	movl	28(%esp,%eax,8), %edx
	movl	24(%esp,%eax,8), %eax
	addl	%eax, 424(%esp)
	adcl	%edx, 428(%esp)
	movl	440(%esp), %eax
	movl	%eax, %edx
	sarl	$31, %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	424(%esp), %eax
	movl	428(%esp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	__udivdi3
	movl	%eax, 432(%esp)
	movl	%edx, 436(%esp)
	movl	444(%esp), %eax
	movl	28(%esp,%eax,8), %edx
	movl	24(%esp,%eax,8), %eax
	movl	%eax, %ecx
	movl	24(%esp), %eax
	movl	28(%esp), %edx
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 452(%esp)
	movl	452(%esp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 456(%esp)
	addl	$1, 444(%esp)
.L10:
	movl	440(%esp), %eax
	cmpl	%eax, 444(%esp)
	jl	.L11
	movl	$.LC6, %ecx
	movl	424(%esp), %eax
	movl	428(%esp), %edx
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, (%esp)
	call	printf
	movl	$.LC7, %ecx
	movl	432(%esp), %eax
	movl	436(%esp), %edx
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%ecx, (%esp)
	call	printf
	movl	$.LC8, %eax
	movl	456(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	$.LC9, %eax
	movl	452(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.4-1ubuntu1~12.04) 4.6.4"
	.section	.note.GNU-stack,"",@progbits
