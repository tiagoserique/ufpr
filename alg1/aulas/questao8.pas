program exer8;
var
	x,u,d,c:integer;
begin
	read(x);
	c:=x mod 10;
	x:=x div 10;
	d:=x mod 10;
	x:=x div 10;
	u:=x mod 10;
	
	writeln((c*100)+(d*10)+u);
end.
//EXERCICIO: ler um inteiro de 3 digitos e escreve-lo com os digitos invertidos
