program exer40;
var
	n,soma,i:integer;
begin
	read(n);
	soma:=0;
	for i:=1 to (n div 2) do
		if (n mod i = 0) then
			soma:=soma+i;
	if (n = soma) then
		writeln('Eh perfeito')
	else
		writeln('Nao eh perfeito');
end.
//EXERCICIO 3:
//Um inteiro positivo N e' perfeito se for igual a soma de seus divisores 
//positivos diferentes de N.  Por exemplo, 6 e' perfeito porque 1+2+3=6 e 
//1,2,3 sao todos os divisores de 6 que sao diferentes de 6.  
//Escreva um programa que recebe como entrada um numero positivo N e escreva 
//"perfeito", caso N seja perfeito, ou "nao perfeito", caso contrario.
