program exer33;
var
	n,soma:integer;	
begin
	n:=1;
	soma:=0;
	while (n <> 0) do
	begin
		read(n);
		if (n <> 0)and(n mod 3 = 0)and(n mod 7 <> 0) then
			soma:=soma+n;
	end;
	writeln('A soma é = ',soma);
end.
//EXERCICIO 4: Faca um programa Pascal que leia uma sequencia de inteiros terminada 
//com zero e escreva a soma dos inteiros digitados que satisfacam a seguinte 
//condicao: o numero deve ser divisivel por 3 e nao pode ser divisivel por 7. 
//Exemplo de entrada:
//5
//3
//7
//14
//21
//9
//0
//Exemplo de saida:
//12
