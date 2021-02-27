#include "biblioteca.h"
#include "quebrador-senha.h"

#define MAXCHARS 6

int repetido(int valor, int qtdChars, char solucao[]){
	for (int i = 0; i <= qtdChars; i++)
		if (valor == solucao[i])
			return 1;
	return 0;
}

int resolveProblemaBacktracking(char solucao[], int qtdChars, int qtdNums, 
int qtdLetras){
	int i;
	
	if ( qtdChars == MAXCHARS ){
		return login(solucao);
	}

	// letras
	for (i = 97; i <= 122; i++){
		if ( !repetido(i, qtdChars, solucao) ){
			if ( qtdLetras < 4 ){
				solucao[qtdChars] = i;
				
				if (resolveProblemaBacktracking(solucao, ++qtdChars, qtdNums, 
				++qtdLetras))
					return 1;
				else {
					qtdChars--;
					solucao[qtdChars] = '\0'; //backtracking
					qtdLetras--;
				}
			}
			else
				break;
		}
	}
	
	// numeros
	for (i = 48; i <= 57; i++){
		if ( !repetido(i, qtdChars, solucao)){
			if ( qtdNums < 4 ){
				solucao[qtdChars] = i;
				
				if (resolveProblemaBacktracking(solucao, ++qtdChars, ++qtdNums, 
				qtdLetras))
					return 1;
				else {
					qtdChars--;
					solucao[qtdChars] = '\0'; //backtracking
					qtdNums--;
				}
			}
			else
				break;
		}
	}

	return 0;
}

/* Retorna 1 caso tenha encontrado a senha e 0 caso contrario */
int quebrador_senha_backtracking(){
	int qtdChars = 0, qtdNums = 0, qtdLetras = 0;
	char solucao[MAXCHARS + 1] = "";

	return resolveProblemaBacktracking(solucao, qtdChars, qtdNums, qtdLetras);
}


int resolveProblemaExaustivo(char solucao[], int qtdChars){
	int i;
	
	if ( qtdChars == MAXCHARS ){
		return login(solucao);
	}

	// letras
	for (i = 97; i <= 122; i++){
		solucao[qtdChars] = i;
		
		if (resolveProblemaExaustivo(solucao, ++qtdChars))
			return 1;
		else {
			qtdChars--;
			solucao[qtdChars] = '\0';
		}
	}

	// numeros
	for (i = 48; i <= 57; i++){
		solucao[qtdChars] = i;
		
		if (resolveProblemaExaustivo(solucao, ++qtdChars))
			return 1;
		else {
			qtdChars--;
			solucao[qtdChars] = '\0';
		}
	}

	return 0;
}


/* Retorna 1 caso tenha encontrado a senha e 0 caso contrario */
int quebrador_senha_exaustivo(){
	int qtdChars = 0, qtdNums = 0, qtdLetras = 0;
	char solucao[MAXCHARS + 1] = "";

	return resolveProblemaExaustivo(solucao, qtdChars);
}
