program exer10;
var
	n:integer;
begin
	read(n);
	if (n>=1) and (n<=100) then
		writeln('dentro do intervalo')
	else
		writeln('fora do intervalo');
end.
//EXERCICIO: ler um inteiro n e escrever 'dentro do 
//intervalo' se 1 <= n <= 100 e 'fora do intervalo' caso contrario.
