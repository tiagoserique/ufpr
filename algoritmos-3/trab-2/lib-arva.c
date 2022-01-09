
#include "lib-arva.h"

tNoA *criaNoA(tNoB *chave){
  tNoA *n = (tNoA *) malloc(sizeof(tNoA));
  n->chave = chave;
  n->esq = NULL;
  n->dir = NULL;
  n->pai = NULL; 
  return n;
}

tNoA *incluiA(tNoA *no, tNoB *chave){
    if ( no == NULL )
		return criaNoA(chave);

    if ( somaNoB(no->chave) > somaNoB(chave) ){
        no->esq = incluiA(no->esq, chave);
        no->esq->pai = no;
    }
    else {
        no->dir = incluiA(no->dir, chave);
        no->dir->pai = no;
    }

    return no;
}

void preordemA(tNoA *no){
    if (no != NULL){
        printf("[");
		preordemB(no->chave);
        printf(" : %d\n", somaNoB(no->chave));

        preordemA(no->esq);
		if (no->esq == NULL && no->dir != NULL)
			printf("[\n]\n");
        preordemA(no->dir);
		if (no->esq != NULL && no->dir == NULL)
			printf("[\n]\n");
		printf("]\n");
    }
}

tNoA *buscaA(tNoA *no, int chave, int imprime){
    if (no == NULL)
		return NULL;
    
	if (imprime){
		preordemB(no->chave);
		printf(" : %d\n", somaNoB(no->chave));
	}
    
	if ( somaNoB(no->chave) == chave ) 
		return no;
    if ( somaNoB(no->chave) > chave )
		return buscaA(no->esq, chave, imprime);
    else
		return buscaA(no->dir, chave, imprime);
}

tNoA *min(tNoA *no){
    if (no->esq == NULL) 
		return no;
    else
        return min(no->esq);
}

tNoA *sucessor(tNoA *no){
    tNoA *s = NULL;
    if (no->dir != NULL) 
		return min(no->dir);
    else {
        s = no->pai;
        while (s != NULL && no == s->dir){
            no = s;
            s = s->pai;
        }        
    }
    return s;
}

void ajustaNoPai(tNoA *no, tNoA *novo){
    if (no->pai != NULL) {
        if (no->pai->esq == no){
            no->pai->esq = novo;
		}
        else {
        	no->pai->dir = novo;
		}

		if (novo != NULL){
           	novo->pai = no->pai;
		}
    }
}

tNoA *exclui(tNoA *no, tNoA *raiz){
    tNoA *s = NULL;
	tNoA *novaRaiz = raiz;

    if (no->esq == NULL){
        ajustaNoPai(no, no->dir);
		
		if (no == raiz){
			novaRaiz = no->dir;
		}

		destroiArvoreB(no->chave);
        free(no);
    }
	else {
		if (no->dir == NULL){
			ajustaNoPai(no, no->esq);

			if (no == raiz){
				novaRaiz = no->esq;
			}

			destroiArvoreB(no->chave);
			free(no);
		}
		else {            
			s = sucessor(no);
			ajustaNoPai(s, s->dir);
			s->esq = no->esq;
			s->dir = no->dir;
			ajustaNoPai(no, s);
			
			if (no == raiz)
				novaRaiz = s;
	
			s->pai = no->pai;
			s->esq->pai = s;

			destroiArvoreB(no->chave);
			free(no);
		}
    }
    return novaRaiz;
}
