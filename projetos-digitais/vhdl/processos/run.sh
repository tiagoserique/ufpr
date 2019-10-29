#!/bin/bash

## ------------------------------------------------------------------------
## UFPR, BCC, ci210       laboratorio contadores, Roberto Hexsel, 19ago2013
## ------------------------------------------------------------------------

## ESTE ARQUIVO NAO PODE SER ALTERADO


# set -x

# se passar um argumento para script, executa gtkwave
if [ $# = 1 ] ; then WAVE="yes"
else WAVE=
fi


sim=me
simulador=tb_${sim}
src="packageWires tb_${sim}"
visual=v_${sim}.vcd


# compila simulador
rm -f $visual
ghdl --remove
for F in ${src} ; do
    ghdl -a --ieee=standard -fexplicit ${F}.vhd  || exit 1
done

ghdl -e --ieee=standard ${simulador}  ||  exit 1

if [ -x ./${simulador} ] ; then
    ./${simulador} --ieee-asserts=disable --stop-time=750ns \
        --vcd=${visual} 
    # executa gtkwave sob demanda
    test -z $WAVE  ||  gtkwave -O /dev/null ${visual} v.sav &
fi

