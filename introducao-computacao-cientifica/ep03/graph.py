import plotly.graph_objects as go
import pandas as pd
import numpy as np

def plot_flops(flops_df):
    fig = go.Figure()
    fig.add_trace(go.Scatter(x=flops_df.index, y=flops_df[1], name='flops_dp - Gauss Jacobi', line=dict(color='#2A9D8F')))
    fig.add_trace(go.Scatter(x=flops_df.index, y=flops_df[2], name='flops_avx - Gauss Jacobi', line=dict(color='#1C6C7B')))
    fig.add_trace(go.Scatter(x=flops_df.index, y=flops_df[3], name='flops_dp - Gauss Jacobi Opt', line=dict(color='#E76F51')))
    fig.add_trace(go.Scatter(x=flops_df.index, y=flops_df[4], name='flops_avx - Gauss Jacobi Opt', line=dict(color='#AC4338')))

    fig.update_layout(title='Gráfico de comparação flops_dp e flops_avx',
                xaxis_title='Valores N',
                yaxis_title='MFLOP/s',
                plot_bgcolor='white')
    fig.update_yaxes(showgrid=True, gridcolor='#d3d3d3')
    fig.update_xaxes(linecolor='#d3d3d3')
    fig.show()
    fig.write_image("images/flops_dp.png")


def plot_l3(l3_df):
    fig = go.Figure()
    fig.add_trace(go.Scatter(x=l3_df.index, y=l3_df[1], name='Gauss Jacobi', line=dict(color='#2A9D8F')))
    fig.add_trace(go.Scatter(x=l3_df.index, y=l3_df[2], name='Gauss Jacobi Opt', line=dict(color='#E76F51')))
    fig.update_layout(title='Gráfico de comparação L3',
                xaxis_title='Valores N',
                yaxis_title='Memory bandwidth [MBytes/s]',
                plot_bgcolor='white')
    fig.update_yaxes(showgrid=True, gridcolor='#d3d3d3')
    fig.update_xaxes(linecolor='#d3d3d3')
    fig.show()
    fig.write_image("images/l3.png")


def plot_time(time_df):
    # Transforma em milisegundos
    time_df[1] = time_df[1] * 1000
    time_df[2] = time_df[2] * 1000

    fig = go.Figure()
    fig.add_trace(go.Scatter(x=time_df.index, y=time_df[1], name='Gauss Jacobi', line=dict(color='#2A9D8F')))
    fig.add_trace(go.Scatter(x=time_df.index, y=time_df[2], name='Gauss Jacobi Opt', line=dict(color='#E76F51')))
    fig.update_layout(title='Gráfico de comparação de tempo',
                xaxis_title='Valores N',
                yaxis_title='Milisegundos',
                plot_bgcolor='white')
    fig.update_yaxes(zeroline=True, showgrid=True, gridcolor='#d3d3d3', zerolinecolor='#d3d3d3', type="log")
    fig.update_xaxes(zeroline=False, showgrid=False)
    fig.show()
    fig.write_image("images/time.png")


def plot_l2cache(l2cache_df):
    fig = go.Figure()
    fig.add_trace(go.Scatter(x=l2cache_df.index, y=l2cache_df[1], name='Gauss Jacobi', line=dict(color='#2A9D8F')))
    fig.add_trace(go.Scatter(x=l2cache_df.index, y=l2cache_df[2], name='Gauss Jacobi Opt', line=dict(color='#E76F51')))
    fig.update_layout(title='Gráfico de comparação L2 Cache',
                xaxis_title='Valores N',
                yaxis_title='Data Cache Miss Ratio',
                plot_bgcolor='white')
    fig.update_yaxes(showgrid=True, gridcolor='#d3d3d3')
    fig.update_xaxes(linecolor='#d3d3d3')
    fig.show()
    fig.write_image("images/l2cache.png")


path = 'desempenho/'

l3_df = pd.read_csv(path+'l3', header=None, index_col=0)
plot_l3(l3_df)

time_df = pd.read_csv(path+'time', header=None, index_col=0)
plot_time(time_df)

flops_df = pd.read_csv(path+'flops_dp', header=None, index_col=0)
plot_flops(flops_df)

l2cache_df = pd.read_csv(path+'l2cache', header=None, index_col=0)
plot_l2cache(l2cache_df)
