
#include "lib-arva.h"
#include "lib-arvb.h"

#define LINESIZE 1024

int main(int argc, const char **argv){
	FILE* input = stdin;
	tNoA *treeA = NULL;
	tNoB *treeB = NULL;
	char line[LINESIZE+1];
	int imprime = 0;
	char *ret = NULL;

	if ( argc == 2 ){
		input = fopen(argv[1], "r");
	}

	ret = fgets(line, LINESIZE, input);
	while ( ret != NULL ){
		treeB = NULL;

		if ( line[0] == 'i' ){
			treeB = criaArvoreB(line);
			treeA = incluiA(treeA, treeB);

			printf("%s", line);
			preordemA(treeA);
			printf("\n");
		}
		else if ( line[0] == 'b' ){
			printf("%s", line);
			tNoA *resultTree = buscaA(treeA, somaNoB(criaArvoreB(line)), imprime = 1);
			if ( resultTree == NULL )
				printf("Nao foi encontrado\n");
			printf("\n");
		}
		else if ( line[0] == 'r' ){
			tNoA *resultTree = buscaA(treeA, somaNoB(criaArvoreB(line)), imprime = 0);
			
			if ( resultTree != NULL )
				treeA = exclui(resultTree, treeA);

			printf("%s", line);
			preordemA(treeA);
			printf("\n");
		}

		ret = fgets(line, LINESIZE, input);
	}

	fclose(input);

	return 0;
}