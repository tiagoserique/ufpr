#! /bin/bash

# fazer um programa que receba dois argumentos da linha de comando e crie
# arquivos com os nomes dos valores entre os dois argumentos.
# Exemplo:
# $ ./script.sh 01 10
# criará arquivos com os nomes 01 a 10.

echo "./script nome-do-arquivo numero-da-lista extensao-do-arquivo inicio fim caminho"

NOME_ARQUIVO=$1
LISTA=$2
EXT=$3
INICIO=$4
FIM=$5
CAMINHO=$6

for i in $(seq -f '%02.f' ${INICIO} ${FIM})
do
    touch ${CAMINHO}/${NOME_ARQUIVO}${i}L${LISTA}.${EXT}
done
