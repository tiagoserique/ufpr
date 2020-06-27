program questao029;
var
	n,soma,cont,i:integer;
	flag:boolean;
begin
	read(n);
	soma:=0;
	for i:=1 to n do
	begin
		read(n);
		flag:=true;
		cont:=1;
		while (cont < n div 2) and (flag) do
		begin
			cont:=cont+1;
			if (n mod cont = 0) then
				flag:=false;
		end;	
		if (flag) and (n <> 1) then
			soma:=soma+n;
	end;
	writeln('Soma dos primos: ',soma);
end.
