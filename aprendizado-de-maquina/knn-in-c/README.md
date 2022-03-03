
# KNN

## Pré-execução

* Antes de executar o knn, é preciso usar o conversor de data `data_converter.py` para que que a entrada esteja no formato esperado no programa.

* Para isso, execute a linha seguinte:

```bash
python3 data_converter <caminho/arquivo_de_entrada> <caminho/nome_arquivo_de_saida>
```

* É necessário fazer isso tanto para o arquivo de treinamento quanto de testes.

## Orientações para execução

* Para compilar e obter o executável, use:

```bash
make

ou

make knn
```

* Basta executar o comando a baixo para a execução do knn.

```bash
./knn <base de treinamento> <base de teste> <valor de k>
```
