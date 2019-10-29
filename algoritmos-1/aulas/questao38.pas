program exer38;
var
	n1,n2,cont,mdc,menor:integer;
begin
	read(n1,n2);
	if (n1 < n2) then
		menor:=n1
	else
		menor:=n2;

	for cont:=1 to menor do
	begin
		if (n1 mod cont = 0) and (n2 mod cont = 0) then	
			mdc:=cont;
	end;
	writeln(mdc);
end.
//EXERCICIO 1:
//Ler 2 inteiros (n1, n2) maiores ou iguais a 1 e calcular o mdc(n1,n2).
