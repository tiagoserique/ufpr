#include "tad_pilha.h"


struct pilha *incializaPilha(){
    struct pilha *temp;

    temp = malloc(sizeof(struct pilha));

    temp->topo = -1;
    temp->pilha = calloc(COMPRIMENTO, sizeof(int));

    return temp;
}

int pilhaVazia(struct pilha *pilha){

    if ( pilha->topo != -1 ) 
        return 0;
    return 1;
}

int push(struct pilha *pilha, int valor){

    if ( pilha->topo + 1 != COMPRIMENTO){

        pilha->topo += 1;
        pilha->pilha[pilha->topo] = valor;
        return 1;
    }

    printf("\nPilha cheia\n");
    return 0;
}

int pop(struct pilha *pilha){

    if ( !pilhaVazia(pilha) ){

        pilha->topo -= 1;
        return pilha->pilha[pilha->topo + 1];
    }

    printf("\nPilha vazia\n");
    return 0;
}

void buscaElemento(struct pilha *pilha, int valor){
    
    int posicao = pilha->topo;

    while ( posicao != -1 ){
        
        if ( pilha->pilha[posicao] == valor ){

            printf("\nO elemento %d esta na posicao %d° da pilha\n", valor, posicao + 1);
            return;
        }

        posicao--;
    }

    printf("\nO elemento nao esta na pilha\n");
    return;
}

void mostraTopo(struct pilha *pilha){

    if ( pilha->topo != -1 )
        printf("\nElemento do topo = %d\n", pilha->pilha[pilha->topo]);
    
    return;
}

void mostraPilha(struct pilha *pilha){

    int posicao = pilha->topo;

    while ( posicao != -1 ){
        
        printf("\nvalor = %d - posicao = %d;", pilha->pilha[posicao], posicao + 1);
        posicao--;
    }

    printf("\n");
    return;
}

void esvaziaPilha(struct pilha *pilha){

    pilha->topo = -1;
    return;
}

void destroiPilha(struct pilha *pilha){

    free(pilha);
    return;
}
