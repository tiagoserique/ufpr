#include <stdio.h>
#include <stdlib.h>
#include "linked_list.h"

#define true 1

int main(){
    list_t *list = createList();
    list_node_t *node = NULL;

    FILE *arq = stdin;

    int time, id;
    char operation, attribute;

    fscanf(arq, "%d %d %c %c", &time, &id, &operation, &attribute);
    while ( !feof(arq) ){
        node = createNode(time, id, operation, attribute);

        appendList(list, node);

        fscanf(arq, "%d %d %c %c", &time, &id, &operation, &attribute);
    }

    printList(list);
    return 0;
}