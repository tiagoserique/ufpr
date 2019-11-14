program exer2;
const
	max = 100;
type
	matriz = array [1 .. max,1 .. max] of integer;

function menor(var mat:matriz; tam,i:integer):integer;
var
	k,j:integer;
begin
	j:=1;
	k:=j+1;
	while (j <= tam-1) do
	begin
		if (mat[i,j] > mat[i,k]) then
		begin	
			j:=k;
			k:=j+1;
		end
		else
			k:=k+1;
	end;
	menor:=mat[i,j];
end;

procedure ler(var mat:matriz; var tam:integer);
var
	i,j:integer;
begin
	read(tam);
	for i:=1 to tam do
		for j:=1 to tam do
			read(mat[i,j]);
end;

var
	mat:matriz;
	vet:array [1 .. max] of integer;
	tam,i:integer;
begin
	ler(mat,tam);
	for i:=1 to tam do
		vet[i]:=menor(mat,tam,i);

	for i:=1 to tam do
		write(vet[i],' ');
	writeln(' ');
end.

//Ex 2.
//- escrever um procedimento que dada uma matriz, calcula um vetor no qual
//cada elemento do vetor corresponde ao menor elemento da linha
//correspondente
