#include <stdio.h>
#include <stdlib.h>

#define MAX 8
#define NUM_BARCOS 4
#define AGUA 0
#define SUBMARINO 1
#define CRUZADOR 2
#define ENCOURACADO 3
#define PORTA_AVIOES 5
#define TIRO 8

int acabaJogo(int tabuleiro[MAX][MAX]){
    for (int i = 0; i < MAX; i++)
        for (int j = 0; j < MAX; j++)
            if ( tabuleiro[i][j] != AGUA && tabuleiro[i][j] != TIRO )
                return 0;
    return 1;
}

int comparaString(char char1[20], char char2[20]){
    int i = 0;
    while ( char1[i] != '\0' && char2[i] != '\0' ){
        if ( char1[i] != char2[i] )
            return 0;
        i++;
    }
    return 1;
}

void adicionaNoTabuleiro(int tabuleiro[MAX][MAX], int linha, int coluna, 
int valorParaACasa, char formaDeColocar[20]){

    if ( comparaString(formaDeColocar, "horizontal") )
        for (int index = coluna; index < (coluna + valorParaACasa); index++)
            tabuleiro[linha][index] = valorParaACasa;
    else if ( comparaString(formaDeColocar, "vertical") )
        for (int index = linha; index < (linha + valorParaACasa); index++)
            tabuleiro[index][coluna] = valorParaACasa;
    else if ( comparaString(formaDeColocar, "unico") ){
        tabuleiro[linha][coluna] = valorParaACasa;
    }
}

void tentaAfundar(int tabuleiro[MAX][MAX]){

    int linha, coluna;

    linha = rand() % 8;
    coluna = rand() % 8;

    if ( tabuleiro[linha][coluna] == TIRO ){
        tentaAfundar(tabuleiro);
    }
    else
        adicionaNoTabuleiro(tabuleiro, linha, coluna, TIRO, "unico");
        
    return;
}

int validaCoordenada(int tabuleiro[MAX][MAX], int linha, int coluna, 
int valorDoBarco, char formaDeColocar[20]){

    if ( comparaString(formaDeColocar, "horizontal") ){
        
        if (MAX - coluna < valorDoBarco)
            return -2;

        for (int index = coluna; index < (coluna + valorDoBarco); index++){
            if ( tabuleiro[linha][index] != AGUA )
                return 0; 
        }
    }
    else if ( comparaString(formaDeColocar, "vertical") ){
        
        if (MAX - linha < valorDoBarco)
            return -3;

        for (int index = linha; index < (linha + valorDoBarco); index++){
            if ( tabuleiro[index][coluna] != AGUA )  
                return 0;
        }
    }
    else if ( !comparaString(formaDeColocar, "vertical") ){
        if ( tabuleiro[linha][coluna] != AGUA )  
            return 0;
    } 
    else if ( !comparaString(formaDeColocar, "vertical") 
    && !comparaString(formaDeColocar, "horizontal") 
    && !comparaString(formaDeColocar, "unico") )
        return -1;
    
    return 1;
}

int quantidadeDeCasasParaCadaBarco(char barco[20]){
    if ( comparaString(barco, "submarino") ){
        return SUBMARINO;
    }
    else if ( comparaString(barco, "cruzador") ){
        return CRUZADOR;
    }
    else if ( comparaString(barco, "encouraçado") ){
        return ENCOURACADO;
    }
    else if ( comparaString(barco, "porta-avioes") ){
        return PORTA_AVIOES;
    }
    return -1;
}

void mostraTabuleiro(int tabuleiro[MAX][MAX]){
    printf("\n");
    for (int i = 0; i < MAX; i++){
        for (int j = 0; j < MAX; j++){
            printf(" %d", tabuleiro[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

void criaTabuleiro(int tabuleiro[MAX][MAX]){
    for (int i = 0; i < MAX; i++){
        for (int j = 0; j < MAX; j++){
            tabuleiro[i][j] = AGUA;
        }
    }
}

int main(){
    int tabuleiro[MAX][MAX], linha, coluna;
    int casas, coordenadaValida;
    int quantidadeDeTiros = 0;
    char barco[20];

    criaTabuleiro(tabuleiro);

    for (int i = 0; i < NUM_BARCOS; i++){
        printf("\nDigite o nome do barco (submarino, cruzador, encouraçado ou porta-avioes)\n");
        scanf(" %s", barco);
        printf("\nDigite as coordenadas para o %s (linha coluna)(1 - 8)\n", barco);
        scanf(" %d %d", &linha, &coluna);
        
        linha -= 1;
        coluna -= 1;
        char orientacao[20] = "unico";

        casas = quantidadeDeCasasParaCadaBarco(barco);

        if ( casas != SUBMARINO ){
            printf("\nDigite a orientacao para o %s (vertical ou horizontal)\n", barco);
            scanf(" %s", orientacao);
        }

        coordenadaValida = validaCoordenada(tabuleiro, linha, coluna, casas, orientacao);
        
        if ( coordenadaValida <= 0 || casas < 0 ){
            if ( casas < 0)
                printf("\nBarco invalido\n\n");
            else if ( coordenadaValida == -1 ){
                printf("\nOrientação invalida\n\n");
            }
            else if ( coordenadaValida == -2 ){
                printf("\nNao cabe na linha\n\n");
            }
            else if ( coordenadaValida == -3 ){
                printf("\nNao cabe na coluna\n\n");
            }
            else {    
                printf("\nCoordenada invalida\n\n");
            }

            mostraTabuleiro(tabuleiro);
            i--;
        }
        else {
            adicionaNoTabuleiro(tabuleiro, linha, coluna, casas, orientacao);
            mostraTabuleiro(tabuleiro);
        }
    }

    do {
        tentaAfundar(tabuleiro);
        quantidadeDeTiros++;
    } while ( !acabaJogo(tabuleiro) );

    printf("Foram disparados %d tiros\n", quantidadeDeTiros);

    return 0;
}

/*
Batalha Naval

            Vocês vão jogar batalha naval contra o computador. Vocês devem fazer
             um programa que crie uma matriz 8x8, que será o campo do jogo. Cada
              posição da matriz é uma posição do tabuleiro do jogo de batalha 
              naval. A entrada do programa é a posição de cada um dos barcos. 
              O usuário deve digitar o barco, as coordenadas do canto esquerdo 
              superior e a orientação, vertical ou horizontal. Vocês devem 
              colocar os barcos no tabuleiro e mostrar o tabuleiro para o 
              usuário na tela. Cuidem para que dois navios não ocupem uma mesma 
              posição do tabuleiro. Caso isso ocorra, vocês devem reportar o 
              erro para o usuário e solicitar a correção.

            A representação na tela deve seguir o seguinte padrão:

    0- agua
    1- submarino (1 casa do tabuleiro)
    2- cruzador (2 casas do tabuleiro)
    3- encouraçado (3 casas do tabuleiro)
    5- porta-aviões  (5 casas do tabuleiro)

Depois de carregado o tabuleiro, o programa tentará afundar os navios. 
O programa deve executar até afundar todos os navios, e deve contar quantos 
tiros foram dados para conseguir afundá-los. Os tiros devem ser feitos sorteando
 aleatoriamente as duas coordenadas do mapa. Para o sorteio aleatório vocês 
 devem usar a função rand() que está na biblioteca stdlib.h.

Quando todos os navios forem afundados vocês devem finalizar o programa e 
mostrar para o usuário quantos tiros foram dados.

Voces devem enviar um arquivo com o programa C, chamado bn.c
*/
