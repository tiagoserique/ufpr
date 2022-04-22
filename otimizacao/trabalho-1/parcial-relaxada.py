
import sys
import numpy as np
import pandas as pd
from gurobipy import *


def parcial(n, pesos, carga_maxima, dados_parciais, LogToConsole=False):
    # Criação do modelo
    model = Model()
    model.params.LogToConsole = LogToConsole
    model.params.TimeLimit = 60 # seconds

    # Colocar variáveis no modelo
    matriz = model.addVars(n, n, vtype=GRB.CONTINUOUS)
    viagens = model.addVars(n, ub=1, vtype=GRB.CONTINUOUS)
    model.setObjective(quicksum(viagens[j] for j in range(n)), GRB.MINIMIZE)

    # Colocar restrições
    for dupla in dados_parciais: # Solução parcial
        i = dupla[0] - 1
        j = dupla[1] - 1
        model.addConstr(matriz[i,j] == 1)
    model.addConstrs(quicksum(matriz[i,j] for j in range(n)) == 1 for i in range(n)) # cada item tem q estar em exatamente uma viagem
    model.addConstrs(quicksum(pesos[i] * matriz[i,j] for i in range(n)) <= carga_maxima * viagens[j] for j in range(n)) # cada viagem nao pode ter peso maior que carga

    model.optimize()

    # Prints adicionais caso LogToConsole=True
    if LogToConsole:
        print("Viagens")
        for i in range(n):
            print(viagens[i].X, end=' ')
        print()

        print("Matriz")
        for i in range(n):
            for j in range(n):
                print(matriz[i,j].X, end=' ')
            print()
    return float(model.ObjVal)


def main():
    # le o arquivo de entrada vindo de stdin e faz o split dos dados
    entrada = sys.stdin.read().split()

    # n = numero de itens
    n = int(entrada[0])
    # m = numero de pares
    m = int(entrada[1])
    # c = capacidade maxima
    carga_maxima = int(entrada[2])
    # pesos = lista de pesos dos itens
    pesos = [int(entrada[i]) for i in range(3, 3 + n)]
    # pares_ordenados = lista de pares ordenados com a ordem dos itens
    pares_ordenados = [
        (int(entrada[i]), int(entrada[i + 1])) 
        for i in range(3 + n, 3 + n + m * 2, 2)
    ]
    # l = numero de pares ordenados da solucao parcial
    l = int(entrada[3 + n + m * 2])
    # solucao_parcial = lista de pares ordenados da solucao parcial
    dados_parciais = [
        (int(entrada[i]), int(entrada[i + 1])) 
        for i in range(3 + n + m * 2 + 1, 3 + n + m * 2 + 1 + l * 2, 2)
    ]

    # pesos = [5, 6, 4, 8, 5]
    # carga_maxima = 10
    # n = len(pesos)
    # dados_parciais = [(3,2),(5,3)]


    objetivo = parcial(n, pesos, carga_maxima, dados_parciais, LogToConsole=False)
    print("Valor da funcao objetivo obtido", str(objetivo))


if __name__ == '__main__':
    main()
