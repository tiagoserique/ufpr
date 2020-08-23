#include <stdio.h>

int main(){
    int quantidadeDeNumeros, numero, indice;
    int paridade, impar, par;
    int kAlternante;

    scanf(" %d", &quantidadeDeNumeros);
    scanf(" %d", &numero);

    paridade = numero % 2;
    indice = kAlternante = 1;

    while ( indice < quantidadeDeNumeros && numero % 2 == paridade ){
        scanf("%d", &numero);
        indice++;
        if ( numero % 2 == paridade )
            kAlternante++;
    }

    if ( paridade == 1 ){
        impar = kAlternante;
        par = 0;
    }
    else {
        par = kAlternante;
        impar = 0;
    }

    while ( indice < quantidadeDeNumeros ){
        if ( ( numero % 2 == 0 ) ){
            par += 1;
            if ( par == kAlternante )
                impar = 0;
        }
        else if ( ( numero % 2 == 1 ) ){
            impar += 1;
            if ( impar == kAlternante )
                par = 0;
        }
        
        scanf("%d", &numero);
        indice++;
    }

    if ( ( impar == kAlternante ) || ( par == kAlternante ) ){
        printf("valor da sequencia = %d\n", kAlternante);
    }
    return 0;
}