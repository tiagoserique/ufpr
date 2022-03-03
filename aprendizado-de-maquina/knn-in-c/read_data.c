/*======================================*/
/*= Autor: Tiago Serique Valadares     =*/
/*= GRR: 20195138				       =*/
/*= Disciplina: Aprendizado de Maquina =*/
/*======================================*/


#include "read_data.h"


Data *readData(FILE *file, int *number_of_lines, int *number_of_features){
	fscanf(file, "%d %d", number_of_lines, number_of_features);

	Data *data_array = (Data *)calloc(*number_of_lines, sizeof(Data));

	if ( !data_array )
		exit(1);
	
	for (int i = 0; i < *number_of_lines; i++){
		fscanf(file, "%d", &data_array[i].label);
		
		data_array[i].features = (double *)calloc(*number_of_features, sizeof(double));
		if ( !data_array )
			exit(1);

		for (int j = 0; j < *number_of_features; j++){
			fscanf(file, "%lf", &data_array[i].features[j]);
		}
	}

	return data_array;
}