/* Trabalho 1 -CI1164 (2021-1 ERE)
Prof. Dr. Guilherme Alex Derenievicz

Autores:
Tiago Serique Valadares (GRR20195138)
Fernanda Yukari Kawasaki (GRR20185057)
*/

#ifndef __ENTRADA_H__
#define __ENTRADA_H__

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <ctype.h>
#include <sys/types.h>
#include "utils.h"

/*
*	Le o arquivo passado na entrada padrao
*
*	@param	input		arquivo da entrada padrao
*	@param	epsilon		tolerancia epsilon (criterio de parada)
*	@param	max_iter	numero maximo de iteracoes para o metodo de newton
*
*	@return	sistema nao linear alocado
*
*/
SNL_T *le_input(FILE *output, double *epsilon, uint *max_iter);

#endif