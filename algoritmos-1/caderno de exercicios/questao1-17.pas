program questao017;
var
	cont,n,auxn,quoc,rest,x: integer;
	bin,y,cont2:real;
	term: array [1 .. 100] of integer;
begin
	read(n);
	auxn:=n;
	cont:=0;
	quoc:=1;
	rest:=1;
	while (quoc <> 0) or (rest <> 0) do 
	begin
		cont:=cont+1;
		rest:=auxn mod 2;
		quoc:=auxn div 2;
		auxn:=quoc;
		term[cont]:=rest;
	end;
	
	cont2:=0;
	bin:=0;
	while cont2 < cont do
	begin
		auxn:=auxn+1;
		x:=term[auxn];
		y:=exp(cont2 * ln (10));
		bin:=bin+x*y;
		cont2:=cont2+1;
	end;
	
	writeln(n,' = ',bin:0:0);
end.
