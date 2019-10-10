program exer2;
var
	hor1, hor2, min1, min2: integer;
begin
	writeln('Horas e Minutos: ');
	read(hor1, min1);
	writeln('Horas e Minutos: ');
	read(hor2, min2);
	
	hor1:=hor1+hor2;
	min1:=min1+min2;
	
	if (min1 > 60) then
	begin
		hor1:=hor1+(min1 div 60);
		min1:=min1 mod 60;
	end;	

        if (hor1 >= 24) then
                hor1:=hor1-24;

	writeln('Horas: ',hor1,' - Minutos: ',min1);
end.
//EXERCICIO (casa): ler dois horarios (hora e minuto) e fazer a sua soma
//             10h50m + 11h43m = 22h33m
