program exer5;
const
	max = 100;
type
	mat = array [1 .. max,1 .. max] of integer;

function vercol(var matriz:mat; tam:integer):boolean;
var
	i,j,cont:integer;
begin
	vercol:=true;
	for i:=1 to tam do
	begin
		cont:=0;
		for j:=1 to tam do
		begin
			if (matriz[j,i] = 1) then
				cont:=cont+1;
		end;
		if (cont > 1) then
			vercol:=false;
	end;
end;


function verlin(var matriz:mat; tam:integer):boolean;
var
	i,j,cont:integer;
begin
	verlin:=true;
	for i:=1 to tam do
	begin
		cont:=0;
		for j:=1 to tam do
		begin
			if (matriz[i,j] = 1) then
				cont:=cont+1;
		end;
		if (cont > 1) then
			verlin:=false;
	end;
end;


procedure ler(var matriz:mat;var tam:integer);
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
	tam:integer;
	per1,per2:boolean;
begin
	ler(matriz,tam);
	
	per1:=verlin(matriz,tam);
	per2:=vercol(matriz,tam);
	
	if (per1) and (per2) then
		writeln('eh permutacao')
	else
		writeln('nao eh permutacao');
end.
//Ex.
//- determinar se uma  matriz e' de permutacao: todas as linhas e colunas tem
//somente um elemento com valor 1 e os demais 0.
//   0 1 0 0
//   1 0 0 0
//   0 0 0 1
//   0 0 1 0
