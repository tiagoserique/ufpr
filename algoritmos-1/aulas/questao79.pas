program exer3; const
	max = 100;
type
	vet = array [1 .. max] of integer;
	mat = array [1 .. max] of vet;

function maior(var matriz:mat; tam,j:integer):integer;
var
	i,k:integer;
begin
	i:=1;
	k:=i+1;
	while (i <= tam-1) do
	begin
		if (matriz[i,j] < matriz[k,j]) then
		begin
			i:=k;
			k:=i+1;
		end
		else
			k:=k+1;
	end;
	maior:=matriz[i,j]
end;

var
	matriz:mat;
	vetor:vet;
	i,j,tam:integer;
begin
	read(tam);
	for i:=1 to tam do
		for j:=1 to tam do
			read(matriz[i,j]);
	
	for j:=1 to tam do
		vetor[j]:=maior(matriz,tam,j);

	for i:=1 to tam do
		write(vetor[i],' ');
	writeln(' ');
end.

//Ex 3. 
//- escrever um procedimento que dada uma matriz, calcula um vetor no qual
//cada elemento do vetor corresponde ao maior elemento da coluna
//correspondete
