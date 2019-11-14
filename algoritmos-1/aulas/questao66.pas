program exer2; //aula18
const
	max = 100;
type
	meuvet = array [1 .. max] of integer;

procedure inserir(var vet:meuvet; var val,tam:integer);
var
	auxv:meuvet;
	posi,i,atual:integer;
	stop:boolean;
begin
	auxv:=vet;
	posi:=0;
	stop:=false;
	while (posi < tam)and(not stop) do
	begin
		posi:=posi+1;
		if (val < vet[posi]) then
		begin
			stop:=true;	
		end;
	end;
	atual:=posi;	
	for i:=posi to tam do
	begin
		atual:=atual+1;
		vet[atual]:=auxv[i];
	end;
	vet[posi]:=val;
	tam:=tam+1;
end;

procedure remover(var vet:meuvet; var val,tam:integer);
var
        auxv:meuvet;
        posi,i,atual:integer;
        stop:boolean;
begin
        auxv:=vet;
        posi:=0;
        stop:=false;
        while (posi < tam)and(not stop) do
        begin
                posi:=posi+1;
                if (val = vet[posi]) then
                begin
                        stop:=true;
                end;
        end;
        atual:=posi;
        for i:=posi+1 to tam do
        begin
                vet[atual]:=auxv[i];
		atual:=atual+1;
        end;
        tam:=tam-1;
end;


procedure imprimir(var vet:meuvet; tam:integer);
var
        i:integer;
begin
        for i:=1 to tam do
                write(vet[i],' ');
        writeln(' ');
end;

procedure ler(var vet:meuvet;var tam:integer);
var
        n:integer;
begin
        n:=1;
        tam:=0;
	writeln('Digite os valores do vetor (a leitura para em 0)');
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
	tam,escolha,val:integer;
begin
	ler(vet,tam);
	escolha:=-1;

	while (escolha <> 3) do
	begin
		writeln('Digite 1 para inserir, 2 para remover e 3 para parar');
		read(escolha);
		if (escolha = 1) then
		begin
			writeln('Digite o valor a ser inserido');
			read(val);
			inserir(vet,val,tam);
			imprimir(vet,tam);
		end
		else if (escolha = 2) then
		begin
                        writeln('Digite o valor a ser retirado');
			read(val);
                        remover(vet,val,tam);
                        imprimir(vet,tam);
		end;	
			
	end;
end.
//Ex 2:
//- insercao / remocao de elemento em vetor ordenado
