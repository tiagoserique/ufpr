program questao85;
const
	max = 100;
type
	Tmat = array [1 .. max,1 .. max] of integer;
function conhece(var mat:Tmat; var celebridade:integer):boolean;
var
	i,j,cont:integer;
	break:boolean;
begin
	i:=0;
	conhece:=false;
	while (not conhece) do
	begin
		i:=i+1;
		j:=0;
		cont:=0;
		break:=false;
		while (not break) and (not conhece) do
		begin
			j:=j+1;
			if (mat[j,i] = 1) then
			begin
				cont:=cont+1;
				if (cont = 4) and (mat[i,i] = 0) then
					conhece:=true;
			end
			else if (mat[j,i] = 0) and (i <> j) then
				break:=true;
		end;

		if (conhece) and (not break) then
			celebridade:=i;
	end;
end;


procedure dados(var mat:Tmat; i,j:integer);
begin
	mat[i,j]:=1;
end;


procedure inicia_mat(var mat:Tmat; lim:integer);
var
	i,j:integer;
begin
	for i:=1 to lim do
		for j:=1 to lim do
			mat[i,j]:=0;	
end;


var
	mat:Tmat;
	npessoas,celebridade,i,j:integer;
begin
	writeln('Numero de pessoas:');
	read(npessoas);
	inicia_mat(mat,npessoas);
	read(i,j);

	while (i <> 0) and (j <> 0) do
	begin
		if (i <> 0) and (j <> 0) then
			dados(mat,i,j);
		read(i,j);
	end;
	
	if (conhece(mat,celebridade)) and (celebridade <> 0) then
		writeln(celebridade,' é celebridade')
	else
		writeln('Não há celebridades');
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
Solucao 1: Forca Bruta
Para cada pessoa na festa, verificar se as condicoes C1 e C2 definidas acima sao satisfeitas.  Se existirem N pessoas na festa este algoritmo tem complexidade N^2, uma vez que para cada pessoa ela tem que verificar as condicoes com a relacao a todas as demais.
*)

