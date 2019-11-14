program exer1; //aula18
const
	max = 100;
type
	meuvet = array [1 .. max] of integer;

procedure inverte(var vet:meuvet; tam:integer);
var
	i,j:integer;
	auxv:meuvet;
begin
	auxv:=vet;
	j:=0;

	for i:=tam downto 1 do
	begin
		j:=j+1;
		vet[j]:=auxv[i];
	end;
end;

procedure ler(var vet:meuvet;var tam:integer);
var
	n:integer;
begin
	n:=1;
	tam:=0;
	while (n <> 0) do
	begin
		read(n);
		if n <> 0 then
		begin
			tam:=tam+1;
			vet[tam]:=n;
		end;
	end;
end;

var 
	vet:meuvet;
	tam,i:integer;
begin
	ler(vet,tam);
	inverte(vet,tam);
	for i:=1 to tam do
		write(vet[i],' ');
	writeln(' ');
end.
//Ex 1:
//Dado um vetor em ordem crescente ou decrescente, inverter a ordem:
//crescente -> decrescente ou vice-versa.
