#include <stdio.h>

int main(){

    int quantidadeDeNumeros, condicaoH1, condicaoH2, quantosPertencem;
    double x, y;
    
    scanf("%d", &quantidadeDeNumeros);
    
    quantosPertencem = 0; 

    for (int i = 0; i < quantidadeDeNumeros; i++){
    
        scanf(" %lf, %lf", &x, &y);

        condicaoH1 = y + ( x * x ) + ( 2 * x ) - 3 <= 0;

        if ( x <= 0 && y <= 0 && condicaoH1 ){
            printf("(%lf,%lf) pertence ao conjunto H\n", x, y);
            quantosPertencem++;
        }

        condicaoH1 = y + ( x * x ) - (2 * x) - 3 <= 0;

        if ( x >= 0 && condicaoH1 ){
            printf("(%lf,%lf) pertence ao conjunto H\n", x, y);
            quantosPertencem++;
        }
    }

    printf("quantidade de pontos que pertencem a H = %d\n", quantosPertencem);

    return 0;
}
