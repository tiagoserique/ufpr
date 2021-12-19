/* Trabalho 1 - CI1164 (2021-1 ERE)
Prof. Dr. Guilherme Alex Derenievicz

Autores:
Tiago Serique Valadares (GRR20195138)
Fernanda Yukari Kawasaki (GRR20185057)
*/


#include "gauss.h"


void eliminacao_gauss(SNL_T *snl, double *delta){
	// TRIANGULARIZACAO
	for (int i = 0; i < snl->n - 1; ++i){
		double m = snl->diagonal_inferior_result[i] / snl->diagonal_principal_result[i];
		snl->diagonal_inferior_result[i] 		= 0.0;
		snl->diagonal_principal_result[i + 1] 	-= snl->diagonal_superior_result[i] * m;
		snl->termos_indep[i + 1] 				-= snl->termos_indep[i] * m;
	}

	// RETROSSUBSTITUICAO
	delta[snl->n - 1] = snl->termos_indep[snl->n - 1] / snl->diagonal_principal_result[snl->n - 1];
	for (int i = snl->n - 2; i >= 0; i--)
		delta[i] = (snl->termos_indep[i] - snl->diagonal_superior_result[i] * 
									delta[i + 1]) / snl->diagonal_principal_result[i];
}
