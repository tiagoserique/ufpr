#!/bin/bash

item1 (){
    tar -xzf evasao2014-18.tar.gz
}


item2 (){
    cd evasao
        NOME_ARQUIVOS=$( ls * )
        cat *.csv > ../evasao-geral
    cd .. 
}


item3 (){
    echo -e "[ITEM 3]\n"
    echo "RANKING GERAL"

    # pega todas as formas de evasao e tira o cabecalho
    cat evasao-geral | cut -d, -f1 | sort -u | grep -v FORMA_EVASAO > tipos_evasao

    # preenche vetor com as formas de evasao
    mapfile -t FORMAS_EVASAO < tipos_evasao 

    for tipo in "${FORMAS_EVASAO[@]}"
    do
        # formata o texto com 'tipo de evsao, qtd'
        echo "$tipo, $( grep "$tipo" evasao-geral | wc -l )" >> ranking_geral
    done

    # organiza as colunas na ordem decrescente e faz a formatacao 
    awk '{print $NF, $0}' ranking_geral | sort -nr | cut -d' ' -f2- | column -s, -t
    echo ""

    # RANKING POR ANO
    for arquivo in $NOME_ARQUIVOS
    do
        echo "RANKING ${arquivo%.*}"

        local CAMINHO=$( find -name $arquivo)

        for tipo in "${FORMAS_EVASAO[@]}"
        do
            echo "$tipo, $( grep "$tipo" $CAMINHO | wc -l )" >> ranking_anual
        done

        awk '{print $NF, $0}' ranking_anual | sort -nr | cut -d' ' -f2- | column -s, -t
        echo ""
        echo "" > ranking_anual
    done
}





#item1
item2
item3
: 'item4
item5
item6
item7
item8'

### ARQUIVOS TEMPORARIOS PRA APAGAR
rm tipos_evasao
rm ranking_geral
rm ranking_anual
