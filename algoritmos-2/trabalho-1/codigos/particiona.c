#include "biblioteca.h"

/* -------------------------------------------------------------------------- */
/* modifica v e devolve um �ndice m de forma que */
/* a-1 <= m <= b */
/* v[i] <= x, para todo a <= i <=m */
/* x < v[i], para todo m < i <=b */

int particiona(int v[], int a, int b, int x) {

  int m = a - 1;
  int i;

  for (i = a; i <= b ; i++){
    if (compara(x, v[i]) >= 0){
      m++;
      troca(v, m, i);
    }
  }
  
  return m;
}
