/* Trabalho 1 - CI1164 (2021-1 ERE)
Prof. Dr. Guilherme Alex Derenievicz

Autores:
Tiago Serique Valadares (GRR20195138)
Fernanda Yukari Kawasaki (GRR20185057)
*/

#include "jacobiana.h"


int calcula_jacobiana(SNL_T *snl){
	char **names = (char **)malloc(SIZE_BUFFER * N_DIAGONAL);
	if (!names){
		fprintf(stderr, "Erro ao alocar memoria em \"calcula_jacobiana\"");
		abort();
	}

	int count 		= 0;

	double *valores = (double *)calloc(N_DIAGONAL, sizeof(double));
	if (!valores){
		fprintf(stderr, "Erro ao alocar memoria em \"calcula_jacobiana\"");
		abort();
	}
	

	for (int i = 0; i < snl->n; i++){
		evaluator_get_variables(snl->diagonal_principal[i], &names, &count);
		obtem_variaveis(snl->n, snl->incognitas, names, count, valores);
		snl->diagonal_principal_result[i] = evaluator_evaluate(snl->diagonal_principal[i], count, names, valores);
	}
	
	for (int i = 0; i < (snl->n - 1); i++){
		evaluator_get_variables(snl->diagonal_superior[i], &names, &count);
		obtem_variaveis(snl->n, snl->incognitas, names, count, valores);
		snl->diagonal_superior_result[i] = evaluator_evaluate(snl->diagonal_superior[i], count, names, valores);

		// printf("%s = %lf\n", evaluator_get_string(snl->diagonal_superior[i]), snl->diagonal_superior_result[i]);

		evaluator_get_variables(snl->diagonal_inferior[i], &names, &count);
		obtem_variaveis(snl->n, snl->incognitas, names, count, valores);
		snl->diagonal_inferior_result[i] = evaluator_evaluate(snl->diagonal_inferior[i], count, names, valores);

		// printf("snl->diagonal_inferior_result[%d] = %lf\n", i-1, snl->diagonal_inferior_result[i-1]);
	}
	
	free(valores);

	return EXIT_SUCCESS;
}


int gera_matriz_derivadas(SNL_T *snl, double *deriv_time){
	char xi[SIZE_BUFFER + 1];
	char x0[SIZE_BUFFER + 1];
	char x1[SIZE_BUFFER + 1];
	char x2[SIZE_BUFFER + 1];
	char x3[SIZE_BUFFER + 1];

	int tam	= 0;
	int m 	= N_UNROLL;	 

	*deriv_time = timestamp();

	snl->diagonal_inferior 	= (void **)malloc(sizeof(void*) * PAD(snl->n - 1));
	snl->diagonal_superior 	= (void **)malloc(sizeof(void*) * PAD(snl->n - 1));
	if ( (snl->diagonal_inferior == NULL) || (snl->diagonal_superior == NULL) ){
		fprintf(stderr, "Erro ao alocar memoria em \"gera_matriz_derivadas\"");
		abort();
	}

	tam = (snl->n - 1) - ( (snl->n - 1) % N_UNROLL);
	for (int i = 0; i < tam; i+= m){
		sprintf(x0, "x%d", (i    ) + 2);
		sprintf(x1, "x%d", (i + 1) + 2);
		sprintf(x2, "x%d", (i + 2) + 2);
		sprintf(x3, "x%d", (i + 3) + 2);
		snl->diagonal_superior[i    ] = evaluator_derivative(snl->expressoes[i    ], x0);
		snl->diagonal_superior[i + 1] = evaluator_derivative(snl->expressoes[i + 1], x1);
		snl->diagonal_superior[i + 2] = evaluator_derivative(snl->expressoes[i + 2], x2);
		snl->diagonal_superior[i + 3] = evaluator_derivative(snl->expressoes[i + 3], x3);

		sprintf(x0, "x%d", (i    ) + 1);
		sprintf(x1, "x%d", (i + 1) + 1);
		sprintf(x2, "x%d", (i + 2) + 1);
		sprintf(x3, "x%d", (i + 3) + 1);
		snl->diagonal_inferior[i    ] = evaluator_derivative(snl->expressoes[i + 1], x0);
		snl->diagonal_inferior[i + 1] = evaluator_derivative(snl->expressoes[i + 2], x1);
		snl->diagonal_inferior[i + 2] = evaluator_derivative(snl->expressoes[i + 3], x2);
		snl->diagonal_inferior[i + 3] = evaluator_derivative(snl->expressoes[i + 4], x3);
	}

	for (int i = tam; i < snl->n - 1; ++i){
		sprintf(xi, "x%d", i + 2);
		snl->diagonal_superior[i] = evaluator_derivative(snl->expressoes[i], xi);
		sprintf(xi, "x%d", i + 1);
		snl->diagonal_inferior[i] = evaluator_derivative(snl->expressoes[i + 1], xi);
	}


	// Diagonal principal
	snl->diagonal_principal = (void **)malloc(sizeof(void*) * PAD(snl->n));
	if ( (snl->diagonal_principal == NULL) ){
		fprintf(stderr, "Erro ao alocar memoria em \"gera_matriz_derivadas\"");
		abort();
	}


	tam	 = snl->n - ( snl->n % N_UNROLL);
	for (int i = 0; i < tam; i += m){
		sprintf(x0, "x%d", (i    ) + 1);
		sprintf(x1, "x%d", (i + 1) + 1);
		sprintf(x2, "x%d", (i + 2) + 1);
		sprintf(x3, "x%d", (i + 3) + 1);
		
		snl->diagonal_principal[i    ] = evaluator_derivative(snl->expressoes[i    ], x0);
		snl->diagonal_principal[i + 1] = evaluator_derivative(snl->expressoes[i + 1], x1);
		snl->diagonal_principal[i + 2] = evaluator_derivative(snl->expressoes[i + 2], x2);
		snl->diagonal_principal[i + 3] = evaluator_derivative(snl->expressoes[i + 3], x3);
	}

	for (int i = tam; i < snl->n; ++i){
		sprintf(xi, "x%d", i + 1);
		snl->diagonal_principal[i] = evaluator_derivative(snl->expressoes[i], xi);
	}

	*deriv_time = timestamp() - *deriv_time;

	return EXIT_SUCCESS;
}


