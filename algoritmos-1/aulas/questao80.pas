program exer4;
const
	max = 100;
type
	mat = array [1 .. max,1 .. max] of real;

procedure divide(var matriz:mat; tam,j:integer; elem:real);
var
	i:integer;
begin
	for i:=1 to tam do
		matriz[j,i]:=matriz[j,i]/elem;
end;

function maior(var matriz:mat; tam,j:integer):real;
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
	tam,i,j:integer;
	elem:real;
begin
	read(tam);
	for i:=1 to tam do
		for j:=1 to tam do
			read(matriz[i,j]);
	for j:=1 to tam do
	begin
		elem:=maior(matriz,tam,j);
		divide(matriz,tam,j,elem);
	end;
	
	for i:=1 to tam do
	begin
		for j:=1 to tam do
			write(matriz[i,j]:0:4,' ');
		writeln(' ');
	end;
end.
//Ex 4.
//- escrever um procedimento que divide cada elemento de uma linha pelo maior
//elemento da coluna correspondente
