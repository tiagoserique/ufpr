program questao021;
var
	cont,n,seg :integer;
	seq: array [1 .. 100] of integer;
	
begin
	read(n);
	seg:=0;
	for cont:=1 to n do
	begin
		read(seq[cont]);
			if seq[cont] <> seq[cont-1] then
				seg:=seg+1;
	end;
	writeln('Existem ',seg,' segmentos iguais');
	
end.
