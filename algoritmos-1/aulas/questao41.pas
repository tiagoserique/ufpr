program exer41;
var
	n,auxn,prod,y:integer;
begin
	read(n);
	auxn:=n;
	prod:=1;
	while (auxn <> 0) do
	begin
		y:=auxn mod 10;
		auxn:=auxn div 10;
		prod:=prod*y;
	end;
	writeln(prod);
end.

//EXERCICIO 4: Faca um programa Pascal que leia um inteiro e escreva o produto
// dos seus digitos.
//Exemplo de entrada:
//6323
//Exemplo de saida (que corresponde a 6*3*2*3):
//108
