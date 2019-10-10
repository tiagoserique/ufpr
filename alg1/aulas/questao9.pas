program exer9;
var
	a1,razao,cont:integer;
begin
	writeln('Primeiro termo e razão: ');
	read(a1,razao);
	cont:=0;
	while (cont < 5) do
	begin
		write(a1,' ');
		a1:=a1*razao;
		cont:=cont+1;
	end;
	writeln(' ');
end.
//EXERCICIO: ler o termo inicial (a1) e a razao 
//de uma progressao geometrica e escrever o valor 
//dos 5 primeiros termos. Ex: se a1=2 e a razao=3, 
//os 5 primeiros termos sao: 2 6 18 54 162
