#include <stdio.h>
#include <stdlib.h>
#include "grafo.h"

//------------------------------------------------------------------------------

int main(void) {

    grafo g = le_grafo();

    escreve_grafo(g);

    printf("\nn vertices = %d | n arestas = %d\n", n_vertices(g), n_arestas(g));

    printf("\ngrau maximo = %d | grau minimo = %d\n", grau_maximo(g), grau_minimo(g));

    printf("\ngrau medio = %d\n", grau_medio(g));

    printf("\neh regular? %s\n", regular(g) ? "sim" : "nao");

    printf("\neh completo? %s\n", completo(g) ? "sim" : "nao");

    printf("\neh conexo? %s\n", conexo(g) ? "sim" : "nao");

    printf("\nn triangulos = %d\n", n_triangulos(g));

    int **matriz = matriz_adjacencia(g);
    int n = n_vertices(g);

    printf("\n");
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%d ", matriz[i][j]);
        }
        printf("\n");
    }

    printf("\n");
    complemento(g);

    free(matriz);
    destroi_grafo(g);

    return 0;
}
