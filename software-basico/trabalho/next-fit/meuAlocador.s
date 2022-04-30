.section .data
    topo_inicial_heap:  .quad   0
    busca_anterior:     .quad   0

    .globl topo_inicial_heap
    .globl busca_anterior
    
    new_line:           .byte   10
    bloco_gerenciador:  .byte   35
    bloco_ocupado:      .byte   43
    bloco_livre:        .byte   45
    string_inicial:     .string "Trabalho de SB\n"

.section .text


.globl iniciaAlocador
iniciaAlocador:
    pushq %rbp          # empilha o rbp
    movq %rsp, %rbp     # %rbp = %rsp

    # printf("Trabalho de SB\n");
    movq $string_inicial, %rdi      # %rdi = $string_inicial
    call printf

    # topo_inicial_heap = sbrk(0);
    movq $12, %rax                  # %rax = 12 para chamar sbrk()
    movq $0, %rdi                   # parametro para chamada de sbrk(0)
    syscall                         # %rax = sbrk(0)
    movq %rax, topo_inicial_heap 

    # busca_anterior = topo_inicial_heap;
    movq %rax, busca_anterior
    
    popq %rbp
    ret


.globl finalizaAlocador
finalizaAlocador:
    pushq %rbp          # empilha o rbp
    movq %rsp, %rbp     # %rbp = %rsp

    # brk(topo_inicial_heap);
    movq $12, %rax                  # %rax = 12 para chamar sbrk()
    movq topo_inicial_heap, %rdi 
    syscall

	# busca_anterior = NULL;
    movq $0, busca_anterior

    popq %rbp
    ret


.globl liberaMem
liberaMem:
    pushq %rbp          # empilha o rbp
    movq %rsp, %rbp     # %rbp = %rsp

                    # %rdi: bloco
    subq $32, %rsp  # aloca espaco para 4 variaveis
                    # -8(%rbp): bloco_aux
                    # -16(%rbp): ini_heap
                    # -24(%rbp): topo_heap
                    # -32(%rbp): aux

	# long int *bloco_aux = bloco;
    movq %rdi, -8(%rbp)     # -8(%rbp) [bloco_aux] = %rdi [bloco]

	# bloco_aux[-2] = 0;
    movq -8(%rbp), %rax     # %rax = -8(%rbp) [bloco_aux]
    movq $0, -16(%rax)      # -16(%rax) [bloco_aux[-2]] = 0

	# bloco_aux = NULL;
    movq -8(%rbp), %rax     # %rax = -8(%rbp) [bloco_aux]
    movq $0, (%rax)

	# long int *ini_heap = (long int *)topo_inicial_heap;
    movq topo_inicial_heap, %rax
    movq %rax, -16(%rbp)       # -16(%rbp) [ini_heap] = %rax [topo_inicial_heap]

	# long int *topo_heap = (long int *)sbrk(0);
    movq $12, %rax  # %rax = 12 para chamar sbrk()
    movq $0, %rdi   # parametro para chamada de sbrk(0)
    syscall         # %rax = sbrk(0)
    movq %rax, -24(%rbp)        # -24(%rbp) [topo_heap] = sbrk(0)

	# while ( ini_heap != topo_heap ){
    loop_exterior:
    movq -16(%rbp), %rax        # %rax = -16(%rbp) [ini_heap]
    movq -24(%rbp), %rbx        # %rbx = -24(%rbp) [topo_heap]
    cmp %rbx, %rax
    je fim_loop_exterior

		# if ( ini_heap[0] == 0 ){
        movq -16(%rbp), %rax        # %rax = -16(%rbp) [ini_heap]
        movq (%rax), %rax           # %rax = ini_heap[0]
        cmp $0, %rax
        jne fim_if1

            # long int *aux = (void *)ini_heap + 16 + ini_heap[1];
            movq -16(%rbp), %rax        # %rax = -16(%rbp) [ini_heap]
            addq 8(%rax), %rax          # %rax += ini_heap[1]
            addq $16, %rax              # %rax += 16
            movq %rax, -32(%rbp)        # -32(%rbp) [aux] = ini_heap + ini_heap[1] + 16

			# busca_anterior = ini_heap;
            movq -16(%rbp), %rax        # %rax = -16(%rbp) [ini_heap]
            movq %rax, busca_anterior   # busca_anterior = ini_heap

			# while ( aux[0] == 0 && aux != topo_heap ){
            loop_interior:
            movq -32(%rbp), %rax        # %rax = -32(%rbp) [aux]
            movq 0(%rax), %rbx          # %rbx = aux[0]
            cmp $0, %rbx                # se ( aux[0] == 0 )
            jne fim_loop_interior
            movq -24(%rbp), %rbx        # %rbx = -24(%rbp) [topo_heap]
            cmp %rbx, %rax              # se ( aux != topo_heap )
            je fim_loop_interior

				# ini_heap[1] = ini_heap[1] + 16 + aux[1];
                movq -16(%rbp), %rax    # %rax = -16(%rbp) [ini_heap]
                movq 8(%rax), %rax      # %rax = ini_heap[1]
                movq -32(%rbp), %rbx    # %rbx = -32(%rbp) [aux]
                addq 8(%rbx), %rax      # %rax = ini_heap[1] + aux[1]
                addq $16, %rax          # %rax += 16
                movq -16(%rbp), %rbx    # %rbx = -16(%rbp) [ini_heap]
                movq %rax, 8(%rbx)      # ini_heap[1] = %rax

				# aux = (void *)aux + 16 + aux[1]; 
                movq -32(%rbp), %rax        # %rax = -32(%rbp) [aux]
                addq 8(%rax), %rax          # %rax += aux[1]
                addq $16, %rax              # %rax += 16
                movq %rax, -32(%rbp)        # aux = %rbx

                jmp loop_interior
            fim_loop_interior:
        fim_if1:

		# ini_heap = (void *)ini_heap + 16 + ini_heap[1];
        movq -16(%rbp), %rax # %rax = -16(%rbp) [ini_heap]
        addq 8(%rax), %rax   # %rax += ini_heap[1]
        addq $16, %rax       # %rax += 16
        movq %rax, -16(%rbp) # -16(%rbp) [ini_heap] = %rax
        
        jmp loop_exterior
    fim_loop_exterior:

    addq $32, %rsp  # desaloca espaco para 4 variaveis
    
    movq $1, %rax   # return 1
    popq %rbp
    ret


