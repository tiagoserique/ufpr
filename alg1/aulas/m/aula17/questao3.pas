program questao3; //aula 17
const
	max = 100;
type
	meuvet = array [1 .. max] of integer;

procedure ler(var vet:meuvet; var x,tam:integer);
var
	i:integer;
begin
	writeln('Tamanho do vetor | elemento | vetor');
	read(tam,x);
	for i:=1 to tam do
		read(vet[i]);
end;

var
	vet:meuvet;
	elem,tam,ind:integer;
	igual:boolean;
begin
	ler(vet,elem,tam);
	igual:=false;
	ind:=0;
	while (ind < tam) and (not igual) do
	begin
		ind:=ind+1;
		if (vet[ind] = elem) then
			igual:=true
	end;
	
	if igual then
		writeln('O elemento ',elem,' esta na posicao ',ind)
	else
		writeln('O elemento ',elem,' nao esta no vetor');
end.
