#include <stdio.h>

int main(){
    float popA, popB, menorPop, maiorPop, taxA, taxB, taxMenorPop, taxMaiorPop;
    int anos;

    scanf(" %f %f", &popA, &popB);
    scanf(" %f %f", &taxA, &taxB);

    if ( popA > popB ){
        menorPop = popB;
        maiorPop = popA;
        taxMenorPop = taxB;
        taxMaiorPop = taxA;
    }
    else {
        menorPop = popA;
        maiorPop = popB;
        taxMenorPop = taxA;
        taxMaiorPop = taxB;
    }

    if ( taxMenorPop > taxMaiorPop ){
        for (anos = 0; menorPop < maiorPop ; anos++){
            menorPop += menorPop * taxMenorPop;
            maiorPop += maiorPop * taxMaiorPop;
        }
        printf("%d \n", anos);
    }
    else
        printf("0\n");

    return 0;
}

/*
%Revisado por:
%Arthur D. V. de Castro
%Artur T. Coelho
%Eduardo M. de Souza
%Gabriel H. O. de Mello
%Gabriel N. H. do Nascimento
%Gustavo H. S. Barbosa
%Jorge L. V. Jabczenski
%Leonardo L. Dionízio
%Pietro P. Cavassin
%Tiago H. Conte
%Vinicius T. V. Date

%Revisao: Gabriel Nascarella
%medio
Dadas as populações $Pa$ e $Pb$ de duas cidades $A$ e $B$ (no ano atual) e suas 
respectivas taxas de crescimento anual $Ta$ e $Tb$, faça um programa que receba 
estas informações como entrada ($Pa, Pb, Ta, Tb$) e determine se a população da 
cidade de menor população ultrapassará a de maior população e se sim, imprima em
 quantos anos que isto ocorrerá. Caso contrário, imprima 0.

Exemplos:
Entrada 1:
300 500 0.12 0.05
Saída Esperada 1:
8

Entrada 2:
300 500 0.1 0.5
Saída Esperada 2:
0
*/