program questao7;
var
	n,cont,soma,x:integer;
begin
	read(n);
	cont:=0;
	soma:=0;
	while cont < n do
	begin
		cont:=cont+1;
		read(x);
		if x mod 2 = 0 then
			soma:=soma+x;
	end;
	writeln('A soma dos pares é: ',soma);
end.
