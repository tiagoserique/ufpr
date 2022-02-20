.section .data
	A: .quad 0 				# %rdi
	B: .quad 0 				# %rbx
	C: .quad 0 				# %rcx

.section .text

.global _start
_start:
	movq $10, A		
	movq $1, B
	movq $0, C

	movq A, %rdi
	movq B, %rbx	
	movq C, %rcx	
for:	
	cmpq $10, %rcx			# compara %rcx com 10
	jge fim_for				# se for maior ou igual, pula para o fim do for
		addq %rbx, %rdi		
		addq $1, %rcx
		jmp for
fim_for:
	movq $60, %rax
	syscall
