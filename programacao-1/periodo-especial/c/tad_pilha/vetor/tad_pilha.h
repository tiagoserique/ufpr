#ifndef _TAD_PILHA_H_

#include <stdio.h>
#include <stdlib.h>

#define COMPRIMENTO 5

struct pilha {

    int topo;
    int *pilha;
};

struct pilha *incializaPilha();
int pilhaVazia(struct pilha *pilha);
int push(struct pilha *pilha, int valor);
int pop(struct pilha *pilha);
void buscaElemento(struct pilha *pilha, int valor);
void mostraTopo(struct pilha *pilha);
void mostraPilha(struct pilha *pilha);
void esvaziaPilha(struct pilha *pilha);
void destroiPilha(struct pilha *pilha);


#endif