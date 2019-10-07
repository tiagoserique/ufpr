program exer19;
var
	n,digito,u,d,c:integer;
begin
	read(n);
	digito:=n;
	u:=digito mod 10;
	digito:=digito div 10;
	d:=digito mod 10;
	digito:=digito div 10;
	c:=digito mod 10;	
	digito:= (n*10) + (c + 3*d + 5*u) mod 7;
	writeln(digito);	
end.
