program exer49;

function contadigitos(n,d:longint):longint;
var
	auxn:longint;
begin
	contadigitos:=0;
	auxn:=1;
	while (auxn <> 0) do
	begin
		auxn:=n mod 10;
		if (auxn = d) then
			contadigitos:=contadigitos+1;
		n:=n div 10;
	end;
end;

var
	a,b,cont:longint;
	igual:boolean;
begin
	igual:=true;
	cont:=0;
	read(a,b);
	while (igual) and (cont < 9) do
	begin
		cont:=cont+1;
		if (contadigitos(a,cont) <> contadigitos(b,cont)) then
			igual:=false; 
	end;
	
	if (igual) then
		writeln(a,' e permutacao de ',b)
	else
		writeln(a,' nao e permutacao de ',b);
end.

//EXERCICIO 2:
//Um numero A e'dito permutacao de um numero B se os digitos de A formam uma 
//permutacao dos digitos de B.  Ex: 5412434 e' uma permutacao de 4321445, mas 
//nao e' uma permutacao de 4312455.  Considere que o digito zero nao aparece 
//nos numeros.
//(a) Escreva uma funcao chamada 'contadigitos' que recebe um inteiro N e um 
//inteiro D, 0 < D <= 9, e devolve quantas vezes o digito D aparece em N.
//(b) Utilize a funcao 'contadigitos' para escrever um programa que le dois 
//numeros, A e B, e determine se A e' permutacao de B.
