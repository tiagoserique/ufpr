#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <matheval.h>
#include <math.h>
#include "newton.h"

#define BUFFER_SIZE 256

void read_input(char *fx, double *x0, double *epsilon, int *max_iter){
    scanf("%s", fx);
    scanf("%lf", x0);
    scanf("%lf", epsilon);
    scanf("%d", max_iter);
}

int main(){
    char fx[BUFFER_SIZE];
	char *print_format = "%d, %1.16e, %1.16e\n";
    
	// Declara variaveis - Newton
	int newton_stop;
	double newton_x, newton_x_prev, newton_crit;

	// Declara variaveis - Loop
	int max_iter, i, is_last_iter;
	
	// Declara variaveis - Funcao dada e derivada
    void *f, *f_deriv;
	double x0, epsilon;
    
	// Recebe os dados
	read_input(fx, &x0, &epsilon, &max_iter);

    // Processa a funcao dada e sua derivada
    f = evaluator_create(fx);
    f_deriv = evaluator_derivative_x(f);

	// Atribui valores - Newton
	newton_stop 	= 0;
	newton_x 		= x0;
    newton_x_prev 	= x0;
    newton_crit 	= epsilon;

	// Atribui valores - Loop
	i = 0;
	is_last_iter = i == max_iter;

	while (!is_last_iter && !newton_stop){
		// printf(print_format, i, newton_x, newton_crit);
		
		// if (!newton_stop)
			newtonMetod(f, f_deriv, epsilon, &newton_x, &newton_x_prev, 
													&newton_crit, &newton_stop);
	


		i++;
		is_last_iter = i == max_iter;
	}

	return EXIT_SUCCESS;
}