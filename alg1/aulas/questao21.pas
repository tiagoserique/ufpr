program exer21;
var
	n,cont,d4,dz2,dz1,soma,somadez:integer;
begin
	read(n);
	cont:=0;
	soma:=0;
	d4:=n div 1000;
   d5:=n div 10000;

	if (d4 > 0) and (d5 = 0) then
	begin
		dz1:= n mod 100;
		dz2:= n div 100;
		somadez:= (dz1+dz2)*(dz1+dz2);
		if (somadez = n) then
		begin
			while (cont < 4) do
			begin
				soma:=soma+ (n mod 10);
				n:=n div 10;
				cont:=cont+1;
			end;
			somadez:=dz1+dz2;
			dz1:=somadez mod 10;
			dz2:=somadez div 10;
			somadez:=dz1+dz2;
			if (somadez = soma) then
				writeln('eh especial')
			else
				writeln('nao eh especial');
		end
		else
			writeln('nao eh especial');
	end
	else
		writeln('ERRO');
end.
