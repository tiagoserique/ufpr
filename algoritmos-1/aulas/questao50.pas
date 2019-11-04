program exer50;

function encaixa(menor,maior:longint):boolean;
var
	tammen,tammai,i,j,cont,cont2,resme,resma:longint;
	men,mai: array [1 .. 100] of longint;	
begin
	cont:=0;
	while (menor <> 0) do
	begin
		cont:=cont+1;
		resme:=menor mod 10;
		menor:=menor div 10;
		men[cont]:=resme;
	end;
	tammen:=cont;
	
        cont:=0;
        while (maior <> 0) do
        begin
                cont:=cont+1;
                resma:=maior mod 10;
                maior:=maior div 10;
                mai[cont]:=resma;
        end;
	tammai:=cont;

	encaixa:=false;
	i:=1;
	j:=1;
	while (not encaixa)and(j <= tammai) do
	begin
		if (men[i] = mai[j]) then
		begin
			encaixa:=true;
			cont:=i;
			cont2:=j;
			while (encaixa) and (cont < tammen) do
			begin
				cont:=cont+1;
				cont2:=cont2+1;	
				if (men[cont] <> mai[cont2]) then
					encaixa:=false;
			end;

			if (not encaixa) then
				j:=j+1;
		end
		else
			j:=j+1;	
	end;	
end;


var
	n,m,maior,menor:longint;
begin
	read(n,m);
	if (n > m) then
	begin
		maior:=n;
		menor:=m;
	end
	else
	begin
		maior:=m;
		menor:=n;
	end;
	
	if (encaixa(menor,maior)) then
		writeln(menor,' eh segmento de ',maior)
	else
		writeln('nenhum eh segmento do outro');
end.

//EXERCICIO 3:
//(a) Escreva uma funcao chamada 'encaixa', que recebe dois numeros inteiros A 
//e B e verifica se B corresponde aos ultimos digitos de A.  Ex: 567890 encaixa 
//em 890, mas 2457 nao encaixa em 245.
//(b) Usando a funcao 'encaixa', faca um programa que le 2 numeros, N e M,  e 
//verifica se o menor deles e' segmento do outro.
//Ex:
//N = 567890 e M = 678  ==> M e' segmento de N
//N = 1243   e M = 2212435 ==> N e' segmento de M
//N = 235    e M = 2456  ==> nenhum e' segmento do outro
