#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <matheval.h>
#include <math.h>
#include "newton.h"

// Criterio de parada escolhido: erro relativo aproximado (ERa)
double calc_crit_stop(double x_atual, double x_prev){
    return fabs((x_atual - x_prev) / x_atual) * 100;
}


// Calcula o proximo valor
double calc_new_x(double x, double numerador, double denominador){
    return x - (numerador/denominador);
}

// calcula metodo de newton
void newtonMetod(void *f, void* f_deriv, double epsilon, double *newton_x, 
double *newton_x_prev, double *newton_crit, int *newton_stop){

	// Calcula funcao de iteracao do metodo de Newton-Raphson
	double f_value = evaluator_evaluate_x(f, *newton_x);
	double f_deriv_value = evaluator_evaluate_x(f_deriv, *newton_x);
	
	if (fabs(f_deriv_value) < epsilon){
		f_deriv_value = evaluator_evaluate_x(f_deriv, *newton_x_prev);
	}
	
	double newton_x_new = calc_new_x(*newton_x, f_value, f_deriv_value);

	// Confere criterio de parada
	*newton_crit = calc_crit_stop(newton_x_new, *newton_x);
	*newton_stop = *newton_crit < epsilon;

	// Atualiza valor
	*newton_x_prev = *newton_x;
	*newton_x = newton_x_new;

	return;
}