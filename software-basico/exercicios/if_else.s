.section .text
.section .data
	A: .quad 0
	B: .quad 0

.global _start

_start:
	movq $6, A
	movq $5, B
	movq A, %rdi
	movq B, %rbx
	cmpq %rbx, %rdi
	jle else
	addq %rbx, %rdi
	jmp fim_if

else:
	subq %rbx, %rdi
	
fim_if:
	movq $60, %rax
	syscall 
