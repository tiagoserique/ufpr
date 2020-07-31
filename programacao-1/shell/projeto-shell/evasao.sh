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
        # formata o texto com 'tipo de evasao, qtd'
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

    for ((x=0; x<=$QTD_MAXIMA; x++))
    do
        awk '{ print $NF, $0}' evasao_anual | sort -n | grep ^"$x " | awk '{SUM+=$2}END{print SUM",",$3}' >> evasao_anual_final
    done

    sed -i '1 iALUNOS, ANOS' evasao_anual_final
    cat evasao_anual_final | grep -v ^, | column -s, -t
}


item5 (){
    echo -e "\n[ITEM 5]\n"

    for arquivo in $NOME_ARQUIVOS
    do
        local CAMINHO=$( find -name $arquivo )

        # pega o ano do arquivo
        local ANO=${arquivo%.*}
        ANO=${ANO#*-}

        local SEMESTRE1=$( cat $CAMINHO | cut -d, -f2 | grep -v PERIODO | grep 1 | wc -l )
        local SEMESTRE2=$( cat $CAMINHO | cut -d, -f2 | grep -v PERIODO | grep 2 | wc -l )
        local TOTAL=$( cat $CAMINHO | cut -d, -f2 | grep -v PERIODO | wc -l )

        local VAR=$(echo "$SEMESTRE1 > $SEMESTRE2" | bc )
        
        if [ "$VAR" -eq 1 ]
        then
            echo "$ANO, semestre 1° - $( expr $SEMESTRE1 \* 100 / $TOTAL )%" >> porcentagem_evasao 
        elif [ "$VAR" -eq 0 ]
        then
            echo "$ANO, semestre 2° - $( expr $SEMESTRE2 \* 100 / $TOTAL )%" >> porcentagem_evasao 
        fi
    done
    cat porcentagem_evasao | grep -v ^, | column -s, -t
}


item6 (){
    echo -e "\n[ITEM 6]\n"

    local CAMINHO=$( find -name evasao_geral )

    local M=$( cat $CAMINHO | cut -d, -f5 | grep -v SEXO | grep M | wc -l )
    local F=$( cat $CAMINHO | cut -d, -f5 | grep -v SEXO | grep F | wc -l )
    local TOTAL=$( cat $CAMINHO | cut -d, -f5 | grep -v SEXO | wc -l )

    echo "SEXO, MÉDIA EVASÕES (5 anos)" >> evasao_sexo
    echo "F, $( expr \( $F \* 100 / $TOTAL \) + 1 )%" >> evasao_sexo
    echo "M, $( expr \( $M \* 100 / $TOTAL \) + 1 )%" >> evasao_sexo

    cat evasao_sexo | column -s, -t
}


item7 (){
    for arquivo in $NOME_ARQUIVOS
    do
        # pega o ano do arquivo
        local ANO=${arquivo%.*}
        ANO=${ANO#*-}

        local CAMINHO=$( find -name $arquivo )
        QTD_EVASOES=$( expr $( cat $CAMINHO | wc -l ) - 1 )

        echo "$ANO,$QTD_EVASOES" >> evasao-ano
    done

    gnuplot -p << EOF
    set datafile separator ","
    set title "[ITEM 7]"
    set xlabel "ANOS"
    set ylabel "N° DE EVASOES"
    set term png
    set output "evasao-ano.png"
    plot "evasao-ano" with line title "Evasoes"
EOF

    mv evasao-ano.png evasao/
}

#OBSERVAÇÃO 2: Os itens 7 e 8 devem ser salvos no mesmo diretório que contém os arquivos de entrada como "evasoes-ano.png" e "evasoes-forma.png", respectivamente.

item8 (){
    for arquivo in $NOME_ARQUIVOS
    do
        local CAMINHO=$( find -name $arquivo )

        # pega todas as formas de ingresso e tira o cabecalho
        cat $CAMINHO | cut -d, -f3 | sort -u | grep -v FORMA_INGRESSO >> tipos_ingresso
    done
        
    cat tipos_ingresso | sort -u > tipos_ingresso2    

    # preenche vetor com as formas de ingresso
    mapfile -t FORMAS_INGRESSO < tipos_ingresso2
    
    for arquivo in $NOME_ARQUIVOS
    do
        local CAMINHO=$( find -name $arquivo )

        # pega o ano do arquivo
        local ANO=${arquivo%.*}
        ANO=${ANO#*-}

        echo -n "$ANO" >> evasao-forma
        for tipo in "${FORMAS_INGRESSO[@]}"
        do
            echo -n ",$( grep "$tipo" $CAMINHO | wc -l )" >> evasao-forma
        done
        echo >> evasao-forma
     done

    gnuplot -p << EOF
    set datafile separator ","
    set title "[ITEM 8]"
    set xlabel "ANOS"
    set ylabel "N° DE EVASOES"
    set term png
    set output "evasao-forma.png"
    set style data histogram
    set style histogram cluster gap 1
    set style fill solid
    set boxwidth 0.8
    set xtics format
    set yrange[0:180]
    plot 'evasao-forma' using 2:xtic(1) title 'Aluno Intercâmbio',\
    '' using 3 title 'Aproveitamento Curso Superior',\
    '' using 4 title 'Convênio AUGM',\
    '' using 5 title 'Convênio Pec-G',\
    '' using 6 title 'Mobilidade Acadêmica',\
    '' using 7 title 'Processo Seletivo/Enem',\
    '' using 8 title 'Reopção',\
    '' using 9 title 'Transferência Ex-Ofício',\
    '' using 10 title 'Transferência Provar',\
    '' using 11 title 'Vestibular',
EOF
    mv evasao-forma.png evasao/
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
    rm porcentagem_evasao
    rm evasao_sexo
    rm evasao-ano
    rm tipos_ingresso
    rm tipos_ingresso2
    rm evasao-forma
}

item1
item2
item3
item4
item5
item6
item7
item8
apaga_arquivos

