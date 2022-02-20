.section .data
	A: .quad 0
	B: .quad 0

.section .text
.global _start
soma:
	pushq %rbp
	movq %rsp, %rbp
	movq A, %rax
	movq B, %rbx
	addq %rax, %rbx
	movq %rbx, %rax
	popq %rbp
	ret

_start:
	movq $4, A
	movq $5, B
	call soma
	movq $60, %rax
	movq B, %rdi
	syscall
