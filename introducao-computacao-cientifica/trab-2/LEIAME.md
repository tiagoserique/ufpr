Trabalho 2 - ICC

Tiago Serique Valadares - GRR20195138 - tsv19  
Fernanda Yukari Kawasaki - GRR20185057 - fyk18

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
Consiste nos os arquivos ```compare.sh```, ```data_strip.py``` e ```graph.py```

Primeiramente, é preciso rodar ```./compare.sh```.  
- São geradas as entradas com o ```broyden.sh```. Alteramos para gerar um arquivo para cada dimensão

Para cada dimensão, os seguintes comandos são executados:
- O LIKWID é utilizado para fazer a análise de desempenho. Os resultados são salvos em arquivos dentro do diretório ```temp/```.
- Depois, as informações desejadas presentes nesses arquivos são obtidas ao executar o programa ```data_strip.py```. As informações limpas são salvas no diretório ```desempenho/```, e estão em formato csv.
- Os arquivos desnecessários são removidos.

Por fim, são gerados os gráficos.

--------------------------------------------------------------------------------

# Diferenças entre trabalho 1 e trabalho 2
Não alteramos nada no primeiro trabalho, justamente para poder comparar como nosso programa
iria de fato performar em comparação com uma versão otimizada. Percebemos que, por não estar otimizado,
nosso programa inicial não conseguia executar entradas maiores que 1024, e este era forçadamente encerrado
antes de terminar.