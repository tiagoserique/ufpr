#ifndef __MEU_ALOCADOR_H__
#define __MEU_ALOCADOR_H__


// Protótipos (seção 6.1.2 e Projeto de Implementação 6.2)


// Executa syscall brk para obter o endereço do topo
// corrente da heap e o armazena em uma
// variável global, topoInicialHeap.
void iniciaAlocador();


// Executa syscall brk para restaurar o valor
// original da heap contido em topoInicialHeap.
void finalizaAlocador(); 


// indica que o bloco está livre.
int liberaMem(void* bloco); 


// 1. Procura um bloco livre com tamanho maior ou
//    igual à num_bytes.
// 2. Se encontrar, indica que o bloco está
//    ocupado e retorna o endereço inicial do bloco;
// 3. Se não encontrar, abre espaço
//    para um novo bloco usando a syscall brk,
//    indica que o bloco está ocupado e
//    retorna o endereço inicial do bloco.
void* alocaMem(int num_bytes);


// imprime um mapa da memória da região da heap.
// Cada byte da parte gerencial do nó deve ser impresso
// com o caractere "#". O caractere usado para
// a impressão dos bytes do bloco de cada nó depende
// se o bloco estiver livre ou ocupado. Se estiver livre, imprime o
// caractere -". Se estiver ocupado, imprime o caractere "+".
void imprimeMapa();       

#endif