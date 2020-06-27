#include <stdio.h>

void printVet(int vet[], int tam){
	int i;
	for (i = 0; i < tam; i++)
		printf("%d ", vet[i]);
	printf("\n");
}

void selectionSort(int vet[], int tam){
	int i, j, key, aux;
	for (i = 0; i < tam; i++){
		key = i;
		for (j = i+1; j <= tam; j++){
			if (vet[j] < vet[key]){
				key = j;
			}
		}
		if (key != i){
			aux = vet[i];
			vet[i] = vet[key];
			vet[key] = aux;
		}
	}
}


int main(){
	int vet[] = {12, 11, 13, 5, 6};
	int tam = sizeof(vet) / sizeof(vet[0]);
	selectionSort(vet, tam);
	printVet(vet, tam);
	return 0;
}
