make purge -C trabalho-1-icc
make purge -C trabalho-2-icc

make -C trabalho-1-icc
make -C trabalho-2-icc

mkdir -p entradas temp desempenho images
./broyden.sh

# Reseta arquivos
echo "trab,dimensao,derivadas,newton,jacobiana,gauss" > desempenho/l3
echo "trab,dimensao,derivadas,newton,jacobiana,gauss" > desempenho/l2cache
echo "trab,dimensao,derivadas,newton,jacobiana,gauss" > desempenho/flops_dp
echo "trab,dimensao,derivadas,newton,jacobiana,gauss" > desempenho/avx
echo "trab,dimensao,derivadas,newton,jacobiana,gauss" > desempenho/time

echo "performance" > /sys/devices/system/cpu/cpufreq/policy3/scaling_governor

for N in 10 32 50 64 100 128 200 250 256 300 400 512 600 1000 1024 2000 2048 3000 4096
do
	echo $N

	# So roda o trabalho 1 para instancias menores que 2000
	if (( $N < 2000 ));
	then
	likwid-perfctr -O -C 3 -g L3 -m ./trabalho-1-icc/newtonSNL -o "temp/out1.txt" < "entradas/entrada_$N.txt" > "temp/l3_t1_$N.out"
	likwid-perfctr -O -C 3 -g L2CACHE -m ./trabalho-1-icc/newtonSNL -o "temp/out1.txt" < "entradas/entrada_$N.txt" > "temp/l2cache_t1_$N.out"
	likwid-perfctr -O -C 3 -g FLOPS_DP -m ./trabalho-1-icc/newtonSNL -o "temp/out1.txt" < "entradas/entrada_$N.txt" > "temp/avx_t1_$N.out"
	fi

	likwid-perfctr -O -C 3 -g L3 -m ./trabalho-2-icc/newtonSNL -o "temp/out2.txt" < "entradas/entrada_$N.txt" > "temp/l3_t2_$N.out"
	likwid-perfctr -O -C 3 -g L2CACHE -m ./trabalho-2-icc/newtonSNL -o "temp/out2.txt" < "entradas/entrada_$N.txt" > "temp/l2cache_t2_$N.out"
	likwid-perfctr -O -C 3 -g FLOPS_DP -m ./trabalho-2-icc/newtonSNL -o "temp/out2.txt" < "entradas/entrada_$N.txt" > "temp/avx_t2_$N.out"

 	python3 data_strip.py $N

	# rm temp/*
done

echo "powersave" > /sys/devices/system/cpu/cpufreq/policy3/scaling_governor

python3 graph.py

rm -rf temp entradas
