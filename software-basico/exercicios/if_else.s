.section .text
.section .data
	A: .quad 0 			# %rdi
	B: .quad 0 			# %rbx

.global _start

_start:
	movq $6, A
	movq $5, B
	movq A, %rdi
	movq B, %rbx
	cmpq %rbx, %rdi 	# compara %rdi com %rbx
	jle else			# se for menor(less) ou igual(equal), pula para o else
	addq %rbx, %rdi		# soma %rdi com %rbx e armazena em %rdi
	jmp fim_if

else:
	subq %rbx, %rdi		# subtrai %rdi com %rbx e armazena em %rdi
	
fim_if:
	movq $60, %rax
	syscall 
