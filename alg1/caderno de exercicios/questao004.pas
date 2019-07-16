program questao4;
var
	x,n:integer;
begin
	read(x);
	read(n);
	if n > 0 then
		write(x,'^',n,'=',exp(n*ln(x)):0:0);
end.
