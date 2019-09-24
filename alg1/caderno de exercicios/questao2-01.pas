program questao026;
var
	n,soma,b,cont:integer;
begin
	read(n);
	cont:=0;
	b:=0;
	soma:=0;
	
	while (cont < n) do
	begin
		repeat
			if (b mod 2 = 0) then
				soma:=soma+b;
			read(b);
		until b = 0;

		writeln(soma);
		soma:=0;
		cont:=cont+1;
	end;
end.
