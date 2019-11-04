program exer44;
var
	n,i,pri:integer;
begin
	n:=1;
	while (n <> 0) do
	begin
		read(n);
		if (n <> 0) then
		begin
			pri:=0;
			for i:=1 to n do 
				if (n mod i = 0) then
					pri:=pri+1;
			if (pri = 2) then 
				writeln('Eh primo')
			else
				writeln('Nao eh primo');
		end;
	end;
end.

//EXERCICIO 1:
//Escreva um programa que leia uma sequencia de numeros naturais e para cada um, 
//escrever se ele e' primo.  A sequencia termina quando o numero zero for 
//digitado.
