program exer6;
const
	max = 100;
type
	mat = array [1 .. max,1 .. max] of integer;


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
	mat1,mat2:mat;
	auxi,auxj,i,j,k,l,tam1,tam2:integer;
	flag,submat:boolean;	
begin
	ler(mat1,tam1);
	ler(mat2,tam2);
	submat:=false;
	i:=0;
	while (i < tam1) and (not submat) do
	begin
		i:=i+1;
		j:=0;
		while (j < tam1) and (not submat) do
		begin
			j:=j+1;
			if (mat1[i,j] = mat2[1,1]) then
			begin
				auxi:=i-1; auxj:=j-1;
				k:=0; l:=0;
				flag:=true;
				while (k < tam2) and (flag) do
				begin
					k:=k+1;
					auxi:=auxi+1;
					while (l < tam2) and (flag) do
					begin
						l:=l+1;
						auxj:=auxj+1;
						if (mat1[auxi,auxj] <> mat2[k,l]) 
						then
							flag:=false;
					end;
				end;
				if (flag) then
					submat:=flag;
			end;
		end;
	end;
	
	writeln(i,' ',j);
end.
//Ex.
//- Dadas 2 matrizes, m1 e m2, verificar se a matriz m2 ocorre dentro da matriz 
//m1.  Em caso afirmativo, escrever a linha e coluna do elemento superior 
//esquerdo onde m2 foi encontrado.  No exemplo abaixo, o programa deve escrever: 
//2 3
//m1:
// 2  4  67  77
// 3  5  55  88
// 7  6   1  34
// 7  5   4  32
// 8  8   8   8

//m2:
// 55 88
//  1 34
