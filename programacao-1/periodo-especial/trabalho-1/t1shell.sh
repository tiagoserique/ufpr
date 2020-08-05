#!/bin/bash

arquivo_bash_logout (){
    local ARQ=".bash_logout"

    echo "source $LIMPA_COOKIES" > $ARQ
}


diretorios_tmp_bin (){
    mkdir tmp
    mkdir bin
    LIMPA_COOKIES="bin/limpa_cookies.sh"
    echo "#!/bin/bash" > $LIMPA_COOKIES
    echo "rm .navegaaipo/cookies" >> $LIMPA_COOKIES
    chmod 711 $LIMPA_COOKIES
}


diretorio_html (){
    local LOGIN_NAME=$1
    mkdir .html
    chmod 711 .html
    local ARQ=".html/index.html"
    echo -e "<!DOCTYPE html>\n<html>\n<head>\n<title>" >> $ARQ
    echo "$LOGIN_NAME" >> $ARQ
    echo -e "</title>\n</head>\n\n<body>" >> $ARQ
    echo "Alo mamae!" >> $ARQ
    echo -e "</body>\n</html>" >> $ARQ
}


arquivo_bashrc (){
    local ARQ=".bashrc"
    local GRUPO=$1

    if [ $GRUPO -eq 1 ]
    then
        echo "alias ll=\"ls -ltr\"" > $ARQ
    elif [ $GRUPO -eq 2 ]
    then
        echo "alias ll=\"ls -ltr\"" > $ARQ
        echo "alias la=\"ls -la\"" >> $ARQ
    elif [ $GRUPO -eq 3 ]
    then
        echo "alias ll=\"ls -ltr\"" > $ARQ
        echo "alias la=\"ls -la\"" >> $ARQ
        echo "alias lF=\"ls -lF\"" >> $ARQ
    fi
}


login_names (){
    gunzip nomes.csv.gz

    # pega todas as letras do alfabeto com expansao de chaves 
    LETRAS_ALFABETO=$( echo {A..Z} )

    # pega todos os nomes da coluna "alternative_name" e exclui o cabecalho
    cat nomes.csv | cut -d"," -f1 | grep -v "alternative_names" | sort > tmp_nomes
    
    # apaga as linhas vazias
    sed -i '/^$/d' tmp_nomes

    # pega todos os primerios nomes das colunas separadas por |
    TODOS_NOMES=$( cat tmp_nomes | cut -d"|" -f1 | sort -u )
    rm tmp_nomes

    for letra in $LETRAS_ALFABETO 
    do    
        # pega somente os 10 primeiros nomes com a letra da vez e armazena
        echo "$TODOS_NOMES" | grep ^"$letra" | head -10 >> temp_nomes_x 

        # cria variavel com os 10 primerios nomes
        mapfile -t NOMES_LETRA < temp_nomes_x 

        rm temp_nomes_x
 
        for nome in "${NOMES_LETRA[@]}" 
        do
            # armazena a quantidade de chars no nome
            QTD_CHARS=$( expr $(echo "$nome" | wc -m ) - 1 ) 

            # verifica se tem 5 letras, se a primeira e a ultima letra é vogal
            if [ $QTD_CHARS -eq 5 ] && [[ "${nome:0:1}" == [AEIOU]* ]] && [[ "${nome:4}" == *[AEIOU] ]]
            then
                pushd $DIR_GRUPO1 >> /dev/null
                    mkdir $nome
                    chmod 755 $nome
                    cd $nome
                    arquivo_bashrc 1
                    diretorio_html $nome
                    diretorios_tmp_bin
                    arquivo_bash_logout
                popd >> /dev/null
            elif [ $QTD_CHARS -gt 5 ]
            then
                pushd $DIR_GRUPO2 >> /dev/null
                    # adiciona o "." ao nome do diretorio 
                    local NOME_DIR=${nome:0:5}"."${nome:5}
                    mkdir $NOME_DIR
                    chmod 750 $NOME_DIR
                    cd $NOME_DIR
                    arquivo_bashrc 2
                    diretorios_tmp_bin
                    arquivo_bash_logout
                popd >> /dev/null
            else
                pushd $DIR_GRUPO3 >> /dev/null
                    mkdir $nome
                    chmod 700 $nome
                    cd $nome
                    arquivo_bashrc 3
                    diretorios_tmp_bin
                    arquivo_bash_logout
                popd >> /dev/null
            fi 
        done
    done
}


cria_diretorios (){
    mkdir users
    mkdir users/grupo{1,2,3}

    DIR_GRUPO1="users/grupo1"
    DIR_GRUPO2="users/grupo2"
    DIR_GRUPO3="users/grupo3"

    login_names
}


cria_diretorios

