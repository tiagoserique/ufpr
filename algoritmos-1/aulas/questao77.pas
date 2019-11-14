program questao74;
const
	max = 1000;
type
	mat = array [0 .. max, 0 .. max] of qword;

procedure escreve(var matriz:mat;linha:qword);
var
	i,j:qword;
begin
	j:=0;
	while (j < linha) do
	begin
		j:=j+1;
		i:=0;
		while (i < j) do
		begin
			i:=i+1;
			write(matriz[j,i],' ');
		end;
		writeln(' ');
	end;
end;

procedure calculatri(var matriz:mat; i:qword);
var
	j:qword;
begin
	j:=0;
	while (j < i) do
	begin
		j:=j+1;
		matriz[i,j]:=matriz[i-1,j] + matriz[i-1,j-1];
	end;		
end;

procedure inicializa(var matriz:mat);
var
	i,j:qword;
begin
	for i:=0 to max do
		for j:=0 to max do
			matriz[i,j]:=0;
	matriz[1,1]:=1;
end;

var
	triangulo:mat;
	linha,i:qword;
begin
	inicializa(triangulo);
	read(linha);
	if (linha > 0) and (linha < 70) then
		for i:=2 to linha do
			calculatri(triangulo,i);

	escreve(triangulo,linha);
end.

//Ex 1.
//- escrever um procedimento que calcula o triangulo de Pascal de n linhas
   
//  1
//  1  1
//  1  2  1
//  1  3  3  1
//  1  4  6  4  1
//  1  5 10 10  5  1

//- escrever um procedimento que dada uma matriz, escreve o triangula inferior
