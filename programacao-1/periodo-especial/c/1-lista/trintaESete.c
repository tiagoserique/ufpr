#include <stdio.h>

int main(){
    int numero, auxNumero, soma;

    scanf(" %d", &numero);

    auxNumero = numero * 37;
    soma = 0;

    while (auxNumero != 0){
        soma += auxNumero % 10;
        auxNumero /= 10;
    }

    if (soma == numero)
        printf("SIM\n");
    else
        printf("NAO\n");

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
Se multiplicarmos 37 por alguns números, obteremos números cujos algarismos, quando somados, resultam no mesmo número que foi multiplicado pelo 37.
Por exemplo, se tomarmos o número 15, multiplicando-o por 37, obtemos 555. Somando-se 5 + 5 + 5 resulta em 15.
Faça um programa que leia um número inteiro positivo do teclado, calcule o resultado da multiplicação por 37, some os algarismos do resultado,
compare essa soma com o número lido e imprima SIM'' se há coincidência ouNAO'' se não há coincidência.

Exemplos:
Entrada 1:
15
Saída Esperada 1:
SIM

Entrada 2:
26
Saída Esperada 2:
NAO
*/