(* 
ENUNCIADO
Uma matriz quadrada A n×n é considerada triangular quando os elementos que estão acima da sua diagonal principal são 
todos nulos (matriz triangular inferior) ou quando os elementos que estão abaixo de sua diagonal principal são todos 
nulos (matriz triangular superior). Vejamos dois exemplos de matrizes triangulares:

//Devia ter uma imagem aqui (matriz triangular inferior)
//Devia ter uma imagem aqui (matriz triangular superior)

Faça um programa em Free Pascal que leia um inteiro positivo n, sendo 1 ≤ m, n ≤ 100, e uma matriz inteira A n×n . 
O programa deve imprimir “sim” caso a matriz A seja triangular, caso contrário deve imprimir “nao”.
Nos casos de teste cada elemento x da matriz A é definido por 0 ≤ x ≤ 100.

Exemplo de entrada 1:
3
1 9 5
0 2 4
0 0 7
Saı́da esperada para o exemplo acima:
sim

Exemplo de entrada 2:
3
1 0 0
5 2 0
4 9 3
Saı́da esperada para o exemplo acima:
sim

Exemplo de entrada 2:
3
1 2 3
4 5 6
7 8 9
Saı́da esperada para o exemplo acima:
nao
*)

program 4matriztriangular;
const
	max = 100;
type
	matriz = array [1 .. max, 1 .. max] of integer;

function veriinf(mat:matriz;n:longint):boolean;
var
	lin,col,soma:longint;
begin
	veriinf:=true;
	soma:=0;
	for col:=1 to n do
		for lin:=col+1 to n do
			soma:=soma+mat[lin,col];
	if soma > 0 then
		veriinf:=false;
end;

function verisup(mat:matriz;n:longint):boolean;
var
	lin,col,soma:longint;
begin
	verisup:=true;
	soma:=0;
	for lin:=1 to n do
		for col:=lin+1 to n do
			soma:=soma+mat[lin,col];
	if soma > 0 then
		verisup:=false;
end;

procedure ler(var mat:matriz;n:longint);
var
	lin,col:longint;
begin
	for lin:=1 to n do
		for col:=1 to n do
			read(mat[lin,col]);
end;

var
	n:longint;
	mat:matriz;
	sup,inf:boolean;
begin
	read(n);
	ler(mat,n);
	sup:=verisup(mat,n);
	inf:=veriinf(mat,n);
	if (sup=true) or (inf=true) then
		writeln('sim')
	else
		writeln('nao');
end.
