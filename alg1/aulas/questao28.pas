program exer28;
var
	n,fat,cont:integer;
begin
	read(n);
	fat:=1;

	if (n > 0) then
	begin
		cont:=1;
		while (cont <= n) do
		begin
			fat:=fat*cont;
			cont:=cont+1;		
		end;
		writeln(fat);
	end
	else if (n = 0) then
		writeln(fat);
	
end.
