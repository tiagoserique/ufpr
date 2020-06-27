#include <stdio.h>

void printVet(int vet[], int tam){
	int i;
	for (i = 0; i < tam; i++){
		printf("%d ", vet[i]);
	}
	printf("\n");
}

void insertionSort(int vet[], int tam){
	int i, j, key;
	for (j = 1; j <= tam; j++){
		key = vet[j];
		i = j - 1;
		while ((i > -1) && (vet[i] > key)){
			vet[i + 1] = vet[i];
			i--;
		}
		vet[i+1] = key;
	}
}

int main(){
	int vet[] = {5, 3, 1, 7, 9};
	int tam = sizeof(vet) / sizeof(vet[0]);
	insertionSort(vet, tam);
	printVet(vet, tam);
	return 0;
}
