program exer47;

function soma(n:integer):integer;
begin
        soma:=0;
        while (n <> 0) do
        begin
                soma:=soma + (n mod 10);
                n:= n div 10;
        end;
end;

function amigos(n,m:integer):boolean;
var
	auxn,auxm:integer;
begin
	amigos:=false;
	auxn:=n*n;
	auxm:=m*m;
	
	auxn:=soma(auxn);
	auxm:=soma(auxm);	
	
	if (auxn = m) and (auxm = n) then
		amigos:=true;
end;

var
	n,m:integer;	
begin
	read(n,m);
	if amigos(n,m) then
		writeln(n,' e ',m,' sao amigos quadraticos')
	else
		writeln(n,' e ',m,' nao sao amigos quadraticos');
end.
//EXERCICIO 2:
//Escrever uma funcao que determina se um par de inteiros sao amigos quadraticos.
//N e M sao amigos quadraticos se: N = soma dos de digitos de M^2 e M = soma dos 
//digitos de N^2. Por exemplo, 13 e 16 sao amigos quadraticos porque:
//13^2 = 169 e 1+6+9=16 e
//16^2 = 256 e 2+5+6=13

