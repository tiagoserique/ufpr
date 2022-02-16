.section .data
	A:	.quad 0
	B:	.quad 0
	C:	.quad 0

.section .text

.global _start
_start:
	movq $10, A
	movq $1, B
	movq $0, C
	movq A, %rdi
	movq B, %rbx
	movq C, %rcx
do:	
	addq %rbx, %rdi
	addq $1, %rcx
	cmpq $10, %rcx
	jl do
	movq $60, %rax
	syscall
