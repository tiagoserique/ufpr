#include <stdio.h>

int main(){
    int i, j, k, soma, media;

    scanf(" %d %d %d", &i, &j, &k);

    if (( j % i == 0) && ( k % j == 0 )){    
        soma = j + i + k;
        printf("%d\n", soma);
    }
    else if (( i + 1 == j ) && ( j + 1 == k ))
        printf("%d %d %d\n", k, j, i);
    else {
        media = ( i + j + k )/3;
        printf("%d\n", media);
    }
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

%dificil
Faça um programa que leia do teclado
três números inteiros positivos: i, j e k. Se j for múltiplo de i e k for múltiplo de j,
o programa deve imprimir a soma dos três.
Se os três valores forem consecutivos na ordem lida, o programa deve imprimi-los na ordem decrescente.
Em qualquer outra situação, o programa deve calcular e imprimir a média aritmética simples dos três valores.

Exemplos:
Entrada 1:
33 165 495
Saída Esperada 1:
693

Entrada 2:
74 75 76
Saída Esperada 2:
76 75 74

Entrada 3:
7 20 12
Saída Esperada 3:
13
*/