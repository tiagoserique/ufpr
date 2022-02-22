/*==================================*/
/*= Autor: Tiago Serique Valadares =*/
/*= GRR: 20195138				   =*/
/*= Disciplina: Otimizacao		   =*/
/*==================================*/


#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "knn.h"




double euclideanDistance(int x1, int y1, int x2, int y2){

	double x = x1 - x2;
	double y = y1 - y2;

	return pow(x, 2) + pow(y, 2);
	// return sqrt(pow(x, 2) + pow(y, 2));
}