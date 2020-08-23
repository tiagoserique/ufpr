#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAX 1000

void mostraVetor(int vetor[MAX], int tamanhoVetor){
    int indice;
    for (indice = 0; indice < tamanhoVetor; indice++)
        printf(" %d |", vetor[indice]);

    printf("\n");

    return;
}

void adicionaVetor(int vetor[MAX], int tamanhoVetor, int posicao, int numero){
    if (vetor[posicao] != 0){

        int indice;
        for (indice = posicao + 1; indice < tamanhoVetor; indice++){
            if ( vetor[indice] == 0 ){
                vetor[indice] = numero;
                return;
            }
        }
        
        for (indice = 0; indice < posicao; indice++){
            if ( vetor[indice] == 0 ){
                vetor[indice] = numero;
                return;
            }
        }
    }

    vetor[posicao] = numero;
    return;
}

int geraNumero(int minimo, int maximo){

    return ( rand() % ( maximo - minimo + 1 ) ) + minimo;
}

int main(){

    int tamanhoVetor, maximo, minimo;
    int numeroAleatorio, posicaoAleatoria;

    scanf(" %d %d %d", &tamanhoVetor, &minimo, &maximo);
    int vetor[MAX];

    srand(time(NULL));

    int indice; 
    for (indice = 0; indice < tamanhoVetor; indice++)
        vetor[indice] = 0;

    if ( maximo > minimo && minimo > 0 ){
    
        for (indice = 0; indice < tamanhoVetor; indice++){
            numeroAleatorio = geraNumero(minimo, maximo);
            posicaoAleatoria = geraNumero(1, 10);
            printf(" %d %d\n", numeroAleatorio, posicaoAleatoria);
            adicionaVetor(vetor, tamanhoVetor, posicaoAleatoria - 1, numeroAleatorio);
            mostraVetor(vetor, tamanhoVetor);
        }
    }

    return 0;
}