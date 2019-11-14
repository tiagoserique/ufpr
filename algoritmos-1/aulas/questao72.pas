program exer2;
const
	max = 100;
type
	tpmat = record
		mat:array [1 .. max, 1 .. max] of integer;
		tam:integer;
	end;


procedure escrever(var matriz:tpmat);
var
	i:integer;
begin
	writeln(' ');
	for i:=1 to matriz.tam do
		write(matriz.mat[i,i],' ');
	writeln(' ');
end;


procedure ler(var matriz:tpmat);
var
	i,j:integer;
begin
	read(matriz.tam);
	for i:=1 to matriz.tam do
		for j:=1 to matriz.tam do
			read(matriz.mat[i,j]);
end;


var
	matriz:tpmat;
	i,j,x,temp:integer;
begin
	ler(matriz);
	
	if (matriz.tam mod 2 = 0) then
		x:=matriz.tam div 2
	else
		x:=(matriz.tam-1) div 2;
	
	j:=matriz.tam;
	for i:=1 to x do
	begin
		temp:=matriz.mat[i,i];
		matriz.mat[i,i]:=matriz.mat[j,j];
		matriz.mat[j,j]:=temp;
		j:=j-1;
	end;
	escrever(matriz);
end.
//Ex. 
//- escrever um procedimento que faz a inversao da diagonal principal de uma
//matriz quadrada.

