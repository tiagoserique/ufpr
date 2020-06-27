program questao019;
var
	cont,cont2,aux: integer;
	auxnum,num : array [1 .. 4] of integer;
begin
	for cont:=1 to 3 do
		read(num[cont]);
	
	auxnum:=num;
	cont:=0;

	while (cont < 3) do
	begin
		cont:=cont+1;
		cont2:=cont;

		while  (cont2 < 3) do
		begin
			cont2:=cont2+1;

			if num[cont] > auxnum[cont2] then
			begin
				aux:= num[cont];
				num[cont]:=auxnum[cont2];
				num[cont2]:=aux;
				auxnum:=num;
			end;
		end;
	end;
	
	writeln(' ');
	writeln('Ordem crescente: ');		
	for cont:=1 to 3 do
		write(num[cont], ' ');
end.
