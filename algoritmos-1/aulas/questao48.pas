program exer48;

function mdc(x,y:integer):integer;
var
	i,menor:integer;
begin
	if (x > y) then
		menor:=y
	else
		menor:=x;
	for i:=1 to menor do
		if (x mod i = 0) and (y mod i = 0) then
			mdc:=i;
end;

var
	n,m:integer;
begin
	n:=1; m:=1;
	while (n <> 0) and (m <> 0) do
	begin
		read(n,m);
		if (n <> 0) and (m <> 0) then
			writeln('O mdc é: ',mdc(n,m));
	end;
end.
//EXERCICIO 1:
//Escreva uma funcao que calcula o maximo divisor comum (mdc) de 2 numeros 
//naturais.  Utilize esta funcao para calcular o mdc de uma sequencia de 
//numeros naturais.  A sequencia termina quando o numero 0 for digitado.

