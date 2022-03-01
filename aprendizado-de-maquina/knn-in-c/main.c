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

	Data *k_nearest = NULL;

	FILE* train_base_file;

	if ( argc < 4 ){
		printf("Formato de entrada:\n");
		printf("knn <base de treinamento> <base de teste> <valor de k>\n");

		return EXIT_FAILURE;
	}

	strcpy(train_base_file_name, argv[1]);
	strcpy(test_base_file_name, argv[2]);
	k = atoi(argv[3]);
	
	k_nearest = (Data *)malloc(sizeof(Data) * k);

	// open the train base file
	train_base_file = fopen(train_base_file_name, "r");
	if ( train_base_file == NULL ){
		printf("Not able to open the train base file\n");
		return EXIT_FAILURE;
	}

	readData(train_base_file);

	fclose(train_base_file);

	return EXIT_SUCCESS;
}






