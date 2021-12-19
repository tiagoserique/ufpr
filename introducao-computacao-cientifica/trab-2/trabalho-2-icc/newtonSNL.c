/* Trabalho 1 - CI1164 (2021-1 ERE)
Prof. Dr. Guilherme Alex Derenievicz

Autores:
Tiago Serique Valadares (GRR20195138)
Fernanda Yukari Kawasaki (GRR20185057)
*/

#include "newtonSNL.h"


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
double acha_norma(double *vetor, uint n){
	double maior = fabs(vetor[0]);

	for (int i = 1; i < n; i++)
		if ( maior - fabs(vetor[i]) < __DBL_EPSILON__ )
			maior = fabs(vetor[i]);

	return maior;
}


/*
*	Calcula os valores de F(X), que sao os termos independentes
*
*	@param	termos_indep	vetor com os termos independentes
*	@param	incognitas		vetor com o valor aproximado das incognitas
*	@param	expressoes		vetor com as expressoes das funcoes
*	@param	n				tamanho do vetor
*
*/ 
int calcula_termos_indep(SNL_T *snl){
	int count 		= 0;
	char **names 	= (char **)malloc(SIZE_BUFFER * PAD(snl->n));
	if (!names){
		fprintf(stderr, "Erro ao alocar memoria em \"calcula_jacobiana\"");
		abort();
	}

	double *valores = (double *)calloc(N_DIAGONAL, sizeof(double));
	if (!valores){
		fprintf(stderr, "Erro ao alocar memoria em \"calcula_jacobiana\"");
		abort();
	}

	for (int linha = 0; linha < snl->n; linha++){
		evaluator_get_variables(snl->expressoes[linha], &names, &count);
		obtem_variaveis(snl->n, snl->incognitas, names, count, valores);
		snl->termos_indep[linha] = - evaluator_evaluate(snl->expressoes[linha], count, names, valores);
	}

	free(valores);
	return EXIT_SUCCESS;
}


/*
*	Funcao que termina o metodo de Newton. Libera a memoria
*	e para o contador de tempo.
*
*	@param	delta				vetor a ser liberado
*	@param	result_jacobiana	matriz a ser liberada
*	@param	newton_time			tempo gasto para o metodo de Newton
*
*/
// void termina_newton(double *delta, double **result_jacobiana, double *newton_time){
// 	free(delta);
// 	*newton_time = timestamp() - *newton_time;
// }


void imprime_diagonal(SNL_T *snl){
	printf("Diagonal principal\n");
	for (int i = 0; i < snl->n; i++)
		printf("%lf ", snl->diagonal_principal_result[i]);
	printf("\n\n");
	printf("Diagonal inferior\n");
	for (int i = 0; i < snl->n-1; i++)
		printf("%lf ", snl->diagonal_inferior_result[i]);
	printf("\n\n");
	printf("Diagonal superior\n");
	for (int i = 0; i < snl->n-1; i++)
		printf("%lf ", snl->diagonal_superior_result[i]);
	printf("\n");
}

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
int newtonMetod(SNL_T *snl, double epsilon, uint max_iter, double *jacobiana_time,
 double *sl_time, double *newton_time, FILE *output){
	*newton_time = timestamp();
	double jacobiana_time_aux, sl_time_aux;
	double max 	= 0;

	int ret 	= 0;

	// Aloca vetor delta
	double *delta = (double *)calloc(PAD(snl->n), sizeof(double));
	if ( !delta ){
		fprintf(stderr, "Erro ao alocar memoria em \"newtonMetod\"");
		*newton_time = timestamp() - *newton_time;
		return EXIT_FAILURE;
	}

	// Aloca vetor de termos indepententes
	snl->termos_indep = (double *)malloc(sizeof(double) * PAD(snl->n));
	if ( snl->termos_indep == NULL ){
		fprintf(stderr, "Erro ao alocar memoria em \"newtonMetod\"");
		abort();
	}


	// Aloca espaço para as diagonais dos calculos resultantes da matriz jacobiana
	snl->diagonal_principal_result = (double *)malloc(sizeof(double) * PAD(snl->n));
	snl->diagonal_inferior_result = (double *)malloc(sizeof(double) * PAD(snl->n - 1));
	snl->diagonal_superior_result = (double *)malloc(sizeof(double) * PAD(snl->n - 1));
	if ( (snl->diagonal_principal_result == NULL) 
	|| (snl->diagonal_inferior_result == NULL) 
	|| (snl->diagonal_superior_result == NULL) ){
		fprintf(stderr, "Erro ao alocar memoria em \"newtonMetod\"");
		abort();
	}

	for (int iter = 0; iter <= max_iter; iter++){
		// Calcula os termos independentes - F(X^(i))
		ret = calcula_termos_indep(snl);
		if ( ret ){
			fprintf(stderr, "Erro ao calcular termos independentes em \"calcula_termos_indep\"");
			free(delta);
			*newton_time = timestamp() - *newton_time;
			return EXIT_FAILURE; 
		}


		// Se ||F(X^(i))|| < epsilon devolva X^(i)
		max = acha_norma(snl->termos_indep, snl->n);
		if ( max < epsilon ){
			imprime_x(output, snl->incognitas, snl->n);
			free(delta);
			*newton_time = timestamp() - *newton_time;
			return EXIT_SUCCESS;
		}


		imprime_x(output, snl->incognitas, snl->n);


		// Calculo dos valores da jacobiana J(X^(i))
		jacobiana_time_aux = timestamp();
		LIKWID_MARKER_START("jacobiana");
		ret = calcula_jacobiana(snl);
		LIKWID_MARKER_STOP("jacobiana");

		*jacobiana_time += timestamp() - jacobiana_time_aux;
		if ( ret ){
			fprintf(stderr, "Erro ao calcular a jacobiana em \"calcula_jacobiana\"");
			free(delta);
			*newton_time = timestamp() - *newton_time;
			return EXIT_FAILURE; 
		}


		// Resolver o sistema linear para encontrar o delta^(i)
		// Resolve o sl J(X^(i)) * delta^(i) = - F(X^(i))
		sl_time_aux = timestamp();
		LIKWID_MARKER_START("gauss");
		eliminacao_gauss(snl, delta);
		LIKWID_MARKER_STOP("gauss");
		*sl_time += timestamp() - sl_time_aux;
		

		// Atualiza os valores das incognitas
		for (int i = 0; i < snl->n; i++){
			snl->incognitas[i] += delta[i];  // X^(i+1) = X^(i) + delta^(i)
		}


		// Se ||delta^(i)|| < epsilon devolva X^(i+1)
		max = acha_norma(delta, snl->n);
		if ( max < epsilon ){
			imprime_x(output, snl->incognitas, snl->n);
			free(delta);
			*newton_time = timestamp() - *newton_time;
			return EXIT_SUCCESS;
		}
	}

	free(delta);
	*newton_time = timestamp() - *newton_time;
	return EXIT_SUCCESS;
}
