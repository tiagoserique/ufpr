program questao023;
var
	n,auxn,cont,cont2:longint;
	flag:boolean;
	num: array [1 .. 100] of longint;

begin
	read(n);
	auxn:=n;
	cont:=0;
	repeat
		cont:=cont+1;
		num[cont]:= auxn mod 10;
		auxn:=auxn div 10;
	until auxn = 0;
	
	flag:=true;
	cont2:=0;
	auxn:=cont+1;
	while (cont2 < cont) and (flag) do
	begin
		cont2:=cont2+1;
		auxn:=auxn-1;
		if num[cont2] <> num[auxn] then
			flag:=false;
	end;
	
	if flag then
		writeln('Eh palindrome')
	else
		writeln('Nao eh palindrome');
end.
