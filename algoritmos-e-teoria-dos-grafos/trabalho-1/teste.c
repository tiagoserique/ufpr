#include <stdio.h>
#include "grafo.h"

//------------------------------------------------------------------------------

int main(void) {

    grafo g = le_grafo();

    escreve_grafo(g);

    printf("\nn vertices = %d | n arestas = %d\n", n_vertices(g), n_arestas(g));

    printf("\ngrau maximo = %d | grau minimo = %d\n", grau_maximo(g), grau_minimo(g));

    printf("\ngrau medio = %d\n", grau_medio(g));

    printf("\nEh regular? %s\n", regular(g) ? "sim" : "nao");

    printf("\nEh completo? %s\n", completo(g) ? "sim" : "nao");

    destroi_grafo(g);

    return 0;
}