.globl alocaMem
alocaMem:
    pushq %rbp          # empilha %rbp
    movq %rsp, %rbp     # %rbp = %rsp

                    # %rdi = num_bytes
    subq $48, %rsp  # aloca espaco para 8 variaveis
                    #  -8(%rbp): long int *inicio_busca
                    # -16(%rbp): void *topo_heap
                    # -24(%rbp): long int *fim_busca
                    # -32(%rbp): int volta
                    # -40(%rbp): long int bloco_atual_tam
                    # -48(%rbp): long int *novo_bloco

    # long int *inicio_busca = busca_anterior;
    movq busca_anterior, %r11
    movq %r11, -8(%rbp)

    movq %rdi, %r10 # %r10 = num_bytes

	# void *topo_heap = sbrk(0);
    movq $12, %rax                  # %rax = 12 para chamar sbrk()
    movq $0, %rdi                   # parametro para chamada de sbrk(0)
    syscall                         # %rax = sbrk(0)
    movq %rax, -16(%rbp)            # -16(%rbp) [void *topo_heap] = %rax
    movq %r10, %rdi                 # %rdi = num_bytes

	# long int *fim_busca = topo_heap;
    movq -16(%rbp), %r11        # %r11 = -16(%rbp) [void *topo_heap]
    movq %r11, -24(%rbp)        # -24(%rbp) [long int *fim_busca] = -16(%rbp) [void *topo_heap]

	# int volta = 0;
    movq $0, -32(%rbp)  # -32(%rbp) [int volta] = 0

	# while ( volta < 2 ){
    while_1:
    movq -32(%rbp), %r11    # %r11 = -32(%rbp) [int volta]
    cmp $2, %r11
    jge fim_while_1

		# while ( inicio_busca != fim_busca ){
        while_2:
        movq -8(%rbp), %r12         # %r12 = -8(%rbp) [long int *inicio_busca]
        movq -24(%rbp), %r13        # %r13 = -24(%rbp) [void *fim_busca]
        cmp %r13, %r12  
        je fim_while_2

			# if ( inicio_busca[0] == 0 ){
            movq -8(%rbp), %r14             # %r14 = -8(%rbp) [long int *inicio_busca]
            movq (%r14), %r14               # %r14 = (%r14) [long int inicio_busca[0]]
            cmp $0, %r14
            jne fim_if2

                # if ( inicio_busca[1] > num_bytes + 16 ){
                movq -8(%rbp), %r14         # %r14 = -8(%rbp) [long int *inicio_busca]
                movq 8(%r14), %r14          # %r14 = 8(%r14) [long int inicio_busca[1]]
                movq $16, %r15              # %r15 = 16
                addq %rdi, %r15             # %r15 = %rdi [num_bytes] + 16 
                cmp %r15, %r14
                jle else_if3

                    # long int bloco_atual_tam = inicio_busca[1];
                    movq -8(%rbp), %r14         # %r14 = -8(%rbp) [long int *inicio_busca]
                    movq 8(%r14), %r14          # %r14 = 8(%r14) [long int inicio_busca[1]]
                    movq %r14, -40(%rbp)        # -40(%rbp) [long int bloco_atual_tam] = %r14

			        # inicio_busca[0] = 1;
                    movq -8(%rbp), %r14         # %r14 = -8(%rbp) [long int *inicio_busca]
                    movq $1, %r15               # %r15 = 1
                    movq %r15, (%r14)           # (%r14) [inicio_busca[0]] = 1

			        # inicio_busca[1] = num_bytes;
                    movq -8(%rbp), %r14         # %r14 = -8(%rbp) [long int *inicio_busca]
                    movq %rdi, 8(%r14)          # 8(%r14) [inicio_busca[1]] = %rdi [num_bytes]


			        # long int *novo_bloco = (void *)inicio_busca + 16 + num_bytes;
                    movq -8(%rbp), %r14         # %r14 = -8(%rbp) [long int *inicio_busca]
                    addq $16, %r14              # %r14 += 16
                    addq %rdi, %r14             # %r14 += %rdi [num_bytes]
                    movq %r14, -48(%rbp)        # -48(%rbp) [long int *novo_bloco] = %r14

                    # novo_bloco[0] = 0;
                    movq -48(%rbp), %r14        # %r14 = -48(%rbp) [long int *novo_bloco]
                    movq $0, (%r14)             # (%r14) [novo_bloco[0]] = 0

			        # novo_bloco[1] = bloco_atual_tam - num_bytes - 16;
                    movq -40(%rbp), %r14        # %r14 = -40(%rbp) [long int bloco_atual_tam]
                    subq %rdi, %r14             # %r14 -= %rdi [num_bytes]
                    subq $16, %r14              # %r14 -= 16
                    movq -48(%rbp), %r15        # %r15 = -48(%rbp) [long int *novo_bloco]
                    movq %r14, 8(%r15)          # 8(%r15) [novo_bloco[1]] = %r14

					# busca_anterior = inicio_busca;
                    movq -8(%rbp), %r14         # %r14 = -8(%rbp) [long int *inicio_busca]
                    movq %r14, busca_anterior   # busca_anterior [long int *busca_anterior] = %r14

			        # return (void *)inicio_busca + 16;
                    movq -8(%rbp), %rax         # %rax = -8(%rbp) [long int *inicio_busca]
                    addq $16, %rax              # %rax += 16

                    addq $48, %rsp  # desaloca espaco para 8 variaveis
                    popq %rbp
                    ret
                
			    # else if ( inicio_busca[1] >= num_bytes ){
                else_if3:
                movq -8(%rbp), %r14         # %r14 = -8(%rbp) [long int *inicio_busca]
                movq 8(%r14), %r14          # %r14 = 8(%r14) [long int inicio_busca[1]]
                cmp %rdi, %r14
                jl fim_if3
                
                    # inicio_busca[0] = 1;
                    movq -8(%rbp), %r14         # %r14 = -8(%rbp) [long int *inicio_busca]
                    movq $1, (%r14)             # (%r14) [inicio_busca[0]] = 1

                    # busca_anterior = inicio_busca;
                    movq -8(%rbp), %r14         # %r14 = -8(%rbp) [long int *inicio_busca]
                    movq %r14, busca_anterior   # busca_anterior [long int *busca_anterior] = %r14

                    # return (void *)inicio_busca + 16;
                    movq -8(%rbp), %rax         # %rax = -8(%rbp) [long int *inicio_busca]
                    addq $16, %rax              # %rax += 16

                    addq $48, %rsp  # desaloca espaco para 8 variaveis
                    popq %rbp
                    ret

                fim_if3:
            fim_if2:
    
    		# inicio_busca = (void *)inicio_busca + 16 + inicio_busca[1];
            movq -8(%rbp), %r14            # %r14 = -8(%rbp) [long int *inicio_busca]
            addq $16, %r14                 # %r14 = -8(%rbp) [long int *inicio_busca] + 16
            movq -8(%rbp), %r15            # %r15 = -8(%rbp) [long int *inicio_busca]
            movq 8(%r15), %r15             # %r15 = 8(%r15) [long int inicio_busca[1]]
            addq %r14, %r15                # %r15 = [long int *inicio_busca] + 16 + [long int inicio_busca[1]]
            movq %r15, -8(%rbp)            # -8(%rbp) [long int *inicio_busca] = %r15

            jmp while_2
        fim_while_2:

        # inicio_busca = topo_inicial_heap;
        movq topo_inicial_heap, %r14    # %r14 = topo_inicial_heap
        movq %r14, -8(%rbp)             # -8(%rbp) [long int *inicio_busca] = topo_inicial_heap
		
		# fim_busca = busca_anterior;
        movq busca_anterior, %r14       # %r14 = busca_anterior
        movq %r14, -24(%rbp)            # -24(%rbp) [long int *fim_busca] = busca_anterior

        # volta++;
        movq -32(%rbp), %r14    # %r14 = -32(%rbp) [int volta]
        addq $1, %r14           # %r14 += 1
        movq %r14, -32(%rbp)    # -32(%rbp) [int volta] = %r14 + 1

        jmp while_1
    fim_while_1:

    # sbrk(num_bytes);
    movq -16(%rbp), %r11           # %r11 = -16(%rbp) [void *topo_heap]
    addq $16, %r11                 # %r11 = -16(%rbp) [void *topo_heap] + 16
    addq %rdi, %r11                # %r11 = -16(%rbp) [void *topo_heap] + 16 + %rdi [num_bytes]
    movq %r11, %rdi                # %rdi = %r11    parametro para chamada da syscall
    movq $12, %rax                 # %rax = 12
    syscall
    movq %r10, %rdi                # %rdi = num_bytes

    # topo_heap[0] = 1;   pega antigo topo da heap para guardar valores de gerenciamento
    movq -16(%rbp), %r11           # %r11 = -16(%rbp) [void *topo_heap]
    movq $1, (%r11)                # (%r11) [antigo topo_heap[0]] = 1

    # topo_heap[1] = num_bytes;   pega antigo topo da heap para guardar valores de gerenciamento
    movq -16(%rbp), %r11           # %r11 = -16(%rbp) [void *topo_heap] 
    movq %rdi, 8(%r11)             # 8(%r11) [antigo topo_heap[1]] = %rdi [num_bytes]

	# busca_anterior = (void *)topo_heap + 16 + num_bytes;
    movq -16(%rbp), %r11           # %r11 = -16(%rbp) [void *topo_heap]
    addq $16, %r11                 # %r11 = -16(%rbp) [void *topo_heap] + 16
    addq %rdi, %r11                # %r11 = -16(%rbp) [void *topo_heap] + 16 + %rdi [num_bytes]
    movq %r11, busca_anterior      # busca_anterior = %r11

    # return &topo_heap[2];
    movq -16(%rbp), %rax           # %rax = -16(%rbp) [void *topo_heap]
    addq $16, %rax                 # %rax = -16(%rbp) [void *topo_heap] + 16 

    addq $48, %rsp  # desaloca espaco para 8 variaveis
    popq %rbp
    ret


