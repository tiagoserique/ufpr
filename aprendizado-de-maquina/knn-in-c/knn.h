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
	double distance;
} Data;


int classification(Data *k_nearest, int len, int n_classes);

void sortNeighborsArray(Data *array, int len);

void euclideanDistance(Data *train_data, Data *test_data, int num_features);

void knn(int **confusion_matrix, Data *train_data, Data *test_data, int k, 
int train_n_lines, int test_num_lines, int num_features, int num_classes);

void printConfusionMatrix(int **confusion_matrix, int n_classes);

void calculateAccuracy(int ** confusion_matrix, int n_classes);

#endif