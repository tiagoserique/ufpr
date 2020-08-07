#include <stdio.h>

int main(){
    int numero, soma, flag;

    scanf("%d", &numero);

    flag = 0;

    if (numero >= 0){
        for (int i = 0; i <= numero/2; i++){
            soma =  i * (i + 1) * (i + 2);
            if ( soma == numero ){
                flag = 1;
                break;
            } 
        }
    }
    if (flag == 1)
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

%facil
Um número inteiro positivo é dito triangular se seu valor é o produto de três 
números naturais consecutivos. Por exemplo, o número 120 é triangular porque 
[ 120 = 4\times5\times6 ].

Faça um programa que leia do teclado um número inteiro positivo n e verifique se
 ele é triangular ou não. Se for, imprima 1'' e se não for, imprima0''.

Exemplos:
Entrada 1:
120
Saída Esperada 1:
1

Entrada 2:
123
Saída Esperada 2:
0

Entrada 3:
6
Saída Esperada 3:
1
*/