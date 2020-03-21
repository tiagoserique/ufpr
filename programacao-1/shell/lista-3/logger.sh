#!/bin/bash

logger -i "Teste do comando logger"
ARQUIVO=/var/log/syslog
PID=$( tail -1 ${ARQUIVO} | cut -d'[' -f2 | cut -d']' -f1)
echo "Arquivo: ${ARQUIVO}"
echo "${PID}"
