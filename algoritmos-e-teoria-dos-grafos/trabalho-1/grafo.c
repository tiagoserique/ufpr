#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "grafo.h"

typedef long unsigned int uint_t;

//------------------------------------------------------------------------------
grafo le_grafo(void) {
    return agread(stdin, NULL); 
}
//------------------------------------------------------------------------------
void destroi_grafo(grafo g) {
    agclose(g);

    return;
}
//------------------------------------------------------------------------------
grafo escreve_grafo(grafo g) {
    agwrite(g, stdout);

    return g;
}

// -----------------------------------------------------------------------------
int n_vertices(grafo g) {
    return agnnodes(g);
}

// -----------------------------------------------------------------------------
int n_arestas(grafo g) {
    return agnedges(g);
}

// -----------------------------------------------------------------------------
int grau(vertice v, grafo g) {
    return agdegree(g, v, TRUE, TRUE);
}

// -----------------------------------------------------------------------------
int grau_maximo(grafo g)  {
    vertice nodo = agfstnode(g);

    int max_grau = grau(nodo, g);

    for (nodo = agnxtnode(g, nodo); nodo != NULL; nodo = agnxtnode(g, nodo)){
        int grau_nodo_atual = grau(nodo, g);

        if ( grau_nodo_atual > max_grau ) max_grau = grau_nodo_atual;
    }

    return max_grau;
}

// -----------------------------------------------------------------------------
int grau_minimo(grafo g)  {
    vertice nodo = agfstnode(g);

    int min_grau = grau(nodo, g);

    for (nodo = agnxtnode(g, nodo); nodo != NULL; nodo = agnxtnode(g, nodo)){
        int grau_nodo_atual = grau(nodo, g);

        if ( grau_nodo_atual < min_grau ) min_grau = grau_nodo_atual;
    }

    return min_grau;
}

// -----------------------------------------------------------------------------
int grau_medio(grafo g) {
    int grau_medio = 2 * n_arestas(g) / n_vertices(g);

    return grau_medio;
}

// -----------------------------------------------------------------------------
int regular(grafo g) {
    vertice nodo = agfstnode(g);

    int grau_regular = grau(nodo, g);

    for (nodo = agnxtnode(g, nodo); nodo != NULL; nodo = agnxtnode(g, nodo)){
        int grau_nodo_atual = grau(nodo, g);

        if ( grau_nodo_atual != grau_regular ) return 0;
    }

    return 1;
}

// -----------------------------------------------------------------------------
int completo(grafo g) {
    int n_vertices_completo = n_vertices(g) - 1;

    for (vertice nodo = agfstnode(g); nodo != NULL; nodo = agnxtnode(g, nodo)){
        int grau_nodo_atual = grau(nodo, g);

        if ( grau_nodo_atual != n_vertices_completo ) return 0;
    }

    return 1;
}

// -----------------------------------------------------------------------------
int conexo(grafo g) {
  
    return 0;
}

// -----------------------------------------------------------------------------
int bipartido(grafo g) {
  
    return 0;
}

// -----------------------------------------------------------------------------
int n_triangulos(grafo g) {
    int triangulos = 0;
    
    return triangulos;
}

// -----------------------------------------------------------------------------
int **matriz_adjacencia(grafo g) {
    int n = n_vertices(g);
    
    uint_t vet_ptrs =  (uint_t)n * sizeof(int *);
    uint_t elem = (uint_t)n * (uint_t)n * sizeof(int);
    
    int **matriz = (int **) malloc(vet_ptrs + elem);

    // ajusta ponteiros da matriz
    matriz[0] = (int *) (matriz + n);
    for (int i = 0; i < n; i++) {
        matriz[i] = matriz[0] + i * n;
    }

    int i, j;
    vertice v1, v2;
    for (v1 = agfstnode(g), i = 0; v1 != NULL; v1 = agnxtnode(g, v1), i++) {
        for (v2 = agfstnode(g), j = 0; v2 != NULL; v2 = agnxtnode(g, v2), j++){
            if (v1 == v2) continue;
            
            matriz[i][j] = ( agedge(g, v1, v2, NULL, FALSE) ) ? 1 : 0;
        }
    }

    return matriz;
}

// -----------------------------------------------------------------------------
grafo complemento(grafo g) {
    char *nome = (char *) malloc((strlen("complemento") + 1) * sizeof(char));
    
    strcpy(nome, "complemento");

    grafo h = agopen(nome, Agundirected, NULL);

    for (vertice v = agfstnode(g); v != NULL; v = agnxtnode(g, v)){
        agnode(h, agnameof(v), TRUE);
    }

    for (vertice v = agfstnode(g); v != NULL; v = agnxtnode(g, v)){
        for (vertice u = agfstnode(g); u != NULL; u = agnxtnode(g, u)) {
            if (v == u) continue;
            
            if ( !agedge(g, v, u, NULL, FALSE) ) {
                vertice a = agnode(h, agnameof(v), TRUE);
                vertice b = agnode(h, agnameof(u), TRUE);
                
                if ( !agedge(h, b, a, NULL, FALSE) ) agedge(h, a, b, NULL, TRUE);
            }
        }
    }

    escreve_grafo(h);

    return h;
}

