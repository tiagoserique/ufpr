/*======================================*/
/*= Autor: Tiago Serique Valadares     =*/
/*= GRR: 20195138				       =*/
/*= Disciplina: Aprendizado de Maquina =*/
/*======================================*/



#include "knn.h"


double euclideanDistance(){
	int x1 = 0, x2 = 0;
	double x = 0, sum = 0;

	for (int i = 0; ; i++){
		// x1 = train_data.feature[i];
		// x2 = test_data.feature[i];
		
		x = x1 - x2;
		sum += pow(x, 2);
		// sum += sqrt(pow(x, 2));
	}


	return sum;
}


void printConfusionMatrix(){}
