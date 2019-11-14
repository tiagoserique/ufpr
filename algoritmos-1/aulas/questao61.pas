program questao1; //aula 17
const
	max = 100;

type 
	meuvet = array [1 .. max] of char;

function comp(seq1,seq2:meuvet; tam1,tam2:integer):integer;
var
	cont,cont2,auxc:integer;
	flag:boolean;
begin
        cont:=0;
        cont2:=1;
        comp:=0;
        while (cont < tam1-tam2+1) do
        begin
                cont:=cont+1;
                if (seq1[cont] = seq2[cont2]) then
                begin
                        auxc:=cont;
                        flag:=true;
                        while (cont2 < tam2) and (flag) do
                        begin
                                cont2:=cont2+1;
                                auxc:=auxc+1;
                                if (seq1[auxc] <> seq2[cont2]) then
                                        flag:=false;
                        end;
                        if (flag = true) then
                                comp:=comp+1;
                        cont2:=1;
                end;
        end;
end;


procedure ler(var vet:meuvet; var i:integer);
var
	n:char;
begin
	i:=0;
	n:='a';
	while (n <> '.') do
	begin 
		i:=i+1;
		read(n);
		if (n <> '.') then
			vet[i]:=n;
	end;
	i:=i-1;
end;


var
	seq1,seq2:meuvet;
	repet,tam1,tam2:integer;
begin 
	tam1:=0;
	tam2:=0;
	
	ler(seq1,tam1);	
	ler(seq2,tam2);
	
	repet:=comp(seq1,seq2,tam1,tam2);	
	
	writeln('O padrão aparece ',repet, ' vezes');
end.
