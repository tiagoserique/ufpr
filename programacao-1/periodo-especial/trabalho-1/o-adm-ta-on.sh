#!/bin/bash

arquivo_bash_logout (){
    local ARQ=".bash_logout"

    echo -e "# ~/.bash_logout: executed by bash(1) when login shell exits.\n" > $ARQ
    echo "source $LIMPA_COOKIES" >> $ARQ
}


diretorios_tmp_bin (){
    mkdir tmp
    mkdir bin
    LIMPA_COOKIES="bin/limpa_cookies.sh"
    echo "#!/bin/bash" > $LIMPA_COOKIES
    echo "rm .navegaaipo/cookies" >> $LIMPA_COOKIES
    chmod 711 $LIMPA_COOKIES
}


diretorio_ssh (){
    local LOGIN_NAME=$1
    mkdir .ssh
    chmod 711 .ssh
    local ARQ=".ssh/index.html"
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

    # pega todos os nomes da coluna "first_name" e exclui o cabecalho
    TODOS_NOMES=$( cat nomes.csv | cut -d"," -f3 | grep -v "first_name" )

    for letra in $LETRAS_ALFABETO 
    do    
        # pega somente os 10 primeiros nomes com a letra da vez e armazena
        echo "$TODOS_NOMES" | grep ^"$letra" | head -10 >> temp_nomes_x 

        mapfile -t NOMES_LETRA_X < temp_nomes_x 

        rm temp_nomes_x
 
        for nome in "${NOMES_LETRA_X[@]}" 
        do
            # armazena a quantidade de chars no nome
            QTD_CHARS=$( expr $(echo "$nome" | wc -m ) - 1 ) 

            if [ $QTD_CHARS -eq 5 ] && [[ "${nome:0:1}" == [AEIOU]* ]] && [[ "${nome:4}" == *[AEIOU] ]]
            then
                pushd $DIR_GRUPO1 >> /dev/null
                mkdir $nome
                chmod 755 $nome
                cd $nome
                arquivo_bashrc 1
                mkdir .html
                diretorio_ssh $nome
                diretorios_tmp_bin
                arquivo_bash_logout
                popd >> /dev/null
            elif [ $QTD_CHARS -gt 5 ]
            then
                pushd $DIR_GRUPO2 >> /dev/null
                local NOME_DIR=${nome:0:5}"."${nome:5}
                mkdir $NOME_DIR
                chmod 750 $NOME_DIR
                cd $NOME_DIR
                arquivo_bashrc 2
                diretorio_ssh $nome
                diretorios_tmp_bin
                arquivo_bash_logout
                popd >> /dev/null
            else
                pushd $DIR_GRUPO3 >> /dev/null
                mkdir $nome
                chmod 700 $nome
                cd $nome
                arquivo_bashrc 3
                diretorio_ssh $nome
                diretorios_tmp_bin
                arquivo_bash_logout
                popd >> /dev/null
            fi 
        done
    done
}


cria_diretorios (){
#    cd /nobackup/bcc/tsv19 #testando dinf
    mkdir users
    mkdir users/grupo{1,2,3}

    DIR_GRUPO1="users/grupo1"
    DIR_GRUPO2="users/grupo2"
    DIR_GRUPO3="users/grupo3"

    login_names
}


cria_diretorios

