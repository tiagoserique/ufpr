#include <stdio.h>

int main(){
    int linha, coluna;

    scanf("%d %d", &linha, &coluna);

    if ( ( linha > 0 ) && ( coluna > 0 ) && ( (linha + coluna) % 2 == 1 ))
        printf("PRETA\n");
    else if ( ( linha > 0 ) && ( coluna > 0 ) && ( (linha + coluna) % 2 == 0 ))
        printf("BRANCA\n");
    else
        printf("ERRO\n");

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
No tabuleiro de xadrez, a casa na linha 1, coluna 1 (canto superior esquerdo) é 
sempre branca e as cores das casas se alternam entre branca e preta, de acordo 
com o padrão conhecido como... xadrez! Dessa forma, como o tabuleiro tradicional
 tem oito linhas e oito colunas, a casa na linha 8, coluna 8 (canto inferior 
 direito) será também branca. Neste problema, entretanto, queremos saber a cor 
 da casa no canto inferior direito de um tabuleiro com dimensões quaisquer: L 
 linhas e C colunas.
Faça um programa que leia do teclado dois números inteiros representando 
respectivamente o número de linhas $L$ e colunas $C$ do tabuleiro e verifique 
se a cor da casa no canto inferior direito desse tabuleiro será branca ou preta.
Seu programa deve imprimir ``ERRO'' se os números forem inválidos.

Exemplos:
Entrada 1:
6 9
Saída Esperada 1:
PRETA

Entrada 2:
8 8
Saída Esperada 2:
BRANCA
*/