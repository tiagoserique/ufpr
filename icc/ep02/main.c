
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <matheval.h>
#include <math.h>
#include <sys/time.h>
#include "gauss-seidel.h"
#include "utils.h"


int main(){
	// char *formato_saida = "N = %ld; K = %ld; EPSILON = %1.6e; ITER = %ld;\n";
	// char *formato_solucao = "solucao: %1.6e %1.6e %1.6e %1.6e %1.6e %1.6e\n";
	double tempo;
	double epsilon;					// tolerância no método de Gauss-Seidel.
	unsigned int max_iter;			// número máximo de iterações.
	SisLinear_T *sistema_linear = aloca_SL();

	read_input(sistema_linear, &epsilon, &max_iter);

    tempo = timestamp();
	
	// while (){
	// 	gauss_seidel();
	// }
    
	tempo = timestamp() - tempo;

	// printf(formato_saida, sistema_linear->n, sistema_linear->k, epsilon, max_iter);
	// printf(formato_solucao, );
	printf("tempo: %1.6e", tempo);


	// for (int i = 0; i < sistema_linear->n; i++)
	// 	printf("%1.6e ", evaluator_evaluate_x(sistema_linear->fx[i], 1));
	// printf("\n");

	destroi_sl(sistema_linear);
	return EXIT_SUCCESS;
}