#include <stdio.h>

#define MAX 105
#define LEFT 1
#define RIGHT 0
#define UP 1
#define DOWN 0


int rows(int row, int start, int end, int direction, int array[MAX][MAX]){
    if (direction == RIGHT){ 
        for (int i = start; i < end; i++)
            if (array[row][i] + 1 != array[row][i + 1])
                return 0;
    }
    else {
        for (int i = start; i > end; i--)
            if (array[row][i] + 1 != array[row][i - 1])
                return 0;
    }
    return 1;
}

// decide a direcao em que o for deve iterar
// para as duas funcoes, eh comparado o valor na posicao 
// atual + 1 com o da proxima posicao, se forem diferentes,
// eh retornado 0, imprimindo entao que nao eh uma matriz inca

int columns(int column, int start, int end, int direction, int array[MAX][MAX]){
    if (direction == DOWN){ 
        for (int i = start; i < end; i++)
            if (array[i][column] + 1 != array[i + 1][column])
                return 0;
    }
    else {
        for (int i = start; i > end; i--)
            if (array[i][column] + 1 != array[i - 1][column])
                return 0;
    }
    return 1;
}


int main(){

    int spiral[MAX][MAX];
    int size, flag, topRow, bottomRow, leftColumn, rightColumn;

    scanf(" %d", &size);                                   
    while (size < 1 || size > 100){
        printf("Insira um valor entre 1 e 100\n");
        scanf(" %d", &size);                                   
    }

    for (int i = 0; i < size; i++)
        for (int j = 0; j < size; j++)
            scanf(" %d", &spiral[i][j]);

    flag = 1;
    topRow = leftColumn = 0;
    bottomRow = rightColumn = size - 1;
    int startUpRow = 0;

    for (; topRow < bottomRow; topRow++, rightColumn--, bottomRow--, leftColumn++ ){

        int endUpRow = rightColumn;
        
        int startRightColumn = topRow;
        int endRightColumn = bottomRow;

        int startDownRow = rightColumn;
        int endDownRow = leftColumn;

        int startLeftColumn = bottomRow;
        int endLeftColumn = topRow + 1;

        // usa o desenho de uma spiral e suas direcoes
        // para fazer os limites das iteracoes dos for's
        // sobre as linhas e colunas da matriz
        
        if ( !rows(topRow, startUpRow, endUpRow, RIGHT, spiral) 
        || !columns(rightColumn, startRightColumn, endRightColumn, DOWN, spiral) 
        || !rows(bottomRow, startDownRow, endDownRow, LEFT, spiral) 
        || !columns(leftColumn, startLeftColumn, endLeftColumn, UP, spiral) 
        ){
            flag = 0;
            break;
        }

        startUpRow = endLeftColumn - 1;
    }

    if (flag)
            printf("A matriz eh inca\n"); 
    else
            printf("A matriz nao eh inca\n");

    return 0;
}
