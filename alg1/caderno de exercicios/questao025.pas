program questao024;
var
	a,b,total,soma,termo,i:integer;
begin
	writeln('Digite m par de números: ');
	read(a,b);
	writeln('Digitos: ',a,' ',b);
	total:=0;
	soma:=0;
	
	while (a <> 0) do
	begin
		total:=total+1;
		termo:=1;
		for i:=1 to b do
			termo:=termo*a;
		writeln('Resposta: ',termo);
		soma :=soma+termo;
		writeln('Soma =',soma);
		writeln('Digite um par de numeros: ');
		read(a,b);
		writeln('Digitos: ',a,' ',b);
	end;
	writeln('Total de pares: ',total);
end.
