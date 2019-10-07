program exer17;
var
	a,b,c:integer;
begin
	read(a,b,c);

	if (a < b + c) and (b < a + c) and (c < a + b) then
	begin
		if (a = b) and (b = c) then
			writeln('equilatero')
		else if (a = b) or (b = c) or (a = c) then
			writeln('isosceles')
		else
			writeln('escaleno');
	end
	else
		writeln('invalido');
end.
