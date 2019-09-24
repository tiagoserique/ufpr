program questao030;
var
	a,i,m,n,cont,cont2,auxc,aux,soma:integer;
	vet: array [1 .. 100] of integer;
	flag: boolean;
begin
	read(m);
	for i:=1 to m do
	begin
		n:=i;
		cont:=0;
		cont2:=0;
		while (cont < n) do
		begin
			cont:=cont+1;
			if (cont mod 2 = 1) then
			begin
				cont2:=cont2+1;
				vet[cont2]:= cont;
			end;
		end;
		
		aux:=n;
		cont:=1;
		flag:=false;
		while (not flag) do
		begin
			soma:=0;
			auxc:=cont;
			while (auxc < aux) do
			begin
				soma:=soma+vet[aux];
				auxc:=auxc+1;	
			end;
			
			if n*n*n = soma then
				flag:=true
			else
			begin
				aux:=aux+1;
				cont:=cont+1;
			end;
		end;
		write('Esses sao os numeros impares: ');
		for a:=cont to aux do
			write(vet[a],' ');
		writeln(' ');
	end;
end.
