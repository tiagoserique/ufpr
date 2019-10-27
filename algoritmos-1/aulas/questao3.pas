program exer3;
var
	raio,area,circ,pi : real;
begin

	read(raio);
	pi:=3.141592;
	area:=pi*raio*raio;
	circ:=2*pi*raio;
	writeln('Área: ',area:0:10);
	writeln('Circunferência: ',circ:0:10);
end.
//EXERCICIO: ler o raio de um circulo e escrever a sua circunferencia e area.
