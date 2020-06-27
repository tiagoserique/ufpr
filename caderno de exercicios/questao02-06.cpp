#include <iostream>
using namespace std;

const int l = 2;
const int c = 100000;

int main(){
    int n;
    int matriz[l][c];

    cin >> n;
    int cont = 0;
    int primo = 2;
    while (n > 1){
        matriz[0][cont] = primo;
        while (n % primo == 0){
            n = n/primo;
            matriz[1][cont] += 1;
        }
        primo+=1;
        cont+=1;
    }

    for (int i = 0; i < cont; i++){
        if (matriz[1][i] == 0)
            continue;
        printf("fator %d | multiplicidade %d\n", matriz[0][i], matriz[1][i]);
    }
}
