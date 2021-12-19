/* Trabalho 1 - CI1164 (2021-1 ERE)
Prof. Dr. Guilherme Alex Derenievicz

Autores:
Tiago Serique Valadares (GRR20195138)
Fernanda Yukari Kawasaki (GRR20185057)
*/


#include "gauss.h"


/*
*	Encontra o valor maximo da coluna especificada para usar de pivo
*
*	@param	matriz_coef		matriz em que se deseja achar o pivo
*	@param	coluna			coluna em que se deseja achar o pivo
*	@param	n				dimensao do sistema linear
*
*	@return	posicao que contem o valor maximo
*/
int encontra_maximo(double **matriz_coef, int coluna, uint n){
	int maximo = coluna;
	
	for (int linha = coluna + 1; linha < n; linha++)
		if ( matriz_coef[maximo][coluna] - matriz_coef[linha][coluna] < __DBL_EPSILON__ )
			maximo = linha;

	return maximo;
}


/*
*	Troca as linhas da matriz de coeficientes e do vetor de termos independentes
*
*	@param	matriz_coef		matriz com as linhas que serao trocadas
*	@param 	vet_termos 		vetor que tera as linhas trocadas
*	@param 	linha			linha que deseja-se "descer"
*	@param 	pivo			linha que deseja-se "subir"
* 	@param 	n				dimensao do sistema linear
*
*/
void troca_linha(double **matriz_coef, double *vet_termos, int linha, uint pivo,
 uint n){
	
	double temp = 0.0;

	for (int j = 0; j < n; j++){
		temp 					= matriz_coef[linha][j];
		matriz_coef[linha][j] 	= matriz_coef[pivo][j];
		matriz_coef[pivo][j] 	= temp;
	}

	temp 				= vet_termos[linha];
	vet_termos[linha] 	= vet_termos[pivo];
	vet_termos[pivo] 	= temp;
}


/*
*	Realiza o metodo de eleminacao de gauss para resolver sistemas lineares
*
*	@param	matriz_coef		matriz com coeficientes do sistema linear que se 
*							deseja resolver
*	@param	vet_termos		vetor com os termos independentes do sistema linear
*	@param	n				dimensao do sistema linear
*/
int eliminacao_gauss(double **matriz_coef, double *vet_termos, uint n){
	for (int i = 0; i < n; i++){
		uint pivo = encontra_maximo(matriz_coef, i, n);

		// Pivoteamento parcial, so troca as linhas
		if ( i != pivo )
			troca_linha(matriz_coef, vet_termos, i, pivo, n);

		for (int k = i + 1; k < n; k++){
			if ( fabs(matriz_coef[i][i] - 0.0) < __DBL_EPSILON__){
				fprintf(stderr, "Divisao por 0 em \"eliminacao_gauss\"");
				return EXIT_FAILURE;
			}

			double m = matriz_coef[k][i] / matriz_coef[i][i];
			matriz_coef[k][i] = 0.0;

			for (int j = i + 1; j < n; j++)
				matriz_coef[k][j] -= matriz_coef[i][j] * m;

			vet_termos[k] -= vet_termos[i] * m;
		}
	}
	return EXIT_SUCCESS;
}


/*
*	Realiza a retrossubstituicao das incognitas,
*	ou seja, substitui os valores das incognitas
*	nas equacoes e utiliza os resultados obtidos
*	para calcular as proximas equacoes.
*
*	@param	matriz_coef		matriz de coeficientes J(X^(i))
*	@param	vet_termos		vetor com os termos independentes - F(X^(i))
*	@param	x				vetor com as aproximacoes delta^(i)
*	@param	n				dimensoes do sistema
*
*/
int retrossub(double **matriz_coef, double *vet_termos, double *x, uint n){
	for (int i = (n) - 1; i >= 0; --i){
		x[i] = vet_termos[i];
		// Realiza a conta na triangular superior
		for (int j = i + 1; j < n; ++j){  // nao inclui a diagonal
			x[i] -= matriz_coef[i][j] * x[j];
		}
		
		if ( fabs(matriz_coef[i][i] - 0.0) < __DBL_EPSILON__){
			fprintf(stderr, "Divisao por 0 em \"eliminacao_gauss\"");
			return EXIT_FAILURE;
		}

		x[i] /= matriz_coef[i][i];
	}
	return EXIT_SUCCESS;
}