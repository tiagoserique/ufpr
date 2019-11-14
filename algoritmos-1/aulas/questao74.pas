program exer4;
const
	max = 100;
type
	mat = array [1 .. max,1 .. max] of integer;

procedure imprimir(var matriz:mat; tam: integer);
var
	i,j:integer;
begin
	for i:=1 to tam do
	begin
		for j:=1 to tam do
			write(matriz[i,j],' ');
		writeln(' ');
	end;
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
	temp,i,j,tam:integer;
begin
	ler(matriz,tam);

	for i:=1 to tam do
		for j:=1 to i do
		begin
			temp:=matriz[i,j];
			matriz[i,j]:=matriz[j,i];
			matriz[j,i]:=temp;
		end;
	
	imprimir(matriz,tam);
end.
//Ex.
//- escrever um procedimento que "flipa" uma matriz quadrada sobre a diagonal
//principal  (matriz transposta)

//  1 5 10
//  7 3 11
//  8 2 13
//para
//  1   7  8
//  5   3  2
//  10 11 13

