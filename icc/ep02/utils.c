
#include "utils.h"


// Imprime o tempo que o metodo de gauss-seidel demorou para solucionar o 
// sistema linear
void imprime_tempo(double tempo){
	printf("tempo: %lf\n", tempo);
}

// Imprime as k diagonais do sistema linear
void imprime_diagonais(SisLinear_T *sl){
	int qual_vetor;
	int tamanho = sl->n - ( sl->k - 1 )/2;

	for (qual_vetor = 0; qual_vetor <= (sl->k - 1)/2; qual_vetor++){
		for (int tam = 0; tam < tamanho ; tam++){
			printf("%lf ", sl->coeficientes[qual_vetor][tam]);
		}
		printf("\n");
		tamanho++;
	}

	tamanho -= 2;
	for (int qual_vetor2 = qual_vetor; qual_vetor2 < sl->k; qual_vetor2++){
		for (int tam = 0; tam < tamanho ; tam++){
			printf("%lf ", sl->coeficientes[qual_vetor][tam]);
		}
		printf("\n");
		tamanho--;
	}
}


// Imprime a solucao encontrada por gauss-seidel
void imprime_solucao(double *vet, int n){
	printf("----\nsolucao: ");
	for (int i = 0; i < n; i++)
		printf("%lf ", vet[i]);
	printf("\n");
}


// Imprime os termos independentes gerados para o sistema linear
void imprime_termos_indep(SisLinear_T *sl){
	for (int i = 0; i < sl->n; i++)
		printf("%lf ", evaluator_evaluate_x(sl->fx[sl->k], (double)(i)));
	printf("\n");
}


// Gera os valores das k diagonais
void gera_sistema_linear(SisLinear_T *sl){
	int qual_vetor;
	int tamanho = sl->n - ( sl->k - 1 )/2;

	for (qual_vetor = 0; qual_vetor <= (sl->k - 1)/2; qual_vetor++){
		for (int tam = 0; tam < tamanho ; tam++){
			double valor = evaluator_evaluate_x(sl->fx[qual_vetor], (double)tam);
			sl->coeficientes[qual_vetor][tam] = valor;
		}
		tamanho++;
	}

	tamanho -= 2;
	for (int qual_vetor2 = qual_vetor; qual_vetor2 < sl->k; qual_vetor2++){
		for (int tam = 0; tam < tamanho ; tam++){
			double valor = evaluator_evaluate_x(sl->fx[qual_vetor2], (double)tam);
			sl->coeficientes[qual_vetor2][tam] = valor;
		}
		tamanho--;
	}
}


// destroi o sl
void destroi_sistema_linear(SisLinear_T *sl){
	for (int i = 0; i <= sl->k; i++)
		free(sl->fx[i]);

	for (int i = 0; i < sl->k; i++)
		free(sl->coeficientes[i]);
	
	free(sl->coeficientes);
	free(sl);
}


// aloca uma regiao de memoria para o sl
SisLinear_T *aloca_sistema_linear(unsigned int n, unsigned int k, int **fx){
	SisLinear_T *sl = (SisLinear_T *)malloc(sizeof(SisLinear_T));
	sl->n = n;
	sl->k = k;
	sl->fx = fx;

	sl->coeficientes = (double **)malloc((sl->k-1) * sizeof (double *));

	// aloca vetores com tamanho variavel
	int inicio 	= n - ( k - 1 )/2;
	int fim 	= n;

	for (int i = inicio, indice = 0; i <= fim && indice <= (k - 1)/2; i++, indice++){
		sl->coeficientes[indice] = (double *)malloc(i * sizeof(double));
	}

	for (int i = fim - 1, indice = (k - 1)/2 + 1; i >= inicio && indice < k; i--, indice++){
		sl->coeficientes[indice] = (double *)malloc(i * sizeof(double));
	}
	
	return sl;
}


// le a os dados de entrada
SisLinear_T *read_input(double *epsilon, unsigned int *max_iter){
	unsigned int n, k;
	int **temp;

	// dimensao do SL
	scanf(" %u", &n);
	// número de diagonais (sempre um número ímpar, k < n)
    scanf(" %u", &k);
	// string da expressão da função fi(x), sem espaços, na variável x.
	char fx[SIZE_BUFFER + 1];

	temp = (int **)malloc((k + 1) * sizeof(void *));
	
	for (int i = 0; i <= k; i++){
		scanf(" %s", fx);
		temp[i] = evaluator_create(fx);
	}

	// tolerância no método de Gauss-Seidel
    scanf(" %lf", epsilon);    
	// número máximo de iterações
    scanf(" %u", max_iter);

	return aloca_sistema_linear(n, k, temp);
}


// Retorna tempo em milisegundos
double timestamp(void){
	struct timeval tp;
	gettimeofday(&tp, NULL);
	return((double)(tp.tv_sec*1000.0 + tp.tv_usec/1000.0));
}