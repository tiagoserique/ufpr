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
	unsigned int n; 		// dimensao do sistema linear
	unsigned int k;			// número de diagonais (sempre um número ímpar, k < n)
	double **coeficientes; 	// coeficientes do sistema linear
	int **fx;				// funções do SL.
} SisLinear_T;


// Imprime o tempo que o metodo de gauss-seidel demorou para solucionar o 
// sistema linear
void imprime_tempo(double tempo);

// Imprime as k diagonais do sistema linear
void imprime_diagonais(SisLinear_T *sl);

// Imprime a solucao encontrada por gauss-seidel
void imprime_solucao(double *vet, int n);

// Imprime os termos independentes gerados para o sistema linear
void imprime_termos_indep(SisLinear_T *sl);

// calcula os coeficientes e armazena nos vetores das suas diagonais
void gera_sistema_linear(SisLinear_T *sl);

// destroi o sl
void destroi_sistema_linear(SisLinear_T *sl);

// aloca uma regiao de memoria para o sl
SisLinear_T *aloca_sistema_linear(unsigned int n, unsigned int k, int **fx);

// le a os dados de entrada
SisLinear_T *read_input(double *epsilon, unsigned int *max_iter);

// Retorna tempo em milisegundos
double timestamp(void);

#endif