program questao018;
var
	a,b,c,cat,cat1,cat2,hip: real;
begin
	read(a,b,c);
	
	if (a > b) and (a > c) then
	begin
		hip:=a;
		cat1:=b;
		cat2:=c;
	end
	else if (b > a) and (b > c) then
	begin
		hip:=b;
		cat1:=a;
		cat2:=c;
	end
	else if (c > b) and (c > a) then
	begin
		hip:=c;
		cat1:=a;
		cat2:=b;
	end;

	hip:= exp(2*ln(hip));
	cat:= exp(2*ln(cat1)) + exp(2*ln(cat2));
	
	if hip = cat then
		writeln('Sao lados de um triangulo retangulo')
	else
		writeln('Nao sao lados de um triangulo retangulo');
end.
