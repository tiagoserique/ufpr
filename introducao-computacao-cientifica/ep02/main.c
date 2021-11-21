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
	double tempo;
	double epsilon;					// tolerância no método de Gauss-Seidel.
	double * incognitas;
	unsigned int max_iter;			// número máximo de iterações.
	SisLinear_T *sistema_linear;
	
	sistema_linear = read_input(&epsilon, &max_iter);
	gera_sistema_linear(sistema_linear);

	tempo = timestamp();
	incognitas = gauss_seidel(sistema_linear, max_iter, epsilon);
	tempo = timestamp() - tempo;

	imprime_diagonais(sistema_linear);
	imprime_termos_indep(sistema_linear);
	imprime_solucao(incognitas, sistema_linear->n);
	imprime_tempo(tempo);

	destroi_sistema_linear(sistema_linear);
	return EXIT_SUCCESS;
}