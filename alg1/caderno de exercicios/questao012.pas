program questao12;
var
	cont,mdc,rest,divisor, dividendo, a, b :integer;
begin
	cont:=0;

	repeat
		if cont = 0 then
		begin
			read(a,b);
			if (a > b) then
			begin
				divisor:=a;
				dividendo:=b;
			end
			else
			begin
				divisor:=b;
				dividendo:=a;
			end;
			cont:=cont+1;
			mdc:=a;
		end;

		rest :=divisor mod dividendo;	 
		if (rest <> 0) and (rest < mdc) then
			mdc:=rest;
		
		divisor:=dividendo;
		dividendo:=rest;
	until rest = 0;	

	writeln(mdc);
end. 
