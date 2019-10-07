program exer13;
var
	n1,n2,n3:integer;
begin
	read(n1,n2,n3);
	if (n1<=n2)and(n2<=n3) then
		writeln('ordenado crescente')
	else if (n1>=n2)and(n2>=n3) then
		writeln('ordenado decrescente')
	else
		writeln('desordenado');
end.
