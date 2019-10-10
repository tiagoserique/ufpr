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
//EXERCICIO: ler 3 inteiros (n1, n2, n3) e escrever:
//   'ordenado crescente' se n1 <= n2 <= n3
//   'ordenado decrescente' se n1 >= n2 >= n3
//   'desordenado', caso contrario
