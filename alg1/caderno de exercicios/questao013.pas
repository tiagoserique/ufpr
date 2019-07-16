program questao013;
var
	n,cont,cont2,soma: integer;
	divi: array [1 .. 100] of integer;
begin
	read(n);
	cont:=0;
	cont2:=0;
	while (cont < n div 2) do
	begin
		cont:=cont+1;
		if (n mod cont = 0) then
		begin
			cont2:=cont2+1;
			divi[cont2]:=cont;
		end;
	end;
	soma:=0;
	for cont:=1 to cont2 do
		soma:=soma+divi[cont];

	if soma = n then
		writeln('Eh perfeito')
	else
		writeln('Nao eh nao');
end.
