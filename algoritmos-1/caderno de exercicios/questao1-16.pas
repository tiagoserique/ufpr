program questao016;
const
	base = 2;
var
	n,auxn,cont,x: longint;
	soma,y,cont2:real;
	term: array [1 .. 100] of longint;
begin
	read(n);
	auxn:=n;
	cont:=0;
	soma:=0;
	repeat
		cont:=cont+1;	
		term[cont]:= auxn mod 10;
		auxn:=auxn div 10;
	until auxn * 1 = 0;
	
	cont2:=0;
	while (cont2 < cont) do
	begin
		auxn:=auxn+1;
		x:=term[auxn];
		y:= exp(cont2*ln(base));
		soma:=soma+x*y;
		cont2:=cont2+1;
	end;	
	writeln(n,' = ',soma:0:0);
end.
