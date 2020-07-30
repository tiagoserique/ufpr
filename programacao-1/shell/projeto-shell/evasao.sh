#!/bin/bash

item1 (){
    tar -xzf evasao2014-18.tar.gz
}


item2 (){
    cd evasao
        NOME_ARQUIVOS=$( ls * )
        cat *.csv > ../evasao_geral
    cd .. 
}


item3 (){
    echo -e "[ITEM 3]\n"
    echo "RANKING GERAL"

    # pega todas as formas de evasao e tira o cabecalho
    cat evasao_geral | cut -d, -f1 | sort -u | grep -v FORMA_EVASAO > tipos_evasao

    # preenche vetor com as formas de evasao
    mapfile -t FORMAS_EVASAO < tipos_evasao 

    for tipo in "${FORMAS_EVASAO[@]}"
    do
        # formata o texto com 'tipo de evsao, qtd'
        echo "$tipo, $( grep "$tipo" evasao_geral | wc -l )" >> ranking_geral
    done

    # organiza as colunas na ordem decrescente e faz a formatacao 
    awk '{print $NF, $0}' ranking_geral | sort -nr | cut -d' ' -f2- | column -s, -t
    echo ""

    # RANKING POR ANO
    for arquivo in $NOME_ARQUIVOS
    do
        echo "RANKING ${arquivo%.*}"

        local CAMINHO=$( find -name $arquivo )

        for tipo in "${FORMAS_EVASAO[@]}"
        do
            echo "$tipo, $( grep "$tipo" $CAMINHO | wc -l )" >> ranking_anual
        done

        awk '{print $NF, $0}' ranking_anual | sort -nr | cut -d' ' -f2- | column -s, -t
        echo ""
        echo "" > ranking_anual
    done
}

item4 (){

    echo -e "[ITEM 4]\n"

    # pega a qtd de alunos de cada arquivo que ficaram uma qtd x de anos no curso
    for arquivo in $NOME_ARQUIVOS
    do
        local CAMINHO=$( find -name $arquivo )

        # pega o ano do arquivo
        local ANO=${arquivo%.*}
        ANO=${ANO#*-}

        #pega os anos em ordem decrescente
        cat $CAMINHO | cut -d, -f4 | sort -ru | grep -v ANO_INGRESSO > ano_evasao

        mapfile -t ANO_EVASAO < ano_evasao 
       
        for ano in "${ANO_EVASAO[@]}"
        do
            echo "$( grep "$ano" $CAMINHO | wc -l ), $( echo "$ANO-$ano" | bc )" >> evasao_anual
        done
    done
    
    # organiza usando a qtd x de anos no curso 
    awk '{ print $NF, $0}' evasao_anual | sort -n | cut -d' ' -f2- > evasao_anual2

    # pega a maior qtd de anos no curso
    local QTD_MAXIMA=$( awk 'END{print $2}' evasao_anual2 ) 

    for ((x=0; x<= $QTD_MAXIMA;x++))
    do
        awk '{ print $NF, $0}' evasao_anual | sort -n | grep ^"$x " | awk '{SUM+=$2}END{print SUM",",$3}' >> evasao_anual_final
    done

    cat evasao_anual_final | grep -v ^,
    echo ""
        
}


apaga_arquivos (){
    ### ARQUIVOS TEMPORARIOS PRA APAGAR
    rm evasao_geral
    rm tipos_evasao
    rm ranking_geral
    rm ranking_anual
    rm ano_evasao
    rm evasao_anual
    rm evasao_anual2
    rm evasao_anual_final
}

item1
item2
item3
item4
item5
: 'item6
item7
item8'
apaga_arquivos

