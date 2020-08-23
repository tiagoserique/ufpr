#include <stdio.h>

#define MAX 1000

void mostraVetor(int vetor[MAX], int tamanho){
    int indice;

    for (indice = 0; indice < tamanho; indice++)
        printf("%d ", vetor[indice]); 
    printf("\n");

    return;
}

int main(){

    int numero, indice, vetor[MAX];

    scanf(" %d", &numero);

    for (indice = 0; indice < numero; indice++){
        scanf(" %d", &vetor[indice]);
        if ( vetor[indice] <= 0 && vetor[indice] > 100 )
            indice--; 
    }

    int pivo, key, posicaoPivo;

    posicaoPivo = 0;
    pivo = vetor[posicaoPivo];
    
    for (indice = posicaoPivo + 1; indice < numero; indice++){ 
        if ( vetor[indice] < pivo ){
            
            key = vetor[indice];
            
            while ( indice != 0 && key < vetor[indice - 1] ){
                vetor[indice] = vetor[indice - 1];
                indice--;
            }

            vetor[indice] = key;
            posicaoPivo++;
            indice = posicaoPivo + 1;
        }
    }

    mostraVetor(vetor, numero);

    return 0;
}