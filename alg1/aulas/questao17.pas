program exer17;
var
	a,b,c:integer;
begin
	read(a,b,c);

	if (a < b + c) and (b < a + c) and (c < a + b) then
	begin
		if (a = b) and (b = c) then
			writeln('equilatero')
		else if (a = b) or (b = c) or (a = c) then
			writeln('isosceles')
		else
			writeln('escaleno');
	end
	else
		writeln('invalido');
end.
//EXERCICIO:
//Dados 3 valores A, B e C, escreva um programa em Pascal para verificar 
//se estes valores podem ser valores dos lados de um triangulo, se e' um 
//triangulo ESCALENO, um triangulo EQUILATERO ou um triangulo ISOSCELES. 
//Caso nao sejam validos, imprimir: INVALIDO.
//Exemplos:
//5
//5
//5
//EQUILATERO
//7
//7
//5
//ISOSCELES
//3
//4
//5
//ESCALENO
//5
//4
//15
//INVALIDO
