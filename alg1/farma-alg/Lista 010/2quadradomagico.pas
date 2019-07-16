
(* ENUNCIADO
Dizemos que uma matriz quadrada inteira é um quadrado mágico se a soma dos elementos de cada linha, 
a soma dos elementos de cada coluna e a soma dos elementos das diagonais principal e secundária são todos iguais. Exemplo:
8 0 7
4 5 6
3 10 2
é um quadrado mágico pois 8+0+7 = 4+5+6 = 3+10+2 = 8+4+3 = 0+5+10 = 7+6+2 = 8+5+2 = 3+5+7 = 15.
Crie um programa em Free Pascal que leia um valor n representando o tamanho da matriz e leia uma matrix A(n x n) 
que representa o quadrado e informe se a matriz é um quadrado mágico.
Exemplo de entrada:
3
8 0 7
4 5 6
3 10 2
Saída esperada para o exemplo acima:
sim
*)

program 2quadradomagico;
const
	max = 100;
type
	Tquadrado = record
		mat : array [1 .. max,1 .. max] of longint;
		n:longint;
		lin,col,dia:boolean;
		end;


function diagonal2(var matriz:Tquadrado):longint;
var
	i,j:longint;
begin
	diagonal2:=0;

	for i:=1 to matriz.n do
	begin	
		j:=matriz.n-i+1;
		diagonal2:=diagonal2+matriz.mat[i,j];
	end;
end;


procedure diagonais(var matriz:Tquadrado);
var
	i,dia1,dia2:longint;
begin
	matriz.dia:=true;
	dia1:=0;
	
	for i:=1 to matriz.n do
		dia1:=dia1+matriz.mat[i,i];

	dia2:=diagonal2(matriz);
	if dia1 <> dia2 then
		matriz.dia:=false;		
end;


procedure coluna(var matriz:Tquadrado);
var
	i,j:longint;
	soma: array [1 .. max] of longint;
begin
	matriz.col:=true;
	for i:=1 to matriz.n do
		soma[i]:=0;
	
	for j:=1 to matriz.n do
		for i:=1 to matriz.n do
			soma[j]:=soma[j]+matriz.mat[i,j];
	i:=0;
	while (matriz.col=true) and (i<matriz.n-1) do
	begin
		i:=i+1;
		if soma[i] <> soma[i+1] then
			matriz.col:=false;
	end;
	 
end;

procedure linha(var matriz:Tquadrado);
var
	i,j:longint;
	soma:array [1 .. max] of longint;
	
begin
	matriz.lin:=true;
	for i:=1 to max do
		soma[i]:=0;
	
	for i:=1 to matriz.n do
		for j:=1 to matriz.n do
			soma[i]:=soma[i]+matriz.mat[i,j];
	i:=0;
	while (matriz.lin = true)and(i<matriz.n-1) do
	begin
		i:=i+1;
		if soma[i] <> soma[i+1] then
			matriz.lin:=false;	
	end;
	
end;

procedure ler(var matriz:Tquadrado);
var
	i,j:longint;
begin
	for i:=1 to matriz.n do
		for j:=1 to matriz.n do
			read(matriz.mat[i,j]);	
end;


var
	matriz:Tquadrado;
begin
	read(matriz.n);
	ler(matriz);
	linha(matriz);
	coluna(matriz);
	diagonais(matriz);
	
	(*writeln(matriz.dia);
	writeln(matriz.lin);
	writeln(matriz.col);*)
	
	if ((matriz.lin=true)and(matriz.col=true)and(matriz.dia=true)) then
		writeln('sim')
	else
		writeln('nao');
end.
