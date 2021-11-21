
#include "lib-evaluator.h"
#include "lib-tree.h"


int main(int argc, char **argv){
	tNode *tree = NULL;
	int i = 0;

	if (argc < 2){
		printf("Not enough arguments to evaluate\n");
		return 1;
	}

	tree = mountTree(argv[1], &i);

	// preOrder(tree);
	// printf("\n");

	// inOrder(tree);
	// printf("\n");

	// postOrder(tree);
	// printf("\n");

	printf("%d\n", evaluator(tree));
	
	return 0;
} 