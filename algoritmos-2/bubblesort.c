#include <stdio.h>

void printVet(int vet[], int tam){
	int i;
	for (i = 0; i < tam; i++){
		printf("%d ", vet[i]);
	}
	printf("\n");
}

void bubbleSort(int vet[], int tam){
	int i, j, aux;
	for (i = 0; i < tam; i++){
		for (j = 0; j < tam-i; j++){
			if (vet[j] > vet[j+1]){
				aux = vet[j];
				vet[j] = vet[j+1];
				vet[j+1] = aux;
			}
		}
	}
}

int main(){
	int vet[] = {5, 3, 1, 7, 9};
	int tam = sizeof(vet) / sizeof(vet[0]);
	
	bubbleSort(vet, tam);
	printVet(vet, tam);
	return 0;
}
