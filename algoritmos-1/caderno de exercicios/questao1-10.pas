program questao10;
var
	n,cont,prod:integer;
begin
	read(n);
	cont:=0;
	prod:=1;
	while (cont < n div 2)and(prod <> n) do
	begin
		cont:=cont+1;
		prod:=cont*(cont+1)*(cont+2);
		if prod = n then
			write(cont,' ',cont+1,' ',cont+2,' ');
	end;
end.
