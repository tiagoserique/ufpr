program exer32;
var
	n,soma:integer;
begin
	n:=1;
	soma:=0;
	while (n <> 0) do
	begin
		read(n);
		if (n mod 2 = 0)and(n <> 0) then
			soma:=soma+n;
	end;
	writeln('Soma dos pares = ',soma);
end.
//EXERCICIO 3: ler uma sequencia de inteiros terminada com 0 e escrever 
//a soma dos pares.
