Exercicio EP-03 (Análise de desempenho utilizando o LIKWID)

Tiago Serique Valadares - GRR20195138 - tsv19  
Fernanda Yukari Kawasaki - GRR20185057 - fyk18

--------------------------------------------------------------------------------
# Otimizações identificadas
Aproveita ao máximo variáveis locais;

Aloca memória de forma contígua, afim de evitar stride;

Garante que os vetores e matrizes não terão dimensões em potência de 2, 
evitando cache thrashing;

Usa looping unrolling & jam;

Evita copiar vetores elemento por elemento, apenas troca ponteiros;

Evita copiar vetores desnecessariamente;

--------------------------------------------------------------------------------
# Compilação/execução

## Ambiente
Utilizamos os computadores do lab3 do DINF para compilar e executar os programas.

Observamos que,a depender da arquitetura e das características da máquina, os resultados
do LIKWID são diferentes. Por exemplo, na máquina pessoal de um dos integrantes, 
o LIKWID retornava o flops_dp no seguinte padrão: ```DP [MFLOP/s],valor```.
Já na máquina do DINF, o padrão percebido foi ```DP MFLOP/s,valor```. Tendo em vista
essas pequenas diferenças, decidimos utilizar o padrão gerado pelas máquinas do DINF.

## Requisitos
Utilizamos ```Python 3.8.10``` para fazer a limpeza dos dados e plotar os gráficos.

As bibliotecas de Python utilizadas são:
- ```kaleido==0.2.1```
- ```pandas==1.3.4```
- ```plotly==5.4.0```

Se possuir o instalador de pacotes ```pip```, é possível rodar o seguinte comando:
```pip install -r requirements.txt```

## Fluxo
Foram adicionados os arquivos ```script.sh```, ```data_strip.py``` e ```graph.py```

Primeiramente, é preciso rodar ```./script.sh```.  
Para cada dimensão, os seguintes comandos são executados:
- São geradas as entradas;
- Em seguida, o LIKWID é utilizado para fazer a análise de desempenho. Os resultados são salvos em arquivos dentro do diretório ```temp/```.
- Depois, as informações desejadas presentes nesses arquivos são obtidas ao executar o programa ```data_strip.py```. As informações limpas são salvas no diretório ```desempenho/```, e estão em formato csv.
- Os arquivos desnecessários são removidos.

Por fim, são gerados os gráficos.

--------------------------------------------------------------------------------
