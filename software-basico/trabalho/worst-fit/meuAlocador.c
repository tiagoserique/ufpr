#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "meuAlocador.h"

/*================================== HEADERS =================================*/

// extern void _iniciaAlocador();
// extern void _finalizaAlocador();
// extern int _liberaMem(void *bloco);
// extern void *_alocaMem(int num_bytes);
// extern void _imprimeMapa();
// void iniciaAlocador();
// void finalizaAlocador();
// int liberaMem(void* bloco);
// void* alocaMem(int num_bytes);
// void imprimeMapa();


/*============================= VARIAVES GLOBAIS =============================*/


void *topo_inicial_heap;
void *busca_anterior;


/*================================== FUNCOES =================================*/


// Executa syscall brk para obter o endereço do topo
// corrente da heap e o armazena em uma
// variável global, topo_inicial_heap.
void iniciaAlocador(){
	printf("Trabalho de SB\n");
	topo_inicial_heap = sbrk(0);
	busca_anterior = topo_inicial_heap;                                                                               
}


// Executa syscall brk para restaurar o valor
// original da heap contido em topo_inicial_heap.
void finalizaAlocador(){
	brk(topo_inicial_heap);
	busca_anterior = NULL;
}

// indica que o bloco está livre.
int liberaMem(void* bloco){
	long int *bloco_aux = bloco;
	bloco_aux[-2] = 0;
	bloco_aux = NULL;

	long int *ini_heap = (long int *)topo_inicial_heap;
	long int *topo_heap = (long int *)sbrk(0);

	while ( ini_heap != topo_heap ){

		if ( ini_heap[0] == 0 ){
			long int *aux = (void *)ini_heap + 16 + ini_heap[1];

			// busca_anterior = ini_heap;
			
			while ( aux[0] == 0 && aux != topo_heap ){
				ini_heap[1] = ini_heap[1] + 16 + aux[1];
				aux = (void *)aux + 16 + aux[1]; 
			}
		}

		ini_heap = (void *)ini_heap + 16 + ini_heap[1];
	}

	return 1;
}


// 1. Procura um bloco livre com tamanho maior ou
//    igual à num_bytes.
// 2. Se encontrar, indica que o bloco está
//    ocupado e retorna o endereço inicial do bloco;
// 3. Se não encontrar, abre espaço
//    para um novo bloco usando a syscall brk,
//    indica que o bloco está ocupado e
//    retorna o endereço inicial do bloco.
void *alocaMem(int num_bytes){
	long int *inicio_busca = topo_inicial_heap;
	void *topo_heap = sbrk(0);

	int tamanho = -1;
	long int *posi_aux = NULL;

	// loop para percorrer os nos da lista
	while ( inicio_busca != topo_heap ){
		// se o bloco estiver livre
		if ( inicio_busca[0] == 0 )
			if ( inicio_busca[1] > tamanho ){
				posi_aux = inicio_busca;
				tamanho = inicio_busca[1];
			}

		inicio_busca = (void *)inicio_busca + 16 + inicio_busca[1];
	}

	if ( tamanho != -1 ){
		// se o tamanho do bloco for maior que numero de bytes + 16
		// garante que nao vai ter um bloco de tamanho 0 na heap
		// parte o bloco grande em menores
		if ( posi_aux[1] > num_bytes + 16 ){
			posi_aux[0] = 1;
			posi_aux[1] = num_bytes;

			long int *novo_bloco = (void *)posi_aux + 16 + num_bytes;
			novo_bloco[0] = 0;
			novo_bloco[1] = tamanho - num_bytes - 16;

			// busca_anterior = posi_aux;

			return (void *)posi_aux + 16;
		}
		// se o tamanho do bloco for maior ou igual ao numero de bytes
		// reserva o bloco inteiro, mesmo se passar do valor de num_bytes
		else if ( posi_aux[1] >= num_bytes ){
			posi_aux[0] = 1;

			// busca_anterior = posi_aux;

			return (void *)posi_aux + 16;
		}
	}

	// atribuicao de dados para o blooco de memoria achado ou alocado
	long int *gerenciador = (long int *)sbrk(8);
	*gerenciador = 1;

	gerenciador = (long int *)sbrk(8);
	*gerenciador = num_bytes;
	
	void *endereco;
	endereco = sbrk(num_bytes);
	
	busca_anterior = endereco + num_bytes;

	return endereco;
}


// imprime um mapa da memória da região da heap.
// Cada byte da parte gerencial do nó deve ser impresso
// com o caractere "#". O caractere usado para
// a impressão dos bytes do bloco de cada nó depende
// se o bloco estiver livre ou ocupado. Se estiver livre, imprime o
// caractere -". Se estiver ocupado, imprime o caractere "+".
void imprimeMapa(){
	long int *heap = topo_inicial_heap;
	void *topo_heap = sbrk(0);
	char bloco;


	while ( heap != topo_heap ){

		for (int i = 0; i < 16; i++)
			putchar('#');
		
		if ( heap[0] == 1 )
			bloco = '+';
		else
			bloco = '-';

		for (int i = 0; i < heap[1]; i++)
			putchar(bloco);

		heap = (void *)heap + heap[1] + 16; 
	}

	printf("\n\n");
	fflush(stdout);
}

