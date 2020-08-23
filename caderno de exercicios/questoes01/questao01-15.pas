program questao015;
var
	n,j,m,cont,cont2:integer;
	congru: array [1 .. 100] of integer;
begin
	read(n,m,j);
	cont2:=0;
	for cont:=1 to n do
		if (cont mod m = j mod m) then
		begin
			cont2:=cont2+1;
			congru[cont2]:=cont;
		end;
	
	if cont2 > 0 then
	begin
		writeln('Sao congruentes: ');
		for cont:=1 to cont2 do
			write(congru[cont],' ');
	end
	else
		writeln('Nao eh congruente');
end.
