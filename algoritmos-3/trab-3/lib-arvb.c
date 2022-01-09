
#include "lib-arvb.h" 

tNoB *criaNoB(int chave){
	tNoB *temp = (tNoB *) malloc(sizeof(tNoB));

	temp->chave = chave;
	temp->esq = NULL;
	temp->dir = NULL;

	return temp;
}

tNoB *montaArvoreB(const char *str, int *i){
	tNoB *no = NULL;
    char temp[5000]; 

	if (str[*i] == '('){
        int x = 0;
		
        (*i)++;
        while ( ( str[*i] != '(' ) && ( str[*i] != ')' ) ){
            temp[x] = str[*i];
            x++;
            (*i)++;
        }
        
        temp[x] = '\0';

		if ( temp[0] == '\0' ){
			(*i)++;
			return NULL;
		}
		no = criaNoB(atoi(temp));
		// printf("%d.", no->chave);
		no->esq = montaArvoreB(str, i);
		no->dir = montaArvoreB(str, i);            
		(*i)++;
	}
    return no;  
}

tNoB *criaArvoreB(const char *str){
	int i = 2;
	return montaArvoreB(str, &i);
}

void preordemB(tNoB *no){
	if (no != NULL){
		printf("(%d", no->chave);
        preordemB(no->esq);
		if (no->esq == NULL && no->dir != NULL)
			printf("()");
        preordemB(no->dir);
		if (no->esq != NULL && no->dir == NULL)
			printf("()");
    	printf(")");
    }
}

int somaNoB(tNoB *no){
	if (no == NULL)
		return 0;
	
	return no->chave + somaNoB(no->esq) + somaNoB(no->dir);
}

void liberaNosB(tNoB *no){
	if ( no == NULL )
		return;
	liberaNosB(no->esq);
	liberaNosB(no->dir);
	free(no);
	no = NULL;
}


void destroiArvoreB(tNoB *raiz){
	if ( raiz == NULL )
		return;
	liberaNosB(raiz);
}