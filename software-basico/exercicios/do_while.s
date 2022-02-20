.section .data
	A:	.quad 0 # %rdi
	B:	.quad 0 # %rbx
	C:	.quad 0 # %rcx

.section .text

.global _start
_start:
	movq $10, A
	movq $1, B
	movq $0, C
	movq A, %rdi
	movq B, %rbx
	movq C, %rcx
loop:	
	addq %rbx, %rdi
	addq $1, %rcx
	cmpq $10, %rcx		# compara %rcx com 10
	jl loop				# se for menor, pula para o inicio do loop 
	movq $60, %rax
	syscall
