program questao020;
var
	cont,x,y:integer;
	raiz:real;
begin
	for cont:=1000 to 9999 do
	begin
		raiz:=sqrt(cont);
		x:= cont mod 100;
		y:=cont div 100;
		if (raiz = x + y) then
			write(cont,' ');
	end;
	writeln(' ');
end.
