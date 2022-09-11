#!/bin/bash

DIR_GRAFOS=$1
DIR_IMG=$2

for i in $(ls $DIR_GRAFOS); do
    echo "Executando o algoritmo para o grafo $i"
    dot -Tpng $DIR_GRAFOS/$i > $DIR_IMG/$i.png
done
