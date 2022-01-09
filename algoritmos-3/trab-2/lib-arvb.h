
#ifndef _LIB_ARVB_
#define _LIB_ARVB_

#include <stdio.h> 
#include <stdlib.h> 
#include <string.h>

typedef struct tNoB {
	int chave;
	struct tNoB *esq, *dir;
} tNoB;


tNoB *criaNoB(int chave);
tNoB *montaArvoreB(const char *str, int *i);
tNoB *criaArvoreB(const char *str);
void preordemB(tNoB *no);
int somaNoB(tNoB *no);
void liberaNosB(tNoB *no);
void destroiArvoreB(tNoB *raiz);


#endif