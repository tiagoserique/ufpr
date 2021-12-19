/* Trabalho 1 - CI1164 (2021-1 ERE)
Prof. Dr. Guilherme Alex Derenievicz

Autores:
Tiago Serique Valadares (GRR20195138)
Fernanda Yukari Kawasaki (GRR20185057)
*/

#ifndef __NEWTON_H__
#define __NEWTON_H__

#include <stdio.h>
#include <stdlib.h>
#include <matheval.h>
#include <math.h>
#include <stdlib.h>
#include <sys/time.h>
#include <unistd.h>
#include <ctype.h>
#include <string.h>
#include "jacobiana.h"
#include "gauss.h"
#include "utils.h"
#include <likwid.h>


/*
*	Retorna a norma do vetor, ou seja,
*	o maior valor do vetor
*
*	@param	vetor	vetor que se quer encontrar a norma
*	@param	n		tamanho do vetor
*
*	@return	maior valor do vetor
*
*/ 
double acha_norma(double *vetor, uint n);

/*
*	Calcula os valores de F(X), que sao os termos independentes
*
*	@param	termos_indep	vetor com os termos independentes
*	@param	incognitas		vetor com o valor aproximado das incognitas
*	@param	expressoes		vetor com as expressoes das funcoes
*	@param	n				tamanho do vetor
*
*/ 
int calcula_termos_indep(SNL_T *snl);

/*
*	Calcula o valor aproximado das incognitas usando o metodo de Newton
*
*	@param	snl					sistema nao linear
*	@param	epsilon				tolerancia
*	@param	max_iter			numero maximo de iteracoes do Newton
*	@param	jacobiana_time		tempo gasto para a jacobiana
*	@param	sl_time				tempo gasto para resolver o sistema linear
*	@param	newton_time			tempo gasto para o metodo de Newton
*	@param	output				arquivo de saida
*
*	@return codigo de erro ou sucesso
*/
int newtonMetod(SNL_T *snl, double epsilon, uint max_iter, 
double *jacobiana_time, double *sl_time, double *newton_time, FILE *output);

#endif