/*======================================*/
/*= Autor: Tiago Serique Valadares     =*/
/*= GRR: 20195138				       =*/
/*= Disciplina: Aprendizado de Maquina =*/
/*======================================*/


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "knn.h"
#include "read_data.h"


int main(int argc, char *argv[]){
	char train_base_file_name[LINESIZE];
	char test_base_file_name[LINESIZE];
	
	int k = 0;
	int n_lines_test = 0;
	int n_features = 0;
	int n_lines_train = 0;
	int n_classes = 0;

	int **confusion_matrix = NULL;

	Data *train_data_array = NULL;
	Data *test_data_array = NULL;

	FILE* train_base_file = NULL;
	FILE* test_base_file = NULL;


	if ( argc < 4 ){
		printf("Formato de entrada:\n");
		printf("knn <base de treinamento> <base de teste> <valor de k>\n");

		return EXIT_FAILURE;
	}

	strcpy(train_base_file_name, argv[1]);
	strcpy(test_base_file_name, argv[2]);

	k = atoi(argv[3]);	


	// open the train base file
	train_base_file = fopen(train_base_file_name, "r");
	if ( train_base_file == NULL ){
		printf("Not able to open the train base file\n");
		return EXIT_FAILURE;
	}
	train_data_array = readData(train_base_file, &n_lines_train, 
	&n_features, &n_classes);
	fclose(train_base_file);


	// open the test base file
	test_base_file = fopen(test_base_file_name, "r");
	if ( test_base_file == NULL ){
		printf("Not able to open the test base file\n");
		return EXIT_FAILURE;
	}
	test_data_array = readData(test_base_file, &n_lines_test, &n_features, &n_classes);
	fclose(test_base_file);


	confusion_matrix = (int **)malloc(sizeof(int *) * n_classes + 
		n_classes * n_classes * sizeof(int));
	
	confusion_matrix[0] = (int *)(confusion_matrix + n_classes);
	
	#pragma omp parallel for
	for (int i = 1; i < n_classes; i++)
		confusion_matrix[i] = confusion_matrix[0] + (i * n_classes);

	#pragma omp parallel for
	for (int i = 0; i < n_classes; i++)
		for (int j = 0; j < n_classes; j++)
			confusion_matrix[i][j] = 0;


	knn(confusion_matrix, train_data_array, test_data_array, k, n_lines_train, 
	n_lines_test, n_features, n_classes);

	printConfusionMatrix(confusion_matrix, n_classes);

	calculateAccuracy(confusion_matrix, n_classes);

	free(train_data_array);
	free(test_data_array);
	free(confusion_matrix);
	return EXIT_SUCCESS;
}
