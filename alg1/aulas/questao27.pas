program exer27;
var
	n1,n2,cont,aux,q,r:integer;
begin
	read(n1,n2);
	cont:=1;
	aux:=n1;
	q:=0;
	
	while (cont <= aux) do
	begin
		if (n1 >= n2) then
		begin
			n1:=n1-n2;
			q:=q+1;
		end;
		cont:=cont+1;
	end;
	
	r:=aux-(q*n2);
	writeln('resultado: ',q);
	writeln('resto: ',r);
end.
//5) dados 2 inteiros n1 e n2, calcular o valor da divisao 
//inteira (n1 div n2) e o resto da divisao inteira (n1 mod n2) 
//sem usar div/mod
