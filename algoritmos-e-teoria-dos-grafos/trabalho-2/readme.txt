Aluno: Tiago Serique Valadares - GRR20195138

// -----------------------------------------------------------------------------
grafo le_grafo(void);
utiliza a função agread() da biblioteca para fazer a leitura dos arquivos .dot 
e montar o grafo.

// -----------------------------------------------------------------------------
void destroi_grafo(grafo g);
utiliza a função agclose() da biblioteca para destruir o grafo.

// -----------------------------------------------------------------------------
grafo escreve_grafo(grafo g);
utiliza a função agwrite() da biblioteca para escrever o grafo na saída padrão.

// -----------------------------------------------------------------------------
int n_vertices(grafo g);
utiliza a função agnnodes() da biblioteca para retornar o número de vértices.

// -----------------------------------------------------------------------------
int n_arestas(grafo g);
utiliza a função agnedges() da biblioteca para retornar o número de arestas.

// -----------------------------------------------------------------------------
int grau(vertice v, grafo g);
utiliza a função agdegree() da biblioteca para retornar o grau de um vértice.

// -----------------------------------------------------------------------------
int grau_maximo(grafo g);
faz a busca do grau máximo do grafo percorrendo cada vértice e calculando o 
cada grau e comparando com o maior anterior.

// -----------------------------------------------------------------------------
int grau_minimo(grafo g);
faz a busca do grau mínimo do grafo percorrendo cada vértice e calculando o 
cada grau e comparando com o menor anterior.

// -----------------------------------------------------------------------------
int grau_medio(grafo g);
faz o cálculo do grau médio do grafo dividindo o número de arestas pelo número
de vértices vezes dois.

//------------------------------------------------------------------------------
int regular(grafo g);
pega o grau do primeiro vértice e compara com o grau dos outros vértices. Se 
todos forem iguais, o grafo é regular.

//------------------------------------------------------------------------------
int completo(grafo g);
checa se todo vértice do grafo possui grau igual ao número de vértices do grafo
menos um.

//------------------------------------------------------------------------------
int conexo(grafo g);
traça o caminho do primeiro vértice para cada um dos outros vértices, se não 
houver caminho para algum dos vértices, então o grafo não é conexo, mas se 
houver caminho, então há caminho de todos vértices para todos os outros.

//------------------------------------------------------------------------------
int bipartido(grafo g);
cria um vetor para armazenar os vértices do grafo, afim de usar cada vértice 
como um indice. Cria um vetor de cores para armazenar a cor de cada vértice.
Pinta cada vértice novo com uma cor e, caso seu vizinho não tenha cor, pinta ele
com a cor oposta a sua. Caso seu vizinho tenha cor, checa se a cor é diferente 
da cor do vértice atual. Se for igual, retorna 0.

//------------------------------------------------------------------------------
int n_triangulos(grafo g);
itera sobre os vértices do grafo três vezes de forma que não se repita no for de
baixo. Se os três vértices forem adjacentes entre si, incrementa o número de 
triângulos.

//------------------------------------------------------------------------------
int **matriz_adjacencia(grafo g);
itera entre cada vértice do grafo duas vezes e preenche a matriz alocada com a 
adjacencia entre os vértices usando o retorno da função agedge().

//------------------------------------------------------------------------------
grafo complemento(grafo g);
cria um novo grafo com os vértices do grafo original e itera entre cada vértice 
como uma matriz e checa se há aquela aresta no grafo original, senão houver, 
cria no grafo novo e vice-versa.

