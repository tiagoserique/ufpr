#!/bin/bash

DIR_GRAFOS=$1

for i in $(ls $DIR_GRAFOS); do
    echo "Executando o algoritmo para o grafo $i"
    dot -Tpng $DIR_GRAFOS/$i > imagens/$i.png
done
