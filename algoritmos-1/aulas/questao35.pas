program exer35;
var
	maior1,maior2,n:integer;
begin
	maior1:=0;
	maior2:=0;
	n:=1;
	while (n <> 0) do
	begin
		read(n);
		
		if (n > maior1) then
			maior1:=n;

		if (n > maior2)and(n <> maior1) then
			maior2:=n;
	end;
	writeln('Maior = ',maior1,', Segundo maior = ',maior2);
end.
//EXERCICIO 6: ler uma sequencia de inteiros terminada com 0 e 
//escrever os dois maiores.
