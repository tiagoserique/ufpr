#!/bin/bash

#Execute uma única linha de comando no terminal que mostre somente 
#os nomes e permissões de arquivos que sejam diretórios, e que tenham 
#sido modificados no mês de março.

#Um exemplo de saída está abaixo:
#drwx------ Mail
#drwxr-xr-x tmp

ls -l | grep ^d | awk  '$6 == "mar" {for (x=2; x<=8;x++) $x=""; print $0}' | cut -d" " -f1,9-

