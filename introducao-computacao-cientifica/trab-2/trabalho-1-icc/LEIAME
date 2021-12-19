Trabalho 1 - CI1164 (2021-1 ERE)
Prof. Dr. Guilherme Alex Derenievicz

Alunos:
Tiago Serique Valadares - GRR20195138 - tsv19
Fernanda Yukari Kawasaki - GRR20185057 - fyk18

--------------------------------------------------------------------------------
# Execucao

Para executar o código, basta rodar os comandos:
$ make
$ ./newtonSNL -o sample.out < sample.in

O arquivo de input eh feito pela entrada padrao;
O arquivo para output eh feito usando o parametro "-o". Se nao for especificado,
o output vai para a saida padrao

--------------------------------------------------------------------------------

# Entrada
O trabalho desenvolvido resolve varios sistemas nao lineares utilizando o metodo
de Newton.

O arquivo de input eh recebido pela entrada padrao (stdin) e os valores de cada
bloco sao lidos em loop e armazenados na struct SNL_T, o que pode ser visto na
funcao "le_input". O loop ocorre ate chegar no final do arquivo, e em cada
iteracao o sistema do bloco lido eh resolvido.

--------------------------------------------------------------------------------

# Estruturas de dados
A estrutura SNL_T contem os seguintes elementos:
- unsigned int n:       eh a dimensao do sistema. Fornecida pelo usuario na entrada padrao
- int **expressoes:		vetor F(X) com as expressoes das funcoes nao lineares que compoem o sistema.
                        As expressoes sao objetos evaluator.
- void ***derivadas:	matriz F'(X) com as derivadas das equacoes nao lineares.
                        Os valores armazenados sao objetos evaluator
- double *incognitas:	aproximacao das incognitas X (de x1 ate xn). A aproximacao
                        inicial eh dada pelo usuario
- double *termos_indep: vetor de termos independentes. Contem os valores - F(X)

Note que expressoes e derivadas sao os proprios objetos evalutor. Como ambos precisam
ser calculados varias vezes nas iteracoes de Newton com valores X que variam, decidimos
guardar os evaluators e chamar somente a funcao "evaluator_evaluate". As funcoes
"gera_matriz_derivadas" e "le_input" geram os evaluators para derivadas e expressoes
respectivamente, utilizando a funcao "evaluator_create".

Outra estrutura relevante eh a result_jacobiana, que contem os resultados das derivadas
parciais da matriz jacobiana utilizando o vetor de incognitas da iteracao.

--------------------------------------------------------------------------------
# Resolvendo o sistema

## Metodo de Newton
Para resolver o sistema, foi utilizado o metodo de Newton, que consiste em aproximar
os valores das incognitas X usando ate max_iter iteracoes, ou ate que os valores sejam
menores que a tolerancia estabelecida. Isso eh feito na funcao newtonMetod.

Em cada iteracao do metodo de Newton, o sistema linear
J(X^(i)) * delta^(i) = - F(X^(i))
precisa ser resolvido internamente utilizando a eliminacao de Gauss. O sistema triangular
resultante eh resolvido com a retrossubstituicao. Assim, obtemos o delta,
que permite que a nova aproximacao de X seja obtida.

## Eliminacao de Gauss
A eliminacao de Gauss eh feita na funcao "eliminacao_gauss", que consiste na
eliminacao progressiva de variaveis na matriz de coeficientes. A equacao
pivo p e a equacao k sao selecionadas, e o objetivo eh remover a variavel xp de k.
Para isso, multiplicamos a equacao pivo por m e subtraimos o resultado da linha k.

    m_p = J_k / J_p
    onde J_k eh o coeficiente da linha e coluna onde queremos remover a variavel e
    J_p eh o coeficiente do pivo.

    Assim, o calculo feito eh:
    eq_k = eq_k − m_k_p ∗ eq_p

