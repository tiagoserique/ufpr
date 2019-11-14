program exer4;
var
	temp,cont,i,n,j:longint;
	vet:array [1 .. 100] of longint;
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
	
	i:=1;
	j:=i+1;
	while (i < cont-1) do
	begin
		if (vet[i] < vet[j]) then
		begin
			i:=j;
			j:=i+1;
		end
		else
			j:=j+1;
	end;
	
	temp:=vet[i];
	vet[i]:=vet[cont];
	vet[cont]:=temp;

	for i:=1 to cont do
		write(vet[i],' ');
end.
//EXERCICIO 4:
//Escrever um programa que le uma sequencia de numeros terminada com zero 
//(a sequencia tem no maximo 100 valores) e troca o elemento com maior valor com 
//o ultimo elemento do vetor.  O programa deve escrever o vetor resultante.

