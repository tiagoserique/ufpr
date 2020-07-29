#!/bin/bash

NOME=$0
TEXT=$( basename -s .sh ${NOME})
BACKUP=/nobackup/bcc/tsv19/
TAR=meubackup.tar.gz

cat ${TEXT}.sh > ${TEXT}.bkp

echo "Nome do backup do script: ${TEXT}.bkp"
echo "Nome do diretorio onde sera gravado o backup: ${BACKUP}"
echo "Nome completo do backup final: ${BACKUP}${TAR}"
echo "arquivos modificados nas ultimas 24 horas: "

pushd ~
	VAR=$( find -mtime -1 )
	echo "${VAR}"
	tar --exclude='./.*' -czvf ${BACKUP}${TAR} ~ 
	cd ${BACKUP}
	tar -xzf ${TAR}
popd

