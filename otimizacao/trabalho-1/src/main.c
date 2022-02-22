/*==================================*/
/*= Autor: Tiago Serique Valadares =*/
/*= GRR: 20195138				   =*/
/*= Disciplina: Otimizacao		   =*/
/*==================================*/


#include <stdio.h>
#include <stdlib.h>
#include "utils.h"


int main(){
	int num_itens = 0;
	int num_pares = 0;
	int capacidade_caminhao = 0;
	int l = 0;


/*============================= leitura ======================================*/

	scanf(" %d %d %d", &num_itens, &num_pares, &capacidade_caminhao);

	
	int *pesos_itens = (int *) malloc(sizeof(int) * num_itens);
	for (int i = 0; i < num_itens; i++)
		scanf(" %d", &pesos_itens[i]);


	Par *pares = (Par *) malloc(sizeof(Par) * num_pares);
	for (int i = 0; i < num_pares; i++)
		scanf(" %d %d", &pares[i].x, &pares[i].y);


	scanf(" %d", &l);

	Par *solucao_parcial = (Par *)malloc(sizeof(Par) * l);
	for (int i = 0; i < l ; i++)
		scanf(" %d %d", &solucao_parcial[i].x, &solucao_parcial[i].y);
						// i de cada item em P e valor de v(i)









	// imprimePesos(pesos_itens, num_itens);
	// imprimePares(pares, num_pares);
	// imprimeSolucaoParcial(solucao_parcial, l);


	return EXIT_SUCCESS;
}