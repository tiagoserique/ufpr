(* 
ENUNCIADO
Uma matriz inteira A n×n é considerada uma matriz de permutação se em cada linha e em cada coluna
houver n - 1 elementos nulos e um único elemento igual a 1.

Um exemplo de Matriz de permutação:

//Devia ter uma imagem aqui

Um exemplo de Matriz que não é de permutação:

//Devia ter uma imagem aqui

Faça um programa em Free Pascal que leia um inteiro positivo n, sendo 1 ≤ m, n ≤ 100, e uma matriz
inteira A n×n . O programa deve imprimir “sim” caso a matriz A seja de permutação, caso contrário deve
imprimir “nao”.
Nos casos de teste cada elemento x da matriz A é definido por 0 ≤ x ≤ 100.

Exemplo de entrada 1:
3
1 0 0
0 1 0
0 0 1
Saı́da esperada para o exemplo acima:
sim

Exemplo de entrada 2:
3
1 0 0
1 0 0
0 1 0
Saı́da esperada para o exemplo acima:
nao
*)

program 3permutacaoemmatriz;
const
	max = 100;
type
	matriz = array [1 .. max,1 .. max] of longint;


function verlin(mat:matriz; n,l:longint):boolean;
var
                cont,soma:longint;
begin
        verlin:=true;
        cont:=0;
        soma:=0;
        while (cont<n) and (verlin=true) do
        begin
                cont:=cont+1;
                soma:=soma+mat[l,cont];
        end;
        if soma <> 1 then
                verlin:=false;
end;



function vercol(mat:matriz; n,c:longint):boolean;
var
		cont,soma:longint;
begin
	vercol:=true;
	cont:=0;
	soma:=0;
	while (cont<n) and (vercol=true) do
	begin
		cont:=cont+1;	
		soma:=soma+mat[cont,c];		
	end;
	if soma <> 1 then
		vercol:=false;
end;


function vernum(mat:matriz; n:longint):boolean;
var
	lin,col:longint;	
begin
	vernum:=false;
	lin:=0;
	while (lin<n) and (vernum=false) do
	begin
		lin:=lin+1;
		col:=0;
		while (col<n) and (vernum=false) do
		begin
			col:=col+1;
			if (mat[lin,col]<>0)and(mat[lin,col]<>1) then
				vernum:=true;	
		end;
	end;		
			
end;

procedure ler(var mat:matriz; n:longint);
var
	l,c:longint;
begin
	for l:=1 to n do
		for c:=1 to n do
			read(mat[l,c]);
end;

var
	n,lin,col:longint;
	flag1,flag2,difer:boolean;
	mat:matriz;
begin
	read(n);
	ler(mat,n);
	difer:=vernum(mat,n);
	
	if (difer = true) then
		writeln('nao')
	else
	begin
		col:=0;
		repeat
			col:=col+1;
			flag1:=vercol(mat,n,col);
		until (col=n) or (flag1=false);
			
		lin:=0;
		repeat
                        lin:=lin+1;
                        flag2:=verlin(mat,n,lin);
                until (lin=n) or (flag2=false);

		if (flag1=false) or (flag2=false) then
			writeln('nao')
		else
			writeln('sim');
	end;
end.
