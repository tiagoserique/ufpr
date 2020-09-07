#ifndef _TAD_PILHA_H_

#include <stdlib.h>

struct item {
    int valor;
    struct item *prox;
};

struct pilha {
    int tam;
    struct item *topo;
};

struct item *criaItem(int valor);
struct pilha *inicializaPilha();
void push(struct pilha *pilha, int valor);
int pop(struct pilha *pilha);
int pilhaVazia(struct pilha *pilha);
void mostraTopo(struct pilha *pilha);
void quantidadeItens(struct pilha *pilha);
void mostraPilha(struct pilha *pilha);
void esvaziaPilha(struct pilha *pilha);
void destroiPilha(struct pilha *pilha);
void buscaElemento(struct pilha *pilha, int valor);

#endif