program exer36;
var
	constante,soma,cont,n:integer;
begin	
	constante:=1003;
	soma:=0;
	cont:=0;
	read(n);
	while (cont < n) do
	begin
		cont:=cont+1;
		if (cont mod 2 = 0)and(cont <> 0) then
			soma:=soma-((constante-3)div cont)
		else if (cont mod 2 = 1)and(cont <> 0) then
			soma:=soma+((constante-3)div cont);
	end;
	writeln('A soma é = ',soma);
end.
//EXERCICIO 7: Faca um programa em pascal que leia um inteiro positivo N 
//e escreva a soma dos N primeiros termos da serie:
//1000/1 - 997/2 + 994/3 - 991/4 + ...
