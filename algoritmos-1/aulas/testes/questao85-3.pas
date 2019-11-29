(*
O problema da identificacao de uma celebridade.

Rita e' uma colunista e esta' fazendo a cobertura de uma festa.  Seu trabalho
e' identificar uma celebridade, caso ela exista. Uma celebridade e' uma pessoa
que e' conhecida por todas as demais pessoas da festa, mas que nao conhece
ninguem.   Rita  faz a seguinte pergunta aos convidados: "voce conhece aquela
pessoa ali?".  Considere que todas as pessoas vao responder a pergunta de
forma sincera. Escreva um programa que ajuda a tarefa de Rita identificar
uma celebridade da festa.

Uma pessoa P Ã© identificada como uma celebridade em uma festa se:
 C1: todos conhecem P
 C2: nao conhece ninguem

1) representacao do fato de Pi conhecer Pj em uma matriz:
  m[i,j] = 0 se Pi nao conhece Pj
  m[i,j] = 1 de Pi conhece Pj

Escrever um procedimento que leia uma sequencia de pares e preencher a matriz. NÃ£o esqueÃ§a de inicializar a matriz com zeros.
Exemplo (considerando 5 pessoas):
  3 4
  5 1
  5 4
  2 1
  2 4
  1 4

  matriz   0 0 0 1 0
           1 0 0 1 0
	   0 0 0 1 0
	   0 0 0 0 0
	   1 0 0 1 0

-----------------------------------
Solucao 3: usando o TAD Conjunto
- igual a solucao anterior, utilizando o TAD Conjunto
- Pergunta: qual solucao e' melhor?
*)
