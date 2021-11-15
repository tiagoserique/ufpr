/* Trabalho 1 - CI1164 (2021-1 ERE)
Prof. Dr. Guilherme Alex Derenievicz

Autores:
Tiago Serique Valadares (GRR20195138)
Fernanda Yukari Kawasaki (GRR20185057)
*/

#include "entrada.h"


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
SNL_T *le_input(FILE *input, double *epsilon, uint *max_iter){
	int **expressoes;
	uint n;
	double *incognitas;

	// dimensao do SNL
	fscanf(input, "%u", &n);
    // fprintf(output, "%u\n", n);

	// string da expressão da função fi(x), sem espaços, na variável x.
	char fx[SIZE_BUFFER + 1];
	expressoes = (int **)malloc((n) * sizeof(void *));
	if ( expressoes == NULL ){
		fprintf(stderr, "Erro ao alocar memoria em \"le_input\"");
		abort();
	}

	// Obtem as expressoes e cria objetos evaluator
	for (int i = 0; i < n; i++){
		fscanf(input, "%s", fx);
		expressoes[i] = evaluator_create(fx);
		assert(expressoes[i]);
        // fprintf(output, "%s\n", fx);
	}

    // Aproximacao inicial
    incognitas = (double *)malloc(n * sizeof(double));
	if ( incognitas == NULL ){
		fprintf(stderr, "Erro ao alocar memoria em \"le_input\"");
		abort();
	}
	for (int i = 0; i < n; i++){
		fscanf(input, "%lf", &incognitas[i]);
        // fprintf(stdout, "%lf\n", incognitas[i]);
	}

    fscanf(input, "%lf", epsilon);
    fscanf(input, "%u\n", max_iter);

	return aloca_sistema_nao_linear(n, expressoes, incognitas);
}
