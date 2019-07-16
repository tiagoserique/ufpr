program questao8;
var
	fat,n:integer;
begin
	read(n);
	fat:=1;
	while n <> 1 do
	begin
		fat:=fat*n;
		n:=n-1;	
	end;
	write('Fatorial: ',fat);
end.
