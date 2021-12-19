# Cria os diretorios
mkdir temp desempenho images

# Reseta arquivos
echo "" > desempenho/l3
echo "" > desempenho/l2cache
echo "" > desempenho/flops_dp
echo "" > desempenho/time

# Fixa a frquencia do processador
echo "performance" > /sys/devices/system/cpu/cpufreq/policy3/scaling_governor

make purge
make avx
make geraSL

for n in 10 32 50 64 100 128 200 250 256 300 400 512 600 1000 1024 2000 2048 3000 4096
do
    ./geraSL "$n" > "entradas/entrada_$n.in"

	likwid-perfctr -O -C 3 -g L3 -m ./gaussJacobi-likwid "entradas/entrada_$n.in"  > "temp/l3_$n.out"
	likwid-perfctr -O -C 3 -g L2CACHE -m ./gaussJacobi-likwid "entradas/entrada_$n.in" > "temp/l2cache_$n.out"
	likwid-perfctr -O -C 3 -g FLOPS_DP -m ./gaussJacobi-likwid "entradas/entrada_$n.in" > "temp/flops_dp_$n.out"

	# Seleciona os dados dos arquivos gerados com o LIKWID
	python3 python_scripts/data_strip.py $n

	# Remove os arquivos que nao serao mais utilizados
	rm "out_gaussJacobi_$n" "out_gaussJacobiOpt_$n" temp/*
done

# Gera graficos (resultado no diretorio 'imagens')
python3 python_scripts/graph.py

# Retorna para a frequencia original
echo "powersave" > /sys/devices/system/cpu/cpufreq/policy3/scaling_governor 
