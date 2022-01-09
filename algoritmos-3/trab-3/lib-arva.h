
#ifndef _LIB_ARVA_
#define _LIB_ARVA_

#include <stdio.h> 
#include <stdlib.h> 
#include <string.h>
#include "lib-arvb.h"

typedef struct tNoA {
	tNoB *chave;
	struct tNoA *esq, *dir, *pai;
} tNoA;

tNoA *criaNoA(tNoB *chave);
tNoA *incluiA(tNoA *no, tNoB *chave);
void preordemA(tNoA *no);
tNoA *buscaA(tNoA *no, int chave, int imprime);
tNoA *min(tNoA *no);
tNoA *sucessor(tNoA *no);
void ajustaNoPai(tNoA *no, tNoA *novo);
tNoA *exclui(tNoA *no, tNoA *raiz);

#endif