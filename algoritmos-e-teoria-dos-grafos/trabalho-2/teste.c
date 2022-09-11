#include <stdio.h>
#include <stdlib.h>
#include "grafo.h"

//------------------------------------------------------------------------------

int main(void) {

    grafo g = le_grafo();

    g = decompoe(g);

    if ( g != NULL ) escreve_grafo(g);

    destroi_grafo(g);

    return 0;
}
