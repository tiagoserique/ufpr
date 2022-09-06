// Aluno: Tiago Serique Valadares - GRR20195138

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "grafo.h"

typedef long unsigned int uint_t;
typedef Agedge_t *aresta;


#define SEM_COR -1
#define COR_0 0
#define COR_1 1


// faz a busca do indice do nodo no vetor de nodos
// f(vertice) = indice do nodo no vetor de nodos 
int buscaI(grafo g, vertice v, vertice *nodos);

// passeio pelos vertices procurando o vertice em "buscando"
int buscaVertice(grafo g, vertice v, vertice buscando, int *visitados, 
vertice *nodos);


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

        if ( max_grau < grau_nodo_atual ) max_grau = grau_nodo_atual;
    }

    return max_grau;
}

// -----------------------------------------------------------------------------
int grau_minimo(grafo g)  {
    vertice nodo = agfstnode(g);

    int min_grau = grau(nodo, g);

    for (nodo = agnxtnode(g, nodo); nodo != NULL; nodo = agnxtnode(g, nodo)){
        int grau_nodo_atual = grau(nodo, g);

        if ( min_grau > grau_nodo_atual ) min_grau = grau_nodo_atual;
    }

    return min_grau;
}

// -----------------------------------------------------------------------------
int grau_medio(grafo g) {
    return 2 * n_arestas(g) / n_vertices(g);
}

// -----------------------------------------------------------------------------
int regular(grafo g) {
    vertice nodo = agfstnode(g);

    int grau_regular = grau(nodo, g);

    for (nodo = agnxtnode(g, nodo); nodo != NULL; nodo = agnxtnode(g, nodo)){
        if ( grau_regular != grau(nodo, g) ) return 0;
    }

    return 1;
}

// -----------------------------------------------------------------------------
int completo(grafo g) {
    int n_vertices_completo = n_vertices(g) - 1;

    for (vertice nodo = agfstnode(g); nodo != NULL; nodo = agnxtnode(g, nodo)){
        if ( n_vertices_completo != grau(nodo, g) ) return 0;
    }

    return 1;
}

// -----------------------------------------------------------------------------
int buscaI(grafo g, vertice v, vertice *nodos){
    for (int i = 0; i < n_vertices(g); i++) if ( v == nodos[i] ) return i;

    return -1;
}

int buscaVertice(grafo g, vertice v, vertice buscando, int *visitados, 
vertice *nodos){

    // retorna 1 se o vertice que esta sendo buscado for encontrado
    if ( v == buscando ) return 1;

    visitados[buscaI(g, v, nodos)] = 1;

    // pega as arestas do vertice v e itera sobre elas
    // pega o proximo vertice da aresta e chama recursivamente se o vertice nao 
    // foi visitado
    for (aresta e = agfstedge(g, v); e != NULL; e = agnxtedge(g, e, v)){
        vertice vizinho = aghead(e);
        if ( vizinho == v ) vizinho = agtail(e);

        if ( !visitados[buscaI(g, vizinho, nodos)] ){
            if ( buscaVertice(g, vizinho, buscando, visitados, nodos) ) return 1;
        }
    }

    return 0;
}

int conexo(grafo g) {
    // cria um vetor para marcar os vertices visitados
    int *visitados = (int *) calloc((uint_t)n_vertices(g), sizeof(int));

    // cria um vetor de nodos e faz relacao com os nodos do grafo
    vertice *nodos = (vertice *) calloc((uint_t)n_vertices(g), sizeof(vertice));
    vertice v;
    int j;
    for (v = agfstnode(g), j = 0; v != NULL; v = agnxtnode(g, v), j++){
        nodos[j] = v;
    }

    // pega o primeiro vertice do grafo e chama recursivamente para achar um
    // caminho para cada um dos outros vertices do grafo
    vertice nodo = agfstnode(g), busca = NULL;
    for (busca = agnxtnode(g, nodo); busca; busca = agnxtnode(g, busca)){
        if ( !buscaVertice(g, nodo, busca, visitados, nodos) ) return 0;

        for (int i = 0; i < n_vertices(g); i++) visitados[i] = 0;
    }

    return 1;
}

