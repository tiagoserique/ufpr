program exer3;
const
	max = 100;
type
	mat = array [1 .. max,1 .. max] of integer;

procedure imprimir(var matriz:mat;var tam:integer);
var
	i,j:integer;
begin
	j:=tam;
	for i:=1 to tam do
	begin
		write(matriz[j,i],' ');
		j:=j-1;
	end;
	writeln(' ');
end;


procedure ler(var matriz:mat; var tam:integer);
var
	i,j:integer;
begin
	read(tam);
	for i:=1 to tam do
		for j:=1 to tam do
			read(matriz[i,j]);
end;

var
	matriz:mat;
	temp,tam,auxtam,i,j:integer;
begin
	ler(matriz,tam);
	
	if (tam mod 2 = 0) then
		auxtam:=tam div 2
	else
		auxtam:=(tam-1) div 2;
	j:=tam;
	for i:=1 to auxtam do
	begin
		temp:=matriz[i,j];
		matriz[i,j]:=matriz[j,i];
		matriz[j,i]:=temp;
		j:=j-1;
	end;

	imprimir(matriz,tam);
end.
//Ex. 
//- escrever um procedimento que faz a inversao da diagonal secundaria de
//uma matriz quadrada.
