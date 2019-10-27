(* 
ENUNCIADO
Faça um programa em Free Pascal que leia dois inteiros positivos m e n, sendo 1 ≤ m, n ≤ 100, e uma matriz A m×n . 
O programa deve imprimir o números de linhas e o número de colunas que são nulas, ou seja, quando todos os elementos de 
uma linha ou coluna são iguais a 0 (zero).
Nos casos de teste cada elemento x da matriz A é definido por 0 ≤ x ≤ 100.

Exemplo de entrada:
4 4
1 0 2 3
4 0 5 6
0 0 0 0
0 0 0 0
Saı́da esperada para o exemplo acima:
linhas: 2
colunas: 1
*)

program 2elementosnulos;
const
	max=100;
type
	mat=array [1 .. max, 1 .. max] of integer;

function verlin(matriz:mat; lin,n:integer):boolean;
var
	col:integer;
begin
	verlin:=true;
	col:=0;
	while(verlin=true)and(col<n) do
	begin
		col:=col+1;	
		if (matriz[lin,col]<>0) then
			verlin:=false;
	end;	
end;

function vercol(matriz:mat; col,m:integer):boolean;
var
	lin:integer;
begin
	vercol:=true;
	lin:=0;
	while(vercol=true)and(lin<m)do
	begin
		lin:=lin+1;
		if (matriz[lin,col]<>0) then
			vercol:=false;
	end;
end;
	
procedure ler(var matriz:mat;var m,n:integer);
var
	cont,cont1:integer;
begin
	read(m,n);
	for cont:=1 to m do
		for cont1:=1 to n do
			read(matriz[cont,cont1]);
end;

	
var
	matriz:mat;
	m,n,lin,col,cont,cont2:integer;
	flag:boolean;
begin
cont:=0; cont2:=0;
ler(matriz,m,n);

for lin:=1 to m do
begin 
	flag:=false;
	flag:=verlin(matriz,lin,n);
	if flag=true then
		cont:=cont+1;
end;
for col:=1 to n do
begin
	flag:=false;
	flag:=vercol(matriz,col,m);
	if flag=true then
		cont2:=cont2+1;
end;

writeln('linhas: ',cont);
writeln('colunas: ',cont2);
end.
