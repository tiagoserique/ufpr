program questao014;
var
	n,f1,f2,f3,cont:integer;
begin
	read(n);
	
	f1:=1;
	f2:=1;
	
	for cont:=1 to n-2 do
	begin
		f3:=f1+f2;
		f1:=f2;
		f2:=f3
	end;
	writeln('O valor do ',n,'° termo é: ',f3 );
end.
