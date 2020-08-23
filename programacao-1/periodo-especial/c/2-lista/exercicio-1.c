#include <stdio.h>

int tamanhoFrase, tamanhoPalavra;

int checagem(char frase[tamanhoFrase], char palavra[tamanhoPalavra], 
int indiceFrase){

    int indicePalavra;

    for (indicePalavra = 0; indicePalavra < tamanhoPalavra; indicePalavra++){
        if (frase[indiceFrase] != palavra[indicePalavra])
            return 0;
        else
            indiceFrase++;
    }

    return indiceFrase - indicePalavra + 1;
}

int main(){
    
    int indiceFrase, repeticoes, posicoes[tamanhoFrase];

    scanf(" %d", &tamanhoFrase);
    scanf(" %d", &tamanhoPalavra);

    char frase[tamanhoFrase], palavra[tamanhoPalavra];

    indiceFrase = 0;
    
    scanf(" %[^\n]", frase);

    scanf("%s", palavra);

    repeticoes = indiceFrase = 0;

    while ( frase[indiceFrase] != '\0' ){

        posicoes[repeticoes] = checagem(frase, palavra, indiceFrase);

        if ( posicoes[repeticoes] != 0 )
            repeticoes++;

        indiceFrase++;
    }

    printf("%d ", repeticoes);

    int indice;

    for (indice = 0; indice < repeticoes; indice++)
        printf("%d ", posicoes[indice]);
    printf("\n");

/*    int indice;

    for (indice = 0; indice < tamanhoFrase; indice++)
        printf("%c", frase[indice]);
    printf("\n");*/

    return 0;
}