Alem disso, tambem eh feito o pivoteamento parcial, em que as linhas sao trocadas de ordem para que
o maior valor em modulo de cada coluna esteja na diagonal a fim de reduzir os erros
numericos (como cancelamento subtrativo) e evitar casos onde o 0 esta na diagonal principal (o que gera divisao por 0).
O resultado sera uma matriz triangular superior.

## Retrossubstituicao
Em seguida, eh feito o processo da retrossubstituicao na funcao "retrossub", no qual
substituimos progressivamente os valores de delta da ultima linha ate a primeira. Como a
matriz eh triangular superior, em cada linha mais um valor de delta eh encontrado,
e os valores anteriores auxiliam no calculo dos proximos delta.

## Nova Aproximacao
Após obter o delta, basta somar com os valores de X para obter a proxima aproximacao,
tendo em vista a propria definicao de delta, que eh a diferenca entre a nova aproximacao
e a antiga.
X^(i+1) = X^(i) + delta^(i)

Esse processo eh feito em ate max_iter iteracoes, ou ate que os valores sejam
proximos o suficiente. Para verificar isso, a norma do vetor de incognitas e 
do vetor de deltas eh calculada.

--------------------------------------------------------------------------------

# Erros
## le_input()
- Erro ao alocar memoria em "le_input"
    - Pode ocorrer ao tentar alocar memoria para "expressoes" ou para "incognitas".

## eliminacao_gauss() e retrossub()
- Divisao por 0 em "eliminacao_gauss"
    - Pode ocorrer em eliminacao_gauss ou em retrossub, e indica que um dos coeficientes da diagonal eh 0. Como eles sao utilizados como denominador em ambas as funcoes, eh preciso checar antes de realizar a conta para certificar que nenhuma divisao por 0 seja feita.

## newtonMetod()
- Erro ao alocar memoria em "newtonMetod"
    - Pode ocorrer ao tentar alocar memoria para o vetor de valores "delta" ou para a matriz com os resultados da jacobiana "result_jacobiana".
- Erro ao calcular termos independentes em "calcula_termos_indep"
    - Pode ocorrer durante o calculo de termos independentes. Caso o vetor de valores de cada variavel calculado em "obtem_variaveis" nao seja retornado corretamente, o calcula_termos_indep retorna um codigo de erro, e o newtonMetod imprime a mensagem de erro.
- Erro ao calcular a jacobiana em "calcula_jacobiana"
    - Pode ocorrer durante a funcao "calcula_jacobiana", e tambem eh causado por um problema na funcao "obtem_variaveis". Se ela retorna um vetor invalido, o "calcula_jacobiana" retorna codigo de erro e o newtonMetod imprime a mensagem de erro.

## aloca_sistema_nao_linear()
- Erro ao alocar memoria em "aloca_sistema_linear"
    - Pode ocorrer ao tenta alocar memoria para o sistema nao linear "snl", para o vetor de termos independentes "termos_indep", ou para a matriz de derivadas "derivadas".
- Erro ao alocar memoria em "obtem_variaveis"
    - Pode ocorrer ao tenta alocar memoria para "valores"

## calcula_jacobiana()
- Erro ao alocar memoria em "obtem_variaveis"
    - Pode ocorrer ao tenta alocar memoria para "valores"

## gera_matriz_derivadas()
- Erro ao gerar matriz de dedrivadas em \"gera_matriz_derivadas\" 
    - Pode ocorrer ao tenta derivar uma funcao passada como argumento para "evaluator_derivative()"


## main()
- Erro ao abrir arquivo de saida
    - Ocorre quando um arquivo de saida invalido eh passado na chamada do programa
- Opcao x requer um argumento
    - Ocorre quando uma opcao eh escolhida, por exemplo, "-o", porem sem o argumento correspondente, que no caso seria o arquivo de output.
- Opcao desconhecida x e Caracter de opcao desconhecido x
    - Ocorre quando a opcao escolhida nao eh esperada
