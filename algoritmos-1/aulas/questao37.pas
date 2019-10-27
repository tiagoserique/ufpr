program exer37;
var
	x,cont,contfat,cont2,fat,divi,soma:longint;
begin
	read(x);
	cont:=0;
	contfat:=0;
	soma:=0;
	while (cont < 14) do
	begin
		fat:=1;
		if (cont <> 0) then
		begin
			cont2:=0;
			while (cont2 < contfat) do
			begin
				cont2:=cont2+1;
				fat:=fat*cont2;
			end;
		end;
		
		divi:=1;
		if (contfat <> 0) then
		begin
			cont2:=0;
			while (cont2 < contfat) do
			begin
				divi:=divi*x;	
				cont2:=cont2+1;
			end;
		end;
		
		if cont mod 2 = 0 then
			soma:=soma-(divi div fat)
		else
			soma:=soma+(divi div fat);

		cont:=cont+1;
		contfat:=contfat+2;
	end;
	writeln('O valor do cosseno de ',x,' é = ',soma);
end.
//EXERCICIO 8: Faca um programa que leia um inteiro positivo x e calcule 
//o valor do cosseno de x atraves dos 14 primeiros termos da serie abaixo
//coseno(N) = 1/0! - x^2/2! + x^4/4! - x^6/6! + ...
