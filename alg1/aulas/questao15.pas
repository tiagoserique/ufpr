program exer15;
var
	x,y:integer;
begin
	read(x,y);

	if (x > 0) and (y > 0) then
		writeln('primeiro quadrante')
	else if (x > 0) and (y < 0) then
		writeln('quarto quadrante')
	else if (x < 0) and (y < 0) then
		writeln('terceiro quadrante')
	else if (x < 0) and (y > 0) then
		writeln('segundo quadrante')
	else if (x=0) and (y <> 0) then
		writeln('eixo y')
	else if (x <> 0) and (y = 0) then
		writeln('eixo x')
	else
		writeln('origem')
end.
