(*
ENUNCIADO
Faça um programa em Free Pascal que leia dois inteiros positivos m e n, sendo 1 ≤ m, n ≤ 100, e uma matriz A m×n. 
O programa deve imprimir “sim” se há elementos repetidos na matriz A, caso contrário deve imprimir “nao”.
Nos casos de teste cada elemento x da matriz A é definido por 1 ≤ x ≤ 1000.

Exemplo de entrada 1:
3 3
1 2 3
4 5 6
7 8 9
Saída esperada para o exemplo acima:
nao

Exemplo de entrada 2:
3 4
1 2 3 4
4 5 6 7
7 8 9 10
Saída esperada para o exemplo acima:
sim
*)

program 1repeticaoemmatriz;

type
	mat= array [1 .. 100,1 .. 100] of integer;


function repete(matriz:mat; m,n,lin,col,x:integer):boolean;
var
	cont,cont2:integer;
begin
repete:=false;
	for cont:=lin to m do
	begin
		for cont2:=col+1 to n do
			if (x=matriz[cont,cont2]) then
				repete:=true;
		col:=0;
	end;
end;

procedure ler(var matriz:mat; m,n:integer);
var
	lin,col:integer;
begin
        for lin:=1 to m do
                for col:=1 to n do
                        read(matriz[lin,col]);
end;

var
	matriz:mat;
	m,n,lin,col,x:integer;
	repetido:boolean;
begin
read(m);
read(n);
if (n>=1) and (m>=1) and(n<=100) and (m<=100) then
begin
	ler(matriz,m,n);
	lin:=0;
	repetido:=false;
	while(lin<m)and(repetido=false) do
	begin
		lin:=lin+1;
		col:=0;
		while (col<n)and(repetido=false) do
		begin
			col:=col+1;
			x:=matriz[lin,col];
			repetido:=repete(matriz,m,n,lin,col,x);
		end;
	end;
if repetido=true then
	writeln('sim')
else
	writeln('nao');

end;	
end.
