/*======================================*/
/*= Autor: Tiago Serique Valadares     =*/
/*= GRR: 20195138				       =*/
/*= Disciplina: Aprendizado de Maquina =*/
/*======================================*/


#ifndef __KNN__
#define __KNN__


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>


typedef struct Data {
	int label;
	double *features;
} Data;


double euclideanDistance();

void printConfusionMatrix();


#endif