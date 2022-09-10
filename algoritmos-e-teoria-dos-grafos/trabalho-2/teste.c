#include <stdio.h>
#include <stdlib.h>
#include "grafo.h"

//------------------------------------------------------------------------------

int main(void) {

    grafo g = le_grafo();

    escreve_grafo(g);

    grafo h = decompoe(g);

    if ( h != NULL ) {
        escreve_grafo(h);
    }

    destroi_grafo(g);

    return 0;
}
