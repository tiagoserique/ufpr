// GRR20195138 Tiago Serique Valadares
// Definição e operações em uma fila genérica.
// PingPongOS - PingPong Operating System
// Prof. Carlos A. Maziero, DINF UFPR
// Versão 1.4 -- Janeiro de 2022

#include <stdio.h>
#include "queue.h"

//------------------------------------------------------------------------------
// Conta o numero de elementos na fila
// Retorno: numero de elementos na fila
int queue_size(queue_t *queue){
	// check if the queue is empty
	if ( !queue )
		return 0;

	queue_t *aux = queue;
	int count = 1;

	// count from the second element to the last
	while ( (aux = aux->next) != queue )
		count++;

	return count;
}

//------------------------------------------------------------------------------
// Percorre a fila e imprime na tela seu conteúdo. A impressão de cada
// elemento é feita por uma função externa, definida pelo programa que
// usa a biblioteca. Essa função deve ter o seguinte protótipo:
//
// void print_elem (void *ptr) ; // ptr aponta para o elemento a imprimir
void queue_print(char *name, queue_t *queue, void print_elem (void*) ){
	printf("%s: [", name);

	// check if the queue is empty
	if ( !queue ){
		printf("]\n");
		return;
	}

	queue_t *aux = queue;

	// print the elements
	print_elem(aux);
	while ( (aux = aux->next) != queue ){
		printf(" ");
		print_elem(aux);
	}

	printf("]\n");
	return;
}

//------------------------------------------------------------------------------
// Insere um elemento no final da fila.
// Condicoes a verificar, gerando msgs de erro:
// - a fila deve existir
// - o elemento deve existir
// - o elemento nao deve estar em outra fila
// Retorno: 0 se sucesso, <0 se ocorreu algum erro
int queue_append(queue_t **queue, queue_t *elem){
	// check if the queue exists
	if ( !queue ){
		#ifdef DEBUG
		fprintf(stderr, "The queue doesn't exist\n");
		#endif
		return -1;
	}

	// check if the element exists
	if ( !elem ){
		#ifdef DEBUG
		fprintf(stderr, "The element doesn't exist\n");
		#endif
		return -2;
	}

	// check if the element is in a queue
	if ( elem->next != NULL || elem->prev != NULL ){

		// check if the element is in the queue
		// if element is not the first element, check if is in the queue
		// else, element is the first element
		if ( (* queue) != elem ){
			queue_t *aux = (* queue)->next;

			while ( aux != elem && aux != (* queue) )
				aux = aux->next;

			// check if the element is in other queue
			// else, element is already in the queue
			if ( aux == (* queue) ){
				#ifdef DEBUG
				fprintf(stderr, "The element is in other queue\n");
				#endif
				return -3;
			}
		}

		#ifdef DEBUG
		fprintf(stderr, "The element is already in queue\n");
		#endif
		return -4;
	}

	// check if the queue is empty
	// if queue is empty, element is the first element
	// else, append element in the end of the queue  
	if ( !(* queue) ){
		(* queue) = elem;
		(* queue)->next = elem;
		(* queue)->prev = elem;
	}
	else {
		(* queue)->prev->next = elem;

		elem->prev = (* queue)->prev;
		elem->next = (* queue);

		(* queue)->prev = elem;
	}

	return 0;
}

//------------------------------------------------------------------------------
// Remove o elemento indicado da fila, sem o destruir.
// Condicoes a verificar, gerando msgs de erro:
// - a fila deve existir
// - a fila nao deve estar vazia
// - o elemento deve existir
// - o elemento deve pertencer a fila indicada
// Retorno: 0 se sucesso, <0 se ocorreu algum erro
int queue_remove(queue_t **queue, queue_t *elem){
	// check if the queue exists
	if ( !queue ){
		#ifdef DEBUG
		fprintf(stderr, "The queue doesn't exist\n");
		#endif
		return -1;
	}

	// check if the queue is empty
	if ( !(* queue) ){
		#ifdef DEBUG
		fprintf(stderr, "The queue is empty\n");
		#endif
		return -5;
	}

	// check if the element exists
	if ( !elem ){
		#ifdef DEBUG
		fprintf(stderr, "The element doesn't exist\n");
		#endif
		return -2;
	}

	// check if the element is in any queue
	if ( elem->next == NULL || elem->prev == NULL ){
		#ifdef DEBUG
		fprintf(stderr, "The element is not in any queue \n");
		#endif
		return -6;
	}

	// check if the element is in the queue
	// if element is not the first element, check if is in the queue
	// else, element is the first element of the queue
	if ( (* queue) != elem ){
		queue_t *aux = (* queue)->next;

		while ( aux != elem && aux != (* queue) )
			aux = aux->next;

		// check if the element is in other queue
		if ( aux == (* queue) ){
			#ifdef DEBUG
			fprintf(stderr, "The element is in other queue\n");
			#endif
			return -3;
		}
	}
	else {
		// check if there's only one element in the queue
		// if there's only one element in the queue, queue now is empty
		// else, the new queue first element is the second element
		if ( (* queue)->next == (* queue) && (* queue)->prev == (* queue) ){
			(* queue)->next = NULL;
			(* queue)->prev = NULL;
			(* queue)       = NULL;

			return 0;
		}
		else
			(* queue) = (* queue)->next;
	}

	elem->prev->next = elem->next;
	elem->next->prev = elem->prev;	
	
	elem->next = NULL;
	elem->prev = NULL;

	return 0;
}
