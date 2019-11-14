program exer2;
var
	vet:array [0 .. 9] of longint;
	num,i:longint;
begin
	read(num);
	for i:=0 to 9 do
		vet[i]:=0;
	
	while (num <> 0) do
	begin
		i:=num mod 10;
		num:=num div 10;
		vet[i]:=vet[i]+1;
	end;
	
	for i:=0 to 9 do
	begin
		if (vet[i] > 0) then
			writeln(vet[i],' digitos ',i);
	end;
end.

//EXERCICIO 2:
//Escrever uma funcao que dado um inteiro, retorna a quantidade de digitos [0-9] 
//existem no numero.  P. ex., 364366 contem:
//- 2 digitos '3'
//- 1 digito '4'
//- 3 digitos '6'

//*** usar um vetor com indices [0-9] para fazer a contagem
