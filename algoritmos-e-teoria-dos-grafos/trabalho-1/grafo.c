#include <stdio.h>
#include "grafo.h"

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
  
    return agwrite(g, stdout);
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
  
  return 0;
}

// -----------------------------------------------------------------------------
int **matriz_adjacencia(grafo g) {
  
  return NULL;
}

// -----------------------------------------------------------------------------
grafo complemento(grafo g) {
  
  return NULL;
}

