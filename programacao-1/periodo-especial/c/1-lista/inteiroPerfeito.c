#include <stdio.h>

int main(){
    int valor, soma, indice, perfeito;

    scanf("%d", &valor);

    indice = 0;

    for (int numero = 1; indice < valor ; numero++){
        soma = 0;

        for (int divisor = 1; divisor <= numero/2; divisor++)        
            if ( numero % divisor == 0 )
                soma += divisor;

        if ( numero == soma ){
            indice++;
            printf("%d ", numero);
        }
    }
    printf("\n");
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
Um inteiro positivo $N$ é
considerado perfeito se o mesmo for igual a soma de seus divisores positivos 
diferentes de $N$.
Exemplo: 6 é
perfeito pois 1 + 2 + 3 = 6 e 1, 2 e 3 são todos
os divisores positivos de 6 e que são diferentes de 6.
Faça um programa que leia um número inteiro positivo $K$ e mostre os $K$ 
primeiros números que são perfeitos.

Exemplos:
Entrada 1:
1
Saída Esperada 1:
6

Entrada 2:
2
Saída Esperada 2:
6 28
*/