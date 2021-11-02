#ifndef __UTILS__
#define __UTILS__

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <matheval.h>
#include <math.h>
#include <sys/time.h>


#define SIZE_BUFFER 1024


typedef struct SisLinear_T {
	unsigned int n; 	// dimensao do SL
	unsigned int k;		// número de diagonais (sempre um número ímpar, k < n)
	double *matriz;			
	double **coeficientes;
	double *termos_indep;
	int **fx;			// funções do SL.
} SisLinear_T;


// 
void imprime_sistema(SisLinear_T *sl);

// 
void gera_sistema_linear(SisLinear_T *sl){

// 
void ajusta_sistema_linear(SisLinear_T *sl);

// destroi o sl
void destroi_SL(SisLinear_T *sl);

// aloca uma regiao de memoria para o sl
SisLinear_T *aloca_SL();

// le a os dados de entrada
void read_input(SisLinear_T *sl, double *epsilon, unsigned int *max_iter);

//  Retorna tempo em milisegundos
double timestamp(void);

#endif