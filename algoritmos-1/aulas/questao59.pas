program exer1;
const
	max = 100;
type
	vet = array [1 .. max] of integer;


procedure ler(var vetor:vet);
var
	i:integer;
begin
	for i:=1 to max do
		read(vetor[i]);
end;


var
	vet1,vet2:vet;
	i,media1,media2,maior,menor,igual,soma1,soma2:integer;
begin
	ler(vet1);
	ler(vet2);
	soma1:=0;
	soma2:=0;
	for i:=1 to max do
		soma1:=soma1+vet1[i];
	media1:=soma1 div 100;
	
	for i:=1 to max do
		soma2:=soma2+vet2[i];
	media2:=soma2 div 100;
	
	writeln('Soma: ',soma1+soma2);
	
	maior:=0; 
	menor:=0; 
	igual:=0;
	for i:=1 to max do
	begin
		if (vet1[i] > media1) then
			maior:=maior+1
		else if (vet1[i] = media1) then
			igual:=igual+1
		else
			menor:=menor+1;
	end;
	writeln('Seq. 1 - Maior: ',maior,', Menor: ',menor,', Igual: ',igual);
	
	maior:=0;
	menor:=0;
	igual:=0;	
        for i:=1 to max do
	begin
                if (vet2[i] > media2) then
                        maior:=maior+1
                else if (vet2[i] = media2) then
                        igual:=igual+1 
                else 
                        menor:=menor+1;
	end;
        writeln('Seq. 2 - Maior: ',maior,', Menor: ',menor,', Igual: ',igual);
end.
//EXERCICIO 1:
//Ler 2 sequencias de inteiros de tamanho 100.  Calcular e escrever:
//- a soma dos vetores
//- quantos valores em cada sequencia sÃ£o maiores, iguais e menores que a media.
