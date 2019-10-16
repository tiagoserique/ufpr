program questao2; //aula17
const
	max = 100;
type
	meuvet = array [1 .. max] of integer;

procedure organiza(var vet:meuvet; var ind,tam:integer);
var
	aux:integer;	
begin
	aux:=vet[tam];
	vet[tam]:=vet[ind];
	vet[ind]:=aux;
	tam:=tam-1;
end;


function maior(var vet:meuvet; tam:integer):integer;
var
	i,j:integer;
begin
	i:=1;
	j:=i+1;
	while (j <= tam) do
	begin
		if (vet[i] < vet[j]) then
		begin
			i:=j;
			j:=i+1;
		end
		else
			j:=j+1;
	end;
	maior:=i;
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
	i:integer;
begin
	read(tam);
	for i:=1 to tam do
		read(vet[i]);
end;

var
	vet:meuvet;
	ind,tam,auxt:integer;
begin
	ler(vet,tam);
	
	auxt:=tam;
	while (auxt <> 1) do
	begin
		ind:=maior(vet,auxt);
		organiza(vet,ind,auxt);
	end;
	imprimir(vet,tam);
end.
