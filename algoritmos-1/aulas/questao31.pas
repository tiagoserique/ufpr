program exer31;
var
	n,cont,divisores:integer;
begin
	read(n);
	cont:=0;
	divisores:=0;
	if (n <> 1) then
		while (cont < n) do
		begin
			cont:=cont+1;
			if (n mod cont = 0) then
				divisores:=divisores+1;
		end;

	if (divisores = 2) then
		writeln(n,' eh primo')
	else
		writeln(n,' nao eh primo');
end.
//EXERCICIO 2: Dado um numero inteiro N > 1, determinar se N e' primo
