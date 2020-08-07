#include <stdio.h>

#define MAX 1000000

int main(){
    int soma, valor, auxValor, indiceSoma, fimSoma, intervalo, auxIntervalo;

    int vet[MAX];

    scanf("%d", &valor);
    auxValor = valor;
    intervalo = 0;

    while (( auxValor != 0 ) && ( valor > 9 )){
        auxValor /= 10;
        intervalo++;
    }

    auxValor = valor;
    auxIntervalo = intervalo - 1;

    while (( auxValor != 0 ) && ( valor > 9 )){
        vet[auxIntervalo] = auxValor % 10;
        auxValor /= 10;
        auxIntervalo--;
    }

    indiceSoma = soma = 0;

    while (( soma < valor ) && ( valor > 9 )) {
        fimSoma = intervalo + indiceSoma;
        soma = 0;

        for (int indice = indiceSoma; indice < fimSoma; indice++)
            soma += vet[indice];

        vet[fimSoma] = soma;
        indiceSoma++;
    }

    if ( soma == valor )
        printf("1\n");
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

dificil
Um número de Keith é um número inteiro, superior a 9, tal que os seus 
algarismos, ao começarem uma sequência de Fibonacci (formada por somas de 2-em-2
 números, ou de 3-em-3, ou de 4-em-4, e assim por diante), alcançam 
 posteriormente o referido número. Um exemplo é 47, porque a sequência de 
 Fibonacci que começa com 4 e 7 (4, 7, 11, 18, 29, 47) alcança o 47. 
 Outro exemplo, mas que possui três algarismos, é 197: 1+9+7=17, 9+7+17=33, 
 7+17+33=57, 17+33+57=107, 33+57+107=197. Faça um programa que receba um número 
 inteiro positivo de até 2 algarismos do teclado e imprima 1 caso o número seja 
 de Keith e 0 caso contrário.

Exemplos:
Entrada 1:
47
Saída Esperada 1:
1

Entrada 2:
48
Saída Esperada 2:
0
*/