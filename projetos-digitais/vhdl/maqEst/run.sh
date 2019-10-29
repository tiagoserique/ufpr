#!/bin/bash

## ------------------------------------------------------------------------
## UFPR, BCC, ci210 2018-2 lab MaqEst, autor: Roberto Hexsel, 10set
## ------------------------------------------------------------------------

## ESTE ARQUIVO NAO PODE SER ALTERADO


# set -x

trab=reduz

src="packageWires aux $trab tb_${trab}"
sim=$trab
simulator=tb_${sim}
visual=v_${sim}.vcd
save=v.sav

length=100
unit=n

usage() {
cat << EOF
usage:  $0 [options] 
        re-create simulator/model and run simulation

OPTIONS:
   -h    Show this message
   -t T  number of time-units to run (default ${length})
   -u U  unit of time scale {m,u,n,p} (default ${unit}s)
   -n    send simulator output do /dev/null, else to $visual
   -w    invoke GTKWAVE -- do not use with -n
EOF
}

while true ; do

    case "$1" in
        -h | "-?") usage ; exit 1
            ;;
        -t) length=$2
            shift
            ;;
        -u) unit=$2
            shift
            ;;
        -n) visual=/dev/null
            ;;
        -w) WAVE=true
            ;;
        -x) set -x
            ;;
        *) break
            ;;
    esac
    shift
done


# compila simulador
ghdl --remove

ghdl -a --ieee=standard -fexplicit packageWires.vhd || exit 1

for F in ${src} ; do
   ghdl -a --ieee=standard -fexplicit ${F}.vhd  ||  exit 1
done

ghdl -c packageWires.vhd aux.vhd ${sim}.vhd tb_${sim}.vhd \
     -e ${simulator} || exit 1

if [ -x ./${simulator} ] ; then
        ./${simulator} --ieee-asserts=disable \
                       --stop-time=${length}${unit}s \
                       --vcd=${visual} 

        # executa gtkwave sob demanda
        test -z $WAVE  ||  gtkwave -O /dev/null ${visual} ${save} &
fi
