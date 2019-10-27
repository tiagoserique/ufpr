program questao1;
var
	n:integer;
begin
	n:=1;
	while n > 0 do
	begin
		read(n);
		if n > 0 then
			writeln('Quadrado de ',n,' é: ',n*n);
	end;
end.
