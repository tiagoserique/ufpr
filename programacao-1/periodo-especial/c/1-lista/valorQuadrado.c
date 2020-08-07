#include <stdio.h>

int main(){
    int flag = 1;
    int valor, quadrado;
    
    valor = quadrado = 0;

    while ( flag == 1 ){
        scanf("%d", &valor);

        if (( valor == 0 ) && ( quadrado != 0 ))
            break;

        scanf("%d", &quadrado);
        if ( quadrado != valor*valor )
            flag = 0;
    }

    if ( flag == 0 )
        printf("%d\n", flag);
    else
        printf("%d\n", flag);

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

medio
A definição de uma série de pares Valor-Quadrado em Matemática é dada pela 
presença de elementos numéricos, organizados em sequências dois-a-dois, em que 
cada número é seguido de seu quadrado exatamente uma vez 
(veja os exemplos abaixo).

Faça um programa que leia do teclado uma sequência com uma quantidade arbitrária
de valores inteiros positivos. A sequência termina com o valor 0, que
serve para indicar o final da entrada de dados e não deverá ser processado.
O programa deve determinar e imprimir se a série é ou não do tipo Valor-Quadrado
imprimindo 1 caso seja e 0 caso não seja.

Exemplos:
Entrada 1:
25 625 7 49 10 100 8 64 0
Saída Esperada 1:
1

Entrada 2:
6 36 4 16 9 30 5 25 0
Saída Esperada 2:
0

Entrada 3:
2 4 3 9 4 16 5 25 0
Saída Esperada 3:
1
*/
