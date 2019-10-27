program exer16;
var
	val:real;
	f1,f2,f3:integer;
begin
	read(val,f1,f2,f3);

	if (val < f1) then
		writeln('faixa 1')
	else if (val >= f1) and (val < f2) then
		writeln('faixa 2')
	else if (val >= f2) and (val < f3) then
		writeln('faixa 3')
	else if (val >= f3) then
		writeln('faixa 4');
end.
//EXERCICIO: Escreva um programa que leia um valor real num, seguido de 3 
//inteiros f1, f2, f3.  O programa deve escrever:
//'faixa 1' se o valor num for menor que f1;
//'faixa 2' se o numero estiver no intervalo [f1, f2)
//'faixa 3' se o numero estiver no intervalo [f2, f3)
//'faixa 4' se o numero for maior ou igual a f3 
