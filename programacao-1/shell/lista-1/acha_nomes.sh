#!/bin/bash

cd /home/bcc
finger -s [a-z]* | cut -c12-23 | cut -d' ' -f1 | sort -u >> ~/nomes_de_informatas.txt
