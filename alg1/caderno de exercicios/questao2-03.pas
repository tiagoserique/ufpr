program questao028;
var
	m,n,x,y,maior,expr:integer;
begin
	read(m,n);
	x:=0;
	maior:=0;
	while (x <= m) do
	begin
		y:=0;
		while (y <= n) do
		begin
			expr:=(x*y)-(x*x)+y;
			if (expr >= maior) then
				maior:=expr;
			y:=y+1;
		end;
		x:=x+1;
	end;
	writeln('Maior valor: ',maior);
end.
