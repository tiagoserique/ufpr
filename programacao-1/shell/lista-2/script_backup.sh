#!/bin/bash

NOME=$1
TEXT=$( basename -s .sh ${NOME}) 
cat ${TEXT}.sh > ${TEXT}.bkp
