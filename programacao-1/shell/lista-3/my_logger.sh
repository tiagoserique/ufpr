#!/bin/bash

LOG=$1
DIR=$2
TYPE="info warn error"
TAR=logs.tar.gz
SYSLOG=/var/log/syslog

if [ "$#" -ne 2 ]; then
	echo "Numero errado de parametros"
	echo "Sintaxe: $0 <arquivo> <diretorio>"
else
	if [ ! -d $DIR ]; then
		mkdir $DIR
	fi	

	DATE=$( date +%d-%m-%Y )

	for logs in $TYPE; do
		grep $logs $LOG >> $DIR/$DATE"_"$logs.log
	done

	pushd $DIR
		tar -cvzf $TAR *
		
		if [ -a $TAR ]; then
			logger -i "Sucesso ao criar $TAR"
			tail -1 $SYSLOG
		else
			logger -i "Erro ao criar $TAR"
			tail -1 $SYSLOG
		fi
	popd
fi
