#!/bin/bash

finger * | grep 'Name' | cut -d':' -f3 | cut -c2-30 | cut -d' ' -f1 | sort -u >> nomes_de_informatas.txt

