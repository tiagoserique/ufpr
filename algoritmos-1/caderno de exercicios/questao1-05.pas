program questao5;
var
	cont,maior,n:integer;
begin
	cont:=0;
	maior:=0;
	while cont < 31 do
	begin
		cont:=cont+1;
		read(n);
		if n > maior then
		maior:=n;
	end;
	writeln('Maior: ',maior);
end.
