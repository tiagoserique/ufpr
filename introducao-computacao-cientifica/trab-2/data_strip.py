import sys

def generate_paths(types, trab, dimension):
    path = 'temp'
    return {t: f'{path}/{t}_{trab}_{dimension}.out' for t in types}


def read_l3(path, t, dim):
    with open(path) as f_l3:
        content = f_l3.readlines()
        l3_values = [t, dim]
        for c in content:
            if 'L3 bandwidth [MBytes/s]' in c:
                l3_values.append(c.split(',')[1])
    return l3_values


def read_times(path, t, dim):
    with open(path) as f_times:
        content = f_times.readlines()
        time_values = [t, dim]
        for c in content:
            if 'RDTSC Runtime [s]' in c:
                time_values.append(c.split(',')[1])
    return time_values


def read_flops(path, t, dim):
    with open(path) as f_avx:
        content = f_avx.readlines()
        values_avx = [t, dim]
        values_dp = [t, dim]
        for c in content:
            if 'AVX DP MFLOP/s' in c:
                values_avx.append(c.split(',')[1])
            elif 'DP MFLOP/s' in c:
                values_dp.append(c.split(',')[1])
    return (values_avx, values_dp)


def read_l2_cache(path, t, dim):
    with open(path) as f_l2cache:
        content = f_l2cache.readlines()
        values = [t, dim]
        for c in content:
            if 'L2 miss ratio' in c:
                values.append(c.split(',')[1])
    return values


def save_values(path, lst):
    with open(path, 'a') as final_f:
        string = ','.join(lst) + '\n'
        final_f.write(string)


trabs = ['t1', 't2']
types = ['l3', 'avx', 'l2cache']
dimension = sys.argv[1]
empty_values = ['', '', '', '', '', '']

t_name = {'t1': 'Trab 1', 't2': 'Trab 2 (Otimizado)'}
for t in trabs:
    paths = generate_paths(types, t, dimension)

    try:
        l3_values = read_l3(paths['l3'], t_name[t], dimension)
        save_values('desempenho/l3', l3_values)
    except FileNotFoundError:
        save_values('desempenho/l3', empty_values)

    try:
        time_values = read_times(paths['l3'], t_name[t], dimension)
        save_values('desempenho/time', time_values)
    except FileNotFoundError:
        save_values('desempenho/time', empty_values)

    try:
        values_avx, values_dp = read_flops(paths['avx'], t_name[t], dimension)
        save_values('desempenho/avx', values_avx)
        save_values('desempenho/flops_dp', values_dp)
    except FileNotFoundError:
        save_values('desempenho/avx', empty_values)
        save_values('desempenho/flops_dp', empty_values)

    try:
        l2cache_values = read_l2_cache(paths['l2cache'], t_name[t], dimension)
        save_values('desempenho/l2cache', l2cache_values)
    except FileNotFoundError:
        save_values('desempenho/l2cache', empty_values)

