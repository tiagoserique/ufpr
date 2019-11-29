program questao85;
uses tadpilha;

const
	max = 100;
type
	Tmat = array [1 .. max,1 .. max] of integer;

function verifica(var mat:Tmat; var i:integer):boolean;
var
	j,cont:integer;
	break:boolean;
begin
	verifica:=false;
	j:=0;
	cont:=0;
	break:=false;
	while (not break) and (not verifica) do
	begin
		j:=j+1;
		if (mat[j,i] = 1) then
		begin
			cont:=cont+1;
			if (cont = 4) and (mat[i,i] = 0) then
				verifica:=true;
		end
		else if (mat[j,i] = 0) and (i <> j) then
			break:=true;
	end;
end;


function seconhecem(i,j:integer; mat:Tmat):boolean;
begin
	if mat[i,j] = 1 then
		seconhecem:=true
	else
		seconhecem:=false;
end;


function possivel_cel(pil:Tpilha; mat:Tmat):integer;
var
	p1,p2:integer;
begin
	while (pil.top <> 1) do
	begin
		p1:=pop(pil); //i
		p2:=pop(pil); //j
		if seconhecem(p1,p2,mat) then
			push(pil,p2)
		else
			push(pil,p1);
	end;
	possivel_cel:=pop(pil);
end;


procedure dados(var mat:Tmat; lim:integer);
var
	i,j:integer;
begin
	for i:=1 to lim do
		for j:=0 to lim do
			mat[i,j]:=0;

	read(i,j);
	while (i <> 0) and (j <> 0) do
	begin
		if (i <> 0) and (j <> 0) then
			mat[i,j]:=1;
		read(i,j);
	end;
end;


procedure inicia_pil(var pil:Tpilha; lim:integer);
var
	i:integer;
begin
	criaPilha(pil);

        for i:=1 to lim do
                push(pil,i);	
end;


var
	pil:Tpilha; 
	mat:Tmat;
	npessoas,celebridade:integer;
begin
	writeln('Numero de pessoas:');
	read(npessoas);
	inicia_pil(pil,npessoas);
	dados(mat,npessoas);

	celebridade := possivel_cel(pil,mat);

	if (verifica(mat,celebridade)) then
		writeln(celebridade,' é celebridade')
	else
		writeln('Não há celebridade');
end.
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

Escrever um procedimento que leia uma sequencia de pares e preencher a matriz. 
NÃ£o esqueÃ§a de inicializar a matriz com zeros.
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
Solucao 2: Solucao usando o TAD Pilha

1) Escrever um procedimento que inicializa uma pilha com todas as pessoas.  No exemplo anterior, a pilha deve conter os numeros de 1 a 5.

2) Escrever uma funcao que retorna uma possivel celebridade a partir da pilha de pessoas.  A ideia e' que seja removida da pilha as pessoas que nao podem ser celebridades da seguinte forma:
     remova da pilha uma pessoa p1
     remova da pilha uma pessoa p2
     se p1 conhece p2 entao
        - p1 nao pode ser uma celebridade, mas p2 pode
	- assim, insira p2 novamente na pilha
     se p1 nao conhece p2 entao
        - p1 pode ser uma celebridade, mas p2 nao
	- assim, insira p1 novamente na pilha

Este processo deve ser repetido ate' que apenas 1 pessoa sobre na pilha.  Esta e' a unica pessoa que pode ser uma celebridade e deve ser retornada pela funcao.

3) Escrever uma funcao que verifique se a pessoa retornada pela funcao anterior e' realmente uma celebridade verificando a coluna e linha correspondente a pessoa na matriz.
*)

