#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <matheval.h>
#include <math.h>

#define BUFFER_SIZE 256


union ULP {
    double floating_point;
    int64_t integer;
};


// Le entrada padrao
void read_input(char *fx, double *x0, double *epsilon, int *max_iter){
    scanf("%s", fx);
    scanf("%lf", x0);
    scanf("%lf", epsilon);
    scanf("%d", max_iter);
}


// Calcula o ULP (units in the last place)
int64_t calc_ULP(double secante_x, double newton_x){
    union ULP secante_u;
    union ULP newton_u;
    int64_t ulps;

    // Uniao foi usada para interpretar o double como integer
    secante_u.floating_point = secante_x;
    newton_u.floating_point = newton_x;

    // Quantidade de numeros representaveis entre eles
    ulps = fabs(secante_u.integer - newton_u.integer);
    if (ulps > 0)
        ulps = ulps - 1;
    return ulps;
}


// EA: erro absoluto da aproximacao obtida pelo metodo da Secante em relacao a aproximacao obtida pelo metodo de Newton-Raphson;
double calc_erro_abs(double aprox_secante, double aprox_newton){
	return fabs(aprox_secante - aprox_newton);
}


// ER: erro relativo da aproximacao obtida pelo metodo da Secante em relacao a aproximacao obtida pelo metodo de Newton-Raphson;
double calc_erro_rel(double erro_absoluto, double aprox_secante){
	return erro_absoluto / fabs(aprox_secante);
}


// Criterio de parada escolhido: erro relativo aproximado (ERa)
double calc_crit_parada(double x_atual, double x_anterior){
    return fabs((x_atual - x_anterior) / x_atual) * 100;
}


// Calcula o proximo valor
double calc_new_x(double x, double numerador, double denominador){
    return x - (numerador/denominador);
}


int main(){
    char *print_format = "%d, %1.16e, %1.16e, %1.16e, %1.16e, %1.16e, %1.16e, %ld\n";

    char fx[BUFFER_SIZE];
    double x0, epsilon;
    int max_iter;

    read_input(fx, &x0, &epsilon, &max_iter);

    // Processa a funcao dada e sua derivada
    void *f, *f_deriv;
    f = evaluator_create(fx);
    f_deriv = evaluator_derivative_x(f);

    // Declara variaveis - Newton-Raphson
    int newton_stop = 0;
    double newton_x, newton_x_new, newton_x_prev, newton_crit;
    newton_x = x0;
    newton_x_prev = x0;
    newton_crit = epsilon;

	// Declara variaveis - Secante
	int secante_stop = 0;
	double secante_x_new, secante_x, secante_x_prev, secante_crit;
	secante_x_prev = x0;
	secante_x = 0;
	secante_crit = epsilon;

    // Declara variaveis - Loop
    int i = 0;
    int is_last_iter = i == max_iter;
    double f_value, f_deriv_value;
	double erro_abs = 0, erro_rel = 0;
    int64_t ulps;

    while(!is_last_iter && !newton_stop && !secante_stop){
        printf(print_format, i, newton_x, newton_crit, secante_x_prev, secante_crit, erro_abs, erro_rel, ulps);
		// Newton
		if (!newton_stop){
            // Calcula funcao de iteracao do metodo de Newton-Raphson
            f_value = evaluator_evaluate_x(f, newton_x);
            f_deriv_value = evaluator_evaluate_x(f_deriv, newton_x);
            if (fabs(f_deriv_value) < epsilon){
                f_deriv_value = evaluator_evaluate_x(f_deriv, newton_x_prev);
            }
            newton_x_new = calc_new_x(newton_x, f_value, f_deriv_value);

            // Confere criterio de parada
            newton_crit = calc_crit_parada(newton_x_new, newton_x);
            newton_stop = newton_crit < epsilon;

            // Atualiza valor
            newton_x_prev = newton_x;
            newton_x = newton_x_new;
        }

		// Secante
        if (!secante_stop){
			if (i == 0){
				secante_x = newton_x;
			}
            // Calcula funcao de iteracao do metodo da secante
			f_value = evaluator_evaluate_x(f, secante_x)*(secante_x-secante_x_prev);
			double temp = (evaluator_evaluate_x(f, secante_x)-evaluator_evaluate_x(f, secante_x_prev));
            if (fabs(temp) < epsilon){
                temp = evaluator_evaluate_x(f, secante_x)/2;
            }

            secante_x_new = calc_new_x(secante_x, f_value, temp);

            // Confere criterio de parada
            secante_crit = calc_crit_parada(secante_x, secante_x_prev);
            secante_stop = secante_crit < epsilon;

            // Atualiza valores
			secante_x_prev = secante_x;
			secante_x = secante_x_new;
		}

		erro_abs = calc_erro_abs(secante_x_prev, newton_x);
		erro_rel = calc_erro_rel(erro_abs, secante_x_prev);
        ulps = calc_ULP(secante_x_prev, newton_x);

		i++;
        is_last_iter = i == max_iter;
    };

    printf(print_format, i, newton_x, newton_crit, secante_x_prev, secante_crit, erro_abs, erro_rel, ulps);

    // Destroi evaluators
    evaluator_destroy(f);
    evaluator_destroy(f_deriv);

    return 0;
}