.globl imprimeMapa
imprimeMapa:
    pushq %rbp          # empilha %rbp
    movq %rsp, %rbp     # %rbp = %rsp

    subq $24, %rsp      # aloca espaco para 3 variaveis
                        # -8(%rbp): long int *heap
                        # -16(%rbp): void *topo_heap
                        # -24(%rbp): char bloco
    
    
    # long int *heap = topo_inicial_heap;
    movq topo_inicial_heap, %r10    
    movq %r10, -8(%rbp)             # -8(%rbp) [long int *heap] = topo_inicial_heap


    # void *topo_heap = sbrk(0);
    movq $12, %rax                  # %rax = 12 para chamar sbrk()
    movq $0, %rdi                   # %rdi = 0  parametro para chamada de sbrk(0)
    syscall                         # %rax = sbrk(0)
    movq %rax, -16(%rbp)            # -16(%rbp) [void *topo_heap] = sbrk(0);


	# while ( heap != topo_heap ){
    while:
    movq -8(%rbp), %r10        # %r10 = -8(%rbp) [long int *heap] [&heap[0]]
    movq -16(%rbp), %r11       # %r11 = -16(%rbp) [void *topo_heap]
    cmp %r11, %r10
    je fim_while

        # 	for (int i = 0; i < 16; i++)
        movq $0, %r12           # %r12 = 0
        for_1:
        cmp $16, %r12
        jge fim_for1
            
            # putchar('#');
            movq bloco_gerenciador, %rdi
            call putchar

            addq $1, %r12        # %r12 = i + 1
            
            jmp for_1
        fim_for1:

    
        # 	if ( heap[0] == 1 )
        movq -8(%rbp), %r12     # %r12 = -8(%rbp) [long int *heap] [&heap[0]]
        movq (%r12), %r12       # %r12 = heap[0] 
        cmp $1, %r12
        jne else

            #   bloco = '+';
            movq bloco_ocupado, %r13   # %r13 = '+'
            
            jmp fim_if4
        # 	else
        else:

            #   bloco = '-';
            movq bloco_livre, %r13     # %r13 = '-'
        fim_if4:
            

        # 	for (int i = 0; i < heap[1]; i++)
        movq $0, %r12           # %r12 = 0
        movq -8(%rbp), %r14     # %r14 = -8(%rbp) [long int *heap] [&heap[0]]
        addq $8, %r14            # %r14 = -8(%rbp) [long int *heap] [&heap[0]] + 8 
        movq (%r14), %r14       # %r14 = heap[1]
        for_2:
        cmp %r14, %r12
        jge fim_for2
            
            # putchar(bloco);
            movq %r13, %rdi
            call putchar

            addq $1, %r12        # %r12 = i + 1

            jmp for_2
        fim_for2:


        # 	heap = (void *)heap + heap[1] + 16; 
        movq -8(%rbp), %r12     # %r12 = -8(%rbp) [long int *heap] [&heap[0]]
        movq %r12, %r13         # %r13 = %r12
        addq $8, %r13           # %r13 = -8(%rbp) [long int *heap] [&heap[0]] + 8
        movq (%r13), %r13       # %r13 = heap[1]
        addq $16, %r13          # %r13 = heap[1] + 16
        addq %r13, %r12         # %r12 = -8(%rbp) [long int *heap] [&heap[0]] + heap[1] + 16
        movq %r12, -8(%rbp)     # -8(%rbp) [long int *heap] = &heap[0] + heap[1] + 16

        jmp while
    fim_while:

	# printf("\n\n");
    movq new_line, %rdi
    call putchar
    movq new_line, %rdi
    call putchar

    addq $24, %rsp      # desaloca espaco para 3 variaveis
    popq %rbp
    ret
