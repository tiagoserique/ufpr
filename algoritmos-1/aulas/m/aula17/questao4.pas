program questao4; //aula17
const
	max = 100;
type
	meuvet = array [1 .. max] of integer;

procedure ler(var vet:meuvet; var tam,x:integer);
var
	i: integer;
begin
	writeln('Tamanho do vetor | elemento | vetor');
	read(tam,x);
	for i:=1 to tam do
		read(vet[i]);
end;

var
	vet:meuvet;
	tam,elem,supe,infe,meio,ind:integer;
	achei:boolean;
begin
	ler(vet,tam,elem);
	
	achei:=false;
	supe:=tam;
	infe:=1;
	while (infe <= supe) and (not achei) do
	begin
		meio:= (supe+infe) div 2;
		
		if (elem = vet[meio]) then
		begin
			achei:=true;
			ind:=meio;
		end		
		else if (elem > vet[meio]) then
			infe:= meio+1
		else
			supe:=meio-1;
	end;
	
	if achei then
		writeln('O elemento ',elem,' esta na posicao ',ind)
	else
		writeln('O elemento ',elem,' nao esta no vetor');
end.
