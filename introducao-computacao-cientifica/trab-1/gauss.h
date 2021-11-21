/* Trabalho 1 - CI1164 (2021-1 ERE)
Prof. Dr. Guilherme Alex Derenievicz

Autores:
Tiago Serique Valadares (GRR20195138)
Fernanda Yukari Kawasaki (GRR20185057)
*/

#ifndef __GAUSS_H__
#define __GAUSS_H__

#include <stdio.h>
#include <stdlib.h>
#include <matheval.h>
#include <math.h>
#include <stdlib.h>
#include <sys/time.h>
#include <unistd.h>
#include <ctype.h>
#include "utils.h"


/*
*	Encontra o valor maximo da coluna especificada para usar de pivo
*
*	@param	matriz_coef		matriz em que se deseja achar o pivo
*	@param	coluna			coluna em que se deseja achar o pivo
*	@param	n				dimensao do sistema linear
*
*	@return	posicao que contem o maior valor
*/
int encontra_maximo(double **matriz_coef, int coluna, uint n);


/*
*	Troca as linhas da matriz de coeficientes e do vetor de termos independentes
*
*	@param	matriz_coef		matriz com as linhas que serao trocadas
*	@param 	vet_termos 		vetor que tera as linhas trocadas
*	@param 	linha			linha que deseja-se "descer"
*	@param 	pivo			linha que deseja-se "subir"
* 	@param 	n				dimensao do sistema linear
*
*/
void troca_linha(double **matriz_coef, double *vet_termos, int linha, uint pivo,
 uint n);


/*
*	Realiza o metodo de eleminacao de gauss para resolver sistemas lineares
*
*	@param	matriz_coef		matriz com coeficientes do sistema linear que se 
*							deseja resolver
*	@param	vet_termos		vetor com os termos independentes do sistema linear
*	@param	n				dimensao do sistema linear
*/
int eliminacao_gauss(double **matriz_coef, double *vet_termos, uint n);


/*
*	Realiza a retrossubstituicao das incognitas,
*	ou seja, substitui os valores das incognitas
*	nas equacoes e utiliza os resultados obtidos
*	para calcular as proximas equacoes.
*
*	@param	matriz_coef		matriz de coeficientes J(X^(i))
*	@param	vet_termos		vetor com os termos independentes - F(X^(i))
*	@param	x				vetor com as aproximacoes delta^(i)
*	@param	n				dimensoes do sistema
*
*/
int retrossub(double **matriz_coef, double *vet_termos, double *x, uint n);


#endif