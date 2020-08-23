#include <stdio.h>


int main(){
    
    int numero;
    double harmonico;

    scanf("%d", &numero);

    harmonico = 0;

    for (double k = 1; k <= numero; k++){
        harmonico += 1/k;
    }

    printf("Numero harmonico = %f\n", harmonico);

    return 0;
}
