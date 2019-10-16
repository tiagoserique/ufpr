program exer30;
var
	soma,n:integer;
begin
	soma:=0;
	n:=1;
	while (n <> 0) do
	begin
		read(n);
		if n <> 0 then
			soma:=soma+n;
	end;
	writeln('Soma = ',soma);
end.
//EXERCICIO 1: ler uma sequencia de inteiros terminada com 0 e escrever sua soma.
