/* Trabalho 1 - CI1164 (2021-1 ERE)
Prof. Dr. Guilherme Alex Derenievicz

Autores:
Tiago Serique Valadares (GRR20195138)
Fernanda Yukari Kawasaki (GRR20185057)
*/

#include "utils.h"


int isPot2(int n){
	int k;
	return (k = log2(n)) == log2(n) ;
}


// /*
// *	Libera a memoria ocupada pela struct SNL_T (sistema nao linear)
// *
// *	@param	snl	apontador para o sistema nao linear
// */
void destroi_snl(SNL_T *snl){
	free(snl->expressoes);
	free(snl->incognitas);
	free(snl->termos_indep);
	free(snl->diagonal_inferior);
	free(snl->diagonal_principal);
	free(snl->diagonal_superior);
	free(snl->diagonal_inferior_result);
	free(snl->diagonal_principal_result);
	free(snl->diagonal_superior_result);
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
SNL_T *aloca_sistema_nao_linear(uint n, void **expressoes, double *incognitas){
	SNL_T *snl = (SNL_T *)malloc(sizeof(SNL_T));
	if ( snl == NULL ){
		fprintf(stderr, "Erro ao alocar memoria em \"aloca_sistema_linear\"");
		abort();
	}

	snl->n = n;
	snl->expressoes	 = expressoes;
	snl->incognitas	 = incognitas;

	// snl->termos_indep = (double *)malloc(sizeof(double) * PAD(n));
	// if ( snl->termos_indep == NULL ){
	// 	fprintf(stderr, "Erro ao alocar memoria em \"aloca_sistema_linear\"");
	// 	abort();
	// }

	// snl->diagonal_inferior 	= (void **)malloc(sizeof(void*) * PAD(n - 1));
	// snl->diagonal_superior 	= (void **)malloc(sizeof(void*) * PAD(n - 1));
	// snl->diagonal_principal = (void **)malloc(sizeof(void*) * PAD(n));

	// snl->diagonal_inferior_result 	= (double *)malloc(sizeof(double) * PAD(n - 1));
	// snl->diagonal_superior_result 	= (double *)malloc(sizeof(double) * PAD(n - 1));
	// snl->diagonal_principal_result 	= (double *)malloc(sizeof(double) * PAD(n));

	// if ( (snl->diagonal_inferior == NULL) || (snl->diagonal_superior == NULL) || (snl->diagonal_principal == NULL) ){
	// 	fprintf(stderr, "Erro ao alocar memoria em \"aloca_sistema_linear\"");
	// 	abort();
	// }

	return snl;
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
void obtem_variaveis(uint n, double *incognitas, char **names, int count, 
double *valores){
	// Obtem os valores das incognitas correspondentes
	// Para x1, retorna o valor de x1 que esta no vetor de incognitas
	for (int indice = 0; indice < count; indice++){
		int linha = atoi(names[indice]+1)-1;
		valores[indice] = incognitas[linha];
	}
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
