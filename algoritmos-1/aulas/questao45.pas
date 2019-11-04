program exer45;
var
	n,soma,cont,i:integer;
begin
	read(n);
	cont:=0;
	while (cont < n) do
	begin
		cont:=cont+1;
		soma:=0;
		for i:=1 to (cont div 2) do
			if (cont mod i = 0) then
				soma:=soma+i;
		
		if (cont = soma) then
			writeln(cont,' Eh perfeito')
		else
			writeln(cont,' Nao eh perfeito');
	end;
end. 

//EXERCICIO 2:
//Escreva um programa que leia um numero natural N e escreva todos os numeros 
//perfeitos entre 1 e N.  Um numero e' perfeito se for igual a soma dos seus 
//divisores.  Por exemplo, 6 e' perfeito porque 6=1+2+3.
