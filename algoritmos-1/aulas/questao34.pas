program exer34;
var
	n,maior:integer;
begin
	maior:=0;
	n:=1;
	while (n <> 0) do
	begin
		read(n);
		if (n > maior) then
			maior:=n;
	end;
	writeln('O maior é ',maior);
end.
//EXERCICIO 5: ler uma sequencia de inteiros terminada com 0 e escrever o maior.
