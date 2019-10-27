(* 
ENUNCIADO
Um número é considerado um palíndromo (ou capicua) quando aplicada uma operação de 
reversão o novo número equivale ao original.
Por exemplo, o número 1001 invertido é 1001, logo o mesmo é um palíndromo. 
O número 4003 invertido é 3004, o que não o torna um palíndromo.

Fazer um programa em Free Pascal que leia um número inteiro positivo do teclado e 
verifique se a sua sequência de dígitos é exatamente a mesma, independente da ordem de leitura. 
Caso a sequência seja a mesma, imprimir "Sim eh palindromo". Caso não seja, imprimir "Nao eh palindromo".

Dica: Um modo de inverter um número inteiro é aplicar operações sucessivas por 10, 
utilizando tanto o quociente da divisão inteira quanto o módulo (ou resto) da divisão.

Exemplo de entrada 1:
12321
Saída esperada para a entrada acima:
Sim eh palindromo

Exemplo de entrada 2:
31527
Saída esperada para a entrada acima:
Nao eh palindromo
*)

program 4palindromo;
var
	n,auxn,cont,cont2:longint;
	flag:boolean;
	num: array [1 .. 100] of longint;

begin
	read(n);
	auxn:=n;
	cont:=0;
	repeat
		cont:=cont+1;
		num[cont]:= auxn mod 10;
		auxn:=auxn div 10;
	until auxn = 0;
	
	flag:=true;
	cont2:=0;
	auxn:=cont+1;
	while (cont2 < cont) and (flag) do
	begin
		cont2:=cont2+1;
		auxn:=auxn-1;
		if num[cont2] <> num[auxn] then
			flag:=false;
	end;
	
	if flag then
		writeln('Eh palindrome')
	else
		writeln('Nao eh palindrome');
end.
