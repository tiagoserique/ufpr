program exer14;
var
	a,b,c,d,e:integer;
begin
	read(a,b,c,d,e);
	
	a:=a+b;
	c:=c-d;
	if (c <> 0) then
	begin
		e:= (a div c)*e;
		writeln(e);
	end
	else
		writeln('divisao por zero');
end.
