#!/bin/bash

NOME_SCRIPT=$0
SCRIPT_BACKUP="$( ${NOME_SCRIPT%.*} ).bkp"
DIRETORIO_BACKUP="/nobackup/bcc/tsv19/"
NOME_BACKUP="meubackup.tar.gz"

cp $0 $SCRIPT_BACKUP

echo "Nome do backup do script: $SCRIPT_BACKUP"
echo "Nome do diretorio onde sera gravado o backup: ${DIRETORIO_BACKUP%/*}"
echo "Nome completo do backup final: $DIRETORIO_BACKUP$NOME_BACKUP"
echo "arquivos modificados nas ultimas 24 horas:"

pushd ~
    ARQUIVOS=$( find -mtime -1 )
    echo "$ARQUIVO"
    tar --exclude='./.*' -czvf $DIRETORIO_BACKUP$NOME_BACKUP ~
    cd $DIRETORIO_BACKUP
    tar -xzf $NOME_BACKUP
popd

