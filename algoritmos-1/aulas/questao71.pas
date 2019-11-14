program exer1;
const
	max = 100;
type
	mat = array [1 .. max,1 .. max] of integer;
        tpmat = record
		mat1:mat;
		mat2:mat;
	end;

procedure ler(var matriz:tpmat;tam:integer);
var
	i,j:integer;
begin
	writeln('1 Matriz');
	for i:=1 to tam do
		for j:=1 to tam do
			read(matriz.mat1[i,j]);
	writeln('2 Matriz');
	for i:=1 to tam do
		for j:=1 to tam do
			read(matriz.mat2[i,j]);
end;

var
	matriz:tpmat;
	result:mat;
	i,j,tam:integer;
begin
	read(tam);
	ler(matriz,tam);
	
	for i:=1 to tam do
		for j:=1 to tam do
			result[i,j]:=matriz.mat1[i,j]+matriz.mat2[i,j];
	
	for i:=1 to tam do
	begin
		for j:=1 to tam do
			write(result[i,j],' ');
		writeln(' ');
	end;
end.
//Ex.
//- escrever um programa que faz a soma de duas matrizes
