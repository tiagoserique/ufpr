#include <stdio.h>

int main(){
    
    int quantidadeDePontos, circunferencia;

    double x, y;

    scanf("%d", &quantidadeDePontos);

    for (int i = 0; i < quantidadeDePontos; i++){
        
        scanf(" %lf %lf", &x, &y);

        circunferencia = (x * x) + (y * y) <= 1;

        if ( x >= 0 && y >= 0 && circunferencia )
            printf("(%lf,%lf) pertence a regiao\n", x, y);
        else
            printf("(%lf,%lf) nao pertence a regiao\n", x, y);
    }

    return 0;
}
