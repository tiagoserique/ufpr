program questao024;
const
	max = 100;
type
	meuvet = array [1 .. max] of longint;


function divi_org(num:longint; var vet:meuvet):longint;
var
	cont,cont1,cont2:longint;
	auxvet:meuvet;
begin
	cont:=0;
	repeat
		cont:=cont+1;
		vet[cont]:= num mod 10;
		num:= num div 10;
	until num = 0;
	
	divi_org:=cont;
	auxvet:=vet;
	cont2:=0;

	for cont1:=cont downto 1 do
	begin
		cont2:=cont2+1;
		vet[cont2]:=auxvet[cont1];
	end;	
end;


var
	p,q,cont,digi_p,digi_q,i,auxcont:longint;
	flag:boolean;
	pvet,qvet: meuvet;
begin
	read(p,q);
	
	if q >= p then
	begin
		digi_p:=divi_org(p,pvet);
		digi_q:=divi_org(q,qvet);
		
		i:=1;
		cont:=0;
		flag:=false;

		while (cont < digi_q)and(not flag) do
		begin
			cont:=cont+1;
			if pvet[i] = qvet[cont] then
			begin
				auxcont:=cont;
				flag:=true;
				
				while (i < digi_p) and (flag) do 
				begin
					i:=i+1;
					auxcont:=auxcont+1;
					
					if pvet[i] <> qvet[auxcont] then
					begin
						flag:=false;
						i:=i-1;
					end;
				end;
			end;
			
		end;
	end;

	if flag then
		writeln(p,' eh subnumero de ',q)
	else
		writeln(p,' nao eh subnumero de ',q);
end.
