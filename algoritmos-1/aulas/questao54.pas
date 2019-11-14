program exer3;

function bissexto(ano:integer):boolean;
begin
	bissexto:=false;
	if (ano mod 4 = 0) and (ano mod 100 <> 0) then
		bissexto:=true;
end;


procedure diaseguinte(var dia,mes,ano:integer);
begin
	
	if (dia = 28) and (mes = 2) and (bissexto(ano)) then
	begin
		dia:=dia+1;
	end
	else if ((dia = 28) and (mes = 2) and (not bissexto(ano))) or ((dia = 29) 
	and (mes = 2) and (bissexto(ano))) then
	begin
		dia:=1;
		mes:=mes+1;
	end
	else if (dia = 29) and (mes = 2) and (not bissexto(ano)) then
		dia:=-1
	else if (dia = 31) and (((mes mod 2 = 1) and (mes <= 7)) or ((mes mod 2 = 0)
	and (mes >= 8) and (mes < 12))) then
	begin
		dia:=1;
		mes:=mes+1;
	end
	else if (dia = 31) and (mes = 12) then
	begin
		dia:=1;
		mes:=1;
		ano:=ano+1;
	end
	else if (dia = 30) and (((mes mod 2 = 0) and (mes < 7)) or ((mes mod 2 = 1)
	and ((mes = 9) or (mes = 11)))) then
	begin
		dia:=1;
		mes:=mes+1;
	end
	else
		dia:=dia+1;
end;

var
	n,cont,dia,mes,ano:integer;
begin
	read(n);
	cont:=0;
	while (cont < n) do
	begin
		cont:=cont+1;
		writeln(' ');
		writeln('Dia | Mês | Ano');
		read(dia,mes,ano);
		diaseguinte(dia,mes,ano);
		if (dia > 0) then
			writeln('Dia: ',dia,' - Mes: ',mes,' - Ano: ',ano)
		else
			writeln('Nao eh ano bissexto, coloque uma data valida');
	end;
end.
//EXERCICIO 3:
//(a) Escreva uma funcao que recebe como parametro um inteiro positivo 'ano' e 
//devolve 'true' se o ano for bissexto e 'false', caso contrario.  Um ano e' 
//bissexto se for divisivel por 4 e nao for divisivel por 100.
//(b) Escreva um procedimento que receba como parametros 3 inteiros (dia, mes, ano)
// e modifica esses inteiros para que eles contenham o dia seguinte.
//(c) Escreva um programa que leia um inteiro positivo N e uma sequencia de N 
//datas e, para cada uma, escreva o dia seguinte.
