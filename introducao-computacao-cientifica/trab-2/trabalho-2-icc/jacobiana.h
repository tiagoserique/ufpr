/* Trabalho 1 - CI1164 (2021-1 ERE)
Prof. Dr. Guilherme Alex Derenievicz

Autores:
Tiago Serique Valadares (GRR20195138)
Fernanda Yukari Kawasaki (GRR20185057)
*/

#ifndef __JACOBIANA_H__
#define __JACOBIANA_H__

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <matheval.h>
#include <stdlib.h>
#include <sys/time.h>
#include <unistd.h>
#include <ctype.h>
#include "utils.h"

/*
*	Faz o calculo da jacobiana para cada funcao derivada da matriz
*
*	@param	derivadas	 armazena a matriz com as F'(X)
*	@param	incognitas	 armazena os valores de X atuais
*	@param	result     	 armazena o resultado do calculo da jacobiana
*	@param	n            armazena o tamanho do sistema linear
*
*/
int calcula_jacobiana(SNL_T *snl);

/*
*	Gera a matriz jacobiana com todos os F'(X)
*
*	@param	derivadas	 armazena a matriz com as F'(X) (evaluators)
*	@param	expressoes   armazena todas das F(X) recebidas do input
*	@param	incognitas   armazena o resultado do calculo da jacobiana
*	@param	n            armazena o tamanho do sistema linear
*   @param  deriv_time   tempo gasto para calcular as derivadas
*
*/
int gera_matriz_derivadas(SNL_T *sl, double *deriv_time);

#endif