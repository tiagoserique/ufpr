program questao9;
var
	n,i,j,cont,cont2:integer;
begin
	read(n,i,j);
	cont:=0;
	cont2:=0;
	while cont < n do
	begin
		if  (cont2 mod i = 0) or (cont2 mod j = 0) then 
		begin
			write(cont2,' ');
			cont:=cont+1;
		end;
		cont2:=cont2+1;
	end;
end.
