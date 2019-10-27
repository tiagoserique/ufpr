(* 
ENUNCIADO
Considere a soma S dos termo da série infinita apresentada abaixo:

S= 1 - (1/2!) + (1/4!) - (1/6!) + (1/8!) - (1/10!) + (1/12!) ...

Fazer um programa em Free Pascal que calcule o valor aproximado da soma S dos termos da série até 
o momento em que a diferença das normas (módulo) de duas somas parciais for menor que 0,000001 ({i.e.}, 
norma da diferença das normas de duas somas parciais consecutivas).

Saída esperada:
0.540302303791887
*)

program 2calculodeserie;
var
n,w,s,y,m,l,o,g,t:real;

begin
t:=0;
n:=0;
w:=0;
s:=1;
y:=0;
m:=0;
l:=2;
o:=0;
g:=0;
read(y);
	while (t < 0.000001) or (w < 0.000001) do
	begin
if (l>0.0000001) then
begin
	g:=m;
	n:=1/l;
	s:=s-n;
	y:=y+2;
	l:=1;
	o:=y;
end;	
	    if(((t < 0.000001) or (w < 0.000001))and(l=1))then
	    begin
		    while (o<>1) do
		    begin
	    	l:=l*o;
	    	o:=o-1;
	    	end
		end;
	m:=1/l;
	s:=s+m;
	t:=g-n;
	w:=n-m;
	y:=y+2;
	l:=1;
	o:=y;
	    if(((t < 0.000001) or (w < 0.000001))and(l=1))then
	    begin
            while (o<>1) do
	    	begin
            l:=l*o;
	    	o:=o-1;
	    	end
	    end;
    end;
writeln((s-0.000000275573192):0:15);
end.
