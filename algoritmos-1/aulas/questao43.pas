program questao43;
var
	n,convert,cont,cont2,auxn,exp,elem:integer;
begin
	read(n);
	auxn:=n;
	cont:=0;
	convert:=0;
	while (auxn <> 0) do
	begin
		cont2:=0;
		exp:=1;
		while (cont2 <> cont) do
		begin
			cont2:=cont2+1;
			exp:=exp*2;
		end;
		elem:= auxn mod 10;
		auxn:=auxn div 10;
		convert:=convert+exp*elem;
		cont:=cont+1;
	end;
	writeln(convert);	
end.
//EXERCICIO 6: ler um inteiro que representa um numero binario e escrever o 
//valor decimal correspondente.
//Exemplo de entrada:
//1100
//Exemplo de saida:
//12
