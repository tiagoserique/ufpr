#include <stdio.h>

int main(){

    struct pilha *p1 = inicializaPilha();

    pop(p1);
    mostraPilha(p1);
    
    push(p1, 1);
    mostraPilha(p1);
    
    push(p1, 2);
    mostraPilha(p1);
    
    push(p1, 3);
    mostraPilha(p1);
    
    push(p1, 4);
    mostraPilha(p1);

    push(p1, 5);
    mostraPilha(p1);

    push(p1, 6);
    mostraPilha(p1);

    pop(p1);
    mostraPilha(p1);
    
    buscaElemento(p1, 2);

    mostraTopo(p1);

    esvaziaPilha(p1);
    mostraPilha(p1);

    destroiPilha(p1);

    return 0;
}