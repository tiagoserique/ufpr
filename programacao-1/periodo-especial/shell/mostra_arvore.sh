#!/bin/bash

mostra_arvore(){

    local DIRETORIO=$1/

    for x in $(ls $DIRETORIO)
    do
        
        if [ -h $DIRETORIO$x ] || [ -c $DIRETORIO$x ] || [ -b $DIRETORIO$x ] || [ -S $DIRETORIO$x ]; then
            echo "${DIRETORIO#.}$x (Outros)"
            echo ""

        elif [ -f $DIRETORIO$x ] ; then
            let QTD_ARQ++
            echo "${DIRETORIO#.}$x (Arquivo)"
            echo ""

        elif [ -d $DIRETORIO$x ] ; then
            let QTD_DIR++
            echo "${DIRETORIO#.}$x (Diretório)"
            echo ""
            mostra_arvore $DIRETORIO$x 
        fi
    done

}

QTD_DIR=1

QTD_ARQ=0

echo ""
if [ $# -eq 1 ] ; then 
    echo "$1 (Diretório)"
    echo ""
    mostra_arvore .$1

else
    echo "/ (Diretório)"
    echo ""
    mostra_arvore 
fi 

echo "Diretórios: $QTD_DIR"
echo ""
echo "Arquivos: $QTD_ARQ"
echo ""

