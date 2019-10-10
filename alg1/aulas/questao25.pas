program exer25;
var
	cont,n:integer;
begin
	read(n);
	cont:=0;

	while (cont < n) do
	begin
		cont:=cont+1;
		writeln(cont*cont);
	end;
end.
//3) dado um valor inteiro N, escrever 1^2 2^2 3^2 4^2 ... N^2
