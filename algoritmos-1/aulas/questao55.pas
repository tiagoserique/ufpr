program exer1;
var
	i:integer;
	vet:array [1 .. 20] of integer;
begin
	for i:=1 to 20 do
		read(vet[i]);
	
	for i:=20 downto 1 do
		writeln(vet[i],' ');
end.
//EXERCICIO 1:
//Escrever um programa que le uma sequencia de 20 valores e escreve a sequencia 
//invertida
