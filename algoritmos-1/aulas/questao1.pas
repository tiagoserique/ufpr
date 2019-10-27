program exer1;
var
	seg, min, hor :integer;
begin
	read(seg);
	min := seg div 60;
	hor := min div 60;
	min := min mod 60;
	seg:=seg mod 60;
	
	writeln('Horas: ',hor,' Minutos: ',min,' Segundos: ',seg);		
end.
//EXERCICIO: ler um inteiro que representa uma quantidade de segundos e
//transformar para horas, minutos e segundo
