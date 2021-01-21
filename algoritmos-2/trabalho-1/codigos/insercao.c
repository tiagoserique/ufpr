#include "biblioteca.h"

/* -------------------------------------------------------------------------- */
/* ordena v[a..b] pelo m�todo da sele��o e devolve v */

int *insercao(int v[], unsigned int a, unsigned int b) {

  int indice;

  for (indice = a; indice <= b ; indice++){
    
    int aux = v[indice];
    int posi = indice - 1;

    while( posi >= 0 && compara(v[posi], aux) > 0 ){
      troca(v, posi + 1, posi);
      posi--;
    }
  }

  return v;
}
