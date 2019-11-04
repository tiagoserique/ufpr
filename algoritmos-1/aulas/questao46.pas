program exer46;

function soma(n:integer):integer;	
begin
	soma:=0;
	while (n <> 0) do
	begin
		soma:=soma + (n mod 10);
		n:= n div 10;
	end;
end;

var
	n,val:integer;
begin
	n:=1;
	while (n <> 0) do
	begin
		read(n);
		if (n <> 0) then
		begin
			val:= soma(n);
			writeln('Soma: ',val);
		end;
	end;	
end.

//EXERCICIO 1:
//Escrever um programa que leia uma sequencia de inteiros positivos, e para 
//cada valor, escreve a soma dos seus digitos.  A sequencia termina quando o 
//valor 0 e' digitado.
