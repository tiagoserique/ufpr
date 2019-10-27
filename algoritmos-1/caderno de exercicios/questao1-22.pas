program questao022;
const
	max = 100;
var
	aux,cont,cont2,numseg,n:integer;
	auxseg,seg,seq : array [1 .. max] of integer;
begin
	for cont:=1 to max do
		seg[cont]:=0;

	read(n);
	numseg:=1;

	for cont:=1 to n do
	begin
		read(seq[cont]);
		
		if seq[cont] > seq[cont-1] then
			seg[numseg]:=seg[numseg]+1
		else if seq[cont] < seq[cont-1] then
		begin
			numseg:=numseg+1;
			seg[numseg]:=seg[numseg]+1;
		end;
	end;
	
	auxseg:=seg;
	cont:=0;
	
	while (cont < numseg) do
	begin
		cont:=cont+1;
		cont2:=cont;

		while (cont2<numseg) do
		begin
			cont2:=cont2+1;

			if seg[cont] > auxseg[cont2] then
			begin
				aux:=seg[cont];
				seg[cont]:=auxseg[cont2];
				seg[cont2]:=aux;
				auxseg:=seg;
			end;
		end;
	end;
	writeln('Tamanho de segmento crescente máximo: ',seg[numseg]);
end.
