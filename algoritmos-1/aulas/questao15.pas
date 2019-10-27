program exer15;
var
	x,y:integer;
begin
	read(x,y);

	if (x > 0) and (y > 0) then
		writeln('primeiro quadrante')
	else if (x > 0) and (y < 0) then
		writeln('quarto quadrante')
	else if (x < 0) and (y < 0) then
		writeln('terceiro quadrante')
	else if (x < 0) and (y > 0) then
		writeln('segundo quadrante')
	else if (x=0) and (y <> 0) then
		writeln('eixo y')
	else if (x <> 0) and (y = 0) then
		writeln('eixo x')
	else
		writeln('origem')
end.
//EXERCICIO: Escreva um programa para ler as coordenadas (X,Y ) de um 
//ponto no sistema cartesiano e escrever o quadrante ao qual o ponto pertence. 
//Caso o ponto nÃ£o pertenca a nenhum quandrante, escrever se ele estÃ¡ sobre 
//o eixo X, eixo Y ou na origem.
