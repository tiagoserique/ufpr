#include <stdio.h>
#include <math.h>

int main(){

    float capital, taxa, juros;

    scanf("%f", &capital);
    scanf("%f", &taxa);

    for (int mes = 1; mes <= 12; mes++){
        capital += capital * taxa;
        printf("Montante de Juros Compostos no mes %d = %.2f\n", mes, capital);
    }

    return 0;
}
