#ifndef __GAUSS_SEIDEL__
#define __GAUSS_SEIDEL__

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <matheval.h>
#include <math.h>
#include "utils.h"


// Com base na linha e coluna da iteracao atual de gauss seidel, retorna o valor
// do coeficiente da diagonal desejada
double pega_coeficiente(SisLinear_T *sl, int linha, int coluna);

// Metodo de gauss seidel
double *gauss_seidel(SisLinear_T *sl, unsigned int max_iter, double epsilon);

#endif