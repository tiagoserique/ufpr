program exer25;
var
	cont,n:integer;
begin
	read(n);
	cont:=0;

	while (cont < n) do
	begin
		cont:=cont+1;
		writeln(cont*cont);
	end;
end.
