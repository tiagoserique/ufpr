program questao3;
var
	cont,cont2,n:integer;
begin
	read(n);
	cont:=0;
	cont2:=0;
	repeat
		cont:=cont+1;
		if cont mod 2 = 1 then
		begin
			cont2:=cont2+1;
			write(cont,' ');
		end;	
	until cont2 = n;
end.
