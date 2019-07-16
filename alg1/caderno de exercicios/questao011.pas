program questao11;
var
	p,cont,primo:integer;
begin
	read(p);
	cont:=0;
	primo:=1;
	while (cont < p div 2) and (primo <> 0) do
	begin
		cont:=cont+1;
		if cont <> 1 then
			primo:=p mod cont;
	end;
	if (primo = 0)or(p = 1) then
		writeln('Nao eh primo')
	else
		writeln('Eh primo');
end.
