program exer9;
var
	a1,razao,cont:integer;
begin
	writeln('Primeiro termo e razão: ');
	read(a1,razao);
	cont:=0;
	while (cont < 5) do
	begin
		write(a1,' ');
		a1:=a1*razao;
		cont:=cont+1;
	end;
	writeln(' ');
end.
