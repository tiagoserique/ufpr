program exer1;

procedure digiesq(var n,qtd:longint);
var
	aux:longint;
begin
	qtd:=0;
	aux:=n;
	while (aux <> 0) do
	begin
		n:=aux mod 10;
		aux:=aux div 10;
		qtd:=qtd+1;
	end;
end;

var
	n,qtd:longint;
begin
	n:=1;
	while (n <> 0) do
	begin
		read(n);
		if (n <> 0)  then
		begin
			digiesq(n,qtd);
			writeln('Quantidade: ',qtd,'- Digito mais a esquerda: ',n);
		end;
	end;
end.
//EXERCICIO 1:
//(a) Escrever um procedimento que recebe um inteiro positivo N e retorna o 
//numero de digitos de N e o seu digito mais a esquerda.
//(b) Escrever um programa que leia uma sequencia de inteiros positivos e para 
//cada um, escreva sua quantidade de digitos e seu digito mais a esquerda. A 
//sequencia termina quando o valor zero for digitado.
