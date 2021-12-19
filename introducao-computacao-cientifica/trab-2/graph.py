from datetime import time
import plotly.graph_objects as go
import pandas as pd
import numpy as np

def plot_flops(column_dp, column_avx):
    groups_dp = column_dp.groupby('trab')
    groups_avx = column_avx.groupby('trab')
    fig = go.Figure()

    colors = ['#2A9D8F', '#E76F51']
    for g_dp, g_avx, color in zip(groups_dp, groups_avx, colors):
        fig.add_trace(go.Scatter(x=g_dp[1].index.get_level_values('dimensao'), y=g_dp[1].values, name=g_dp[0]+' - Flops DP', line=dict(color=color)))
        fig.add_trace(go.Scatter(x=g_avx[1].index.get_level_values('dimensao'), y=g_avx[1].values, name=g_avx[0]+' - Flops AVX', line=dict(color=color)))

    fig.update_layout(title=f'Gráfico de comparação Flops DP/Flops AVX X {column_dp.name}',
                xaxis_title='Valores N',
                yaxis_title='MFLOP/s',
                plot_bgcolor='white')
    fig.update_yaxes(showgrid=True, gridcolor='#d3d3d3')
    fig.update_xaxes(linecolor='#d3d3d3')
    fig.show()
    fig.write_image(f'images/flops_dp_{column_dp.name}.png')


def plot_l3(column):
    groups = column.groupby('trab')
    fig = go.Figure()

    colors = ['#2A9D8F', '#E76F51']
    for g, color in zip(groups, colors):
        fig.add_trace(go.Scatter(x=g[1].index.get_level_values('dimensao'), y=g[1].values, name=g[0], line=dict(color=color)))

    fig.update_layout(title=f'Gráfico de comparação L3 X {column.name}',
                xaxis_title='Valores N',
                yaxis_title='Memory bandwidth [MBytes/s]',
                plot_bgcolor='white')
    fig.update_yaxes(showgrid=True, gridcolor='#d3d3d3')
    fig.update_xaxes(linecolor='#d3d3d3')
    fig.show()
    fig.write_image(f'images/l3_{column.name}.png')


def plot_time(column):
    groups = column.groupby('trab')
    fig = go.Figure()

    colors = ['#2A9D8F', '#E76F51']
    for g, color in zip(groups, colors):
        fig.add_trace(go.Scatter(x=g[1].index.get_level_values('dimensao'), y=g[1].values, name=g[0], line=dict(color=color)))

    fig.update_layout(title=f'Gráfico de comparação de tempo X {column.name}',
                xaxis_title='Valores N',
                yaxis_title='Milisegundos',
                plot_bgcolor='white')
    fig.update_yaxes(zeroline=True, showgrid=True, gridcolor='#d3d3d3', zerolinecolor='#d3d3d3', type="log")
    fig.update_xaxes(zeroline=False, showgrid=False)
    fig.show()
    fig.write_image(f'images/time_{column.name}.png')


def plot_l2cache(column):
    groups = column.groupby('trab')
    fig = go.Figure()

    colors = ['#2A9D8F', '#E76F51']
    for g, color in zip(groups, colors):
        fig.add_trace(go.Scatter(x=g[1].index.get_level_values('dimensao'), y=g[1].values, name=g[0], line=dict(color=color)))

    fig.update_layout(title=f'Gráfico de comparação L2 Cache X {column.name}',
                xaxis_title='Valores N',
                yaxis_title='Data Cache Miss Ratio',
                plot_bgcolor='white')
    fig.update_yaxes(showgrid=True, gridcolor='#d3d3d3')
    fig.update_xaxes(linecolor='#d3d3d3')
    fig.show()
    fig.write_image(f'images/l2cache_{column.name}.png')


path = 'desempenho/'

l3_df = pd.read_csv(path+'l3', index_col=[0, 1])
l3_df.columns = ['derivadas', 'newton', 'jacobiana', 'gauss']
l3_df.apply(lambda col: plot_l3(col))

time_df = pd.read_csv(path+'time', index_col=[0, 1])
time_df.applymap(lambda x: x*1000)  # Transforma em milisegundos
time_df.columns = ['derivadas', 'newton', 'jacobiana', 'gauss']
time_df.apply(lambda col: plot_time(col))

flops_df = pd.read_csv(path+'flops_dp', index_col=[0, 1])
avx_df = pd.read_csv(path+'avx', index_col=[0, 1])
column_names = flops_df.columns
for col in column_names:
    plot_flops(flops_df[col], avx_df[col])

l2cache_df = pd.read_csv(path+'l2cache', index_col=[0, 1])
l2cache_df.apply(lambda col: plot_l2cache(col))
