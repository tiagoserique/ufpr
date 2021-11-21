/* Trabalho 1 - CI1164 (2021-1 ERE)
Prof. Dr. Guilherme Alex Derenievicz

Autores:
Tiago Serique Valadares (GRR20195138)
Fernanda Yukari Kawasaki (GRR20185057)
*/

#ifndef __UTILS_H__
#define __UTILS_H__

#include <stdio.h>
#include <stdlib.h>
#include <matheval.h>
#include <math.h>
#include <stdlib.h>
#include <sys/time.h>
#include <unistd.h>
#include <ctype.h>
#include <assert.h>

#define SIZE_BUFFER 1024

typedef struct SNL_T {
	unsigned int n;			// dimensao do sistema
	int **expressoes;		// expressoes das funcoes nao lineares que compoem o sistema (evaluators)
	void ***derivadas;		// derivadas das equacoes nao lineares (evaluators)
	double *incognitas;		// aproximacao das incognitas (de x1 ate xn)
	double *termos_indep;	// termos independentes
} SNL_T;


/*
*	Libera a memoria ocupada pela struct SNL_T (sistema nao linear)
*
*	@param	snl	apontador para o sistema nao linear
*/
void destroi_snl(SNL_T *sl);


/*
*	Aloca espaco na memoria para o sistema nao linear
*
*	@param	n			dimensao do sistema
*	@param	expressoes	expressoes das funcoes nao lineares
*	@param	incognitas	vetor com aproximacao inicial das incognitas
*
*	@return	struct do sistema nao linear
*/ 
SNL_T *aloca_sistema_nao_linear(uint n, int **expressoes, double *incognitas);


/*
*	Aloca espaco para os resultados da jacobiana
*
*	@param	n	dimensao do sistema
*
*	@return 	matriz alocada
*
*/
double **aloca_result_jacobiana(uint n);


/*
*	Obtem o valor das incognitas passadas
*
*	@param	n			dimensao do sistema
*	@param	incognitas	vetor com aproximacao das incognitas
*	@param	names		vetor com o nome das incognitas da expressao
*	@param	count		tamanho do vetor names
*
*	@return				vetor com os valores das incognitas da expressao (names)
*
*/
double *obtem_variaveis(uint n, double *incognitas, char **names, int count);


/*
*	Imprime a saida no arquivo indicado
*
*	@param	output				arquivo onde a saida sera armazenada
*	@param	tempo_total			tempo
*	@param	tempo_derivadas		tempo gasto no calculo das derivadas parciais
*	@param	tempo_jacobiana		tempo gasto para gerar a matriz jacobiana
*	@param	tempo_sl			tempo gasto para resolver os sistemas lineares
*/
void imprime_tempo(FILE *output, double tempo_total, double tempo_derivadas, 
double tempo_jacobiana, double tempo_sl);


/*
*	Imprime os valores aproximados das incognitas
*
*	@param	output		apontador para o arquivo de saida
*	@param	xi			vetor com os valores das incognitas
*	@param	n			dimensao do sistema
*
*/
void imprime_x(FILE *output, double *xi, uint n);


/*
*	Imprime as expressoes
*
*	@param	output		apontador para o arquivo de saida
*	@param	snl			sistema nao linear
*
*/
void imprime_expressoes(FILE *output, SNL_T * sl);


/*
*	Retorna tempo em milisegundos
*
*	@return tempo em milisegundos
*/
double timestamp(void);

#endif