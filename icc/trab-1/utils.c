/* Trabalho 1 - CI1164 (2021-1 ERE)
Prof. Dr. Guilherme Alex Derenievicz

Autores:
Tiago Serique Valadares (GRR20195138)
Fernanda Yukari Kawasaki (GRR20185057)
*/

#include "utils.h"


/*
*	Libera a memoria ocupada pela struct SNL_T (sistema nao linear)
*
*	@param	snl	apontador para o sistema nao linear
*/
void destroi_snl(SNL_T *snl){
	free(snl->expressoes);
	free(snl->incognitas);
	free(snl->termos_indep);
	free(snl->derivadas);
	free(snl);
}


/*
*	Aloca espaco na memoria para o sistema nao linear
*
*	@param	n			dimensao do sistema
*	@param	expressoes	expressoes das funcoes nao lineares
*	@param	incognitas	vetor com aproximacao inicial das incognitas
*
*	@return	struct do sistema nao linear
*/ 
SNL_T *aloca_sistema_nao_linear(uint n, int **expressoes, double *incognitas){
	SNL_T *snl = (SNL_T *)malloc(sizeof(SNL_T));
	if ( snl == NULL ){
		fprintf(stderr, "Erro ao alocar memoria em \"aloca_sistema_linear\"");
		abort();
	}

	snl->n = n;
	snl->expressoes	 = expressoes;
	snl->incognitas	 = incognitas;

	snl->termos_indep	 = (double *)malloc(n * sizeof(double));
	if ( snl->termos_indep == NULL ){
		fprintf(stderr, "Erro ao alocar memoria em \"aloca_sistema_linear\"");
		abort();
	}

	snl->derivadas = (void ***)malloc(n * sizeof(void **) + n * n * sizeof(void *));
	if ( snl->derivadas == NULL ){
		fprintf(stderr, "Erro ao alocar memoria em \"aloca_sistema_linear\"");
		abort();
	}

	// Ajustando ponteiros para as derivadas
	snl->derivadas[0] = (void **)(snl->derivadas + n);
	for (int i = 1; i < n; i++){
  		snl->derivadas[i] = snl->derivadas[0] + (i * n);
	}

	return snl;
}


/*
*	Aloca espaco para os resultados da jacobiana
*
*	@param	n	dimensao do sistema
*
*	@return 	matriz alocada
*
*/
double **aloca_result_jacobiana(uint n){
	double **result_jacobiana = (double **)malloc(n * sizeof(double *) + 
												n * n * sizeof(double));

	// Ajustando ponteiros para a jacobiana
	result_jacobiana[0] = (double *)(result_jacobiana + n) ;
	for (int i = 1; i < n; i++)
  		result_jacobiana[i] = result_jacobiana[0] + (i * n) ;
	
	// Incializando jacobiana
	for (int i = 0; i < n; i++)
		for (int j = 0; j < n; j++)
			result_jacobiana[i][j] = 0;

	return result_jacobiana;
}


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
double *obtem_variaveis(uint n, double *incognitas, char **names, int count){
	double *variaveis = (double *)calloc(n, sizeof(double));
	if (!variaveis){
		fprintf(stderr, "Erro ao alocar memoria em \"obtem_variaveis\"");
		abort();
	}

	// Obtem os valores das incognitas correspondentes
	// Para x1, retorna o valor de x1 que esta no vetor de incognitas
	for (int indice = 0; indice < count; indice++){
		int linha = atoi(names[indice]+1)-1;
		variaveis[indice] = incognitas[linha];
	}
	return variaveis;
}


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
double tempo_jacobiana, double tempo_sl){
	fprintf(output, "###########\n");
	fprintf(output, "# Tempo Total: %lf\n", tempo_total);
	fprintf(output, "# Tempo Derivadas: %lf\n", tempo_derivadas);
	fprintf(output, "# Tempo Jacobiana: %lf\n", tempo_jacobiana);
	fprintf(output, "# Tempo SL: %lf\n", tempo_sl);
	fprintf(output, "###########\n\n");
}


/*
*	Imprime os valores aproximados das incognitas
*
*	@param	output		apontador para o arquivo de saida
*	@param	xi			vetor com os valores das incognitas
*	@param	n			dimensao do sistema
*
*/
void imprime_x(FILE *output, double *xi, uint n){
	fprintf(output, "#\n");

	for (int i = 0; i < n; i++)
		fprintf(output, "x%d = %lf\n", i+1, xi[i]);
}


/*
*	Imprime as expressoes
*
*	@param	output		apontador para o arquivo de saida
*	@param	snl			sistema nao linear
*
*/
void imprime_expressoes(FILE *output, SNL_T * snl){
	fprintf(output, "%u\n", snl->n);
	for (int i = 0; i < snl->n; i++)
		fprintf(output, "%s = 0\n", evaluator_get_string(snl->expressoes[i]));
}


/*
*	Retorna tempo em milisegundos
*
*	@return tempo em milisegundos
*/
double timestamp(void){
	struct timeval tp;
	gettimeofday(&tp, NULL);
	return((double)(tp.tv_sec*1000.0 + tp.tv_usec/1000.0));
}
