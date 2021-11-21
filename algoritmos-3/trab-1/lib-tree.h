
#ifndef _LIB_TREE_ 
#define _LIB_TREE_ 

#include <stdio.h> 
#include <stdlib.h> 
#include <string.h>

#define SIZE_BUFFER 1024


typedef struct tNode {
	char *value;
	struct tNode *left, *right, *root;
} tNode;

tNode *createNode(char *value);

tNode *mountTree(const char *str, int *i);

void preOrder(tNode *node);

void inOrder(tNode *node);

void postOrder(tNode *node);


#endif