program exer22;
var
	n,d4,d3,cont,prod,soma:integer;
begin
	read(n);
	d4:=n div 1000;
	d3:=n div 100;
	cont:=0; soma:=0; prod:=1;

	if (d3 <> 0) and (d4 = 0) then
	begin
		while (cont < 3) do
		begin
			soma:=soma+(n mod 10);
			prod:=prod*(n mod 10);
			n:=n div 10;
			cont:=cont+1;
		end;
		
		if (soma mod 2 = 0) then
			writeln(soma)
		else
			writeln(prod);
	end
	else
		writeln('ERRO');
end.
//EXERCICIO
//Faca um programa em Pascal que que receba como entrada um numero 
//inteiro positivo N de exatamente tres digitos. Se a soma de seus 
//digitos for par, imprima o valor da soma, se a soma for impar 
//imprima o valor do produto dos tres digitos.  Se o usuario nao 
//informar um inteiro positivo de 3 digitos, o programa deve exibir 
//uma mensagem de erro.
