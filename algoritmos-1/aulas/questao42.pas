program exer42;
var
	n,auxn,cont,soma,prod,inv:integer;

function potdez(num:integer):integer;
var
	cont:integer;
begin
	potdez:=1;
	cont:=1;
	while (cont < num) do
	begin
		cont:=cont+1;
		potdez:=potdez*10;
	end;
end;

begin
	read(n);
	auxn:=n;
	cont:=0;
	while (auxn <> 0) do
	begin
		auxn:=auxn div 10;
		cont:=cont+1;
	end;
	
	auxn:=n;
	soma:=0;
	while (auxn <> 0) do
	begin
		inv:=auxn mod 10;
		auxn:=auxn div 10;
		prod:=inv*potdez(cont);
		soma:=soma+prod;
		cont:=cont-1;
	end;
	writeln(n,' inverso ',soma);
end.	

//EXERCICIO 5: Faca um programa Pascal que leia um inteiro, calcule o seu 
//inverso (um numero inteiro) e escreva o numero de entrada e seu inverso.
//Exemplo de entrada:
//6323
//Exemplo de saida:
//6323 inverso 3236
