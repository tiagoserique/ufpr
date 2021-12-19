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
	double maior = vetor[0];

	for (int i = 1; i < n; i++)
		if ( maior - vetor[i] < __DBL_EPSILON__ )
			maior = vetor[i];

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
int calcula_termos_indep(double *termos_indep, double *incognitas, 
int **expressoes, uint n){
	
	int count 		= 0;
	char **names 	= (char **)malloc(n * SIZE_BUFFER);

	for (int linha = 0; linha < n; linha++){
		evaluator_get_variables(expressoes[linha], &names, &count);
		
		double *valores 		= obtem_variaveis(n, incognitas, names, count);
		if ( !valores ){
			free(names);
			return EXIT_FAILURE;
		}

		termos_indep[linha] 	= - evaluator_evaluate(expressoes[linha], count,
														 		names, valores);
		free(valores);
	}
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
void termina_newton(double *delta, double **result_jacobiana, double *newton_time){
	free(delta);
	free(result_jacobiana);
	*newton_time = timestamp() - *newton_time;
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
	double *delta = (double *)calloc(snl->n, sizeof(double));
	if ( !delta ){
		fprintf(stderr, "Erro ao alocar memoria em \"newtonMetod\"");
		*newton_time = timestamp() - *newton_time;
		return EXIT_FAILURE;
	}

	// Aloca matriz com os resultados das derivadas parciais
	double **result_jacobiana = aloca_result_jacobiana(snl->n);
	if ( !result_jacobiana ){
		fprintf(stderr, "Erro ao alocar memoria em \"newtonMetod\"");
		free(delta);
		*newton_time = timestamp() - *newton_time;
		return EXIT_FAILURE;
	}

	double *termos_aux = (double *)malloc(snl->n * sizeof(double));

	for (int iter = 0; iter <= max_iter; iter++){
		// resolva o sl J(X^(i)) * delta^(i) = - F(X^(i))

		// Calcula os termos independentes - F(X^(i))
		ret = calcula_termos_indep(snl->termos_indep, snl->incognitas, snl->expressoes, snl->n);
		if ( ret ){
			fprintf(stderr, "Erro ao calcular termos independentes em \"calcula_termos_indep\"");
			termina_newton(delta, result_jacobiana, newton_time);
			return EXIT_FAILURE; 
		}

		for (int i = 0; i < snl->n; i++)
			termos_aux[i] = fabs(snl->termos_indep[i]);

		// Se ||F(X^(i))|| < epsilon devolva X^(i)
		max = acha_norma(termos_aux, snl->n);
		if ( fabs(max) < epsilon ){
			imprime_x(output, snl->incognitas, snl->n);
			termina_newton(delta, result_jacobiana, newton_time);
			return EXIT_SUCCESS;
		}

		imprime_x(output, snl->incognitas, snl->n);

		// Calculo dos valores da jacobiana J(X^(i))
		jacobiana_time_aux = timestamp();
		LIKWID_MARKER_START("jacobiana");
		ret = calcula_jacobiana(snl->derivadas, snl->incognitas, result_jacobiana, snl->n);
		LIKWID_MARKER_STOP("jacobiana");
		*jacobiana_time += timestamp() - jacobiana_time_aux;
		if ( ret ){
			fprintf(stderr, "Erro ao calcular a jacobiana em \"calcula_jacobiana\"");
			termina_newton(delta, result_jacobiana, newton_time);
			return EXIT_FAILURE; 
		}

		// Resolver o sistema linear para encontrar o delta^(i)
		sl_time_aux = timestamp();
		LIKWID_MARKER_START("gauss");
		ret = eliminacao_gauss(result_jacobiana, snl->termos_indep, snl->n);
		*sl_time += timestamp() - sl_time_aux;
		if ( ret ){
			termina_newton(delta, result_jacobiana, newton_time);
			return EXIT_FAILURE; 
		}

		// Retrossubstituicao
		ret = retrossub(result_jacobiana, snl->termos_indep, delta, snl->n);
		LIKWID_MARKER_STOP("gauss");
		if ( ret ){
			termina_newton(delta, result_jacobiana, newton_time);
			return EXIT_FAILURE; 
		}

		// Atualiza os valores das incognitas
		for (int i = 0; i < snl->n; i++){
			snl->incognitas[i] += delta[i];  // X^(i+1) = X^(i) + delta^(i)
			delta[i] = fabs(delta[i]);
		}

		// Se ||delta^(i)|| < epsilon devolva X^(i+1)
		max = acha_norma(delta, snl->n);
		if ( fabs(max) < epsilon ){
			imprime_x(output, snl->incognitas, snl->n);
			termina_newton(delta, result_jacobiana, newton_time);
			return EXIT_SUCCESS;
		}
	}

	termina_newton(delta, result_jacobiana, newton_time);
	return EXIT_SUCCESS;
}
