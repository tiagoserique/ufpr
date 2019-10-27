(* ENUNCIADO
Faça um programa em Free Pascal que leia um número natural 0 < n ≤ 100 e em seguida leia uma sequência de n números inteiros. 
Seu programa deve determinar o valor do subsequência que maximize a soma dos seus elementos.

Exemplo de entrada:
12
5 2 -2 -7 3 14 10 -3 9 -6 4 1
Saı́da esperada para a entrada acima:
33

Observação 1: O valor 33 da saı́da esperada acima, foi obtido pela soma dos valores dos ı́ndices de 5 a 9, isto é, v[5] = 3 
até v[9] = 9.

Observação 2: Idealmente, seu programa deve fazer o menor número possı́vel de somas dos elementos dos vetores, 
embora o FARMA-ALG apenas checa se sua resposta está correta. 
Você consegue fazer um programa que nunca some duas vezes uma sequência que já foi somada antes? 
Teste isso fora do FARMA-ALG.
*)

program 2maximizarsoma;
type
	meuvetor = array [1 .. 100] of integer;
var
	cont,n:integer;
	ele:meuvetor;

procedure soma(n:integer;ele:meuvetor);
var
	aux:meuvetor;
	x,cont,max:integer;
begin
aux:=ele;
max:=0;
	for x:=1 to (n-1) do
	begin
		for cont:=1 to (n-x) do
		begin
			aux[cont]:= aux[cont]+ele[cont+x];
			if aux[cont]>max then
			max:=aux[cont];
		end;
	end;
writeln(max);
end;

begin
	read(n);
	if (n>0) and (n<=100) then
	begin
		for cont:=1 to n do
		read(ele[cont]);
		soma(n,ele);
	end;
	
end.