// -----------------------------------------------------------------------------
int bipartido(grafo g){
    // cria um vetor de vertices para guardar os nodos do grafo
    vertice *nodos = (vertice *) calloc((uint_t)n_vertices(g), sizeof(vertice));
    vertice v1;
    int j;
    for (v1 = agfstnode(g), j = 0; v1 != NULL; v1 = agnxtnode(g, v1), j++){
        nodos[j] = v1;
    }
    
    // cria um vetor de cores para guardar as cores dos nodos
    int *cor = (int *) calloc((uint_t)n_vertices(g), sizeof(int));
    for (int i = 0; i < n_vertices(g); i++) cor[i] = SEM_COR;

    int corAnterior = SEM_COR;

    for (vertice v = agfstnode(g); v != NULL; v = agnxtnode(g, v)){

        // pega a cor do vertice v
        int indiceV = buscaI(g, v, nodos);
        int corV = cor[indiceV];

        if ( corV == SEM_COR ){
            
            // se o vertice tiver cor diferente de COR_0, 
            // entao a cor do vertice v eh COR_0
            // senao a cor do vertice v eh COR_1
            if ( corAnterior == COR_0 ) corV = COR_1;
            else corV = COR_0;

            cor[indiceV] = corV;
        }

        // alterna a proxima cor dos vizinhos do vertice v, garantindo que eles 
        // tenham a mesma cor entre eles e diferente da cor do vertice v
        int proximaCor = ( corV == COR_1 ) ? COR_0 : COR_1;

        for (aresta e = agfstedge(g, v); e != NULL; e = agnxtedge(g, e, v)){

            // garante que apenas os vizinhos do vertice v sejam colocados na
            // variavel "vizinho"
            vertice vizinho = aghead(e);
            if ( vizinho == v ) vizinho = agtail(e);

            int indiceVizinho = buscaI(g, vizinho, nodos);

            // se o vizinho nao tiver cor, entao a cor dele sera a cor oposta ao
            // do vertice v
            // se tiver cor, checa se a cor dele eh a mesma cor do vertice v 
            if ( cor[indiceVizinho] == SEM_COR ) cor[indiceVizinho] = proximaCor;
            else if ( cor[indiceVizinho] == corV ) return 0;
        }
    }

    return 1;
}

// -----------------------------------------------------------------------------
int n_triangulos(grafo g) {
    int triangulos = 0;
    
    vertice fimk = NULL;
    vertice fimj = aglstnode(g);
    vertice fimi = agprvnode(g, fimj);

    for (vertice i = agfstnode(g); i != fimi; i = agnxtnode(g, i)){
        for (vertice j = agnxtnode(g, i); j != fimj; j = agnxtnode(g, j)){
            for (vertice k = agnxtnode(g, j); k != fimk; k = agnxtnode(g, k)){
                aresta ij = agedge(g, i, j, NULL, FALSE);
                aresta jk = agedge(g, j, k, NULL, FALSE);
                aresta ki = agedge(g, k, i, NULL, FALSE);

                if ( ij != NULL && jk != NULL && ki != NULL ) triangulos++;
            }
        }
    }

    return triangulos;
}

// -----------------------------------------------------------------------------
int **matriz_adjacencia(grafo g) {
    int n = n_vertices(g);
    
    uint_t vet_ptrs = (uint_t)n * sizeof(int *);
    uint_t elem = (uint_t)n * (uint_t)n * sizeof(int);
    
    // aloca a matriz de adjacencia
    int **matriz = (int **) malloc(vet_ptrs + elem);

    // ajusta ponteiros da matriz
    matriz[0] = (int *) (matriz + n);
    for (int i = 0; i < n; i++) {
        matriz[i] = matriz[0] + i * n;
    }

    int i, j;
    vertice v1, v2;
    for (v1 = agfstnode(g), i = 0; v1 != NULL; v1 = agnxtnode(g, v1), i++){
        for (v2 = agfstnode(g), j = 0; v2 != NULL; v2 = agnxtnode(g, v2), j++){

            // se tem aresta entre os vertices, entao coloca 1 na matriz de 
            // adjacencia
            matriz[i][j] = ( agedge(g, v1, v2, NULL, FALSE) ) ? 1 : 0;
        }
    }

    return matriz;
}

// -----------------------------------------------------------------------------
grafo complemento(grafo g) {
    char *nome = (char *) malloc((strlen("complemento") + 1) * sizeof(char));
    
    strcpy(nome, "complemento");

    // cria um grafo com o nome "complemento"
    grafo h = agopen(nome, Agundirected, NULL);

    // copia os vertices do grafo g para o grafo h
    for (vertice v = agfstnode(g); v != NULL; v = agnxtnode(g, v)){
        agnode(h, agnameof(v), TRUE);
    }

    // se a aresta (v, u) existe no grafo g, entao nao cria a aresta (u, v) 
    // no grafo h, e vice-versa
    for (vertice v = agfstnode(g); v != NULL; v = agnxtnode(g, v)){
        for (vertice u = agfstnode(g); u != NULL; u = agnxtnode(g, u)){
            if (v == u) continue;
            
            if ( !agedge(g, v, u, NULL, FALSE) ){
                vertice a = agnode(h, agnameof(v), TRUE);
                vertice b = agnode(h, agnameof(u), TRUE);
                
                if ( !agedge(h, b, a, NULL, FALSE) ) agedge(h, a, b, NULL, TRUE);
            }
        }
    }

    return h;
}

//------------------------------------------------------------------------------
grafo decompoe(grafo g) {

  return g;
}

