/*======================================*/
/*= Autor: Tiago Serique Valadares     =*/
/*= GRR: 20195138				       =*/
/*= Disciplina: Aprendizado de Maquina =*/
/*======================================*/


#include "knn.h"


int classification(Data *k_nearest, int len, int n_classes){
	int count[n_classes];
	int higher = 0;

	#pragma omp parallel for
	for (int i = 0; i < n_classes; i++)
		count[i] = 0;

	#pragma omp parallel for reduction(+:count)
	for (int i = 0; i < len; i++){
		count[k_nearest[i].label] += 1;
	}

	for (int i = 1; i < n_classes; i++){
		if ( count[i] > count[higher] ){
			higher = i;
		}
	}

	return higher;
}


void sortNeighborsArray(Data *array, int len){
	Data aux;

	for (int i = 1; i < len; i++){
		for (int j = 0; j < len - 1; j++){
			if ( array[j].distance > array[j + 1].distance ){
				aux = array[j];
				array[j] = array[j + 1]; 
				array[j + 1] = aux;  
			}
		}
	}
}


void euclideanDistance(Data *train_data, Data *test_data, int num_features){
	double x1 = 0, x2 = 0, x = 0, sum = 0;

	#pragma omp parallel for private(x1, x2, x) reduction(+:sum)
	for (int k = 0; k < num_features; k++){
		x1 = train_data->features[k];
		x2 = test_data->features[k];
		
		x = x1 - x2;
		sum += pow(x, 2);
	}

	train_data->distance = sum;
}


void knn(int **confusion_matrix, Data *train_data, Data *test_data, int k, 
int train_n_lines, int test_num_lines, int num_features, int num_classes){
	Data *k_nearest = (Data *)calloc(k, sizeof(Data));
	if ( !k_nearest )
		exit(1);


	for (int i = 0; i < test_num_lines; i++){
		#pragma omp parallel for
		for (int j = 0; j < train_n_lines; j++)
			euclideanDistance(&train_data[j], &test_data[i], num_features);

		#pragma omp parallel for
		for (int j = 0; j < k; j++){
			k_nearest[j].label = train_data[j].label;
			k_nearest[j].distance = train_data[j].distance;
		}

		sortNeighborsArray(k_nearest, k);	

		for (int j = k; j < train_n_lines; j++){
			for (int l = 0; l < k; l++){
				if ( train_data[j].distance < k_nearest[l].distance ){
					for (int m = k - 2; m >= l; m--)
						k_nearest[m + 1] = k_nearest[m];
					
					k_nearest[l] = train_data[j];
					break;
				}
			}
		}

		int pred = test_data[i].label;
		int actual = classification(k_nearest, k, num_classes);

		confusion_matrix[pred][actual] += 1;
	}

	free(k_nearest);
}


void printConfusionMatrix(int **confusion_matrix, int n_classes){
	printf("\n");
	for (int i = 0; i < n_classes; i++){
		for (int j = 0; j < n_classes; j++)
			printf("\t%d", confusion_matrix[i][j]);
		printf("\n");
	}
}


void calculateAccuracy(int **confusion_matrix, int n_classes){
	double accuracy = 0, positive = 0, total = 0;

	#pragma omp parallel for reduction(+:total)
	for (int i = 0; i < n_classes; i++){
		for (int j = 0; j < n_classes; j++)
			total += confusion_matrix[i][j];
	}

	#pragma omp parallel for reduction(+:positive)
	for (int i = 0; i < n_classes; i++)
		positive += confusion_matrix[i][i];

	accuracy = positive / total;

	printf("\naccuracy: %lf\n", accuracy);
}

