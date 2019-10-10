program exer19;
var
	n,digito,u,d,c:integer;
begin
	read(n);
	digito:=n;
	u:=digito mod 10;
	digito:=digito div 10;
	d:=digito mod 10;
	digito:=digito div 10;
	c:=digito mod 10;	
	digito:= (n*10) + (c + 3*d + 5*u) mod 7;
	writeln(digito);	
end.
//EXERCICIO
//Dado um numero de tres digitos, construir outro numero de quatro 
//digitos com a seguinte regra: a) os tres primeiros digitos, contados 
//da esquerda para a direita, sao iguais aos do numero dado; b) o quarto 
//digito e' um digito de controle calculado da seguinte forma: primeiro 
//digito + 3*segundo digito + 5*terceiro digito; o digito de controle e' 
//igual ao resto da divisao dessa soma por 7.
//Exemplo:
//354
//3543
