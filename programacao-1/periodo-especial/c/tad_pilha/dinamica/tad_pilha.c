#include "tad_pilha.h"

struct item *criaItem(int valor){

    struct item *temp;

    temp = malloc(sizeof(struct item));
    temp->valor = valor;
    temp->prox = NULL;

    return temp;
}

struct pilha *inicializaPilha(){

    struct pilha *temp;

    temp = malloc(sizeof(struct pilha));
    temp->topo = NULL;
    temp->tam = 0;

    return temp;
}

void push(struct pilha *pilha, int valor){

    if ( pilha->topo != NULL ){

        struct item *temp;

        temp = criaItem(valor);
        temp->prox = pilha->topo;
        pilha->topo = temp;
        pilha->tam += 1;
    }
    else {
     
        pilha->topo = criaItem(valor);
        pilha->tam += 1;
    }

    return;
}

int pop(struct pilha *pilha){

    if ( !pilhaVazia(pilha) ){
        int valor;
        struct item *temp;

        temp = pilha->topo;
        valor = temp->valor;
        pilha->topo = pilha->topo->prox;
        free(temp);
        pilha->tam -= 1;
        return valor;
    }
    printf("Pilha vazia\n\n");
    return 0;
}

int pilhaVazia(struct pilha *pilha){

    if ( pilha->topo != NULL )
        return 0;
    return 1;
}

void mostraTopo(struct pilha *pilha){

    if ( pilha->topo != NULL)
        printf("Topo = %d\n\n", pilha->topo->valor);

    return;
}

void quantidadeItens(struct pilha *pilha){

    printf("Tamanho da pilha = %d\n\n", pilha->tam);

    return;
}

void mostraPilha(struct pilha *pilha){

    if ( !pilhaVazia(pilha) ){

        struct pilha temp = *pilha;

        while ( temp.tam > 0 ){
            printf("Valor = %d; Posicao = %d\n", temp.topo->valor, temp.tam);
            temp.topo = temp.topo->prox;
            temp.tam--;
        }
    }
    else 
        printf("Pilha vazia\n");


    printf("\n");
    return;
}

void esvaziaPilha(struct pilha *pilha){

    struct item *temp;

    while ( pilha->tam > 0 ){
        temp = pilha->topo;
        pilha->topo = pilha->topo->prox;
        free(temp);
        pilha->tam--;
    }

    return;
}

void destroiPilha(struct pilha *pilha){

    esvaziaPilha(pilha);
    free(pilha);
    return;
}

void buscaElemento(struct pilha *pilha, int valor){

    struct pilha temp = *pilha;

    while ( temp.tam > 0 ){
        
        if ( temp.topo->valor == valor ){
            printf("%d esta na %d° da pilha\n\n", valor, temp.tam);
            return;
        }

        temp.topo = temp.topo->prox;
        temp.tam--;
    }

    printf("%d nao esta na pilha\n\n", valor);
    return;
}
