program exer21;
var
	n,cont,d4,dz2,dz1,soma,somadez:integer;
begin
	read(n);
	cont:=0;
	soma:=0;
	d4:=n div 1000;
   d5:=n div 10000;

	if (d4 > 0) and (d5 = 0) then
	begin
		dz1:= n mod 100;
		dz2:= n div 100;
		somadez:= (dz1+dz2)*(dz1+dz2);
		if (somadez = n) then
		begin
			while (cont < 4) do
			begin
				soma:=soma+ (n mod 10);
				n:=n div 10;
				cont:=cont+1;
			end;
			somadez:=dz1+dz2;
			dz1:=somadez mod 10;
			dz2:=somadez div 10;
			somadez:=dz1+dz2;
			if (somadez = soma) then
				writeln('eh especial')
			else
				writeln('nao eh especial');
		end
		else
			writeln('nao eh especial');
	end
	else
		writeln('ERRO');
end.
//EXERCICIO
//Um numero natural com 4 digitos n e' dito ser especial se: (i) n e' igual 
//ao quadrado do valor obtido pela soma das 'dezenas' que compoem n (SomaDez) 
//e (ii) se a soma dos digitos de n e' igual a soma dos digitos de SomaDez. 
//Por exemplo, 2025 e' especial porque (i) suas 'dezenas' sao 20 e 25 e 
//(20 + 25)^2 = (45)^2 = 2025 e (ii) 2 + 0 + 2 + 5 = 4 + 5. Por outro lado, 
//1021 nao e' especial porque (i) suas 'dezenas' sao 10 e 21 e 
//(10 + 21)^2 = (31)^2 = 961 <> 1021.  Escreva um programa Pascal que leia um 
//numero natural n de 4 digitos e verifique se n e' um numero especial. 
//O programa deve mostrar uma mensagem informando o resultado da verificacao. 
//Se o numero informado nao tiver 4 digitos, o programa deve apresentar uma mensagem 
//de erro.
