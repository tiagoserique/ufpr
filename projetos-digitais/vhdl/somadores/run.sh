#!/bin/bash

## ------------------------------------------------------------------------
## UFPR, BCC, ci210 - laboratorio somadores       Roberto Hexsel, 19ago2013
## ------------------------------------------------------------------------

## ESTE ARQUIVO NAO DEVE SER ALTERADO


# set -x

# se passar um argumento para script, executa gtkwave
if [ $# = 1 ] ; then WAVE="yes"
else WAVE=
fi


sim=somador
simulador=tb_${sim}
src="packageWires aux ${sim} ${simulador}"
visual=v_${sim}.vcd


# compila simulador
rm -f $visual
ghdl --remove
for F in ${src} ; do
    ghdl -a --ieee=standard -fexplicit ${F}.vhd  ||  exit 1
done

ghdl -e --ieee=standard ${simulador}  ||  exit 1

if [ -x ./${simulador} ] ; then
    ./${simulador} --ieee-asserts=disable --stop-time=250ns \
        --vcd=${visual} 
    # executa gtkwave sob demanda
    test -z $WAVE  ||  gtkwave -O /dev/null ${visual} add.sav &
fi

