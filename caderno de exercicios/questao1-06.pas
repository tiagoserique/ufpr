program questao6;
var
	n,x,maior,menor,cont:integer;
begin
	cont:=0;
	maior:=0;
	menor:=100;
	read(n);
	while cont < n do
	begin
		read(x);
		cont:=cont+1;
		if x > maior then
			maior:=x;
		if x < menor then
			menor:=x;
	end;
	writeln('Maior: ',maior);
	writeln('Menor: ',menor);
end.
