#!/bin/bash

#Execute uma única linha de comando no terminal que mostre somente 
#os nomes e permissões de arquivos que sejam diretórios, e que tenham 
#sido modificados no mês de março.

#Um exemplo de saída está abaixo:
#drwx------ Mail
#drwxr-xr-x tmp

ls -l | grep ^d | grep "mar "  | cut -d" " -f1,9
