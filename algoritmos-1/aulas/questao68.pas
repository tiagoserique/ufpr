program questao68;
var
	n,m,i,j,nlin,ncol:integer;
	mat:array [1 .. 100,1 .. 100] of integer;
begin
	read(n,m);
	for i:=1 to n do
		for j:=1 to n do
			read(mat[i,j]);
	i:=1;
	nlin:=0;
	while (i <= n) do
	begin
		j:=1;
		while (mat[i,j] = 0) and (j < m) do
		begin
			j:=j+1;
		end;
		i:=i+1;
		if (j = m) then
			nlin:=nlin+1;
	end;
	
	i:=1;
	ncol:=0;
        while (i <= n) do
        begin
                j:=1;
                while (mat[j,i] = 0) and (j < m) do
                begin
                        j:=j+1;
                end;
                i:=i+1;
                if (i = m) then
                        ncol:=ncol+1;
        end;	
	
	writeln('Num. linhas: ',nlin,' - num. colunas: ',ncol);
end.
//4. Dada uma matriz A(n×m) imprimir o n´umero de linhas e o n´umero de colunas
//nulas da matriz. Exemplo: a matriz abaixo tem duas linhas e uma coluna nulas.
//0 0 0 0
//1 0 2 2
//4 0 5 6
//0 0 0 0
