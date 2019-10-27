program questao027;
var
	n,i,cont,cont2: integer;
	ehcat: boolean;
begin
	read(n);
	cont:=1;
	
	while (cont <= n) do
	begin
		ehcat:=false;
		cont2:=0;
		while (cont2 < cont) and (ehcat = false) do
		begin
			cont2:=cont2+1;
			i:=0;
			while i < cont do
			begin
				i:=i+1;
				if (cont*cont = cont2*cont2 + i*i) then
					ehcat:=true;
			end;
		end;
		
		if ehcat then
			writeln('Esse é comprimento de hipotenusa: ',cont);
		cont:=cont+1;
	end;
end.
