import sys

def generate_paths(types, dimension):
    path = 'temp'
    return {t: f'{path}/{t}_{dimension}.out' for t in types}


def read_l3(path, dim):
    with open(path) as f_l3:
        content = f_l3.readlines()
        l3_values = [dim]
        for c in content:
            if 'L3 bandwidth [MBytes/s]' in c:
                l3_values.append(c.split(',')[1])
    return l3_values


def read_times(path, dim):
    with open(path) as f_times:
        content = f_times.readlines()
        time_values = [dim]
        for c in content:
            if 'RDTSC Runtime [s]' in c:
                time_values.append(c.split(',')[1])
    return time_values


def read_flops(path, dim):
    with open(path) as f_flops:
        content = f_flops.readlines()
        values = [dim]
        for c in content:
            if 'AVX DP MFLOP/s' in c:
                values.append(c.split(',')[1])
            elif 'DP MFLOP/s' in c:
                values.append(c.split(',')[1])
    return values


def read_l2_cache(path, dim):
    with open(path) as f_l2cache:
        content = f_l2cache.readlines()
        values = [dim]
        for c in content:
            if 'L2 miss ratio' in c:
                values.append(c.split(',')[1])
    return values


def save_values(path, lst):
    with open(path, 'a') as final_f:
        string = ','.join(lst) + '\n'
        final_f.write(string)


types = ['l3', 'flops_dp', 'l2cache']
dimension = sys.argv[1]

paths = generate_paths(types, dimension)

l3_values = read_l3(paths['l3'], dimension)  # index, l3, l3 Opt
save_values('desempenho/l3', l3_values)

time_values = read_times(paths['l3'], dimension)  # index, time, time Opt
save_values('desempenho/time', time_values)

flops_values = read_flops(paths['flops_dp'], dimension)  # index, DP, AVX, DP Opt, AVX Opt
save_values('desempenho/flops_dp', flops_values)

l2cache_values = read_l2_cache(paths['l2cache'], dimension)  # index, l2cache, l2cache Opt
save_values('desempenho/l2cache', l2cache_values)
