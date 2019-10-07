program exer16;
var
	val:real;
	f1,f2,f3:integer;
begin
	read(val,f1,f2,f3);

	if (val < f1) then
		writeln('faixa 1')
	else if (val >= f1) and (val < f2) then
		writeln('faixa 2')
	else if (val >= f2) and (val < f3) then
		writeln('faixa 3')
	else if (val >= f3) then
		writeln('faixa 4');
end.
