
#include "gauss-seidel.h"

// Com base na linha e coluna da iteracao atual de gauss seidel, retorna o valor
// do coeficiente da diagonal desejada
double pega_coeficiente(SisLinear_T *sl, int linha, int coluna){
	int qual_vetor = 0, coeficiente = 0; 
	qual_vetor = (sl->k-1)/2 + linha - coluna;

	// diagonal superior
	if ( linha - coluna <= 0 )
		coeficiente = linha;
	// inferior
	else if ( linha - coluna > 0 )
		coeficiente = coluna;

	return sl->coeficientes[qual_vetor][coeficiente];
}


// Metodo de gauss seidel
double *gauss_seidel(SisLinear_T *sl, unsigned int max_iter, double epsilon){
	// Contem aproximacao inicial
    double *incognitas = calloc(sl->n, sizeof(double));
	// 	criterio de parada quando a norma das incognitas eh menor que epsilon 
	double norma = 1.0 + epsilon;


    for (int iter = 0; norma > epsilon && iter < max_iter; iter++){
		norma = 0.0;
		int max_diagonais;

		for (int i = 0; i < sl->n; i++){
	        double resultado = 0;
			
			// diagonais superiores
			max_diagonais = ((sl->k - 1)/2);
			for (int j = i + 1; ((j < sl->n) && (max_diagonais > 0)); j++)
				if (i != j){
					resultado += pega_coeficiente(sl, i, j) * incognitas[j];
					max_diagonais--;
				}

			// diagonais inferiores
			max_diagonais = ((sl->k - 1) / 2);
			for (int j = i - 1; ((j >= 0) && (max_diagonais > 0)); j--)
				if (i != j){
					resultado += pega_coeficiente(sl, i, j) * incognitas[j];
					max_diagonais--;
				}
			
			// calcula termo independente para com o valor de i
			double termo_indep = evaluator_evaluate_x(sl->fx[sl->k], (double)(i));
			// calcula o xi da próxima iteração
			resultado = termo_indep - resultado;

			resultado = resultado / pega_coeficiente(sl, i, i);
        
			// Diferenca entre o xi (próximo) e o X[i] (atual)
			double diferenca = fabs(resultado - incognitas[i]);
			incognitas[i] = resultado;

			if (diferenca > norma)
				norma = diferenca;
		}
    }
	return incognitas;
}