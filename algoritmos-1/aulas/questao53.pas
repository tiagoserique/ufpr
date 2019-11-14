program exer2;
var
	i,mdc,n1,d1,n2,d2,n3,d3,menor:integer;
begin
	read(n1,d1);
	read(n2,d2);
	
	n3:=n1*d2+n2*d1;
	d3:=d1*d2;
	
	if (n3 > d3) then
		menor:=d3
	else
		menor:=n3;
	
	for i:=1 to menor do
		if (n3 mod i = 0) and (d3 mod i = 0) then
			mdc:=i;
	
	writeln(n3 div mdc,'/',d3 div mdc);
end.
//EXERCICIO 2:
//Escrever um programa que leia 2 numeros fracionarios e escrever a sua soma 
//simplificada.  Por exemplo:  2/5 + 8/20 = 80/100 = 4/5
