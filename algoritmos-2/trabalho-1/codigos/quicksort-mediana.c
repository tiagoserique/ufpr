#include "biblioteca.h"
#include "particiona.h"

/* -------------------------------------------------------------------------- */
/* devolve a mediana de a, b e c                                              */

static int mediana(int a, int b, int c) {
  
  if(a < b){
    if(b < c)
      return b;         //a < b && b < c
    
    else {                
      if(a < c)
        return c;       //a < c && c <= b
      
      else
        return a;       //c <= a && a < b
    }
  }
  else {
    if(c < b)
      return b;         //c < b && b <= a
    
    else{
      if(c < a)
        return c;       //b <= c && c < a
      
      else
        return a;       //b <= a && a <= c
    }
  }
}

/* -------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------- */
/* ordena v[a..b]  usando o algoritmo  "QuickSort com mediana de  3" e
   devolve v                                                                  */

int *quicksort_mediana(int v[], int a, int b) {
  
  if (a > b){
    return v;
  }

  int m = mediana(v[sorteia(a, b)], v[sorteia(a, b)], v[sorteia(a, b)]);
  troca(v, m, b);
  m = particiona(v, a, b, v[b]);
  quicksort_mediana(v, a, m - 1);
  quicksort_mediana(v, m + 1, b);
}



