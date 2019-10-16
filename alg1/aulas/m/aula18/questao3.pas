program questao3; //aula18
const
	max = 100;
type
	meuvet = array [1 .. max] of integer;

procedure organiza(var vet:meuvet; var ind,tam,cont:integer);
var
	aux:integer;	
begin
	aux:=vet[cont];
	vet[cont]:=vet[ind];
	vet[ind]:=aux;
end;


function menor(var vet:meuvet; tam,cont:integer):integer;
var
	i,j:integer;
begin
	i:=1+cont;
	j:=i+1;
	while (j <= tam) do
	begin
		if (vet[i] > vet[j]) then
		begin
			i:=j;
			j:=i+1;
		end
		else
			j:=j+1;
	end;
	menor:=i;
end;

procedure imprimir(var vet:meuvet; tam:integer);
var
	i:integer;
begin
	for i:=1 to tam do
		write(vet[i],' ');
	writeln(' ');
end;

procedure ler(var vet:meuvet; var tam:integer);
var
	n:integer;
begin
	tam:=0;
	n:=1;
	writeln('Digite os valores do vetor (a leitura para em 0)');
	while (n <> 0) do
	begin
		read(n);
		if (n <> 0) then
		begin
			tam:=tam+1;
			vet[tam]:=n;
		end;
	end;
end;

var
	vet:meuvet;
	ind,tam,auxt,cont:integer;
begin
	ler(vet,tam);
	
	auxt:=tam;
	cont:=0;
	while (cont <> tam) do
	begin
		ind:=menor(vet,auxt,cont);
		cont:=cont+1;
		organiza(vet,ind,auxt,cont);
	end;
	imprimir(vet,tam);
end.
//Ex 3:
//ordenacao de vetor pelo metodo da bolha
