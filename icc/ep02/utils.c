
#include "utils.h"


void imprime_sistema(SisLinear_T *sl){
	for (int i = 0; i < sl->n; i++){
		for (int j = 0; j < sl->n; j++)
			printf("%lf ", sl->coeficientes[i][j]);
		pritnf("\n");
	}
	pritnf("\n");
}


void gera_sistema_linear(SisLinear_T *sl){

}


// 
void ajusta_sistema_linear(SisLinear_T *sl){
	// aloca um vetor de n ponteiros para linhas
	sl->coeficientes = malloc(sl->n * sizeof (double *));
	
	// aloca um vetor com todos os elementos da matriz
	sl->coeficientes[0] = sl->matriz = calloc(sl->n * sl->n, sizeof(double));
	
	// ajusta os demais ponteiros de linhas (i > 0)
	for (int i = 1; i < sl->n; i++)
		sl->coeficientes[i] = sl->coeficientes[0] + i * sl->n;
}


// destroi o sl
void destroi_SL(SisLinear_T *sl){
	for (int i = 0; i < sl->n; i++)
		free(sl->fx[i]);
	free(sl);
}


// aloca uma regiao de memoria para o sl
SisLinear_T *aloca_SL(){
	// aloca um vetor de ponteiros void de 
	// tamanho n para receber as funcoes do sl 
	return (SisLinear_T *)malloc(sizeof(SisLinear_T));
}


// le a os dados de entrada
void read_input(SisLinear_T *sl, double *epsilon, unsigned int *max_iter){
	// dimensao do SL
	scanf(" %ld", &sl->n);
	
	// número de diagonais (sempre um número ímpar, k < n)
    scanf(" %ld", &sl->k);
    
	// string da expressão da função fi(x), sem espaços, na variável x.
	char fx[SIZE_BUFFER + 1];

	sl->fx = (int **)malloc(sl->n * sizeof(void *));
	
	for (int i = 0; i < sl->n; i++){
		scanf(" %s", fx);
		sl->fx[i] = evaluator_create(fx);
	}

	// tolerância no método de Gauss-Seidel
    scanf(" %lf", epsilon);
	
	// número máximo de iterações
    scanf(" %ld", max_iter);
}


// /  Retorna tempo em milisegundos
double timestamp(void){
	struct timeval tp;
	gettimeofday(&tp, NULL);
	return((double)(tp.tv_sec*1000.0 + tp.tv_usec/1000.0));
}