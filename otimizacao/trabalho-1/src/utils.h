/*==================================*/
/*= Autor: Tiago Serique Valadares =*/
/*= GRR: 20195138				   =*/
/*= Disciplina: Otimizacao		   =*/
/*==================================*/

#ifndef __UTILS__
#define __UTILS__


typedef struct Par {
	int x; 			// deve ser entregue antes
	int y; 			// deve ser entregue depois de y
} Par;


void imprimePesos(int *pesos, int num_itens);
void imprimePares(Par *pares, int num_pares);
void imprimeSolucaoParcial(Par *s_parcial, int l);


#endif