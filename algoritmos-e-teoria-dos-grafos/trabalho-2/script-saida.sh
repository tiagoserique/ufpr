#!/bin/bash

DIR_GRAFOS=$1

for i in $(ls $DIR_GRAFOS); do
    echo "Executando o algoritmo para o grafo $i"
    ./teste < $DIR_GRAFOS/$i > saidas/$i
done
