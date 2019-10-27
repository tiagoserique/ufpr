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
//6) calcular o fatorial de um numero >= zero
//  0! = 1   1!=1  2!=2*1  3!=3*2*1  4!=4*3*2*1 ...
