program exer20;
var
	bin,dec,cont,exp:integer;
begin
	read(bin);
	cont:=0;
	dec:=0;
	exp:=1;
	while (cont <= 4) do
	begin
		dec:= dec+(bin mod 10)*exp;
		bin:=bin div 10;
		exp:=2*exp;
		cont:=cont+1;
	end;
	writeln(dec);
end.
