.section .data
	A: .quad 0
	B: .quad 0
	C: .quad 0

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
	cmpq $10, %rcx
	jge fim_for
	addq %rbx, %rdi
	addq $1, %rcx
	jmp for
fim_for:
	movq $60, %rax
	syscall
