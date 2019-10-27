(* ENUNCIADO
Faça um programa em Free Pascal que leia diversas linhas nas quais as linhas ı́mpares contém o tamanho n (0 ≤ n ≤ 100) 
da sequência de números inteiros que deve ser lida na linha subsequente. 
Quando uma linha ı́mpar contiver o valor zero significa que a entrada de dados acabou e seu programa deverá encerrar 
com a impressão de todas as sequências originais e também compactadas pela eliminação de todos os elementos repetidos 
de cada sequência. 
No exemplo abaixo, O significa a sequência original e C a sequência compactada.

Exemplo de entrada:
5
2 4 7 -1 2
3
1 1 1
7
3 4 5 3 7 5 1
0
Saı́da esperada:
O: 2 4 7 -1 2
C: 2 4 7 -1
O: 1 1 1
C: 1
O: 3 4 5 3 7 5 1
C: 3 4 5 7 1
*)

program 1compactacao;
type
	meuvetor = array [1 .. 100] of integer;
	
procedure compacta(nele:integer;ele:meuvetor);
var
	ocor:meuvetor;
	cont,nocor,posoc:integer;
	igual:boolean;
begin
	nocor:=0;
	for cont:=1 to 100 do
	ocor[cont]:=0;

	for cont:=1 to nele do
	begin
		posoc:=1;igual:=false;	
		while (posoc<=nocor) and (not igual) do
		begin
			if ocor[posoc]=ele[cont] then
			igual:=true;
		posoc:=posoc+1;	
		end;
		if not igual then
		begin
			nocor:=nocor+1;
			ocor[nocor]:=ele[cont];
		end;
	end;
	write('C: '); 
	for cont:=1 to nocor do
	write(ocor[cont], ' ');
end;

var
	cont,nele:integer;
	ele:meuvetor;
begin
	repeat
	read(nele);
	if nele <> 0 then
	begin
		for cont:=1 to nele do
		begin
			read(ele[cont]);
		end;
		write('O: ');
		for cont:=1 to nele do
			write(ele[cont],' ');
		writeln(' ');
		compacta(nele,ele);
		writeln(' ');
	end;
	until nele = 0;
end.
