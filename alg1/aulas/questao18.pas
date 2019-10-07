program exer18;
var
	media,n1,n2:real;
begin
	read(n1,n2);
	media := (n1 + n2)/2;
	
	if (media >= 7) then
		writeln('aprovado')
	else if (media < 3) then
		writeln('reprovado')
	else
		writeln('exame');
end.
