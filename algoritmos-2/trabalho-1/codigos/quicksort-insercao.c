#include "insercao.h"
#include "particiona.h"


/* -------------------------------------------------------------------------- */
/* ordena v[a..b] usando o algoritmo QuickSort com inser��o e devolve v       */

int *quicksort_insercao(int v[], int a, int b, unsigned int m) {

  if (b - a + 1 < m){
    insercao(v, a, b);
    return v;
  }

  int posicao = particiona(v, a, b, v[b]);
  quicksort_insercao(v, a, posicao - 1, m);
  quicksort_insercao(v, posicao + 1, b, m);
}
