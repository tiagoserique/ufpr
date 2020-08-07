#include <stdio.h>

int main(){
    int numero;

    numero = 1;

    for (; numero != 0;){
        scanf("%d", &numero);

        for (int indice = 1; indice <= 10 && numero != 0; indice++){
            printf("%d ", numero*indice);
        }
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

%medio
Faça um programa que leia do teclado uma sequência de $N > 0$ números inteiros quaisquer.
Para cada valor lido, se ele for positivo, imprima os primeiros 10 múltiplos dele.
Assuma que a sequência tenha pelo menos 1 número e que ela termina com 0.
O zero serve para indicar o final da entrada de dados e não deverá ser processado.

Exemplos:
Entrada 1:
1 9 0
Saída esperada:
1 2 3 4 5 6 7 8 9 10 9 18 27 36 45 54 63 72 81 90

Entrada 2:
4 2 0
Saída Esperada:
4 8 12 16 20 24 28 32 26 40 2 4 6 8 10 12 14 16 18 20
*/