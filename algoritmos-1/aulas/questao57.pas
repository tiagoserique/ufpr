program exer3;
var
	vet:array [1 .. 100] of longint;
	i,temp,fim:longint;
begin
	for i:=1 to 100 do
		read(vet[i]);
	
	fim:=100;
	for i:=1 to 50 do
	begin
		temp:=vet[i];
		vet[i]:=vet[fim];
		vet[fim]:=temp;
		fim:=fim-1;
	end;
	
	for i:=1 to 100 do
		write(vet[i],' ');
end.
//EXERCICIO 3:
//Escrever um programa que inverte os elementos de um vetor de no maximo 100 
//inteiros.
