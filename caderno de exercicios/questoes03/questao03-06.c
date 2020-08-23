#include <stdio.h>
#include <math.h>


double fatorial(double x){

    if ( x > 1 )
        return x * fatorial(x - 1);
    else
        return 1;
}

int main(){

    int quantidadeDeNumeros;
    double cos, x;

    printf("valor de x\n");
    scanf(" %lf", &x);

    printf("quantidade de numeros\n");
    scanf(" %d", &quantidadeDeNumeros);

    for (double i = 0; i < quantidadeDeNumeros; i++){
        cos += pow(-1, i) * pow(x, 2 * i) / fatorial(2 * i);
    }
    
    printf("cos(%0.f) = %lf\n", x, cos);

    return 0;
}
