(* 
ENUNCIADO
Fazer um programa em Free Pascal que leia do teclado dois números naturais 0 < n, m ≤ 100. 
Em seguida, leia duas sequências de respectivamente n e m números também naturais, sendo garantidamente m < n.
Seu programa deve determinar quantas vezes a segunda sequência ocorre na primeira.
Exemplo de entrada 1:
7
2
18 23 6 14 6 31 13
12 20
Saı́da esperada:
0
Exemplo de entrada 2:
9
4
18 23 6 14 6 18 23 6 14
18 23 6 14
Saı́da esperada:
2
Exemplo de entrada 3:
30
3
2 4 2 1 6 1 7 2 9 10 2 4 2 1 8 11 12 13 2 7 1 5 6 1 3 2 4 2 4 2
2 4 2
Saı́da esperada:
4
*)

program 5ocorrencias;
const
	max = 100;
type
	vetor = array [1 .. max] of longint;
var
	vn,vm: vetor;
	n,m,quantas:longint;


procedure ler(var vn,vm:vetor; m,n:longint);
var
	cont:longint;
begin
	for cont:=1 to n do
		read(vn[cont]);
	for cont:=1 to m do
		read(vm[cont]);
end;


function ocorrencia(vn,vm:vetor):longint;
var
	cont,cont2,igual,diferente,posi:longint;
begin
	igual:=0;
	posi:=0;
	ocorrencia:=0;

	while (posi<n-m+1) do
	begin
		posi:=posi+1;
		cont:=1;
		if vn[posi] = vm[cont] then
		begin
			cont2:=posi; igual:=1; diferente:=0;
			repeat		
				cont:=cont+1;
				cont2:=cont2+1;
				if vn[cont2]<>vm[cont] then
				begin
					diferente:=1;
					igual:=0;
				end;
			until (diferente = 1)or((cont=m)and(igual=1));
			if igual = 1 then
				ocorrencia:=ocorrencia+1;
		end;
	end;
end;	


begin
	read(n);
	read(m);
	if (n > m)and(n>0)and(m<=max) then
	begin
		ler(vn,vm,m,n);
		quantas:=ocorrencia(vn,vm);
		writeln(quantas);
	end;
end.
