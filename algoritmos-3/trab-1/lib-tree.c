
#include "lib-tree.h"


tNode *createNode (char *value){
	tNode *n    = (tNode *) malloc(sizeof(tNode));
    n->value    = (char *)  malloc(sizeof(char) * (strlen(value) + 1));

    strcpy(n->value, value);
	
    n->left     = NULL;
	n->right    = NULL;
	n->root     = NULL; 
	
    return n;
}


tNode* mountTree(const char *str, int *i){
	tNode *node   = NULL;
    char temp[SIZE_BUFFER]; 

	if ( str[*i] == '(' ) {
        int x = 0;
		
        (*i)++;

        while ( (str[*i] != '(') && (str[*i] != ')') ){
            temp[x] = str[*i];
            x++;
            (*i)++;
        }
        
        (*i)--;

        temp[x] = '\0';

		node = createNode(temp);    
		
        (*i)++;

		node->left    = mountTree(str, i);
		node->right   = mountTree(str, i);            
		
        (*i)++;
	}

    return node;        
}


void preOrder(tNode * node){    
    if ( node != NULL ){
        printf("%s ", node->value);
        preOrder(node->left);
        preOrder(node->right);
    }
}


void inOrder(tNode * node){    
    if ( node != NULL ){
        inOrder(node->left);
        printf("%s ", node->value);
        inOrder(node->right);
    }
}


void postOrder(tNode * node){    
    if ( node != NULL ){
        postOrder(node->left);
        postOrder(node->right);
        printf("%s ", node->value);
    }
}