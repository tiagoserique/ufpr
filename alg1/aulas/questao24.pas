program exer24;
var
	cont:integer;
begin
	cont:=0;
	while (cont < 100) do
	begin
		cont:=cont+1;
		if cont mod 2 = 0 then
			writeln(cont);
	end;
end.
//2) escrever os numeros pares de 1 a 100
