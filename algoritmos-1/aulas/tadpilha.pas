unit tadpilha;

interface

const
	max = 1000;
type
	Tpilha = record
		item: array [1 .. max] of integer;
		top:integer;
		end;

function pilhaCheia(var p:Tpilha):boolean;
//Pilha cheia

function pilhaVazia(var p:Tpilha):boolean;
//Pilha vazia

function pop(var p:Tpilha):integer;
//Desempilha

procedure push(var p:Tpilha; val:integer);
//Empilha

procedure criaPilha(var p:Tpilha);
//Inicializa pilha

implementation


function pilhaCheia(var p:Tpilha):boolean;
begin
	pilhaCheia:=p.top = max;
end;

function pilhaVazia(var p:Tpilha):boolean;
begin
        pilhaVazia:= p.top = 0;
end;


function pop(var p:Tpilha):integer;
begin
	if (not pilhaVazia(p)) then
	begin
		pop:=p.item[p.top];
		p.top:=p.top-1;
	end
	else
		writeln('ERRO - Pilha vazia');
end;


procedure push(var p:Tpilha; val:integer);
begin
	if (p.top <> max) then
	begin
		p.top:=p.top+1;
		p.item[p.top]:=val;
	end
	else
		writeln('ERRO - pilha cheia');
end;


procedure criaPilha(var p:Tpilha);
begin
	p.top:=0;
end;

end.
