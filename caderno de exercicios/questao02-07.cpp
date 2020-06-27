#include <iostream>
using namespace std;

int mdcs[1000];
int qtd[1000];

int busca(int vetor[], int buscando,int inicio, int tamanho){
    int meio = (inicio + tamanho)/2;
    if (tamanho < inicio)
        return -1;
    else if (buscando == vetor[meio])
        return meio;
    else if (buscando > vetor[meio])
        return busca(vetor, buscando, meio + 1, tamanho);
    else
        return busca(vetor, buscando, inicio, meio -1);
}

int main(){
    int n;
    int tamanho = 0;
    scanf("%d", &n);

    for (int i = 0; i < n; i++){
        int valor;
        int dividendo = 1;
        int y;
        scanf("%d", &valor);
        
        while (valor >= dividendo && i > 0){
            y = busca(mdcs, dividendo, 0, tamanho);
//printf("%d  %d | ", dividendo, y);
            if (valor % dividendo == 0 && y != -1)
                qtd[y] += 1;
            dividendo += 1;
        }

        while (valor >= dividendo && i == 0){
            if (valor % dividendo == 0){
                mdcs[tamanho] = dividendo;
                qtd[tamanho] = 1;
                tamanho += 1;
            }
            dividendo += 1;
        }
    }

    for (int i = 0; i < tamanho; i++){
        printf("mdc: %d | qtd: %d\n", mdcs[i], qtd[i]);
    }
    int y = busca(qtd, n, 0, tamanho);
        printf("O mdc eh: %d \n", mdcs[y]);
}
