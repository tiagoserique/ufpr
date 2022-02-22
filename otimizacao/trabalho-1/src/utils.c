/*==================================*/
/*= Autor: Tiago Serique Valadares =*/
/*= GRR: 20195138				   =*/
/*= Disciplina: Otimizacao		   =*/
/*==================================*/


#include <stdio.h>
#include "utils.h"


void imprimePesos(int *pesos, int num_itens){
	printf("Pesos\n");
	for (int i = 0; i < num_itens; i++)
		printf("%d ", pesos[i]);
	printf("\n\n");
}


void imprimePares(Par *pares, int num_pares){
	printf("Pares\n");
	for (int i = 0; i < num_pares; i++)
		printf("(%d, %d) ", pares[i].x, pares[i].y);
	printf("\n\n");
}


void imprimeSolucaoParcial(Par *s_parcial, int l){
	printf("Solucao Parcial\n");
	for (int i = 0; i < l; i++)
		printf("v(%d) = %d; ", s_parcial[i].x, s_parcial[i].y);
	printf("\n\n");
}
