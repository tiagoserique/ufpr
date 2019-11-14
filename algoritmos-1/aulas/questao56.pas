program exer2;
var
	vet:array [1 .. 100] of longint;
	cont,n,i:longint;
begin
	cont:=0;
	n:=1;
	while (n <> 0) and (cont <> 100) do
	begin
		cont:=cont+1;
		read(n);
		if (n <> 0) then
			vet[cont]:=n;
	end;
	
	for i:=cont downto 1 do
		writeln(vet[i],' ');
end.
//EXERCICIO 2:
//Escrever um programa que le uma sequencia de numeros terminada com zero (a 
//sequencia tem no maximo 100 valores) e escreve a sequencia na ordem invertida.
