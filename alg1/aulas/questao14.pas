program exer14;
var
	a,b,c,d,e:integer;
begin
	read(a,b,c,d,e);
	
	a:=a+b;
	c:=c-d;
	if (c <> 0) then
	begin
		e:= (a div c)*e;
		writeln(e);
	end
	else
		writeln('divisao por zero');
end.
//EXERCICIO: ler 5 valores reais (a,b,c,d,e), calcular o valor da expressao
//  a+b
//  ---e
//  c-d
//Se o denominador for zero, o programa deve escrever 'divisao por zero'.
