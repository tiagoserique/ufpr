/*======================================*/
/*= Autor: Tiago Serique Valadares     =*/
/*= GRR: 20195138				       =*/
/*= Disciplina: Aprendizado de Maquina =*/
/*======================================*/

#include "read_data.h"


void readData(FILE *file, Data *data_array){
	int number_of_lines = 0, number_of_features = 0;
	
	fscanf(file, "%d %d", &number_of_lines, &number_of_features);

	data_array = (Data *)malloc(sizeof(Data) * number_of_lines);


	for (int i = 0; i < number_of_lines; i++){
		
		fscanf(file, "%d", &data_array[i].label);
		
		data_array[i].features = (double *)malloc(sizeof(double) * number_of_features);

		for (int j = 0; j < number_of_features; j++){
			fscanf(file, "%lf", &data_array[i].features[j]);
		}
	}

	int i = 0;
	for (i = 0; i < number_of_lines; i++){
		printf("%d ", data_array[i].label);
		// if (i % 10 == 0) {
		// 	printf("\n");
		// }
	}
	printf("\n\nlines: %d | features: %d\n", number_of_lines, number_of_features);
	printf("\n\n %d\n", i);
}