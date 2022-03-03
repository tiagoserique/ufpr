/*======================================*/
/*= Autor: Tiago Serique Valadares     =*/
/*= GRR: 20195138				       =*/
/*= Disciplina: Aprendizado de Maquina =*/
/*======================================*/


#ifndef __READ_DATA__
#define __READ_DATA__


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "knn.h"


#define LINESIZE 1024


Data *readData(FILE *file, int *number_of_lines, int *number_of_features, 
int *number_of_classes);


#endif