#ifndef __NEWTON__
#define __NEWTON__

// Criterio de parada escolhido: erro relativo aproximado (ERa)
double calc_crit_stop(double x_atual, double x_anterior);

// Criterio de parada escolhido: erro relativo aproximado (ERa)
double calc_new_x(double x, double numerador, double denominador);

// calcula o metodo de newton 
void newtonMetod(void *f, void* f_deriv, double epsilon, double *newton_x, 
double *newton_x_prev, double *newton_crit, int *newton_stop);


#endif