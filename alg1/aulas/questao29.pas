program exer29;
var
	soma,fat,cont,cont2,n:real;
begin
	read(n);
	soma:=0; cont:=0;
	while (cont < n) do
	begin
		cont:=cont+1;
		fat:=1; cont2:=0;
		while (cont2 < cont) do
		begin
			cont2:=cont2+1;
			fat:=fat*cont2;
		end;
		soma:=soma+(cont/fat);
	end;
	writeln(soma:0:10);
end.
