(* ENUNCIADO
Seguindo o racíocinio do exercício sobre quadrado mágico. Crie um programa em Free Pascal que leia um inteiro n que representa o tamanho do lado de uma matriz A e uma matriz A(n x n) que representa o quadrado e imprima quantas matrizes não triviais (isto é, não pode ser a matriz que é constituida por apenas um elemento, uma linha e uma coluna) formam um quadrado mágico a partir da matriz fornecida.
Exemplo de entrada:
6
2 7 6 6 7 2
9 5 1 1 5 9
4 3 8 8 3 4
4 9 2 2 9 4
3 5 7 7 5 3
8 1 6 6 1 8
Saída esperada para a entrada acima:
5
*)

program 3quadradomagico2;
const
	max = 100;
type
	Tquadrado = record
		mat:array [1 .. max, 1 .. max] of longint;
		dim,x,y:longint;
		lin,col,dia:boolean;
		soma: array [1 .. max] of longint;
		end;



////////////////////////
procedure inicializa(var matriz:Tquadrado);
var
        i: longint;
begin
        for i:=1 to max do
                matriz.soma[i]:=0;
end;
////////////////////////
procedure verdia(var matriz:Tquadrado; auxtam1,auxtam2,tam:longint);
var
        i,j,dia1,dia2: longint;
begin
        inicializa(matriz);
	dia1:=0; dia2:=0; i:=0;

	while (i<tam) do
	begin
		dia1:=dia1+matriz.mat[matriz.x+i,matriz.y+i];
		i:=i+1;
	end;	

	for i:=matriz.x to auxtam2 do
	begin
		j:=auxtam2+1-i;
		dia2:=dia2+matriz.mat[i,j];
	end;

	while (matriz.dia = true) and (i<tam-1) do
	begin
		i:=i+1;
		if dia1 <> dia2 then
			matriz.dia:=false;
	end;
end;
////////////////////////
procedure vercol(var matriz:Tquadrado; auxtam1,auxtam2,tam:longint);
var
        i,j,k: longint;
begin
        inicializa(matriz);
        k:=0;
                for j:=matriz.y to auxtam2 do
                  begin
                        k:=k+1;
                        for i:=matriz.x to auxtam1 do
                                matriz.soma[k]:= matriz.soma[k]+matriz.mat[i,j];
                   end;
        j:=0;
        while (matriz.col = true) and (j<k-1) do
        begin
		j:=j+1;
                if matriz.soma[j] <> matriz.soma[j+1] then
                        matriz.col:=false;
             end;
end;
////////////////////////
procedure verlin(var matriz:Tquadrado; auxtam1,auxtam2, tam:longint);
var
	i,j,k: longint; 
begin
	inicializa(matriz);
	k:=0;
	for i:=matriz.x to auxtam1 do
	begin
		k:=k+1;
		for j:=matriz.y to auxtam2 do
			matriz.soma[k]:= matriz.soma[k] + matriz.mat[i,j];
	end;

	j:=0;
	while (matriz.lin = true) and (j<k-1) do
	begin
		j:=j+1;
		if matriz.soma[j] <> matriz.soma[j+1] then
			matriz.lin:=false;
	end;
end;
////////////////////////
procedure ler(var matriz:Tquadrado);
var
	i,j: longint;
begin
	for i:=1 to matriz.dim do
		for j:=1 to matriz.dim do
			read(matriz.mat[i,j]);
end;	
/////////////////////
var
	matriz:Tquadrado;
	soma,desloc,auxtam1,auxtam2,tam,x,y: longint;
begin
	read(matriz.dim);
	ler(matriz);
	soma:=0;

	for tam:=2 to matriz.dim do
	begin
		desloc:= (matriz.dim-tam)+1;
		for x:=1 to desloc do
		begin
			matriz.x:= x;
			auxtam1:=matriz.x+tam-1;
			for y:=1 to desloc do
			begin
				matriz.dia:=true; matriz.col:=true; matriz.lin:=true;
				matriz.y:= y;
				auxtam2:=y+tam-1;
				verlin(matriz,auxtam1,auxtam2,tam);
				vercol(matriz,auxtam1,auxtam2,tam);
				verdia(matriz,auxtam1,auxtam2,tam);

				if ((matriz.dia=true)and(matriz.lin=true)and(matriz.col=true)) then
					soma:=soma+1;
			
			end;
		end;
	end;

	writeln(soma);
end.
