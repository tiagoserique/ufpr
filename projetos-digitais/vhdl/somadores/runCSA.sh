#!/bin/bash

## ------------------------------------------------------------------------
## UFPR, BCC, ci210 - laboratorio somadores       Roberto Hexsel, 31ago2016
## ------------------------------------------------------------------------

## ESTE ARQUIVO NAO DEVE SER ALTERADO


# set -x


# se passar um argumento para script, executa gtkwave
if [ $# = 1 ] ; then WAVE="yes"
else WAVE=
fi


sim=csa
simulador=tb_${sim}
src="packageWires aux somador ${simulador}"
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
    test -z $WAVE  ||  gtkwave -O /dev/null ${visual} csa.sav &
fi

