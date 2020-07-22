#!/bin/bash

mkdir ~/Pascal2C

echo "arquivos copiados:"

echo " "

find ~ -name '*.pas' -printf "%f (copiado de %h)\n\n" -exec \cp {} ~/Pascal2C \;

echo "Numero de arquivos copiados: $(ls ~/Pascal2C | wc -l)" 
